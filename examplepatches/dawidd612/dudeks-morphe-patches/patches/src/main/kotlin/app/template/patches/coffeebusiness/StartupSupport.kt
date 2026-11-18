package app.template.patches.coffeebusiness

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Narrow startup companion. Preserve protected SDK methods and their return types. */
@Suppress("unused")
val coffeeStartupSupport = bytecodePatch(
    name = "Coffee startup support",
    description = "Restores version-specific Unity startup after re-signing.",
    default = false,
) {
    compatibleWith(CoffeeProfiles.compatibility)
    dependsOn(coffeeNativeBootstrap)
    extendWith("extensions/coffeebusiness.mpe")
    // Exact Firebase C++ SDK classes embedded in this version's native library.
    // Keeping their JNI callbacks in the app class loader avoids Android 15's
    // cross-class-loader native-bridge registration bug (AOSP b/393035780).
    extendWith(CoffeeProfiles.firebaseResource)
    execute {
        // Newer unprotected builds already contain their original SDK/startup
        // implementations. Their sideloaded Unity packs still need the bridge.
        if (!CoffeeProfiles.forPackage(packageMetadata).protectedInitialization) {
            restoreCoffeeAssetPacks()
            return@execute
        }
        val context = "Landroid/content/Context;"
        val signature = "Lcom/pairip/SignatureCheck;"
        val launcher = "Lcom/pairip/StartupLauncher;"
        val license = "Lcom/pairip/licensecheck/LicenseClient;"
        val vm = "Lcom/pairip/VMRunner;"
        val attach = coffeeMethod("Lcom/pairip/application/Application;", "attachBaseContext", listOf(context), "V", static = false)
        val integrity = coffeeMethod(signature, "verifyIntegrity", listOf(context), "V")
        val startup = coffeeMethod(launcher, "launch", emptyList(), "V")
        val checkLicense = coffeeMethod(license, "checkLicense", listOf(context), "V")
        val program = classDefBy(launcher).fields.singleOrNull { it.name == "startupProgramName" && it.type == STRING }
        checkCoffee(attach.calls(signature, "verifyIntegrity") && attach.calls(license, "checkLicense") &&
            attach.calls(vm, "setContext"), "application startup changed")
        checkCoffee(integrity.hasString("Apk signature is invalid.") && startup.calls(vm, "invoke") &&
            (program?.initialValue as? StringEncodedValue)?.value == CoffeeProfiles.forPackage(packageMetadata).startupProgram && checkLicense.implementation != null &&
            checkLicense.instructions.size > 1, "re-signed startup shape changed or already patched")

        // checkLicense is not the only entry: TrialClient/JNI and queued retries
        // can enter the client directly. Guard the whole local licensing path
        // before changing any body. Do not invent a signed license response.
        val stopTrial = coffeeMethod(license, "stopTrial", listOf(context), "V")
        val initialize = coffeeMethod(license, "initializeLicenseCheck", emptyList(), "V", static = false)
        val trialEnd = coffeeMethod(license, "handleTrialEnd", emptyList(), "V", static = false)
        val bind = coffeeMethod(license, "bindToLicensingService", listOf("Z"), "V", static = false)
        val response = coffeeMethod(license, "processResponse", listOf("I", "Landroid/os/Bundle;"), "V", static = false)
        val repeat = coffeeMethod(license, "scheduleRepeatedLicenseCheck",
            listOf("Lcom/pairip/licensecheck/RepeatedCheckMetadata;"), "V", static = false)
        val paywall = coffeeMethod(license, "startPaywallActivity", listOf("Landroid/app/PendingIntent;"), "V", static = false)
        val error = coffeeMethod(license, "startErrorDialogActivity", emptyList(), "V", static = false)
        val shutdown = coffeeMethod(license, "scheduleAppShutdown", emptyList(), "V", static = false)
        val screen = coffeeMethod("Lcom/pairip/licensecheck/LicenseActivity;", "onStart", emptyList(), "V", static = false)
        checkCoffee(stopTrial.hasString("Cannot trigger trial end with null context.") &&
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
        restoreCoffeeBootstrap()
        restoreCoffeeAssetPacks()

        // VMRunner and all remaining protected callers retain their return types.
        integrity.replaceBody("return-void")
        startup.replaceBody("return-void")
        checkLicense.replaceBody("return-void")
        listOf(stopTrial, initialize, trialEnd, bind, response, repeat, paywall, error, shutdown)
            .forEach { it.replaceBody("return-void") }
        // A saved Android task can restore this activity independently of a new
        // license request. Finish only this activity, never the game's tasks.
        screen.replaceBody("""
            invoke-super {p0}, Landroid/app/Activity;->onStart()V
            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
            return-void
        """.trimIndent())
    }
}
