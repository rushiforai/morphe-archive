package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SO_ARM64_PATH = "lib/arm64-v8a/libunnamed_raw.so"

/**
 * Five globally-unique (`count == 1`) 96-byte function prologues for the
 * self-integrity verification routines in `lib/arm64-v8a/libunnamed_raw.so`
 * (Mereframe 0.8.4 / vc 118). All 117 native integrity call sites across the
 * 17 `app.unnamed.rawrecording.b.B*` bridge classes funnel through these five
 * checks (`0x23f3d8`, `0x2a5ecc`, `0x2bf304`, `0x2e5fb0`, `0x2e1b54`).
 */
private val INTEGRITY_ARM64_GATES = listOf(
    arm64Gate(
        "isIntegrityOk@0x23f3d8",
        "3f 23 03 d5 ff 03 03 d1 fd 7b 06 a9 fc 6f 07 a9 fa 67 08 a9 f8 5f 09 a9 " +
            "f6 57 0a a9 f4 4f 0b a9 fd 83 01 91 48 d0 3b d5 a9 83 00 d1 4a e4 97 52 " +
            "e8 03 00 f9 ea c9 aa 72 79 af 98 52 08 15 40 f9 15 6c 9e 52 db d3 94 52 " +
            "7c 9d 81 52 f8 dd 87 52 5a ad 84 52 a8 83 1f f8 a8 63 00 d1 f3 03 00 aa",
    ),
    arm64Gate(
        "checkApkAssets@0x2a5ecc",
        "3f 23 03 d5 ff 43 03 d1 fd 7b 07 a9 fc 6f 08 a9 fa 67 09 a9 f8 5f 0a a9 " +
            "f6 57 0b a9 f4 4f 0c a9 fd c3 01 91 48 d0 3b d5 a9 83 00 d1 f3 03 00 aa " +
            "e8 07 00 f9 08 15 40 f9 a8 83 1f f8 a8 63 00 d1 a8 27 3e a9 25 08 00 94 " +
            "e0 17 00 b9 1a 72 89 52 f6 65 9e 52 a8 83 5e b8 a9 03 5e b8 3c f8 9b 52",
    ),
    arm64Gate(
        "checkMapsDbg@0x2bf304",
        "3f 23 03 d5 ff 43 04 d1 fd 7b 0b a9 fc 6f 0c a9 fa 67 0d a9 f8 5f 0e a9 " +
            "f6 57 0f a9 f4 4f 10 a9 fd c3 02 91 48 d0 3b d5 a9 e3 00 d1 ca e7 8a 52 " +
            "e8 03 00 f9 ea 53 ad 72 d5 b4 8e 52 08 15 40 f9 3b 77 97 52 03 16 84 52 " +
            "64 74 9d 52 96 09 9b 52 b7 8f 93 52 a8 03 1f f8 a8 c3 00 d1 5c fa 98 52",
    ),
    arm64Gate(
        "checkSoMaps@0x2e5fb0",
        "3f 23 03 d5 ff 43 03 d1 fd 7b 07 a9 fc 6f 08 a9 fa 67 09 a9 f8 5f 0a a9 " +
            "f6 57 0b a9 f4 4f 0c a9 fd c3 01 91 48 d0 3b d5 a9 83 00 d1 aa 4b 82 52 " +
            "e8 07 00 f9 ca 0f a3 72 d9 43 88 52 08 15 40 f9 9b 62 8e 52 9a f5 84 52 " +
            "38 41 87 52 55 c9 8b 52 56 ea 88 52 a8 83 1f f8 a8 63 00 d1 f3 03 00 aa",
    ),
    arm64Gate(
        "checkEnvSig@0x2e1b54",
        "3f 23 03 d5 ff 43 05 d1 fd 7b 0f a9 fc 6f 10 a9 fa 67 11 a9 f8 5f 12 a9 " +
            "f6 57 13 a9 f4 4f 14 a9 fd c3 03 91 48 d0 3b d5 a9 63 01 d1 10 23 00 94 " +
            "e8 03 00 f9 08 15 40 f9 a8 03 1f f8 a8 43 01 d1 a8 a7 3a a9 ac 7f f5 97 " +
            "f2 eb ff 97 e0 1f 00 b9 bc 7c 84 52 9a 8c 90 52 a8 03 5b b8 a9 83 5a b8",
    ),
)

private val bypassNativeSoIntegrityPatch = rawResourcePatch {
    execute {
        val soFile = runCatching { get(SO_ARM64_PATH, true) }.getOrNull()
        if (soFile == null || !soFile.exists() || !soFile.isFile) {
            logUniversal("Bypass native integrity: $SO_ARM64_PATH absent — relying on DEX wrapper guards only.")
            return@execute
        }

        val patched = patchArm64Gates(soFile, INTEGRITY_ARM64_GATES, "Bypass native integrity")
        logUniversal("Bypass native integrity: patched $patched ARM64 integrity gates in $SO_ARM64_PATH (BTI/PAC-safe).")
    }
}

/**
 * The app's native pipeline (`libunnamed_raw.so`) self-verifies the APK,
 * `assets/unnamed.protection`, `/proc/self/maps`, loaded shared objects, and
 * `prctl` state, JNI-throwing `SecurityException("app integrity check failed")`
 * across `B1e6ad...` and sibling native bridge classes as soon as preview frames
 * flow or capture initializes. Field-captured stack (diagnostic build):
 *
 *   B1e6ad8077f6880e309d8da4b.nd2cccb916f63efbcf8b5b19b (Native)
 *     <- B1e6...d(ZZZZFZ)[J <- Jm.m <- Jm.l <- Ul.G <- em.j <- v5.A/z
 *
 * HISTORY (issue #5)
 *
 * 1. The first fix put a try/catch in inline smali. Morphe's inline-smali
 *    compiler compiles snippets into a dummy method and splices back only the
 *    instruction list — the `.catch` lives in the code item's exception table,
 *    so it was silently dropped and the SecurityException escaped.
 * 2. The second fix moved the call inside a REAL JVM try/catch in the
 *    extension (MereframeIntegrityHook.openSessionWithFallback). That works —
 *    but only for `d()`, the session-OPENING wrapper. The native check is not
 *    limited to d(): the bridge class exposes ~49 public wrappers and roughly
 *    20 of them validate native output and can throw the same way per call.
 *    As soon as real frames flow, the next wrapper throws and kills the app.
 *
 * WHAT THIS PATCH DOES NOW — three layers
 *
 * Stage 0 (native): the five ARM64 integrity entry points in
 * `lib/arm64-v8a/libunnamed_raw.so` are patched to `bti jc; mov w0, #1; ret`,
 * so every native bridge call executes genuine hardware/ISP logic without
 * integrity throws or per-frame reflection overhead. On builds where the
 * shipped `.so` is not the pinned 0.8.4/vc 118 one, this stage is skipped and
 * the DEX guards below remain the safety net.
 *
 * Stage 1 (pinned): `d(ZZZZFZ)[J` keeps its shape-aware path. The body is
 * replaced with a single invoke-static into
 * MereframeIntegrityHook.openSessionWithFallback, which calls the native
 * method reflectively, validates the verdict's domain (length 2, element 1 in
 * (0,4)) and degrades to {0L, 1L} on ANY throw or mismatch.
 *
 * Stage 2 (sweep): every OTHER public wrapper on the SAME bridge class — the
 * exact class Stage 1's fingerprint resolves — whose body invokes one of that
 * class's native methods gets a REAL try/catch installed in its own code item:
 *
 *     try { <the original body, untouched> } catch (Throwable t) {
 *         return MereframeIntegrityHook.failOpen<Kind>(t);
 *     }
 *
 * The handler is appended as new instructions and registered with
 * MutableMethodImplementation.addCatch(), i.e. it lands in the code item's
 * exception table (unlike an inline `.catch`, which is dropped). The hook then
 * decides: an integrity failure (SecurityException / "integrity" message) is
 * logged once and answered with a well-formed fail-open value of the wrapper's
 * own return type; ANY other Throwable is re-thrown verbatim, so unrelated
 * bugs keep behaving exactly as before.
 *
 * WHY THE WRAPPER LIST IS RESOLVED AT PATCH TIME
 *
 * The wrappers are R8 output: their names are build-shape specific and their
 * parameter descriptors differ per method, so a Java helper cannot accept them
 * positionally without one overload per signature. The sweep therefore
 * discovers them from the APK being patched (public, non-native, no existing
 * try blocks, body invokes a native method declared by the bridge class) and
 * emits the resolved inventory — method name, parameter descriptor and return
 * enumeration for the build being patched.
 *
 * STAGE 2 USES THE CLASS STAGE 1 ALREADY FOUND
 *
 * An earlier revision re-searched the whole app package for "bridge classes"
 * and joined a wrapper's native call against a set of descriptor strings. Both
 * sides of that join called `parameterTypes.joinToString("")`, but a DEX-backed
 * Method and an invoke-side MethodReference do not stringify parameterTypes the
 * same way, so the keys never matched: the sweep reported
 * "0 wrapper(s) guarded across 0 bridge class(es)" while the on-device crash
 * kept naming unguarded wrappers (q(IJID)D). Stage 2 therefore:
 *
 * - takes the class directly with mutableClassDefBy(BRIDGE_CLASS) — the same
 *   type Stage 1's fingerprint matched, so it cannot "match nothing" while
 *   Stage 1 succeeds, and it marks the class mutable so the handlers are
 *   written out;
 * - identifies the class's native methods by name + parameter count + return
 *   type, never by a descriptor string;
 * - logs the class it operated on, the native count, the guarded count and every
 *   skipped wrapper with its reason, so a zero count is always explainable.
 *
 * FINGERPRINT DRIFT
 *
 * Stage 1 is pinned to the 0.8.4 (vc 118) shape; on drift it aborts that one
 * injection, logs PINNED SESSION WRAPPER NOT FOUND and lets the sweep cover the
 * session wrapper generically, so the build degrades to the native verdict
 * instead of failing hard. Stage 2 is drift-tolerant per method: each wrapper is
 * a separate best-effort injection wrapped in runCatching — a wrapper that
 * cannot be guarded (unsupported return type, too few registers, pre-existing
 * try/catch) is logged and left running the native verdict, never half-patched
 * and never a hard failure.
 *
 * REGISTER-FORM REQUIREMENT: the ZZZZFZ call has six parameters. `invoke-static`
 * without `/range` is limited to five registers (instruct35c) — the regular
 * form makes InlineSmaliCompiler's dummy method unbuildable, surfacing on-device
 * as PatchException "Collection is empty" at addInstructions (observed
 * 2026-11-07). Stage 1 therefore uses `invoke-static/range {p0 .. p5}`. Every
 * injection made by stage 2 passes exactly ONE source register (the caught
 * Throwable), so the rule is trivially satisfied there.
 */
@Suppress("unused")
val bypassNativeIntegrityPatch = bytecodePatch(
    name = "Bypass native integrity checks",
    description = "Neutralizes libunnamed_raw.so's five ARM64 self-integrity gates (BTI/PAC-safe) " +
        "and wraps the session-opening plus every other native-calling bridge wrapper in a real " +
        "JVM try/catch that fails open on integrity errors. Required together with " +
        "'Allow re-signed/sideloaded installs'.",
    default = true,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)
    dependsOn(bypassNativeSoIntegrityPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // ── Stage 1: pinned session-opening wrapper ───────────────────────
        // Pinned to the 0.8.4 (vc 118) shape. On drift the injection is
        // aborted (never half-patched) and logged loudly; the sweep below then
        // covers the session wrapper generically, so the build degrades to the
        // native verdict instead of failing hard.
        val sessionWrapper = Fingerprint(
            definingClass = BRIDGE_CLASS,
            name = PINNED_METHOD_NAME,
            returnType = PINNED_RETURN_TYPE,
            parameters = PINNED_PARAMETERS,
        ).methodOrNull
        if (sessionWrapper == null) {
            logUniversal(
                "Bypass native integrity: PINNED SESSION WRAPPER NOT FOUND — " +
                    "${BRIDGE_CLASS}->$PINNED_METHOD_NAME(ZZZZFZ)[J does not match this build " +
                    "(app version drifted from 0.8.4 / vc 118). Falling back to the generic sweep; " +
                    "send versionName and versionCode so the fingerprint can be re-pinned.",
            )
        } else {
            sessionWrapper.apply {
                // Grow to 7 registers so v0 is a true local, not p0. Reusing a
                // parameter register for a different type is a VerifyError.
                ensureRegisters(7)
                clearBody()
                addInstructions(
                    0,
                    """
                        invoke-static/range {p0 .. p5}, $HOOK_CLASS->openSessionWithFallback(ZZZZFZ)[J
                        move-result-object v0
                        return-object v0
                    """.trimIndent(),
                )
            }

            logUniversal(
                "Bypass native integrity: session wrapper routed through MereframeIntegrityHook " +
                    "(JVM try/catch) in ${BRIDGE_CLASS}->$PINNED_METHOD_NAME(ZZZZFZ)[J — " +
                    "if the crash reappears at this exact frame, this patch is not present in the " +
                    "crashing build.",
            )
        }

        // ── Stage 2: sweep the bridge class Stage 1 resolved ──────────────
        // The same class Stage 1's fingerprint matched — no second search that
        // can silently match nothing. mutableClassDefBy also upgrades the class
        // to mutable, so the injected handlers are written out.
        val bridgeClass = runCatching { mutableClassDefBy(BRIDGE_CLASS) }.getOrNull()
        if (bridgeClass == null) {
            logUniversal(
                "Bypass native integrity: bridge class $BRIDGE_CLASS not found — wrapper sweep skipped " +
                    "(stage 1 still applied). Send the app version + patching log.",
            )
        } else {
            // Native methods declared by the bridge class itself. The key is
            // name + parameter count + return type: a DEX-backed Method and an
            // invoke-side MethodReference stringify parameterTypes differently,
            // so a descriptor-string key never matched (that was the no-op bug).
            val natives = HashSet<String>()
            bridgeClass.methods.forEach { method ->
                if (AccessFlags.NATIVE.isSet(method.accessFlags)) {
                    natives += "${method.name}#${method.parameterTypes.size}#${method.returnType}"
                }
            }

            if (natives.isEmpty()) {
                logUniversal(
                    "Bypass native integrity: $BRIDGE_CLASS declares no native methods — wrapper sweep skipped.",
                )
            } else {
                val guarded = ArrayList<String>()
                val skipped = ArrayList<String>()

                bridgeClass.methods.toList().forEach { method ->
                    val descriptor = method.descriptor()
                    val reason = method.guardSkipReason(natives, BRIDGE_CLASS)
                    if (reason != null) {
                        skipped += "$descriptor ($reason)"
                    } else {
                        runCatching { plantIntegrityHandler(method, method.returnType) }
                            .onSuccess { guarded += descriptor }
                            .onFailure { skipped += "$descriptor (${it.message})" }
                    }
                }

                logUniversal(
                    "Bypass native integrity: bridge $BRIDGE_CLASS declares ${natives.size} native " +
                        "method(s) — ${guarded.size} wrapper(s) guarded, ${skipped.size} left on the " +
                        "native verdict.",
                )
                if (guarded.isNotEmpty()) {
                    logUniversal(
                        "Bypass native integrity: guarded in $BRIDGE_CLASS: ${guarded.joinToString(", ")}",
                    )
                }
                if (skipped.isNotEmpty()) {
                    logUniversal(
                        "Bypass native integrity: left in $BRIDGE_CLASS: ${skipped.joinToString(", ")}",
                    )
                }
            }
        }

        logUniversal("Bypass native integrity: native ARM64 gates + DEX wrapper guards active.")
    }
}

// ─────────────────────────────────────────────────────────────────────────
// Fingerprint pins (Mereframe 0.8.4 / vc 118)
// ─────────────────────────────────────────────────────────────────────────

private const val BRIDGE_CLASS = "Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;"

private const val PINNED_METHOD_NAME = "d"
private const val PINNED_RETURN_TYPE = "[J"
private val PINNED_PARAMETERS = listOf("Z", "Z", "Z", "Z", "F", "Z")

private const val HOOK_CLASS = "Lapp/template/extension/extension/MereframeIntegrityHook;"
private const val THROWABLE = "Ljava/lang/Throwable;"

// ─────────────────────────────────────────────────────────────────────────
// Discovery helpers
// ─────────────────────────────────────────────────────────────────────────

/** `name(ParameterDescriptors)ReturnType`, e.g. `d(ZZZZFZ)[J`. */
private fun Method.descriptor(): String =
    "$name(${parameters.joinToString("") { it.type }})$returnType"

/** Identity of a native method: name + parameter count + return type. */
private fun MethodReference.nativeKey(): String = "$name#${parameterTypes.size}#$returnType"

/**
 * @return `null` when the method must be guarded, otherwise the reason it is
 * left running the native verdict. Every reason is logged verbatim, so a zero
 * guarded count is always explainable from the patching log.
 */
private fun Method.guardSkipReason(natives: Set<String>, bridgeClass: String): String? {
    if (name.startsWith("<")) return "constructor/initializer"
    if (AccessFlags.NATIVE.isSet(accessFlags)) return "native method"
    if (AccessFlags.ABSTRACT.isSet(accessFlags)) return "abstract"
    if (!AccessFlags.PUBLIC.isSet(accessFlags)) return "not public"

    val implementation = implementation ?: return "no code"
    if (!implementation.tryBlocks.isNullOrEmpty()) return "already has a try/catch"
    if (implementation.instructions.any { it.opcode.name.endsWith("payload", ignoreCase = true) }) {
        return "switch/array payload in body"
    }

    if (definingClass == bridgeClass &&
        name == PINNED_METHOD_NAME &&
        returnType == PINNED_RETURN_TYPE &&
        parameterTypes.size == PINNED_PARAMETERS.size
    ) {
        return "already guarded by stage 1"
    }
    if (!invokesBridgeNative(natives, bridgeClass)) return "body does not call a bridge native"
    return null
}

/** True when the body directly invokes a native method declared by [bridgeClass]. */
private fun Method.invokesBridgeNative(natives: Set<String>, bridgeClass: String): Boolean {
    val implementation = implementation ?: return false
    return implementation.instructions.any { instruction ->
        if (!instruction.opcode.name.startsWith("invoke", ignoreCase = true)) return@any false
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@any false
        reference.definingClass == bridgeClass && natives.contains(reference.nativeKey())
    }
}

// ─────────────────────────────────────────────────────────────────────────
// Handler injection
// ─────────────────────────────────────────────────────────────────────────

/**
 * Append an exception handler to [method] and register a catch-all try block
 * covering the method's original body.
 *
 * The handler uses a single scratch register (`v0`, plus `v1` for wide
 * returns), so it needs no register-count growth and passes exactly one source
 * register to the hook — well under the five-register limit of the regular
 * `invoke-static` form.
 */
private fun plantIntegrityHandler(method: MutableMethod, returnType: String) {
    val implementation: MutableMethodImplementation = method.implementation
        ?: throw IllegalStateException("no implementation")

    // Array-returning wrappers validate the native result by length (for
    // example `p` requires exactly 3 elements). A fixed two-element fallback
    // bypasses that check but hands the CALLER a shorter array, and callers
    // that read a higher index then fail in a completely different place —
    // "the RAW is safe, but it didn't develop" is exactly that failure mode.
    // Derive the length from the wrapper's own comparison and hand back an
    // array of the expected size.
    val expectedLength = if (isArrayType(returnType)) expectedArrayLength(method) else null
    val handler = handlerSmali(returnType, expectedLength)
        ?: throw IllegalStateException("unsupported return type $returnType")

    val registersNeeded = when {
        expectedLength != null -> 2
        returnType == "J" || returnType == "D" -> 2
        else -> 1
    }
    if (implementation.registerCount < registersNeeded) {
        method.ensureRegisters(registersNeeded)
    }

    // Append the handler first, THEN build the labels. A label created for
    // `instructions.size` before the insertion stays pinned to the end of the
    // code item, which quietly moved the try range over the handler itself:
    // a non-integrity Throwable re-thrown by `guard()` was then caught by the
    // same handler again, looping forever on the caller's thread. The try
    // range must cover the ORIGINAL body only.
    val endIndex = implementation.instructions.size
    method.addInstructions(endIndex, handler)

    val from = implementation.newLabelForIndex(0)
    val handlerStart = implementation.newLabelForIndex(endIndex)

    implementation.addCatch(from, handlerStart, handlerStart)
}

private fun handlerSmali(returnType: String, expectedLength: Int?): String? = when (returnType) {
    "V" -> """
        move-exception v0
        invoke-static {v0}, $HOOK_CLASS->failOpenVoid($THROWABLE)V
        return-void
    """.trimIndent()

    "Z" -> scalarHandler("failOpenBoolean", "Z")
    "B" -> scalarHandler("failOpenByte", "B")
    "S" -> scalarHandler("failOpenShort", "S")
    "C" -> scalarHandler("failOpenChar", "C")
    "I" -> scalarHandler("failOpenInt", "I")
    "F" -> scalarHandler("failOpenFloat", "F")
    "J" -> wideHandler("failOpenLong", "J")
    "D" -> wideHandler("failOpenDouble", "D")
    "Ljava/lang/String;" -> objectHandler("failOpenString", "Ljava/lang/String;")
    "[Z" -> arrayHandler("failOpenBooleanArray", "failOpenBooleanArrayN", "[Z", expectedLength)
    "[B" -> arrayHandler("failOpenByteArray", "failOpenByteArrayN", "[B", expectedLength)
    "[S" -> arrayHandler("failOpenShortArray", "failOpenShortArrayN", "[S", expectedLength)
    "[C" -> arrayHandler("failOpenCharArray", "failOpenCharArrayN", "[C", expectedLength)
    "[I" -> arrayHandler("failOpenIntArray", "failOpenIntArrayN", "[I", expectedLength)
    "[J" -> arrayHandler("failOpenLongArray", "failOpenLongArrayN", "[J", expectedLength)
    "[F" -> arrayHandler("failOpenFloatArray", "failOpenFloatArrayN", "[F", expectedLength)
    "[D" -> arrayHandler("failOpenDoubleArray", "failOpenDoubleArrayN", "[D", expectedLength)

    // Unknown reference/array-of-reference shape: there is no way to invent a
    // well-formed instance of it, so hand back null instead of crashing.
    else -> if (returnType.startsWith("L") || returnType.startsWith("[")) {
        """
            move-exception v0
            invoke-static {v0}, $HOOK_CLASS->failOpenNull($THROWABLE)V
            const/4 v0, 0x0
            return-object v0
        """.trimIndent()
    } else {
        null
    }
}

private fun scalarHandler(hookName: String, returnType: String) = """
    move-exception v0
    invoke-static {v0}, $HOOK_CLASS->$hookName($THROWABLE)$returnType
    move-result v0
    return v0
""".trimIndent()

private fun wideHandler(hookName: String, returnType: String) = """
    move-exception v0
    invoke-static {v0}, $HOOK_CLASS->$hookName($THROWABLE)$returnType
    move-result-wide v0
    return-wide v0
""".trimIndent()

private fun objectHandler(hookName: String, returnType: String) = """
    move-exception v0
    invoke-static {v0}, $HOOK_CLASS->$hookName($THROWABLE)$returnType
    move-result-object v0
    return-object v0
""".trimIndent()

/** True for JVM array descriptors such as `[J`, `[Ljava/lang/String;`. */
private fun isArrayType(descriptor: String): Boolean = descriptor.startsWith("[")

/**
 * Length the wrapper itself demands from a native array result.
 *
 * The R8 shape is always one of
 *
 *     array-length vA, vB
 *     const/4       vC, 0x3
 *     if-ne         vA, vC, :mismatch
 *
 * so scan for an `array-length`, then a small integer constant load and an
 * `if-eq`/`if-ne` that compares the length register against it. Returns `null`
 * when no unambiguous length check exists, in which case the fixed-size
 * fallback is kept.
 */
private fun expectedArrayLength(method: MutableMethod): Int? {
    val instructions = method.implementation?.instructions?.toList() ?: return null
    for (index in instructions.indices) {
        if (instructions[index].opcode != Opcode.ARRAY_LENGTH) continue
        val lengthRegister = (instructions[index] as? OneRegisterInstruction)?.registerA
            ?: continue
        for (offset in 1..4) {
            val candidate = instructions.getOrNull(index + offset) ?: break
            val opcode = candidate.opcode
            val literal = when (opcode) {
                Opcode.CONST_4 ->
                    (candidate as? NarrowLiteralInstruction)?.narrowLiteral?.let { it shl 28 shr 28 }
                Opcode.CONST_16, Opcode.CONST ->
                    (candidate as? NarrowLiteralInstruction)?.narrowLiteral
                Opcode.IF_EQ, Opcode.IF_NE -> {
                    val pair = candidate as? TwoRegisterInstruction ?: continue
                    if (lengthRegister != pair.registerA && lengthRegister != pair.registerB) continue
                    // The constant load is right before the comparison.
                    val previous = instructions.getOrNull(index + offset - 1)
                    when (previous?.opcode) {
                        Opcode.CONST_4 ->
                            (previous as? NarrowLiteralInstruction)?.narrowLiteral?.let { it shl 28 shr 28 }
                        Opcode.CONST_16, Opcode.CONST ->
                            (previous as? NarrowLiteralInstruction)?.narrowLiteral
                        else -> null
                    }
                }
                else -> null
            }
            if (literal != null && literal in 1..64) return literal
        }
    }
    return null
}

/**
 * Array fallback that preserves the wrapper's length contract: the caller gets
 * an array of exactly the size it checks for, with element 1 (the status code
 * every Mereframe wrapper reads) set to the "1" pass value.
 */
private fun arrayHandler(
    fixedHook: String,
    sizedHook: String,
    returnType: String,
    expectedLength: Int?,
): String {
    if (expectedLength == null) return objectHandler(fixedHook, returnType)
    return """
        move-exception v0
        const/16 v1, 0x${expectedLength.toString(16)}
        invoke-static {v0, v1}, $HOOK_CLASS->$sizedHook($THROWABLE${"I"})$returnType
        move-result-object v0
        return-object v0
    """.trimIndent()
}
