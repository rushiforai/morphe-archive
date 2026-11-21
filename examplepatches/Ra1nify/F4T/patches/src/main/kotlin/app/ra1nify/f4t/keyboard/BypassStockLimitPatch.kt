package app.ra1nify.f4t.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ra1nify.f4t.shared.OPLUS_KEYBOARD
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.Opcode

private const val AI_WRITE_ACTION = "com.oplus.aiwriter.entrance.action.OPLUS_INPUT"
private const val AI_WRITE_ANCHOR = "start aiwriter failed"
private const val AI_WRITER_PACKAGE = "com.oplus.aiwriter"
private const val CONTEXT_CLASS = "Landroid/content/Context;"
private const val KEYBOARD_PACKAGE_PREFIX = "Lcom/oplus/keyboard/"
private const val MIN_CLOUD_FEATURE_SITES = 3
private const val MIN_SIGNING_CLASSES = 2
private const val MIN_SIGNING_SITES = 2
private const val OMKMS_PACKAGE_PREFIX = "Lcom/heytap/omas/"
private const val PACKAGE_GETTER = "getPackageName"
private const val PROCESS_TEXT_ACTION = "android.intent.action.PROCESS_TEXT"
private const val SECURITY_KIT_RETURN = "Lcom/heytap/omas/omkms/api/SecKitClient;"
private const val SIGNING_ANCHOR = "appidb3836add899&package_name="
private const val STOCK_PACKAGE = "com.oplus.keyboard"
private const val STRING_RETURN = "Ljava/lang/String;"
private const val TEXT_SELECTOR_COMPONENT = "com.oplus.aiwriter.entrance.TextSelectorEntrance"
private const val THEMES_PACKAGE_PREFIX = "Lcom/oplus/keyboard/lib_themes/"
private const val TRANSLATION_PACKAGE_PREFIX = "Lcom/oplus/keyboard/input/translation/"

/**
 * Restores what the stock keyboard only allows to the privileged, stock-signed build.
 *
 * - Cloud requests are signed with the stock package name, and the SecKit white-box identity of the
 *   configuration sync points at the installed stock package, so the backend accepts the requests of
 *   the AI, voice, translation, theme and dictionary features.
 * - The AI writing key opens the AI writer through its unprotected text selection entrance instead of
 *   the "com.oplus.permission.safe.SAU" protected service that a re-signed copy can never start.
 */
@Suppress("unused")
val bypassStockLimitPatch = bytecodePatch(
    name = "Bypass Stock Limit",
    description = "Restores the features that the stock keyboard only allows to the privileged stock " +
        "build: the cloud signers, the configuration sync and the SecKit identity report " +
        "\"com.oplus.keyboard\", the translation and theme requests embed it, and the AI writing key " +
        "opens the AI writer through its unprotected text selection entrance instead of the " +
        "\"com.oplus.permission.safe.SAU\" protected service.",
    default = false,
) {
    compatibleWith(OPLUS_KEYBOARD)

    // The notice is mandatory, and both bypasses only make sense on a package that was renamed away
    // from the stock one.
    dependsOn(keyboardAntiResalePatch, changeIdentityPatch)

    execute {
        // The class that holds the SecKit client accessor is obfuscated and its name changes between
        // host builds (`security/d` in 1.9.18.17, `security/e` in 1.9.25.17), so it is resolved by its
        // signature instead of being hardcoded.
        var kitCandidates = 0
        var kitClass: String? = null
        var kitName: String? = null
        classDefForEach { classDef ->
            if (!classDef.type.startsWith(KEYBOARD_PACKAGE_PREFIX)) return@classDefForEach
            classDef.methods.forEach { method ->
                if (method.returnType == SECURITY_KIT_RETURN && method.parameterTypes.isEmpty()) {
                    kitCandidates += 1
                    kitClass = method.definingClass
                    kitName = method.name
                }
            }
        }
        if (kitCandidates != 1) {
            throw PatchException(
                "found $kitCandidates method(s) returning \"$SECURITY_KIT_RETURN\" in " +
                    "$KEYBOARD_PACKAGE_PREFIX, expected exactly 1. The SecKit accessor moved in this " +
                    "host build, so the configuration sync could not be identified."
            )
        }
        val securityKitClass = kitClass!!
        val securityKitName = kitName!!
        println("[keyboard] SecKit accessor: $securityKitClass->$securityKitName")

        // ---- stock identity for the cloud request signers ----
        var signingClasses = 0
        var signingSites = 0
        var helperBodies = 0

        classDefForEach { classDef ->
            if (classDef.methods.none { method -> method.usesSigningAnchor() }) return@classDefForEach
            signingClasses += 1

            val methods = mutableClassDefBy(classDef).methods.filterIsInstance<MutableMethod>()
            // The helper is rewritten first: the direct lookup it contains must be intact while it is
            // being detected, and once it returns the constant it has nothing left to replace.
            methods.filter { method -> method.isPackageNameHelper() }.forEach { method ->
                method.forceStockPackageName()
                helperBodies += 1
            }
            methods.forEach { method ->
                signingSites += method.spoofContextPackageName()
            }
        }

        var configSyncSites = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { method ->
                    method.isConfigSyncRequest(securityKitClass, securityKitName)
                }
            ) {
                return@classDefForEach
            }

            mutableClassDefBy(classDef).methods
                .filterIsInstance<MutableMethod>()
                .filter { method -> method.isConfigSyncRequest(securityKitClass, securityKitName) }
                .forEach { method ->
                    configSyncSites += method.spoofContextPackageName()
                }
        }

        // The white-box identity used to sign the configuration sync is derived from the package name
        // and the certificate of the APK. Pointing it at the installed stock package makes the SecKit
        // client authenticate as that package, with the stock certificate, and the sync succeeds.
        var omkmsIdentitySites = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { method -> method.isOmkmsIdentityMethod() }) return@classDefForEach

            mutableClassDefBy(classDef).methods
                .filterIsInstance<MutableMethod>()
                .filter { method -> method.isOmkmsIdentityMethod() }
                .forEach { method ->
                    omkmsIdentitySites += method.spoofContextPackageName()
                }
        }

        // The translation and theme cloud features also embed the package name in their requests, as
        // a normal request parameter instead of a signature field.
        //
        // These two packages are feature modules whose class names are readable and stable (only the
        // SDK-internal packages are renamed between builds), so the prefix is the reliable signal
        // here: matching every `getPackageName()` caller in the app would rewrite unrelated code.
        var cloudFeatureSites = 0
        classDefForEach { classDef ->
            val isCloudFeatureClass = classDef.type.startsWith(TRANSLATION_PACKAGE_PREFIX) ||
                classDef.type.startsWith(THEMES_PACKAGE_PREFIX)
            if (!isCloudFeatureClass) return@classDefForEach
            if (classDef.methods.none { method -> method.callsContextPackageName() }) return@classDefForEach

            mutableClassDefBy(classDef).methods
                .filterIsInstance<MutableMethod>()
                .forEach { method ->
                    cloudFeatureSites += method.spoofContextPackageName()
                }
        }

        if (signingClasses < MIN_SIGNING_CLASSES) {
            throw PatchException(
                "found $signingClasses class(es) with the request signing anchor, expected at least " +
                    "$MIN_SIGNING_CLASSES. The signing code moved in this host build, so the cloud " +
                    "features would stay broken."
            )
        }
        if (signingSites < MIN_SIGNING_SITES) {
            throw PatchException(
                "patched $signingSites direct package-name lookup(s) in the request signers, expected " +
                    "at least $MIN_SIGNING_SITES. The package name is obtained differently in this build."
            )
        }
        if (helperBodies < 1) {
            throw PatchException(
                "the private package-name helper of the voice ASR signer was not found; the voice " +
                    "request signatures would keep the renamed package"
            )
        }
        if (configSyncSites < 1) {
            throw PatchException(
                "the cloud configuration sync was not found; it fetches the HMAC keys, so the " +
                    "signed requests would all use an invalid key"
            )
        }
        if (omkmsIdentitySites < 1) {
            throw PatchException(
                "the SecKit white-box identity was not found; the configuration sync would fail its " +
                    "identity verification and the HMAC keys would never be fetched"
            )
        }
        if (cloudFeatureSites < MIN_CLOUD_FEATURE_SITES) {
            throw PatchException(
                "patched $cloudFeatureSites package-name lookup(s) in the translation and theme " +
                    "requests, expected at least $MIN_CLOUD_FEATURE_SITES. Those requests would embed " +
                    "the renamed package and get rejected."
            )
        }

        val leftovers = mutableListOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (method.usesSigningAnchor() && method.callsContextPackageName()) {
                    leftovers += "${method.definingClass}->${method.name}"
                }
            }
        }
        if (leftovers.isNotEmpty()) {
            throw PatchException(
                "the request signers still read the real package name: ${leftovers.joinToString(", ")}"
            )
        }

        println(
            "[keyboard] stock package spoofed: $signingClasses signing class(es), " +
                "$signingSites direct lookup(s), $helperBodies helper(s), $configSyncSites config " +
                "sync site(s), $omkmsIdentitySites SecKit identity site(s), " +
                "$cloudFeatureSites translation/theme site(s)"
        )
        // ---- AI writing key ----
        var patchedMethods = 0
        classDefForEach { classDef ->
            if (classDef.methods.none { method -> method.isAiWritingEntry() }) return@classDefForEach

            mutableClassDefBy(classDef).methods
                .filterIsInstance<MutableMethod>()
                .filter { method -> method.isAiWritingEntry() }
                .forEach { method ->
                    method.rerouteAiWritingEntry()
                    patchedMethods += 1
                }
        }

        if (patchedMethods != 1) {
            throw PatchException(
                "found $patchedMethods AI writing entry method(s), expected exactly 1. The entry " +
                    "moved in this host build, so the key would keep failing to start the AI writer."
            )
        }

        println("[keyboard] AI writing entry rerouted to $TEXT_SELECTOR_COMPONENT")
    }
}


/** A method that builds one of the signed request strings of the cloud features. */
private fun Method.usesSigningAnchor(): Boolean =
    implementation?.instructions?.any { instruction ->
        instruction.anchorString()?.contains(SIGNING_ANCHOR) == true
    } == true

/** A method that reads the package name of the host. */
private fun Method.callsContextPackageName(): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.isContextPackageGetter()
    } == true

/**
 * A method that asks the SecKit client for a signed payload, as the cloud configuration sync does.
 *
 * The accessor lives in an obfuscated class whose name differs between host builds, so the resolved
 * class and method names are passed in instead of being compared against a constant.
 */
private fun Method.callsSecurityKit(kitClass: String, kitName: String): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null &&
            reference.definingClass == kitClass &&
            reference.name == kitName &&
            reference.returnType == SECURITY_KIT_RETURN
    } == true

/**
 * The cloud configuration sync fetches the HMAC keys. It is the only method that both obtains the
 * package name and talks to the SecKit client, and it has to sign with the stock name as well.
 */
private fun Method.isConfigSyncRequest(kitClass: String, kitName: String): Boolean =
    callsSecurityKit(kitClass, kitName) && callsContextPackageName()

/**
 * The SecKit white-box identity helper. It derives the identity of the app from the package name and
 * the certificate of the APK: `context.getPackageName() + "^" + signatureHash(context, packageName)`.
 *
 * Both halves are structural: a call to the package-name getter plus a call to the SDK helper that
 * turns `(Context, String)` into the certificate hash. The owning class is not matched by name, so a
 * re-obfuscated SDK package cannot break the detection.
 */
private fun Method.isOmkmsIdentityMethod(): Boolean =
    callsContextPackageName() && callsPackageSignatureHash()

/**
 * A call of the SDK helper that returns the certificate hash of a package as a string.
 *
 * `(Context, String) -> String` alone is far too common (accounts, feedback, cipher helpers all match
 * it), so the callee is required to live in the SDK package the identity is derived from.
 */
private fun Method.callsPackageSignatureHash(): Boolean =
    implementation?.instructions?.any { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        reference != null &&
            reference.definingClass.startsWith(OMKMS_PACKAGE_PREFIX) &&
            reference.returnType == STRING_RETURN &&
            reference.parameterTypes.size == 2 &&
            reference.parameterTypes[0].toString() == CONTEXT_CLASS &&
            reference.parameterTypes[1].toString() == STRING_RETURN
    } == true

/** The private `getPackageName()` helper of the voice ASR signer. */
private fun Method.isPackageNameHelper(): Boolean =
    name == PACKAGE_GETTER &&
        parameterTypes.isEmpty() &&
        returnType == STRING_RETURN &&
        callsContextPackageName()

private fun MethodReference.isContextPackageGetter(): Boolean =
    definingClass == CONTEXT_CLASS &&
        name == PACKAGE_GETTER &&
        returnType == STRING_RETURN &&
        parameterTypes.isEmpty()

/**
 * Replaces every `Context.getPackageName()` in the method with the stock package name.
 *
 * The getter is always followed by `move-result-object`, which is turned into `nop` to keep the
 * instruction indices and the labels attached to them stable.
 *
 * @return How many lookups were replaced.
 */
private fun MutableMethod.spoofContextPackageName(): Int {
    // Abstract and native methods have no implementation, and there is nothing to spoof in them.
    if (implementation == null) return 0

    var patched = 0
    var index = 0
    while (index < instructions.size) {
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.isContextPackageGetter() == true) {
            val moveResult = instructions.getOrNull(index + 1)
            if (moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT) {
                val register = (moveResult as OneRegisterInstruction).registerA
                replaceInstruction(index, "const-string v$register, \"$STOCK_PACKAGE\"")
                replaceInstruction(index + 1, "nop")
                patched += 1
                index += 2
                continue
            }
        }
        index += 1
    }
    return patched
}

/** Rewrites the helper to return the stock package name without reading the context. */
private fun MutableMethod.forceStockPackageName() {
    val body = implementation as? MutableMethodImplementation
        ?: throw PatchException("$definingClass->$name has no mutable implementation")
    if (body.registerCount < 1) {
        throw PatchException("$definingClass->$name has no register to return the package name with")
    }

    while (body.instructions.isNotEmpty()) {
        body.removeInstruction(body.instructions.size - 1)
    }
    addInstructions(0, "const-string v0, \"$STOCK_PACKAGE\"\nreturn-object v0")
}

private fun Instruction.anchorString(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string


/** The helper that starts the AI writer. It is the only method that logs this failure. */
private fun Method.isAiWritingEntry(): Boolean =
    implementation?.instructions?.any { instruction ->
        instruction.stringConstant()?.startsWith(AI_WRITE_ANCHOR) == true
    } == true

/**
 * Rewrites the privileged start into a start of the unprotected text selection entrance:
 * `Intent(PROCESS_TEXT).setClassName(com.oplus.aiwriter, TextSelectorEntrance).addFlags(NEW_TASK)`.
 */
private fun MutableMethod.rerouteAiWritingEntry() {
    val original = instructions
    val actionIndex = original.indexOfFirst { instruction -> instruction.stringConstant() == AI_WRITE_ACTION }
    val packageIndex = original.indexOfFirst { instruction -> instruction.stringConstant() == AI_WRITER_PACKAGE }
    val setPackageIndex = original.indexOfFirst { instruction -> instruction.callsMethod("Landroid/content/Intent;", "setPackage") }
    val startServiceIndex = original.indexOfFirst { instruction ->
        instruction.callsMethod("Landroid/content/Context;", "startForegroundService")
    }

    if (actionIndex < 0 || packageIndex < 0 || setPackageIndex < 0 || startServiceIndex < 0) {
        throw PatchException(
            "$definingClass->$name: the AI writer start was not found " +
                "(action=$actionIndex package=$packageIndex setPackage=$setPackageIndex " +
                "startService=$startServiceIndex)"
        )
    }
    if (original.count { instruction -> instruction.stringConstant() == AI_WRITE_ACTION } != 1 ||
        original.count { instruction -> instruction.stringConstant() == AI_WRITER_PACKAGE } != 1
    ) {
        throw PatchException("$definingClass->$name: the AI writer intent is built more than once")
    }
    if (setPackageIndex != packageIndex + 1) {
        throw PatchException("$definingClass->$name: unexpected setPackage layout")
    }

    val actionRegister = (original[actionIndex] as OneRegisterInstruction).registerA
    val packageRegister = (original[packageIndex] as OneRegisterInstruction).registerA
    val setPackageRegisters = original[setPackageIndex].invokeRegisters()
    val startRegisters = original[startServiceIndex].invokeRegisters()
    if (setPackageRegisters.size != 2 || startRegisters.size != 2) {
        throw PatchException("$definingClass->$name: unexpected invoke register counts")
    }

    val intentRegister = setPackageRegisters[0]
    val contextRegister = startRegisters[0]
    if (setPackageRegisters[1] != packageRegister || startRegisters[1] != intentRegister) {
        throw PatchException("$definingClass->$name: unexpected intent register usage")
    }

    val classRegister = findFreeRegister(
        packageIndex + 1,
        packageRegister,
        intentRegister,
        actionRegister,
    )
    val flagRegister = findFreeRegister(
        startServiceIndex,
        intentRegister,
        contextRegister,
        classRegister,
        actionRegister,
        packageRegister,
    )

    // The privileged start becomes a normal activity launch.
    replaceInstruction(
        startServiceIndex,
        "invoke-virtual {v$contextRegister, v$intentRegister}, " +
            "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V",
    )
    addInstructions(
        startServiceIndex,
        "const/high16 v$flagRegister, 0x10000000\n" +
            "invoke-virtual {v$intentRegister, v$flagRegister}, " +
            "Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;",
    )

    // Point the intent at the unprotected text selection entrance instead of the AI writer package.
    addInstructions(packageIndex + 1, "const-string v$classRegister, \"$TEXT_SELECTOR_COMPONENT\"")
    replaceInstruction(
        setPackageIndex + 1,
        "invoke-virtual {v$intentRegister, v$packageRegister, v$classRegister}, " +
            "Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)" +
            "Landroid/content/Intent;",
    )

    // It is the text selection action that makes the entrance forward the request to its own service.
    replaceInstruction(actionIndex, "const-string v$actionRegister, \"$PROCESS_TEXT_ACTION\"")

    val patched = instructions
    val stillPrivileged = patched.any { instruction ->
        instruction.callsMethod("Landroid/content/Context;", "startForegroundService")
    }
    if (stillPrivileged) {
        throw PatchException("$definingClass->$name: the privileged AI writer start was not replaced")
    }
    if (patched.none { instruction -> instruction.stringConstant() == TEXT_SELECTOR_COMPONENT }) {
        throw PatchException("$definingClass->$name: the text selection entrance was not wired up")
    }
}

private fun Instruction.stringConstant(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.callsMethod(className: String, methodName: String): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference
    return reference != null && reference.definingClass == className && reference.name == methodName
}

private fun Instruction.invokeRegisters(): List<Int> {
    if (this is RegisterRangeInstruction) {
        return (0 until registerCount).map { startRegister + it }
    }
    if (this is FiveRegisterInstruction) {
        return listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    }
    throw PatchException("not an invoke instruction: $opcode")
}