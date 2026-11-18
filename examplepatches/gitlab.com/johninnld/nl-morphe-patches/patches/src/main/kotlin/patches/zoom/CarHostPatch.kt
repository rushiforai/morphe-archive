package patches.zoom

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CAR_SERVICE = "Lcom/zipow/videobox/auto/ZmAutoServiceV3;"
internal const val HOST_VALIDATOR = "Landroidx/car/app/validation/HostValidator;"
internal const val HOST_VALIDATOR_BUILDER = "Landroidx/car/app/validation/HostValidator\$Builder;"

/** Replace only Zoom's car-service policy; retain the library's native handshake and screens. */
internal fun unrestrictedCarValidator(original: Method): MutableMethod {
    check(original.definingClass == CAR_SERVICE && original.name == "createHostValidator" &&
        original.parameterTypes.isEmpty() && original.returnType == HOST_VALIDATOR &&
        !AccessFlags.STATIC.isSet(original.accessFlags)) { "Zoom car validator signature changed" }
    val references = original.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }.orEmpty()
    check(references.count { it == "$HOST_VALIDATOR_BUILDER->addAllowedHosts(I)$HOST_VALIDATOR_BUILDER" } == 1 &&
        references.count { it == "$HOST_VALIDATOR_BUILDER->build()$HOST_VALIDATOR" } == 1) {
        "Zoom car host allow-list changed or patch already applied"
    }
    return ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        MutableMethodImplementation(2)).toMutable().apply {
        addInstructions(0, """
            sget-object v0, $HOST_VALIDATOR->ALLOW_ALL_HOSTS_VALIDATOR:$HOST_VALIDATOR
            return-object v0
        """)
    }
}

@Suppress("unused")
val carHostPatch = bytecodePatch(
    name = "Allow all Android Auto hosts",
    description = "Allows Zoom's native meeting and phone interface on any compatible projection host, " +
        "including DriveDeck, without checking the host package or signing certificate. " +
        "Keeps the car service discoverable and the patched app working with a new APK signing " +
        "certificate and unavailable car details.",
    default = true,
) {
    compatibleWith(zoom)
    dependsOn(originalInput, nativeStartupCompatibility, carMetadataCompatibility, carDiscoveryCompatibility)
    execute {
        check(classDefBy(HOST_VALIDATOR).fields.any {
            it.name == "ALLOW_ALL_HOSTS_VALIDATOR" && it.type == HOST_VALIDATOR &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }) { "Zoom allow-all host validator missing" }
        val owner = mutableClassDefBy(CAR_SERVICE)
        val original = owner.methods.single { it.name == "createHostValidator" }
        val replacement = unrestrictedCarValidator(original)
        check(owner.methods.remove(original)) { "Zoom car validator disappeared" }
        owner.methods.add(replacement)
    }
}
