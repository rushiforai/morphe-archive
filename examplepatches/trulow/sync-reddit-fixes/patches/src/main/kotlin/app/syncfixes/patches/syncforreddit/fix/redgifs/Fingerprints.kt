package app.syncfixes.patches.syncforreddit.fix.redgifs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.syncfixes.patches.syncforreddit.shared.Constants.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Sync keeps its source file names, so classes are matched by them. Obfuscated names differ between
 * Sync and Sync Pro (for example LinkHandler is y7/a and j7/a, OkHttpHelper a8/a and l7/a).
 */
internal const val OKHTTP_CLIENT = "Lokhttp3/OkHttpClient;"
internal const val OKHTTP_CLIENT_BUILDER = "Lokhttp3/OkHttpClient\$Builder;"
internal const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/FixRedgifsApiPatch;"

/** The Volley network that sends Sync's requests (Redgifs included) through OkHttpHelper's client getter. */
internal object VolleyClientGetterCallFingerprint : Fingerprint(
    definingClass = "Lcom/android/volley/toolbox/BasicNetwork;",
    filters = listOf(
        methodCall(
            returnType = OKHTTP_CLIENT,
            parameters = listOf(),
            opcodes = listOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE),
        ),
    ),
)

/** AccountSingleton's user agent getter, the user agent Sync sends everywhere. */
internal object UserAgentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { _, classDef -> classDef.sourceFile == "AccountSingleton.java" },
)

/** The extension's placeholder for Sync's user agent. */
internal object ExtensionUserAgentFingerprint : Fingerprint(
    definingClass = EXTENSION_CLASS,
    name = "defaultUserAgent",
)

/** LinkHandler.getGfycatId(url), which supplies the id of the /v2/gifs/{id} request. */
internal object GetGfycatIdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("-size_restricted", "-max-1mb-poster"),
    custom = { _, classDef -> classDef.sourceFile == "LinkHandler.java" },
)
