package tw.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import org.ungoogled.patches.shared.Constants.COMPATIBILITY_MAPS
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Lets Android Auto navigate in whatever travel mode the route has: driving routes stay
 * driving, two-wheeler routes stay two-wheeler, and neither is refused.
 *
 * Maps 26.44 refuses a projected route whose mode differs from btxk.h() in two places:
 *  - trq.h(ckbl) -> trq.f() adds PROJECTED_ONLY_DRIVING/TWO_WHEELER_SUPPORTED
 *    ("To navigate on Android Auto, switch to ... directions and start again");
 *  - siy.d (SessionAwareNavigationModeTracker.Listener.onNewSession) ends car navigation.
 * Both are disabled here; route requests themselves are left unchanged.
 */
@Suppress("unused")
val allowAnyModeOnAndroidAuto = bytecodePatch(
    name = "Allow any travel mode on Android Auto",
    description = "26.44.06.1006895251 only. Android Auto no longer refuses navigation for its travel mode: driving " +
        "routes navigate as driving and two-wheeler routes as two-wheeler, without \"switch to ... directions\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MAPS)
    execute {
        fun methodRef(insn: Any?) = (insn as? ReferenceInstruction)?.reference as? MethodReference

        // 2. trq.h(mode): never report a mode mismatch.
        val guard = mutableClassDefBy("Ltrq;").methods.singleOrNull {
            it.name == "h" && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("Lckbl;")
        } ?: throw PatchException("trq.h(ckbl) not found; Maps changed")
        if (guard.implementation?.instructions?.none { methodRef(it)?.let { r -> r.definingClass == "Lbtxk;" && r.name == "h" } == true } != false) {
            throw PatchException("trq.h no longer compares against btxk.h(); Maps changed")
        }
        guard.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // 3. siy.d: treat the new session's mode as the supported one.
        val tracker = mutableClassDefBy("Lsiy;").methods.singleOrNull { method ->
            method.name == "d" && method.implementation?.instructions?.any {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    ((it as ReferenceInstruction).reference as StringReference).string ==
                    "SessionAwareNavigationModeTracker.Listener.onNewSession"
            } == true
        } ?: throw PatchException("SessionAwareNavigationModeTracker.onNewSession not found; Maps changed")
        val trackerInsns = tracker.implementation!!.instructions.toList()
        val call = trackerInsns.indexOfFirst { methodRef(it)?.let { r -> r.definingClass == "Lbtxk;" && r.name == "h" } == true }
        val result = trackerInsns.getOrNull(call + 1)
        val compare = trackerInsns.getOrNull(call + 2)
        if (call < 0 || result?.opcode != Opcode.MOVE_RESULT_OBJECT || compare?.opcode != Opcode.IF_EQ) {
            throw PatchException("onNewSession no longer compares the session mode with btxk.h(); Maps changed")
        }
        val supported = (result as OneRegisterInstruction).registerA
        compare as TwoRegisterInstruction
        val sessionMode = if (compare.registerB == supported) compare.registerA else compare.registerB
        if (sessionMode > 15 || supported > 15) throw PatchException("onNewSession registers out of range")
        tracker.addInstruction(call + 2, "move-object v$supported, v$sessionMode")
    }
}
