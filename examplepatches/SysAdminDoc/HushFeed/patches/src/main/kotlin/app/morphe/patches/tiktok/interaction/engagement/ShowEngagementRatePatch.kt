/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.engagement

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.interaction.authorregion.authorRowPatch
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/morphe/extension/tiktok/feed/ProfileGridCount;"
private const val AWEME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val STATISTICS = "Lcom/ss/android/ugc/aweme/feed/model/AwemeStatistics;"
private const val WHAT = "Profile grid count"

/**
 * The bind of the profile grid's adapter, which a profile's Videos, Liked and other tabs list
 * their cells through (X/0Of2 on 47.1.4, X/0Oey on 47.1.3, X/0lEk on 47.0.3, built by
 * AwemeListFragmentImpl and ProfileBaseAwemeListFragment). It reads one view count: the cell's
 * play icon label, formatted by TikTok's main count formatter.
 */
internal object ProfileGridBindFingerprint : Fingerprint(
    name = "onBindBasicViewHolder",
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "I"),
    strings = listOf("AwemeListFragment", "not supported in i18n"),
    custom = { method, _ -> method.viewCountReads().size == 1 },
)

private fun Instruction.calls(owner: String, name: String) =
    getReference<MethodReference>()?.let { it.definingClass == owner && it.name == name } == true

private fun Method.viewCountReads(): List<Int> {
    val instructions = implementation?.instructions?.toList().orEmpty()
    return instructions.indices.filter { instructions[it].calls(STATISTICS, "getPlayCount") }
}

/**
 * Where the grid's view count text is ready: [insertAt] is the instruction after the formatter's
 * move-result-object into [textRegister], and [itemRegister] still holds the cell's Aweme there.
 */
internal data class GridCountSite(val insertAt: Int, val textRegister: Int, val itemRegister: Int)

/**
 * The cell's view count runs `item.getStatistics()`, then `getPlayCount()` on the result, a static
 * (J)String formatter and its move-result-object. The hook goes right after that and reads the
 * item from the register the statistics were asked of, so every path into the stretch from there
 * to the hook has to come through that call, and nothing in it may write the item's register.
 */
internal fun Method.gridCountSite(): GridCountSite {
    val instructions = implementation?.instructions?.toList()
        ?: throw PatchException("$WHAT: the profile grid bind has no code.")
    val read = viewCountReads().singleOrNull()
        ?: throw PatchException("$WHAT: expected one view count read in the profile grid bind.")
    val format = read + 2
    val result = read + 3
    val formatter = instructions.getOrNull(format)?.getReference<MethodReference>()
    if (instructions.getOrNull(read + 1)?.opcode != Opcode.MOVE_RESULT_WIDE ||
        instructions[format].opcode !in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) ||
        formatter?.returnType != "Ljava/lang/String;" ||
        formatter.parameterTypes.map(CharSequence::toString) != listOf("J") ||
        instructions.getOrNull(result)?.opcode != Opcode.MOVE_RESULT_OBJECT
    ) {
        throw PatchException("$WHAT: the view count isn't formatted to text right after it's read.")
    }
    val textRegister = (instructions[result] as OneRegisterInstruction).registerA
    val statisticsRegister = (instructions[read] as FiveRegisterInstruction).registerC

    val statisticsStored = (read - 1 downTo 1).firstOrNull {
        (instructions[it] as? OneRegisterInstruction)?.registerA == statisticsRegister &&
            instructions[it].opcode.setsRegister()
    } ?: throw PatchException("$WHAT: the view count's statistics come from nowhere.")
    val asked = statisticsStored - 1
    if (instructions[statisticsStored].opcode != Opcode.MOVE_RESULT_OBJECT ||
        instructions[asked].opcode != Opcode.INVOKE_VIRTUAL || !instructions[asked].calls(AWEME, "getStatistics")
    ) {
        throw PatchException("$WHAT: the view count's statistics aren't the item's own.")
    }
    val itemRegister = (instructions[asked] as FiveRegisterInstruction).registerC

    val insertAt = result + 1
    val stretch = asked until insertAt
    if (stretch.any { index ->
            val instruction = instructions[index]
            instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA.let {
                it == itemRegister || (instruction.opcode.setsWideRegister() && it == itemRegister - 1)
            }
        }
    ) {
        throw PatchException("$WHAT: the item's register is written between its statistics and the view count.")
    }
    val flow = ControlFlow.of(this)
    instructions.indices.forEach { from ->
        if (from in stretch) return@forEach
        (flow.normal[from] + flow.exceptional[from]).forEach { to ->
            if (to > asked && to <= insertAt) {
                throw PatchException("$WHAT: instruction $from jumps into the view count at $to.")
            }
        }
    }
    if (flow.normal[result] != listOf(insertAt)) {
        throw PatchException("$WHAT: the view count's text doesn't fall through to the hook.")
    }
    // The 4-bit invoke below names both registers.
    if (textRegister > 15 || itemRegister > 15) {
        throw PatchException("$WHAT: v$textRegister or v$itemRegister doesn't fit a short invoke.")
    }
    return GridCountSite(insertAt, textRegister, itemRegister)
}

/**
 * Hands each profile grid cell's view count text and its Aweme to the extension. Show engagement
 * rate and Always show publish date share it, so a build with both installs the hook once and
 * each adds its part to the text: the rate after the count, the date on a line of its own.
 */
internal val profileGridCountPatch = bytecodePatch {
    dependsOn(sharedExtensionPatch)

    execute {
        ProfileGridBindFingerprint.method.apply {
            if (AccessFlags.STATIC.isSet(accessFlags)) {
                throw PatchException("$WHAT: the profile grid bind is static.")
            }
            val site = gridCountSite()
            addInstructions(
                site.insertAt,
                """
                    invoke-static { v${site.textRegister}, v${site.itemRegister} }, $EXTENSION->text(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v${site.textRegister}
                """,
            )
        }
    }
}

@Suppress("unused")
val showEngagementRatePatch = bytecodePatch(
    name = "Show engagement rate",
    description = "Shows a video's engagement rate, its likes, comments, shares and saves as a share of its views, " +
        "next to the creator's name and after the view count on profile grids. Switch: Hushfeed settings > Feed screen.",
    default = false,
) {
    category("Feed")
    // The author row install and the player's current video come with the row patch, the grid
    // cell's count with the grid patch.
    dependsOn(settingsPatch, sharedExtensionPatch, authorRowPatch, profileGridCountPatch)
    compatibleWith(*AppCompatibilities.tiktok())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableEngagementRate()V",
        )
    }
}
