/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.numbers

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
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val EXACT_NUMBERS = "$EXTENSION_PACKAGE/misc/ExactNumbers;"
internal const val LOCALE_CONTROLLER = "Lorg/telegram/messenger/LocaleController;"
internal const val SHORT_NUMBER = "$LOCALE_CONTROLLER->formatShortNumber(I[I)Ljava/lang/String;"

@Suppress("unused")
val exactNumbersPatch = bytecodePatch(
    name = "Exact numbers",
    description = "Adds a switch, off by default, that shows member, subscriber, view, reply and reaction counts in full, like 12,345 instead of 12.3K.",
    default = true,
) {
    category("Chats")
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

/** LocaleController.formatShortNumber, which takes the count and the rounded-count array from [first]. */
internal class ExactNumbersSite(val method: MutableMethod, val first: Int) {
    fun insert(target: MutableMethod) {
        val (result) = target.freeLocalsAt("Exact numbers", 0, 1, highest = 255)
        target.addInstructionsWithLabels(0, """
            invoke-static/range {v$first .. v${first + 1}}, $EXACT_NUMBERS->format(I[I)Ljava/lang/String;
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

    val owner = mutableClassDefByOrNull(LOCALE_CONTROLLER)
    controlShape(owner != null, "LocaleController is missing")
    val method = owner!!.methods.filter { it.toString() == SHORT_NUMBER }.controlSingle("short number formatter")
    controlShape(AccessFlags.STATIC.isSet(method.accessFlags), "the short number formatter is no longer static")
    val body = method.controlBody()
    // It still shortens: thousands become K.
    controlShape(body.any { it.controlString() == "K" } &&
        body.any { it.controlRef() == "Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;" },
        "the short number formatter no longer writes K")
    return ExactNumbersSite(method, method.localRegisterCount())
}
