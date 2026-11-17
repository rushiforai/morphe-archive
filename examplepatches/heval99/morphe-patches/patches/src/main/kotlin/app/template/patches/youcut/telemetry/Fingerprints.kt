package app.template.patches.youcut.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ZZY = "Lcom/google/android/gms/internal/measurement/zzff;"

// R8 keeps the Google Analytics collector entry point (zzff.zzy). YouCut has exactly two
// emitters that reach it: its batch logger (Context, event name, keys, values) and the newer
// wrapper used by its analytics facade. Their class and method names rotate, the parameter
// lists and the zzy call do not.
internal fun callsAnalyticsCollector(
    method: com.android.tools.smali.dexlib2.iface.Method,
): Boolean = method.implementation?.instructions?.any { insn ->
    val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
    ref?.definingClass == ZZY &&
        ref.name == "zzy" &&
        ref.returnType == "V" &&
        ref.parameterTypes.map(CharSequence::toString) ==
        listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
} == true

internal object BatchEventFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "[Ljava/lang/Object;",
        "[Ljava/lang/Object;",
    ),
    custom = { method, _ -> callsAnalyticsCollector(method) },
)

internal object EventWrapperFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;", "Ljava/lang/String;"),
    custom = { method, _ -> callsAnalyticsCollector(method) },
)
