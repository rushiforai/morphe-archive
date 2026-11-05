package app.template.patches.firefoxfocus.addons

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH_NAME = "Add-on support"

@Suppress("unused")
val addonSupportPatch = bytecodePatch(
    name = PATCH_NAME,
    description = "Adds an Extensions menu to install and manage uBlock Origin, Violentmonkey, " +
        "Tampermonkey and Dark Reader, and shows their popups. Add-ons run in private mode, like every Focus tab; " +
        "their data survives Erase. Installed add-ons are checked for updates from addons.mozilla.org " +
        "at most once a day.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    extendWith("extensions/firefoxfocus.mpe")

    execute {
        // 1. The prompt delegate Android Components registers is wrapped. Its prompts go to a
        // store action Focus never reads, so WebExtensionController.install() (and update and
        // optional-permission requests) would wait forever. The same call hands the extension
        // the controller, so it never has to look up or race GeckoRuntime.create. setPromptDelegate
        // has 5 locals (p0 = v5, p1 = v6); the range form fits any register.
        SetPromptDelegateFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->wrapPromptDelegate($WEB_EXTENSION_CONTROLLER$PROMPT_DELEGATE)$PROMPT_DELEGATE
                move-result-object p1
            """,
        )

        // 2. FocusApplication.onCreate: track the foreground Activity (the extension skips the
        // other Focus processes) for prompts, the manager and popups. onCreate has 33 locals.
        FocusApplicationOnCreateFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS_DESCRIPTOR->onApplicationCreate(Landroid/app/Application;)V
            """,
        )

        // 3. Browser menu: Focus 159 builds it with Android Components' Compose menu, which has no
        // add-on support (WebExtensionBrowserMenuBuilder, patched up to 158, is gone). Before
        // BrowserMenu.menuGroupsFor returns its group list, addMenuItems(list, state) adds a row in
        // front of Settings: each enabled add-on's browser action and "Extensions" (the manager).
        // menuGroupsFor builds the first menu and every update on a BrowserState change.
        val menuGroupsFor = BrowserMenuGroupsFingerprint.method
        if (menuGroupsFor.returnType != "Ljava/util/ArrayList;" && menuGroupsFor.returnType != "Ljava/util/List;") {
            throw PatchException("$PATCH_NAME: BrowserMenu.menuGroupsFor returns ${menuGroupsFor.returnType}, not a List")
        }
        val menuImplementation = menuGroupsFor.implementation!!
        // p0 = this, p1 = the BrowserState, p2 = the reporter icon. The hook reads p1 at the return,
        // so no instruction may write it (159.0.1 copies it once and never reuses the register).
        val stateRegister = menuImplementation.registerCount - 2
        menuGroupsFor.instructions.forEachIndexed { index, instruction ->
            if (!instruction.opcode.setsRegister() || instruction !is OneRegisterInstruction) return@forEachIndexed
            val written = instruction.registerA
            if (written == stateRegister || (instruction.opcode.setsWideRegister() && written + 1 == stateRegister)) {
                throw PatchException("$PATCH_NAME: BrowserMenu.menuGroupsFor overwrites p1 (v$stateRegister) at $index")
            }
        }
        val returns = menuGroupsFor.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("$PATCH_NAME: BrowserMenu.menuGroupsFor has no return-object")
        // Last first, so the earlier indices stay valid. The return is the loop exit's branch
        // target, so the hook takes over its labels.
        returns.sortedDescending().forEach { index ->
            val result = (menuGroupsFor.instructions[index] as OneRegisterInstruction).registerA
            // At a return-object every register but the result is dead: any two neighbours that
            // are neither the result nor p1 carry the range call's arguments.
            val scratch = (0 until menuImplementation.registerCount - 1).first {
                it != result && it + 1 != result && it != stateRegister && it + 1 != stateRegister
            }
            menuGroupsFor.addInstructionsAtControlFlowLabelChecked(
                index,
                """
                    move-object/from16 v$scratch, v$result
                    move-object/from16 v${scratch + 1}, p1
                    invoke-static/range { v$scratch .. v${scratch + 1} }, $EXTENSION_CLASS_DESCRIPTOR->addMenuItems(Ljava/util/List;Ljava/lang/Object;)V
                """,
            )
        }

        // 4. Menu taps: MenuMiddleware.invoke(store, next, action) hands the action (p3) to
        // onMenuAction first. Our entries are MenuItemTapped events with an item Focus does not
        // know, so Focus only dismisses the menu, and the extension runs the entry after that.
        MenuMiddlewareInvokeFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static/range { p3 .. p3 }, $EXTENSION_CLASS_DESCRIPTOR->onMenuAction(Ljava/lang/Object;)V
            """,
        )

        // 5. Browser action popups: AC creates the private popup session but only hands it to a
        // store action Focus never reads. Attach a listener to the session result (p1) that shows
        // it in a GeckoView dialog; the original body still sets the popup flag and loads the URL.
        ActionOpenPopupFingerprint.method.addInstructionsChecked(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->onOpenPopup($GECKO_RESULT)V
            """,
        )
    }
}
