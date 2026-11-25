package patches.tuya

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CAR_SERVICE = "Lcom/thingclips/smart/scene/auto/car/SceneManualCarAppService;"

/**
 * Tuya's build renames the bundled androidx.car.app validation runtime: `x0l` is HostValidator,
 * its static field `e` is ALLOW_ALL_HOSTS_VALIDATOR and the service override `a()` is
 * createHostValidator(). Replace only that car-service host policy; keep the library's
 * handshake and the scene screens.
 */
internal const val HOST_VALIDATOR = "Lx0l;"
internal const val ALLOW_ALL_HOSTS_VALIDATOR = "Lx0l;->e:Lx0l;"
internal const val RESTRICTED_CONSTRUCTOR =
    "Lx0l;-><init>(Landroid/content/pm/PackageManager;Ljava/util/HashMap;Z)V"

internal fun unrestrictedCarValidator(original: Method): MutableMethod {
    check(original.definingClass == CAR_SERVICE && original.name == "a" &&
        original.parameterTypes.isEmpty() && original.returnType == HOST_VALIDATOR &&
        !AccessFlags.STATIC.isSet(original.accessFlags)) { "Tuya car validator signature changed" }
    val references = original.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }.orEmpty()
    check(references.count { it == ALLOW_ALL_HOSTS_VALIDATOR } == 1 &&
        references.count { it == RESTRICTED_CONSTRUCTOR } == 1) {
        "Tuya car host allow-list changed or patch already applied"
    }
    return ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        MutableMethodImplementation(2)).toMutable().apply {
        addInstructions(0, """
            sget-object v0, $ALLOW_ALL_HOSTS_VALIDATOR
            return-object v0
        """)
    }
}

@Suppress("unused")
val carHostPatch = bytecodePatch(
    name = "Allow any Android Auto host",
    description = "Lets any Android Auto compatible host connect to Tuya Smart Life's car screens, " +
        "including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, " +
        "whatever its package name or signing key. Google's Android Auto keeps working.",
    default = true,
) {
    compatibleWith(tuya)
    dependsOn(originalInput)
    execute {
        check(classDefBy(HOST_VALIDATOR).fields.any {
            it.name == "e" && it.type == HOST_VALIDATOR &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }) { "Tuya allow-all host validator missing" }
        val owner = mutableClassDefBy(CAR_SERVICE)
        val original = owner.methods.single {
            it.name == "a" && it.parameterTypes.isEmpty() && it.returnType == HOST_VALIDATOR
        }
        val replacement = unrestrictedCarValidator(original)
        check(owner.methods.remove(original)) { "Tuya car validator disappeared" }
        owner.methods.add(replacement)
    }
}
