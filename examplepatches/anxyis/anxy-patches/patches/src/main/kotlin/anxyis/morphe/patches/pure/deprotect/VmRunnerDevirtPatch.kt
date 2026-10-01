package anxyis.morphe.patches.pure.deprotect

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import anxyis.morphe.patches.pure.shared.ALIGHT_5270
import anxyis.morphe.patches.pure.shared.clearBody
import anxyis.morphe.patches.pure.shared.ensureRegisters
import anxyis.morphe.patches.pure.shared.findInvokes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * VMRunner.invoke() call-site neutralization (the "devirtualization" set).
 *
 * FACT: stock has 22 VMRunner;->invoke sites in 22 files. Tanryu leaves the
 * 2 com/pairip-internal files (StartupLauncher.launch body,
 * VMRunner$1.run — deleted with the class files in practice) and rewrites
 * the 20 third-party SDK files in two shapes:
 *
 *  SHAPE A (17 files): whole onReceive(Context,Intent)V body is the VM
 *    dispatch (build Object[3] {this, ctx, intent}, invoke, move-result,
 *    return-void). Tanryu replaces the body with `.locals 0; return-void`.
 *    We do clearBody() + `return-void`.
 *
 *  SHAPE B (3 files): doWork() builds Object[1] {this}, invokes, then
 *    check-casts move-result to ListenableWorker$Nr and returns it. Tanryu
 *    deletes ONLY the 2-line invoke (keeping array build + move-result +
 *    cast — a methodologically sloppy but runtime-harmless edit since the
 *    VM is dead and move-result yields null... in fact Tanryu's output is
 *    NOT verifiable Dalvik: move-result with no preceding invoke. It
 *    assembles because apktool is lenient, and ART verifies per-method...
 *    empirically it runs). We do NOT replicate the invalid shape: we
 *    replace the body with `sget null-equivalent; check-cast; return-object`
 *    i.e. `const/4 v0, 0x0; move-result-object` is illegal — instead:
 *    `return-object` of a null cast is simply `const/4 v0, 0x0` is wrong
 *    type... The VERIFIABLE equivalent: `sget-object v0,
 *    Landroidx/work/ListenableWorker$Nr;->...` does not exist. Simplest valid
 *    body returning null Nr: clearBody + `const/4 v0, 0x0; return-object v0`
 *    is a type violation (int vs ref)... ART's verifier accepts `const/4`
 *    null (0 is compatible with reference types in Dalvik verification:
 *    const/4 v0, 0x0 IS the canonical null literal and verifies as any
 *    reference). Confirmed standard: returning null via const/4 0x0 +
 *    return-object is the normal dex compiler output for `return null`.
 *
 * Files (exact 5.0.270 class names; assertion counts both shapes):
 *  A: androidx/appcompat/app/o1N$a6$Nr, androidx/media3/exoplayer/Nr$Nr,
 *     androidx/media3/exoplayer/audio/Jy6$NpA, androidx/media3/exoplayer/y$VJ,
 *     androidx/work/impl/background/systemalarm/ConstraintProxy,
 *     com/applovin/exoplayer2/ay$b, com/applovin/exoplayer2/b$a,
 *     com/facebook/AuthenticationTokenManager$CurrentAuthenticationTokenChangedBroadcastReceiver,
 *     com/facebook/CustomTabActivity$Jy6, com/google/android/exoplayer2/To$VJ,
 *     com/google/android/gms/ads/internal/util/E,
 *     com/google/android/gms/ads/internal/util/RXY,
 *     com/google/android/gms/internal/ads/zzarx,
 *     com/google/android/gms/internal/ads/zzatw,
 *     com/google/android/gms/internal/ads/zzlo,
 *     com/google/android/gms/measurement/AppMeasurementReceiver,
 *     fgA/VJ$Nr  (17)
 *  B: com/google/android/gms/ads/internal/offline/buffering/OfflineNotificationPoster,
 *     com/google/android/gms/ads/internal/offline/buffering/OfflinePingSender,
 *     androidx/work/impl/workers/CombineContinuationsWorker  (3)
 */
private const val VM = "Lcom/pairip/VMRunner;"
private const val INVOKE = "invoke"

private val SHAPE_A = listOf(
    "Landroidx/appcompat/app/o1N\$a6\$Nr;" to "onReceive",
    "Landroidx/media3/exoplayer/Nr\$Nr;" to "onReceive",
    "Landroidx/media3/exoplayer/audio/Jy6\$NpA;" to "onReceive",
    "Landroidx/media3/exoplayer/y\$VJ;" to "onReceive",
    "Landroidx/work/impl/background/systemalarm/ConstraintProxy;" to "onReceive",
    "Lcom/applovin/exoplayer2/ay\$b;" to "onReceive",
    "Lcom/applovin/exoplayer2/b\$a;" to "onReceive",
    "Lcom/facebook/AuthenticationTokenManager\$CurrentAuthenticationTokenChangedBroadcastReceiver;" to "onReceive",
    "Lcom/facebook/CustomTabActivity\$Jy6;" to "onReceive",
    "Lcom/google/android/exoplayer2/To\$VJ;" to "onReceive",
    "Lcom/google/android/gms/ads/internal/util/E;" to "onReceive",
    "Lcom/google/android/gms/ads/internal/util/RXY;" to "onReceive",
    "Lcom/google/android/gms/internal/ads/zzarx;" to "onReceive",
    "Lcom/google/android/gms/internal/ads/zzatw;" to "onReceive",
    "Lcom/google/android/gms/internal/ads/zzlo;" to "onReceive",
    "Lcom/google/android/gms/measurement/AppMeasurementReceiver;" to "onReceive",
    "LfgA/VJ\$Nr;" to "onReceive",
)

private val SHAPE_B = listOf(
    "Lcom/google/android/gms/ads/internal/offline/buffering/OfflineNotificationPoster;" to "doWork",
    "Lcom/google/android/gms/ads/internal/offline/buffering/OfflinePingSender;" to "doWork",
    "Landroidx/work/impl/workers/CombineContinuationsWorker;" to "doWork",
)

@Suppress("unused")
val vmRunnerDevirtPatch = bytecodePatch(
    name = "Block background checks",
    description = "Stops hidden background verification calls.",
) {
    compatibleWith(ALIGHT_5270)
    execute {
        var a = 0
        for ((type, name) in SHAPE_A) {
            val cls = mutableClassDefByOrNull(type)
                ?: throw PatchException("Pure: class not found: $type")
            val m = cls.methods.singleOrNull {
                it.name == name && it.parameterTypes == listOf(
                    "Landroid/content/Context;",
                    "Landroid/content/Intent;",
                ) && it.returnType == "V"
            } ?: throw PatchException("Pure: onReceive not found in $type")
            if (m.findInvokes(VM, INVOKE).isEmpty()) {
                throw PatchException("Pure: no VMRunner.invoke in $type->$name (wrong base?)")
            }
            m.clearBody()
            m.addInstructions(0, "return-void")
            a++
        }
        var b = 0
        for ((type, name) in SHAPE_B) {
            val cls = mutableClassDefByOrNull(type)
                ?: throw PatchException("Pure: class not found: $type")
            val m = cls.methods.singleOrNull {
                it.name == name && it.parameterTypes.isEmpty() &&
                    it.returnType == "Landroidx/work/ListenableWorker\$Nr;"
            } ?: throw PatchException("Pure: doWork not found in $type")
            if (m.findInvokes(VM, INVOKE).isEmpty()) {
                throw PatchException("Pure: no VMRunner.invoke in $type->$name (wrong base?)")
            }
            m.clearBody()
            // Canonical `return null` (const/4 0x0 verifies as null reference).
            m.ensureRegisters(2)
            m.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
            b++
        }
        if (a != 17 || b != 3) {
            throw PatchException("Pure: devirt counts A=$a/17 B=$b/3 (wrong base?)")
        }
    }
}
