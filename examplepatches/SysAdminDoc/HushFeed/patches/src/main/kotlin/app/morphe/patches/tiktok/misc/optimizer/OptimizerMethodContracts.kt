/*
 * Bytecode behavior adapted from kveld9/kveld-morphe-patches at
 * fcb1768620b8f98a6dd31e801074589ce9a63356 (GPL-3.0).
 * https://github.com/kveld9/kveld-morphe-patches/tree/fcb1768620b8f98a6dd31e801074589ce9a63356
 */
package app.morphe.patches.tiktok.misc.optimizer

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

private val reviewedSplashGateInstructionCounts = setOf(
    listOf(4, 4, 30),
    listOf(4, 4),
)

private val reviewedFrescoProfiles = setOf(
    Triple(42, 22, null),
    Triple(66, 30, null),
    Triple(66, null, 72),
)

internal fun isReviewedSplashGateShape(instructionCounts: List<Int>): Boolean =
    instructionCounts.sorted() in reviewedSplashGateInstructionCounts

internal fun isReviewedFrescoProfile(indexed: Int, direct: Int?, removedDirect: Int?): Boolean =
    Triple(indexed, direct, removedDirect) in reviewedFrescoProfiles

internal fun Method.isIndexedFrameLookup(): Boolean {
    val parameters = parameterTypes.map(CharSequence::toString)
    return hasFrameCacheAccess() && returnType.isObjectType() &&
        parameters.size == 3 && parameters[0] == "I" &&
        parameters[1].isObjectType() && parameters[2] == "Z"
}

internal fun Method.isDirectFrameLookup(): Boolean {
    val parameters = parameterTypes.map(CharSequence::toString)
    return hasFrameCacheAccess() && returnType.isObjectType() &&
        parameters.size == 2 && parameters[0].isObjectType() && parameters[1] == "Z"
}

internal fun Method.isRemovedDirectFrameLookup(): Boolean {
    val parameters = parameterTypes.map(CharSequence::toString)
    return hasFrameCacheAccess() && returnType == "V" &&
        parameters.size == 2 && parameters[0].isObjectType() && parameters[1] == "Z"
}

private fun Method.hasFrameCacheAccess(): Boolean =
    AccessFlags.PUBLIC.isSet(accessFlags) &&
        AccessFlags.FINAL.isSet(accessFlags) &&
        AccessFlags.DECLARED_SYNCHRONIZED.isSet(accessFlags)

private fun String.isObjectType(): Boolean = startsWith('L') || startsWith('[')
