/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

internal const val APP_ICONS = "$EXTENSION_PACKAGE/misc/AppIcons;"
internal const val ICON_PREMIUM = "$APP_ICONS->premium(I)Z"
internal const val PREMIUM_ON_ACCOUNTS = "Lorg/telegram/messenger/UserConfig;->hasPremiumOnAccounts()Z"
// The launcher aliases Telegram's icon enum names in its static initializer; no other class loads them.
private val ICON_KEYS = listOf("VintageIcon", "NoxIcon")

/**
 * The App Icon list's Premium flag ([flag], as a field reference) and the methods that weigh it
 * against Premium ([readers]), or [missing], why this build can't have the switch. Nothing in the
 * app changes until [apply].
 */
internal class PremiumIconsPlan(
    private val flag: String,
    private val readers: List<MutableMethod>,
    val missing: String?,
) {
    fun apply() {
        if (missing != null) return
        // Read again here, and later places first: an earlier edit in the same method moves indexes.
        readers.forEach { method ->
            method.flagReads(flag).sortedDescending().forEach { index ->
                val register = (method.controlBody()[index] as TwoRegisterInstruction).registerA
                method.addInstructions(index + 1, "invoke-static/range {v$register .. v$register}, $ICON_PREMIUM\n" +
                    "move-result v$register")
            }
        }
    }
}

/**
 * Telegram's launcher icons are one enum, and each icon carries a Premium flag. Three places weigh
 * that flag against Premium: the list's tap (a Premium icon opens the Premium sheet for an account
 * without it), the list's badge (the lock) and the list's filter (where Premium isn't sold the three
 * are left out). Each gets AppIcons' answer right after its read. The Premium feature page's preview
 * reads the flag too but never asks about Premium, so it keeps the real three icons.
 */
internal fun BytecodePatchContext.resolvePremiumIcons(): PremiumIconsPlan {
    controlHook(APP_ICONS, "premium", listOf("I"), "Z")
    requireStatusMethod("commercePremiumIcons")
    fun missing(why: String) = PremiumIconsPlan("", emptyList(), why)

    val icons = classDefsMentioning(Mention.string(ICON_KEYS.first())).filter { classDef ->
        classDef.superclass == "Ljava/lang/Enum;" && classDef.methods.any { method ->
            method.name == "<clinit>" && ICON_KEYS.all { key -> method.controlBody().any { it.controlString() == key } }
        }
    }.singleOrNull() ?: return missing("the App Icon list's icons are no longer one enum")
    val premium = icons.fields.singleOrNull { it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) }
        ?: return missing("the App Icon list's icons no longer carry one Premium flag")
    val flag = "${icons.type}->${premium.name}:Z"

    val readers = classDefsMentioning(Mention.reference(flag)).filter { classDef ->
        classDef.methods.any { it.weighsPremium(flag) }
    }.flatMap { classDef -> mutableClassDefBy(classDef).methods.filter { it.weighsPremium(flag) } }
    if (readers.none { method -> method.controlBody().any { it.controlRef() == PREMIUM_ON_ACCOUNTS } }) {
        return missing("the App Icon list no longer checks for Premium")
    }
    readers.forEach { method ->
        val body = method.controlBody()
        val predecessors = ControlFlow.of(method).let { flow ->
            body.indices.flatMap { at -> (flow.normal[at] + flow.exceptional[at]).map { it to at } }.groupBy({ it.first }, { it.second })
        }
        method.flagReads(flag).forEach { index ->
            if (body.getOrNull(index + 1)?.controlRef() == ICON_PREMIUM) return missing("Premium app icons are already unlocked")
            if (predecessors[index + 1] != listOf(index)) {
                return missing("${method.definingClass}->${method.name} jumps between its Premium flag read and its use")
            }
        }
    }
    return PremiumIconsPlan(flag, readers, null)
}

/** Reads [flag] and asks whether the account has Premium, or whether Premium is sold here at all. */
private fun Method.weighsPremium(flag: String): Boolean {
    val body = controlBody()
    return body.any { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == flag } &&
        body.any { it.controlRef() == PREMIUM_ON_ACCOUNTS || it.controlRef() == PREMIUM_BLOCKED }
}

private fun Method.flagReads(flag: String): List<Int> = controlBody().mapIndexedNotNull { index, instruction ->
    index.takeIf { instruction.opcode == Opcode.IGET_BOOLEAN && instruction.controlRef() == flag }
}
