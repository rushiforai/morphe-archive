package app.tikkamasalla.stremio.progress

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

private const val CONTRACT = "Lcom/stremio/common/players/ExternalPlayerContract;"
private const val INPUT = "Lcom/stremio/common/players/ExternalPlayerContract\$ExternalPlayerInput;"
private const val RESULT = "Lcom/stremio/common/players/ExternalPlayerContract\$ExternalPlayerResult;"
private const val EXTENSION = "Lapp/tikkamasalla/stremio/progress/ExternalProgress;"

/** "Play in external player" inside the player: snapshot media and subtitle state first. */
object OpenInExternalPlayerFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerFragment;",
    name = "openInExternalPlayer",
    parameters = listOf("Ljava/lang/Long;"),
)

/** Builds the Intent that starts the external player. (Legacy) */
object CreateIntentFingerprint : Fingerprint(
    definingClass = CONTRACT,
    name = "createIntent",
    parameters = listOf("Landroid/content/Context;", INPUT),
)

/** Turns the external player's result Intent into position, duration and completed. (Legacy) */
object ParseResultFingerprint : Fingerprint(
    definingClass = CONTRACT,
    name = "parseResult",
    returnType = RESULT,
    parameters = listOf("I", "Landroid/content/Intent;"),
)

/** The player screen's handler for the external player's result: marks watched, then opens the next episode. */
object ExternalPlayerResultFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerFragment;",
    name = "onExternalPlayerResult",
    parameters = listOf(RESULT),
)

/** The single call that records progress in Stremio's core (also used by the internal player). */
object PlayerTimeChangedFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/common/api/StremioApi;",
    name = "playerTimeChanged",
    parameters = listOf("J", "J"),
)

/** Builds the Intent that starts the external player (Obfuscated/R8). */
object ExtCreateIntentFingerprint : Fingerprint(
    returnType = "Landroid/content/Intent;",
    strings = listOf("return_result", "startfrom"),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 2
    }
)

/** Turns the external player's result Intent into position, duration and completed (Obfuscated/R8). */
object ExtParseTypedFingerprint : Fingerprint(
    strings = listOf("extra_position", "com.mxtech.intent.result.VIEW"),
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
        method.parameterTypes.map { it.toString() }.toSet() == setOf("I", "Landroid/content/Intent;") &&
        method.returnType.startsWith("L")
    }
)

/** Stub for dynamic instantiation of the result object. */
object ExternalProgressNewResultStub : Fingerprint(
    definingClass = EXTENSION,
    name = "newResult",
    parameters = listOf("J", "J", "Z"),
)

/** Stub to indicate if the stock handler is still hooked. */
object ExternalProgressStockHookStub : Fingerprint(
    definingClass = EXTENSION,
    name = "stockResultHook",
    parameters = emptyList(),
)
