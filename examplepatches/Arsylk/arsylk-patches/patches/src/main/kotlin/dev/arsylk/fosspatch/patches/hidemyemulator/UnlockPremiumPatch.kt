package dev.arsylk.fosspatch.patches.hidemyemulator

import dev.arsylk.fosspatch.patches.shared.Constants.COMPATIBILITY_HIDEMYEMULATOR
import dev.arsylk.fosspatch.patches.hidemyemulator.LicenseFailureEmissionFingerprint15
import dev.arsylk.fosspatch.patches.hidemyemulator.LicenseStateInitFingerprint15
import dev.arsylk.fosspatch.patches.hidemyemulator.ModuleActiveStateFingerprint15
import dev.arsylk.fosspatch.patches.hidemyemulator.TokenRefreshFailureFingerprint15
import dev.arsylk.fosspatch.patches.hidemyemulator.UserStoreStateFingerprint15
import dev.arsylk.fosspatch.patches.hidemyemulator.TokenStoreSignInStateFingerprint15
import dev.arsylk.fosspatch.patches.shared.Constants.COMPATIBILITY_HIDEMYEMULATOR_15
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Restores the premium feature set of Hide My Emulator (all device masking) without the paid
 * `com.wowsoftware.hmelicense` licence, and works fully offline. The app shows as licensed and the
 * protections apply.
 *
 * Two coordinated bytecode changes:
 *
 *  1. The app-wide licence state reducer ([LicenseStateReducerFingerprint]) is forced to return the
 *     app's own "licensed" model. The licence repository pushes that model into the StateFlow the UI
 *     and the protection toggles observe, so the UI reads as activated and the protections unlock.
 *     The model and its constructor are read from the matched method (so no obfuscated name is
 *     hard-coded); it is constructed with null arguments, which the app treats as a licence with no
 *     expiry (the exact "lifetime" model it already produces internally).
 *
 *  2. The mask builder's expiry gate ([LicenseGateFingerprint]) has its `if-lez` removed, so the
 *     masks apply in hooked processes regardless of the cached expiry (which is never written
 *     offline). Operand- and register-agnostic.
 *
 * Only the DEX is modified.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all device masking offline, without the paid licence app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HIDEMYEMULATOR)

    execute {
        // 1. Force the licence state reducer to return a licensed model (app-wide activated state).
        val reducer = LicenseStateReducerFingerprint.method
        val instructions = reducer.implementation!!.instructions.toList()

        // The licensed model is the (only) class instantiated here; the unlicensed one is a singleton.
        val newInstanceIndex = instructions.indexOfFirst { it.opcode == Opcode.NEW_INSTANCE }
        val modelType = (instructions[newInstanceIndex] as ReferenceInstruction).reference.toString()
        val constructor = instructions.drop(newInstanceIndex)
            .first { it.opcode == Opcode.INVOKE_DIRECT }
            .let { (it as ReferenceInstruction).reference as MethodReference }
        val constructorRef =
            "${constructor.definingClass}->${constructor.name}(" +
                constructor.parameterTypes.joinToString("") + ")V"
        // this + one null per constructor parameter (all are object references).
        val argRegisters = (listOf("v1") + List(constructor.parameterTypes.size) { "v0" }).joinToString(", ")

        reducer.addInstructions(
            0,
            """
                const/4 v0, 0x0
                new-instance v1, $modelType
                invoke-direct {$argRegisters}, $constructorRef
                return-object v1
            """,
        )

        // 2. Drop the mask builder's expiry `if-lez`, so the masks always run in hooked processes.
        val gate = LicenseGateFingerprint
        gate.method.removeInstruction(gate.instructionMatches.last().index)
    }
}

/**
 * 1.5 (versionCode 6) — licensing moved from the local `com.wowsoftware.hmelicense` handshake to a
 * backend token flow. The hook entry (`Lab/s;`) builds `HookLicenseInputs` (`Lvb/b;`) from the
 * cached `license_token` / `device_id` / time anchor / `cap_slot` prefs and skips masking entirely
 * when the token is empty; every premium hook then re-validates the token through
 * `DeviceInfoProvider.evalBlobNative(...)` inside `libnative_entry.so`.
 *
 * Nine coordinated DEX changes:
 *
 *  1. The licence-state reducer ([LicenseStateReducerFingerprint15], `Ld9/a;->H`) is forced to
 *     return the app's own `Premium` model (`Lob/r;`, a 1.5 pin). The model is constructed with
 *     null arguments, which the app treats as a licence with no expiry.
 *  2. The `HookLicenseInputs` constructor is forced to store a non-empty token, so the hook
 *     entry's `token.length() > 0` gate and every per-hook length gate pass with no licence app
 *     and no backend.
 *  3. Every DEX `evalBlobNative(...)` gate is forced to `true` (the `move-result` of each call is
 *     rewritten to a constant), so the premium hooks (CPU ABI, sensors, battery, input devices,
 *     telephony, camera, traces, root, Xposed) register and run in hooked processes.
 *  4. The runtime watchdog installer is neutered (`return-void`), so the native `/proc/self/maps`
 *     anti-hook scan cannot trip on a patched build.
 *  5. The `TokenStore` constructor seeds the signed-in StateFlow with `true`, skipping the
 *     account sign-in screen.
 *  6. `ModuleStatus.isModuleActive()` (a hardcoded `false` stub in 1.5) reports `true`, so the
 *     licence combiner maps Premium to EDITABLE instead of HIDDEN and the permanent
 *     "Module Inactive" banner disappears.
 *  7. The OkHttp authenticator's refresh-failure push of `false` into the signed-in StateFlow is
 *     rewritten to `true`, so the forced sign-in survives the backend 401s.
 *  8. The `UserStore` always materialises a user (the stored-id guard is NOPed) with non-blank
 *     name/email constants, which the auth-gated screens require.
 *  9. The licence StateFlow is seeded with `Premium` in the repository constructor and the
 *     load-failure emission of `Unlicensed` is rewritten to `Premium`, so the protection
 *     categories are reachable with no backend licence.
 *
 * The device-identity tier (the `Build.*` spoof and the identity property map) is decrypted by
 * `deriveCapBlobNative`, which validates the backend-issued token inside `libnative_entry.so`.
 * That last gate is removed by the companion native patch ([unlockPremiumNativePatch15]) — the
 * blob's decryption key lives inside the library and the token is only ever a gate, so with the
 * gate rewritten the identity profile decrypts offline too. Apply both patches for the full
 * unlock.
 *
 * Only the DEX is modified.
 */
@Suppress("unused")
val unlockPremiumPatch15 = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks all device masking offline, without the paid licence app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HIDEMYEMULATOR_15)

    execute {
        applyHme15Unlock()
    }
}

private fun BytecodePatchContext.applyHme15Unlock() {
    // 1. Force the licence-state reducer to return a Premium model (app-wide activated state).
    //
    //    The licensed model is the (only) class instantiated here; the unlicensed one is a
    //    singleton. Both the model class and its constructor are 1.5 pins: the reducer now parses
    //    the claims JSON itself, so the 1.3 "first new-instance in the method" derivation would
    //    pick up the `JSONObject` instead of the model.
    LicenseStateReducerFingerprint15.method.addInstructions(
        0,
        """
            const/4 v0, 0x0
            new-instance v1, Lob/r;
            invoke-direct {v1, v0, v0}, Lob/r;-><init>(Ljava/lang/Long;Ljava/lang/String;)V
            return-object v1
        """,
    )

    // 2. Force the hook licence inputs' token non-empty.
    //
    //    The hook entry reads the cached `license_token` from prefs and skips masking when it is
    //    empty; every premium hook repeats the same `token.length() > 0` check. Overwriting the
    //    first constructor parameter (the token) with a constant makes all of those gates pass.
    //    The value itself is never validated on the Java side — the native `evalBlobNative` /
    //    `deriveCapBlobNative` checks are handled in step 3 (and stay unreachable for the
    //    identity tier, see the patch kdoc).
    HookLicenseInputsFingerprint15.method.addInstructions(
        0,
        """const-string p1, "morphe"""",
    )

    // 3. Force every DEX `evalBlobNative(...)` gate to true.
    //
    //    Each premium hook wraps its registration in
    //    `invoke evalBlobNative; move-result vX; if-eqz vX, :skip`. Override the boolean result
    //    of every such call with a constant `true`, so the registrars place their hooks.
    fun isEvalBlob(instruction: Instruction): Boolean {
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return false
        return reference.definingClass ==
            "Lnet/wowsoftware/hidemyemulator/jni/DeviceInfoProvider;" &&
            reference.name == "evalBlobNative"
    }
    classDefForEach { classDef ->
        classDef.methods.forEach forEachMethod@{ method ->
            val original = method.implementation ?: return@forEachMethod
            val list = original.instructions.toList()
            val moveResultIndices = list.indices.filter { i ->
                i > 0 && isEvalBlob(list[i - 1]) && list[i].opcode == Opcode.MOVE_RESULT
            }
            if (moveResultIndices.isEmpty()) return@forEachMethod

            val mutableMethod = mutableClassDefBy(classDef).methods.first {
                it.name == method.name &&
                    it.returnType == method.returnType &&
                    it.parameterTypes.toList() == method.parameterTypes.toList()
            }
            moveResultIndices.sortedDescending().forEach { index ->
                val register = mutableMethod.getInstruction<OneRegisterInstruction>(index).registerA
                val constInsn = if (register < 16) "const/4 v$register, 0x1"
                                else "const/16 v$register, 0x1"
                mutableMethod.replaceInstruction(index, constInsn)
            }
        }
    }

    // 4. Neutralise the runtime watchdog, so the native anti-hook scan cannot kill a patched
    //    build at startup.
    WatchdogInstallerFingerprint15.method.addInstructions(0, "return-void")

    // 5. Skip the account sign-in.
    //
    //    The TokenStore constructor seeds the signed-in StateFlow with `token != null` from the
    //    encrypted prefs; the root UI state carries that boolean and shows the sign-in screen
    //    while it is false. Force the seed to `true`, so the app starts signed in with no
    //    account and no backend. The licence UI state is already forced Premium by step 1, and
    //    the hook path never reads the auth token.
    val tokenStore = TokenStoreSignInStateFingerprint15.method
    val tokenStoreInstructions = tokenStore.implementation!!.instructions.toList()
    val flowInitIndex = tokenStoreInstructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Ldb/t0;" && reference.name == "c"
    }
    check(flowInitIndex >= 0) { "TokenStore flow init not found" }
    val valueOfIndex = tokenStoreInstructions.take(flowInitIndex)
        .indexOfLast { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfLast false
            reference.definingClass == "Ljava/lang/Boolean;" && reference.name == "valueOf"
        }
    check(valueOfIndex >= 0) { "TokenStore Boolean.valueOf not found" }
    val signInRegister = tokenStore.getInstruction<FiveRegisterInstruction>(valueOfIndex).registerC
    tokenStore.addInstructions(valueOfIndex, "const/4 v$signInRegister, 0x1")

    // 6. Report the module as active.
    //
    //    `ModuleStatus.isModuleActive()` is a hardcoded `false` in 1.5, and the root UI state
    //    carries its result: with it false the licence combiner maps even Premium to HIDDEN and
    //    the app shows a permanent "Module Inactive" banner. Force it to `true` so the unlocked
    //    premium state is fully editable. (This is the app's own UI state only — actually hooking
    //    target processes still needs the module enabled in the Xposed framework.)
    ModuleActiveStateFingerprint15.method.replaceInstruction(0, "const/4 v0, 0x1")

    // 7. Keep the session when a token refresh fails.
    //
    //    With the module reporting active the app talks to its backend; every call 401s without
    //    a real account, and the OkHttp authenticator's failure path clears the token prefs and
    //    pushes `false` into the signed-in StateFlow, bouncing the UI back to the sign-in
    //    screen. Rewrite that push to `true` so the forced sign-in from step 5 survives.
    val authenticator = TokenRefreshFailureFingerprint15.method
    val authInstructions = authenticator.implementation!!.instructions.toList()
    val signOutIndex = authInstructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.SGET_OBJECT &&
            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                it.definingClass == "Ljava/lang/Boolean;" && it.name == "FALSE"
            } == true
    }
    check(signOutIndex >= 0) { "Token refresh failure push not found" }
    val signOutRegister = authenticator.getInstruction<OneRegisterInstruction>(signOutIndex).registerA
    authenticator.replaceInstruction(
        signOutIndex,
        "sget-object v$signOutRegister, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;",
    )

    // 8. Always materialise a user.
    //
    //    The UserStore constructor only rebuilds the cached user when the stored id is non-zero,
    //    so with no account the user StateFlow stays null and the auth-gated screens keep asking
    //    for a sign-in even though the token flow is forced true. NOP the id guard so a (blank)
    //    user is always constructed and the flow is never null.
    val userStore = UserStoreStateFingerprint15.method
    val userStoreInstructions = userStore.implementation!!.instructions.toList()
    val userFlowIndex = userStoreInstructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Ldb/t0;" && reference.name == "c"
    }
    check(userFlowIndex >= 0) { "UserStore flow init not found" }
    val instructionOffsets = HashMap<Instruction, Int>()
    var runningOffset = 0
    for (instruction in userStoreInstructions) {
        instructionOffsets[instruction] = runningOffset
        runningOffset += instruction.codeUnits
    }
    val userFlowOffset = instructionOffsets.getValue(userStoreInstructions[userFlowIndex])
    val idGuardIndex = userStoreInstructions.indexOfFirst { instruction ->
        if (instruction.opcode != Opcode.IF_EQZ) return@indexOfFirst false
        val instructionOffset = instructionOffsets[instruction] ?: return@indexOfFirst false
        // OffsetInstruction.codeOffset is a displacement relative to the branch itself.
        instructionOffset + (instruction as OffsetInstruction).codeOffset == userFlowOffset
    }
    check(idGuardIndex >= 0) { "UserStore id guard not found" }
    userStore.replaceInstruction(idGuardIndex, "nop")

    // The auth-gated screens additionally require a non-blank name/email on the user, so
    // overwrite those two constructor arguments with constants. The remaining arguments
    // (locale, verification, timestamps) keep their (empty) prefs values.
    val userCtorIndex = userStoreInstructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Lac/b;" && reference.name == "<init>"
    }
    check(userCtorIndex >= 0) { "User constructor not found" }
    val userCtor = userStore.getInstruction<Instruction3rc>(userCtorIndex)
    // invoke-direct/range {vN .. vN+7}: this, id, name, email, locale, verified, created, updated.
    check(userCtor.registerCount == 8) { "Unexpected user constructor register count" }
    val nameRegister = userCtor.startRegister + 2
    val emailRegister = userCtor.startRegister + 3
    userStore.addInstructions(
        userCtorIndex,
        """
            const-string v$nameRegister, "Morphe"
            const-string v$emailRegister, "user@morphe"
        """,
    )

    // 9. Seed the licence StateFlow with Premium and keep it there.
    //
    //    The repository seeds the flow with `Unknown`, and the load-failure path pushes
    //    `Unlicensed`; every auth-gated screen derives its premium state from that flow, so
    //    with no backend licence the protection categories stay behind the sign-in screen.
    //    Rewrite both writes to the app's own `Premium` model (null args = no expiry, the
    //    same model the reducer patch in step 1 produces).
    fun BytecodePatchContext.emitPremiumInsteadOf(
        fingerprint: app.morphe.patcher.Fingerprint,
        singletonClass: String,
        valueRegister: String,
        nullRegister: String,
    ) {
        val method = fingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val index = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.SGET_OBJECT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.definingClass == singletonClass && it.name == "a"
                } == true
        }
        check(index >= 0) { "$singletonClass load not found" }
        method.replaceInstruction(index, "new-instance $valueRegister, Lob/r;")
        method.addInstructions(
            index + 1,
            """
                const/4 $nullRegister, 0x0
                invoke-direct {$valueRegister, $nullRegister, $nullRegister}, Lob/r;-><init>(Ljava/lang/Long;Ljava/lang/String;)V
            """,
        )
    }

    // 9a. Constructor seed: `Unknown` -> Premium. v0 is dead after the encrypted-prefs init.
    emitPremiumInsteadOf(LicenseStateInitFingerprint15, "Lob/s;", "p2", "v0")

    // 9b. Load-failure emission: `Unlicensed` -> Premium. v5 is dead on the failure path.
    emitPremiumInsteadOf(LicenseFailureEmissionFingerprint15, "Lob/t;", "v0", "v5")
}

/**
 * Per-ABI byte patches for the 1.5 `deriveCapBlobNative` licence gate inside
 * `libnative_entry.so`. The gate is two native calls followed by a conditional branch:
 *
 * ```
 * arm64-v8a:  bl 0x37c38        ; token check        @ 0x3d614
 *             bl 0x39a7c        ; second gate        @ 0x3d620
 *             tbz w0, 0, :fail                      @ 0x3d624
 * x86_64:     call 0x39810      ; token check        @ 0x3f8c6
 *             call 0x3b800      ; second gate        @ 0x3f8d8
 *             test al, al / je :fail                @ 0x3f8dd
 * ```
 *
 * The blob itself is decrypted with a key that lives inside the library (the token is only
 * ever a gate — the decryption ignores the token-derived buffer entirely), so removing the
 * gate is sufficient: the premium identity profile decrypts offline. Gate 1 is NOPed and
 * gate 2 is rewritten to report success, which makes the branch fall through deterministically
 * instead of depending on leftover register state.
 *
 * Offsets are 1.5 (versionCode 6) pins; the original bytes are verified before patching so a
 * future build with shifted offsets fails loudly instead of corrupting the library.
 */
private data class NativeGatePatch(
    val path: String,
    val gate1Offset: Int,
    val gate1Original: ByteArray,
    val gate1Patch: ByteArray,
    val gate2Offset: Int,
    val gate2Original: ByteArray,
    val gate2Patch: ByteArray,
) {
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is NativeGatePatch) return false
        return path == other.path
    }
    override fun hashCode(): Int = path.hashCode()
}

private val HME_15_NATIVE_GATES = listOf(
    NativeGatePatch(
        path = "lib/arm64-v8a/libnative_entry.so",
        gate1Offset = 0x3d614,
        gate1Original = byteArrayOf(0x89.toByte(), 0xe9.toByte(), 0xff.toByte(), 0x97.toByte()), // bl 0x37c38
        gate1Patch = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte()),                               // nop
        gate2Offset = 0x3d620,
        gate2Original = byteArrayOf(0x17, 0xf1.toByte(), 0xff.toByte(), 0x97.toByte()), // bl 0x39a7c
        gate2Patch = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52),                     // mov w0, #1
    ),
    NativeGatePatch(
        path = "lib/x86_64/libnative_entry.so",
        gate1Offset = 0x3f8c6,
        gate1Original = byteArrayOf(0xe8.toByte(), 0x45, 0x9f.toByte(), 0xff.toByte(), 0xff.toByte()), // call 0x39810
        gate1Patch = byteArrayOf(0x90.toByte(), 0x90.toByte(), 0x90.toByte(), 0x90.toByte(), 0x90.toByte()), // nop x5
        gate2Offset = 0x3f8d8,
        gate2Original = byteArrayOf(0xe8.toByte(), 0x23, 0xbf.toByte(), 0xff.toByte(), 0xff.toByte()), // call 0x3b800
        gate2Patch = byteArrayOf(0xb0.toByte(), 0x01, 0x90.toByte(), 0x90.toByte(), 0x90.toByte()),     // mov al, 1; nop x3
    ),
)

/**
 * 1.5 (versionCode 6) — native half of the unlock. The DEX patch ([unlockPremiumPatch15])
 * forces every Java-side licence gate; this patch removes the last one, the native gate in
 * `deriveCapBlobNative`, so the premium device-identity profile decrypts without the paid
 * licence. Only `libnative_entry.so` is modified; the DEX half is still required for the UI
 * state and the per-hook gates.
 */
@Suppress("unused")
val unlockPremiumNativePatch15 = rawResourcePatch(
    name = "Unlock premium",
    description = "Unlocks all device masking offline, without the paid licence app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HIDEMYEMULATOR_15)

    execute {
        for (gate in HME_15_NATIVE_GATES) {
            val file = runCatching { get(gate.path, true) }.getOrNull() ?: continue
            val bytes = file.readBytes()

            fun verify(offset: Int, expected: ByteArray) {
                val actual = bytes.copyOfRange(offset, offset + expected.size)
                check(actual.contentEquals(expected)) {
                    "${gate.path}: unexpected bytes at ${"0x%x".format(offset)} " +
                        "(got ${actual.toHexString()}, expected ${expected.toHexString()}) — " +
                        "offsets are pinned to 1.5 (versionCode 6)"
                }
            }
            verify(gate.gate1Offset, gate.gate1Original)
            verify(gate.gate2Offset, gate.gate2Original)

            java.io.RandomAccessFile(file, "rwd").use { raf ->
                raf.seek(gate.gate1Offset.toLong())
                raf.write(gate.gate1Patch)
                raf.seek(gate.gate2Offset.toLong())
                raf.write(gate.gate2Patch)
            }
        }
    }
}

private fun ByteArray.toHexString(): String =
    joinToString("") { "%02x".format(it) }
