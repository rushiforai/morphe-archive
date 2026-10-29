package app.morphe.patches.bejeweled

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.Constants

/**
 * Crash-guard patch for Bejeweled Classic.
 *
 * `com.glu.plugins.gluanalytics.GluAnalytics` dereferences `this.mCallback` (an
 * [IAnalyticsCallback]) in several places to forward notifications
 * (onInit / onUserIdChanged / onUpdateSessionId / onDestroy /
 * recordAnalyticsRequest / internalTargetedAdsChanged).
 *
 * `mCallback` is only ever set by the legacy `GluAnalytics.init(IAnalyticsCallback)`,
 * but the game does not call this — the factory wires up the modern
 * `enablePinpoint` path instead. As a result, `mCallback` is structurally
 * always null, and every one of these branches will NPE when triggered
 * (both observed in the wild: on the `glu-analytics` worker thread when
 * `destroy()` posts `MESSAGE_USERID_CHANGED`, and when `handleMessage`
 * forwards a segmentation-value update to `createReqIdAndForwardToGCS` →
 * `IAnalyticsCallback.recordAnalyticsRequest`).
 *
 * Fix: guard every `mCallback` reference across the whole class with a null
 * check. When the callback is null, we only suppress the notification (state
 * writes like `mut_userId = ...` still occur); when it is non-null, forwarding
 * happens exactly as before. Guards are injected structurally — for every
 * `iget-object ..., mCallback` immediately followed by an interface call on
 * the same register, we insert `if-eqz <reg>, :skip` with the label anchored
 * to the instruction after the call.
 */
@Suppress("SpellCheckingInspection")
val bejuweedCrashGuard = bytecodePatch(
    name = "Crash-guard",
    description = "Null-guards the GluAnalytics callback references (fixes latent NPEs).",
    default = true
) {
    compatibleWith(Constants.BEJEWELED_COMPATIBILITY)

    execute {
        // Sweep the ENTIRE class so references outside handleMessage (e.g.
        // createReqIdAndForwardToGCS / setCustomProperties, both NPE risks
        // seen in the wild) are guarded too.
        val clazz = mutableClassDefBy("Lcom/glu/plugins/gluanalytics/GluAnalytics;")
        val allMethods = (clazz.virtualMethods + clazz.directMethods).toList()

        val allSites = mutableListOf<Any>()
        var labelCounter = 0

        for (mm in allMethods) {
            val impl = mm.getImplementation() ?: continue
            val snapshot = impl.instructions
            val n = snapshot.size

            // Structural helper (dexlib2-builder instructions expose references
            // via getReference(), and opcodes via getOpcode()).
            fun classOf(i: Int): Class<*> = snapshot[i].let { it::class.java }

            fun opcodeAt(i: Int): String =
                (classOf(i).methods.first { it.name == "getOpcode" }.invoke(snapshot[i])
                    as com.android.tools.smali.dexlib2.Opcode).name

            fun refAt(i: Int): Any? =
                classOf(i).methods.first { it.name == "getReference" }.invoke(snapshot[i])

            fun fieldNameAt(i: Int): Any? =
                (refAt(i)?.let { it::class.java })?.methods?.first { it.name == "getName" }
                    ?.let { it.invoke(refAt(i)!!) }

            fun refClassAt(i: Int): Any? =
                (refAt(i)?.let { it::class.java })?.methods?.first { it.name == "getDefiningClass" }
                    ?.let { it.invoke(refAt(i)!!) }

            fun isMCallbackLoad(i: Int): Boolean =
                opcodeAt(i) == "iget-object" &&
                        fieldNameAt(i) == "mCallback" &&
                        refClassAt(i) == "Lcom/glu/plugins/gluanalytics/GluAnalytics;"

            data class Site(val loadIdx: Int, val reg: String, val callIdx: Int)
            val sites = mutableListOf<Site>()

            for (i in 0 until n) {
                if (!isMCallbackLoad(i)) continue
                val regVal = classOf(i).methods.first { it.name == "getRegisterA" }.invoke(snapshot[i])
                val reg = "v${regVal as Int}"
                // Bound the search window to the NEXT mCallback load (exclusive): a
                // callback call further than that belongs to the next site.
                val bound = (i + 1 until n).firstOrNull { isMCallbackLoad(it) } ?: n
                val callIdx = (i + 1 until bound).firstOrNull {
                    val op = opcodeAt(it)
                    op.startsWith("invoke-interface") &&
                            refClassAt(it) == "Lcom/glu/plugins/gluanalytics/IAnalyticsCallback;"
                }
                if (callIdx != null) sites += Site(i, reg, callIdx)
            }
            if (sites.isEmpty()) continue

            // Insert guards bottom-up so that higher insertions don't shift
            // indices of lower sites. Label targets are taken from the LIVE
            // list just before each insertion (identity is stable).
            val descendingSites = sites.sortedByDescending { it.loadIdx }
            for (s in descendingSites) {
                val live = impl.instructions
                val target = live[s.callIdx + 1]
                val label = "skipCbNPE${labelCounter++}"
                mm.addInstructionsWithLabels(
                    s.loadIdx + 1,
                    "if-eqz ${s.reg}, :$label",
                    ExternalLabel(label, target)
                )
                allSites += s
            }
        }

        check(allSites.size >= 7) {
            "Expected mCallback callback sites across GluAnalytics (7 known), found ${allSites.size}"
        }
    }
}
