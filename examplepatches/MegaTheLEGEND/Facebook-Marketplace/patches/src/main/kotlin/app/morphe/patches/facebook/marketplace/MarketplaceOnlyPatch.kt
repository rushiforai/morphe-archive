package app.morphe.patches.facebook.marketplace

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val THEME_STATE = "Lcom/facebook/prefs/theme/ThemePreferences\$State;"

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/facebook/marketplace/MarketplaceOnly;"

private const val PDP_ADS_EXTENSION_CLASS =
    "Lapp/morphe/extension/facebook/marketplace/PdpAdFlags;"

private const val GROUP_EXTENSION_CLASS =
    "Lapp/morphe/extension/facebook/marketplace/GroupSuggestions;"

private const val ABOUT_EXTENSION_CLASS =
    "Lapp/morphe/extension/facebook/marketplace/AboutMenu;"

private const val SEARCH_EXTENSION_CLASS =
    "Lapp/morphe/extension/facebook/marketplace/SearchScope;"

internal val hideTabBarOption = booleanOption(
    key = "hideTabBar",
    default = true,
    title = "Hide bottom tab bar",
    description = "Hides the Facebook tab bar (Feed / Reels / Watch / Notifications / Menu) so " +
        "they aren't one tap away. Turn off to only change which tab opens at launch."
)

internal val lockNavigationOption = booleanOption(
    key = "lockNavigation",
    default = true,
    title = "Lock navigation to Marketplace",
    description = "Disables swiping between tabs and the left-hand Facebook menu (hamburger button " +
        "and edge swipe), so Reels, Groups, Dating etc. can't be reached from the main screen."
)

internal val externalLinksOption = booleanOption(
    key = "externalLinks",
    default = true,
    title = "Open links in the system browser",
    description = "Never use Facebook's in-app WebView browser; every link opens in the default browser app."
)

internal val blockReelsOption = booleanOption(
    key = "blockReels",
    default = true,
    title = "Block Reels / fullscreen video viewer",
    description = "Reels (and any other video opened in Facebook's fullscreen Watch/Reels viewer) can no longer be opened from feeds, profiles, deep links or notifications."
)

internal val marketplaceIsHomeOption = booleanOption(
    key = "marketplaceIsHome",
    default = true,
    title = "Marketplace is the home tab",
    description = "Back on Marketplace's root leaves the app instead of jumping to the Facebook Home feed."
)

internal val returnToMarketplaceOption = booleanOption(
    key = "returnToMarketplace",
    default = true,
    title = "Never switch away from Marketplace",
    description = "Redirects every tab switch to Marketplace, including Facebook's \"return to Home feed " +
        "after being away\" reset, so coming back to the app after a long time still shows Marketplace."
)

internal val forceDarkModeOption = booleanOption(
    key = "forceDarkMode",
    default = true,
    title = "Always use dark mode",
    description = "Pins Facebook's own Dark mode setting to \"On\" and makes the dark-theme decision points (is-dark check, theme application, FDS resolver) always dark, regardless of the system theme."
)

internal val blockGroupSuggestionsOption = booleanOption(
    key = "blockGroupSuggestions",
    default = true,
    title = "Remove group suggestions",
    description = "Removes the \"Recommended groups\" block on Marketplace search and the \"Related groups\" block on " +
        "listing pages (Facebook's GYSJ units) by switching their MobileConfig flags off."
)

internal val blockFacebookSearchOption = booleanOption(
    key = "blockFacebookSearch",
    default = true,
    title = "Keep search inside Marketplace",
    description = "Removes the \"Search in all of Facebook\" and \"Search with Meta AI\" entries from Marketplace " +
        "search, and blocks every other way into Facebook global search (e.g. profile > More options > Search)."
)

internal val hideProfileSettingsNoteOption = booleanOption(
    key = "hideProfileSettingsNote",
    default = true,
    title = "Hide profile \"Go to settings\" note",
    description = "Removes the paragraph with the \"Go to settings\" link on the Marketplace profile screen."
)

internal val aboutPageOption = booleanOption(
    key = "aboutPage",
    default = true,
    title = "Add an About page to the account menu",
    description = "Adds an \"About\" row to the list that opens from the top-right account button on Marketplace. " +
        "It opens a dialog describing this app."
)

private const val PROFILE_EXTENSION_CLASS =
    "Lapp/morphe/extension/facebook/marketplace/ProfileNotice;"

/**
 * Compatible only with Facebook 582.0.0.50.54 (see Compatibility.kt). The fingerprints also fail to match
 * rather than patch something unintended on another build.
 */
@Suppress("unused")
val marketplaceOnlyPatch = bytecodePatch(
    name = "Marketplace only",
    description = "Opens Facebook directly on Marketplace and (optionally) hides the bottom tab bar. " +
        "Built for Facebook 582.0.0.50.54 (com.facebook.katana).",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK)
    extendWith("extensions/facebook.mpe")

    hideTabBarOption()
    lockNavigationOption()
    externalLinksOption()
    blockReelsOption()
    marketplaceIsHomeOption()
    returnToMarketplaceOption()
    forceDarkModeOption()
    blockGroupSuggestionsOption()
    blockFacebookSearchOption()
    hideProfileSettingsNoteOption()
    aboutPageOption()

    execute {
        val hideTabBar by hideTabBarOption
        val lockNavigation by lockNavigationOption
        val externalLinks by externalLinksOption
        val blockReels by blockReelsOption
        val marketplaceIsHome by marketplaceIsHomeOption
        val returnToMarketplace by returnToMarketplaceOption
        val forceDarkMode by forceDarkModeOption
        val blockGroupSuggestions by blockGroupSuggestionsOption
        val blockFacebookSearch by blockFacebookSearchOption
        val hideProfileSettingsNote by hideProfileSettingsNoteOption
        val aboutPage by aboutPageOption

        val entryPoint =
            if (hideTabBar == true) "onStartingTabDeterminedHideBar" else "onStartingTabDetermined"

        DetermineStartingTabFingerprint.method.apply {
            // Do NOT read p0 at the return-void: Facebook reuses v27 (p0) as scratch, so there it
            // has verifier type "Conflict" and the class fails to load (VerifyError, app crashes
            // on launch). The return hooks therefore take no registers at all.
            val returnIndices = implementation!!.instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()

            check(returnIndices.isNotEmpty()) { "No return-void found in the tab controller method" }

            // Reverse order keeps earlier indices valid.
            returnIndices.forEach { index ->
                addInstructions(index, "invoke-static {}, $EXTENSION_CLASS->$entryPoint()V")
                if (blockFacebookSearch == true) {
                    // Registers the activity callbacks that hide "Search in all of Facebook" / "Search with
                    // Meta AI" rows. No arguments (same rule as above); idempotent, so every return may call it.
                    addInstructions(index, "invoke-static {}, $SEARCH_EXTENSION_CLASS->install()V")
                }
                if (hideProfileSettingsNote == true) {
                    // Same no-register, idempotent hook: hides the "Go to settings" paragraph (ProfileNotice).
                    addInstructions(index, "invoke-static {}, $PROFILE_EXTENSION_CLASS->install()V")
                }
            }

            // At method entry p0 ("this") is guaranteed to hold the controller. /range because
            // p0 is v27 here, which doesn't fit the 4-bit register field of plain invoke-static.
            // Added last so it doesn't shift the indices above.
            addInstructions(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->capture(Ljava/lang/Object;)V"
            )
        }

        if (aboutPage == true) {
            // Adds the "About" row to the account menu. The builder ends with X.0s1.A1j(list) (returns the
            // list); call the extension right before it with that list register and the Context (p2). Both
            // registers are live there (see MarketplaceMenuItemsFingerprint), so no scratch register is needed.
            MarketplaceMenuItemsFingerprint.method.apply {
                val instructions = implementation!!.instructions
                val finishIndex = instructions.indexOfLast { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        reference != null &&
                        reference.name == "A1j" &&
                        reference.parameterTypes.map { it.toString() } == listOf("Ljava/util/List;")
                }
                check(finishIndex >= 0) { "A1j(List) call not found in buildMarketplaceSurfaceMenuItems" }
                val listRegister = (instructions.elementAt(finishIndex) as FiveRegisterInstruction).registerC
                addInstructions(
                    finishIndex,
                    "invoke-static { v$listRegister, p2 }, " +
                        "$ABOUT_EXTENSION_CLASS->addAboutItem(Ljava/lang/Object;Ljava/lang/Object;)V"
                )
            }
        }

        if (lockNavigation == true) {
            // Boolean touch handlers: never intercept / never handle. v0 is a free local in every
            // one of these methods (checked in the dex), and no branches are needed.
            val returnFalse = "const/4 v0, 0x0\nreturn v0"

            // 1. Swiping between tabs: the main tab ViewPager (X.25n) must neither intercept
            //    horizontal drags, nor take them as a touch target, nor accept nested-scroll
            //    hand-offs from child lists.
            TabPagerInterceptTouchFingerprint.method.addInstructions(0, returnFalse)
            TabPagerStartNestedScrollFingerprint.method.addInstructions(0, returnFalse)
            // X.25n has no onTouchEvent of its own (it inherits ViewPager's), so add an override.
            TabPagerInterceptTouchFingerprint.classDef.methods.add(
                ImmutableMethod(
                    TabPagerInterceptTouchFingerprint.classDef.type,
                    "onTouchEvent",
                    listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;", null, null)),
                    "Z",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(3) // v0 + p0 (this) + p1 (event)
                ).toMutable().apply {
                    addInstructions(0, returnFalse)
                }
            )

            // 2. The left-hand Facebook menu (SlidingPanelScrollView, X.24g): no edge swipe...
            SlidingPanelInterceptTouchFingerprint.method.addInstructions(0, returnFalse)
            SlidingPanelTouchFingerprint.method.addInstructions(0, returnFalse)
            // ...and no programmatic "open panel" (hamburger tap, RN module, etc.).
            SlidingPanelOpenFingerprint.method.addInstructions(0, "return-void")
        }

        if (externalLinks == true) {
            // Link launcher decision: always (EXTERNAL, FORCE_EXTERNAL_BROWSER), same result as
            // Facebook's own "links open externally" setting. v0/v1 are free locals (static
            // method, 3 locals), no branches. Check against the real enum fields with:
            //   dexscan dexdir dis "LX/dqt;" "<clinit>"   (A02 = EXTERNAL)
            //   dexscan dexdir dis "LX/5vy;" "<clinit>"   (A06 = BROWSER_IPC_FORCE_EXTERNAL_BROWSER)
            LinkLaunchModeFingerprint.method.addInstructions(
                0,
                """
                    sget-object v0, LX/dqt;->A02:LX/dqt;
                    sget-object v1, LX/5vy;->A06:LX/5vy;
                    invoke-static {v0, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;
                    move-result-object v0
                    return-object v0
                """
            )
        }

        if (blockReels == true) {
            // The whole Reels / fullscreen-video viewer launch chain (see Fingerprints.kt):
            //   7rP.A01 -> 4Ok.A0C -> 4Ok.A0B -> 4Ok.A03 -> ImmersiveActivity
            // 7rP.A01 also pre-starts the player (you'd hear audio with nothing on screen), so it is
            // blocked too. 4Ok.A0B claims "handled" (true) instead of false so callers don't fall back to
            // the legacy fullscreen player. All are no-register returns; v0 is free in A0B (28 locals).
            WarionEntryPointFingerprint.method.addInstructions(0, "return-void")
            WatchEntryPointLaunchFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            WatchEntryPointLaunchAltFingerprint.method.addInstructions(0, "return-void")
            WatchEntryPointStartFingerprint.method.addInstructions(0, "return-void")
        }

        if (marketplaceIsHome == true) {
            // In onBackPressedInternal the target tab is `invoke-virtual/range {v16..v16}, X.1Hz;->A02()J`
            // followed by `move-result-wide v17` (verified in the dex; it occurs exactly once). Swap just the
            // invoke for a static no-arg call (same 3-code-unit size, the move-result stays untouched), so
            // the "home tab" is Marketplace and back, with nothing left to pop, exits instead of switching.
            BackPressedFingerprint.method.apply {
                val index = implementation!!.instructions.indexOfFirst { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference != null &&
                        reference.definingClass == "LX/1Hz;" &&
                        reference.name == "A02" &&
                        reference.returnType == "J"
                }
                check(index >= 0) { "1Hz.A02() call not found in onBackPressedInternal" }
                replaceInstruction(index, "invoke-static {}, $EXTENSION_CLASS->marketplaceHomeTabId()J")
            }
        }

        if (returnToMarketplace == true) {
            // X.2FU.A06 is where every tab switch lands, with the target tab's INDEX in p5 (v21).
            // Hand p0 (the controller) to the extension, then replace p5 with Marketplace's index.
            // /range because p0 = v16 and p5 = v21 don't fit plain invoke-static's 4-bit registers.
            // Both are valid at method entry (they are parameters), unlike registers Facebook reuses
            // as scratch later in the method.
            TabPagerSelectFingerprint.method.addInstructions(
                0,
                """
                    invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->capturePager(Ljava/lang/Object;)V
                    invoke-static/range { p5 .. p5 }, $EXTENSION_CLASS->redirectTabIndex(I)I
                    move-result p5
                """
            )
        }

        if (forceDarkMode == true) {
            // Facebook's own Dark mode setting is X.1Mi.A00 (ThemePreferences$State: A03 = ON, A02 = OFF,
            // A04 = SYSTEM); X.1Mi.A05() ("is dark?") and the theme application read it. Pin it to ON in
            // both places it can be set. See Fingerprints.kt for how this was traced.
            val stateOn = "$THEME_STATE->A03:$THEME_STATE"

            // Constructor: before every `iput-object A00` load State.ON into the register being stored.
            // Done from the last match to the first so earlier indices stay valid.
            ThemeManagerInitFingerprint.method.apply {
                val stores = implementation!!.instructions
                    .withIndex()
                    .filter { (_, instruction) ->
                        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                        instruction.opcode == Opcode.IPUT_OBJECT &&
                            reference != null &&
                            reference.definingClass == "LX/1Mi;" &&
                            reference.name == "A00"
                    }
                    .map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }
                    .reversed()

                check(stores.isNotEmpty()) { "No store to X.1Mi.A00 found in the theme manager constructor" }

                stores.forEach { (index, register) ->
                    addInstructions(index, "sget-object v$register, $stateOn")
                }
            }

            // Setter: whatever State the settings screen passes in, save and apply ON. p1 is the State
            // parameter (v7); loading it with a State constant is type-safe.
            ThemeManagerSetStateFingerprint.method.addInstructions(0, "sget-object p1, $stateOn")

            // Pinning the setting wasn't enough on its own (A05 also needs the "can use dark mode" flag and
            // an activity can force light), so also make the three decision points unconditional:
            //   1Mi.A05()        "is dark?"            -> true
            //   1Mi.A03(theme,Z) apply dark/light style -> always the dark style (p2 = v5 = true)
            //   25R.A02(Context) FDS / Litho "is dark?" -> true
            ThemeIsDarkFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            ThemeApplyFingerprint.method.addInstructions(0, "const/4 p2, 0x1")
            FdsIsDarkFingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // Group pages (ImmersiveActivity): ask the title bar to hide its search button, using Facebook's own
        // Poj.setHidesSearchButton(true) (the same call A0H makes itself in one branch).
        GroupTitleBarSetupFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, LX/9zQ;->A0V(LX/5ku;)LX/Poj;
                move-result-object v0
                if-eqz v0, :no_title_bar
                const/4 v1, 0x1
                invoke-interface {v0, v1}, LX/Poj;->setHidesSearchButton(Z)V
                :no_title_bar
                nop
            """
        )

        // Drop the top-bar Search icon: the `ArrayList.add(button)` right after its "nav_bar_search_button" tag
        // becomes a nop, so the bar's action list stays empty. Only this one NavigationBarComponent site.
        NavBarSearchButtonFingerprint.method.apply {
            val ins = implementation!!.instructions
            val tag = ins.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as ReferenceInstruction).reference as StringReference).string == "nav_bar_search_button"
            }
            val add = (tag until ins.size).first {
                ins[it].opcode == Opcode.INVOKE_VIRTUAL &&
                    ((ins[it] as ReferenceInstruction).reference as MethodReference).name == "add"
            }
            replaceInstruction(add, "nop")
        }

        if (blockFacebookSearch == true) {
            // Gate on X.hQ5.A01, the single launcher of Facebook's search screen (see Fingerprints.kt). v0 is a free
            // local at entry (11 registers, 6 parameters). The labels live inside this one snippet; the `nop` gives
            // the :allow label an instruction to sit on. Calls from Marketplace's own search box are let through.
            SearchLauncherFingerprint.method.addInstructions(
                0,
                """
                    invoke-static {}, $SEARCH_EXTENSION_CLASS->allowSearchLaunch()Z
                    move-result v0
                    if-nez v0, :allow_search
                    return-void
                    :allow_search
                    nop
                """
            )
        }

        // Both options filter the same six MobileConfig getters. They share one injection routine, which is
        // called once per extension class; a second call chains after the first (it inserts before the last
        // `return`, and the first filter's `move-result` already holds the value the next one sees).

        /**
         * Filters the boolean result of the six MobileConfigNativeModule getters through
         * `extensionClass->filterBoolByName(String, Z)Z` and `extensionClass->filterBoolBySpec(JZ)Z`.
         * Marketplace search / listing pages are React Native, so their blocks can't be removed from the view tree;
         * their MobileConfig flags can. See Fingerprints.kt for the register analysis. The filter is inserted right
         * before the (last) `return`: the `move-result` before it has already put Facebook's value in the returned
         * register, and the extension hands back the value to use instead. No branches needed.
         */
        fun hookMobileConfigBools(extensionClass: String) {
            // By name: `p1` (the flag name, v2) is never overwritten in these two methods.
            listOf(
                MobileConfigGetBoolFingerprint,
                MobileConfigGetBoolWithoutLoggingFingerprint
            ).forEach { fingerprint ->
                fingerprint.method.apply {
                    val returnIndex = implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN }
                    check(returnIndex > 0) { "No return found in ${fingerprint.method.name}" }
                    val result = (implementation!!.instructions.elementAt(returnIndex) as OneRegisterInstruction).registerA
                    addInstructions(
                        returnIndex,
                        """
                            invoke-static { p1, v$result }, $extensionClass->filterBoolByName(Ljava/lang/String;Z)Z
                            move-result v$result
                        """
                    )
                }
            }

            // By spec: the first `move-result-wide` is the packed specifier from `MobileConfigNativeModule.A00(DD)J`.
            // Its register pair is only read afterwards, so it is still intact at the last `return`.
            listOf(
                MobileConfigGetBoolForStableSpecFingerprint,
                MobileConfigGetBoolWithoutLoggingForStableSpecFingerprint,
                MobileConfigGetBoolWithContextualIdFingerprint,
                MobileConfigGetBoolWithoutLoggingWithContextualIdFingerprint
            ).forEach { fingerprint ->
                fingerprint.method.apply {
                    val instructions = implementation!!.instructions
                    val specIndex = instructions.indexOfFirst { it.opcode == Opcode.MOVE_RESULT_WIDE }
                    check(specIndex >= 0) { "Specifier (move-result-wide) not found in ${fingerprint.method.name}" }
                    val specRegister = (instructions.elementAt(specIndex) as OneRegisterInstruction).registerA

                    val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN }
                    check(returnIndex > specIndex) { "No return after the specifier in ${fingerprint.method.name}" }
                    val result = (instructions.elementAt(returnIndex) as OneRegisterInstruction).registerA

                    addInstructions(
                        returnIndex,
                        """
                            invoke-static { v$specRegister, v${specRegister + 1}, v$result }, $extensionClass->filterBoolBySpec(JZ)Z
                            move-result v$result
                        """
                    )
                }
            }
        }

        if (blockGroupSuggestions == true) hookMobileConfigBools(GROUP_EXTENSION_CLASS)
        // Listing-page ads: switch off the ad-rendering capability flags (PdpAdFlags).
        hookMobileConfigBools(PDP_ADS_EXTENSION_CLASS)
        if (blockFacebookSearch == true) hookMobileConfigBools(SEARCH_EXTENSION_CLASS)
    }
}
