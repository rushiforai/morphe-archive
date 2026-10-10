package dev.twitchpatches.patches.twitch.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

internal data class BrowseNoFill(val empty: MethodReference, val single: MethodReference)

internal fun browseNoFill(method: Method): BrowseNoFill {
    val code = method.code()
    return code.indices.mapNotNull { index ->
        val empty = (code[index] as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        if (code[index].opcode != Opcode.INVOKE_STATIC ||
            empty.definingClass != "Ltv/twitch/android/util/Optional\$Companion;" ||
            empty.parameterTypes.isNotEmpty() || empty.returnType != "Ltv/twitch/android/util/Optional;")
            return@mapNotNull null
        val move = code.getOrNull(index + 1) as? OneRegisterInstruction ?: return@mapNotNull null
        val call = code.getOrNull(index + 2) as? FiveRegisterInstruction ?: return@mapNotNull null
        val single = (call as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        val result = code.getOrNull(index + 3) as? OneRegisterInstruction ?: return@mapNotNull null
        val ret = code.getOrNull(index + 4) as? OneRegisterInstruction ?: return@mapNotNull null
        if (move.opcode != Opcode.MOVE_RESULT_OBJECT || call.opcode != Opcode.INVOKE_STATIC ||
            call.registerCount != 1 || call.registerC != move.registerA ||
            single.definingClass != "Lio/reactivex/u;" || single.parameterTypes != listOf("Ljava/lang/Object;") ||
            !single.returnType.startsWith("Lio/reactivex/internal/operators/") ||
            result.opcode != Opcode.MOVE_RESULT_OBJECT || ret.opcode != Opcode.RETURN_OBJECT ||
            result.registerA != ret.registerA) return@mapNotNull null
        BrowseNoFill(empty, single)
    }.uniqueHook("browse display-ad no-fill completion")
}

internal fun BytecodePatchContext.blockBrowseDisplayAds(methods: List<Method>) {
    val request = methods.filter { it.parameterTypes == listOf("Ljava/lang/Object;") &&
        it.returnType == "Ljava/lang/Object;" && it.hasStrings("show_headliner_ad", "ad_request_format_declined") &&
        it.references().any { ref -> ref.toString() == "Ltv/twitch/android/shared/ads/models/edge/api/BrowseDisplayAdResponse;" }
    }.uniqueHook("Following headliner request")
    val noFill = browseNoFill(request)
    val method = mutable(request)
    if ((method.implementation?.registerCount ?: 0) <= 2)
        throw PatchException("Browse display ads: no local register at request entry.")
    method.addInstructionsWithLabels(0, """
        invoke-static {}, $AD_SETTINGS->displayAdsBlocked()Z
        move-result v0
        if-eqz v0, :original
        invoke-static {}, ${noFill.empty}
        move-result-object v0
        invoke-static {v0}, ${noFill.single}
        move-result-object v0
        return-object v0
    """, ExternalLabel("original", method.code().first()))
}
