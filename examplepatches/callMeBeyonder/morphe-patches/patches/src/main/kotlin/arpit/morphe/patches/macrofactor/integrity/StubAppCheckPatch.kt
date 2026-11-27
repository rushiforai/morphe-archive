package arpit.morphe.patches.macrofactor.integrity

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import arpit.morphe.patches.macrofactor.diet.shared.Constants.COMPATIBILITY_MACROFACTOR_DIET_5813
import arpit.morphe.util.replaceBlockAtLabel

private const val INTEGRITY_MANAGER_FACTORY = "Lcom/google/android/play/core/integrity/IntegrityManagerFactory;"
private const val TASK = "Lcom/google/android/gms/tasks/Task;"
private const val APP_CHECK_ERROR_CODE = "firebase_app_check"

private fun Method.referencesString(value: String) =
    implementation?.instructions?.any { insn ->
        insn.opcode.let { it == Opcode.CONST_STRING || it == Opcode.CONST_STRING_JUMBO } && (insn as ReferenceInstruction).reference.let {
            it is StringReference && it.string == value
        }
    } == true

private fun Method.referencesType(type: String) =
    implementation?.instructions?.any { insn ->
        (insn as? ReferenceInstruction)?.reference.let { it is MethodReference && it.definingClass == type }
    } == true

private fun Method.castTypes(into: MutableSet<String>) {
    implementation?.instructions?.forEach { insn ->
        if (insn.opcode == Opcode.CHECK_CAST) {
            into += ((insn as ReferenceInstruction).reference as TypeReference).type
        }
    }
}

private fun ClassDef.hasTokenCtor() =
    methods.any { it.name == "<init>" && it.parameterTypes == listOf("J", "J", "Ljava/lang/String;") }

/**
 * The AppCheckToken result class, found by what it does rather than by who casts to it: it is the
 * only class with a `(long, long, String)` constructor that also (de)serializes those two longs,
 * which it reads from the token's `expiresIn` / `receivedAt` JSON fields.
 *
 * The earlier version followed the pigeon reply wrapper's `CHECK_CAST` targets instead, which
 * resolved locally but failed on-device (`AppCheckToken result class not found`) across patcher
 * versions, so the wrapper is only used as a fallback now.
 */
private fun findTokenClass(
    all: Map<String, ClassDef>,
    replyWrapper: ClassDef,
): String? {
    val byShape = all.values.filter { c ->
        c.hasTokenCtor() && c.methods.any { m ->
            m.referencesString("receivedAt") && m.referencesString("expiresIn")
        }
    }
    val candidates = if (byShape.isNotEmpty()) {
        byShape.map { it.type }
    } else {
        buildSet { replyWrapper.methods.forEach { it.castTypes(this) } }
            .filter { type -> all[type]?.hasTokenCtor() == true }
    }

    return candidates.singleOrNull()
}

/**
 * An interface declaring only two no-arg methods returning Task: the AppCheckProvider interface
 * (getToken / getLimitedUseToken). Firebase Auth also builds a Play IntegrityManager for phone
 * verification, so the factory call alone does not pin the AppCheck provider -- but only the
 * AppCheck providers implement this interface shape.
 */
private fun ClassDef.implementsTokenProviderInterface(all: Map<String, ClassDef>) =
    interfaces.any { iface ->
        val methods = all[iface]?.methods ?: return@any false
        methods.count() > 0 && methods.all { it.returnType == TASK && it.parameterTypes.none() }
    }

/**
 * MacroFactor gates its AI food search on Firebase App Check with the Play Integrity provider
 * (`deviceIntegrityStatusProvider` -> `appCheckTestResultProvider` -> pigeon
 * `FirebaseAppCheckHostApi.getToken`). On a patched (re-signed) install Play Integrity can never
 * return a verdict, so every token fetch fails and the app reports "Device integrity can't be
 * verified".
 *
 * The provider is a plain Java class in the dex (the Dart side is AOT and out of reach), so this
 * stubs its token task to succeed immediately with a throwaway token. That clears the client-side
 * integrity state; the server still validates the token it is sent, so AI food search keeps
 * failing there -- this patch only strips the client-side check.
 *
 * Everything is found by shape, not name (R8 renames every class each build):
 * - the provider is the only IntegrityManagerFactory user that implements the AppCheckProvider
 *   interface shape, and its token task is its only `(Z)Task` method;
 * - the AppCheckToken result class is the only `(J, J, String)` constructor among the classes the
 *   pigeon reply wrapper (the one class with the "firebase_app_check" error code) casts to.
 */
@Suppress("unused")
val stubAppCheckPatch = bytecodePatch(
    name = "Stub App Check tokens",
    description = "Makes Firebase App Check's Play Integrity token fetch succeed with a throwaway " +
        "token, so the app no longer reports \"Device integrity can't be verified\". The server " +
        "still rejects the token, so AI food search keeps failing there. Client-side check only.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MACROFACTOR_DIET_5813)

    execute {
        val allClasses = mutableMapOf<String, ClassDef>()
        classDefForEach { allClasses[it.type] = it }

        // 1. The Play Integrity AppCheckProvider.
        val providerTypes = allClasses.values.filter { c ->
            c.methods.any { it.referencesType(INTEGRITY_MANAGER_FACTORY) } && c.implementsTokenProviderInterface(allClasses)
        }
        if (providerTypes.isEmpty()) throw PatchException("Play Integrity AppCheck provider not found")
        if (providerTypes.size > 1) throw PatchException("ambiguous Play Integrity providers: ${providerTypes.map { it.type }}")

        val provider = mutableClassDefBy(providerTypes.single().type)

        // 2. Its token task: the one instance method taking a boolean and returning a Task
        //    (a() and b() forward to it; getToken and getLimitedUseAppCheckToken both land here).
        val tokenTask = provider.methods.singleOrNull {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == TASK && it.parameterTypes == listOf("Z")
        } ?: throw PatchException("provider token method (Z)Task not found")

        // 3. The AppCheckToken result class.
        val replyWrapperTypes = allClasses.values.filter { it.methods.any { m -> m.referencesString(APP_CHECK_ERROR_CODE) } }
        if (replyWrapperTypes.size != 1) throw PatchException("pigeon App Check reply wrapper not found")
        val tokenType = findTokenClass(allClasses, replyWrapperTypes.single())
            ?: throw PatchException("AppCheckToken result class not found (or ambiguous)")

        // 4. Replace the token task's body: return a successful task with a throwaway token
        //    (expiresIn 1 h, issued now). The old body -- the whole Play Integrity attestation and
        //    token exchange -- is left behind the return as unreachable code.
        //
        // The ctor takes (expiresInMillis, receivedAtMillis, token). Registers are laid out so the
        // 6 argument slots are contiguous and /range can be used: 3-register invoke tops out at 5
        // registers, and the instance plus two wide pairs plus the string need 6.
        // `.locals 4` + 2 parameters = 6 registers, and v4/v5 alias the dead p0/p1 after the return.
        val impl = tokenTask.implementation!!
        if (impl.registerCount < 6) throw PatchException("token method has only ${impl.registerCount} registers")
        tokenTask.replaceBlockAtLabel(
            0,
            """
                new-instance v0, $tokenType
                const-wide/32 v1, 0x36ee80
                invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
                move-result-wide v3
                const-string v5, "morphe-appcheck-stub"
                invoke-direct/range {v0 .. v5}, $tokenType-><init>(JJLjava/lang/String;)V
                invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
                move-result-object v0
                return-object v0
            """,
        )
    }
}
