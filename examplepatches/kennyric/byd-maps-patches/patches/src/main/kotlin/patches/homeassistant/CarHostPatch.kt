package patches.homeassistant

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CAR_SERVICE = "Lio/homeassistant/companion/android/vehicle/HaCarAppService;"
internal const val HOST_VALIDATOR = "Landroidx/car/app/validation/HostValidator;"
internal const val HOST_VALIDATOR_BUILDER = "Landroidx/car/app/validation/HostValidator\$Builder;"

/** Replace only Home Assistant's car-service host policy; keep the library's handshake and screens. */
internal fun unrestrictedCarValidator(original: Method): MutableMethod {
    check(original.definingClass == CAR_SERVICE && original.name == "createHostValidator" &&
        original.parameterTypes.isEmpty() && original.returnType == HOST_VALIDATOR &&
        !AccessFlags.STATIC.isSet(original.accessFlags)) { "Home Assistant car validator signature changed" }
    val references = original.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }.orEmpty()
    check(references.count { it == "$HOST_VALIDATOR_BUILDER->addAllowedHosts(I)$HOST_VALIDATOR_BUILDER" } == 1 &&
        references.count { it == "$HOST_VALIDATOR_BUILDER->build()$HOST_VALIDATOR" } == 1 &&
        references.count { it == "$HOST_VALIDATOR->ALLOW_ALL_HOSTS_VALIDATOR:$HOST_VALIDATOR" } == 1) {
        "Home Assistant car host allow-list changed or patch already applied"
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
    name = "Allow any Android Auto host",
    description = "Lets any Android Auto compatible host connect to Home Assistant's car screens, " +
        "including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, " +
        "whatever its package name or signing key. Google's Android Auto keeps working.",
    default = true,
) {
    compatibleWith(homeAssistant)
    dependsOn(originalInput)
    execute {
        check(classDefBy(HOST_VALIDATOR).fields.any {
            it.name == "ALLOW_ALL_HOSTS_VALIDATOR" && it.type == HOST_VALIDATOR &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }) { "Home Assistant allow-all host validator missing" }
        val owner = mutableClassDefBy(CAR_SERVICE)
        val original = owner.methods.single { it.name == "createHostValidator" }
        val replacement = unrestrictedCarValidator(original)
        check(owner.methods.remove(original)) { "Home Assistant car validator disappeared" }
        owner.methods.add(replacement)
    }
}
