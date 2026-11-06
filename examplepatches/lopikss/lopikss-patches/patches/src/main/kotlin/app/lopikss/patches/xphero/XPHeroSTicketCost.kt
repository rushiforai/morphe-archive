package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO
import app.morphe.patcher.patch.rawResourcePatch

/**
 * Independent S-ticket cost editor. Can now be selected in either order
 * alongside the ticket-refill patch because XP134TicketEditor verifies
 * the complete original Unity file after normalizing all known edits.
 */
@Suppress("unused")
val xpHeroFreeSTicketRolls = rawResourcePatch(
    name = "XP Hero | Free S-Ticket Rolls",
    description = "Experimental: make S-Ticket rolls cost 0 in XP Hero 26.2.0.",
    default = false,
) {
    compatibleWith(XP_HERO)
    execute {
        val v27 = get(XP134TicketEditor.REMOTE_27)
        val file = if (v27.isFile) v27 else get(XP134TicketEditor.REMOTE)
        file.writeBytes(XP134TicketEditor.sTicket(file.readBytes()))
    }
}
