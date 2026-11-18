package io.github.jordanwoodson.patches.kick.clips

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import io.github.jordanwoodson.patches.kick.settings.kickSettings
import io.github.jordanwoodson.patches.kick.shared.Constants.COMPATIBILITY_KICK
import io.github.jordanwoodson.patches.kick.shared.HermesFunction
import io.github.jordanwoodson.patches.kick.shared.HermesOp
import io.github.jordanwoodson.patches.kick.shared.OTA_UPDATES_OFF
import io.github.jordanwoodson.patches.kick.shared.hex
import io.github.jordanwoodson.patches.kick.shared.kickHermes
import io.github.jordanwoodson.patches.kick.shared.kickHermesPatch
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting

private const val KEY = "hide_clips"

@Suppress("unused")
val hideClipsPatch = bytecodePatch(
    name = "Hide Clips",
    description = "Hides Clips tabs in Browse, channels and categories, and the popular-clips row on channels. " +
        "Shared clip links still open. Starts off. Turn it on in Lurk settings > Interface." + OTA_UPDATES_OFF,
) {
    compatibleWith(COMPATIBILITY_KICK)
    dependsOn(kickHermesPatch)

    execute {
        // Every edit is off until the switch is turned on.
        fun replace(function: HermesFunction, before: String, after: String) =
            kickHermes.replace(function, KEY, hex(before), hex(after), defaultEnabled = false)

        // Three edits drop an array append by writing `undefined` over a register twice. That is harmless only while
        // the function never holds anything else in that register: every instruction naming it first must load
        // undefined (or return it). A Kick version that reuses the register fails here instead of patching wrong.
        fun requireOnlyUndefined(function: HermesFunction, register: Int) {
            val named = kickHermes.instructions(function).filter {
                it.bytes.size > 1 && it.u8(1) == register && it.targets().isEmpty()
            }
            if (named.none { it.opcode == HermesOp.LOAD_CONST_UNDEFINED } ||
                named.any { it.opcode != HermesOp.LOAD_CONST_UNDEFINED && it.opcode != HermesOp.RET }) {
                throw PatchException("Kick: ${function.label} uses r$register for more than undefined")
            }
        }

        // BrowseScreenLayout's memoized screen list: categories, livestreams, clips. Select the
        // anonymous producer by its three tab titles, not its function ID.
        val browseTabs = kickHermes.functionUsing("Browse tab list",
            loads = listOf("categories.title.message", "browse.tabs.livechannels.title.message", "clips.title.message"))
        requireOnlyUndefined(browseTabs, 0)
        replace(browseTabs, "09 01 03 00 5a 01 02 00", "09 01 02 00 5a 01 02 00")
        replace(browseTabs, "5a 01 02 02 76 01", "93 00 93 00 76 01")

        // ChannelLayout's list: home, about, videos, clips, chat. Remove the Clips append and
        // compact Chat into index 3. r0 holds undefined throughout both small producers (checked).
        val channelTabs = kickHermes.functionUsing("channel tab list",
            loads = listOf("channel.tabs.home.message", "channel.tabs.clips.message", "channel.tabs.chat.message"))
        requireOnlyUndefined(channelTabs, 0)
        replace(channelTabs, "09 01 05 00 5a 01 02 00", "09 01 04 00 5a 01 02 00")
        replace(channelTabs, "52 02 03 01 5a 01 02 03", "52 02 03 01 93 00 93 00")
        replace(channelTabs, "5a 01 02 04 76 01", "5a 01 02 03 76 01")

        // The category header's screen list (Live, Clips) is a small producer BrowseCategoriesHeader creates, like the
        // two lists above: the same edits. r0 is only ever undefined there (checked).
        val header = kickHermes.closureUsing(kickHermes.function("BrowseCategoriesHeader"), "category tab list",
            loads = listOf("browse.tabs.livechannels.title.message", "clips.title.message"))
        requireOnlyUndefined(header, 0)
        replace(header, "09 01 02 00 5a 01 02 00", "09 01 01 00 5a 01 02 00")
        replace(header, "5a 01 02 01 76 01", "93 00 93 00 76 01")

        // Remove the PopularClipsRow React element in its parent, preserving the video and
        // recent-category rows: jsx(PopularClipsRow, {channelSlug}) becomes null in the same register.
        // React ignores null children; there is no blank Clips screen.
        val (home, row) = kickHermes.sequence(
            "PopularClipsRow element", kickHermes.functionsNamed("ChannelHomeContent"),
            listOf(
                kickHermes.reads("PopularClipsRow"),
                kickHermes.creates("channelSlug"),
                { it.opcode == HermesOp.PUT_OWN_BY_SLOT_IDX },
                { it.opcode == HermesOp.CALL3 },
            ),
        ) { (component, props, put, call) ->
            put.u8(1) == props.u8(1) && call.u8(4) == component.u8(1) && call.u8(5) == props.u8(1)
        }
        val element = row.last()
        val result = element.bytes[1]
        val loadNull = HermesOp.LOAD_CONST_NULL.toByte()
        kickHermes.replaceInstruction(home, KEY, element, byteArrayOf(loadNull, result, loadNull, result, loadNull, result),
            defaultEnabled = false)
        kickSettings.add(
            SwitchSetting(
                KEY,
                "Hide Clips",
                "Hide Clips tabs and the channel clips row. Shared clip links still open.",
                Section.INTERFACE,
                default = false,
                restart = true,
            ),
        )
    }
}
