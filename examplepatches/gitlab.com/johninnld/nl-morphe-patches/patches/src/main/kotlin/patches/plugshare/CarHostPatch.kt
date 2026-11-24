package patches.plugshare

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CAR_SERVICE = "Lcom/xatori/plugshare/PlugShareCarAppService;"
internal const val HOST_VALIDATOR = "Landroidx/car/app/validation/HostValidator;"
private const val BUILDER = "Landroidx/car/app/validation/HostValidator\$Builder;"

internal fun unrestrictedCarValidator(original: Method): MutableMethod {
    check(original.definingClass == CAR_SERVICE && original.name == "createHostValidator" &&
        original.parameterTypes.isEmpty() && original.returnType == HOST_VALIDATOR &&
        !AccessFlags.STATIC.isSet(original.accessFlags)) { "PlugShare car validator signature changed" }
    val references = original.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }.orEmpty()
    check(references.count { it == "$BUILDER->addAllowedHosts(I)$BUILDER" } == 2 &&
        references.count { it == "$BUILDER->build()$HOST_VALIDATOR" } == 1 &&
        references.count { it == "$HOST_VALIDATOR->ALLOW_ALL_HOSTS_VALIDATOR:$HOST_VALIDATOR" } == 1) {
        "PlugShare car host policy changed or patch already applied"
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

internal val carHostPatch = bytecodePatch {
    dependsOn(originalInput)
    execute {
        check(classDefBy(HOST_VALIDATOR).fields.any {
            it.name == "ALLOW_ALL_HOSTS_VALIDATOR" && it.type == HOST_VALIDATOR &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }) { "PlugShare allow-all host validator is missing" }
        val service = mutableClassDefBy(CAR_SERVICE)
        val original = service.methods.single { it.name == "createHostValidator" }
        val replacement = unrestrictedCarValidator(original)
        check(service.methods.remove(original))
        service.methods.add(replacement)
    }
}
