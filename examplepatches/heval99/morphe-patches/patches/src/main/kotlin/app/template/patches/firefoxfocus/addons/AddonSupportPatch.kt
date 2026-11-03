package app.template.patches.firefoxfocus.addons

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.firefoxfocus.misc.shared.registers
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

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

        // 3. Browser menu: every WebExtensionBrowserMenuBuilder constructor gets
        // showAddonsInMenu = true (Focus's main menu passes false) and our "Extensions Manager"
        // action (Focus passes the no-op default). This adds AC's Extensions submenu (each
        // add-on's browser action) and the manager item. In 158.0 R8 merged the constructors into
        // <init>(List, BrowserStore, I) with a 0x80 default mask for showAddonsInMenu; every
        // constructor that writes either field is patched. The fields are rewritten right after
        // the original write, so a branch that jumps onto the original iput cannot skip ours.
        val builder = mutableClassDefBy(MENU_BUILDER)
        var showWrites = 0
        var callbackWrites = 0
        builder.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { constructor ->
            val writes = constructor.instructions.withIndex().mapNotNull { (index, instruction) ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@mapNotNull null
                if (field.definingClass != MENU_BUILDER) return@mapNotNull null
                when {
                    instruction.opcode == Opcode.IPUT_BOOLEAN && field.name == SHOW_ADDONS_IN_MENU &&
                        field.type == "Z" -> index to true
                    instruction.opcode == Opcode.IPUT_OBJECT && field.name == ON_ADDONS_MANAGER_TAPPED &&
                        field.type == FUNCTION0 -> index to false
                    else -> null
                }
            }
            // The forced value goes into the iput's own value register, so the original value must
            // be dead after the write (158.0: v1 and v2, followed only by return-void), and a jump
            // onto the instruction after the iput would skip it. Both are checked on the stock code,
            // before anything is inserted.
            val constructorName = "${constructor.definingClass}-><init>(${constructor.parameterTypes.joinToString("")})"
            val stock = constructor.instructions.toList()
            for ((index, _) in writes) {
                val field = ((stock[index] as ReferenceInstruction).reference as FieldReference).name
                val register = (stock[index] as TwoRegisterInstruction).registerA
                if (stock.drop(index + 1).any { register in it.registers() }) {
                    throw PatchException("$constructorName uses v$register after the $field write")
                }
                constructor.requireNoBranchTargetAt(index + 1, "forcing $field")
            }
            // Last first, so the earlier indices stay valid.
            writes.sortedByDescending { it.first }.forEach { (index, isShowFlag) ->
                // iput is format 22c: both registers already fit 4 bits.
                val iput = constructor.instructions[index] as TwoRegisterInstruction
                val value = "v${iput.registerA}"
                val instance = "v${iput.registerB}"
                if (isShowFlag) {
                    constructor.addInstructionsChecked(
                        index + 1,
                        """
                            const/4 $value, 0x1
                            iput-boolean $value, $instance, $MENU_BUILDER->$SHOW_ADDONS_IN_MENU:Z
                        """,
                    )
                    showWrites++
                } else {
                    constructor.addInstructionsChecked(
                        index + 1,
                        """
                            invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->managerCallback()$FUNCTION0
                            move-result-object $value
                            iput-object $value, $instance, $MENU_BUILDER->$ON_ADDONS_MANAGER_TAPPED:$FUNCTION0
                        """,
                    )
                    callbackWrites++
                }
            }
        }
        if (showWrites == 0 || callbackWrites == 0) {
            throw PatchException(
                "$PATCH_NAME: no $MENU_BUILDER constructor writes both $SHOW_ADDONS_IN_MENU " +
                    "($showWrites) and $ON_ADDONS_MANAGER_TAPPED ($callbackWrites)",
            )
        }

        // 4. Browser action popups: AC creates the private popup session but only hands it to a
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
