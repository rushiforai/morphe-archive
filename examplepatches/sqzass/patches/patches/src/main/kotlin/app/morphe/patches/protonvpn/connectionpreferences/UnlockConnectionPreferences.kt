/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.protonvpn.connectionpreferences

import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import app.morphe.patches.protonvpn.shared.anchors.VpnUserIsFreeUserFingerprint
import app.morphe.patches.protonvpn.shared.anchors.isFreeUserCall
import app.morphe.patches.protonvpn.shared.fingerprints.ConnectionPreferencesToStringFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.RecentsListViewStateFlowFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.addExcludedLocationFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.connectionCardLabelFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.defaultConnectionRecentsFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.defaultConnectionRestrictionFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.defaultConnectionSettingFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.excludedLocationsFlowFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.inlinedConnectionCardFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.inlinedDefaultConnectionSettingFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.quickConnectIntentFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.recentsDaoReference
import app.morphe.patches.protonvpn.shared.fingerprints.recentsRecordingFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.removeExcludedLocationFingerprint
import app.morphe.patches.protonvpn.shared.helpers.injectExcludedLocationsHelper
import app.morphe.patches.protonvpn.shared.helpers.wireBestServerExclusionCheck
import app.morphe.patches.protonvpn.shared.restrictions.clearConstructorProperty
import app.morphe.patches.protonvpn.shared.restrictions.clearFreeUserCheck
import app.morphe.patches.protonvpn.shared.restrictions.clearFreeUserCheckInLambdaOf
import app.morphe.patches.protonvpn.shared.restrictions.keepUserSetting
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun unlockConnectionPreferences() {
    clearConstructorProperty(ConnectionPreferencesToStringFingerprint, "isFreeUser")
    keepUserSetting(defaultConnectionRestrictionFingerprint())
    clearRecentsRecordingFreeUserCheck()
    clearFreeUserCheckInLambdaOf(RecentsListViewStateFlowFingerprint)
    clearLastFreeUserCheckBefore(defaultConnectionRecentsFingerprint().match())
    clearFreeUserCheck(quickConnectIntentFingerprint())
    clearFreeUserCheck(addExcludedLocationFingerprint())
    clearFreeUserCheck(removeExcludedLocationFingerprint())
    clearFreeUserCheck(excludedLocationsFlowFingerprint())

    injectExcludedLocationsHelper()
    wireBestServerExclusionCheck()

    val connectionCardLabel = connectionCardLabelFingerprint()
    if (connectionCardLabel.matchOrNull() != null) {
        clearFreeUserCheck(connectionCardLabel)
    } else {
        clearLastFreeUserCheckBefore(inlinedConnectionCardFingerprint().match())
    }

    val recentIdLookup = defaultConnectionSettingFingerprint().matchOrNull()
    if (recentIdLookup != null) {
        val (_, recentIdLookupCall) = recentIdLookup.instructionMatches
        recentIdLookup.alwaysTakeLastIfEqz { it.target.location.index == recentIdLookupCall.index }
    } else {
        inlinedDefaultConnectionSettingFingerprint().match().run {
            val recentCheck = instructionMatches.first().index
            alwaysTakeLastIfEqz {
                it.location.index < recentCheck && it.target.location.index <= recentCheck
            }
        }
    }

    println("[protonvpn] connectionpreferences: unlocked (incl. exclusion filtering)")
}

private fun clearRecentsRecordingFreeUserCheck() {
    val method = recentsRecordingFingerprint().method
    val instructions = method.instructions.toList()
    val isFreeUser = isFreeUserCall()
    val recentsDao = recentsDaoReference()
    val sites = instructions.indices.filter { index ->
        val freeUserResult = instructions.getOrNull(index + 1)
        val freeUserBranch = instructions.getOrNull(index + 2)
        isFreeUser.matches(method, instructions[index]) &&
            freeUserResult?.opcode == Opcode.MOVE_RESULT &&
            freeUserBranch?.opcode == Opcode.IF_NEZ &&
            (freeUserResult as OneRegisterInstruction).registerA ==
            (freeUserBranch as OneRegisterInstruction).registerA &&
            instructions.subList(
                index + 3,
                maxOf(index + 3, (freeUserBranch as BuilderOffsetInstruction).target.location.index),
            )
                .takeWhile { it.opcode.name != "RETURN" && !it.opcode.name.startsWith("RETURN") }
                .any { recentsDao.matches(method, it) }
    }
    val site = sites.singleOrNull()
        ?: throw PatchException(
            "Expected one Recents recording branch in $method, found ${sites.size}",
        )
    val register = (instructions[site + 1] as OneRegisterInstruction).registerA
    method.addInstruction(site + 2, "const/16 v$register, 0x0")
}

private fun clearLastFreeUserCheckBefore(anchor: Match) {
    val isFreeUser = VpnUserIsFreeUserFingerprint.originalMethod
    val instructions = anchor.method.instructions
    val callIndex = instructions.take(anchor.instructionMatches.last().index).indexOfLast {
        it.getReference<MethodReference>()?.let { reference ->
            reference.definingClass == isFreeUser.definingClass &&
                reference.name == isFreeUser.name &&
                reference.parameterTypes == isFreeUser.parameterTypes
        } == true
    }
    if (callIndex < 0) {
        throw PatchException(
            "No free-user check before the anchor in ${anchor.method}",
        )
    }
    val register = (instructions[callIndex + 1] as OneRegisterInstruction).registerA
    anchor.method.addInstruction(callIndex + 2, "const/16 v$register, 0x0")
}

private fun Match.alwaysTakeLastIfEqz(isTarget: (BuilderOffsetInstruction) -> Boolean) {
    val branch = method.instructions.filterIsInstance<BuilderOffsetInstruction>().last {
        it.opcode == Opcode.IF_EQZ && isTarget(it)
    }
    method.replaceInstruction(
        branch.location.index,
        BuilderInstruction20t(Opcode.GOTO_16, branch.target),
    )
}
