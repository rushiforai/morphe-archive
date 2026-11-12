package app.template.patches.viaplay.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Viaplay's VOD ads are server-side inserted DASH periods. The ad-period check (the "ad-id-signaling"
// DASH event stream) lives in Viaplay's own exo/tools package, whose package name is kept. Up to
// 26.42.1 the app's AdPlaybackStateUpdater was a separate class implementing Media3's interface,
// found by that interface and the AdPlaybackState builder calls. From 26.43 R8 renames Media3's
// common classes (AdPlaybackState, Timeline, the updater interface) and inlines the only updater
// into ServerSideAdInsertionMediaSource's onChildSourceInfoRefreshed(MediaSource, Timeline)V,
// where withSkippedAd is inlined too. What remains stable is the method's shape: it calls the
// exo/tools period check (X, Timeline, int) -> boolean, and, for every period it builds, tests
//     invoke-interface {set, key}, Set.contains(Object)Z ; move-result ; if-eqz
// before marking the state's single ad skipped.
internal const val VIAPLAY_EXO_TOOLS = "Lcom/viaplay/android/player/players/exo/tools/"

internal fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Indexes of `Set.contains` calls directly followed by `move-result` and `if-eqz` on its result. */
internal fun List<Instruction>.setContainsGuards(): List<Int> = indices.filter { i ->
    val ref = this[i].methodRef()
    ref != null && ref.definingClass == "Ljava/util/Set;" && ref.name == "contains" &&
        getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT && getOrNull(i + 2)?.opcode == Opcode.IF_EQZ
}

internal object AdPlaybackStateUpdaterFingerprint : Fingerprint(
    returnType = "V",
    custom = { method: Method, _ ->
        val implementation = method.implementation
        if (implementation == null || method.parameterTypes.size != 2) {
            false
        } else {
            val timeline = method.parameterTypes[1].toString()
            val insns = implementation.instructions.toList()
            // The exo/tools period check: a static (Timeline, int) -> boolean.
            insns.any {
                it.methodRef()?.let { ref ->
                    ref.definingClass.startsWith(VIAPLAY_EXO_TOOLS) && ref.returnType == "Z" &&
                        ref.parameterTypes.map(CharSequence::toString) == listOf(timeline, "I")
                } == true
            } && insns.setContainsGuards().isNotEmpty()
        }
    },
)
