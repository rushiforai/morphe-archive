package app.smartlife.patches.smartlife.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import java.util.logging.Logger

/**
 * Prefix of every warning these patches log. The Play patch test workflow greps the patch log
 * for it, so a patch that still "applies" but hit something unexpected (for example a fingerprint
 * that suddenly matches two methods after an app update) is surfaced instead of passing silently.
 */
internal const val WARN_MARKER = "SMARTLIFE-WARN:"

private val logger: Logger = Logger.getLogger("SmartLifePatches")

internal fun logInfo(message: String) = logger.info("SmartLifePatches: $message")

internal fun logWarning(message: String) = logger.warning("$WARN_MARKER $message")

internal val Method.signature: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Every method [fingerprint] matches, logged with their count.
 *
 * Obfuscated app code is routinely inlined or duplicated by R8 between releases (SmartLife
 * 7.12.6 split the AI-enabled check into two identical copies), and a plain `.method` then
 * silently patches only the first copy. Patches that guard a behaviour should patch every match.
 *
 * @param expectUnique log a warning when the count is not exactly one.
 */
internal fun BytecodePatchContext.matchAllLogged(
    fingerprint: Fingerprint,
    label: String,
    expectUnique: Boolean = false,
): List<Match> {
    // The patch context is passed implicitly (context parameter).
    val matches = fingerprint.matchAllOrNull().orEmpty()
    logInfo("$label: ${matches.size} match(es) " +
        matches.joinToString(prefix = "[", postfix = "]") { it.originalMethod.signature })
    if (expectUnique && matches.size != 1) {
        logWarning("$label: expected exactly 1 match but found ${matches.size}")
    }
    return matches
}

/**
 * The single method [fingerprint] matches. Throws when there is none, and logs a warning when
 * there are several (the first one is used, like `.method` does, but no longer silently).
 */
internal fun BytecodePatchContext.uniqueMatch(fingerprint: Fingerprint, label: String): Match =
    matchAllLogged(fingerprint, label, expectUnique = true).firstOrNull()
        ?: throw PatchException("$label: no method matched")

private fun parameterSizes(method: Method): List<Int> =
    method.parameterTypes.map { val t = it.toString(); if (t == "J" || t == "D") 2 else 1 }

private fun parameterRegisterCount(method: Method): Int =
    parameterSizes(method).sum() + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1

/** Register number (vN) of parameter [index] (0-based, not counting `this`) of [method]. */
internal fun parameterRegister(method: Method, index: Int): Int {
    val thisSize = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val offset = thisSize + parameterSizes(method).take(index).sum()
    return method.implementation!!.registerCount - parameterRegisterCount(method) + offset
}

/** Number of non-parameter (local) registers of [method]. */
internal fun localRegisterCount(method: Method): Int =
    method.implementation!!.registerCount - parameterRegisterCount(method)
