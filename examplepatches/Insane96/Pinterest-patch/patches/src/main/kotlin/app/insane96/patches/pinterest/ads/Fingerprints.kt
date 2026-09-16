package app.insane96.patches.pinterest.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches the method in PinDeserializer that turns a JSON array of feed / search /
 * related-Pins items into the List of Pin ("me") objects that gets displayed.
 *
 * The method itself is obfuscated (its name is a single letter and can change between
 * app builds), so instead of matching by name this fingerprints on:
 *  - the un-obfuscated defining class,
 *  - the two string literals the method checks ("type" / "pin") to pick array elements
 *    that represent a Pin,
 *  - the single List.add() (invoke-interface) call in the method, which is the exact
 *    point where each deserialized Pin gets appended to the result list.
 *
 * Built and verified against Pinterest 14.35.0 (versionCode 14358020).
 */
object PinListFingerprint : Fingerprint(
    definingClass = "Lcom/pinterest/api/model/deserializer/PinDeserializer;",
    returnType = "Ljava/util/List;",
    // Single parameter is an obfuscated JSON-array-reader type, match any object type.
    parameters = listOf("L"),
    filters = listOf(
        string("type"),
        string("pin"),
        opcode(Opcode.INVOKE_INTERFACE),
    )
)
