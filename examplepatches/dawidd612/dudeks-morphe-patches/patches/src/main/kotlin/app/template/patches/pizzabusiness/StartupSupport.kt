package app.template.patches.pizzabusiness

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Narrow startup companion. Preserve protected SDK methods and their return types. */
internal val pizzaStartupSupport = bytecodePatch {
    dependsOn(pizzaNativeBootstrap)
    execute {
        val context = "Landroid/content/Context;"
        if (PizzaProfiles.forPackage(packageMetadata).protectedInitialization) {
            val signature = "Lcom/pairip/SignatureCheck;"
            val launcher = "Lcom/pairip/StartupLauncher;"
            val license = "Lcom/pairip/licensecheck/LicenseClient;"
            val vm = "Lcom/pairip/VMRunner;"
            val attach = pizzaMethod("Lcom/pairip/application/Application;", "attachBaseContext", listOf(context), "V", static = false)
            val integrity = pizzaMethod(signature, "verifyIntegrity", listOf(context), "V")
            val startup = pizzaMethod(launcher, "launch", emptyList(), "V")
            val checkLicense = pizzaMethod(license, "checkLicense", listOf(context), "V")
            val program = classDefBy(launcher).fields.singleOrNull { it.name == "startupProgramName" && it.type == STRING }
            requirePizza(attach.calls(signature, "verifyIntegrity") && attach.calls(license, "checkLicense") &&
                attach.calls(vm, "setContext"), "application startup changed")
            requirePizza(integrity.hasString("Apk signature is invalid.") && startup.calls(vm, "invoke") &&
                (program?.initialValue as? StringEncodedValue)?.value == PizzaProfiles.forPackage(packageMetadata).startupProgram && checkLicense.implementation != null &&
                checkLicense.instructions.size > 1, "re-signed startup shape changed or already patched")

            // checkLicense is not the only entry: TrialClient/JNI and queued retries
            // can enter the client directly. Guard the whole local licensing path
            // before changing any body. Do not invent a signed license response.
            val stopTrial = pizzaMethod(license, "stopTrial", listOf(context), "V")
            val initialize = pizzaMethod(license, "initializeLicenseCheck", emptyList(), "V", static = false)
            val trialEnd = pizzaMethod(license, "handleTrialEnd", emptyList(), "V", static = false)
            val bind = pizzaMethod(license, "bindToLicensingService", listOf("Z"), "V", static = false)
            val response = pizzaMethod(license, "processResponse", listOf("I", "Landroid/os/Bundle;"), "V", static = false)
            val repeat = pizzaMethod(license, "scheduleRepeatedLicenseCheck",
                listOf("Lcom/pairip/licensecheck/RepeatedCheckMetadata;"), "V", static = false)
            val paywall = pizzaMethod(license, "startPaywallActivity", listOf("Landroid/app/PendingIntent;"), "V", static = false)
            val error = pizzaMethod(license, "startErrorDialogActivity", emptyList(), "V", static = false)
            val shutdown = pizzaMethod(license, "scheduleAppShutdown", emptyList(), "V", static = false)
            val screen = pizzaMethod("Lcom/pairip/licensecheck/LicenseActivity;", "onStart", emptyList(), "V", static = false)
            requirePizza(stopTrial.hasString("Cannot trigger trial end with null context.") &&
                trialEnd.calls(license, "initiateFreshLicensingServiceConnection") &&
                initialize.calls(license, "initiateFreshLicensingServiceConnection") &&
                bind.calls(context, "bindService") && response.calls(license, "startPaywallActivity") &&
                repeat.hasString("Repeated license check is scheduled in %d ms...") &&
                paywall.calls(context, "startActivity") && error.calls(context, "startActivity") &&
                shutdown.calls("Lcom/pairip/licensecheck/LicenseClient\$DelayedTaskExecutor;", "schedule") &&
                screen.calls("Landroid/app/Activity;", "onStart") &&
                screen.calls("Lcom/pairip/licensecheck/LicenseActivity;", "showPaywallAndCloseApp"),
                "licensing entry, retry or remediation flow changed")

            // Preserve initialized constants, native code/imports and recovered SDK
            // behavior before replacing the original re-signing startup path.
            restorePizzaBootstrap()

            integrity.replaceBody("return-void")
            startup.replaceBody("return-void")
            checkLicense.replaceBody("return-void")
            listOf(stopTrial, initialize, trialEnd, bind, response, repeat, paywall, error, shutdown)
                .forEach { it.replaceBody("return-void") }
            screen.replaceBody("""
                invoke-super {p0}, Landroid/app/Activity;->onStart()V
                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                return-void
            """.trimIndent())
        } else {
            requirePizza(classDefByOrNull { it.type.startsWith("Lcom/pairip/") } == null,
                "unprotected profile unexpectedly contains PairIP")
        }

        // Tapjoy's connection worker outlives Activity recreation. Android
        // automatically removes Activity-owned receivers on destruction, then
        // the worker crashes when it performs its normal unregister. Give only
        // this receiver the application lifetime; retain SDK UI contexts,
        // connection retries, callbacks and unregister/finally behavior.
        val workers = classDefByStrings("android.net.conn.CONNECTIVITY_CHANGE").flatMap { cls ->
            cls.methods.filter { it.name == "run" && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                it.hasString("android.net.conn.CONNECTIVITY_CHANGE") &&
                it.calls(context, "registerReceiver") && it.calls(context, "unregisterReceiver") }
        }
        requirePizza(workers.size == 1, "Tapjoy connection receiver is missing or ambiguous")
        val candidate = workers.single()
        val worker = pizzaMethod(candidate.definingClass, "run", emptyList(), "V", static = false)
        val workerCode = worker.instructions.toList()
        val stores = workerCode.withIndex().filter { (index, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            val previous = workerCode.getOrNull(index - 1)
            val cast = (previous as? ReferenceInstruction)?.reference as? TypeReference
            // R8 can merge the worker and erase its Context field to Object.
            // In that layout, the preceding cast identifies the same receiver context.
            instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == worker.definingClass &&
                (field.type == context || (field.type == "Ljava/lang/Object;" &&
                    previous?.opcode == Opcode.CHECK_CAST && cast?.type == context &&
                    (previous as OneRegisterInstruction).registerA == (instruction as TwoRegisterInstruction).registerA))
        }
        requirePizza(stores.size == 1 && worker.hasString("android.net.conn.CONNECTIVITY_CHANGE") &&
            worker.calls(context, "registerReceiver") && worker.calls(context, "unregisterReceiver"),
            "Tapjoy connection receiver lifetime changed")
        val store = stores.single()
        val receiverContext = (store.value as TwoRegisterInstruction).registerA
        worker.addInstructions(store.index, """
            invoke-virtual {v$receiverContext}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;
            move-result-object v$receiverContext
        """.trimIndent())
    }
}
