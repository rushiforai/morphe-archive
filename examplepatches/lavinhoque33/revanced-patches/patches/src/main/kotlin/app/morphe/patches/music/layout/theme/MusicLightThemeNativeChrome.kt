/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 * Written by lavinhoque33, 2026-11-25
 */

package app.morphe.patches.music.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patches.music.flyoutmenu.components.menuItemFingerprint
import app.morphe.patches.music.flyoutmenu.components.menuItemIconFingerprint
import app.morphe.patches.music.utils.extension.Constants.UTILS_PATH
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.getResourceId
import app.morphe.patches.shared.mapping.resourceLiteral
import app.morphe.util.Utils.printWarn
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.fingerprint.matchOrNull
import app.morphe.util.indexOfFirstLiteralInstruction
import app.morphe.util.insertLiteralOverride
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SETTINGS_ACTIVITY = "Lcom/google/android/apps/youtube/music/settings/SettingsCompatActivity;"
private const val STRING_TYPE = "Ljava/lang/String;"
private const val URI_TYPE = "Landroid/net/Uri;"
private const val CONTEXT_TYPE = "Landroid/content/Context;"

/** The native presenters bypass the XML colors for Settings, browse chrome, and in-app sheets. */
internal fun BytecodePatchContext.installMusicLightNativeChromeHooks() {
    val settings = mutableClassDefByOrNull(SETTINGS_ACTIVITY)?.methods?.singleOrNull {
        it.name == "onCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;")
    }
    val upColor = getResourceId(ResourceType.COLOR, "ytm_icon_color_active")
    if (settings != null && upColor >= 0) {
        val index = settings.indexOfFirstLiteralInstruction(upColor)
        if (index >= 0 && settings.getInstruction(index + 1).getReference<MethodReference>()?.name == "getColor") {
            settings.insertLiteralOverride(index, "$MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->settingsBackColor(I)I")
        }
    }

    // Preserve white-at-70% over media. Only substitute it where these native constructors
    // use it for text beside or below artwork, including Search's recent carousel.
    for (layout in listOf("music_two_column_item", "music_two_row_item", "music_carousel_shelf_basic_header")) {
        Fingerprint(
            name = "<init>",
            filters = listOf(
                resourceLiteral(ResourceType.LAYOUT, layout),
                resourceLiteral(ResourceType.COLOR, "yt_white1_opacity70"),
            ),
        ).matchAllOrNull().orEmpty().forEach { match ->
            val color = match.instructionMatches.last()
            val register = (color.instruction as OneRegisterInstruction).registerA
            match.method.addInstructions(
                color.index + 1,
                """
                    invoke-static/range {v$register .. v$register}, $MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->listRowSecondaryResource(I)I
                    move-result v$register
                """,
            )
        }
    }

    installMusicLightFlyoutIcons()
    installMusicLightShareGlyphs()
}

private fun BytecodePatchContext.installMusicLightFlyoutIcons() {
    val binder = menuItemIconFingerprint.matchOrNull(menuItemFingerprint)?.method
    val instructions = binder?.implementation?.instructions
    val active = getResourceId(ResourceType.COLOR, "ytm_icon_color_active")
    val idle = getResourceId(ResourceType.COLOR, "ytm_icon_color_idle")
    if (binder == null || instructions == null || active < 0 || idle < 0) {
        printWarn("Music light theme: the native flyout row icon binder is unavailable.")
        return
    }

    // The 9.44+ presenter splits this binding out of the builder. Both stock shapes use
    // the same active/idle resource pair and apply a color filter that wins over XML tint.
    val activeIndex = binder.indexOfFirstLiteralInstruction(active)
    val idleIndex = binder.indexOfFirstLiteralInstruction(idle)
    val lookupIndex = maxOf(activeIndex, idleIndex) + 1
    val lookup = instructions.getOrNull(lookupIndex) as? FiveRegisterInstruction
    val filter = instructions.getOrNull(lookupIndex + 3)?.getReference<MethodReference>()
    if (minOf(activeIndex, idleIndex) < 0 || lookup == null || lookup.opcode != Opcode.INVOKE_VIRTUAL ||
        lookup.getReference<MethodReference>()?.toString() != "Landroid/content/Context;->getColor(I)I" ||
        filter?.toString() != "Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff\$Mode;)V"
    ) {
        printWarn("Music light theme: the native flyout row icon color has an unrecognized binding.")
        return
    }

    val color = lookup.registerD
    binder.addInstructionsAtControlFlowLabel(
        lookupIndex,
        """
            invoke-static/range {v$color .. v$color}, $MUSIC_LIGHT_THEME_CLASS_DESCRIPTOR->flyoutIconResource(I)I
            move-result v$color
        """,
    )
}

private fun BytecodePatchContext.installMusicLightShareGlyphs() {
    val glideImage = Fingerprint(name = "<init>", strings = listOf("GlideImage"))
        .matchAllOrNull()?.singleOrNull()?.classDef
    val resolver = glideImage?.methods?.asSequence().orEmpty()
        .flatMap { it.implementation?.instructions?.asSequence().orEmpty() }
        .filter { it.opcode == Opcode.INVOKE_STATIC_RANGE || it.opcode == Opcode.INVOKE_STATIC }
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.isGlideImageResolver() }
        .distinct()
        .singleOrNull()
        ?.let { call ->
            mutableClassDefByOrNull(call.definingClass)?.methods?.singleOrNull {
                it.name == call.name && it.parameterTypes == call.parameterTypes && it.returnType == call.returnType
            }
        }
    val site = resolver?.let { method ->
        val instructions = method.implementation?.instructions.orEmpty()
        instructions.indices.mapNotNull { index ->
            instructions.shareGlyphUrlRegister(index, method.definingClass)?.let { index to it }
        }.singleOrNull()
    }
    if (resolver == null || site == null) {
        printWarn("Music light theme: the scalable Share action image source binder is unavailable.")
        return
    }

    // The first-party rows are Elements images, not the legacy sharing_option_button layout.
    // Swap only their exact baked monochrome sources before Glide builds the request.
    val (index, url) = site
    val select = "$UTILS_PATH/MusicLightShareGlyphs;->selectSource($STRING_TYPE)$STRING_TYPE"
    resolver.addInstructionsAtControlFlowLabel(
        index,
        """
            invoke-static/range {v$url .. v$url}, $select
            move-result-object v$url
        """,
    )
}

private fun MethodReference.isGlideImageResolver(): Boolean {
    // Older callers start with Context; newer callers pass the Glide request manager first.
    val context = parameterTypes.indexOf(CONTEXT_TYPE)
    if (context !in 0..1 || !returnType.startsWith("L")) return false

    val image = parameterTypes.getOrNull(context + 1) ?: return false
    return image.startsWith("L") && image == parameterTypes.getOrNull(context + 2) &&
        image == parameterTypes.getOrNull(context + 3) &&
        parameterTypes.getOrNull(context + 5) == "I" && parameterTypes.getOrNull(context + 6) == "I"
}

private fun List<Instruction>.shareGlyphUrlRegister(index: Int, owner: String): Int? {
    val parse = this[index] as? FiveRegisterInstruction ?: return null
    if (parse.opcode != Opcode.INVOKE_STATIC || parse.registerCount != 1) return null
    val parseUri = parse.getReference<MethodReference>() ?: return null
    if (parseUri.definingClass != owner || parseUri.parameterTypes != listOf(STRING_TYPE) ||
        parseUri.returnType != URI_TYPE
    ) return null

    val getUrl = getOrNull(index - 2)?.takeIf { it.opcode == Opcode.INVOKE_INTERFACE }
        ?.getReference<MethodReference>() ?: return null
    val url = getOrNull(index - 1) as? OneRegisterInstruction ?: return null
    val uri = getOrNull(index + 1) as? OneRegisterInstruction ?: return null
    if (getUrl.parameterTypes.isNotEmpty() || getUrl.returnType != STRING_TYPE ||
        url.opcode != Opcode.MOVE_RESULT_OBJECT || url.registerA != parse.registerC ||
        uri.opcode != Opcode.MOVE_RESULT_OBJECT
    ) return null

    // The intervening request-manager lookup is longer on Music 9.15.
    val loadsUri = (index + 4..index + 10).any { loadIndex ->
        val load = getOrNull(loadIndex) as? FiveRegisterInstruction ?: return@any false
        val target = load.getReference<MethodReference>() ?: return@any false
        load.opcode == Opcode.INVOKE_VIRTUAL && load.registerCount == 2 && load.registerD == uri.registerA &&
            target.parameterTypes == listOf(URI_TYPE) && target.returnType == target.definingClass
    }
    return url.registerA.takeIf { loadsUri }
}
