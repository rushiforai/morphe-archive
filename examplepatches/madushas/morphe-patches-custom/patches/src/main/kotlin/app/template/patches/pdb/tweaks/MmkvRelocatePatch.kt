package app.template.patches.pdb.tweaks

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.PDB_COMPATIBILITY

/**
 * Pdb copies its bundled MMKV into `files/mmkv_1_3_14_<bits>.so` once and then
 * `System.load`s that copy on every launch — the copy step is skipped whenever
 * the file already exists. A stale copy (e.g. written by an arm64 build, then
 * the same install handed an x86_64 build on an emulator) is loaded forever and
 * kills the app in `Application.onCreate` with
 * `UnsatisfiedLinkError: ... EM_AARCH64 instead of EM_X86_64`. No root, no
 * pm clear without losing the login.
 *
 * Relocating the copy target (same-length constant rename, `…14x64.so`)
 * sidesteps any stale file: the library matching THIS apk is copied fresh.
 * Harmless on devices — the first launch after patching just re-copies.
 */
private const val OLD_PREFIX = "mmkv_1_3_14_"
private const val NEW_PREFIX = "mmkv_1_3_14x"

private val MmkvLoader = Fingerprint(
    returnType = "V",
    filters = listOf(string(OLD_PREFIX)),
)

@Suppress("unused")
val pdbMmkvRelocatePatch = bytecodePatch(
    name = "Relocate runtime MMKV copy",
    description = "Copies the bundled MMKV library to a fresh file name so a " +
        "stale copy from another ABI can never be loaded (fixes emulator " +
        "crashes; no effect on a clean device).",
    default = false,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        val method = MmkvLoader.method
            ?: throw IllegalStateException("mmkv loader (method with \"$OLD_PREFIX\") not found")

        val instrs = method.implementation?.instructions
            ?: throw IllegalStateException("no implementation")

        var index = -1
        var register = -1
        for (i in instrs.indices) {
            val ins = instrs[i]
            if (ins.opcode == com.android.tools.smali.dexlib2.Opcode.CONST_STRING) {
                val ref = (ins as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)
                    .reference as com.android.tools.smali.dexlib2.iface.reference.StringReference
                if (ref.string == OLD_PREFIX) {
                    index = i
                    // const-string is a 21c instruction: one register, registerA.
                    register = (ins as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA
                    break
                }
            }
        }
        if (index < 0) throw IllegalStateException("const-string \"$OLD_PREFIX\" not found")

        method.replaceInstruction(
            index,
            "const-string v$register, \"$NEW_PREFIX\"",
        )
    }
}
