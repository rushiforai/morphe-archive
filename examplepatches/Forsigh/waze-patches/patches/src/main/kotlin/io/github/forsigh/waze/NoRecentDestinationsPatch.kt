package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Keeps recent destinations out of the app without touching how they are stored.
 *
 * Waze reads its history through a single JNI entry point,
 * `PlacesNativeManager.fetchRecentsNTV()[B`, and that method has exactly one caller: the dispatch
 * block in `Lcom/waze/alerters/d;->a()`. Everything the phone shows (search screen, Places tab) and
 * everything the car shows comes through that one read, so answering it with an empty byte array
 * empties every list at once.
 *
 * The store is deliberately left alone. Removing the write (the earlier attempt) also removed the
 * native record Waze looks up after a drive, which crashed the app on leaving journey mode and
 * refused long-distance navigation - the write has to keep happening for the app's own bookkeeping.
 * Zero bytes parse into a default protobuf message, so callers see a well-formed "no recent places"
 * answer rather than a null.
 */
private val RecentsReadFingerprint = Fingerprint(
    definingClass = "Lcom/waze/alerters/d;",
    name = "a",
    returnType = "Ljava/lang/Object;",
)

private const val FETCH_CALL = "Lcom/waze/places/PlacesNativeManager;->fetchRecentsNTV()[B"

@Suppress("unused")
val noRecentDestinationsPatch = bytecodePatch(
    name = "Hide recent destinations",
    description = "Keeps the places you navigated to out of every recent list. Waze still stores them.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Privacy & Updates")

    execute {
        val method = RecentsReadFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("noRecentDestinations: the recents bridge has no implementation")

        val instructions = implementation.instructions.toList()
        val site = instructions.indexOfFirst { instruction ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == FETCH_CALL
        }
        if (site < 0) {
            throw PatchException(
                "noRecentDestinations: fetchRecentsNTV is no longer read from Lcom/waze/alerters/d;->a() - " +
                    "Waze moved the history read; refusing to patch blind",
            )
        }
        val next = instructions.getOrNull(site + 1)
        if (next == null || next.opcode != Opcode.MOVE_RESULT_OBJECT) {
            throw PatchException(
                "noRecentDestinations: expected move-result-object after the read, found " +
                    (next?.opcode?.name ?: "end of method"),
            )
        }

        method.removeInstructions(site, 2)
        method.addInstructions(
            site,
            """
                const/4 v1, 0x0
                new-array v1, v1, [B
            """.trimIndent(),
        )
        println("noRecentDestinations: recent-history read returns an empty list at instruction $site")
    }
}
