package app.lopikss.patches.xphero

import app.lopikss.patches.shared.Constants.XP_HERO
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.intOption

/** Experimental free gem ticket recharges and up to 400 daily refills for the
 * PvP, Boss Raid, Heroes' Tomb, and Challenge Tower settings in XP Hero 26.2.0. */
@Suppress("unused")
val xpHeroFreeTickets400 = rawResourcePatch(
    name = "XP Hero | Free Tickets & Return",
    description = "Instant free Return portal uses in the field (no daily-reset wait), plus free ticket refills; paid purchases unchanged.",
    default = false,
) {
    compatibleWith(XP_HERO)

    val dailyRefills = intOption(
        key = "dailyTicketRefills",
        default = 400,
        title = "Daily ticket refill limit",
        description = "Set the configured daily cap for PvP, Boss Raid, Heroes' Tomb and Challenge Tower. Range: 1–5000.",
        required = true,
        validator = { it != null && it in 1..5000 },
    )
    val returnDailyTickets = intOption(
        key = "returnDailyTickets",
        default = 50,
        title = "Instant free Return allowance",
        description = "Return can be used immediately away from base, without waiting for the daily reset. The shown count is virtual, not a stored or decremented inventory; the paid offer stays unchanged.",
        required = true,
        validator = { it != null && it in 10..5000 },
    )
    val freeReturns = intOption(
        key = "freeReturnAllowance",
        default = 50,
        title = "Initial free Return allowance",
        description = "Experimental: increase the game's initial free-return setting from 3. May be limited by online checks.",
        required = true,
        validator = { it != null && it in 3..5000 },
    )

    execute {
        // Select the verified Unity TextAsset files for XP Hero 27.0.0.
        // Keep the 26.2.0 names and existing field matching code unchanged.
        val remote27 = get(XP134TicketEditor.REMOTE_27)
        val pvp27 = get(XP134TicketEditor.PVP_27)
        val use27 = remote27.isFile && pvp27.isFile
        val remote = if (use27) remote27 else get(XP134TicketEditor.REMOTE)
        val pvp = if (use27) pvp27 else get(XP134TicketEditor.PVP)
        val native = get(XP135NativeEditor.ARM64)
        // Check all three assets before writing any file.
        val (newRemote, newPvp) = XP134TicketEditor.freeTicketRecharge(
            remote.readBytes(), pvp.readBytes(),
            dailyRefills.value ?: 400, returnDailyTickets.value ?: 50,
            freeReturns.value ?: 50,
        )
        val newNative = XP135NativeEditor.freeHeroesTombRefills(
            native.readBytes(), returnDailyTickets.value ?: 50)
        remote.writeBytes(newRemote)
        pvp.writeBytes(newPvp)
        native.writeBytes(newNative)
    }
}
