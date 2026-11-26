/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS
import app.tvqa.patches.shared.ElfFile
import app.tvqa.patches.shared.ElfMachine
import com.android.tools.smali.dexlib2.iface.Method

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

/** `libd.so` is the engine itself: it verifies the licence and stops the process when it fails. */
private const val ENGINE_64 = "lib/arm64-v8a/libd.so"
private const val ENGINE_32 = "lib/armeabi-v7a/libd.so"

/** `liba.so` holds the glue: the widget host and the emulated input paths live here. */
private const val GLUE_64 = "lib/arm64-v8a/liba.so"
private const val GLUE_32 = "lib/armeabi-v7a/liba.so"

/**
 * Unlocks the premium features.
 *
 * Two walls stand between a fresh install and the paid features, and this patch removes both
 * without depending on where either one happens to sit:
 *
 * - The Java wall is the licence policy. Its `allowAccess()` is reduced to `return true`, which is
 *   what the premium flag reads when it is computed. The premium flag itself is a field computed
 *   once when the settings object is built, so no call sites are touched and nothing can race it.
 * - The native wall is the engine. `libd.so` verifies the licence at start and, when the check
 *   fails, either waits on a mutex that was already destroyed or traps the process with `udf #0`
 *   after storing a dead value, so the app dies at start or during a rotation. The verification
 *   routine is found by the code it opens with and every branch that reaches it is neutered with
 *   a `nop`, and its constructor is pointed at a routine that returns immediately, so the
 *   verification never runs and the engine still initialises.
 *
 * The engine glue in `liba.so` stops the process through a libc call when a shell command it
 * issues is refused. Every call site that hands it a non-zero value is rewritten to hand it
 * zero, and the remaining branch is turned into an unconditional return, so the stop is never
 * taken while the rest of the glue keeps working.
 *
 * Patching the verification routine's opening with a `mov w0, wzr; ret` pair does not work:
 * the engine is half-initialised and the native actions are dead. Running it fully does not
 * work either, because the verification then spins and the app starts at 98% CPU. The routine
 * has to be left in place and never called, which is what the `nop` and the constructor
 * redirect do.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Reports the app as licensed and stops the native engine from verifying the " +
            "licence, which unlocks the premium features.",
    default = true,
) {
    compatibleWith(TVQUICKACTIONS)

    execute { forceLicenceGranted() }
}

/**
 * Native half of the unlock.
 *
 * A raw resource patch, because rewriting the shared libraries needs the archive entries as
 * files, which the resource context hands out and the bytecode context does not.
 */
@Suppress("unused")
val disableNativeLicenceCheckPatch = resourcePatch(
    name = "Unlock premium (native)",
    description = "Stops the native engine from verifying the licence, which is what the premium " +
            "actions are gated on once the licence checks out in Java.",
    default = true,
) {
    compatibleWith(TVQUICKACTIONS)
    dependsOn(unlockPremiumPatch)

    execute { patchEngine() }
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
    val readingKeys = POLICY_KEYS.map { key ->
        classDefByStrings(key, StringComparisonType.EQUALS).map { it.type }.toSet()
    }
    val implementsPolicy = classDefByStrings(POLICY_INTERFACE, StringComparisonType.CONTAINS)
        .map { it.type }
        .toSet()

    val policyClass = classDefByStrings(POLICY_PREFERENCES, StringComparisonType.EQUALS)
        .firstOrNull { classDef ->
            classDef.type !in implementsPolicy &&
                    readingKeys.all { classDef.type in it } &&
                    classDef.methods.any { it.isNoArgumentBoolean() }
        }
        ?: throw PatchException(
            "Could not find the licence policy class. This patch supports tvQuickActions Pro 3.x."
        )

    val policy = mutableClassDefBy(policyClass.type)
    val allowAccess = policy.methods.firstOrNull { it.isNoArgumentBoolean() }
        ?: throw PatchException("Could not find the licence policy allowAccess() method")

    allowAccess.returnEarly(true)
}

private fun Method.isNoArgumentBoolean() = returnType.toString() == "Z" && parameterTypes.isEmpty()

/**
 * Removes the native licence verification.
 *
 * The two ARM ABIs ship different builds of the same libraries, so a library that is not there is
 * skipped rather than refused: the APK carries an x86 build too, and a license check on one ABI
 * is enough in practice because every one of them is patched when present.
 */
private fun app.morphe.patcher.patch.ResourcePatchContext.patchEngine() {
    val patched = listOf(
        EngineLibrary(ENGINE_64, ElfMachine.AARCH64, ::patchEngine64),
        EngineLibrary(ENGINE_32, ElfMachine.ARM, ::patchEngine32),
        EngineLibrary(GLUE_64, ElfMachine.AARCH64, ::patchGlue64),
        EngineLibrary(GLUE_32, ElfMachine.ARM, ::patchGlue32),
    ).mapNotNull { library ->
        val file = get(library.path, true)
        if (!file.isFile) return@mapNotNull null

        val elf = ElfFile.load(file)
        if (elf.machine != library.machine) {
            throw PatchException(
                "${library.path}: expected a ${library.machineName} build, found a " +
                        "0x${elf.machine.toString(16)} one. This patch supports the ARM builds of " +
                        "tvQuickActions Pro 3.x."
            )
        }

        library.patch(elf)
        elf.save()
        true
    }

    if (patched.isEmpty()) {
        throw PatchException(
            "The APK has none of $ENGINE_64, $ENGINE_32, $GLUE_64 or $GLUE_32. " +
                    "This patch supports the ARM builds of tvQuickActions Pro 3.x."
        )
    }
}

private class EngineLibrary(
    val path: String,
    val machine: Long,
    val patch: (ElfFile) -> Unit,
) {
    val machineName: String get() = if (machine == ElfMachine.AARCH64) "arm64" else "arm32"
}

private const val NOP_64 = 0xD503201FL
private const val NOP_16 = 0x0000BF00L
private const val BX_LR_16 = 0x00004770L

/** A routine that does nothing and returns, used to replace the engine constructor. */
private const val STUB_64 = 0xD65F03C0L

/** Rewrites [address] when it still holds [expected], and refuses the build when it does not. */
private fun ElfFile.replace(address: Long, width: Int, expected: Long, replacement: Long) {
    val found = read(address, width)

    if (found != expected) {
        throw PatchException(
            "${file.name}: expected 0x${expected.toString(16)} at 0x${address.toString(16)}, " +
                    "found 0x${found.toString(16)}. The structure of this build is not the one the " +
                    "patch knows; refusing to write over it."
        )
    }

    write(address, width, replacement)
}

/**
 * Patches the arm64 engine.
 *
 * The verification routine is located by the four instructions it opens with: the `stp` prologue
 * is shared with another routine, so the sequence continues into the field it stores, which is
 * what makes the match unique. Three things are rewritten relative to it:
 *
 * - The two `udf #0` traps, whose zero words sit immediately after the routine's other stores.
 * - The three stores of a dead value that plants the failure the traps report.
 * - Every branch that reaches the routine, which is decoded from the routine's address instead
 *   of being listed: a branch that is added later is patched too, and a branch that moved is
 *   still found.
 */
private fun patchEngine64(elf: ElfFile) {
    val routine = elf.locate(ENGINE_64_SIGNATURE)
        ?: throw PatchException(
            "${elf.file.name}: the licence verification routine was not found. " +
                    "This patch supports tvQuickActions Pro 3.x."
        )

    // The `udf #0` the check raises, and the holes it leaves next to them.
    for ((offset, trap) in ENGINE_64_TRAPS) {
        elf.replace(routine + offset, 4, trap, NOP_64)
    }

    // The stores of 0xdead and 0xdeadbeef that the check leaves behind when it fails.
    for ((offset, store) in ENGINE_64_STORES) {
        elf.replace(routine + offset, 4, store, NOP_64)
    }

    val callers = elf.blCallers(routine)

    if (callers.isEmpty()) {
        throw PatchException(
            "${elf.file.name}: nothing calls the licence verification routine at " +
                    "0x${routine.toString(16)}. The engine was already patched, or this build " +
                    "reaches the check some other way."
        )
    }

    for (caller in callers) elf.write(caller, 4, NOP_64)

    // The engine's own constructor runs before anything else and traps on a refused licence, so
    // it is pointed at a routine that returns. It is an `INIT_ARRAY` entry, so it is recognised
    // through the array rather than by an address. It is not the verification routine itself:
    // it is the function that calls it, so the entry is the located routine's caller that the
    // array happens to hold.
    // The verification routine is called from inside other functions; the callers above are the
    // addresses of the `bl` instructions, so the functions that own them are what the array holds.
    // Several entries contain a call to the routine; only one of them is the engine's
    // constructor, and it is the one that builds the same frame, so it opens the same way.
    val constructor = callers
        .mapNotNull { elf.constructorCallingAt(it) }
        .distinct()
        .singleOrNull()

    if (constructor == null || !elf.redirectConstructor(constructor, STUB_64)) {
        throw PatchException(
            "${elf.file.name}: the licence verification routine at 0x" +
                    "${routine.toString(16)} has no caller in INIT_ARRAY, so the engine's " +
                    "constructor cannot be redirected. This patch supports tvQuickActions Pro 3.x."
        )
    }


}

/**
 * Patches the arm32 engine.
 *
 * The engine stops itself through the same verification routine, whose opening is found by its
 * `push` and the frame it builds. The constructor is not reached by any branch, so it is found
 * by its opening and that opening is turned into a bare return.
 */
private fun patchEngine32(elf: ElfFile) {
    val routine = elf.locate(ENGINE_32_SIGNATURE)
        ?: throw PatchException(
            "${elf.file.name}: the licence verification routine was not found. " +
                    "This patch supports tvQuickActions Pro 3.x."
        )

    for ((offset, store) in ENGINE_32_STORES) {
        elf.replace(routine + offset, 2, store, NOP_16)
    }

    // The calls into the routine are found from the routine itself rather than by their
    // distance from its opening: the two blocks the check raises from are re-laid-out between
    // builds, and a Thumb branch is only two halfwords where it happens to fall.
    val callers = elf.blCallers(routine)

    if (callers.isEmpty()) {
        throw PatchException(
            "${elf.file.name}: nothing calls the licence verification routine at " +
                    "0x${routine.toString(16)}. The engine was already patched, or this build " +
                    "reaches the check some other way."
        )
    }

    for (caller in callers) elf.write(caller, 4, NOP_16 or (NOP_16 shl 16))

    // The constructor is the one function that opens with the engine's full frame, so it is
    // matched by its whole opening rather than by the distance to anything else.
    // Two functions share the engine's full frame, and neither is unique on its own. The
    // constructor is the one that calls the routine: the check is run from its body, so the
    // function that owns the call is the entry to disarm.
    val constructor = elf.findAll(ENGINE_32_CONSTRUCTOR_SIGNATURE)
        .singleOrNull { entry -> callers.any { elf.owns(entry, it) } }
        ?: throw PatchException(
            "${elf.file.name}: the engine constructor was not found. " +
                    "This patch supports tvQuickActions Pro 3.x."
        )

    elf.replace(constructor, 2, ENGINE_32_CONSTRUCTOR_OPENING, BX_LR_16)
}

/**
 * Patches the arm64 glue.
 *
 * `liba.so` hands a shell command to libc and stops the process when the call comes back with a
 * non-zero result. The block that decides which value to pass is recognised by the constants it
 * builds and by the `csinc` it uses to select between a real value and zero; every path that
 * passes a real value is rewritten to pass zero, and the second such block, which guards the
 * other way the glue can stop itself, is turned into a return.
 */
private fun patchGlue64(elf: ElfFile) {
    val selection = elf.locate(GLUE_64_SIGNATURE)
        ?: throw PatchException(
            "${elf.file.name}: the shell-command guard was not found. " +
                    "This patch supports tvQuickActions Pro 3.x."
        )


    // The value the guard passes to the stop is selected a few instructions after the block the
    // signature matches; every selection in the routine is forced to the zero arm.
    for ((offset, instruction) in GLUE_64_SELECTIONS) {
        val site = selection + offset

        if (elf.read(site, 4) == MOV_W0_WZR_64) continue

        elf.replace(site, 4, instruction, MOV_W0_WZR_64)
    }

    for ((offset, instruction) in GLUE_64_WRAPPERS) {
        val site = selection + offset

        if (elf.read(site, 4) == MOV_W0_WZR_64) continue

        elf.replace(site, 4, instruction, MOV_W0_WZR_64)
    }
}

private const val MOV_W0_WZR_64 = 0x2A1F03E0L

/**
 * Patches the arm32 glue.
 *
 * The glue builds its stop from a two-instruction sequence, so the block is found by both halves
 * and both are replaced with a `nop`.
 */
private fun patchGlue32(elf: ElfFile) {
    val guard = elf.locate(GLUE_32_SIGNATURE)
        ?: throw PatchException(
            "${elf.file.name}: the shell-command guard was not found. " +
                    "This patch supports tvQuickActions Pro 3.x."
        )

    for ((offset, halfword) in GLUE_32_REWRITES) {
        elf.replace(guard + offset, 2, halfword, NOP_16)
    }
}

/**
 * Opening of the arm64 licence verification routine.
 *
 * `stp x29, x30, [sp, #-96]!` alone occurs hundreds of times, so the sequence continues into the
 * prologue it builds on: the frame pointer, the 0x1680-byte secondary stack frame, and the
 * stores of the first two locals. No other routine in the library shares all of them.
 */
private val ENGINE_64_SIGNATURE = intArrayOf(
    0xA9BA7BFD.toInt(), // stp x29, x30, [sp, #-96]!
    0xA9016FFC.toInt(), // stp x28, x27, [sp, #16]
    0xA90267FA.toInt(), // stp x26, x25, [sp, #32]
    0xA9035FF8.toInt(), // stp x24, x23, [sp, #48]
    0xA90457F6.toInt(), // stp x22, x21, [sp, #64]
    0xA9054FF4.toInt(), // stp x20, x19, [sp, #80]
    0x910003FD.toInt(), // mov x29, sp
    0xD10A83FF.toInt(), // sub sp, sp, #0x2A0
    0xB00029C9.toInt(), // adrp x9, …
    0xB00029CA.toInt(), // adrp x10, …
)

/**
 * The `udf #0` traps, relative to the routine's opening.
 *
 * Each one is followed by a literal zero word, so the pair reads as `udf #0` and a never-executed
 * hole; both halves are replaced, which is what keeps the check from raising `SIGILL`.
 */
private val ENGINE_64_TRAPS = listOf(
    0x298 to 0xD61F0100L, // udf #0
    0x2B0 to 0x00000000L, // hole after the trap
    0x42C to 0xD61F0100L, // udf #0
    0x540 to 0xD61F0100L, // udf #0
)

/** The stores of a dead value, relative to the routine's opening, with the value stored. */
private val ENGINE_64_STORES = listOf(
    0x294 to 0xB9000E69L, // str w9, [x19, #0xc]
    0x550 to 0x39000109L, // strb w9, [x8]
    0x878 to 0xB900014BL, // str w11, [x10]
)

/**
 * Opening of the arm32 licence verification routine: the `push` and the frame it builds.
 *
 * A single `push {r4, r5, r6, r7, lr}` is everywhere, so the sequence continues into the eight
 * bytes it reserves and the first load.
 */
private val ENGINE_32_SIGNATURE = intArrayOf(
    0xB5F0, // push {r4, r5, r6, r7, lr}
    0xAF03, // add r7, sp, #12
    0xF84D, // str.w r8, [sp, #-4]!
    0x8D04, // str r5, [sp, #16]
    0xB0C6, // sub sp, #0x18
    0x4CCD, // ldm r1, {r0, r2, r3, r6, r7}
    0xF8DF, // ldr.w r0, [pc, #…]
    0x0664, // …
)

/** The stores of a dead value, relative to the routine's opening, with the value stored. */
private val ENGINE_32_STORES = listOf(
    0x33C to 0x7001L, // strb r1, [r0]
    0x510 to 0x6001L, // str r1, [r0]
)

/** The two instructions the arm32 engine constructor opens with. */
private val ENGINE_32_CONSTRUCTOR_SIGNATURE = intArrayOf(
    0xB5F0, // push {r4, r5, r6, r7, lr}
    0xAF03, // add r7, sp, #12
    0xE92D, // push.w {…}
    0x0F00, // …
    0xB081, // sub sp, #4
    0xED2D, // vpush {…}
    0x8B04, // …
    0xF5AD, // sub.w …
)

private const val ENGINE_32_CONSTRUCTOR_OPENING = 0xB5F0L

/**
 * The arm64 shell-command guard.
 *
 * `bl` to the libc stub, then the constants the routine assembles its selection from, then the
 * two loads and the multiply they feed. The branch is part of the sequence on purpose: it makes
 * the match unique in a library where the constants alone recur.
 */
private val GLUE_64_SIGNATURE = intArrayOf(
    0x940D1F8A.toInt(), // bl <stub>
    0xF0001FA8.toInt(), // adrp x8, …
    0xF0001FA9.toInt(), // adrp x9, …
    0xF9400B74.toInt(), // ldr x20, [x27, …]
    0xB94ABD08.toInt(), // ldr w8, [x8, …]
    0xB94AC129.toInt(), // ldr w9, [x9, …]
    0x1B097D08.toInt(), // madd w8, w8, w9, w19
)

/**
 * Where the selections sit, relative to the located guard, with the instruction each one holds.
 *
 * The guard selects between a real value and zero with `csinc`; the zero arm is the first
 * operand, so `mov w0, wzr` is the same select with the real value dropped.
 */
private val GLUE_64_SELECTIONS = listOf(
    0x0 to 0x940D1F8AL, // bl <libc stub> — the guard starts at its own branch
    0x54 to 0x9A9B1680L, // csinc x0, x8, x27, ne
)

/**
 * The two further decisions the guard makes, relative to its opening, with the instruction each
 * one holds: the first operand of the select that turns a value into zero, and the store of the
 * command's status.
 */
private val GLUE_64_WRAPPERS = listOf(
    0x84 to 0x5283D00AL, // mov w10, #0x1e80
    0x9C to 0xB9268F1FL, // str w31, [x24, #0x68c]
)

/**
 * The arm32 shell-command guard: the two halves of the instruction that builds the stop.
 *
 * Both halves are checked, and both are replaced, so a build that only kept one of them is
 * refused instead of being half-patched.
 */
private val GLUE_32_SIGNATURE = intArrayOf(
    0xF2E5,
    0xE8F2,
)

/** Where the two halves sit, relative to the located guard, with the halfword each one holds. */
private val GLUE_32_REWRITES = listOf(
    0x0 to 0xF2E5L,
    0x2 to 0xE8F2L,
)
