package app.markpaul099.patches.gboard.gif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Matches every Tenor request builder (GIF search, sticker search, categories).
 * Each one adds the query parameter like this:
 *
 * ```
 * builder.put("contentfilter", contentFilterLevel)
 * ```
 *
 * where `contentFilterLevel` comes from the server flag `tenor_content_filter_level`
 * (default "medium").
 */
object TenorContentFilterParamFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(),
    filters = listOf(
        string("contentfilter"),
        methodCall(
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            returnType = "V",
            location = MatchAfterWithin(5)
        )
    )
)


/**
 * Builds the Uri of every Tenor request:
 *
 * ```
 * Uri.Builder builder = Uri.parse(request.baseUrl()).buildUpon();
 * for (param : request.params()) builder.appendQueryParameter(key, value);
 * return builder.build();
 * ```
 */
object TenorRequestUriFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/net/Uri;",
    parameters = listOf("L"),
    filters = listOf(
        methodCall(definingClass = "Landroid/net/Uri;", name = "parse"),
        methodCall(name = "buildUpon", location = MatchAfterWithin(2)),
        methodCall(definingClass = "Landroid/net/Uri\$Builder;", name = "appendQueryParameter"),
        methodCall(definingClass = "Landroid/net/Uri\$Builder;", name = "build"),
        opcode(Opcode.RETURN_OBJECT, location = MatchAfterWithin(2))
    )
)

/**
 * TenorResult.parse: `new JSONObject(response.body())`.
 */
object TenorResponseParseFingerprint : Fingerprint(
    strings = listOf("results", "media_formats"),
    filters = listOf(
        methodCall(
            definingClass = "Lorg/json/JSONObject;",
            name = "<init>",
            parameters = listOf("Ljava/lang/String;")
        )
    )
)
