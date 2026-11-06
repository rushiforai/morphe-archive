package me.dyskal.ytmrpc;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.Uri;

import androidx.browser.customtabs.CustomTabsClient;
import androidx.browser.customtabs.CustomTabsIntent;

/** App-first OAuth, using the same native route as Discord's Android Social SDK. */
final class DiscordAuthLauncher {
    private DiscordAuthLauncher() { }

    private static Activity activity(Context context) {
        while (!(context instanceof Activity) && context instanceof ContextWrapper) {
            Context base = ((ContextWrapper) context).getBaseContext();
            if (base == context) break;
            context = base;
        }
        return context instanceof Activity ? (Activity) context : null;
    }

    static int taskId(Context context) {
        Activity activity = activity(context);
        return activity == null ? -1 : activity.getTaskId();
    }

    static void launch(Context context, String browserUrl) {
        Activity activity = activity(context);
        if (activity != null) context = activity;
        int flags = context instanceof Activity ? 0 : Intent.FLAG_ACTIVITY_NEW_TASK;
        try {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(DiscordOAuth.appAuthorizeUrl(browserUrl)))
                    .setPackage("com.discord").addFlags(flags));
            DiscordDiagnostics.info("Authorization opened in Discord");
            return;
        } catch (ActivityNotFoundException | SecurityException ignored) { /* Browser fallback below. */ }

        try {
            String browser = CustomTabsClient.getPackageName(context, null);
            if (browser != null) {
                CustomTabsIntent tab = new CustomTabsIntent.Builder().setShareState(CustomTabsIntent.SHARE_STATE_OFF).build();
                tab.intent.setPackage(browser).addFlags(flags);
                tab.launchUrl(context, Uri.parse(browserUrl));
                DiscordDiagnostics.info("Authorization opened in browser tab");
                return;
            }
        } catch (ActivityNotFoundException | SecurityException ignored) { /* Plain browser fallback below. */ }
        context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(browserUrl)).addFlags(flags));
        DiscordDiagnostics.info("Authorization opened in browser");
    }
}
