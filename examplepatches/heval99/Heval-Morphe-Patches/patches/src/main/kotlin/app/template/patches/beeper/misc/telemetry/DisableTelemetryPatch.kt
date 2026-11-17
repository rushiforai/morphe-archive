package app.template.patches.beeper.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BEEPER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Beeper bundles Sentry with R8-minified internals: SentryAndroid itself is renamed, but the
// auto-init provider keeps its library class name and contains the same init call shape. The app's
// own crash logging (com.beeper.crashlogging) calls that same method, so making it return at once
// stops both paths with one hook.
private const val SENTRY_INIT_PROVIDER = "Lio/sentry/android/core/SentryInitProvider;"

private fun MethodReference.isSentryInit() =
    returnType == "V" &&
        parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;" &&
        parameterTypes.drop(1).all { it.toString().startsWith("Lio/sentry/") }

/**
 * Turns off Sentry crash reporting. The stock manifest already disables the SDK's auto-init
 * (`io.sentry.auto-init=false`), so the live path is the app's own initialiser; both it and the
 * provider end in one static method, which is located through the provider and made to return at
 * once. Beeper's own backend calls and push are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables crash reporting.",
) {
    compatibleWith(COMPATIBILITY_BEEPER)

    execute {
        val provider = mutableClassDefBy(SENTRY_INIT_PROVIDER)
        val onCreate = provider.methods.singleOrNull {
            it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                it.implementation != null
        } ?: throw PatchException("$SENTRY_INIT_PROVIDER->onCreate()Z not found")

        val init = onCreate.implementation!!.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? MethodReference }
            .singleOrNull { it.definingClass != provider.type && it.isSentryInit() }
            ?: throw PatchException("no single Sentry init call in $SENTRY_INIT_PROVIDER->onCreate")

        val target = mutableClassDefBy(init.definingClass).methods.singleOrNull { method ->
            method.name == init.name && method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) ==
                init.parameterTypes.map(CharSequence::toString)
        } ?: throw PatchException("Sentry init ${init.definingClass}->${init.name} not found")
        target.returnEarly()
    }
}
