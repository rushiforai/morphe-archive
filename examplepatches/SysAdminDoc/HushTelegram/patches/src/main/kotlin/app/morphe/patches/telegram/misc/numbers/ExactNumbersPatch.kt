/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.numbers

import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.addInstructionsWithLabels
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
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EXACT_NUMBERS = "$EXTENSION_PACKAGE/misc/ExactNumbers;"
internal const val LOCALE_CONTROLLER = "Lorg/telegram/messenger/LocaleController;"
internal const val SHORT_NUMBER = "$LOCALE_CONTROLLER->formatShortNumber(I[I)Ljava/lang/String;"

@Suppress("unused")
val exactNumbersPatch = bytecodePatch(
    name = "Exact numbers",
    description = "Shows member, subscriber, view, reply and reaction counts in full, like 12,345 instead of 12.3K. " +
        "Starts off. Turn it on in HushTelegram settings > Look and feel.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveExactNumbers()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        site.insert(MutableMethod(ImmutableMethod.of(site.method)))
        site.insert(site.method)
        enableStatus("exactNumbers")
    }
}

/**
 * LocaleController.formatShortNumber, which takes the count in [count] and the rounded-count array
 * in [array]. 13.2 takes them the other way round, so the hook names each one.
 */
internal class ExactNumbersSite(val method: MutableMethod, val count: Int, val array: Int) {
    fun insert(target: MutableMethod) {
        val (result) = target.freeLocalsAt("Exact numbers", 0, 1, highest = 255)
        val call = if (array == count + 1) "invoke-static/range {v$count .. v$array}" else "invoke-static {v$count, v$array}"
        target.addInstructionsWithLabels(0, """
            $call, $EXACT_NUMBERS->format(I[I)Ljava/lang/String;
            move-result-object v$result
            if-eqz v$result, :hush_stock
            return-object v$result
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }
}

/**
 * Telegram writes every shortened count (members, subscribers, bot users, views, replies, reactions
 * and limit previews) through LocaleController.formatShortNumber, and nothing else goes through it.
 * A null answer runs Telegram's own path.
 */
internal fun BytecodePatchContext.resolveExactNumbers(): ExactNumbersSite {
    requireStatusMethod("exactNumbers")
    controlHook(EXACT_NUMBERS, "format", listOf("I", "[I"), "Ljava/lang/String;")

    val owner = tgMutableClassDefByOrNull(LOCALE_CONTROLLER)
    controlShape(owner != null, "LocaleController is missing")
    val method = owner!!.methods.filter { it.isShortNumber() }.controlSingle("short number formatter")
    controlShape(AccessFlags.STATIC.isSet(method.accessFlags), "the short number formatter is no longer static")
    val body = method.controlBody()
    // It still shortens: thousands become K.
    controlShape(body.any { it.controlString() == "K" } &&
        body.any { it.controlRef() == "Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;" },
        "the short number formatter no longer writes K")
    val first = method.localRegisterCount()
    val types = method.origParameterTypes
    val count = first + types.indexOf("I")
    val array = first + types.indexOf("[I")
    controlShape(array == count + 1 || maxOf(count, array) <= 15, "the short number formatter's count and array are out of a call's reach")
    return ExactNumbersSite(method, count, array)
}

/**
 * LocaleController.formatShortNumber(int, int[]). 13.2 renamed it and swapped its parameters, so it's
 * matched by its source name and the two types in either order.
 */
internal fun MethodReference.isShortNumber() = origDefiningClass == LOCALE_CONTROLLER && origName == "formatShortNumber" &&
    returnType == "Ljava/lang/String;" && parameterTypes.map { it.toString() }.sorted() == listOf("I", "[I")
