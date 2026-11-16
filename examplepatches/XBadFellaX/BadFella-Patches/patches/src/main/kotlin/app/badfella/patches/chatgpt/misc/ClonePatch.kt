package app.badfella.patches.chatgpt.misc

import app.badfella.patches.chatgpt.shared.Constants.COMPATIBILITY_CHATGPT
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.logging.Logger

private const val PATCH_NAME = "Install next to ChatGPT"

private val logger = Logger.getLogger("BadFella Patches")

/** The package ChatGPT ships under, which the copy gives up. */
private const val CHATGPT = "com.openai.chatgpt"

private const val OAUTH_REDIRECT = "$CHATGPT://auth.openai.com/android/$CHATGPT/callback"

private const val DEFAULT_PACKAGE = "$CHATGPT.clone"
private const val DEFAULT_LABEL = "ChatGPT Clone"

private const val CLONE_LABEL_RESOURCE = "badfella_clone_label"

private const val NAME = "android:name"
private const val LABEL = "android:label"
private const val AUTHORITIES = "android:authorities"
private const val AFFINITY = "android:taskAffinity"
private const val PROCESS = "android:process"
private const val SCHEME = "android:scheme"
private const val HOST = "android:host"
private const val PATH_PREFIX = "android:pathPrefix"

private val GUARDS = listOf("android:permission", "android:readPermission", "android:writePermission")
private val PERMISSION_REQUESTS = setOf("uses-permission", "uses-permission-sdk-23")
private val PERMISSION_DECLARATIONS = listOf("permission", "permission-group", "permission-tree")

/** The attributes that name a class, by tag. Android reads one starting with a dot as under the package. */
private val CLASS_NAMES = mapOf(
    "application" to listOf(NAME, "android:backupAgent", "android:manageSpaceActivity", "android:appComponentFactory"),
    "activity" to listOf(NAME, "android:parentActivityName"),
    "activity-alias" to listOf(NAME, "android:targetActivity", "android:parentActivityName"),
    "service" to listOf(NAME),
    "receiver" to listOf(NAME),
    "provider" to listOf(NAME),
    "instrumentation" to listOf(NAME),
)

/** The activity that receives the OAuth callback. */
private const val WEB_REDIRECT_ACTIVITY = "com.openai.feature.auth.impl.web.WebRedirectActivity"

/** What the manifest half reads before anything changes: what the code half needs, and the app's label. */
private class CloneManifestFacts(
    /** The application's label, which the launcher entries share. */
    val label: String,
    /** Every authority ChatGPT's application declares, each once. */
    val authorities: List<String>,
)

/** The package and name the manifest takes, set once the code has moved. */
private class CloneRequest(val packageName: String, val appName: String)

/** How many of each thing a rename changed. */
private data class ManifestRename(
    val labels: Int,
    val authorities: Int,
    val permissions: Int,
    val permissionUses: Int,
    val affinities: Int,
    val processes: Int,
    val classNames: Int,
    val callbacks: Int,
)

private var manifestFacts: CloneManifestFacts? = null
private var renameRequest: CloneRequest? = null

private fun refuse(why: String): Nothing = throw PatchException("$PATCH_NAME: $why")

private fun Element.childElements(tag: String): List<Element> =
    (0 until childNodes.length).map { childNodes.item(it) }.filterIsInstance<Element>().filter { it.tagName == tag }

private fun Element.allElements(tag: String = "*"): List<Element> =
    getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

private fun Element.authorityList(): List<String> =
    getAttribute(AUTHORITIES).split(';').map(String::trim).filter(String::isNotEmpty)

/** Reads what the rename needs and refuses a manifest it can't rename whole. */
private fun readCloneManifest(manifest: Document): CloneManifestFacts {
    val root = manifest.documentElement ?: refuse("AndroidManifest.xml has no manifest element")
    val named = root.getAttribute("package")
    if (named != CHATGPT) refuse("AndroidManifest.xml names the package \"$named\", not $CHATGPT")
    val application = root.childElements("application").singleOrNull()
        ?: refuse("AndroidManifest.xml has no single application element")
    val label = application.getAttribute(LABEL)
    if (label.isEmpty()) refuse("ChatGPT's application has no label")
    val authorities = application.allElements("provider").flatMap { provider ->
        provider.authorityList().ifEmpty { refuse("the provider ${provider.getAttribute(NAME)} declares no authority") }
    }.distinct()
    return CloneManifestFacts(label, authorities)
}

/** [name] moved from ChatGPT's package to [clone]'s when it starts with ChatGPT's, else null. */
private fun underClone(name: String, clone: String): String? =
    if (name == CHATGPT || name.startsWith("$CHATGPT.") || name.startsWith("$CHATGPT:")) {
        clone + name.removePrefix(CHATGPT)
    } else {
        null
    }

/**
 * The copy's authority for [authority]. One under ChatGPT's package moves to the copy's, and any
 * other gets the copy's package in front, since two apps can't declare one authority.
 */
private fun cloneAuthority(authority: String, clone: String): String =
    underClone(authority, clone) ?: "$clone.$authority"

/** Adds the clone's name to the default strings; quotes preserve spaces when resources compile. */
private fun addCloneLabel(strings: Document, label: String) {
    cloneLabelProblem(label)?.let(::refuse)
    val resource = strings.createElement("string")
    resource.setAttribute("name", CLONE_LABEL_RESOURCE)
    resource.setAttribute("translatable", "false")
    resource.textContent = "\"$label\""
    strings.documentElement.appendChild(resource)
}

/**
 * Retains the legacy clone callback filter for compatibility. Sign-in requests must use the stock
 * redirect URI; registering a clone URI here does not register it with the authorization server.
 */
private fun addCloneCallbackFilter(manifest: Document, clone: String): Int {
    val application = manifest.documentElement.childElements("application").singleOrNull()
        ?: refuse("AndroidManifest.xml has no single application element")
    val redirect = application.allElements("activity")
        .firstOrNull { it.getAttribute(NAME) == WEB_REDIRECT_ACTIVITY || it.getAttribute(NAME).endsWith(".WebRedirectActivity") }
        ?: refuse("AndroidManifest.xml has no $WEB_REDIRECT_ACTIVITY")
    val stock = redirect.childElements("intent-filter")
        .firstOrNull { filter -> filter.allElements("data").any { it.getAttribute(SCHEME) == CHATGPT } }
        ?: refuse("$WEB_REDIRECT_ACTIVITY declares no $CHATGPT view filter")

    val hosts = stock.allElements("data").map { it.getAttribute(HOST) }.filter(String::isNotEmpty).distinct()
    if (hosts.isEmpty()) refuse("$WEB_REDIRECT_ACTIVITY's $CHATGPT filter declares no host")

    val filter = manifest.createElement("intent-filter")
    filter.appendChild(manifest.createElement("action").also {
        it.setAttribute(NAME, "android.intent.action.VIEW")
    })
    listOf("android.intent.category.DEFAULT", "android.intent.category.BROWSABLE").forEach { category ->
        filter.appendChild(manifest.createElement("category").also { it.setAttribute(NAME, category) })
    }
    filter.appendChild(manifest.createElement("data").also { it.setAttribute(SCHEME, clone) })
    hosts.forEach { host ->
        filter.appendChild(manifest.createElement("data").also { it.setAttribute(HOST, host) })
    }
    filter.appendChild(manifest.createElement("data").also {
        it.setAttribute(PATH_PREFIX, "/android/$clone/callback")
    })
    filter.appendChild(manifest.createElement("data").also {
        it.setAttribute(PATH_PREFIX, "/android/$CHATGPT/callback")
    })
    redirect.appendChild(filter)
    return 1
}

/**
 * Moves ChatGPT's manifest to [clone] and names it [label] on the home screen.
 *
 * Android tells two apps apart by package, and it refuses an app that declares a provider authority
 * or a permission another app holds, so those move with the package: an authority or permission
 * under ChatGPT's package moves to the copy's, and any other authority gets the copy's package in
 * front. A relative permission name follows the package by itself. Task affinities and process names
 * move the same way as authorities, so the copy's screens never join a task of the installed
 * ChatGPT's. Labels equal to the application's are the launcher entries, and they take [label]
 * through a string resource. A class name starting with a dot is written out in full first, since it
 * would otherwise name a class under the copy's package. Actions, data hosts and meta-data names stay
 * as they are.
 */
private fun renameManifest(manifest: Document, facts: CloneManifestFacts, clone: String, label: String): ManifestRename {
    clonePackageProblem(clone)?.let(::refuse)
    cloneLabelProblem(label)?.let(::refuse)
    val root = manifest.documentElement ?: refuse("AndroidManifest.xml has no manifest element")
    val application = root.childElements("application").singleOrNull()
        ?: refuse("AndroidManifest.xml has no single application element")
    val everything = listOf(root) + root.allElements()

    var classNames = 0
    for (element in everything) for (attribute in CLASS_NAMES[element.tagName].orEmpty()) {
        val value = element.getAttribute(attribute)
        if (value.startsWith(".")) {
            element.setAttribute(attribute, CHATGPT + value)
            classNames++
        }
    }

    val declared = root.childElements("permission")
        .map { it.getAttribute(NAME) }
        .filter { underClone(it, clone) != null }

    root.setAttribute("package", clone)

    var labels = 0
    for (element in everything) {
        if (element.getAttribute(LABEL) == facts.label) {
            element.setAttribute(LABEL, "@string/$CLONE_LABEL_RESOURCE")
            labels++
        }
    }

    var authorities = 0
    for (provider in application.allElements("provider")) {
        val moved = provider.authorityList().map { cloneAuthority(it, clone) }
        provider.setAttribute(AUTHORITIES, moved.joinToString(";"))
        authorities += moved.size
    }

    var permissions = 0
    for (element in everything) {
        if (element.tagName in PERMISSION_DECLARATIONS) {
            val name = element.getAttribute(NAME)
            underClone(name, clone)?.let {
                element.setAttribute(NAME, it)
                permissions++
            }
        }
    }

    var permissionUses = 0
    for (element in everything) {
        val attributes = GUARDS + if (element.tagName in PERMISSION_REQUESTS) listOf(NAME) else emptyList()
        for (attribute in attributes) {
            val name = element.getAttribute(attribute)
            if (name !in declared) continue
            element.setAttribute(attribute, underClone(name, clone)!!)
            permissionUses++
        }
    }

    var affinities = 0
    var processes = 0
    for (element in everything) {
        underClone(element.getAttribute(AFFINITY), clone)?.let {
            element.setAttribute(AFFINITY, it)
            affinities++
        }
        underClone(element.getAttribute(PROCESS), clone)?.let {
            element.setAttribute(PROCESS, it)
            processes++
        }
    }

    val callbacks = addCloneCallbackFilter(manifest, clone)

    return ManifestRename(
        labels, authorities, permissions, permissionUses, affinities, processes, classNames, callbacks,
    )
}

private val CHATGPT_MANIFEST = resourcePatch {
    execute {
        manifestFacts = null
        renameRequest = null
        document("AndroidManifest.xml").use { manifestFacts = readCloneManifest(it) }
    }

    finalize {
        val request = renameRequest ?: return@finalize
        renameRequest = null
        val facts = manifestFacts ?: refuse("the manifest half didn't read AndroidManifest.xml")
        document("res/values/strings.xml").use { addCloneLabel(it, request.appName) }
        val moved = document("AndroidManifest.xml").use {
            renameManifest(it, facts, request.packageName, request.appName)
        }
        logger.info(
            "$PATCH_NAME: moved ${moved.authorities} provider authorities, ${moved.permissions} permission " +
                "declarations, ${moved.permissionUses} permission uses, ${moved.labels} labels, " +
                "${moved.affinities} task affinities, ${moved.processes} processes and ${moved.classNames} " +
                "class names to ${request.packageName}, and added ${moved.callbacks} callback filter",
        )
    }
}

/** The literal a const-string instruction loads, or null. */
private fun Instruction.stringValue(): String? =
    if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) {
        ((this as ReferenceInstruction).reference as StringReference).string
    } else {
        null
    }

/** The type an instruction names, or null. */
private fun Instruction.typeValue(): String? = when (opcode) {
    Opcode.NEW_INSTANCE, Opcode.CONST_CLASS, Opcode.CHECK_CAST, Opcode.INSTANCE_OF ->
        ((this as ReferenceInstruction).reference as? TypeReference)?.type
    else -> null
}

private fun MethodImplementation?.strings(): List<String> =
    this?.instructions?.mapNotNull { it.stringValue() }.orEmpty()

private fun MethodImplementation?.types(): List<String> =
    this?.instructions?.mapNotNull { it.typeValue() }.orEmpty()

private fun Method.parameterNames(): List<String> = parameterTypes.map { it.toString() }

/** ChatGPT's Play Integrity failure, which turns a recoverable sign-in into a Play Store dialog. */
private const val INTEGRITY_FAILURE_TYPE = "Lcom/openai/auth/AuthError\$PlayIntegrityCheckFailed;"

/**
 * The methods that check that this is OpenAI's own signed ChatGPT.
 *
 * Their class names are renamed by R8 on every release, so they are found by shape: a static method
 * taking a Context and a set of accepted certificate hashes and returning whether the running app
 * matches. A copy signed with another key fails that check and is reported as a tampered install.
 */
private fun BytecodePatchContext.signatureChecks(): List<Method> {
    val found = mutableListOf<Method>()
    classDefForEach { classDef ->
        classDef.methods.forEach methodLoop@{ method ->
            if (method.returnType != "Z") return@methodLoop
            if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@methodLoop
            if (method.parameterNames() != listOf("Landroid/content/Context;", "Ljava/util/Set;")) return@methodLoop
            val strings = method.implementation.strings()
            if (CHATGPT in strings && "SHA-256" in strings) found += method
        }
    }
    return found
}

/**
 * The methods that reclassify a failed sign-in as a Play Integrity failure.
 *
 * ChatGPT treats a Google integrity failure as fatal: the error becomes
 * `AuthError$PlayIntegrityCheckFailed` and the screen sends the user to the Play Store. A re-signed
 * copy always fails that check, so the copy would never finish signing in. The reclassification is a
 * static method that takes an error and returns the same type, allocating the failure type inside.
 */
private fun BytecodePatchContext.integrityEscalations(): List<Method> {
    val found = mutableListOf<Method>()
    classDefForEach { classDef ->
        classDef.methods.forEach methodLoop@{ method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags)) return@methodLoop
            val parameters = method.parameterNames()
            if (parameters.size != 1) return@methodLoop
            if (method.returnType != parameters.single()) return@methodLoop
            if (INTEGRITY_FAILURE_TYPE !in method.implementation.types()) return@methodLoop
            found += method
        }
    }
    return found
}

/** The mutable copy of [method], matched by name and parameter types. */
private fun BytecodePatchContext.mutableMethodOf(method: Method) =
    mutableClassDefBy(method.definingClass).methods.first {
        it.name == method.name && it.parameterNames() == method.parameterNames()
    }

/**
 * Installs this build beside the installed ChatGPT as its own app, with its own package, data and
 * sign-in, so a second account can be signed in at the same time.
 */
@Suppress("unused")
val installNextToChatGptPatch = bytecodePatch(
    name = PATCH_NAME,
    description = "Installs this build as a second ChatGPT beside your normal one, with its own data and " +
        "sign-in. Pick its package name and app name in the patch's options. Sign-in uses the original OAuth callback; " +
        "if Android asks which app to open, choose the copy.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CHATGPT)
    category("Misc")
    dependsOn(CHATGPT_MANIFEST)

    val packageName = stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE,
        title = "Package name",
        description = "The second ChatGPT's package. Each part starts with a letter, with dots between the parts, " +
            "and it can't be ChatGPT's own.",
        required = true,
    ) { clonePackageProblem(it) == null }
    val appName = stringOption(
        key = "appName",
        default = DEFAULT_LABEL,
        title = "App name",
        description = "The name under the second ChatGPT's icon. It starts with a letter and holds up to 50 characters.",
        required = true,
    ) { cloneLabelProblem(it) == null }

    execute {
        clonePackageProblem(packageName.value)?.let(::refuse)
        cloneLabelProblem(appName.value)?.let(::refuse)

        // Keep the registered OAuth redirect independent of the clone's Android application id.
        val redirectBuilder = Fingerprint(
            strings = listOf("://auth.openai.com/android/", "/callback"),
        ).method
        val instructions = redirectBuilder.implementation!!.instructions.toList()
        val results = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Ljava/lang/StringBuilder;" && reference.name == "toString" &&
                reference.parameterTypes.isEmpty() && reference.returnType == "Ljava/lang/String;"
        }
        val resultIndex = results.singleOrNull()?.plus(1)
            ?: refuse("OAuth redirect builder no longer has a single StringBuilder result")
        if (instructions.getOrNull(resultIndex)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
            refuse("OAuth redirect builder no longer stores its URI result")
        }
        val register = (instructions[resultIndex] as OneRegisterInstruction).registerA
        redirectBuilder.replaceInstruction(resultIndex, "const-string v$register, \"$OAUTH_REDIRECT\"")

        val signatures = signatureChecks()
        if (signatures.isEmpty()) refuse("no method checks the package and signing certificate")
        signatures.forEach { method ->
            mutableMethodOf(method).addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            logger.info("$PATCH_NAME: made ${method.definingClass}->${method.name} accept the copy")
        }

        val escalations = integrityEscalations()
        if (escalations.isEmpty()) refuse("no method escalates a Play Integrity failure")
        escalations.forEach { method ->
            mutableMethodOf(method).addInstructions(0, "return-object p0")
            logger.info("$PATCH_NAME: made ${method.definingClass}->${method.name} keep the original sign-in error")
        }
    }

    finalize {
        val clone = packageName.value ?: refuse("the package name is empty")
        val label = appName.value ?: refuse("the app name is empty")
        clonePackageProblem(clone)?.let(::refuse)
        cloneLabelProblem(label)?.let(::refuse)
        renameRequest = CloneRequest(clone, label)
    }
}

/** Why Android or this patch can't use [name] as the copy's package, or null when it can. */
private fun clonePackageProblem(name: String?): String? {
    if (name.isNullOrEmpty()) return "the package name is empty"
    if (name.length > 120) return "the package name is longer than 120 characters"
    val parts = name.split('.')
    if (parts.size < 2) return "the package name \"$name\" needs at least one dot, like $DEFAULT_PACKAGE"
    parts.firstOrNull { !PACKAGE_PART.matches(it) }?.let { part ->
        return "the package name \"$name\" has the part \"$part\". Each part starts with a letter and holds only " +
            "letters, digits and underscores"
    }
    TAKEN.firstOrNull { it.equals(name, ignoreCase = true) }?.let { return "\"$name\" is $it, another app's package" }
    return null
}

/** Why [label] can't be the copy's name on the home screen, or null when it can. */
private fun cloneLabelProblem(label: String?): String? {
    if (label.isNullOrEmpty()) return "the app name is empty"
    if (label.length > 50) return "the app name is longer than 50 characters"
    if (!label.first().isLetter()) return "the app name \"$label\" has to start with a letter"
    if (label.last() == ' ') return "the app name \"$label\" ends with a space"
    label.firstOrNull { !it.isLetterOrDigit() && it !in LABEL_MARKS }?.let { mark ->
        return "the app name \"$label\" holds \"$mark\". Use letters, digits, spaces and these: ${LABEL_MARKS.trim()}"
    }
    if (label.equals("true", ignoreCase = true) || label.equals("false", ignoreCase = true)) {
        return "the app name \"$label\" would be read as a yes or no"
    }
    return null
}

private val PACKAGE_PART = Regex("[A-Za-z][A-Za-z0-9_]*")

/** Characters a home screen name may hold besides letters and digits. */
private const val LABEL_MARKS = " .-_()+!,&'"

/** Names the copy can't take: ChatGPT's own package and the other apps OpenAI ships. */
private val TAKEN = listOf(
    CHATGPT,
    "$CHATGPT.internal",
    "$CHATGPT.debug",
)
