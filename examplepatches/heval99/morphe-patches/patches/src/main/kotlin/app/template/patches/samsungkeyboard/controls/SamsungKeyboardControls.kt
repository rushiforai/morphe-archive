package app.template.patches.samsungkeyboard.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.template.patches.samsungkeyboard.misc.SAMSUNG_KEYBOARD_EXTENSION
import app.template.patches.shared.Constants.COMPATIBILITY_SAMSUNG_KEYBOARD
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.hevalControlsPatch

internal const val SAMSUNG_CONTROLS_PACKAGE = "Lapp/template/extension/samsungkeyboard/controls/"
internal const val SAMSUNG_CONTROLS_ENTRY = "${SAMSUNG_CONTROLS_PACKAGE}HevalControlsEntry;"

/**
 * Categories of the Samsung Keyboard features, in the order a full patch set usually registers them. Ready for the
 * existing patches to be converted: clipboard (history size, columns), typing and gestures (swipe cursor, one-handed,
 * key vibration, autofill, swipe down to dismiss), toolbar (item count), privacy (incognito) and appearance.
 */
internal object SamsungKeyboardControlsCategory {
    const val CLIPBOARD = "Clipboard"
    const val TYPING = "Typing & gestures"
    const val TOOLBAR = "Toolbar"
    const val PRIVACY = "Privacy"
    const val APPEARANCE = "Appearance"
}

/**
 * The switches of a number choice (clipboard size, columns, toolbar items): one switch per value, id `<idPrefix><value>`,
 * all sharing the [choice] title so Patch settings shows one row ("Normal" plus one entry per value). [selected] is the
 * value the Manager option picked and starts on; "Normal" (every switch off) is the keyboard's own behaviour. The Java
 * side that reads them is `controls/Choices.java`, which must list the same ids and values.
 */
internal fun choiceFeatures(
    idPrefix: String,
    choice: String,
    category: String,
    values: List<Int>,
    selected: Int,
    restartRequired: Boolean,
    icon: String,
    name: (Int) -> String,
    description: (Int) -> String,
): List<HevalFeature> {
    require(selected in values) { "$selected is not one of $values" }
    return values.map { value ->
        HevalFeature(
            id = "$idPrefix$value",
            name = name(value),
            description = description(value),
            category = category,
            default = value == selected,
            restartRequired = restartRequired,
            icon = icon,
            choice = choice,
        )
    }
}

/** v0 must be a local register, free at method entry (nothing is live before the parameters are read). */
internal fun MutableMethod.requireLocal() {
    val locals = (implementation?.registerCount ?: 0) - parameterTypes.size - 1
    if (locals < 1) throw PatchException("$definingClass->$name has no free local register")
}

/**
 * The in-app entry point: a "Patch settings" item in the overflow menu of the keyboard's settings pages
 * (HoneyBoardSettingsFragment). It is part of the "Patch settings" patch, so the screen can always be reached.
 */
private val samsungKeyboardControlsEntryPatch = bytecodePatch(
    description = "Adds a \"Patch settings\" item to Samsung Keyboard's settings menu.",
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_KEYBOARD)

    extendWith(SAMSUNG_KEYBOARD_EXTENSION)

    execute {
        classDefBy("${SAMSUNG_CONTROLS_PACKAGE}HevalControlsEntry;")

        // 1. The menu builder: add the item (p0 = fragment, v0 is free: 6 registers, 3 parameters).
        val menu = SettingsOptionsMenuFingerprint.method
        menu.requireLocal()
        menu.addInstructionsChecked(
            0,
            """
                invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-static {v0, p1}, $SAMSUNG_CONTROLS_ENTRY->addItem(Landroid/content/Context;Landroid/view/Menu;)V
            """,
        )

        // 2. The click handler: our item is handled here, every other item goes on to the stock code.
        val click = SettingsOptionsItemFingerprint.method
        click.requireLocal()
        click.addInstructionsWithLabelsChecked(
            0,
            """
                invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;
                move-result-object v0
                invoke-static {v0, p1}, $SAMSUNG_CONTROLS_ENTRY->handles(Landroid/content/Context;Landroid/view/MenuItem;)Z
                move-result v0
                if-eqz v0, :morphe_stock
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("morphe_stock", click.getInstruction(0)),
        )
    }
}

/** The Samsung Keyboard Heval Controls host; its feature patches are in `controls/` and the converted ones in `features/`, `privacy/` and `gifs/`. */
internal val samsungKeyboardControls = hevalControlsPatch(
    COMPATIBILITY_SAMSUNG_KEYBOARD,
    dependencies = setOf(samsungKeyboardControlsEntryPatch),
)

// Expose the host patch, so Manager lists "Patch settings".
@Suppress("unused")
val samsungKeyboardHevalControlsPatch = samsungKeyboardControls.patch
