package app.tikkamasalla.stremio.progress;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentSender;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

/**
 * Learns which player the user picks in Android's "Open with" chooser. MX Player only returns a
 * result (and so progress) for http streams when it is addressed by component, and a launch that
 * goes through the system resolver has none. When the resolver would be shown and an MX Player
 * (free or pro) is among its candidates, the launch intent is turned into a chooser that reports
 * the picked component; ExternalProgress then remembers an MX pick so the next launch addresses
 * it directly. Nothing changes for Vimu or any launch that already names a player.
 */
final class ChooserPick {
    private static final String TAG = "ExtProgress";
    static final String ACTION = "app.tikkamasalla.stremio.progress.CHOSEN_PLAYER";

    private static volatile boolean registered;

    private ChooserPick() {
    }

    /** MX package (free/pro) from a picked package, else null: only MX is remembered. */
    static String rememberable(String pkg) {
        return ExternalProgress.Players.mxActivity(pkg) != null ? pkg : null;
    }

    /**
     * The chooser is worth showing only for a launch that would go to the system resolver (no
     * package, no component, resolves to the resolver) and has an MX Player among the candidates.
     */
    static boolean shouldWrap(boolean named, String resolvedTarget, List<String> candidatePackages) {
        if (named || resolvedTarget == null || !ExternalProgress.Players.isResolver(resolvedTarget)) {
            return false;
        }
        if (candidatePackages != null) {
            for (String pkg : candidatePackages) {
                if (rememberable(pkg) != null) return true;
            }
        }
        return false;
    }

    /**
     * Rewrites the launch intent, in place, into an ACTION_CHOOSER intent around a copy of itself
     * that reports the picked component. The activity result of the picked player still reaches
     * the caller. Returns false (intent untouched) on any problem or an API below 22.
     */
    static boolean wrapInPlace(Context context, Intent intent) {
        try {
            if (context == null || intent == null || Build.VERSION.SDK_INT < 22) return false;
            List<String> candidates = new ArrayList<String>();
            List<ResolveInfo> found = context.getPackageManager().queryIntentActivities(intent, 0);
            if (found != null) {
                for (ResolveInfo info : found) {
                    if (info != null && info.activityInfo != null) candidates.add(info.activityInfo.packageName);
                }
            }
            if (!shouldWrap(intent.getComponent() != null || intent.getPackage() != null,
                    resolverOf(context, intent), candidates)) {
                return false;
            }
            ensureReceiver(context);
            Intent callback = new Intent(ACTION).setPackage(context.getPackageName());
            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= 31) flags |= PendingIntent.FLAG_MUTABLE; // the system adds the pick
            IntentSender sender = PendingIntent.getBroadcast(context, 0, callback, flags).getIntentSender();
            Intent chooser = Intent.createChooser(new Intent(intent), null, sender);
            intent.setComponent(null);
            intent.setPackage(null);
            intent.setDataAndType(null, null);
            intent.setAction(chooser.getAction());
            intent.replaceExtras(chooser.getExtras());
            intent.setFlags(chooser.getFlags());
            Log.i(TAG, "chooser wrapped: pick is reported (mx candidates " + candidates.size() + ")");
            return true;
        } catch (Throwable error) {
            Log.w(TAG, "chooser wrap", error);
            return false;
        }
    }

    private static String resolverOf(Context context, Intent intent) {
        ResolveInfo info = context.getPackageManager().resolveActivity(intent, 0);
        return info != null && info.activityInfo != null ? info.activityInfo.packageName : null;
    }

    private static void ensureReceiver(Context context) {
        if (registered) return;
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context ctx, Intent data) {
                try {
                    ComponentName picked = data == null ? null
                            : (ComponentName) data.getParcelableExtra(Intent.EXTRA_CHOSEN_COMPONENT);
                    ExternalProgress.onChosen(picked == null ? null : picked.getPackageName(),
                            picked == null ? null : picked.getClassName());
                } catch (Throwable error) {
                    Log.w(TAG, "chooser pick", error);
                }
            }
        };
        IntentFilter filter = new IntentFilter(ACTION);
        if (Build.VERSION.SDK_INT >= 33) {
            context.registerReceiver(receiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            context.registerReceiver(receiver, filter);
        }
        registered = true;
    }
}
