package e.e.a;

import android.app.Service;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.media.AudioManager;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.view.View;
import java.lang.reflect.Method;

/** Optional audio focus for normal, popup and background playback. */
public final class Dev131 {
    public static final String KEY = "nicoid_audio_focus_enabled";
    private Dev131() {}

    public static boolean enabled(Context context) {
        return context != null && PreferenceManager.getDefaultSharedPreferences(context)
                .getBoolean(KEY, false);
    }

    public static void installSettings(PreferenceActivity activity) {
        if (activity == null || activity.findPreference(KEY) != null) return;
        Preference group = activity.findPreference("nicoid_content_filter");
        if (!(group instanceof PreferenceGroup)) return;
        CheckBoxPreference item = new CheckBoxPreference(activity);
        item.setKey(KEY);
        item.setTitle(Dev112.tr(activity,
                "オーディオフォーカス",
                "Audio focus",
                "音訊焦點"));
        item.setSummary(Dev112.tr(activity,
                "ONの場合、動画再生時に他のアプリとの音声再生を調整します",
                "When on, coordinate audio playback with other apps",
                "開啟後，播放影片時會協調與其他應用程式的音訊播放"));
        item.setDefaultValue(Boolean.FALSE);
        item.setOrder(((PreferenceGroup)group).getPreferenceCount());
        ((PreferenceGroup)group).addPreference(item);
    }

    /** A background service has its own native focus listener. */
    private static boolean ownedByService(Context context) {
        for (int n = 0; context != null && n < 8; n++) {
            if (context instanceof Service) return true;
            if (!(context instanceof ContextWrapper)) return false;
            Context base = ((ContextWrapper)context).getBaseContext();
            if (base == context) return false;
            context = base;
        }
        return false;
    }

    /** Called immediately before VideoView's own AudioFocusHelper.requestFocus(). */
    public static void applyToPlayer(View video) {
        if (video == null) return;
        Context context = video.getContext();
        boolean handle = enabled(context) && !ownedByService(context);
        try {
            Method setter = video.getClass().getMethod("setHandleAudioFocus", boolean.class);
            setter.invoke(video, Boolean.valueOf(handle));
        } catch (ReflectiveOperationException error) {
            android.util.Log.w("nicoid-audio-focus", "Video focus option unavailable", error);
        }
    }

    /** Keep the service's own listener; do not also enable the VideoView helper. */
    public static int requestServiceFocus(Context context, AudioManager manager,
            AudioManager.OnAudioFocusChangeListener listener, int streamType, int duration) {
        if (!enabled(context) || manager == null || listener == null) {
            return AudioManager.AUDIOFOCUS_REQUEST_FAILED;
        }
        return manager.requestAudioFocus(listener, streamType, duration);
    }
}
