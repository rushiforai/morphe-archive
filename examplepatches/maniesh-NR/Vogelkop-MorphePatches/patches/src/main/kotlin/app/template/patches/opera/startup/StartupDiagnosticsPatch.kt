package app.template.patches.opera.startup

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import app.template.patches.opera.OPERA_GX_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

private const val DIAG_CLASS = "Lapp/template/extension/diag/StartupDiag;"
private const val HOOK_SUPERCLASS = "Lapp/template/extension/extension/SignatureHookApp;"

private const val INIT_DESC =
    "$DIAG_CLASS->init(Landroid/content/Context;)V"
private const val ON_CREATE_START_DESC =
    "$DIAG_CLASS->onCreateStart(Landroid/app/Application;)V"
private const val ON_CREATE_END_DESC =
    "$DIAG_CLASS->onCreateEnd()V"

private fun isExtensionClass(type: String): Boolean =
    type.startsWith("Lapp/template/extension/") || type.startsWith("Lapp/morphe/")

private fun isApplicationSubclass(classDef: ClassDef): Boolean =
    !isExtensionClass(classDef.type) &&
        (classDef.superclass == "Landroid/app/Application;" || classDef.superclass == HOOK_SUPERCLASS)

/**
 * Installs a startup breadcrumb trail and an uncaught-exception crash
 * reporter into every Application subclass of the target app, so that a
 * patched build that dies on launch records its own full stack trace and how
 * far startup got - no `adb logcat` and no root required.
 *
 * The log lands in the app's own external files directory
 * (`Android/data/<package>/files/vogelkop-diag.log`), which any file manager
 * can open without permissions, and it also records:
 *
 *  - device model, Android version, app version;
 *  - the signing certificate the app currently sees for itself (proves at
 *    runtime whether *Spoof app signature* engaged - Opera's vendor
 *    certificate vs. the Morphe key);
 *  - the spoof hook's own install state, read reflectively (works with the
 *    spoof disabled, in which case the state is "absent").
 *
 * Injection points, all register-neutral (existing registers are only ever
 * read, never written):
 *
 *  - start of every `attachBaseContext(Context)`: `StartupDiag.init(ctx)`
 *    (runs before ContentProviders and Application.onCreate, so early-init
 *    and provider crashes are captured by the handler installed there);
 *  - start of every `onCreate()`: `StartupDiag.onCreateStart(this)`;
 *  - before every `return-void` in every `onCreate()`:
 *    `StartupDiag.onCreateEnd()`.
 *
 * The crash handler chains to (and then re-asserts itself over) Opera's own
 * breakpad handler, so Opera's crash flow is preserved. This patch is
 * independent of *Spoof app signature* and intentionally ships its own
 * extension dex (extensions/diag.mpe), so a no-spoof build still self-reports.
 */
@Suppress("unused")
val operaStartupDiagnosticsPatch = bytecodePatch(
    name = "Startup diagnostics",
    description = "Records a startup breadcrumb trail and the full stack trace " +
        "of any launch crash to Android/data/<package>/files/vogelkop-diag.log " +
        "(openable with any file manager). Also logs which signing certificate " +
        "the app sees for itself, proving whether the signature spoof engaged. " +
        "Leave enabled while debugging a startup crash; it does not alter app " +
        "behavior and never throws.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY, OPERA_GX_COMPATIBILITY)

    extendWith("extensions/diag.mpe")

    execute {
        var injectedApps = 0
        var attachBaseContextInjected = 0
        var onCreateInjected = 0
        var skippedHighRegisters = 0

        classDefForEach { classDef ->
            if (!isApplicationSubclass(classDef)) return@classDefForEach

            val mutableClass = mutableClassDefBy(classDef)
            var touchedThisClass = false

            for (mutableMethod in mutableClass.methods.toList()) {
                val implementation = mutableMethod.implementation ?: continue

                if (mutableMethod.name == "attachBaseContext" &&
                    mutableMethod.returnType == "V" &&
                    mutableMethod.parameterTypes == listOf("Landroid/content/Context;") &&
                    !AccessFlags.STATIC.isSet(mutableMethod.accessFlags)
                ) {
                    val register = implementation.registerCount - 1
                    mutableMethod.addInstructions(
                        0,
                        contextInitInstruction(register),
                    )
                    attachBaseContextInjected++
                    touchedThisClass = true
                }

                if (mutableMethod.name == "onCreate" &&
                    mutableMethod.returnType == "V" &&
                    mutableMethod.parameterTypes.isEmpty() &&
                    !AccessFlags.STATIC.isSet(mutableMethod.accessFlags)
                ) {
                    val thisRegister = implementation.registerCount - 1
                    mutableMethod.addInstructions(
                        0,
                        onCreateStartInstruction(thisRegister),
                    )
                    // insert before every return-void, highest index first so
                    // the earlier indices stay valid
                    val returnIndices = mutableListOf<Int>()
                    var index = 0
                    for (ins in implementation.instructions.toList()) {
                        if (ins.opcode == Opcode.RETURN_VOID) {
                            returnIndices.add(index)
                        }
                        index++
                    }
                    for (returnIndex in returnIndices.sortedDescending()) {
                        mutableMethod.addInstructions(returnIndex, "invoke-static {}, $ON_CREATE_END_DESC")
                    }
                    onCreateInjected++
                    touchedThisClass = true
                }
            }

            if (touchedThisClass) {
                injectedApps++
            }
        }

        if (injectedApps == 0) {
            throw PatchException(
                "No Application subclass could be instrumented with startup diagnostics",
            )
        }

        val summary = buildString {
            append("Startup diagnostics: instrumented ")
            append(injectedApps)
            append(" Application subclass(es) (attachBaseContext x")
            append(attachBaseContextInjected)
            append(", onCreate x")
            append(onCreateInjected)
            append(")")
            if (skippedHighRegisters > 0) {
                append(", skipped ")
                append(skippedHighRegisters)
                append(" injection point(s) without a usable single-register form")
            }
        }
        println(summary)
    }
}

/**
 * `invoke-static` (35c) cannot address registers above v15; the /range form
 * (78c) has no register-index limit and is valid for a single register, so
 * every param-only injection point is always expressible.
 */
private fun contextInitInstruction(register: Int): String =
    if (register <= 15) {
        "invoke-static {v$register}, $INIT_DESC"
    } else {
        "invoke-static/range {v$register .. v$register}, $INIT_DESC"
    }

private fun onCreateStartInstruction(register: Int): String =
    if (register <= 15) {
        "invoke-static {v$register}, $ON_CREATE_START_DESC"
    } else {
        "invoke-static/range {v$register .. v$register}, $ON_CREATE_START_DESC"
    }
