package app.template.patches.ninegag.ad

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.ninegag.util.returnBoxedBooleanEarly
import app.template.patches.ninegag.util.returnEarly
import app.template.patches.ninegag.hosts.HostsBlocker
import app.template.patches.ninegag.hosts.HostsBlockerConfig
import app.template.patches.ninegag.hosts.baseHostsBlockerPatch
import app.template.patches.ninegag.shared.COMPATIBILITY_NINEGAG
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove 9GAG ads, promoted posts and trackers",
    description = "Disables ad gates and bottom-banner initialization, filters promoted feed posts, and blocks listed ad/tracking hosts."
) {
    compatibleWith(COMPATIBILITY_NINEGAG)

    dependsOn(
        baseHostsBlockerPatch {
            HostsBlockerConfig(
                hostsBlocker = HostsBlocker.fromString(AD_HOSTS)
            )
        },
        hideAdContainersPatch,
        hidePromotedPostsPatch,
        hideBottomBannerPatch
    )

    execute {
        if (packageMetadata.versionName == "8.26.1") {
            // 8.26.1 uses a nullable block reason: null ENABLES ads. The shared
            // base policy feeds startup, synchronous checks and the runtime flow.
            // Return its real NotInitialized blocker; never forge entitlement.
            val policyClass = classDefBy("Lgb;")
            val policy = policyClass.methods.single {
                it.name == "b" && it.returnType == "Lfa;" &&
                    it.parameterTypes.map { type -> type.toString() } ==
                    listOf("Z", "Lo57;", "Lib;") &&
                    it.accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value)
            }
            val body = checkNotNull(policy.implementation)
            val instructions = body.instructions.toList()
            val fields = instructions.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? FieldReference
            }
            val enumClass = classDefBy("Lfa;")
            val enumStrings = enumClass.methods.flatMap { method ->
                method.implementation?.instructions?.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                } ?: emptyList()
            }
            check(body.registerCount == 3 && instructions.size == 22 &&
                instructions[20].opcode == Opcode.CONST_4 &&
                instructions[21].opcode == Opcode.RETURN_OBJECT &&
                setOf("NotInitialized", "ConsentUnresolved", "PaidAccessUnresolved", "PaidAccess", "Nsfw", "Subscription")
                    .all { it in enumStrings } &&
                fields.filter { it.definingClass == "Lib;" && it.type == "Z" }
                    .map { it.name }.toSet() == setOf("a", "b") &&
                fields.filter { it.definingClass == "Lfa;" && it.type == "Lfa;" }
                    .map { it.name }.toSet() == setOf("b", "c", "d", "f") &&
                enumClass.fields.any { it.name == "a" && it.type == "Lfa;" }
            ) { "9GAG 8.26.1 ad-block policy no longer has its validated structure" }
            mutableClassDefBy(policyClass).methods.single {
                it.name == policy.name && it.parameterTypes == policy.parameterTypes &&
                    it.returnType == policy.returnType
            }.addInstructions(0, """
                sget-object p0, Lfa;->a:Lfa;
                return-object p0
            """)
        } else {
            AdGateFingerprint.method.returnEarly(false)
            RuntimeAdGateFingerprint.method.returnBoxedBooleanEarly(false)
        }
    }
}
