package io.github.jordanwoodson.patches.kick.upsells

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesInstruction
import io.github.jordanwoodson.patches.kick.shared.HermesOp
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "hide_subscription_upsells"

@Suppress("unused")
val hideSubscriptionUpsellsPatch = bytecodePatch(
    name = "Hide subscription upsells",
    description = "Hides channel Subscribe and Gift a Sub buttons and the leaderboard gift-subscription prompt. " +
        "Keeps the existing subscribed indicator. Starts off. Turn it on in Lurk settings > Interface." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch)

    execute {
        hideSubscribeButton()
        kickHermes.returnAtEntry("ChannelGiftSubButton", KEY, defaultEnabled = false)
        kickHermes.returnAtEntry("LeaderboardSubsFooter", KEY, defaultEnabled = false)
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Hide subscription upsells",
                "Hide channel subscription buttons and the leaderboard gift prompt.",
                Section.INTERFACE,
                default = false,
                restart = true,
            ),
        )
    }
}

/**
 * `ChannelSubButton` ends with `if (x.subscription) <subscribed icon> else <Subscribe button>`: the read, then a forward
 * JmpTrue (or JmpTrueLong) on its register to the subscribed branch, then the unsubscribed path, whose first
 * instructions become `return null`. All hooks have run by then, so React's hook order is unchanged; the subscribed
 * icon, subscription state and access stay as they are. Found by the property and the register flow, not by
 * registers, cache slots or offsets.
 */
private fun hideSubscribeButton() {
    val button = kickHermes.function("ChannelSubButton")
    val code = kickHermes.instructions(button)
    fun fail(what: String): Nothing = throw PatchException("Kick: ChannelSubButton $what")
    val subscription = kickHermes.stringId("subscription")
    val read = code.singleOrNull { it.propertyId() == subscription } ?: fail("reads its subscription more than once")
    val value = read.u8(1)
    val after = code.indexOf(read) + 1
    val jumpIndex = (after until code.size).firstOrNull {
        code[it].opcode == HermesOp.JMP_TRUE || code[it].opcode == HermesOp.JMP_TRUE_LONG
    } ?: fail("has no branch on its subscription")
    val jump = code[jumpIndex]
    val tested = if (jump.opcode == HermesOp.JMP_TRUE_LONG) jump.u8(5) else jump.u8(2)
    // Writes name their register first; jumps start with an offset, so they're skipped.
    val overwritten = code.subList(after, jumpIndex).any { it.targets().isEmpty() && it.bytes.size > 1 && it.u8(1) == value }
    if (tested != value || overwritten || jump.target()!! <= jump.offset) fail("no longer branches forward on its subscription")
    // The unsubscribed path's first instructions, at least the four bytes `LoadConstNull r; Ret r` takes. They start by
    // loading something into a register that then holds an object, so it can hold null.
    val run = mutableListOf<HermesInstruction>()
    for (instruction in code.subList(jumpIndex + 1, code.size)) {
        if (run.sumOf { it.bytes.size } >= 4) break
        run += instruction
    }
    val register = run.first().u8(1)
    if (run.sumOf { it.bytes.size } < 4 || register < button.numberRegisters + button.nonPointerRegisters) {
        fail("unsubscribed path starts in a register that can't hold null")
    }
    val replacement = ByteArray(run.sumOf { it.bytes.size })
    byteArrayOf(HermesOp.LOAD_CONST_NULL.toByte(), register.toByte(), HermesOp.RET.toByte(), register.toByte())
        .copyInto(replacement)
    kickHermes.replaceInstructions(button, KEY, run, replacement, defaultEnabled = false)
}
