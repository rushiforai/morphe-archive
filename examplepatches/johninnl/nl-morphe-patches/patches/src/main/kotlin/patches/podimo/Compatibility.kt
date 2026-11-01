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
    targets = listOf(AppTarget(version = "3.5.1", versionCode = 941, minSdk = 26)),
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
    "id/h0.m()LSc/b;" to 5,
    "id/h0.n(Z)LSc/b;" to 6,
    "id/h0.p(Z)LSc/b;" to 6,
    "id/h0.f(LKq/x;)LSc/b;" to 5,
    "Tc/c\$c.<init>(Ljava/util/Map;ILkotlin/jvm/internal/k;)V" to 5,
)

