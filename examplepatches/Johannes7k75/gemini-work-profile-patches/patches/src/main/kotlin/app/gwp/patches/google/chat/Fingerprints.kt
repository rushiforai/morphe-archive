package app.gwp.patches.google.chat

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Server "punt type" used for "Update required for this conversation" (verified with debug logging,
 * 2026-11-10): adds the punt card (title/body/"Update app" button) and hides the input plate.
 */
internal const val PUNT_TYPE_SHOW_THREAD_WITH_PUNT = 1

/** Value of the server "punt type" that shows a disclaimer card and disables the input plate. */
internal const val PUNT_TYPE_DISABLED_INPUT_PLATE = 4

/**
 * Server "punt type" enum of a Gemini conversation (proto enum, obfuscated name):
 *
 * ```
 * UNKNOWN(0), SHOW_THREAD_WITH_PUNT(1), HIDE_THREAD_WITH_PUNT(2),
 * SHOW_THREAD_WITH_DISCLAIMER(3), SHOW_THREAD_WITH_DISCLAIMER_AND_DISABLED_INPUT_PLATE(4)
 * ```
 * The server sends type 1 for chats it considers "created with a newer version of Gemini"
 * ("Für die Unterhaltung ist ein Update erforderlich" + "App aktualisieren"); type 1 adds the punt card
 * (`puntDisclaimer`) and, like type 2, hides the input plate. Type 4 also disables the input plate.
 */
internal object PuntTypeEnumFingerprint : Fingerprint(
    strings = listOf("SHOW_THREAD_WITH_DISCLAIMER_AND_DISABLED_INPUT_PLATE", "HIDE_THREAD_WITH_PUNT"),
)

/** forNumber(int): the generated proto lookup every punt check goes through. */
internal object PuntTypeForNumberFingerprint : Fingerprint(
    classFingerprint = PuntTypeEnumFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("I"),
    custom = { method, classDef -> method.returnType == classDef.type },
)
