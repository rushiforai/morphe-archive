/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.fonts

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SYSTEM_FONT = "$EXTENSION_PACKAGE/misc/SystemFont;"
internal const val ANDROID_UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
internal const val GET_TYPEFACE = "$ANDROID_UTILITIES->getTypeface(Ljava/lang/String;)Landroid/graphics/Typeface;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val STRING = "Ljava/lang/String;"
private const val TYPEFACE_CACHE = "$ANDROID_UTILITIES->typefaceCache:Ljava/util/Hashtable;"
private const val CACHE_HAS = "Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z"
private const val FROM_ASSET = "Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;"
private const val BUILDER_FROM_ASSET = "Landroid/graphics/Typeface\$Builder;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V"

/** The bundled Roboto files the switch replaces, as Telegram names them. */
internal val ROBOTO_ASSETS = setOf("fonts/rmedium.ttf", "fonts/rmediumitalic.ttf", "fonts/ritalic.ttf",
    "fonts/rextrabold.ttf", "fonts/rcondensedbold.ttf", "fonts/rmono.ttf")

@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use system font",
    description = "Adds a switch, off by default, that draws Telegram's bold, italic and monospace text in your phone's font instead of the Roboto files built into the app. Regular text already uses the phone's font. Some number displays and Instant View pages keep Telegram's own. A change takes effect after Telegram restarts.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveSystemFont()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        site.insert(MutableMethod(ImmutableMethod.of(site.method)))
        site.insert(site.method)
        enableStatus("useSystemFont")
    }
}

/** AndroidUtilities.getTypeface, which takes the asset path in [asset]. */
internal class SystemFontSite(val method: MutableMethod, val asset: Int) {
    fun insert(target: MutableMethod) {
        val (result) = target.freeLocalsAt("Use system font", 0, 1, highest = 255)
        target.addInstructionsWithLabels(0, """
            invoke-static/range {v$asset .. v$asset}, $SYSTEM_FONT->typeface(Ljava/lang/String;)Landroid/graphics/Typeface;
            move-result-object v$result
            if-eqz v$result, :hush_stock
            return-object v$result
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }
}

/**
 * Telegram draws regular text in the phone's font and loads every other face it uses from its
 * assets through AndroidUtilities.getTypeface, which keys typefaceCache by the path and builds the
 * face from that same file. bold() and every screen that wants medium, italic, extra bold, condensed
 * or monospace text name the file there, so one hook at its start covers them. A null answer runs
 * Telegram's own path, cache included.
 */
internal fun BytecodePatchContext.resolveSystemFont(): SystemFontSite {
    requireStatusMethod("useSystemFont")
    controlHook(SYSTEM_FONT, "typeface", listOf(STRING), TYPEFACE)

    val owner = mutableClassDefByOrNull(ANDROID_UTILITIES)
    controlShape(owner != null, "AndroidUtilities is missing")
    val loader = owner!!.methods.filter { it.toString() == GET_TYPEFACE }.controlSingle("asset font loader")
    controlShape(AccessFlags.STATIC.isSet(loader.accessFlags), "the asset font loader is no longer static")
    val body = loader.controlBody()
    val asset = loader.localRegisterCount()

    // The path is the cache key and the file every load opens.
    val keyed = body.filter { it.controlRef() == CACHE_HAS }
    controlShape(body.any { it.controlRef() == TYPEFACE_CACHE } && keyed.isNotEmpty() &&
        keyed.all { it.namedRegisters().getOrNull(1) == asset }, "the asset font loader no longer caches by the path it's given")
    val loads = body.filter { it.controlRef() == BUILDER_FROM_ASSET || it.controlRef() == FROM_ASSET }
    controlShape(loads.isNotEmpty() && loads.all { it.namedRegisters().lastOrNull() == asset },
        "the asset font loader no longer opens the path it's given")

    // Every screen that names one of the Roboto files hands it to this loader.
    val strays = mutableListOf<String>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { method ->
            val methodBody = method.controlBody()
            if (methodBody.any { it.controlString() in ROBOTO_ASSETS } && methodBody.none { it.controlRef() == GET_TYPEFACE }) {
                strays += "${method.definingClass}->${method.name}"
            }
        }
    }
    controlShape(strays.isEmpty(), "a Roboto font is loaded outside getTypeface (${strays.take(3).joinToString()})")

    return SystemFontSite(loader, asset)
}
