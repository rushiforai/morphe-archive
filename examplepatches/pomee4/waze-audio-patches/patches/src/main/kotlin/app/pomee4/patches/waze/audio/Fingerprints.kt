package app.pomee4.patches.waze.audio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * `SdkConfiguration.updateAppList()`, which rebuilds the map of audio partner apps
 * from the server configuration. The class and method names are not obfuscated.
 *
 * ```java
 * appConfigs = new HashMap();
 * for (...) appConfigs.put(pkg, new au(pkg, name, scope, installUrl, null));
 * savePackageScopesToSharedPref();
 * ```
 */
internal object UpdateAppListFingerprint : Fingerprint(
    definingClass = "Lcom/waze/sdk/SdkConfiguration;",
    name = "updateAppList",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        // sget-object appConfigs
        fieldAccess(
            opcode = Opcode.SGET_OBJECT,
            definingClass = "this",
            type = "Ljava/util/Map;",
        ),
        // new au(String packageName, String appName, int scopes, String installUrl, byte[] unused)
        methodCall(
            opcode = Opcode.INVOKE_DIRECT_RANGE,
            name = "<init>",
            parameters = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "I",
                "Ljava/lang/String;",
                "[B",
            ),
        ),
        methodCall(
            definingClass = "this",
            name = "savePackageScopesToSharedPref",
        ),
        // The instruction the patch is inserted before.
        opcode(Opcode.MONITOR_EXIT, MatchAfterImmediately()),
        string("updateAppList: at least one of the sdkConfigs is not initialized"),
    )
)

/**
 * Connects to an audio partner app.
 *
 * ```java
 * final boolean e(String packageName, String token, Runnable onTimeout) {
 *     boolean isSpotify = "com.spotify.music".equals(packageName);
 *     Intent intent = g(packageName, token); // com.waze.sdk.audio.ACTION_INIT broadcast
 *     ...
 *     handler.postDelayed(timeout, 15000L);
 * }
 * ```
 */
internal object ConnectAudioPartnerFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Runnable;"),
    filters = listOf(
        string("com.spotify.music"),
        literal(15000L),
    )
)

/**
 * In the same class as [ConnectAudioPartnerFingerprint]: whether an app has a receiver for the
 * `com.waze.sdk.audio.ACTION_INIT` broadcast, which Waze treats as "this partner app is installed".
 *
 * ```java
 * final boolean d(String packageName) {
 *     return f(g(packageName, null));
 * }
 * ```
 */
internal object IsAudioPartnerInstalledFingerprint : Fingerprint(
    classFingerprint = ConnectAudioPartnerFingerprint,
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "this",
            returnType = "Landroid/content/Intent;",
        ),
        methodCall(
            definingClass = "this",
            parameters = listOf("Landroid/content/Intent;"),
            returnType = "Z",
        ),
    )
)

/**
 * Called when a partner app binds to `com.waze.sdk.SdkService` and registers itself.
 * Creates the connected app session and activates it.
 *
 * ```java
 * final boolean P(Resources resources, String packageName, String token, Bundle options, Messenger messenger)
 * ```
 */
internal object RegisterAudioPartnerFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/res/Resources;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
        "Landroid/os/Messenger;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/waze/sdk/SdkConfiguration;",
            name = "getAppConfig",
        ),
        methodCall(
            definingClass = "Lcom/waze/sdk/SdkConfiguration;",
            name = "isWhiteListed",
        ),
    )
)
