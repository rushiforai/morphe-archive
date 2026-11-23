package patches.eclipse

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import patches.shared.CarAppExtension
import patches.shared.carAppExtension

/** Namespace the extension owns; everything else it brings is relocated below `internal/retained/`. */
internal const val EXTENSION_NAMESPACE = "Lnl/johninnl/eclipse/auto/"

/** Where the extension's compile-only stubs live; each `Lnl/johninnl/eclipse/app/X;` becomes `LX;`. */
internal const val STUB_NAMESPACE = "Lnl/johninnl/eclipse/app/"

/**
 * Types the app owns besides its default package: stubs under their real names. The default
 * package needs no entry because only relocated stubs can live there.
 */
internal val APP_KEPT_NAME_PREFIXES = listOf("Lcom/eclipse/android/", "Landroid/support/v4/media/")

/**
 * Isolates the Car App Library dependencies exactly like Deezer's, then relocates the stub
 * references to the app's real obfuscated classes. The compat token class
 * (`Landroid/support/v4/media/session/MediaSessionCompat$Token;`) is not in the extension dex
 * and therefore never relocated: its name travels in the parcel to the host.
 */
internal fun eclipseExtension(): CarAppExtension = carAppExtension(
    resource = "/extensions/eclipse-auto.mpe",
    label = "Eclipse Music",
    ownNamespace = EXTENSION_NAMESPACE,
    appStubNamespace = STUB_NAMESPACE,
)

/** One reference the app does not satisfy. */
internal data class LinkMiss(val reference: String, val reason: String) {
    override fun toString() = "$reference: $reason"
}

/**
 * What the extension's stubs assume about the shape of an app class beyond its members: whom it
 * extends and implements, and whether it is an interface. A stub that says `he8 extends ke8`
 * makes the compiler accept passing an he8 where a ke8 is wanted; this makes the patch prove it.
 */
internal data class StubShape(
    val type: String,
    val superclass: String? = null,
    val interfaces: List<String> = emptyList(),
    val isInterface: Boolean = false,
)

/** The shapes the stubs under extensions/eclipse-auto/stubs rely on (build 155, from the dex and jadx). */
internal val STUB_SHAPES = listOf(
    StubShape("Lhe8;", superclass = "Lke8;"),
    StubShape("Lje8;", superclass = "Lke8;"),
    // Queue origins the Home rows play under ("home", "daily_mix", ...): the stubs pass them where a ke8 is wanted.
    StubShape("Lee8;", superclass = "Lke8;"),
    StubShape("Lfe8;", superclass = "Lke8;"),
    // Collection requests the app's own ed9 loaders take (editorial playlist, album, artist).
    StubShape("Lc6b;", superclass = "Lm6b;"),
    StubShape("Ld6b;", superclass = "Lm6b;"),
    StubShape("Le6b;", superclass = "Lm6b;"),
    // An addon's album and playlist (search results of an installed addon).
    StubShape("Ly5b;", superclass = "Lm6b;"),
    StubShape("Lb6b;", superclass = "Lm6b;"),
    // The classic browse tree: its results and futures (m54 is an immediate ai5; the extension's own result
    // future implements ai5), the controller task it delivers children-changed through, and the immutable
    // list the session's controller registries return.
    StubShape("Lai5;", isInterface = true, interfaces = listOf("Ljava/util/concurrent/Future;")),
    StubShape("Lm54;", interfaces = listOf("Lai5;")),
    StubShape("Lm46;", isInterface = true),
    StubShape("Lf16;", interfaces = listOf("Lm46;")),
    StubShape("Lz54;", interfaces = listOf("Ljava/util/List;")),
    // The state holders the linked-playlist loader's progress callback writes into: the bridge supplies its own.
    StubShape("Lhea;", isInterface = true),
    StubShape("Luh6;", isInterface = true, interfaces = listOf("Lhea;")),
    StubShape("Ltz1;", isInterface = true),
    StubShape("Lc12;", isInterface = true),
    StubShape("Lgy2;", interfaces = listOf("Lc12;")),
    StubShape("Lcr0;", interfaces = listOf("Ltz1;")),
    StubShape("Lvz1;", superclass = "Lcr0;"),
    StubShape("Lhka;", superclass = "Lvz1;"),
)

/**
 * Outcome of [linkCheck]. [misses] fail patching. [unverified] lists members that could only
 * be inherited from a platform superclass, which the app's dex cannot prove either way.
 */
internal class LinkReport(
    val referencesChecked: Int,
    val misses: List<LinkMiss>,
    val unverified: List<String>,
)

private val OBJECT_METHODS = setOf(
    "equals(Ljava/lang/Object;)Z", "hashCode()I", "toString()Ljava/lang/String;",
    "getClass()Ljava/lang/Class;", "notify()V", "notifyAll()V", "wait()V", "wait(J)V", "wait(JI)V",
)

private fun Int.has(flag: AccessFlags) = this and flag.value != 0

private class Hierarchy(val classes: List<ClassDef>, val complete: Boolean)

/**
 * Resolve every method, field and type reference the (already relocated) extension makes to a
 * class the app owns against the app's own dex: name, full descriptor, static-ness and public
 * access, walking superclasses and interfaces. This is what makes a version-locked symbol
 * table safe: a wrong or drifted name fails patching with the exact reference and can never
 * reach a device.
 *
 * A reference is app-owned when its class sits in the default package (only relocated stubs
 * can) or under one of [appPrefixes] (stubs that keep the app's real name). Such a class must
 * resolve through [appClass]; references to anything else (platform, Car App Library, the
 * extension itself) are not this check's business.
 */
internal fun linkCheck(
    extension: Iterable<ClassDef>,
    appClass: (String) -> ClassDef?,
    appPrefixes: List<String> = APP_KEPT_NAME_PREFIXES,
    shapes: List<StubShape> = emptyList(),
): LinkReport {
    val misses = linkedMapOf<String, LinkMiss>()
    val unverified = sortedSetOf<String>()
    val checked = HashSet<String>()

    fun appOwned(type: String) = '/' !in type || appPrefixes.any(type::startsWith)
    fun miss(reference: String, reason: String) { misses.putIfAbsent("$reference|$reason", LinkMiss(reference, reason)) }

    fun hierarchy(start: ClassDef): Hierarchy {
        val classes = ArrayList<ClassDef>()
        val seen = HashSet<String>()
        var complete = true
        var current: ClassDef? = start
        while (current != null && seen.add(current.type)) {
            classes.add(current)
            val parent = current.superclass
            current = when {
                parent == null || parent == "Ljava/lang/Object;" -> null
                else -> appClass(parent) ?: run { complete = false; null }
            }
        }
        val pending = ArrayDeque(classes.flatMap { it.interfaces })
        while (pending.isNotEmpty()) {
            val type = pending.removeFirst()
            if (!seen.add(type)) continue
            val declared = appClass(type)
            if (declared == null) { complete = false; continue }
            classes.add(declared)
            pending.addAll(declared.interfaces)
        }
        return Hierarchy(classes, complete)
    }

    fun owner(type: String, reference: String): ClassDef? {
        if (!appOwned(type)) return null
        val found = appClass(type)
        if (found == null) {
            miss(reference, "class $type does not exist in the app")
            return null
        }
        if (!found.accessFlags.has(AccessFlags.PUBLIC)) miss(reference, "class $type is not public")
        return found
    }

    fun checkMethod(ref: MethodReference, opcode: Opcode) {
        val reference = ReferenceUtil.getMethodDescriptor(ref)
        val declaring = ref.definingClass
        if (declaring.startsWith("[")) return
        val cls = owner(declaring, reference) ?: return
        if (!checked.add("$opcode|$reference")) return
        val isInterface = cls.accessFlags.has(AccessFlags.INTERFACE)
        if ((opcode == Opcode.INVOKE_INTERFACE || opcode == Opcode.INVOKE_INTERFACE_RANGE) && !isInterface) {
            miss(reference, "$declaring is a class in the app but is called with invoke-interface")
        }
        if ((opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) && isInterface) {
            miss(reference, "$declaring is an interface in the app but is called with invoke-virtual")
        }
        val parameters = ref.parameterTypes.map(CharSequence::toString)
        val chain = hierarchy(cls)
        val candidates = if (ref.name == "<init>") listOf(cls) else chain.classes
        val found = candidates.firstNotNullOfOrNull { type ->
            type.methods.firstOrNull { it.name == ref.name && it.returnType == ref.returnType &&
                it.parameterTypes.map(CharSequence::toString) == parameters }
        }
        if (found == null) {
            val signature = reference.substringAfter("->")
            // Members a platform superclass (or Object) supplies cannot be proven missing from the app's dex.
            if (ref.name != "<init>" && (!chain.complete || signature in OBJECT_METHODS)) {
                unverified.add(reference)
                return
            }
            val sameName = candidates.flatMap { type -> type.methods.filter { it.name == ref.name } }
                .map { ReferenceUtil.getMethodDescriptor(it) }
            miss(reference, if (sameName.isEmpty()) "no method named ${ref.name} in the app class"
                else "no method with this descriptor; the app has ${sameName.joinToString()}")
            return
        }
        val flags = found.accessFlags
        val wantsStatic = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE
        when {
            !flags.has(AccessFlags.PUBLIC) -> miss(reference, "member is not public in the app")
            flags.has(AccessFlags.STATIC) != wantsStatic -> miss(reference,
                if (wantsStatic) "member is an instance method in the app but called as static"
                else "member is static in the app but called as an instance method")
            ref.name == "<init>" && !flags.has(AccessFlags.CONSTRUCTOR) ->
                miss(reference, "member is not a constructor in the app")
        }
    }

    fun checkField(ref: FieldReference, opcode: Opcode) {
        val reference = ReferenceUtil.getFieldDescriptor(ref)
        val declaring = ref.definingClass
        if (declaring.startsWith("[")) return
        val cls = owner(declaring, reference) ?: return
        if (!checked.add("$opcode|$reference")) return
        val chain = hierarchy(cls)
        val found = chain.classes.firstNotNullOfOrNull { type ->
            type.fields.firstOrNull { it.name == ref.name && it.type == ref.type }
        }
        if (found == null) {
            if (!chain.complete) { unverified.add(reference); return }
            val sameName = chain.classes.flatMap { type -> type.fields.filter { it.name == ref.name } }
                .map { ReferenceUtil.getFieldDescriptor(it) }
            miss(reference, if (sameName.isEmpty()) "no field named ${ref.name} in the app class"
                else "no field with this type; the app has ${sameName.joinToString()}")
            return
        }
        val flags = found.accessFlags
        // dexlib2's Opcode.name is the smali mnemonic ("sget-object"), not the enum constant name.
        val wantsStatic = opcode.name.startsWith("sget") || opcode.name.startsWith("sput")
        when {
            !flags.has(AccessFlags.PUBLIC) -> miss(reference, "member is not public in the app")
            flags.has(AccessFlags.STATIC) != wantsStatic -> miss(reference,
                if (wantsStatic) "field is an instance field in the app but accessed as static"
                else "field is static in the app but accessed as an instance field")
        }
    }

    for (cls in extension) {
        val parent = cls.superclass
        if (parent != null && appOwned(parent)) {
            val declared = owner(parent, "${cls.type} extends $parent")
            if (declared != null && declared.accessFlags.has(AccessFlags.FINAL)) {
                miss("${cls.type} extends $parent", "class $parent is final in the app")
            }
            if (declared != null && declared.accessFlags.has(AccessFlags.INTERFACE)) {
                miss("${cls.type} extends $parent", "$parent is an interface in the app")
            }
        }
        for (type in cls.interfaces) if (appOwned(type)) {
            val declared = owner(type, "${cls.type} implements $type")
            if (declared != null && !declared.accessFlags.has(AccessFlags.INTERFACE)) {
                miss("${cls.type} implements $type", "$type is a class in the app")
            }
        }
        for (method in cls.methods) {
            val implementation = method.implementation ?: continue
            for (instruction in implementation.instructions) {
                val reference = (instruction as? ReferenceInstruction)?.reference
                when (reference) {
                    is MethodReference -> checkMethod(reference, instruction.opcode)
                    is FieldReference -> checkField(reference, instruction.opcode)
                    is TypeReference -> {
                        val type = reference.type.trimStart('[')
                        if (type.startsWith("L") && appOwned(type) && checked.add("type|$type")) {
                            owner(type, "${instruction.opcode.name} $type")
                        }
                    }
                    else -> Unit
                }
            }
        }
    }
    for (shape in shapes) {
        val declared = appClass(shape.type)
        if (declared == null) { miss(shape.type, "class does not exist in the app"); continue }
        if (shape.isInterface != declared.accessFlags.has(AccessFlags.INTERFACE)) {
            miss(shape.type, if (shape.isInterface) "the stub declares an interface but the app has a class"
                else "the stub declares a class but the app has an interface")
        }
        if (shape.superclass != null && declared.superclass != shape.superclass) {
            miss("${shape.type} extends ${shape.superclass}", "the app's superclass is ${declared.superclass}")
        }
        for (type in shape.interfaces) {
            if (type !in declared.interfaces) miss("${shape.type} implements $type", "the app's interfaces are ${declared.interfaces}")
        }
    }
    return LinkReport(checked.size, misses.values.toList(), unverified.toList())
}

/** The failure message for [report], listing every miss with its exact reference. */
internal fun linkFailure(label: String, report: LinkReport): String =
    "$label extension link check failed with ${report.misses.size} unresolved reference(s) " +
        "(the app build differs from the one the symbol table was written for):\n" +
        report.misses.joinToString("\n") { "  $it" }
