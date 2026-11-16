package arpit.morphe.patches.alphaprogression.pairip

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import arpit.morphe.patches.alphaprogression.shared.Constants.COMPATIBILITY_ALPHA_PROGRESSION
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.util.Base64

private const val VM_RUNNER = "Lcom/pairip/VMRunner;"
private const val SIGNATURE_CHECK = "Lcom/pairip/SignatureCheck;"
private const val STARTUP_LAUNCHER = "Lcom/pairip/StartupLauncher;"
private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"

/**
 * Replaces the body of a method with a minimal return of the correct type.
 *
 * `returnEarly()` only supports void methods, so VM call sites that return a value need
 * a matching default (null for objects, zero for primitives).
 */
private fun MutableMethod.returnDefault() {
    when {
        returnType == "V" -> returnEarly()
        returnType == "Z" -> returnEarly(false)
        returnType == "B" -> returnEarly(0.toByte())
        returnType == "S" -> returnEarly(0.toShort())
        returnType == "C" -> returnEarly('\u0000')
        returnType == "I" -> returnEarly(0)
        returnType == "J" -> returnEarly(0L)
        returnType == "F" -> returnEarly(0f)
        returnType == "D" -> returnEarly(0.0)
        returnType == "Ljava/lang/String;" || returnType == "Ljava/lang/CharSequence;" -> returnEarly("")
        returnType.startsWith("L") || returnType.startsWith("[") -> returnEarly(null as Void?)
        else -> returnEarly()
    }
}

/**
 * Escapes a value for a smali string literal.
 */
private fun escapeSmali(value: String): String = buildString {
    for (ch in value) {
        when (ch) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> if (ch.code < 0x20) append("\\u%04x".format(ch.code)) else append(ch)
        }
    }
}

/**
 * Restores the string literals PairIP's VM would have written into holder fields.
 *
 * The TSV is `class<TAB>field<TAB>base64(value)`, captured from the genuine Play-signed
 * build (all 1,441 values across 32 holder classes, 7.7.1). Each holder gets a synthetic
 * `<clinit>` that seeds its static String fields, so consumers see the real values with the
 * VM disabled.
 */
private fun BytecodePatchContext.restorePairIpStrings(resource: String) {
    val stream = object {}.javaClass.getResourceAsStream(resource)
        ?: error("Missing resource $resource")

    val entries = stream.bufferedReader(Charsets.UTF_8).use { it.readLines() }
        .filter { it.isNotBlank() }
        .map { line ->
            val parts = line.split('\t')
            check(parts.size == 3) { "Malformed depairip row: $line" }
            Triple(parts[0], parts[1], parts[2])
        }
        .groupBy { it.first }

    for ((type, rows) in entries) {
        val holder = mutableClassDefByOrNull(type) ?: error("PairIP holder $type not found")
        check(holder.methods.none { it.name == "<clinit>" }) {
            "$type already has a <clinit>; cannot seed PairIP strings."
        }

        val body = buildString {
            for ((_, field, encoded) in rows) {
                check(holder.fields.any { it.name == field }) { "Missing field $type->$field" }
                val value = String(Base64.getDecoder().decode(encoded), Charsets.UTF_8)
                append("const-string v0, \"")
                append(escapeSmali(value))
                append("\"\n")
                append("sput-object v0, $type->$field:Ljava/lang/String;\n")
            }
            append("return-void")
        }

        val clinit = ImmutableMethod(
            type,
            "<clinit>",
            emptyList(),
            "V",
            AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
            null,
            null,
            ImmutableMethodImplementation(1, emptyList(), null, null),
        ).toMutable()

        holder.methods.add(clinit)
        clinit.addInstructions(0, body)
    }
}

/**
 * Devirtualizes the PairIP method stubs.
 *
 * The VM replaced these bodies with a reflective call to a generated companion class
 * (`MainActivity$c2020060317`, …). Those companions are not in the DEX, but:
 * - MainActivity's real onCreate body survives as `p(Bundle)`;
 * - the lifecycle overrides only chain to `super`, which the in-DEX synthetics still do;
 * - the two `onBind` services are not part of the app's UI path and return null.
 *
 * Every stub keeps its original unreachable code after the injected return.
 */
private fun BytecodePatchContext.devirtualizePairIpMethods() {
    data class Stub(
        val type: String,
        val name: String,
        val params: List<String>,
        val body: String,
    )

    val stubs = listOf(
        Stub(
            "Lcom/alphaprogression/alphaprogression/MainActivity;", "onCreate",
            listOf("Landroid/os/Bundle;"),
            "invoke-virtual {p0, p1}, Lcom/alphaprogression/alphaprogression/MainActivity;" +
                "->p(Landroid/os/Bundle;)V\nreturn-void",
        ),
        Stub(
            "Lcom/alphaprogression/alphaprogression/MainActivity;", "onDestroy", emptyList(),
            "invoke-super {p0}, Lg/i;->onDestroy()V\nreturn-void",
        ),
        Stub(
            "Lcom/alphaprogression/alphaprogression/MainActivity;", "onPause", emptyList(),
            "invoke-super {p0}, Landroidx/fragment/app/y;->onPause()V\nreturn-void",
        ),
        Stub(
            "Lcom/alphaprogression/alphaprogression/MainActivity;", "onResume", emptyList(),
            "invoke-super {p0}, Landroidx/fragment/app/y;->onResume()V\nreturn-void",
        ),
        Stub(
            "Lcom/alphaprogression/alphaprogression/MainActivity;", "onStart", emptyList(),
            "invoke-super {p0}, Lg/i;->onStart()V\nreturn-void",
        ),
        Stub(
            "Lcom/alphaprogression/alphaprogression/MainActivity;", "onStop", emptyList(),
            "invoke-super {p0}, Lg/i;->onStop()V\nreturn-void",
        ),
        Stub(
            "Lcom/google/firebase/auth/internal/RecaptchaActivity;", "onCreate",
            listOf("Landroid/os/Bundle;"),
            "invoke-super {p0, p1}, Landroidx/fragment/app/y;->onCreate(Landroid/os/Bundle;)V\nreturn-void",
        ),
        Stub(
            "Lcom/google/firebase/auth/internal/RecaptchaActivity;", "onResume", emptyList(),
            "invoke-super {p0}, Landroidx/fragment/app/y;->onResume()V\nreturn-void",
        ),
        Stub(
            "Lcom/google/firebase/auth/internal/GenericIdpActivity;", "onCreate",
            listOf("Landroid/os/Bundle;"),
            "invoke-super {p0, p1}, Landroidx/fragment/app/y;->onCreate(Landroid/os/Bundle;)V\nreturn-void",
        ),
        Stub(
            "Lcom/google/firebase/auth/internal/GenericIdpActivity;", "onResume", emptyList(),
            "invoke-super {p0}, Landroidx/fragment/app/y;->onResume()V\nreturn-void",
        ),
        Stub(
            "Lorg/apache/cordova/health/PermissionsRationaleActivity;", "onCreate",
            listOf("Landroid/os/Bundle;"),
            "invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V\nreturn-void",
        ),
        Stub(
            "Lcom/google/android/gms/auth/api/signin/RevocationBoundService;", "onBind",
            listOf("Landroid/content/Intent;"),
            "const/4 v0, 0x0\nreturn-object v0",
        ),
        Stub(
            "Landroidx/health/platform/client/impl/sdkservice/HealthDataSdkService;", "onBind",
            listOf("Landroid/content/Intent;"),
            "const/4 v0, 0x0\nreturn-object v0",
        ),
    )

    for (stub in stubs) {
        val holder = mutableClassDefByOrNull(stub.type) ?: error("Missing ${stub.type}")
        val method = holder.methods.firstOrNull {
            it.name == stub.name && it.parameterTypes.map(CharSequence::toString) == stub.params
        } ?: error("Missing PairIP stub ${stub.type}->${stub.name}")

        method.addInstructions(0, stub.body)
    }
}

/**
 * EXPERIMENTAL — disables PairIP's DEX VM and Play licence verdicts for a re-signed build.
 *
 * On a normal sideload `com.pairip.application.Application.<clinit>` starts the native VM,
 * which opens the Play Store listing and then segfaults in `libpairipcore` because the
 * re-signed APK cannot satisfy its integrity checks. This patch removes the VM instead of
 * trying to satisfy it:
 * 1. `VMRunner.<clinit>` returns early, so `System.loadLibrary("pairipcore")` never runs.
 * 2. `VMRunner.invoke` returns null, and every call site outside `com.pairip` is replaced
 *    with a default return of the correct type — those methods were virtualized into the
 *    VM payload and cannot run without it.
 * 3. `SignatureCheck.verifyIntegrity` / `verifySignatureMatches` are neutralised.
 * 4. `StartupLauncher.launch` (the startup VM program) returns early.
 * 5. `LicenseClient.checkLicense` / paywall / response handling return early, so no Play
 *    Store redirect and no shutdown.
 *
 * 6. Every `VMRunner.invoke` call site outside `com.pairip` is replaced with a default
 *    return — those three methods (profile installer, Adjust preinstall receiver and one
 *    background task) were virtualized into the VM payload and cannot run without it.
 * 7. The 1,441 relocated string literals are restored from
 *    `resources/alphaprogression/depairip_strings.tsv`, captured from the genuine
 *    Play-signed 7.7.1 build, by seeding the 32 holder classes' static String fields in
 *    synthetic `<clinit>`s.
 *
 * Anything that only needed the VM for its strings works normally; the three gutted methods
 * fall back to default return values.
 *
 * Not enabled by default.
 */
@Suppress("unused")
val pairIpBypassPatch = bytecodePatch(
    name = "Bypass PairIP checks",
    description = "Disables PairIP's native VM, signature check and Play licence verdicts so " +
        "a re-signed build does not open the Play Store listing or crash, and restores the " +
        "VM-relocated string literals captured from the genuine build. Experimental: three " +
        "VM-virtualized receiver/background methods fall back to default return values.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ALPHA_PROGRESSION)

    execute {
        // 1. Never load libpairipcore.
        mutableClassDefByOrNull(VM_RUNNER)
            ?.methods?.firstOrNull { it.name == "<clinit>" }
            ?.returnEarly()

        // 2. VM entry point returns null.
        mutableClassDefByOrNull(VM_RUNNER)
            ?.methods?.firstOrNull { it.name == "invoke" }
            ?.returnEarly(null as Void?)

        // 3. Signature verdicts.
        SignatureCheckVerifyIntegrityFingerprint.method.returnEarly()
        mutableClassDefByOrNull(SIGNATURE_CHECK)
            ?.methods?.firstOrNull { it.name == "verifySignatureMatches" }
            ?.returnEarly(true)

        // 4. Startup VM program.
        mutableClassDefByOrNull(STARTUP_LAUNCHER)
            ?.methods?.firstOrNull { it.name == "launch" }
            ?.returnEarly()

        // 5. Play licence verdicts and paywall.
        LicenseClientCheckLicenseFingerprint.method.returnEarly()
        listOf("startPaywallActivity", "processResponse", "initializeLicenseCheck").forEach { name ->
            mutableClassDefByOrNull(LICENSE_CLIENT)
                ?.methods?.firstOrNull { it.name == name }
                ?.returnEarly()
        }

        // 6. Gut every VM call site outside com.pairip. The classDef instruction lists are
        // one-shot iterables, so collect targets first and mutate afterwards.
        val targets = ArrayList<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/pairip/")) return@classDefForEach
            classDef.methods.forEach { method ->
                val implementation = method.implementation ?: return@forEach
                val callsVm = implementation.instructions.any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                    reference is MethodReference &&
                        reference.definingClass == VM_RUNNER &&
                        reference.name == "invoke"
                }
                if (callsVm) targets.add(classDef to method)
            }
        }

        require(targets.isNotEmpty()) {
            "No VMRunner.invoke call sites found outside com.pairip; PairIP layout changed."
        }

        var cleared = 0
        for ((classDef, method) in targets) {
            val mutable = mutableClassDefBy(classDef).methods.firstOrNull {
                it.name == method.name &&
                    it.returnType == method.returnType &&
                    it.parameterTypes == method.parameterTypes
            }
            if (mutable != null) {
                mutable.returnDefault()
                cleared++
            }
        }
        check(cleared == targets.size) {
            "Cleared $cleared of ${targets.size} PairIP VM call sites; anchors moved."
        }

        // 6b. `j6/b` is Firebase's SSL-context AsyncTask. Its onPostExecute unboxes the
        // Integer returned by doInBackground, so the generic null return above crashes the
        // main thread with an NPE once the task finishes. Report "nothing to update".
        mutableClassDefByOrNull("Lj6/b;")
            ?.methods?.firstOrNull { it.name == "doInBackground" }
            ?.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v0
                    return-object v0
                """.trimIndent(),
            )

        // 7. Restore the values the VM used to materialise. Captured from the genuine
        // Play-signed 7.7.1 build: 1,441 strings across 32 holder classes.
        restorePairIpStrings("/alphaprogression/depairip_strings.tsv")

        // 8. Replace the reflective method stubs with their in-DEX equivalents.
        devirtualizePairIpMethods()
    }
}
