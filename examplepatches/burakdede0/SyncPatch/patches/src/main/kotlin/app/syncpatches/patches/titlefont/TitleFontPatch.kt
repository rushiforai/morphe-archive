package app.syncpatches.patches.titlefont

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.syncpatches.patches.shared.Constants
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Replaces every hardcoded typeface manager (`Lt7/r0;`) call so that the affected
 * views follow the title font of the currently active post view mode
 * (card / small card / smaller card / compact / list / slide) instead of the
 * stock hardcoded Product Sans / Roboto.
 *
 * Each replacement swaps a single `invoke-static` instruction 1:1 with
 * `TitleFontFix.titleTypeface()`, which resolves the typeface dynamically at
 * runtime. The extension is merged into the app before this patch executes.
 */

private const val TYPEFACE_MANAGER_CLASS = "Lt7/r0;"

/**
 * smali for replacing `invoke-static {reg}, Lt7/r0;->d(I)Landroid/graphics/Typeface;`
 */
private const val TITLE_TYPEFACE_CALL =
    "invoke-static {}, ${Constants.TITLE_FONT_EXTENSION_CLASS}->titleTypeface()Landroid/graphics/Typeface;"

/**
 * smali for replacing a hardcoded font id const (SubredditHolder case).
 */
private const val TITLE_FONT_ID_CALL =
    "invoke-static {}, ${Constants.TITLE_FONT_EXTENSION_CLASS}->titleFontId()I"

/**
 * Replaces every call to `Lt7/r0;->[methodName](...)` in all methods of
 * [fingerprint]'s class with [replacement], and asserts that the expected
 * number of calls is found and replaced so that a mismatching app version
 * fails loudly instead of silently patching partially.
 */
private context(patchContext: BytecodePatchContext)
fun replaceTypefaceManagerCalls(
    fingerprint: Fingerprint,
    methodName: String,
    parameterTypes: List<String>,
    replacement: String,
    expectedCount: Int,
    expectedDescription: String,
) {
    val classDef = fingerprint.classDef

    var count = 0
    classDef.methods.forEach { method ->
        count += method.replaceTypefaceCalls(methodName, parameterTypes, replacement)
    }

    if (count != expectedCount) {
        throw PatchException(
            "Expected $expectedCount $expectedDescription in ${classDef.type} but found $count"
        )
    }
}

/**
 * Replaces every `invoke-static` to `[TYPEFACE_MANAGER_CLASS]->[methodName][parameterTypes]`
 * in [method] with [replacement] and returns the number of replacements.
 */
private fun MutableMethod.replaceTypefaceCalls(
    methodName: String,
    parameterTypes: List<String>,
    replacement: String,
): Int {
    val implementation = implementation ?: return 0
    var count = 0

    // Replacements are 1:1 single instruction swaps, so iterating by index is safe.
    for (index in implementation.instructions.indices) {
        val instruction = implementation.instructions[index]

        if (instruction.opcode != Opcode.INVOKE_STATIC) continue

        val reference = (instruction as ReferenceInstruction).reference as MethodReference

        if (reference.definingClass == TYPEFACE_MANAGER_CLASS &&
            reference.name == methodName &&
            reference.parameterTypes == parameterTypes
        ) {
            replaceInstruction(index, replacement)
            count++
        }
    }

    return count
}

/**
 * Holders and views whose layouts hardcode a Roboto typeface attribute never
 * call the typeface manager: their BaseTextViews apply the font inside their
 * own constructor. After ButterKnife has resolved the named fields, each is
 * re-targeted with the dynamic title typeface by the extension, overriding
 * the constructor font.
 *
 * This works on any object: a view holder, or a view class whose binding is
 * done inside its own bind method (e.g. MaterialRow, TooltipView). The hooks
 * are inserted as ONE block right before the method's LAST return, where the
 * parameter registers are dead, so the protected `this` register plus the
 * first parameter register are used as scratch. No new registers are
 * allocated (the smali dexlib2 forbids growing the register count).
 *
 * Only the last return is hooked on purpose — repeated Morphe insertions at
 * different indices have been observed to corrupt surrounding instructions
 * (see the TooltipView VerifyError). Methods must therefore run all relevant
 * setup before their last return: the TooltipView's early return is the
 * "tooltip already dismissed" path, where the view is GONE and no font is
 * visible. Unbound or partially bound fields are no risk either, since the
 * extension skips missing values.
 *
 * The extension also drops any pending async PrecomputedTextCompat job of
 * the targeted views before changing the typeface: SpannableTextView family
 * members (LargeToolbarDescription and friends) precompute their text with
 * the constructor-applied font, and a later typeface change without that
 * invalidation crashed on the next measure pass.
 */
private context(patchContext: BytecodePatchContext)
fun applyTitleTypefaceFields(
    fingerprint: Fingerprint,
    viewFields: List<String>,
    expectedDescription: String,
) {
    val method = fingerprint.method
    val holderClass = method.definingClass

    // Statically verify the ButterKnife fields exist; the extension resolves
    // them by reflection at runtime.
    val holderFields = fingerprint.classDef.fields.map { it.name }
    for (field in viewFields) {
        if (field !in holderFields) {
            throw PatchException(
                "Field $field not found in $holderClass ($expectedDescription)"
            )
        }
    }

    val implementation = method.implementation!!

    val returnIndices = implementation.instructions.mapIndexedNotNull { index, instruction ->
        index.takeIf { instruction.opcode == Opcode.RETURN_VOID }
    }
    if (returnIndices.isEmpty()) {
        throw PatchException(
            "Expected at least 1 return in $holderClass ($expectedDescription) but found none"
        )
    }

    // With an immediate `return-void` following the hooks, the only
    // requirements are that both registers are valid, distinct, and that
    // nothing needs their old values afterwards.
    // `this` is the last register word; wide parameters occupy two words.
    val parameterWords = method.parameterTypes.sumOf {
        if (it == "J" || it == "D") 2 else 1
    }
    val thisRegister = implementation.registerCount - parameterWords - 1

    // Scratch: the first parameter (dead at the injection point), or the
    // first local for parameter-less methods like onFinishInflate.
    val scratchRegister = when {
        method.parameterTypes.isNotEmpty() -> thisRegister + 1
        implementation.registerCount >= 2 -> 0
        else -> throw PatchException(
            "No scratch register available in $holderClass ($expectedDescription)"
        )
    }

    val hooks = buildString {
        for (field in viewFields) {
            appendLine("const-string v$scratchRegister, \"$field\"")
            appendLine(
                "invoke-static {v$thisRegister, v$scratchRegister}, " +
                        "${Constants.TITLE_FONT_EXTENSION_CLASS}->applyTitleTypeface(" +
                        "Ljava/lang/Object;Ljava/lang/String;)V"
            )
        }
    }

    // One single insertion at the last return keeps every index stable.
    method.addInstructions(returnIndices.last(), hooks)
}

@Suppress("unused")
val fixHardcodedTitleFontsPatch = bytecodePatch(
    name = "Fix hardcoded title fonts",
    description = "Replaces hardcoded fonts.",
    default = true,
) {
    compatibleWith(
        Constants.SYNC_FREE,
        Constants.SYNC_PRO,
        Constants.SYNC_DEV,
    )

    extendWith("extensions/titlefont.mpe")

    execute {
        // Every individual site. The counts must match Sync v23.06.30-13:39;
        // a mismatch fails the patch with a descriptive error.

        // Toolbar title.
        replaceTypefaceManagerCalls(
            MaterialYouToolbarFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (toolbar title)",
        )

        // Settings screens.
        replaceTypefaceManagerCalls(
            PreferenceWrapperFragmentFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (PreferenceWrapperFragment title)",
        )
        replaceTypefaceManagerCalls(
            RootPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (RootPreference title)",
        )
        replaceTypefaceManagerCalls(
            ColorPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (ColorPreference title)",
        )
        replaceTypefaceManagerCalls(
            SyncPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (SyncPreference title)",
        )
        replaceTypefaceManagerCalls(
            SyncListPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (SyncListPreference title)",
        )
        replaceTypefaceManagerCalls(
            SyncCheckBoxPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (SyncCheckBoxPreference title)",
        )
        replaceTypefaceManagerCalls(
            SyncRadioButtonPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (SyncRadioButtonPreference title)",
        )
        replaceTypefaceManagerCalls(
            CategoryHeaderPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (CategoryHeaderPreference title)",
        )
        replaceTypefaceManagerCalls(
            CategoryInfoHeaderPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (CategoryInfoHeaderPreference title)",
        )
        replaceTypefaceManagerCalls(
            PushPreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (PushPreference title)",
        )
        replaceTypefaceManagerCalls(
            MonetDarkColorOverridePreferenceFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (MonetDarkColorOverridePreference title)",
        )

        // Theme editor preview.
        replaceTypefaceManagerCalls(
            SingleThemePreferencePreviewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (theme preview title)",
        )

        // Filter / Bypass settings page headers.
        replaceTypefaceManagerCalls(
            FilterFragmentHeaderFingerprint,
            methodName = "c", parameterTypes = emptyList(), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (filter header title)",
        )
        replaceTypefaceManagerCalls(
            BypassFragmentHeaderFingerprint,
            methodName = "c", parameterTypes = emptyList(), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (bypass header title)",
        )

        // Drawer.
        replaceTypefaceManagerCalls(
            DrawerHeaderHolderFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 3, expectedDescription = "typeface manager calls (drawer header)",
        )

        // Views hardcoded to Product Sans and friends.
        replaceTypefaceManagerCalls(
            AltUrlViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (AltUrlView)",
        )
        replaceTypefaceManagerCalls(
            UrlViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (UrlView)",
        )
        replaceTypefaceManagerCalls(
            CommentChipFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (CommentChip)",
        )
        replaceTypefaceManagerCalls(
            VotingChipFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (VotingChip)",
        )
        replaceTypefaceManagerCalls(
            MonetSearchBoxViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (search box)",
        )
        replaceTypefaceManagerCalls(
            OnboardingRestoreButtonFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (onboarding button)",
        )
        replaceTypefaceManagerCalls(
            ProductSansTextViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 2, expectedDescription = "typeface manager calls (ProductSansTextView)",
        )
        replaceTypefaceManagerCalls(
            LinkProductSansTextViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (LinkProductSansTextView)",
        )
        replaceTypefaceManagerCalls(
            RobotoTextViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (RobotoTextView)",
        )
        replaceTypefaceManagerCalls(
            SecondaryRobotoTextViewFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (SecondaryRobotoTextView)",
        )
        replaceTypefaceManagerCalls(
            MaxButtonFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (MaxButton)",
        )
        replaceTypefaceManagerCalls(
            CommentHeaderHolderFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (comment section header)",
        )

        // Multi input fragment: only the title input (field `s0`) gets the
        // title font; URL and subreddit inputs keep their stock font for
        // readability. The title input is the first of three `Lt7/r0;->a()`
        // calls in the method.
        MultiInputFragmentFingerprint.method.let { method ->
            val implementation = method.implementation!!

            var count = 0
            for (index in implementation.instructions.indices) {
                val instruction = implementation.instructions[index]
                if (instruction.opcode != Opcode.INVOKE_STATIC) continue

                val reference =
                    (instruction as ReferenceInstruction).reference as MethodReference

                if (reference.definingClass == TYPEFACE_MANAGER_CLASS &&
                    reference.name == "a" &&
                    reference.parameterTypes.isEmpty()
                ) {
                    // Patch only the first occurrence: the title input field `s0`.
                    if (count == 0) {
                        method.replaceInstruction(index, TITLE_TYPEFACE_CALL)
                    }
                    count++
                }
            }

            if (count != 3) {
                throw PatchException(
                    "Expected 3 typeface manager calls in MultiInputFragment but found $count"
                )
            }
        }

        // SubredditHolder: the custom subreddit text view chooses a font
        // between `const/4 p3, 0x3` (current subreddit) and `const/16 p3, 0x9`
        // before a single `Lt7/r0;->d(I)` call. Replace the const with the
        // dynamic title font id of the current view mode.
        SubredditHolderFingerprint.method.let { method ->
            val implementation = method.implementation!!

            // The last parameter register of this method (p3), as a raw
            // register index. `parameters` does not include `this`, so for the
            // (virtual) method with parameters (I, String, String) it is
            // registerCount - 3 - 1 + 3 = registerCount - 1.
            val p3Register = implementation.registerCount - method.parameterTypes.size - 1 + 3

            val constIndices = mutableListOf<Int>()
            for (index in implementation.instructions.indices) {
                val instruction = implementation.instructions[index]
                if (instruction.opcode != Opcode.CONST_4) continue

                val register = (instruction as OneRegisterInstruction).registerA
                val literal = (instruction as NarrowLiteralInstruction).narrowLiteral

                // const/4 p3, 0x3
                if (register == p3Register && literal == 3) {
                    constIndices.add(index)
                }
            }

            if (constIndices.size != 1) {
                throw PatchException(
                    "Expected 1 'const/4 p3, 0x3' in SubredditHolder but found ${constIndices.size}"
                )
            }

            val index = constIndices.first()
            method.replaceInstruction(index, TITLE_FONT_ID_CALL)
            method.addInstructions(
                index + 1,
                "move-result p3",
            )
        }

        // SubredditHolder part 2: the same method routes every row apart
        // from the current subreddit to `const/16 p3, 0x9` (Roboto Regular)
        // through one `Lt7/r0;->d(I)` call. Route those rows through the
        // dynamic title font id too, so all sheet rows (favorites, custom
        // feeds, subscriptions) follow the title font.
        SubredditHolderFingerprint.method.let { method ->
            val implementation = method.implementation!!

            val p3Register = implementation.registerCount - method.parameterTypes.size - 1 + 3

            val constIndices = mutableListOf<Int>()
            for (index in implementation.instructions.indices) {
                val instruction = implementation.instructions[index]
                if (instruction.opcode != Opcode.CONST_16) continue

                val register = (instruction as OneRegisterInstruction).registerA
                val literal = (instruction as NarrowLiteralInstruction).narrowLiteral

                // const/16 p3, 0x9
                if (register == p3Register && literal == 9) {
                    constIndices.add(index)
                }
            }

            if (constIndices.size != 1) {
                throw PatchException(
                    "Expected 1 'const/16 p3, 0x9' in SubredditHolder but found ${constIndices.size}"
                )
            }

            val index = constIndices.first()
            method.replaceInstruction(index, TITLE_FONT_ID_CALL)
            method.addInstructions(
                index + 1,
                "move-result p3",
            )
        }

        // Subreddit ("explore") sheet: section headers, search results and the
        // row's secondary "Default" label are hardcoded to Roboto via layout
        // attributes / BaseTextView defaults instead of typeface manager
        // calls, so their already-bound views are re-targeted after
        // construction.
        applyTitleTypefaceFields(
            SubredditHeaderHolderFingerprint,
            viewFields = listOf("mHeaderTextView", "mMoreText"),
            expectedDescription = "title typeface hooks (sheet section headers)",
        )
        applyTitleTypefaceFields(
            SearchItemHolderFingerprint,
            viewFields = listOf("mSubTextView", "mSubscriberTextView"),
            expectedDescription = "title typeface hooks (sheet search results)",
        )
        applyTitleTypefaceFields(
            SubredditHolderInitFingerprint,
            viewFields = listOf("mDefaultTextview"),
            expectedDescription = "title typeface hooks (sheet row Default label)",
        )

        // Dialog / picker rows: the generic MaterialRow backs subscriptions,
        // custom feeds, accounts and post-action selection lists, with
        // `app:typeface="roboto"` in its layout; radio pickers carry the same
        // hardcode in their item layout. The alert sheet's message text is
        // hardwired to font id 9 before a typeface manager call.
        applyTitleTypefaceFields(
            MaterialRowFingerprint,
            viewFields = listOf("mTitle", "mSecondary"),
            expectedDescription = "title typeface hooks (dialog picker rows)",
        )
        applyTitleTypefaceFields(
            RadioSelectionItemHolderFingerprint,
            viewFields = listOf("mTextView"),
            expectedDescription = "title typeface hooks (radio picker rows)",
        )
        replaceTypefaceManagerCalls(
            AbstractAlertDialogBottomSheetFingerprint,
            methodName = "d", parameterTypes = listOf("I"), replacement = TITLE_TYPEFACE_CALL,
            expectedCount = 1, expectedDescription = "typeface manager calls (alert dialog message)",
        )

        // Inbox page: the message rows hardcode Roboto through
        // `holder_message_slide`.
        applyTitleTypefaceFields(
            MessageHolderFingerprint,
            viewFields = listOf("mFirstLine", "mSecondLine", "mBody"),
            expectedDescription = "title typeface hooks (inbox message rows)",
        )

        // Remaining hardcoded layout sites: detailed subreddit search rows,
        // simple swipe posts and the italic "view comments" row bind through
        // the post holder super constructor; account rows bind their own
        // children in an internal inflate helper; tooltips bind inside
        // onFinishInflate, which has no parameters at all.
        applyTitleTypefaceFields(
            SearchSubsDetailedHolderFingerprint,
            viewFields = listOf("title"),
            expectedDescription = "title typeface hooks (detailed subreddit search rows)",
        )
        applyTitleTypefaceFields(
            SimpleSwipeHolderFingerprint,
            viewFields = listOf("title"),
            expectedDescription = "title typeface hooks (simple swipe post titles)",
        )
        applyTitleTypefaceFields(
            PostCommentHolderFingerprint,
            viewFields = listOf("title"),
            expectedDescription = "title typeface hooks (italic comment count rows)",
        )
        applyTitleTypefaceFields(
            AccountRowFingerprint,
            viewFields = listOf("mTitle"),
            expectedDescription = "title typeface hooks (account switcher rows)",
        )
        applyTitleTypefaceFields(
            TooltipViewFingerprint,
            viewFields = listOf("textView"),
            expectedDescription = "title typeface hooks (tooltips)",
        )

        // Ultra purchase screens: the description texts are BaseTextViews
        // bound unconditionally at the top of the preference bind method
        // (no ButterKnife), so the hook block at the trailing return covers
        // every path with all fields already resolved.
        applyTitleTypefaceFields(
            UltraManagePreferenceFingerprint,
            viewFields = listOf("j0"),
            expectedDescription = "title typeface hooks (Ultra manage description)",
        )
        applyTitleTypefaceFields(
            UltraSignupPreferenceFingerprint,
            viewFields = listOf("h0", "i0"),
            expectedDescription = "title typeface hooks (Ultra signup descriptions)",
        )

        // Profile pages. The About sheet's header line (large username, link
        // and comment karma counts, cake day) is a LargeToolbarDescription
        // constructed programmatically with font id 9 (Roboto Regular) at the
        // single call site in `o2`; BaseTextView later applies `t` through the
        // regular typeface manager, so passing the dynamic title font id is
        // enough. The large toolbar above subreddit / profile feeds inflates
        // the same view class from XML without a typeface attribute (Roboto
        // default for the karma line above the large title); its constructor
        // binds the view directly, so the already-bound field is re-targeted
        // at the single trailing return.
        AboutFragmentFingerprint.method.let { method ->
            val implementation = method.implementation!!

            val constIndices = mutableListOf<Int>()
            for (index in implementation.instructions.indices) {
                val instruction = implementation.instructions[index]
                if (instruction.opcode != Opcode.CONST_16) continue

                val register = (instruction as OneRegisterInstruction).registerA
                val literal = (instruction as NarrowLiteralInstruction).narrowLiteral

                // const/16 v1, 0x9 — the font id passed to the
                // LargeToolbarDescription constructor.
                if (register == 1 && literal == 9) {
                    constIndices.add(index)
                }
            }

            if (constIndices.size != 1) {
                throw PatchException(
                    "Expected 1 'const/16 v1, 0x9' in AboutFragment but found ${constIndices.size}"
                )
            }

            val index = constIndices.first()
            method.replaceInstruction(index, TITLE_FONT_ID_CALL)
            method.addInstructions(
                index + 1,
                "move-result v1",
            )
        }
        applyTitleTypefaceFields(
            PostsLargeSubredditToolbarViewFingerprint,
            viewFields = listOf("q"),
            expectedDescription = "title typeface hooks (large toolbar karma line)",
        )
    }
}
