/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference

/**
 * Store the bundled Google LVL policy reads its state from.
 *
 * `r3/i` in 3.7.0 and `J3/i` in 3.8.0 open the same file, so the name outlives the obfuscation
 * and identifies the policy class in any build.
 */
private const val POLICY_PREFERENCES = "com.google.android.vending.licensing.ServerManagedPolicy"

/**
 * The preference keys the policy reads its state from.
 *
 * Numeric defaults are inlined by `R8` and vanish from the dex, so the keys are what locates the
 * policy: they are the policy's own vocabulary, they are read together, and no other class in the
 * app reads all of them.
 */
private val POLICY_KEYS = listOf(
    "lastResponse",
    "validityTimestamp",
    "retryUntil",
)

/** The four-argument `Policy` interface method, whose parameters are the raw response parts. */
private const val POLICY_INTERFACE = "Lcom/github/javiersantos/licensing/Policy;"

/** The internal map of the preference model, which the policy's key reads go through. */
private const val POLICY_KEYS_MEMBER = "Lf0/b;->a()Ljava/util/Map;"

/** The file extension DataStore appends to a preference store's name. */
private const val FILE_SUFFIX = ".preferences_pb"

/**
 * The name of the mapped counter file.
 *
 * DataStore ships a decompiled preference store that counts writes two ways. Which object it
 * builds is one `when` over a strategy index: one arm opens this file and maps it through
 * `libdatastore_shared_counter`, every other arm returns a counter held in memory. Only the arm
 * naming this file is the one that maps, so the literal is what it is found by.
 */
private const val COUNTER_STRATEGY_ARM = "datastore_shared_counter"

/**
 * Unlocks the premium features.
 *
 * The wall between a fresh install and the paid features is the Java licence policy. Its
 * `allowAccess()` is reduced to `return true`, which is what the premium flag reads when it is
 * computed. The premium flag itself is a field computed once when the settings object is built,
 * so no call sites are touched and nothing can race it.
 *
 * The native engine is left exactly as shipped. Disarming its refusals - first the verification
 * routine's branches, then every copy in the library - does not unlock anything: the engine keeps
 * its own state, and the app either dies on a destroyed mutex at start or hangs on the splash
 * until the system kills it. The Java grant alone is what the library has been shown to accept.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Reports the app as licensed, which unlocks the premium features.",
    default = true,
) {
    compatibleWith(TVQUICKACTIONS)

    execute {
        forceLicenceGranted()
        skipLicenceServerCheck()
        dropSharedCounter()
        restorePreferenceStore()
        disableHeartbeat()
    }
}

/**
 * Makes the licence policy accept everything.
 *
 * The policy class is the one reading the policy preference store. It is not identified by name:
 * an empty stub of the same library also lives in the app, so the class is chosen by the store it
 * reads and by the default response it falls back to, and only then is its argument-less boolean
 * method taken, which is the one the premium flag is built from.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.forceLicenceGranted() {
    val keywordClasses = POLICY_KEYS.map { key ->
        classDefByStrings(key, StringComparisonType.EQUALS).map { it.type }.toSet()
    }
    val stubs = classDefByStrings(POLICY_INTERFACE, StringComparisonType.CONTAINS)
        .map { it.type }
        .toSet()

    val policy = classDefByStrings(POLICY_PREFERENCES, StringComparisonType.EQUALS)
        .firstOrNull { classDef ->
            classDef.type !in stubs &&
                    keywordClasses.all { classDef.type in it } &&
                    classDef.methods.any { it.isNoArgumentBoolean() }
        }
        ?: throw PatchException(
            "Could not find the licence policy class. This patch supports tvQuickActions Pro 3.x."
        )

    val policyClass = mutableClassDefBy(policy.type)
    val allowAccess = policyClass.methods.firstOrNull { it.isNoArgumentBoolean() }
        ?: throw PatchException("Could not find the licence policy allowAccess() method")

    allowAccess.returnEarly(true)
}
private fun Method.isNoArgumentBoolean() = returnType.toString() == "Z" && parameterTypes.isEmpty()

/**
 * Stops the app's own licence checker from ever reporting "not licensed".
 *
 * The checker keeps the vendor's RSA public key, builds the certificate identity it expects from
 * it, binds the licensing service with that identity, and wraps every answer in the vendor's
 * result type before the policy sees it. A repackaged APK is signed with a different key, so the
 * identity never matches, the policy keeps the "not licensed" state it was created with, and the
 * worker that runs on every start reports the failure.
 *
 * The fix keeps the key - which is the vendor's, and is the identity the license file names - and
 * answers the worker's own callback instead of waiting for it: the checker's `checkAccess` is cut
 * down to handing back a success result, so no bind and no server round-trip can fail.
 */
/**
 * The checker's sync method, matched by its only parameter: the callback interface it reports to.
 *
 * The checker is not named: the vendor renames its classes every release (`J3` in 3.8.0, `K3` in
 * 3.9.0), so it is found by shape instead. Its sync method takes the callback interface, whose own
 * method takes a single status code, and the body calls that method to report the answer - a
 * combination nothing else in the app has.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.skipLicenceServerCheck() {
    val checkAccess = licenceCheckerClasses()
        .asSequence()
        .flatMap { it.methods.asSequence() }
        .firstOrNull { m -> m.parameters.size == 1 && isLicenceCallback(m.parameters[0].type) }
        ?: throw PatchException(
            "Could not find the licence checker. This patch supports tvQuickActions Pro 3.x."
        )
    val onLicenced = checkAccess.parameters[0].type

    val guard = listOf(
        BuilderInstruction21s(Opcode.CONST_16, 0, 0x100),
        BuilderInstruction35c(
            Opcode.INVOKE_INTERFACE,
            1,
            1,
            0,
            0,
            0,
            0,
            ImmutableMethodReference(onLicenced, "c", listOf("I"), "V"),
        ),
        BuilderInstruction10x(Opcode.RETURN_VOID),
    )

    checkAccess.replaceInstructions(0, guard)

    println("[unlock] patched ${checkAccess.definingClass}->${checkAccess.name} of type $onLicenced")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.licenceCheckerClasses():
        List<app.morphe.patcher.util.proxy.mutableTypes.MutableClass> {
    val found = classDefByOrNull { cls ->
        cls.methods.any { m ->
            m.parameters.size == 1 &&
                    isLicenceCallback(m.parameters[0].type) &&
                    m.implementation?.instructions?.any { ins ->
                        ins is ReferenceInstruction &&
                                ins.reference is MethodReference &&
                                (ins.reference as MethodReference).name == "c" &&
                                (ins.reference as MethodReference).parameterTypes.size == 1 &&
                                (ins.reference as MethodReference).parameterTypes[0].toString() == "I"
                    } == true
        }
    }
    return listOfNotNull(found?.let { mutableClassDefBy(it.type) })
}

private fun app.morphe.patcher.patch.BytecodePatchContext.isLicenceCallback(type: String): Boolean =
    !SUPERTYPES.contains(type) &&
            runCatching {
                classDefBy(type).methods.any { it.parameters.size == 1 && it.name == "c" }
            }.getOrDefault(false)

/**
 * Types a callback test must never match.
 *
 * The checkout test is deliberately loose: any class whose `c(I)` takes one argument. Framework
 * base classes satisfy it too, and arming an `invoke-interface` against `Activity` is both wrong
 * and enough for the bundle writer to drop the dex. They are listed once and excluded by name.
 */
private val SUPERTYPES = setOf(
    "Landroid/app/Activity;",
    "Landroid/content/Context;",
    "Ljava/lang/Object;",
    "Ljava/lang/Enum;",
    "Ljava/lang/Throwable;",
    "Lkotlin/coroutines/Continuation;",
    "Lk4/i;",
    "Ll4/i;",
    "Ls4/p;",
    "Lt4/p;",
    "Lt4/a;",
)
/**
 * Keeps the app off the DataStore shared counter.
 *
 * The counter is the multi-process coordinator DataStore picks when more than one process may
 * touch the preferences file. It maps the count file through `libdatastore_shared_counter`, and
 * the mapped value is read under the heartbeat monitor during start; when the read and the map
 * disagree the runtime aborts inside the lock and the app dies before its first frame.
 *
 * Redirecting the library load does not help - the linker namespace resolves the library before
 * the app's own load runs, so the mapping is already in place whatever that call returns. The
 * counter object is therefore never built: the two arms that map the file are rewritten to take
 * the plain value the other arms take, which is `0`.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.dropSharedCounter() {
    // The counter object is a long paired with the native class, and the native class reads that
    // long as a pointer into a mapping that stops existing. Two of the four read sites have no
    // guard at all, so the guard cannot be the place to work: the read itself is answered locally
    // and the count object is never consulted. The value is the one the app has already written
    // into the preference store, so reading it back from memory keeps the counter moving.
    val native = "Landroidx/datastore/core/NativeSharedCounter;"
    var rewritten = 0

    classDefForEach { cls ->
        val mutable = mutableClassDefBy(cls)
        mutable.methods.toList().forEach method@ { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@method
            val call = instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference != null &&
                        reference.definingClass == native &&
                        reference.name in setOf("nativeGetCounterValue", "nativeIncrementAndGetCounterValue")
            }
            if (call < 0) return@method

            // Both calls return an int that the following move-result copies out. A move-result
            // with no invoke in front of it is rejected by the verifier, so the pair is collapsed
            // into one constant write to the register the move-result was going to fill.
            val result = instructions.getOrNull(call + 1)
            if (result?.opcode != Opcode.MOVE_RESULT) return@method
            val target = (result as com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x).registerA

            method.replaceInstruction(
                call,
                BuilderInstruction21s(Opcode.CONST_16, target, 0),
            )
            method.removeInstruction(call + 1)
            rewritten++
        }
    }

    require(rewritten > 0) { "Could not find the counter mapping." }
    println("[unlock] removed the shared counter mapping")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.restorePreferenceStore() {
    val factory = classDefByOrNull { cls ->
        cls.methods.any { m ->
            m.returnType.toString() == "Ljava/lang/Object;" &&
                    m.implementation?.instructions?.any { ins ->
                        ins is ReferenceInstruction &&
                                (ins.reference as? MethodReference)?.name == "getSharedPreferences"
                    } == true &&
                    m.implementation?.instructions?.any { ins ->
                        (ins as? ReferenceInstruction)?.reference?.toString() == FILE_SUFFIX
                    } == true
        }
    } ?: throw PatchException("Could not find the preference store factory.")

    val factoryClass = mutableClassDefBy(factory.type)
    val initialiser = factoryClass.methods.first { m ->
        m.returnType.toString() == "Ljava/lang/Object;" &&
                m.implementation?.instructions?.any { ins ->
                    ins is ReferenceInstruction &&
                            (ins.reference as? MethodReference)?.name == "getSharedPreferences"
                } == true
    }

    // The factory is a `when` over an index and its arms are numbered by the compiler, so no arm
    // is named. Two of them are the preference store: the one that appends the store file's
    // extension, and the one that opens the store. The store is opened under the plain name the
    // file arm would have had, so it lives among the app's own preferences, and the file arm keeps
    // that same plain name so the two cannot disagree.
    val instructions = initialiser.implementation!!.instructions.toList()
    val opensAt = instructions.indexOfFirst { ins ->
        (ins as? ReferenceInstruction)?.let { (it.reference as? MethodReference)?.name } ==
                "getSharedPreferences"
    }
    val suffixAt = instructions.indexOfFirst { ins ->
        (ins as? ReferenceInstruction)?.reference?.toString() == FILE_SUFFIX
    }

    if (opensAt < 0 || suffixAt < 0) {
        throw PatchException("Could not find the preference store arm.")
    }

    val suffix = instructions[suffixAt] as BuilderInstruction21c
    val empty = BuilderInstruction21c(Opcode.CONST_STRING, suffix.registerA, ImmutableStringReference(""))

    initialiser.replaceInstruction(suffix.location.index, empty)

    // Two lines of the arm are rewritten, and nothing else in it moves: the store is opened by the
    // arm's own context and store-name registers, with the name replaced by the literal the file
    // arm now uses too, so the store lives among the app's own preferences.
    val openCall = instructions[opensAt] as BuilderInstruction35c

    val lastLiteralAt = instructions
        .subList(0, opensAt)
        .indexOfLast { it is BuilderInstruction21c }
    val lastLiteral = instructions[lastLiteralAt] as BuilderInstruction21c

    initialiser.replaceInstruction(
        lastLiteral.location.index,
        BuilderInstruction21c(
            Opcode.CONST_STRING,
            lastLiteral.registerA,
            ImmutableStringReference(""),
        ),
    )

    initialiser.replaceInstruction(
        openCall.location.index,
        BuilderInstruction35c(
            Opcode.INVOKE_VIRTUAL,
            2,
            1,
            2,
            0,
            0,
            0,
            ImmutableMethodReference(
                "Landroid/content/Context;",
                "getSharedPreferences",
                listOf("Ljava/lang/String;", "I"),
                "Landroid/content/SharedPreferences;",
            ),
        ),
    )

    println("[unlock] restored the preference store in ${factory.type}->${initialiser.name}")
}


/**
 * Keeps Firebase's session heartbeat away from DataStore at start.
 *
 * The heartbeat controller is built while Firebase initialises and immediately fetches the stored
 * heartbeat list - a blocking read that runs with the controller's own lock held. The app never
 * uses heartbeat, so the list read is answered with an empty list and the write-back is skipped,
 * which also keeps the shared counter out of reach.
 *
 * The storage class is found by the preference keys it seeds, which are Firebase's own and survive
 * renaming; its list method is the only one returning `ArrayList`.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.disableHeartbeat() {
    val keys = HEARTBEAT_KEYS.map { key ->
        classDefByStrings(key, StringComparisonType.EQUALS).map { it.type }.toSet()
    }
    val storage = classDefByOrNull { cls ->
        keys.all { it.contains(cls.type) } &&
                cls.methods.any { it.returnType.toString() == "Ljava/util/ArrayList;" }
    } ?: throw PatchException("Could not find the Firebase heartbeat storage.")

    val storageClass = mutableClassDefBy(storage.type)
    val list = storageClass.methods.first { it.returnType.toString() == "Ljava/util/ArrayList;" }

    list.replaceInstructions(
        0,
        listOf(
            BuilderInstruction21c(
                Opcode.NEW_INSTANCE,
                0,
                ImmutableTypeReference("Ljava/util/ArrayList;"),
            ),
            BuilderInstruction35c(
                Opcode.INVOKE_DIRECT,
                1,
                0,
                0,
                0,
                0,
                0,
                ImmutableMethodReference("Ljava/util/ArrayList;", "<init>", listOf(), "V"),
            ),
            BuilderInstruction11x(Opcode.RETURN_OBJECT, 0),
        ),
    )

    // Nothing is written back. The method is `declared-synchronized`, so its monitor is taken by
    // the caller and released by the runtime; emitting the lock pair here would take a monitor the
    // frame does not own and release one it never took, which the runtime reports as a destroyed
    // mutex. A bare return is all this needs to be - the write path becomes unreachable.
    storageClass.methods
        .filter { it.name == "d" && it.parameterTypes.size == 2 }
        .forEach { save ->
            save.replaceInstructions(
                0,
                listOf(BuilderInstruction10x(Opcode.RETURN_VOID)),
            )
        }

    println("[unlock] disabled the heartbeat in ${storage.type}")
}

/** The preference keys Firebase's heartbeat storage seeds on first use. */
private val HEARTBEAT_KEYS = listOf(
    "fire-global",
    "fire-count",
    "last-used-date",
)
