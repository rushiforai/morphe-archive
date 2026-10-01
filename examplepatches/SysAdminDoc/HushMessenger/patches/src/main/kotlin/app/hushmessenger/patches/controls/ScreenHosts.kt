package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val HOST_SCREENS = "Lapp/hushmessenger/extension/HostScreens;"
internal const val BUNDLED_CONTROLS = "$HOST_SCREENS->bundledControls()Ljava/lang/String;"
internal val FACTORY_TYPE = "L${APP_COMPONENT_FACTORY.replace('.', '/')};"
internal val INSTANTIATE_ACTIVITY =
    "$FACTORY_TYPE->instantiateActivity(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;"
internal val INSTANTIATE_APPLICATION =
    "$FACTORY_TYPE->instantiateApplication(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroid/app/Application;"

/** Controls that applied in this run, written into HostScreens for installs that keep the stock manifest. */
internal val bundledControls = sortedSetOf<String>()

private fun factoryChanged(): Nothing = throw PatchException(
    "Messenger controls: the app component factory differs from the tested build. Start with an unmodified supported APK.",
)

internal fun validateFactory(activity: MutableMethod, application: MutableMethod) {
    if (activity.hookId() != INSTANTIATE_ACTIVITY || application.hookId() != INSTANTIATE_APPLICATION ||
        AccessFlags.STATIC.isSet(activity.accessFlags) || AccessFlags.STATIC.isSet(application.accessFlags)) factoryChanged()
    activity.validateScratch()
    val instructions = application.implementation?.instructions?.toList() ?: factoryChanged()
    // One straight-line exit, so a call placed just before it runs on every path.
    if (instructions.count { it.opcode == Opcode.RETURN_OBJECT } != 1 || instructions.any { it is OffsetInstruction }) factoryChanged()
}

/**
 * The factory creates every activity and the Application. It now asks HostScreens first, so a stock host started with
 * the screen extra becomes HushMessenger settings or restart, and it hands the new Application over for late setup.
 */
internal fun injectFactory(activity: MutableMethod, application: MutableMethod) {
    validateFactory(activity, application)
    activity.addInstructionsWithLabels(0, """
        invoke-static/range {p2 .. p3}, $HOST_SCREENS->activityFor(Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;
        move-result-object v0
        if-eqz v0, :stock_behavior
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", activity.getInstruction(0)))
    val exit = application.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
    val app = application.getInstruction<OneRegisterInstruction>(exit).registerA
    application.addInstructions(exit, "invoke-static/range {v$app .. v$app}, $HOST_SCREENS->applicationCreated(Landroid/app/Application;)V")
}

internal fun MutableMethod.writeBundledControls(keys: Collection<String>) {
    val instructions = implementation?.instructions?.toList().orEmpty()
    val constant = instructions.getOrNull(0) as? OneRegisterInstruction
    val exit = instructions.getOrNull(1) as? OneRegisterInstruction
    if (hookId() != BUNDLED_CONTROLS || instructions.size != 2 || instructions[0].opcode != Opcode.CONST_STRING ||
        instructions[1].opcode != Opcode.RETURN_OBJECT || constant == null || constant.registerA != exit?.registerA ||
        (instructions[0] as? ReferenceInstruction)?.reference !is StringReference) {
        throw PatchException("Messenger controls: the extension's control list differs from this patch version")
    }
    replaceInstruction(0, "const-string v${constant.registerA}, \"${keys.sorted().joinToString(",")}\"")
}

/** Records an applied control in the patched code, which Root Mount installs read instead of the manifest. */
internal fun BytecodePatchContext.recordControl(key: String) {
    bundledControls.add(key)
    mutableClassDefBy(HOST_SCREENS).methods.single { it.hookId() == BUNDLED_CONTROLS }.writeBundledControls(bundledControls)
}

internal fun BytecodePatchContext.hookScreenHosts() {
    val factory = runCatching { mutableClassDefBy(FACTORY_TYPE) }.getOrElse { factoryChanged() }
    val activity = factory.methods.singleOrNull { it.hookId() == INSTANTIATE_ACTIVITY } ?: factoryChanged()
    val application = factory.methods.singleOrNull { it.hookId() == INSTANTIATE_APPLICATION } ?: factoryChanged()
    injectFactory(activity, application)
}
