package app.template.patches.fotmob.misc.font

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobActivityHooksPatch
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalGate
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

// The system font values FotMob itself uses in the base theme (values/styles.xml) and for
// Burmese (values-my-v26/styles.xml), where Roboto Flex is never used.
private val SYSTEM_THEME_FONTS = mapOf(
    "font_regular" to "sans-serif",
    "font_medium" to "sans-serif-medium",
    "font_semi_bold" to "sans-serif-medium",
    "font_extra_bold" to "sans-serif-black",
    "nativeAdBodyFont" to "sans-serif",
    "nativeAdTitleFont" to "sans-serif-medium",
)

/** The single <style name="[name]"> of [path], failing loudly when it is missing or duplicated. */
private fun org.w3c.dom.Document.style(path: String, name: String): Element {
    val styles = getElementsByTagName("style")
    val matches = (0 until styles.length)
        .mapNotNull { styles.item(it) as? Element }
        .filter { it.getAttribute("name") == name }
    return matches.singleOrNull()
        ?: throw PatchException("$path: expected one style \"$name\", found ${matches.size}")
}

/** The overlay style names the resource step adds (read by SystemFontPatch.applyTheme by name). */
internal const val SYSTEM_FONT_OVERLAY = "HevalSystemFontOverlay"
internal const val SYSTEM_FONT_SWITCH = "HevalSystemFontSwitch"
internal const val SYSTEM_FONT_SWITCH_TEXT = "HevalSystemFontSwitchText"

private fun org.w3c.dom.Document.addStyle(name: String, parent: String?, items: Map<String, String>) {
    val resources = documentElement ?: throw PatchException("styles.xml has no root element")
    val style = createElement("style").apply {
        setAttribute("name", name)
        if (parent != null) setAttribute("parent", parent)
    }
    items.forEach { (item, value) ->
        style.appendChild(createElement("item").apply { setAttribute("name", item); textContent = value })
    }
    resources.appendChild(style)
}

// XML Views. The API 26+ theme points the font theme attributes at the Roboto Flex font families,
// and the switch text appearance names its font directly. So that the stock theme stays untouched
// while the Patch settings switch is off, nothing is changed in place: three new styles hold the
// system values (the families FotMob's base and Burmese themes use), and the extension applies the
// overlay to each activity's theme while the feature is on (ActivityHooks.onActivityCreated).
// 2026-11-03: was an in-place edit of Base.Theme.FotMob.V26 and TextAppearance.FotMob.Switch.
private val useSystemFontResourcePatch = resourcePatch(
    description = "Adds a system font theme overlay.",
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        val themePath = "res/values-v26/styles.xml"
        val basePath = "res/values/styles.xml"
        decode(themePath, basePath)

        // The styles the overlay replaces must still be there (loud failure on a theme rework).
        document(themePath).use { doc ->
            val theme = doc.style(themePath, "Base.Theme.FotMob.V26")
            val items = theme.getElementsByTagName("item")
            val names = (0 until items.length).map { (items.item(it) as Element).getAttribute("name") }.toSet()
            val missing = SYSTEM_THEME_FONTS.keys - names
            if (missing.isNotEmpty()) throw PatchException("$themePath: Base.Theme.FotMob.V26 has no $missing items")
        }
        document(basePath).use { doc ->
            doc.style(basePath, "TextAppearance.FotMob.Switch")
            doc.style(basePath, "Widget.FotMob.Switch")
            val styles = doc.getElementsByTagName("style")
            val existing = (0 until styles.length).map { (styles.item(it) as Element).getAttribute("name") }
            if (existing.any { it == SYSTEM_FONT_OVERLAY }) return@use
            doc.addStyle(
                SYSTEM_FONT_SWITCH_TEXT,
                "@style/TextAppearance.FotMob.Switch",
                mapOf("android:fontFamily" to "sans-serif-medium", "fontFamily" to "sans-serif-medium"),
            )
            doc.addStyle(
                SYSTEM_FONT_SWITCH,
                "@style/Widget.FotMob.Switch",
                mapOf("android:textAppearance" to "@style/$SYSTEM_FONT_SWITCH_TEXT"),
            )
            doc.addStyle(
                SYSTEM_FONT_OVERLAY,
                null,
                SYSTEM_THEME_FONTS + ("materialSwitchStyle" to "@style/$SYSTEM_FONT_SWITCH"),
            )
        }
    }
}

internal val USE_SYSTEM_FONT = HevalFeature(
    id = "fotmob.use_system_font",
    name = "Use system font",
    description = "Uses the system font instead of the app's own font.",
    category = FotMobControlsCategory.DISPLAY,
    restartRequired = true,
)

// A Patch settings feature (2026-11-03): every step below answers the stock value while it is off
// (the extension checks the switch itself). Restart required: the Compose flag is read once, in a
// static initializer, and the theme overlay applies to newly created screens.
@Suppress("unused")
val useSystemFontPatch = fotMobControls.featurePatch(
    USE_SYSTEM_FONT,
    default = false,
    dependencies = setOf(useSystemFontResourcePatch, fotMobActivityHooksPatch),
) {
    classDefBy(EXTENSION_CLASS)

    // Validate every site before the first edit.
    val flagMethod = AppFontFlagFingerprint.method
    val storeIndex = AppFontFlagFingerprint.instructionMatches.last().index
    val flag = flagMethod.getInstruction<ReferenceInstruction>(storeIndex).reference as FieldReference
    if (flag.definingClass != flagMethod.definingClass || flag.type != "Z") {
        throw PatchException("FotMob font flag: the store after the \"my\" check writes $flag, not a boolean of ${flagMethod.definingClass}")
    }
    val flagRegister = flagMethod.getInstruction<OneRegisterInstruction>(storeIndex).registerA
    val loader = TypefaceLoaderFingerprint.method
    val composeFactory = ComposePlatformTypefaceFingerprint.method

    // 1. Compose: the font holder's static flag (app font allowed) is stored as false while the
    // feature is on, so the typography, the weight mapping and the splash tagline take FotMob's
    // own system font path. Both branches jump to the store, so the value goes through the helper
    // at the store's label.
    val helper = mutableClassDefBy(flagMethod.definingClass).addHevalValueHelper(
        USE_SYSTEM_FONT.id, "morpheUseSystemFont", "Z",
    ) { v -> "const/4 $v, 0x0\nreturn $v" }
    flagMethod.filterThroughHevalHelper(storeIndex, flagRegister, helper)

    // 2. Code-set Views: while on, the Typeface loader skips the font resource and returns the
    // system family its caller passes ("sans-serif", "sans-serif-medium") in the requested style,
    // mapped to the device font. The /range form keeps the call valid whatever register p2 lands on.
    loader.addHevalGate(USE_SYSTEM_FONT.id) { v ->
        """
            invoke-static/range {p2 .. p3}, $EXTENSION_CREATE
            move-result-object $v
            return-object $v
        """
    }

    // 3. Compose: FontFamily.Default reaches the platform factory as a null name and would become
    // Typeface.DEFAULT (Roboto). With a device UI font (and the feature on) the extension turns it
    // into "sans-serif", which step 4 maps; the factory still applies the weight and italic.
    composeFactory.addInstructionsChecked(
        0,
        """
            invoke-static {p0}, $EXTENSION_COMPOSE_FAMILY
            move-result-object p0
        """,
    )

    // 4. Every Typeface.create(String, int) in the app goes through the extension, which maps
    // "sans-serif" / "sans-serif-medium" / "sans-serif-black" to the device UI font while the
    // feature is on and calls through otherwise. That is how XML Views get it: AppCompat's text
    // helper resolves the overlay's fontFamily names with this call, as do Compose (step 3) and the
    // loader (step 2).
    val redirected = redirectTypefaceCreate()
    if (redirected == 0) throw PatchException("FotMob font: no Typeface.create(String, int) call found")
}

private const val EXTENSION_PACKAGE = "Lapp/template/extension/fotmob/"
private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}SystemFontPatch;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val EXTENSION_CREATE = "$EXTENSION_CLASS->create(Ljava/lang/String;I)$TYPEFACE"
private const val EXTENSION_COMPOSE_FAMILY = "$EXTENSION_CLASS->composeFamily(Ljava/lang/String;)Ljava/lang/String;"

private fun Instruction.isTypefaceCreateByName(): Boolean {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return false
    val ref = (this as ReferenceInstruction).reference as MethodReference
    return ref.definingClass == TYPEFACE && ref.name == "create" && ref.returnType == TYPEFACE &&
        ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I")
}

/** Redirects every app-dex Typeface.create(String, int) into the extension; returns the count. */
private fun BytecodePatchContext.redirectTypefaceCreate(): Int {
    val targets = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        // Never the extension itself: its own fallback call would recurse.
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        if (classDef.methods.any { m -> m.implementation?.instructions?.any { it.isTypefaceCreateByName() } == true }) {
            targets += classDef
        }
    }
    var count = 0
    for (classDef in targets) {
        for (method in mutableClassDefBy(classDef).methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            instructions.forEachIndexed { index, instruction ->
                if (!instruction.isTypefaceCreateByName()) return@forEachIndexed
                // Same arguments, same order: only the target changes, so no index shifts.
                val smali = when (instruction) {
                    is RegisterRangeInstruction -> {
                        val last = instruction.startRegister + instruction.registerCount - 1
                        "invoke-static/range { v${instruction.startRegister} .. v$last }, $EXTENSION_CREATE"
                    }
                    is FiveRegisterInstruction ->
                        "invoke-static { v${instruction.registerC}, v${instruction.registerD} }, $EXTENSION_CREATE"
                    else -> throw PatchException("Unexpected invoke format ${instruction.opcode}")
                }
                method.replaceInstruction(index, smali)
                count++
            }
        }
    }
    return count
}
