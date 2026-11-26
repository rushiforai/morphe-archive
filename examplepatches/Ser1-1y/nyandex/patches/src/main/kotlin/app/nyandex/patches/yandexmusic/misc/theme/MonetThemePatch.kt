/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import app.nyandex.patches.yandexmusic.util.mutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicMonetTheme")

/**
 * The app keeps a day and a night value for every themed color (`bg_primary_day`,
 * `bg_primary_night`, …) and picks one itself from its Light / Dark / System setting. Both are
 * remapped to the matching tones of Android's dynamic (Material You) palettes, so the theme
 * setting keeps working and only the colors change.
 *
 * Tones follow Material 3: light cards use neutral 10/50/100 with accent 600 as primary and white
 * on it; dark cards use neutral 800/700 with accent 200 as primary and accent 800 on it. The page
 * background stays stock (black / white). Translucent overlays (fills, fades, placeholders), status
 * colors (like, success, error), the Yandex logo and Plus branding keep their stock values too.
 */
internal val MONET_COLORS = linkedMapOf(
    // Cards and secondary surfaces. The page background (bg_primary, ui_kit_surface_one) stays
    // stock black / white.
    "bg_secondary_day" to "system_neutral2_50",
    "bg_secondary_night" to "system_neutral2_800",
    "ui_kit_surface_two_day" to "system_neutral2_50",
    "ui_kit_surface_two_night" to "system_neutral2_800",
    "ui_kit_surface_three_day" to "system_neutral2_10",
    "ui_kit_surface_three_night" to "system_neutral2_700",
    "ui_kit_surface_four_day" to "system_neutral2_100",
    "ui_kit_surface_four_night" to "system_neutral2_800",
    "ui_kit_button_extra_one_day" to "system_neutral2_10",
    "ui_kit_button_extra_one_night" to "system_neutral2_800",

    // Accent: the yellow primary button, accent icons and accent text.
    "button_primary_day" to "system_accent1_600",
    "button_primary_night" to "system_accent1_200",
    "button_primary_pressed_day" to "system_accent1_700",
    "button_primary_pressed_night" to "system_accent1_300",
    "icon_accent_day" to "system_accent1_600",
    "icon_accent_night" to "system_accent1_200",
    "text_accent_day" to "system_accent1_600",
    "text_accent_night" to "system_accent1_200",
    "text_feature_night" to "system_accent1_200",

    // Content drawn on the primary button.
    "text_on_primary_button_day" to "system_accent1_0",
    "text_on_primary_button_night" to "system_accent1_800",
    "icon_on_primary_button_day" to "system_accent1_0",
    "icon_on_primary_button_night" to "system_accent1_800",
)

val monetThemePatch = patch(
    name = "Тема Monet",
    description = "(Android 12+) Окрашивает большУю часть элементов интерфейсов в цвета Material You, генерируемые из Ваших обоев.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    extendWith("extensions/monet.mpe")

    execute {
        hookWaveButtonColors()
        useAccentForThemeLogoColor()

        // The stock values must exist; otherwise this build uses different color names.
        resourceXml("res/values/colors.xml").use { colors ->
            val missing = MONET_COLORS.keys.filter { name -> colors.resourceOrNull(name) == null }
            if (missing.isNotEmpty()) throw PatchException("Unknown color resources: $missing")
        }

        // Dynamic system colors exist from Android 12 (API 31), so the overrides live in
        // values-v31; older devices keep reading res/values.
        resourceXml("res/values-v31/colors.xml", copy = false).use { colors ->
            MONET_COLORS.forEach { (name, systemColor) ->
                colors.root.appendChild("color") {
                    setAttribute("name", name)
                    text = "@android:color/$systemColor"
                }
            }
        }

        logger.info("Mapped ${MONET_COLORS.size} colors to dynamic system colors")
    }
}

private const val MONET_COLORS_CLASS = "Lapp/nyandex/extension/yandexmusic/monet/MonetColors;"

/**
 * My Vibe buttons ("Встряхнуть Мою волну", "Добавить энергии", "В стиле артиста …") come from the
 * server as agents: an animation, a cover with a color, and an entity type. The mapper from the
 * agent DTO (`rsn.A(ps)` in 2026.11.2) reads `agent.getCover().getColor()`; the color is handed to
 * the extension right after it is read, which keeps it for artists and returns a Monet accent for
 * every other button.
 */
private fun hookWaveButtonColors() {
    // The agent DTO: Gson fields "animationUri", "cover" and "entity" (getters are renamed by R8).
    var agentType: String? = null
    classDefForEach { classDef ->
        val names = classDef.fields.flatMap { field ->
            field.annotations.filter { it.type == "Lcom/google/gson/annotations/SerializedName;" }
                .flatMap { annotation ->
                    annotation.elements.mapNotNull { (it.value as? StringEncodedValue)?.value }
                }
        }
        if (names.containsAll(listOf("animationUri", "cover", "entity"))) {
            if (agentType != null) throw PatchException("More than one My Vibe agent DTO")
            agentType = classDef.type
        }
    }
    val agent = agentType ?: throw PatchException("My Vibe agent DTO was not found")

    // The mapper: a static method taking only the agent that builds the cover model
    // `new Cover(uri, color, …)` from it.
    var found: Pair<String, Method>? = null
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags) ||
                method.parameterTypes.map(Any::toString) != listOf(agent)
            ) {
                return@forEach
            }
            if (method.coverConstructorIndex() >= 0) {
                if (found != null) throw PatchException("More than one My Vibe agent mapper")
                found = classDef.type to method
            }
        }
    }
    val (ownerType, original) = found ?: throw PatchException("My Vibe agent mapper was not found")

    val method = mutableMethodOf(ownerType, original)
    val instructions = method.implementation!!.instructions.toList()
    val constructor = instructions[method.coverConstructorIndex()] as FiveRegisterInstruction
    val colorRegister = constructor.registerE // (this, uri, color, …)

    // Right after the color is read: the last move-result-object into its register.
    val moveResultIndex = (method.coverConstructorIndex() - 1 downTo 0).firstOrNull { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.MOVE_RESULT_OBJECT &&
            (instruction as OneRegisterInstruction).registerA == colorRegister
    } ?: throw PatchException("The agent color is not read into a register")
    val agentRegister = method.implementation!!.registerCount - 1 // p0 of the static method
    if (colorRegister > 15 || agentRegister > 15) {
        throw PatchException("Agent mapper registers are too high: v$colorRegister, v$agentRegister")
    }

    method.addInstructions(
        moveResultIndex + 1,
        """
            invoke-static {v$colorRegister, v$agentRegister}, $MONET_COLORS_CLASS->waveButtonColor(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v$colorRegister
        """,
    )
    logger.info("Hooked My Vibe button colors in $ownerType.${method.name} (agent $agent)")
}

/**
 * The Compose theme (`o2u.j(Z, Composer)` in 2026.11.2) has an icon color read from
 * `icon_logo_day` / `icon_logo_night`, but the app uses it as its accent: the full player's
 * play / pause button (a filled circle with the symbol cut out), the My Shelf play button, the
 * chart crown and other highlights. The real Yandex Music logo reads `icon_logo_*` directly and is
 * not affected.
 *
 * The theme builder is switched to `icon_accent_day` / `icon_accent_night`, which are Monet colors
 * on Android 12+. Their stock values equal the logo ones, so older Android versions look the same.
 */
private fun useAccentForThemeLogoColor() {
    fun color(name: String) = resourceId(ResourceType.COLOR, name)
    val replacements = mapOf(
        color("icon_logo_day") to color("icon_accent_day"),
        color("icon_logo_night") to color("icon_accent_night"),
    )
    // The builder reads every theme color; these guard against matching anything else.
    val required = replacements.keys + replacements.values + listOf(
        color("button_primary_day"),
        color("button_primary_disabled_day"),
        color("bg_placeholder_day"),
    )

    var found: Pair<String, Method>? = null
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
            val literals = method.implementation?.instructions
                ?.mapNotNullTo(mutableSetOf()) { (it as? WideLiteralInstruction)?.wideLiteral }
                ?: return@forEach
            if (literals.containsAll(required)) {
                if (found != null) throw PatchException("More than one Compose theme color builder")
                found = classDef.type to method
            }
        }
    }
    val (ownerType, original) = found ?: throw PatchException("Compose theme color builder was not found")

    val method = mutableMethodOf(ownerType, original)
    var replaced = 0
    method.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
        if (instruction.opcode != Opcode.CONST) return@forEachIndexed
        val accent = replacements[(instruction as WideLiteralInstruction).wideLiteral] ?: return@forEachIndexed
        val register = (instruction as OneRegisterInstruction).registerA
        // Same format and size (const vAA, #+BBBBBBBB): no offsets move.
        method.replaceInstruction(index, "const v$register, 0x${accent.toString(16)}")
        replaced++
    }
    if (replaced != replacements.size) {
        throw PatchException("Expected ${replacements.size} logo color constants in the theme, found $replaced")
    }
    logger.info("Theme logo color now follows icon_accent in $ownerType.${method.name}")
}

/** Index of `invoke-direct {this, uri, color, …}, Cover.<init>(String, String, …)`, or -1. */
private fun Method.coverConstructorIndex(): Int =
    implementation?.instructions?.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_DIRECT && reference?.name == "<init>" &&
            reference.parameterTypes.size >= 2 &&
            reference.parameterTypes[0].toString() == "Ljava/lang/String;" &&
            reference.parameterTypes[1].toString() == "Ljava/lang/String;"
    } ?: -1
