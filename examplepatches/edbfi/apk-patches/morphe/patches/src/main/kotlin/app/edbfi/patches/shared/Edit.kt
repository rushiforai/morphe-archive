// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.shared

import app.morphe.patcher.patch.PatchException

/**
 * A change to one method, checked but not yet made. The patcher keeps a failed patch's changes, so a patch looks up
 * and checks everything it needs, then [apply]s its edits.
 */
internal class Edit(
    /** How many places the edit changes. */
    val count: Int,
    private val change: () -> Unit,
) {
    fun apply() = change()

    /** This edit, once it changes [expected] places, else a [PatchException] naming [what] it changes. */
    fun expect(
        expected: Int,
        what: String,
    ): Edit = if (count == expected) this else throw PatchException("Expected $expected $what, found $count")
}
