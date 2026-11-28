/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.imo.patches.features

import app.imo.patches.menu.imoMenuRowPatch
import app.imo.patches.shared.Constants.COMPATIBILITY_IMO
import app.imo.patches.signin.imoSignaturePatch
import app.loki.patches.universal.menuFlagPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val TABS = "Lapp/loki/extension/LokiTabs;"

/**
 * IMO's Home screen (older layout) builds its tab strip from one list of tab ids (0 chats, 2 voice rooms, 3 contacts, 4 calls), and
 * both the strip and the swipe pages are driven by it, so taking an id out removes the tab and its page together. IMO
 * itself ships a two-tab layout without voice rooms, which is the same shape. The class holding the list is obfuscated,
 * so it is found by the log line its `checkInitConfigImmediately` writes.
 */
private val tabConfigLog = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("HomeTabPosConfig", "checkInitConfigImmediately: size="),
)

/** The newer Home layout keeps its tabs in a small model class; its toString is the only place that names it. */
private val tabModelToString = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("HomeTabModel(uid="),
)

@Suppress("unused")
val hideVoiceTabPatch = bytecodePatch(
    name = "Hide voice rooms tab (IMO)",
    description = "Removes the voice rooms tab (Room and Explore) from the top bar of IMO, so only Chats and Contacts are left.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IMO)
    dependsOn(imoSignaturePatch)
    dependsOn(menuFlagPatch("app.loki.menu.hidevoice"))
    dependsOn(imoMenuRowPatch)

    execute {
        // Newer layout: take the voice-rooms tab out of the model as it is built.
        val model = mutableClassDefBy(tabModelToString.classDef)
        val constructor = model.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.size == 2 && it.parameterTypes[1].toString() == "Ljava/util/List;"
        } ?: throw PatchException("IMO: the tab model constructor was not found")
        constructor.addInstructions(
            0,
            """
                invoke-static {p2}, $TABS->withoutClubhouse(Ljava/util/List;)Ljava/util/List;
                move-result-object p2
            """,
        )

        val holder = mutableClassDefBy(tabConfigLog.classDef)
        val tabList = holder.methods.singleOrNull {
            it.returnType == "Ljava/util/List;" && it.parameterTypes.isEmpty() &&
                AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("IMO: the tab list method was not found")

        val returns = tabList.implementation!!.instructions.withIndex()
            .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
            .map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }
        if (returns.isEmpty()) throw PatchException("IMO: the tab list method has no return to hook")

        // The method is static with no parameters, so every register is a plain `v` one.
        for ((index, register) in returns.sortedByDescending { it.first }) {
            tabList.addInstructions(
                index,
                """
                    invoke-static {v$register}, $TABS->withoutVoice(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """,
            )
        }
    }
}
