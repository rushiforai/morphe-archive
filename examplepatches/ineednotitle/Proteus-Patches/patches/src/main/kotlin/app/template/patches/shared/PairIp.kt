package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.Base64

private const val SIGNATURE_CHECK = "Lcom/pairip/SignatureCheck;"
private const val VM_RUNNER = "Lcom/pairip/VMRunner;"
private const val STARTUP_LAUNCHER = "Lcom/pairip/StartupLauncher;"

/**
 * Replace a method body with a type-correct early return.
 *
 * PairIP ships different method signatures across app versions. Hard-coding
 * `return-void` or `return-object v0` for a method whose return type changed
 * produces invalid DEX and the app fails verification on launch. This helper
 * picks the matching return form for the method it is given.
 */
private fun MutableMethod.neutralize() {
    if (implementation == null) return
    when (returnType.first()) {
        'V' -> returnEarly()
        'Z' -> returnEarly(false)
        'B' -> returnEarly(0.toByte())
        'S' -> returnEarly(0.toShort())
        'C' -> returnEarly(0.toChar())
        'I' -> returnEarly(0)
        'J' -> returnEarly(0L)
        'F' -> returnEarly(0f)
        'D' -> returnEarly(0.0)
        else -> returnEarly(null as Void?)
    }
}

fun BytecodePatchContext.gutPairIpVm(vararg extraNoOps: Pair<String, String>) {
    mutableClassDefByOrNull(SIGNATURE_CHECK)
        ?.methods?.firstOrNull { it.name == "verifyIntegrity" }?.neutralize()

    mutableClassDefByOrNull(VM_RUNNER)?.let { vmRunner ->
        vmRunner.methods.firstOrNull { it.name == "<clinit>" }?.neutralize()
        vmRunner.methods.firstOrNull { it.name == "invoke" }?.neutralize()
    }

    mutableClassDefByOrNull(STARTUP_LAUNCHER)
        ?.methods?.firstOrNull { it.name == "launch" }?.neutralize()

    for ((cls, method) in extraNoOps)
        mutableClassDefByOrNull(cls)?.methods?.firstOrNull { it.name == method }?.neutralize()
}

fun BytecodePatchContext.restorePairIpHolders(resourceDir: String) {
    fun resource(name: String) =
        object {}.javaClass.getResourceAsStream("/$resourceDir/$name")?.bufferedReader()?.readText()
            ?: error("Missing: /$resourceDir/$name")

    fun bakeClinit(type: String, registerCount: Int, body: String) {
        val holder = mutableClassDefByOrNull(type) ?: error("Holder $type not found")
        if (holder.methods.any { it.name == "<clinit>" }) error("$type already has <clinit>")
        val clinit = ImmutableMethod(
            type, "<clinit>", emptyList(), "V",
            AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
            null, null, ImmutableMethodImplementation(registerCount, emptyList(), null, null),
        ).toMutable()
        holder.methods.add(clinit)
        clinit.addInstructions(0, body)
    }

    var type: String? = null
    val body = StringBuilder()
    fun flushStrings() {
        val t = type ?: return
        body.append("return-void")
        bakeClinit(t, 1, body.toString())
        body.setLength(0)
    }
    resource("depairip_strings.tsv").lineSequence().filter { it.isNotBlank() }.forEach { line ->
        if (line.startsWith("@")) { flushStrings(); type = line.substring(1) }
        else {
            val tab = line.indexOf('\t')
            body.append("const-string v0, \"${line.substring(tab + 1)}\"\nsput-object v0, $type->${line.substring(0, tab)}:Ljava/lang/String;\n")
        }
    }
    flushStrings()

    resource("depairip_methods.tsv").lineSequence().filter { it.isNotBlank() }.forEach { line ->
        val (t, rc, b64) = line.split('\t', limit = 3)
        bakeClinit(t, rc.toInt(), String(Base64.getDecoder().decode(b64)))
    }
}

// ── killPairIpFull ────────────────────────────────────────────────────────────

/**
 * Full DEX-layer Pairip kill. Neutralises:
 *   VMRunner.<clinit>()                    — stops System.loadLibrary("pairipcore")
 *   VMRunner.invoke()                      — belt-and-suspenders
 *   SignatureCheck.verifyIntegrity()       — DEX cert check
 *   SignatureCheck.verifySignatureMatches() — returns true
 *   StartupLauncher.launch()               — IAP VM invoker
 *   LicenseClient.initializeLicenseCheck() — Play LVL, forced LOCAL_CHECK_OK
 *   LicenseClient.connectToLicensingService()
 *   LicenseClient.processResponse()        — NOT_LICENSED path
 *   LicenseClient.startPaywallActivity()   — paywall + System.exit failsafe
 *   All VMRunner.invoke() call sites outside com.pairip.*
 *
 * Missing classes/methods are skipped instead of failing, and every replacement
 * uses the method's real return type so different PairIP versions stay loadable.
 * Also calls [restorePairIpHolders] in app-specific patches to inject "" <clinit>s
 * into string holder classes and prevent NPEs when the native lib is not running.
 */
fun BytecodePatchContext.killPairIpFull(
    vararg extraNoOps: Pair<String, String>,
) {
    val sig   = "Lcom/pairip/SignatureCheck;"
    val vm    = "Lcom/pairip/VMRunner;"
    val sl    = "Lcom/pairip/StartupLauncher;"
    val lic   = "Lcom/pairip/licensecheck/LicenseClient;"
    val state = "Lcom/pairip/licensecheck/LicenseClient\$LicenseCheckState;"

    mutableClassDefByOrNull(vm)?.methods?.firstOrNull { it.name == "<clinit>" }?.neutralize()
    mutableClassDefByOrNull(vm)?.methods?.firstOrNull { it.name == "invoke" }?.neutralize()

    mutableClassDefByOrNull(sig)?.methods?.firstOrNull { it.name == "verifyIntegrity" }?.neutralize()
    mutableClassDefByOrNull(sig)?.methods?.firstOrNull { it.name == "verifySignatureMatches" }
        ?.let { method ->
            if (method.returnType == "Z") method.returnEarly(true) else method.neutralize()
        }

    mutableClassDefByOrNull(sl)?.methods?.firstOrNull { it.name == "launch" }?.neutralize()

    val licenseClient = mutableClassDefByOrNull(lic)
    val licenseState = mutableClassDefByOrNull(state)
    val hasLicenseStateField = licenseClient?.fields?.any { it.name == "licenseCheckState" } == true
    val hasLocalCheckOk = licenseState?.fields?.any { it.name == "LOCAL_CHECK_OK" } == true

    val initializeLicenseCheck = licenseClient?.methods
        ?.firstOrNull { it.name == "initializeLicenseCheck" }
    if (initializeLicenseCheck != null) {
        // Only write the enum field when both the field and the enum constant exist;
        // otherwise fall back to a plain early return so the class still verifies.
        if (hasLicenseStateField && hasLocalCheckOk &&
            (initializeLicenseCheck.implementation?.registerCount ?: 0) >= 1
        ) {
            initializeLicenseCheck.clearBody()
            initializeLicenseCheck.addInstructions(
                0,
                """
                    sget-object v0, $state->LOCAL_CHECK_OK:$state
                    sput-object v0, $lic->licenseCheckState:$state
                    return-void
                """.trimIndent(),
            )
        } else {
            initializeLicenseCheck.neutralize()
        }
    }

    listOf(
        "connectToLicensingService",
        "lambda\$retryOrThrow\$0",
        "processResponse",
        "startPaywallActivity",
    ).forEach { name ->
        licenseClient?.methods?.firstOrNull { it.name == name }?.neutralize()
    }

    // performLocalInstallerCheck must report success.
    licenseClient?.methods?.firstOrNull { it.name == "performLocalInstallerCheck" }
        ?.let { method ->
            if (method.returnType == "Z") method.returnEarly(true) else method.neutralize()
        }

    // validateResponse lives on ResponseValidator, not LicenseClient.
    val rv = "Lcom/pairip/licensecheck/ResponseValidator;"
    mutableClassDefByOrNull(rv)?.methods?.firstOrNull { it.name == "validateResponse" }
        ?.neutralize()

    // Disable repeated background checks via LicenseClient.<clinit>.
    // Guard both the field and register count: PairIP builds without the field
    // (or with an empty <clinit>) must not receive a dangling sput-boolean.
    val hasRepeatedCheckField =
        licenseClient?.fields?.any { it.name == "repeatedCheckEnabled" } == true
    licenseClient?.methods?.firstOrNull { it.name == "<clinit>" }?.let { clinit ->
        if (hasRepeatedCheckField &&
            (clinit.implementation?.registerCount ?: 0) >= 1
        ) {
            clinit.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    sput-boolean v0, $lic->repeatedCheckEnabled:Z
                """.trimIndent(),
            )
        }
    }

    // Clear VMRunner.invoke() call sites outside com.pairip.*. Only void callers are
    // rewritten: returning early from a typed method would need a value it may not
    // have, and the gutted VMRunner already returns a harmless default.
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lcom/pairip/")) return@classDefForEach
        val callers = classDef.methods.filter { method ->
            method.implementation?.instructions?.any { insn ->
                insn.opcode.name.startsWith("INVOKE") &&
                    (insn as? ReferenceInstruction)?.reference.let { ref ->
                        ref is MethodReference &&
                            ref.definingClass == vm &&
                            ref.name == "invoke"
                    }
            } == true
        }
        if (callers.isEmpty()) return@classDefForEach
        val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
        for (method in callers) {
            mutableClass.methods.firstOrNull {
                it.name == method.name &&
                    it.returnType == method.returnType &&
                    it.parameterTypes == method.parameterTypes
            }?.takeIf { it.returnType == "V" }?.neutralize()
        }
    }

    for ((cls, method) in extraNoOps)
        mutableClassDefByOrNull(cls)?.methods?.firstOrNull { it.name == method }?.neutralize()
}

// ── Standalone shared patch ───────────────────────────────────────────────────

/**
 * Standalone shared patch — other patches can `dependsOn(disablePairIPLicenseCheckPatch)`.
 *
 * Combines [killPairIpFull] (full VM + license kill) with the rivanced additions:
 *   - ResponseValidator.validateResponse()         → early return
 *   - LicenseClient.performLocalInstallerCheck()  → return true
 *   - LicenseClient.<clinit> repeatedCheckEnabled → false
 *
 * Gracefully skips any method that does not exist (not all apps include all PairIP classes).
 * Applying it to an app without PairIP is a no-op.
 */
@Suppress("unused")
val disablePairIPLicenseCheckPatch = bytecodePatch(
    name = "Disable PairIP license check",
    description = """
        Disables PairIP license verification: integrity/VM checks, the licensing
        client and repeated background checks.

        Applies to any app. No effect if the app does not use PairIP.
    """.trimIndent(),
    default = false,
) {
    execute {
        guarded("Disable PairIP license check") { killPairIpFull() }
        logUniversal("Disable PairIP license check: completed (missing PairIP classes are skipped).")
    }
}

// ── Manifest companion ────────────────────────────────────────────────────────

/**
 * Shared manifest-level PairIP bypass.
 *
 * Generalised from our cubesolver BypassPairIPManifestPatch. Three operations:
 *
 * 1. **Replace Application class** (optional) — PairIP often registers
 *    `com.pairip.application.Application` as `android:name`. Its
 *    `attachBaseContext` calls `verifyIntegrity` + `checkLicense` before any
 *    app code runs. Pass the real app class to skip this.
 *
 * 2. **Remove LicenseActivity** — prevents Play Store redirect on check failure.
 *
 * 3. **Remove CHECK_LICENSE permission** — `com.android.vending.CHECK_LICENSE`
 *    declared by all PairIP apps; removing it denies it at OS level.
 *
 * Usage:
 * ```kotlin
 * dependsOn(pairIPManifestPatch())                         // items 2+3 only
 * dependsOn(pairIPManifestPatch("com.example.app.MyApp"))  // also replaces app class
 * ```
 */
fun pairIPManifestPatch(replacementAppClass: String? = null) = resourcePatch(
    name = "PairIP manifest bypass",
    description = "Removes LicenseActivity and CHECK_LICENSE permission from AndroidManifest. " +
        "Optionally replaces the PairIP Application class with the real one.",
    default = false,
) {
    execute {
        logUniversal("PairIP manifest bypass: removing LicenseActivity and CHECK_LICENSE permission.")
        document("AndroidManifest.xml").use { doc ->
            if (replacementAppClass != null) {
                val app = doc.getElementsByTagName("application").item(0) as? org.w3c.dom.Element
                app?.setAttribute("android:name", replacementAppClass)
            }

            val activities = doc.getElementsByTagName("activity")
            for (i in activities.length - 1 downTo 0) {
                val el = activities.item(i) as? org.w3c.dom.Element ?: continue
                if (el.getAttribute("android:name").contains("LicenseActivity"))
                    el.parentNode.removeChild(el)
            }

            val permissions = doc.getElementsByTagName("uses-permission")
            for (i in permissions.length - 1 downTo 0) {
                val el = permissions.item(i) as? org.w3c.dom.Element ?: continue
                if (el.getAttribute("android:name").contains("CHECK_LICENSE"))
                    el.parentNode.removeChild(el)
            }
        }
    }
}
