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
private const val ACTIVITY_START_DESC =
    "$DIAG_CLASS->activityStart(Landroid/app/Activity;)V"

/** Launcher activities across the Opera family (manifest android:name). */
private val LAUNCHER_ACTIVITIES = listOf(
    "Lcom/opera/android/BrowserActivity;", // stable + beta (alias target)
    "Lcom/opera/android/MainActivity;", // GX and older variants
)

private fun isExtensionClass(type: String): Boolean =
    type.startsWith("Lapp/template/extension/") || type.startsWith("Lapp/morphe/")

private fun isApplicationSubclass(classDef: ClassDef): Boolean =
    !isExtensionClass(classDef.type) &&
        (classDef.superclass == "Landroid/app/Application;" || classDef.superclass == HOOK_SUPERCLASS)

/**
 * Installs a startup breadcrumb trail and an uncaught-exception crash
 * reporter into every Application subclass of the target app (plus the
 * launcher activity), so that a patched build that dies on launch records
 * its own full stack trace and how far startup got - no `adb logcat` and
 * no root required.
 *
 * v1.3.0: every breadcrumb is mirrored to logcat (tag "VogelkopDiag"), file
 * writes are unbuffered + fsync'ed, a 500 ms heartbeat bounds the moment of
 * a silent kill, and the launcher activity's onCreate is a second,
 * independent injection point (activityStart) - so the "empty log" failure
 * mode of Test A (file exists, 0 bytes, no breadcrumbs) can no longer happen
 * silently: either the file carries the trail, or logcat does.
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
 *  - start of the launcher activity's `onCreate(Bundle)`:
 *    `StartupDiag.activityStart(this)` (optional; skipped when the class
 *    does not exist in the target build).
 *
 * The crash handler chains to (and then re-asserts itself over) Opera's own
 * breakpad handler, so Opera's crash flow is preserved. This patch is
 * independent of *Spoof app signature* and intentionally ships its own
 * extension dex (extensions/diag.mpe), so a no-spoof build still self-reports.
 */
@Suppress("unused")
val operaStartupDiagnosticsPatch = bytecodePatch(
    name = "Startup diagnostics",
    description = "Records a startup breadcrumb trail (mirrored to logcat " +
        "tag VogelkopDiag) and the full stack trace of any launch crash to " +
        "Android/data/<package>/files/vogelkop-diag.log (openable with any " +
        "file manager). v1.3.0: unbuffered fsync'ed writes, a 500 ms " +
        "heartbeat, and a launcher-activity injection point, so a launch " +
        "death always leaves a trace in the file or in logcat. Also logs " +
        "which signing certificate the app sees for itself. Leave enabled " +
        "while debugging a startup crash; it does not alter app behavior " +
        "and never throws.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY, OPERA_GX_COMPATIBILITY)

    extendWith("extensions/diag.mpe")

    execute {
        var injectedApps = 0
        var attachBaseContextInjected = 0
        var onCreateInjected = 0
        var activitiesInjected = 0

        classDefForEach { classDef ->
            if (!isExtensionClass(classDef.type) &&
                LAUNCHER_ACTIVITIES.contains(classDef.type)
            ) {
                val mutableClass = mutableClassDefBy(classDef)
                for (mutableMethod in mutableClass.methods.toList()) {
                    val implementation = mutableMethod.implementation ?: continue
                    if (mutableMethod.name == "onCreate" &&
                        mutableMethod.returnType == "V" &&
                        !AccessFlags.STATIC.isSet(mutableMethod.accessFlags) &&
                        (mutableMethod.parameterTypes.isEmpty() ||
                            mutableMethod.parameterTypes == listOf("Landroid/os/Bundle;"))
                    ) {
                        // 'this' sits at registerCount - 1 - <param count>:
                        // parameters occupy the HIGHEST registers, and for
                        // onCreate(Bundle) the last register holds the Bundle,
                        // not the receiver.
                        val thisRegister =
                            implementation.registerCount - 1 - mutableMethod.parameterTypes.size
                        mutableMethod.addInstructions(
                            0,
                            activityStartInstruction(thisRegister),
                        )
                        activitiesInjected++
                    }
                }
                return@classDefForEach
            }

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
            append("), launcher activities x")
            append(activitiesInjected)
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

private fun activityStartInstruction(register: Int): String =
    if (register <= 15) {
        "invoke-static {v$register}, $ACTIVITY_START_DESC"
    } else {
        "invoke-static/range {v$register .. v$register}, $ACTIVITY_START_DESC"
    }
