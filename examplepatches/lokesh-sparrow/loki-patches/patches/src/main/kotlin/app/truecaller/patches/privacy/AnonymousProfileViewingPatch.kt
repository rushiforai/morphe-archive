/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.truecaller.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch

/**
 * The one decision behind "X viewed your profile": `m(tcId, searchType, isPhonebookContact, skipSourceCheck)` of the
 * who-viewed-me manager. GenerateProfileViewWorker asks it after every profile you open and only posts the view to
 * Truecaller's PROFILE_VIEW endpoint when it answers yes. It reads the outgoing views table, so its query text
 * identifies it in every version (the class is renamed each release: rea0 in 26.44.6).
 */
private val shouldSendProfileView = Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "I", "Z", "Z"),
    strings = listOf("OUTGOING", "tc_id = ? AND type = ?"),
)

/**
 * The one place a number search is reported to the person searched ("X searched for you"): the search screen
 * queues ExactSearchLoggerWorker with the term and whether it is a contact, and that worker posts it. The method
 * that queues it names the worker and both input keys, which identifies it in every version (h6m.j6 in 26.44.6).
 */
private val queueSearchReport = Fingerprint(
    returnType = "V",
    strings = listOf("ExtraSearchTerm", "ExtraIsInPhonebookContact", "ExactSearchLoggerWorker"),
)

/** Lets the Loki Patches screen show the switches and report the patches (Privacy page, Patch status). */
private val anonymousFlag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use {
            it.addMenuFlag("app.loki.menu.anonview")
            it.addMenuFlag("app.loki.menu.anonsearch")
        }
    }
}

/**
 * Opening someone's profile no longer tells them you looked. Internal: it ships with the premium patch, and a switch
 * in Loki Patches > Privacy (on by default) decides at run time. Off, Truecaller sends the view as usual.
 */
internal val anonymousProfileViewing = bytecodePatch {
    dependsOn(menuPatch, anonymousFlag)

    execute {
        val method = shouldSendProfileView.method
        method.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Lapp/loki/extension/LokiSwitches;->anonymousProfileView()Z
                move-result v0
                if-eqz v0, :send
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("send", method.getInstruction(0)),
        )

        // Searching a number no longer tells that person you searched for them (own switch, also on by default).
        val search = queueSearchReport.method
        search.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, Lapp/loki/extension/LokiSwitches;->anonymousSearch()Z
                move-result v0
                if-eqz v0, :report
                return-void
            """,
            ExternalLabel("report", search.getInstruction(0)),
        )
    }
}
