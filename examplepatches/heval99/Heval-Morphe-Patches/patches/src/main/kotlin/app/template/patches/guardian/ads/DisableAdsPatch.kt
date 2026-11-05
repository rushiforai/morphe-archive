package app.template.patches.guardian.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_GUARDIAN
import app.template.patches.shared.addInstructionsWithLabelsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val STRING = "Ljava/lang/String;"

/**
 * The calls the app's own "No consent given for google ads" failure makes. Since 6.240 R8 renames
 * Google Mobile Ads' LoadAdError and AdListener (6.241: lt7 and tc, onAdFailedToLoad is tc.b), so
 * the types are read from that block instead of being named.
 */
private class ConsentFailure(
    val getAdListener: MethodReference,
    val errorType: String,
    val errorInit: MethodReference,
    val onAdFailedToLoad: MethodReference,
)

private val Instruction.methodRef get() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MutableMethod.consentFailure(): ConsentFailure {
    val label = "$definingClass->$name"
    val insns = implementation!!.instructions.toList()
    val message = insns.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == NO_CONSENT_MESSAGE
    }
    if (message < 0) throw PatchException("$label: no \"$NO_CONSENT_MESSAGE\" failure")
    val end = (message until insns.size).firstOrNull { insns[it].opcode == Opcode.RETURN_VOID }
        ?: throw PatchException("$label: the consent failure does not return")
    val block = insns.subList(message, end)

    // new-instance <error> sits a few instructions before the message (the constructor's literals).
    val errorType = (message - 1 downTo maxOf(0, message - 6))
        .map { insns[it] }
        .firstOrNull { it.opcode == Opcode.NEW_INSTANCE }
        ?.let { ((it as ReferenceInstruction).reference as TypeReference).type }
        ?: throw PatchException("$label: the consent failure creates no error object")
    val errorInit = block.mapNotNull { it.methodRef }
        .firstOrNull { it.definingClass == errorType && it.name == "<init>" }
        ?: throw PatchException("$label: the consent failure does not construct $errorType")
    val initParameters = errorInit.parameterTypes.map(CharSequence::toString)
    if (initParameters.size != 5 || initParameters.take(3) != listOf("I", STRING, STRING) ||
        initParameters.drop(3).any { !it.startsWith("L") }
    ) {
        throw PatchException("$label: unexpected $errorType constructor $initParameters")
    }
    val getAdListener = block.mapNotNull { it.methodRef }
        .firstOrNull { it.name == "getAdListener" && it.parameterTypes.isEmpty() }
        ?: throw PatchException("$label: the consent failure does not read the view's AdListener")
    val onAdFailedToLoad = block.mapNotNull { it.methodRef }
        .firstOrNull {
            it.definingClass == getAdListener.returnType && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(errorType)
        }
        ?: throw PatchException("$label: the consent failure does not report $errorType to ${getAdListener.returnType}")
    return ConsentFailure(getAdListener, errorType, errorInit, onAdFailedToLoad)
}

private fun MethodReference.smali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Every Google Ad Manager slot in The Guardian loads through one method, and the app's own "no
 * ads" path (the one premium subscribers get) runs through ShouldLoadAds. The patch takes both:
 * no ad request or Amazon APS bid is made (each slot gets the app's usual load failure), and
 * article HTML and the article pager are built without ad slots.
 * MobileAds is not touched (AGENTS.md rule 9) and isPremium / UserTier are not forced, so premium
 * features stay locked.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_GUARDIAN)

    execute {
        // 1. The ad load reports a load failure to the view's AdListener and returns, the same
        // way its own consent and "Forced ad failure" paths do, before the GMA request and the
        // Amazon APS bid (the app's only APS request). On failure the app's listeners set front
        // advert cards and MPU views to GONE and mark interstitial pages as failed; none of them
        // looks at the error code.
        LoadAdFingerprint.method.apply {
            val failure = consentFailure()
            // p-register of the AdManagerAdView (second) parameter: static methods have no `this`.
            val first = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
            val words = parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
            val adView = first + words[0]
            val locals = implementation!!.registerCount - words.sum() - first
            if (locals < 7) throw PatchException("The ad load method has only $locals locals")
            addInstructionsWithLabelsChecked(
                0,
                """
                    invoke-virtual/range {p$adView .. p$adView}, ${failure.getAdListener.smali()}
                    move-result-object v0
                    if-eqz v0, :skip
                    new-instance v1, ${failure.errorType}
                    const/4 v2, 0x3
                    const-string v3, "Ads disabled"
                    const-string v4, "com.guardian"
                    const/4 v5, 0x0
                    const/4 v6, 0x0
                    invoke-direct/range {v1 .. v6}, ${failure.errorInit.smali()}
                    invoke-virtual {v0, v1}, ${failure.onAdFailedToLoad.smali()}
                    :skip
                    return-void
                """
            )
        }

        // 2. The app's "ads on" check answers false, so articles get no MPU placeholders and no
        // interstitial pages are inserted between articles.
        val shouldLoadAds = ShouldLoadAdsFingerprint.matchAllOrNull().orEmpty()
        if (shouldLoadAds.size != 1) {
            throw PatchException(
                "Expected one ShouldLoadAds, found " +
                    shouldLoadAds.map { "${it.classDef.type}->${it.method.name}" },
            )
        }
        shouldLoadAds.single().method.returnEarly(false)
    }
}
