package app.noam.extension.chesscom.discord;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;

/**
 * The Discord application this bundle talks to. The patch writes its id into the callback
 * activity's meta-data, so the phone and the browser agree on one redirect without a second copy
 * of the id inside the extension.
 */
final class DiscordApp {
    static final String META_DATA = "morphe_discord_client_id";
    static final String AUTHORIZE_ENDPOINT = "https://discord.com/oauth2/authorize";
    static final String TOKEN_ENDPOINT = "https://discord.com/api/oauth2/token";
    static final String USER_ENDPOINT = "https://discord.com/api/v10/users/@me";
    /** OpenID and the presence scope the Discord Social SDK itself hands out. */
    static final String SCOPES = "openid identify sdk.social_layer_presence";
    static final String USER_AGENT = "Discord-Android/1.0 (chess.com)";
    /** What Discord puts before the details line; the application's own name wins where it has one. */
    static final String NAME = "chess.com";

    private static String clientId;

    private DiscordApp() {}

    /** The bundle's Discord application id, or "" when the app was patched without one. */
    static String clientId(Context context) {
        if (clientId == null) clientId = readClientId(context);
        return clientId;
    }

    static boolean configured(Context context) {
        return !clientId(context).isEmpty();
    }

    /** Discord's mobile redirect for this application: "discord-&lt;id&gt;:/authorize/callback". */
    static String redirectUri(Context context) {
        return "discord-" + clientId(context) + ":/authorize/callback";
    }

    private static String readClientId(Context context) {
        try {
            ActivityInfo info = context.getPackageManager().getActivityInfo(
                new ComponentName(context, DiscordCallbackActivity.class), PackageManager.GET_META_DATA);
            Bundle meta = info.metaData;
            String id = meta == null ? null : meta.getString(META_DATA);
            return id == null ? "" : id.trim();
        } catch (Throwable throwable) {
            // The patched app was built without a Discord application: nothing can be connected.
            return "";
        }
    }
}
