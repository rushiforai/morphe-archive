// Added for Heval's Morphe Patches (2026-11-03, first used by Tasker): the scoped ("login-only")
// mode of the shared "GmsCore support" builder. Not upstream code.

package app.template.patches.shared.misc.gms

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/**
 * Login-only routing for "GmsCore support": only the Google Play services an app needs for Google
 * sign-in move to MicroG RE, and everything else (location, push, Maps, ...) keeps using the real
 * Google Play services, which must stay installed.
 *
 * In this mode the builder does not report Google Play services as available, does not rename the
 * c2dm (FCM) manifest entries and does not touch androidx.credentials. It:
 * 1. points every BaseGmsClient subclass whose start-service action is in [serviceActions] at
 *    MicroG RE: an override of the client's start-service package getter returns MicroG RE's
 *    package, and an override of its dynamic-lookup getter returns false. BaseGmsClient's own
 *    getter is shared by every client, so it is left alone. Dynamic lookup asks the real Google Play
 *    services' chimera provider which service answers an action, so a client that keeps it would
 *    send MicroG RE's action to Google Play services instead of binding MicroG RE directly;
 * 2. applies the usual GmsCore string rewrite only inside the classes that hold one of
 *    [serviceActions] or [anchorStrings], the classes whose type starts with one of [classPrefixes],
 *    and the methods that hold one of [methodAnchorStrings].
 *
 * Every action, anchor and prefix must match, so a library update that moves one fails loudly.
 *
 * @param serviceActions Start-service actions of the clients to bind to MicroG RE. Each must be in
 *        [GmsCoreConstants.ACTIONS], so the string rewrite moves the action to MicroG RE's namespace.
 * @param anchorStrings String constants that put their whole class in the rewrite (for example an
 *        intent action or a component name the sign-in code uses).
 * @param classPrefixes Type prefixes of library classes R8 keeps by name (manifest components,
 *        public Parcelables) whose strings are rewritten too.
 * @param methodAnchorStrings String constants that put only their method in the rewrite, for
 *        shared library classes where the rest of the class must keep Google Play services.
 */
class GmsCoreScope(
    val serviceActions: Set<String>,
    val anchorStrings: Set<String> = emptySet(),
    val classPrefixes: Set<String> = emptySet(),
    val methodAnchorStrings: Set<String> = emptySet(),
) {
    init {
        require(serviceActions.isNotEmpty()) { "A GmsCore scope needs at least one service action" }
        serviceActions.forEach {
            require(it in GmsCoreConstants.ACTIONS) { "$it is not a GmsCore action, so it would not be rewritten" }
        }
    }
}

private const val STRING = "Ljava/lang/String;"

/** The package MicroG RE is installed as; the routed clients bind to it. */
private const val GMS_CORE_PACKAGE = "$GMS_CORE_VENDOR_GROUP_ID.android.gms"

private fun Method.constStrings(): List<String> = implementation?.instructions?.mapNotNull {
    if (it.opcode != Opcode.CONST_STRING && it.opcode != Opcode.CONST_STRING_JUMBO) return@mapNotNull null
    ((it as ReferenceInstruction).reference as StringReference).string
} ?: emptyList()

/**
 * Decides which methods get the GmsCore string rewrite under [scope]. Resolved before anything is
 * rewritten, because the class anchors are themselves rewritten.
 */
internal fun BytecodePatchContext.gmsCoreScopeFilter(scope: GmsCoreScope): (ClassDef, Method) -> Boolean {
    val classAnchors = scope.serviceActions + scope.anchorStrings
    val inScope = mutableSetOf<String>()
    val foundAnchors = mutableSetOf<String>()
    val foundPrefixes = mutableSetOf<String>()
    val foundMethodAnchors = mutableSetOf<String>()
    classDefForEach { classDef ->
        val prefixes = scope.classPrefixes.filter { classDef.type.startsWith(it) }
        foundPrefixes += prefixes
        var anchored = prefixes.isNotEmpty()
        for (method in classDef.methods) {
            val strings = method.constStrings()
            val anchors = strings.filter { it in classAnchors }
            if (anchors.isNotEmpty()) {
                foundAnchors += anchors
                anchored = true
            }
            foundMethodAnchors += strings.filter { it in scope.methodAnchorStrings }
        }
        if (anchored) inScope += classDef.type
    }

    val missing = (classAnchors - foundAnchors) + (scope.classPrefixes - foundPrefixes) +
        (scope.methodAnchorStrings - foundMethodAnchors)
    if (missing.isNotEmpty()) throw PatchException("GmsCore scope anchors not found: $missing")

    return { classDef, method ->
        classDef.type in inScope || method.constStrings().any { it in scope.methodAnchorStrings }
    }
}

/** Names of BaseGmsClient's start-service package, start-service action and dynamic-lookup getters. */
private class ServiceGetters(val base: String, val packageGetter: String, val actionGetter: String, val dynamicLookup: String)

/**
 * Reads the getter names from BaseGmsClient's connect step: the binding config is built by a
 * constructor taking (String package, String action, boolean, int, boolean dynamicLookup), and the
 * three no-argument calls on the client right before it are, in order, the package getter (String),
 * the action getter (String) and the dynamic-lookup getter (boolean). The other binding config in
 * that method (local start-service action) is built from the app's package name and does not
 * have that call sequence.
 */
private fun BytecodePatchContext.findServiceGetters(): ServiceGetters {
    BaseGmsClientConnectFingerprint.clearMatch()
    val connect = BaseGmsClientConnectFingerprint.method
    val base = connect.definingClass
    val instructions = connect.implementation?.instructions?.toList()
        ?: throw PatchException("$base connect step has no code")

    val matches = instructions.mapIndexedNotNull { index, instruction ->
        val init = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) return@mapIndexedNotNull null
        if (init.name != "<init>" || init.parameterTypes.map(CharSequence::toString) != listOf(STRING, STRING, "Z", "I", "Z")) {
            return@mapIndexedNotNull null
        }
        val calls = instructions.subList(0, index).mapNotNull { previous ->
            if (previous.opcode != Opcode.INVOKE_VIRTUAL && previous.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return@mapNotNull null
            ((previous as ReferenceInstruction).reference as MethodReference).takeIf {
                it.definingClass == base && it.parameterTypes.isEmpty()
            }
        }.takeLast(3)
        calls.takeIf { it.map(MethodReference::getReturnType) == listOf(STRING, STRING, "Z") }
    }
    val calls = matches.singleOrNull()
        ?: throw PatchException("Expected one (package, action, dynamic lookup) binding in $base->${connect.name}, found ${matches.size}")
    return ServiceGetters(base, calls[0].name, calls[1].name, calls[2].name)
}

/**
 * Step 1 of [GmsCoreScope]: binds the BaseGmsClient subclasses whose start-service action is in
 * [serviceActions] to MicroG RE. Runs before the string rewrite, which renames the actions.
 *
 * @return The routed client classes.
 */
internal fun BytecodePatchContext.routeScopedGmsClients(serviceActions: Set<String>): List<String> {
    val getters = findServiceGetters()
    val base = classDefBy(getters.base)

    fun baseGetter(name: String, returnType: String) = base.methods.singleOrNull {
        it.name == name && it.parameterTypes.isEmpty() && it.returnType == returnType && it.implementation != null
    } ?: throw PatchException("${getters.base} has no concrete $name()$returnType")
    val packageGetter = baseGetter(getters.packageGetter, STRING)
    val dynamicLookup = baseGetter(getters.dynamicLookup, "Z")
    // The shared getter answers Google Play services; it stays that way for every other client.
    if ("com.google.android.gms" !in packageGetter.constStrings()) {
        throw PatchException("${getters.base}->${packageGetter.name} does not return com.google.android.gms")
    }
    listOf(packageGetter, dynamicLookup).forEach {
        if (AccessFlags.FINAL.isSet(it.accessFlags) || AccessFlags.PRIVATE.isSet(it.accessFlags)) {
            throw PatchException("${getters.base}->${it.name} cannot be overridden")
        }
    }

    // Collect first: mutating classes while iterating them is not allowed.
    val superclasses = mutableMapOf<String, String?>()
    val candidates = mutableMapOf<String, String>()
    classDefForEach { classDef ->
        superclasses[classDef.type] = classDef.superclass
        val action = classDef.methods.firstNotNullOfOrNull { method ->
            if (method.name != getters.actionGetter || method.parameterTypes.isNotEmpty() || method.returnType != STRING) {
                return@firstNotNullOfOrNull null
            }
            method.constStrings().firstOrNull { it in serviceActions }
        }
        if (action != null) candidates[classDef.type] = action
    }
    fun extendsBase(type: String): Boolean {
        var current = superclasses[type]
        while (current != null) {
            if (current == getters.base) return true
            current = superclasses[current]
        }
        return false
    }
    val clients = candidates.filterKeys(::extendsBase)
    val missing = serviceActions - clients.values.toSet()
    if (missing.isNotEmpty()) throw PatchException("No BaseGmsClient subclass found for $missing")

    for (client in clients.keys) {
        val mutable = mutableClassDefBy(client)
        mutable.override(packageGetter, "const-string v0, \"$GMS_CORE_PACKAGE\"\nreturn-object v0")
        mutable.override(dynamicLookup, "const/4 v0, 0x0\nreturn v0")
    }
    return clients.keys.sorted()
}

/**
 * Makes [this] class answer [baseMethod] (a no-argument getter) with [smali]: prepended to the
 * class's own override when it has one, else added as a new override with the base's access.
 */
private fun MutableClass.override(baseMethod: Method, smali: String) {
    val own = methods.firstOrNull {
        it.name == baseMethod.name && it.parameterTypes.isEmpty() && it.returnType == baseMethod.returnType
    }
    if (own != null) {
        val implementation = own.implementation ?: throw PatchException("$type->${own.name} has no code")
        if (implementation.registerCount - 1 < 1) throw PatchException("$type->${own.name} has no local register")
        own.addInstructionsChecked(0, smali)
        return
    }
    methods.add(
        ImmutableMethod(
            type,
            baseMethod.name,
            emptyList(),
            baseMethod.returnType,
            baseMethod.accessFlags and AccessFlags.ABSTRACT.value.inv(),
            null,
            null,
            // v0 (a local) and p0 (this).
            MutableMethodImplementation(2),
        ).toMutable().apply { addInstructionsChecked(0, smali) },
    )
}
