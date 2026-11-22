package app.revanced.patches.rif.comments

import app.revanced.patches.rif.shared.hideInlineMediaSettingsForPatcheddit
import app.revanced.patches.rif.shared.inlineMediaForPatcheddit
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.revanced.patches.rif.settings.addRevancedPreferenceCategory
import app.revanced.patches.rif.settings.checkBoxPreference
import app.revanced.patches.rif.settings.seekBarPreference
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.settings.revancedSettingsResourcePatch
import app.revanced.patches.rif.shared.RIF_BUILDS
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.revanced.patches.rif.shared.classes
import app.revanced.patches.rif.shared.proxy

private const val EXTENSION = "Lapp/revanced/extension/rif/InlineImages;"
private const val TABLES_EXTENSION = "Lapp/revanced/extension/rif/InlineTables;"
private const val STEP_SEEK_BAR = "Lapp/revanced/extension/rif/StepSeekBarPreference;"

// Adds the "Inline media" category to the rif patches screen. The other checkboxes
// are greyed out when "Inline images" is off.
val inlineImagesSettingsResourcePatch = resourcePatch(
    description = "Adds the Inline comment images settings.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(revancedSettingsResourcePatch)

    finalize {
        hideInlineMediaSettingsForPatcheddit()
    }

    execute {
        addRevancedPreferenceCategory("Inline media") { doc, category ->
            category.appendChild(doc.checkBoxPreference("INLINE_IMAGES", "Inline images"))
            category.appendChild(
                doc.checkBoxPreference(
                    "INLINE_IMAGES_SCALE",
                    "Scale inline images to fit",
                    dependency = "INLINE_IMAGES",
                ),
            )
            for ((side, ofWhat) in listOf("WIDTH" to "width", "HEIGHT" to "height")) {
                category.appendChild(
                    doc.checkBoxPreference(
                        "INLINE_IMAGES_LIMIT_$side",
                        "Limit inline media $ofWhat",
                        dependency = "INLINE_IMAGES",
                        default = false,
                    ),
                )
                category.appendChild(
                    doc.seekBarPreference(
                        "INLINE_IMAGES_MAX_$side",
                        "Max $ofWhat (% of screen)",
                        min = 10,
                        max = 100,
                        increment = 5,
                        default = 100,
                        dependency = "INLINE_IMAGES_LIMIT_$side",
                    ),
                )
            }
            category.appendChild(
                doc.checkBoxPreference(
                    "INLINE_ALBUM_NAVIGATION",
                    "Inline album navigation",
                    dependency = "INLINE_IMAGES",
                    summary = "Arrows on multi-image imgur albums to cycle images.",
                ),
            )
            category.appendChild(
                doc.checkBoxPreference("INLINE_VIDEOS", "Inline videos", dependency = "INLINE_IMAGES"),
            )
            category.appendChild(
                doc.checkBoxPreference(
                    "INLINE_VIDEOS_AUTOPLAY",
                    "Autoplay inline videos",
                    dependency = "INLINE_VIDEOS",
                ),
            )
            category.appendChild(doc.checkBoxPreference("INLINE_TABLES", "Inline tables"))
            category.appendChild(
                doc.checkBoxPreference(
                    "INLINE_IMAGES_LONG_PRESS_SELECT",
                    "Long press image to select comment",
                    dependency = "INLINE_IMAGES",
                ),
            )
            category.appendChild(
                doc.seekBarPreference(
                    "INLINE_IMAGES_LONG_PRESS_DELAY",
                    "Long press delay (ms)",
                    min = 100,
                    max = 1000,
                    increment = 50,
                    default = 250,
                    dependency = "INLINE_IMAGES_LONG_PRESS_SELECT",
                ),
            )
        }
    }
}

private const val COMMENT_THING = "Lcom/andrewshu/android/reddit/things/objects/CommentThing;"
private const val THREAD_THING = "Lcom/andrewshu/android/reddit/things/objects/ThreadThing;"

// The i0.b render callback ((SpannableStringBuilder)V; named per build, see RIF_BUILDS):
// it receives the fully-rendered body (link spans already applied) on a background
// thread and caches it for display. Injecting at its entry lets our extension embed
// images into the spannable before it is ever measured/shown.
private fun renderCallbackFingerprint(thingType: String) = fingerprint {
    custom { method, classDef ->
        classDef.type == thingType &&
            RIF_BUILDS.any { it.renderCallback == method.name } &&
            method.returnType == "V" &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes.first().toString() == "Landroid/text/SpannableStringBuilder;"
    }
}

// Comment body (CommentThing render callback).
internal val commentRenderedBodyFingerprint = renderCallbackFingerprint(COMMENT_THING)

// A text post's selftext body (ThreadThing render callback, same shape).
internal val threadSelftextEmbedFingerprint = renderCallbackFingerprint(THREAD_THING)

// <commentBindClass>.h(m, CommentThing, Fragment) is the comment ViewHolder body bind
// (n2.o free / o2.o Platinum). Right after `bodyTextView.setText(body)` we attach() so
// any animated (GIF) drawable in the spannable gets its callback wired to that TextView
// and is started; this is the main thread, so animation can run. h() has one setText.
internal val commentBodyBindFingerprint = fingerprint {
    custom { method, classDef ->
        RIF_BUILDS.any { it.commentBindClass == classDef.type } &&
            method.name == "h" &&
            method.parameterTypes.size == 3 &&
            method.parameterTypes[1].toString() == COMMENT_THING
    }
}

// The post-header binder (e5.g free / f5.g Platinum): its selftext-bind method
// p(binder, ThreadThing, r0) reads the selftext getter and sets it on a TextView with
// its only setText. We attach() after that setText so selftext GIFs animate, mirroring
// the comment bind. Class and getter are matched as a pair so one build's names can't
// match in the other; the 3-arg signature excludes Platinum's f5.g.r(…, boolean), which
// also reads the getter.
internal val selftextBindFingerprint = fingerprint {
    custom { method, classDef ->
        val build = RIF_BUILDS.firstOrNull { it.selftextBindClass == classDef.type }
            ?: return@custom false
        if (method.parameterTypes.size != 3 || method.parameterTypes[1].toString() != THREAD_THING) {
            return@custom false
        }
        val getter = "$THREAD_THING->${build.selftextGetter}()Ljava/lang/CharSequence;"
        method.implementation?.instructions?.any { insn ->
            insn is ReferenceInstruction && insn.reference.toString() == getter
        } == true
    }
}

// The comments page's post binder (e5.u free / f5.u Platinum): o(holder, ThreadThing) sets
// the post's selftext, above the comments, with `setText(thing.<selftextGetter>())` (or
// the raw text when it isn't rendered yet). Matched with its getter as a pair, like above.
internal val opSelftextBindFingerprint = fingerprint {
    custom { method, classDef ->
        val build = RIF_BUILDS.firstOrNull { it.opSelftextBindClass == classDef.type }
            ?: return@custom false
        method.name == "o" && method.parameterTypes.size == 2 &&
            method.parameterTypes[1].toString() == THREAD_THING &&
            method.implementation?.instructions?.any { insn ->
                insn is ReferenceInstruction &&
                    insn.reference.toString() == "$THREAD_THING->${build.selftextGetter}()Ljava/lang/CharSequence;"
            } == true
    }
}

// androidx SeekBarPreference's SeekBar listener (an inner class). Its seekBarIncrement
// only sets the arrow-key step, so a drag moves in steps of 1; snapping here (for our
// StepSeekBarPreference only) makes the long-press delay slider move in 50 ms steps.
internal val seekBarProgressChangedFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type.startsWith("Landroidx/preference/SeekBarPreference$") &&
            method.name == "onProgressChanged" &&
            method.parameterTypes.map { it.toString() } == listOf("Landroid/widget/SeekBar;", "I", "Z")
    }
}

// The body's `TextView.setText(CharSequence)`. Another bundle may have replaced it already with a
// static wrapper taking the same TextView and text (Patcheddit's Inline media does, on Morphe, if it
// ever runs before us); the TextView is the first register in both. Stock rif has no such wrapper.
private fun isBodySetText(insn: Instruction): Boolean {
    val ref = (insn as? ReferenceInstruction)?.reference?.toString() ?: return false
    return when (insn.opcode) {
        Opcode.INVOKE_VIRTUAL -> ref == "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V"
        Opcode.INVOKE_STATIC -> ref.endsWith(";->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V")
        else -> false
    }
}

@Suppress("unused")
val inlineCommentImagesPatch = bytecodePatch(
    name = "Inline comment images",
    description = "Shows tables in comments and text posts inline. Patcheddit covers other types of inline media.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(inlineImagesSettingsResourcePatch, revancedSettingsPatch)

    // Bring our extension (InlineImages) into the app.
    extendWith("extensions/extension.mpe")

    finalize {
        inlineMediaForPatcheddit()
    }

    execute {
        // 1) Embed images into the comment + selftext spannables (background, before
        // display). p1 = the SpannableStringBuilder argument. Tables are embedded first
        // (added second, at index 0, so it runs before the images' call): their replaced
        // range holds links that InlineImages must not see. p0 = the Thing (the callback).
        // InlineTables.bodyHtml/bodyEscaped are empty stubs; write them to call the callback
        // interface's getters (names differ per build, RIF_BUILDS), so no reflection is needed.
        val build = RIF_BUILDS.firstOrNull { it.renderCallback == commentRenderedBodyFingerprint.method.name }
            ?: throw PatchException("render callback ${commentRenderedBodyFingerprint.method.name} is in no known build")
        val callbackInterface = build.bodyRenderClass.removeSuffix(";") + "\$b;"
        val tablesStubs = proxy(classes.first { it.type == TABLES_EXTENSION }).mutableClass.methods
        tablesStubs.firstOrNull { it.name == "bodyHtml" }?.addInstructions(
            0,
            """
                check-cast p0, $callbackInterface
                invoke-interface { p0 }, $callbackInterface->${build.bodyHtmlGetter}()Ljava/lang/String;
                move-result-object v0
                return-object v0
            """,
        ) ?: throw PatchException("InlineTables.bodyHtml not found")
        tablesStubs.firstOrNull { it.name == "bodyEscaped" }?.addInstructions(
            0,
            """
                check-cast p0, $callbackInterface
                invoke-interface { p0 }, $callbackInterface->${build.bodyEscapedGetter}()Z
                move-result v0
                return v0
            """,
        ) ?: throw PatchException("InlineTables.bodyEscaped not found")

        for (fingerprint in listOf(commentRenderedBodyFingerprint, threadSelftextEmbedFingerprint)) {
            fingerprint.method.addInstructions(
                0,
                "invoke-static { p1 }, $EXTENSION->embed(Landroid/text/SpannableStringBuilder;)V",
            )
            fingerprint.method.addInstructions(
                0,
                "invoke-static { p0, p1 }, $TABLES_EXTENSION->embed(Ljava/lang/Object;Landroid/text/SpannableStringBuilder;)V",
            )
        }

        // 2) Start GIFs and videos once the body TextView is bound (main thread): inject
        // attach(textView) right after the body setText, in the comment ViewHolder bind
        // (n2.o.h), the thread-list selftext bind (e5.g) and the comments-page selftext
        // bind (e5.u.o). The first two have one TextView.setText; in o() it's the first
        // setText after the selftext getter.
        val binds = listOf(
            commentBodyBindFingerprint.method to null,
            selftextBindFingerprint.method to null,
            opSelftextBindFingerprint.method to RIF_BUILDS.first {
                it.opSelftextBindClass == opSelftextBindFingerprint.classDef.type
            }.selftextGetter,
        )
        for ((bind, getter) in binds) {
            val from = if (getter == null) 0 else bind.instructions.indexOfFirst { insn ->
                (insn as? ReferenceInstruction)?.reference?.toString() ==
                    "$THREAD_THING->$getter()Ljava/lang/CharSequence;"
            }
            val setTextIndex = bind.instructions.withIndex().indexOfFirst { (i, insn) ->
                i >= from && isBodySetText(insn)
            }
            if (setTextIndex == -1) {
                throw PatchException("body setText not found in ${bind.definingClass}")
            }
            val textViewRegister =
                (bind.instructions.elementAt(setTextIndex) as FiveRegisterInstruction).registerC
            bind.addInstructions(
                setTextIndex + 1,
                "invoke-static { v$textViewRegister }, $EXTENSION->attach(Landroid/widget/TextView;)V",
            )
        }

        // 3) Full screen from an inline video continues where it was (FullscreenHandoff.kt).
        hookFullscreenHandoff()

        // 4) Snap our sliders' dragged values to their step (p1 = SeekBar, p2 = progress,
        // p3 = fromUser). snap() only acts when the listener's preference (its outer-class
        // field) is a StepSeekBarPreference. The listener reads both p2 and
        // seekBar.getProgress(), so both get the snapped value. v0 is a scratch local.
        val onProgressChanged = seekBarProgressChangedFingerprint.method
        val outerField = seekBarProgressChangedFingerprint.classDef.fields.singleOrNull {
            it.type == "Landroidx/preference/SeekBarPreference;"
        } ?: throw PatchException("SeekBarPreference field not found in ${onProgressChanged.definingClass}")
        requireScratchRegister(onProgressChanged)
        onProgressChanged.addInstructions(
            0,
            """
                iget-object v0, p0, $outerField
                invoke-static { v0, p1, p2, p3 }, $STEP_SEEK_BAR->snap(Ljava/lang/Object;Landroid/widget/SeekBar;IZ)I
                move-result p2
            """,
        )
    }
}
