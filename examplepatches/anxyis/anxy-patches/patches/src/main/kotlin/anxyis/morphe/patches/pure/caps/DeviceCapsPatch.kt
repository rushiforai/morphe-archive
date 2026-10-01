package anxyis.morphe.patches.pure.caps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.forceResultConst
import anxyis.morphe.patches.pure.shared.matchSingle
import anxyis.morphe.patches.pure.shared.requireMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Device-capability forces (persist/Nr getters).
 *
 * FACT (stock->Tanryu, persist/Nr.smali): Tanryu replaces the terminal
 * move-result of 8 getters with constants; the delegate/property machinery
 * above stays intact (dead code after our prepend... no — we use
 * forceResultConst AFTER the move-result, same as the membership sweep, so
 * the delegate call still runs harmlessly and the return register is
 * overwritten before `return v0`).
 *
 *  - getMaxRes()I / getMaxResWithVideo()I -> const/16 v0, 0x870 (2160)
 *  - getMaxLayers720/1080/1440/2160()I   -> const v0, 0xf423f (1,000,000)
 *  - getDeviceCapsCheckAttempts()I       -> const/4 v0, 0x3 (NOT 1: Tanryu
 *    uses 3 — the retry counter the caps flow expects; keep exact)
 *  - getDeviceCapsAvailableInDb()Z / getDeviceCapsCheckBypassed()Z /
 *    getDeviceCapsCheckSuccess()Z / getOnboardingCompletedOrSkipped()Z /
 *    getUpdateSp()Z                      -> const/4 v0, 0x1
 *
 * Anchor per getter: the single intValue()/booleanValue() invoke in the
 * method (each getter has exactly one; asserted).
 */
private const val CLS = "Lcom/alightcreative/app/motion/persist/Nr;"

private data class Cap(val method: String, val ret: String, val anchor: String, val kind: String, val value: String)

private val CAPS = listOf(
    Cap("getMaxRes", "I", "intValue", "const/16", "0x870"),
    Cap("getMaxResWithVideo", "I", "intValue", "const/16", "0x870"),
    Cap("getMaxLayers720", "I", "intValue", "const", "0xf423f"),
    Cap("getMaxLayers1080", "I", "intValue", "const", "0xf423f"),
    Cap("getMaxLayers1440", "I", "intValue", "const", "0xf423f"),
    Cap("getMaxLayers2160", "I", "intValue", "const", "0xf423f"),
    Cap("getDeviceCapsCheckAttempts", "I", "intValue", "const/4", "0x3"),
    Cap("getDeviceCapsAvailableInDb", "Z", "booleanValue", "const/4", "0x1"),
    Cap("getDeviceCapsCheckBypassed", "Z", "booleanValue", "const/4", "0x1"),
    Cap("getDeviceCapsCheckSuccess", "Z", "booleanValue", "const/4", "0x1"),
    Cap("getOnboardingCompletedOrSkipped", "Z", "booleanValue", "const/4", "0x1"),
    Cap("getUpdateSp", "Z", "booleanValue", "const/4", "0x1"),
)

private object PersistNr : Fingerprint(
    definingClass = CLS,
    name = "getMaxRes",
    returnType = "I",
    parameters = listOf(),
)

@Suppress("unused")
val deviceCapsPatch = bytecodePatch(
    name = "Full quality export",
    description = "Unlocks the highest export resolution and layer limits.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        PersistNr.matchSingle()
        for (c in CAPS) {
            val m = requireMethod(CLS, c.method, emptyList(), c.ret)
            val impl = m.implementation ?: throw PatchException("Pure: no impl $CLS->${c.method}")
            val hits = impl.instructions.mapIndexedNotNull { i, insn ->
                val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                if (ref?.name == c.anchor) i else null
            }
            if (hits.size != 1) {
                throw PatchException("Pure: $CLS->${c.method} anchor ${c.anchor} x${hits.size}, expected 1")
            }
            m.forceResultConst(hits[0], c.kind, c.value)
        }
    }
}
