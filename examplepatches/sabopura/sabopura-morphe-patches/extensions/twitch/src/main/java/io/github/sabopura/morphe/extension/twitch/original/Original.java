package io.github.sabopura.morphe.extension.twitch.original;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ads.AdShield;
import io.github.sabopura.morphe.extension.twitch.chat.ChatSettings;
import io.github.sabopura.morphe.extension.twitch.ui.Text;

/** What the original patches share: the app, its settings and whether it is on screen. */
public final class Original {
    static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Context app;
    private static volatile SharedPreferences prefs;
    private static volatile WeakReference<Activity> resumed = new WeakReference<>(null);
    private static boolean restored;

    private Original() {
    }

    /** Injection point: Twitch asks its chat client to join a channel; a refused join has no name. */
    public static void onChannelJoin(Object channelId, String channelName) {
        if (channelName == null || channelName.isEmpty()) return;
        try {
            ChannelProfiles.onChannel(String.valueOf(channelId), channelName);
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.channel-join", e);
        }
    }

    /** Injection point: start of TwitchApplication.onCreate. */
    public static void initialize(Context context) {
        try {
            Text.use(context);
            Context application = context.getApplicationContext();
            app = application;
            prefs = ChatSettings.preferences(application);
            ((Application) application).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    resumed = new WeakReference<>(activity);
                    try {
                        PlayerWatch.ensure();
                        if (!restored) {
                            restored = true;
                            ChannelProfiles.restoreAfterRestart();
                        }
                    } catch (RuntimeException | LinkageError e) {
                        Diagnostics.note("original.activity-resumed", e);
                    }
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (resumed.get() == activity) resumed = new WeakReference<>(null);
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("original.initialize", e);
        }
    }

    static Context app() {
        return app;
    }

    static SharedPreferences prefs() {
        return prefs;
    }

    /** The activity on screen, or null while the app is in the background. */
    static Activity activity() {
        return resumed.get();
    }

    static boolean foreground() {
        return activity() != null;
    }

    static void onMain(Runnable action) {
        if (Looper.myLooper() == Looper.getMainLooper()) action.run();
        else MAIN.post(action);
    }

    /** True while a stitched ad is being covered; must be called on the main thread. */
    static boolean adCoverUp() {
        Activity activity = activity();
        return activity != null && activity.getWindow() != null && coverShown(activity.getWindow().getDecorView());
    }

    private static boolean coverShown(View view) {
        if (view instanceof AdShield) return view.getVisibility() == View.VISIBLE && view.isShown();
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) if (coverShown(group.getChildAt(i))) return true;
        }
        return false;
    }
}
