package io.github.jordanwoodson.patches.twitch.home

import io.github.jordanwoodson.patches.twitch.shared.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.jordanwoodson.patches.shared.settings.Section
import io.github.jordanwoodson.patches.shared.settings.SwitchSetting
import io.github.jordanwoodson.patches.twitch.highlights.HIGHLIGHTS_CLASS
import io.github.jordanwoodson.patches.twitch.settings.twitchSettings
import io.github.jordanwoodson.patches.twitch.settings.twitchSettingsPatch
import io.github.jordanwoodson.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.jordanwoodson.patches.twitch.shared.HermesBundle
import io.github.jordanwoodson.patches.twitch.shared.twitchHermes
import io.github.jordanwoodson.patches.twitch.shared.twitchHermesPatch
import io.github.jordanwoodson.patches.twitch.shared.twitchMatch

private const val CONTINUE_WATCHING = "hide_home_continue_watching"
private const val OFFLINE = "hide_home_offline_channels"
private const val RECOMMENDED = "hide_home_recommended"
private const val RECAPS = "hide_home_recaps"

@Suppress("unused")
val hideHomeSectionsPatch = bytecodePatch(
    name = "Hide Home sections",
    description = "Hides Stories on Home and, each with its own switch, the Continue watching, offline " +
        "channels and recommended channels sections of Following, the recent streams shelf of the Live tab and the " +
        "Live tab itself.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TWITCH)
    dependsOn(twitchSettingsPatch, twitchHermesPatch)
    execute {
        hideNativeStories()
        filterFollowingSections()
        twitchHermes.hideHomeSections()
        twitchSettings.add(
            SwitchSetting(HIDE_STORIES, "Hide Stories", "The Stories button and shelf at the top of Home.",
                Section.INTERFACE, restart = true),
            SwitchSetting(CONTINUE_WATCHING, "Hide Continue watching",
                "Videos to resume, in Following and the Home feed.", Section.INTERFACE, default = false, restart = true),
            SwitchSetting(OFFLINE, "Hide offline channels", "Followed channels that aren't live, in Following.",
                Section.INTERFACE, default = false, restart = true),
            SwitchSetting(RECOMMENDED, "Hide recommended channels",
                "Recommended live channels in Following.", Section.INTERFACE, restart = true),
            SwitchSetting(RECAPS, "Hide recent streams",
                "The \"From channels you follow\" shelf of past streams on Home's Live tab.", Section.INTERFACE,
                default = false, restart = true),
            SwitchSetting(HIDE_LIVE_TAB, "Hide Live tab",
                "Home's Live tab, signed in on a phone, so Home opens on Following.", Section.INTERFACE,
                default = false, restart = true),
        )
    }
}

/** The native Home's stories button and shelf follow its "ShowStoriesShelf" argument. */
private fun BytecodePatchContext.hideNativeStories() {
    val method = HomeStoriesArgumentFingerprint.twitchMatch("Home stories argument").method
    val instructions = method.implementation!!.instructions.toList()
    val label = instructions.indices.single {
        ((instructions[it] as? ReferenceInstruction)?.reference as? StringReference)?.string == "ShowStoriesShelf"
    }
    val read = instructions[label + 1]
    val result = instructions[label + 2]
    if (((read as? ReferenceInstruction)?.reference as? MethodReference)?.name != "getBoolean" ||
        result.opcode != Opcode.MOVE_RESULT) throw PatchException("Twitch: unexpected stories argument read")
    // Both the argument and its missing-arguments fallback (false) meet at one move into the
    // presenter's argument register, followed by a plain goto; filter right after that move.
    val value = (result as OneRegisterInstruction).registerA
    val move = (label + 3 until instructions.size).first { instructions[it].opcode == Opcode.MOVE }
    if ((instructions[move] as TwoRegisterInstruction).registerB != value || !instructions[move + 1].opcode.name.startsWith("goto")) {
        throw PatchException("Twitch: unexpected stories argument flow")
    }
    val register = (instructions[move] as OneRegisterInstruction).registerA
    method.addInstructions(move + 1, """
        invoke-static/range { v$register .. v$register }, $HIGHLIGHTS_CLASS->storiesShelf(Z)Z
        move-result v$register
    """)
}

/** The Following page's section list, before it is turned into headers and rows. */
private fun BytecodePatchContext.filterFollowingSections() {
    val method = FollowingSectionsFingerprint.twitchMatch("Following page sections").method
    val section = ResumeWatchingSectionFingerprint.twitchMatch("Continue watching section").classDef.superclass
        ?: throw PatchException("Twitch: Following section has no parent")
    val instructions = method.implementation!!.instructions.toList()
    val array = instructions.indices.single { index ->
        instructions[index].opcode == Opcode.NEW_ARRAY &&
            ((instructions[index] as ReferenceInstruction).reference as TypeReference).type == "[$section"
    }
    val arrayRegister = (instructions[array] as OneRegisterInstruction).registerA
    val build = (array + 1 until instructions.size).first { instructions[it].opcode == Opcode.INVOKE_STATIC }
    val reference = (instructions[build] as ReferenceInstruction).reference as MethodReference
    if (reference.returnType != "Ljava/util/List;" || (instructions[build] as FiveRegisterInstruction).registerC != arrayRegister ||
        instructions[build + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Twitch: unexpected Following section list")
    }
    val list = (instructions[build + 1] as OneRegisterInstruction).registerA
    method.addInstructions(build + 2, """
        invoke-static/range { v$list .. v$list }, $HIGHLIGHTS_CLASS->followingSections(Ljava/util/List;)Ljava/util/List;
        move-result-object v$list
    """)
}

/** RN Home (android-ultralight): the Stories shelf (HermesHomeStories.kt) and the continue-watching seat and section. */
internal fun HermesBundle.hideHomeSections() {
    hideStoriesShelf()
    // readContinueWatchingEnabled(flags) returns flags.getBoolean(<flag>, false): its Call3 becomes
    // false in the returned register, which is the flag-off path (no feed seat is fetched).
    val reader = function("readContinueWatchingEnabled")
    val body = reader.body
    if (body.size != 26 || (body[0x12].toInt() and 255) != 0x6f || (body[0x18].toInt() and 255) != 0x76 ||
        body[0x19] != body[0x13] || (body[0x13].toInt() and 255) < reader.numberRegisters + reader.nonPointerRegisters) {
        throw PatchException("Twitch: unexpected continue-watching flag read")
    }
    val register = body[0x13]
    replace(reader, CONTINUE_WATCHING, body.copyOfRange(0x12, 0x18),
        byteArrayOf(0x96.toByte(), register, 0x96.toByte(), register, 0x96.toByte(), register), defaultEnabled = false)
    returnNull("FollowingContinueWatching", CONTINUE_WATCHING, defaultEnabled = false)
    // The RN Following page's "Your Offline Channels" section (issue 73) and the "From channels you follow"
    // shelf of recent streams on the Live tab (discussion 50) are components of their own.
    returnNull("FollowingOfflineChannels", OFFLINE, defaultEnabled = false)
    returnNull("RecapsShelf", RECAPS, defaultEnabled = false)
    // The Live tab itself (issue 73), in its own file so the host probes compile it without Morphe's bytecode API.
    hideHomeLiveTab()
}

