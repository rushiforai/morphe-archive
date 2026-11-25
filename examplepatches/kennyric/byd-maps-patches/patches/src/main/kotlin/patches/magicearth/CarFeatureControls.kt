package patches.magicearth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CAR_UTILS = "Lcom/generalmagic/magicearth/car_connectivity_plugin/utils/AppUtils;"

/** The native car session has a separate preference-based local eligibility check. */
internal fun enableNativeCarControls(original: Method): MutableMethod {
    check(original.definingClass == CAR_UTILS && original.name == "checkSubscriptionStatus" &&
        original.returnType == "Z" && original.parameterTypes.map { it.toString() } == listOf("Landroidx/car/app/CarContext;") &&
        !AccessFlags.STATIC.isSet(original.accessFlags)) { "Magic Earth native car eligibility signature changed" }
    val references = original.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }.orEmpty()
    check(references.count { it.endsWith("->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;") } == 1 &&
        references.count { it == "Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;" } == 2 &&
        "FlutterSharedPreferences" in references) { "Magic Earth native car eligibility changed or patch already applied" }
    return ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        MutableMethodImplementation(2)).toMutable().apply {
        addInstructions(0, "const/4 v0, 0x1\nreturn v0")
    }
}

internal val nativeCarFeatureControls = bytecodePatch {
    dependsOn(originalInput)
    execute {
        val owner = mutableClassDefBy(CAR_UTILS)
        val original = owner.methods.single { it.name == "checkSubscriptionStatus" }
        val replacement = enableNativeCarControls(original)
        check(owner.methods.remove(original))
        owner.methods.add(replacement)
    }
}
