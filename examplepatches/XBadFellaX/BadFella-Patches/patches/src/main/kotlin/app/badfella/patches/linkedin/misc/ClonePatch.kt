package app.badfella.patches.linkedin.misc

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.logging.Logger

private const val PATCH_NAME = "Install next to LinkedIn"

private val logger = Logger.getLogger("BadFella Patches")

/** The package LinkedIn ships under, which the copy gives up. */
private const val LINKEDIN = "com.linkedin.android"

private const val DEFAULT_PACKAGE = "$LINKEDIN.clone"
private const val DEFAULT_LABEL = "LinkedIn Clone"

private const val CLONE_LABEL_RESOURCE = "badfella_clone_label"

/** The resource the searchable activity names its suggestion provider with. */
private const val APPFINDER_AUTHORITY_RESOURCE = "appfinder_authority"

private const val NAME = "android:name"
private const val LABEL = "android:label"
private const val VALUE = "android:value"
private const val AUTHORITIES = "android:authorities"
private const val AFFINITY = "android:taskAffinity"
private const val PROCESS = "android:process"
private const val HOST = "android:host"

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

/** The custom tab return host, which LinkedIn's code builds from its package name at run time. */
private const val TAB_HOST = "cct.$LINKEDIN"

/** What the manifest half reads before anything changes: what the code half needs, and the app's label. */
private class CloneManifestFacts(
    /** The application's label, which the launcher entries share. */
    val label: String,
    /** Every authority LinkedIn's application declares, each once. */
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
    val categories: Int,
    val hosts: Int,
    val classNames: Int,
    /** The spoofed package names left as LinkedIn's own for Google sign-in. */
    val spoofedNames: Int,
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
    if (named != LINKEDIN) refuse("AndroidManifest.xml names the package \"$named\", not $LINKEDIN")
    val application = root.childElements("application").singleOrNull()
        ?: refuse("AndroidManifest.xml has no single application element")
    val label = application.getAttribute(LABEL)
    if (label.isEmpty()) refuse("LinkedIn's application has no label")
    val authorities = application.allElements("provider").flatMap { provider ->
        provider.authorityList().ifEmpty { refuse("the provider ${provider.getAttribute(NAME)} declares no authority") }
    }.distinct()
    return CloneManifestFacts(label, authorities)
}

/** [name] moved from LinkedIn's package to [clone]'s when it starts with LinkedIn's, else null. */
private fun underClone(name: String, clone: String): String? =
    if (name == LINKEDIN || name.startsWith("$LINKEDIN.") || name.startsWith("$LINKEDIN:")) {
        clone + name.removePrefix(LINKEDIN)
    } else {
        null
    }

/**
 * The copy's authority for [authority]. One under LinkedIn's package moves to the copy's, and any
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
 * Points the searchable activity's suggestion provider at the copy's authority, when this build
 * declares that resource. The provider queries its own authority by the running package, so it
 * moves with the manifest even though this string stays what it is.
 */
private fun moveAppFinderAuthority(strings: Document, clone: String) {
    val authority = cloneAuthority("$LINKEDIN.appfinder.suggestions", clone)
    strings.documentElement.allElements("string")
        .filter { it.getAttribute("name") == APPFINDER_AUTHORITY_RESOURCE }
        .forEach { it.textContent = "\"$authority\"" }
}

/**
 * Moves LinkedIn's manifest to [clone] and names it [label] on the home screen.
 *
 * Android tells two apps apart by package, and it refuses an app that declares a provider authority
 * or a permission another app holds, so those move with the package: an authority or permission
 * under LinkedIn's package moves to the copy's, and any other authority gets the copy's package in
 * front. A relative permission name follows the package by itself. Task affinities and process names
 * move the same way as authorities, so the copy's screens never join a task of the installed
 * LinkedIn's. The push category and the custom tab return host name the package too, so they move as
 * well. The package name GmsCore support gives microG to spoof does not: LinkedIn's Google OAuth
 * client belongs to LinkedIn's own package and signing certificate, so the copy has to present
 * LinkedIn's identity to Google rather than its own. Labels equal to the application's are the
 * launcher entries, and they take [label] through a string resource. A class name starting with a dot
 * is written out in full first, since it would otherwise name a class under the copy's package.
 * Actions and meta-data names stay as they are.
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
            element.setAttribute(attribute, LINKEDIN + value)
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
    var categories = 0
    var hosts = 0
    var spoofedNames = 0
    for (element in everything) {
        val affinity = element.getAttribute(AFFINITY)
        if (affinity.isNotEmpty()) {
            element.setAttribute(AFFINITY, underClone(affinity, clone) ?: "$clone.$affinity")
            affinities++
        }
        underClone(element.getAttribute(PROCESS), clone)?.let {
            element.setAttribute(PROCESS, it)
            processes++
        }
        if (element.tagName == "category" && element.getAttribute(NAME) == LINKEDIN) {
            element.setAttribute(NAME, clone)
            categories++
        }
        if (element.tagName == "data" && element.getAttribute(HOST) == TAB_HOST) {
            element.setAttribute(HOST, "cct.$clone")
            hosts++
        }
        // GmsCore support's SPOOFED_PACKAGE_NAME tells microG which package to present to Google, so it
        // stays LinkedIn's own instead of following the copy. LinkedIn's Google OAuth client is
        // registered for $LINKEDIN and its signing certificate, which GmsCore already spoofs: a copy
        // that spoofed its own name instead would ask Google for a client that doesn't exist and be
        // turned away with an account abnormality. Counted, never renamed.
        if (element.tagName == "meta-data" &&
            element.getAttribute(NAME).endsWith(".gms.SPOOFED_PACKAGE_NAME") &&
            element.getAttribute(VALUE) == LINKEDIN
        ) {
            spoofedNames++
        }
    }

    return ManifestRename(
        labels, authorities, permissions, permissionUses, affinities, processes, categories, hosts, classNames,
        spoofedNames,
    )
}

private val LINKEDIN_MANIFEST = resourcePatch {
    execute {
        manifestFacts = null
        renameRequest = null
        document("AndroidManifest.xml").use { manifestFacts = readCloneManifest(it) }
    }

    finalize {
        val request = renameRequest ?: return@finalize
        renameRequest = null
        val facts = manifestFacts ?: refuse("the manifest half didn't read AndroidManifest.xml")
        document("res/values/strings.xml").use { strings ->
            addCloneLabel(strings, request.appName)
            moveAppFinderAuthority(strings, request.packageName)
        }
        val moved = document("AndroidManifest.xml").use {
            renameManifest(it, facts, request.packageName, request.appName)
        }
        logger.info(
            "$PATCH_NAME: moved ${moved.authorities} provider authorities, ${moved.permissions} permission " +
                "declarations, ${moved.permissionUses} permission uses, ${moved.labels} labels, " +
                "${moved.affinities} task affinities, ${moved.processes} processes, ${moved.categories} " +
                "categories, ${moved.hosts} hosts and ${moved.classNames} class names to " +
                "${request.packageName}, keeping ${moved.spoofedNames} spoofed package names as $LINKEDIN",
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

/**
 * The copy's name for each string LinkedIn's code spells out that names itself at run time: one of
 * its provider authorities, a content URI on one, or the custom tab return host. Authorities and
 * hosts that the code builds from the running package need nothing here, but the ones written out
 * would otherwise reach the installed LinkedIn or a provider this copy doesn't hold.
 */
private fun BytecodePatchContext.renameCloneStrings(facts: CloneManifestFacts, clone: String): Int {
    val content = "content://"
    val authorities = facts.authorities
    val exact = buildMap {
        authorities.forEach { put(it, cloneAuthority(it, clone)) }
        put(TAB_HOST, "cct.$clone")
    }

    fun replacement(text: String): String? {
        exact[text]?.let { return it }
        if (!text.startsWith(content)) return null
        val authority = authorities.firstOrNull { text.namesAuthority(content + it) } ?: return null
        val uri = content + authority
        return content + cloneAuthority(authority, clone) + text.removePrefix(uri)
    }

    val classes = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.implementation?.instructions?.any { it.stringValue()?.let(::replacement) != null } == true
            }
        ) {
            classes += classDef
        }
    }

    var replaced = 0
    classes.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.withIndex().forEach { (index, instruction) ->
                val to = instruction.stringValue()?.let(::replacement) ?: return@forEach
                val register = (instruction as OneRegisterInstruction).registerA
                val opcode = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) "const-string/jumbo" else "const-string"
                method.replaceInstruction(index, "$opcode v$register, \"$to\"")
                replaced++
            }
        }
    }
    return replaced
}

/** Whether this is [uri] or an address below it, not merely one it starts with. */
private fun String.namesAuthority(uri: String): Boolean =
    this == uri || startsWith("$uri/") || startsWith("$uri?") || startsWith("$uri#")

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

/** Names the copy can't take: LinkedIn's own package and the other apps LinkedIn's code knows by name. */
private val TAKEN = listOf(
    LINKEDIN,
    "$LINKEDIN.debug",
    "$LINKEDIN.learning",
    "$LINKEDIN.salesnavigator",
    "$LINKEDIN.pages",
    "$LINKEDIN.lts",
)

/**
 * Installs this build beside the installed LinkedIn as its own app, with its own package, data,
 * sign-in and home screen name.
 */
@Suppress("unused")
val installNextToLinkedInPatch = bytecodePatch(
    name = PATCH_NAME,
    description = "Installs this build as a second LinkedIn beside your normal one, with its own data and sign-in. " +
        "Pick its package name and app name in the patch's options. Works as soon as you patch it in.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Misc")
    dependsOn(LINKEDIN_MANIFEST)

    val packageName = stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE,
        title = "Package name",
        description = "The second LinkedIn's package. Each part starts with a letter, with dots between the parts, " +
            "and it can't be LinkedIn's own.",
        required = true,
    ) { clonePackageProblem(it) == null }
    val appName = stringOption(
        key = "appName",
        default = DEFAULT_LABEL,
        title = "App name",
        description = "The name under the second LinkedIn's icon. It starts with a letter and holds up to 50 characters.",
        required = true,
    ) { cloneLabelProblem(it) == null }

    execute {
        clonePackageProblem(packageName.value)?.let(::refuse)
        cloneLabelProblem(appName.value)?.let(::refuse)
    }

    finalize {
        val clone = packageName.value ?: refuse("the package name is empty")
        val label = appName.value ?: refuse("the app name is empty")
        clonePackageProblem(clone)?.let(::refuse)
        cloneLabelProblem(label)?.let(::refuse)
        val facts = manifestFacts ?: refuse("the manifest half didn't read AndroidManifest.xml")
        val moved = renameCloneStrings(facts, clone)
        logger.info("$PATCH_NAME: moved $moved code strings to $clone")
        renameRequest = CloneRequest(clone, label)
    }
}
