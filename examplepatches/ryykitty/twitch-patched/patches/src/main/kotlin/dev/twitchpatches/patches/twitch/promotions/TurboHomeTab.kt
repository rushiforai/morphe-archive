package dev.twitchpatches.patches.twitch.promotions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import dev.twitchpatches.patches.twitch.shared.*

private const val TURBO_PAGE = "Ltv/twitch/android/models/feed/DiscoveryFeedPage\$TurboPage;"
private const val FOLLOWING_PAGE = "Ltv/twitch/android/models/feed/DiscoveryFeedPage\$FollowingPage;"

internal fun validateTurboTabProducer(method: Method): Int {
    if (!method.isInstance(listOf("Z"), "Ljava/util/List;"))
        throw PatchException("Turbo home tab producer must be an instance Boolean-to-List method")
    val code = method.code()
    val parameter = (method.implementation?.registerCount ?: 0) - 1
    val turbo = code.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.SGET_OBJECT &&
        (instruction as? ReferenceInstruction)?.reference?.toString() == "$TURBO_PAGE->INSTANCE:$TURBO_PAGE"
    }.uniqueHook("Turbo home tab singleton read")
    if (code.none { (it as? ReferenceInstruction)?.reference?.toString() == "$FOLLOWING_PAGE->INSTANCE:$FOLLOWING_PAGE" })
        throw PatchException("Turbo home tab producer no longer includes Following")
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    val branch = code.withIndex().filter { (_, instruction) -> instruction.opcode == Opcode.IF_EQZ &&
        (instruction as? OneRegisterInstruction)?.registerA == parameter
    }.uniqueHook("Turbo home tab input gate")
    val targetAddress = addresses[branch.index] + (branch.value as OffsetInstruction).codeOffset
    val target = addresses.indexOf(targetAddress)
    if (branch.index + 1 != turbo.index || target <= turbo.index || target >= code.size || parameter !in 0..255 ||
        code[target].opcode != Opcode.SGET_OBJECT || code.getOrNull(turbo.index + 1)?.opcode != Opcode.INVOKE_STATIC ||
        code.take(branch.index).any { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == parameter })
        throw PatchException("Turbo home tab Boolean no longer gates an isolated optional tab")
    return branch.index
}

internal fun BytecodePatchContext.hideTurboHomeTab() {
    val candidates = mutableListOf<Method>()
    classDefForEach { type -> candidates.addAll(type.methods.filter { method ->
        method.isInstance(listOf("Z"), "Ljava/util/List;") && method.references().any {
            it.toString() == "$TURBO_PAGE->INSTANCE:$TURBO_PAGE"
        }
    }) }
    val producer = candidates.uniqueHook("native optional Turbo home tab producer")
    val branch = validateTurboTabProducer(producer)
    val parameter = (producer.implementation?.registerCount ?: 0) - 1
    mutableClassDefBy(producer.definingClass).methods.filter { it.reference == producer.reference }
        .uniqueHook("resolved Turbo home tab producer").insertBeforeWithLabels(branch, """
            invoke-static/range {v$parameter .. v$parameter}, Ldev/twitchpatches/extension/promotions/PromotionSettings;->allowTurboTab(Z)Z
            move-result v$parameter
        """)
}
