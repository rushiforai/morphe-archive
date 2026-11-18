package patches.podimo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.Opcode
import patches.shared.uniqueMatch

internal val podimo = Compatibility(
    name = "Podimo",
    packageName = "com.podimo",
    apkFileType = ApkFileType.APKS,
    signatures = setOf("266752dd10abf83baa6f9696e9df25ce443125ba6b72b806a544a57486dd5481"),
    targets = listOf(AppTarget(version = "3.7.0", versionCode = 944, minSdk = 32)),
)
internal val originalInput = patches.shared.originalInput(podimo)

/** Resolve inside execute, reject extra candidates, and pin registers and instruction count. */
context(context: BytecodePatchContext)
internal fun exact(cls: String, signature: String, registers: Int, count: Int) = Fingerprint(
    definingClass = cls, name = signature.substringBefore('('), returnType = signature.substringAfter(')'),
    parameters = Regex("\\[*L[^;]+;|\\[*[ZBCSIJFD]")
        .findAll(signature.substringAfter('(').substringBefore(')')).map { it.value }.toList(),
).uniqueMatch().method.also { method ->
    val actual = method.instructions.count { it.opcode !in setOf(Opcode.PACKED_SWITCH_PAYLOAD,
        Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD) }
    check(method.implementation!!.registerCount == registers && actual == count) {
        "Changed Podimo contract: $cls->$signature (registers=${method.implementation!!.registerCount}, instructions=$actual)"
    }
}

/** Dexlib2 register totals for the pinned contracts: locals plus parameters plus `this`. */
internal val REGISTER_COUNTS = mapOf(
    "ks/w.e()Lur/k;" to 5,
    "ks/w.f(Z)Lur/k;" to 5,
    "ks/w.g(Z)Lur/k;" to 7,
    "ks/w.d(Lfi0/y0;)Lur/k;" to 5,
    "vr/d.<init>()V" to 6,
    "yv/b.a(Ltv/k;Lwv/e;)Lwv/f;" to 14,
    "zz/a.invoke(Ljava/lang/Object;)Ljava/lang/Object;" to 36,
    "is/k.a(ILjava/lang/String;)Lxj/f0;" to 11,
    "hs/c.a(ILjava/lang/String;)Lhs/b;" to 5,)
