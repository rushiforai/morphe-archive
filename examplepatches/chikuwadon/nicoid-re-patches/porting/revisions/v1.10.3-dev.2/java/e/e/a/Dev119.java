package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.os.PowerManager;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/** Issue #112: keep normal-player audio through screen-off without mode switching. */
public final class Dev119 {
    public static final String KEY = "nicoid_keep_audio_screen_off";
    private Dev119() {}

    private static String text(Context c, String japanese, String english, String traditional) {
        String language = c.getResources().getConfiguration().locale.getLanguage();
        return "ja".equals(language) ? japanese : "zh".equals(language) ? traditional : english;
    }

    public static void installSettings(PreferenceActivity activity) {
        if (activity.findPreference(KEY) != null) return;
        Preference group = activity.findPreference("setting_whole");
        if (!(group instanceof PreferenceGroup)) return;
        CheckBoxPreference option = new CheckBoxPreference(activity);
        option.setKey(KEY);
        option.setTitle(text(activity, "画面OFF時も音声を再生", "Play audio when screen is off", "關閉螢幕時繼續播放音訊"));
        option.setSummary(text(activity,
            "通常再生中に画面を消しても音声を再生し続けます",
            "Continue audio during normal playback when the screen turns off",
            "一般播放時關閉螢幕後繼續播放音訊"));
        option.setDefaultValue(Boolean.FALSE);
        ((PreferenceGroup)group).addPreference(option);
    }

    public static boolean shouldRetain(boolean enabled, boolean screenInteractive,
            boolean playing, boolean finishing) {
        return enabled && !screenInteractive && playing && !finishing;
    }

    /** Runs before the fragment's native pause/teardown path.
     * Do not create a background player, change playback mode, or revive paused videos. */
    public static boolean retainWhenScreenOff(Object fragment) {
        if (fragment == null) return false;
        try {
            Field owner = fragment.getClass().getField("A1");
            Activity activity = (Activity)owner.get(fragment);
            if (activity == null || activity.isFinishing() || activity.isDestroyed() ||
                    activity.isChangingConfigurations()) return false;
            boolean enabled = PreferenceManager.getDefaultSharedPreferences(activity)
                .getBoolean(KEY, false);
            if (!enabled) return false;
            PowerManager power = (PowerManager)activity.getSystemService(Context.POWER_SERVICE);
            if (power == null || power.isInteractive()) return false;
            Field video = fragment.getClass().getField("a0");
            Object player = video.get(fragment);
            if (player == null) return false;
            Method isPlaying = player.getClass().getMethod("isPlaying");
            boolean playing = Boolean.TRUE.equals(isPlaying.invoke(player));
            boolean retain = shouldRetain(enabled, power.isInteractive(), playing, false);
            if (retain) android.util.Log.d("nicoid-screen-audio",
                "Retaining normal playback while display is off");
            return retain;
        } catch (Exception error) {
            android.util.Log.w("nicoid-screen-audio", "Screen-off audio guard skipped", error);
            return false;
        }
    }
}
