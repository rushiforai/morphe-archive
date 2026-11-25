/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.extension

/** Smali for the start of a trace section under the first note starting with [prefix], as 456 compiles one. */
internal fun noteSmali(prefix: String, register: Int = 0): String =
    """
    const v$register, ${composeNoteKeys(prefix).first()}
    invoke-static/range { v$register .. v$register }, LX/trace;->start(I)V
    """
