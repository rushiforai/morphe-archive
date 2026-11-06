package app.template.patches.shared

/**
 * Build a constant-loading smali instruction that can actually address [register].
 *
 * `const/4` only encodes registers v0-v15. R8/ProGuard output routinely keeps the
 * value a universal patch wants to overwrite in a higher register (especially in
 * large methods), and emitting `const/4 v17, 0x0` makes the smali assembler reject
 * the instruction — the whole patch then fails on an otherwise valid APK.
 *
 * Pick the widest-but-cheapest form that supports the register:
 *  - `const/4`  for v0-v15 (literal must fit in 4 bits)
 *  - `const/16` for v16-v255
 *  - `const`    as a last resort
 *
 * Only non-negative literals below 16 bits are used by the universal patches today.
 */
internal fun constValue(register: Int, value: Int): String {
    val literal = "0x${Integer.toHexString(value)}"
    return when {
        register <= 0xF && value in -8..7 -> "const/4 v$register, $literal"
        register <= 0xFF && value in -32768..32767 -> "const/16 v$register, $literal"
        else -> "const v$register, $literal"
    }
}
