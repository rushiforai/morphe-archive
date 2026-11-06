package dev.twitchpatches.patches.twitch.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import dev.twitchpatches.patches.twitch.shared.*

private class FeedThemeHelperFingerprint(helperType: String) : Fingerprint(
    name = "feedThemeHelper",
    returnType = helperType,
    custom = { method, _ -> method.implementation != null },
)

private object FeedContextThemeFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    filters = listOf(
        methodCall("Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V"),
    ),
)

internal fun feedContextThemeIndices(method: Method, factory: String): List<Int> {
    val code = method.code()
    return code.indices.filter { index ->
        val field = (code[index] as? ReferenceInstruction)?.reference as? FieldReference
        code[index].opcode == Opcode.SGET_OBJECT && field?.name == "DARK" &&
            code.subList(maxOf(0, index - 6), index).any { instruction ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == factory
            } && method.references().filterIsInstance<MethodReference>().any {
                it.definingClass == "Landroid/view/ContextThemeWrapper;" && it.name == "applyOverrideConfiguration"
            }
    }
}

internal fun nativeFeedRestoration(stop: Method): MethodReference {
    val activity = stop.references().filterIsInstance<MethodReference>().filter {
        it.name == "requireActivity" && it.parameterTypes.isEmpty() && it.returnType.startsWith("Landroidx/fragment/app/")
    }.uniqueHook("native feed host activity").returnType
    return stop.references().filterIsInstance<MethodReference>().filter {
        it.parameterTypes == listOf(activity) && it.returnType == "V" && !it.definingClass.startsWith("Landroid")
    }.uniqueHook("native preferred-theme restoration")
}

internal fun BytecodePatchContext.restoreNativeFeedTheme() {
    val home = classDefBy("Ltv/twitch/android/feature/discovery/feed/tab/DiscoveryFeedHomeFragment;")
    val stop = home.methods.filter { it.name == "onStop" && it.isInstance(emptyList(), "V") }
        .uniqueHook("native feed theme lifecycle")
    val restoreCall = nativeFeedRestoration(stop)
    val fragmentActivity = restoreCall.parameterTypes.single().toString()
    val helper = mutableClassDefBy(restoreCall.definingClass)
    val restore = helper.methods.single { it.reference == restoreCall.toString() }
    val activityType = "Ltv/twitch/android/feature/viewer/landing/ViewerLandingActivity;"
    require(restore.references().filterIsInstance<MethodReference>().any {
        it.definingClass == activityType && it.parameterTypes.isEmpty() && it.returnType == "V"
    }) { "Feed theme: preferred-theme restoration changed." }
    val holder = restore.code().withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CHECK_CAST &&
            (instruction as? ReferenceInstruction)?.reference.toString() == activityType
    }.uniqueHook("native feed activity holder")
    val field = ((restore.code()[holder.index - 2] as ReferenceInstruction).reference as FieldReference)
    require(field.definingClass == helper.type) { "Feed theme: activity holder changed." }
    val forced = helper.methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.references().filterIsInstance<FieldReference>().any { it.name == "DARK" && it.type == it.definingClass }
    }
    require(forced.size == 2) { "Feed theme: native override contracts changed." }
    val enumField = forced.first().references().filterIsInstance<FieldReference>().filter { it.name == "DARK" }
        .uniqueHook("native theme enum")
    classDefBy(enumField.type).fields.filter { it.name == "LIGHT" && it.type == enumField.type }
        .uniqueHook("native light theme enum")
    val getter = ImmutableMethod(helper.type, "twitchPatchesPreferredTheme", emptyList(), enumField.type,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(1)).toMutable()
    getter.addInstructionsWithLabels(0, """
        invoke-static {}, Ldev/twitchpatches/extension/shared/ReactNativeRuntime;->lightTheme()Z
        move-result v0
        if-eqz v0, :dark
        sget-object v0, ${enumField.type}->LIGHT:${enumField.type}
        return-object v0
        :dark
        sget-object v0, $enumField
        return-object v0
    """)
    helper.methods.add(getter)
    forced.forEach { original ->
        val parameters = original.parameterTypes.map { it.toString() }
        require(parameters == listOf(helper.type) || parameters == listOf(helper.type, fragmentActivity))
        val replacement = ImmutableMethod(helper.type, original.name, original.parameters, "V", original.accessFlags,
            original.annotations, original.hiddenApiRestrictions, MutableMethodImplementation(parameters.size + 1)).toMutable()
        val body = if (parameters.size == 2) "invoke-virtual {p0, p1}, $restoreCall" else """
            iget-object v0, p0, $field
            if-eqz v0, :done
            check-cast v0, $fragmentActivity
            invoke-virtual {p0, v0}, $restoreCall
        """
        replacement.addInstructionsWithLabels(0, "$body\n:done\nreturn-void")
        helper.methods.remove(original)
        helper.methods.add(replacement)
    }
    val factory = FeedThemeHelperFingerprint(helper.type).originalClassDef.type
    val providerMethods = FeedContextThemeFingerprint.matchAllOrNull()?.map { it.method }
        ?: error("Feed theme: native context providers not found.")
    val providers = mutableListOf<Pair<Method, Int>>()
    providerMethods.forEach { method ->
        feedContextThemeIndices(method, factory).forEach { providers.add(method to it) }
    }
    require(providers.size == 2) { "Feed theme: native context providers changed." }
    providers.forEach { (original, index) ->
        val instruction = original.code()[index]
        require((instruction as ReferenceInstruction).reference.toString() == enumField.toString())
        val register = (instruction as OneRegisterInstruction).registerA
        val method = mutableClassDefBy(original.definingClass).methods.single { it.reference == original.reference }
        method.insertBeforeWithLabels(index, "invoke-static {}, ${getter.reference}\nmove-result-object v$register")
        method.replaceInstruction(index + 2, "nop")
    }
}
