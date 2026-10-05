package e.e.a;

import android.app.AlertDialog;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.preference.ListPreference;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.util.WeakHashMap;

/** Exact nicoid 6.49 field names; the patch verifies the input before installing. */
public final class ModernEnhancements {
    private static final float[] SPEEDS = PlaybackSession.SPEEDS;
    private static final float[] SIZES = {.6f, .8f, 1f, 1.2f, 1.4f};
    private static final WeakHashMap<Object, State> STATES = new WeakHashMap<>();
    private static final class State {
        long seek = -1;
        boolean resume;
        boolean unplugged;
        int generation;
        boolean alive = true;
        Button quality, speed, loop;
    }
    private static Object get(Object o, String name) throws Exception {
        return o.getClass().getField(name).get(o);
    }
    private static void set(Object o, String name, Object value) throws Exception {
        o.getClass().getField(name).set(o, value);
    }
    private static Object call(Object o, String name, Class<?>[] types, Object... args) throws Exception {
        return o.getClass().getMethod(name, types).invoke(o, args);
    }
    private static SharedPreferences prefs(Context c) {
        return PreferenceManager.getDefaultSharedPreferences(c);
    }
    public static float commentSize(Context context, float base) {
        String value = prefs(context).getString("comment_size_level", "2");
        try { return base * SIZES[Math.max(0, Math.min(4, Integer.parseInt(value)))]; }
        catch (RuntimeException ex) { return base; }
    }
    public static void settings(PreferenceActivity activity) {
        UiStrings.selectLanguage(prefs(activity).getString("app_lang", "0"));
        PlaybackSession.settings(activity);
        LoginSupport.settings(activity);
        ContentFilter.settings(activity);
        CacheFolders.settings(activity);
        ListPreference quality = (ListPreference) activity.findPreference("quality_mode");
        if (quality != null) {
            CharSequence[] labels = new CharSequence[]{"最大画質", "高画質", "標準画質", "低画質"};
            try {
                for (int i = 0; i < 3; i++) {
                    String label = (String) Class.forName("e.e.a.ModernControls")
                        .getMethod("qualityOption", int.class).invoke(null, i);
                    if (label.contains("（")) labels[i + 1] = label;
                    if (i == 0 && label.contains("（")) labels[0] = UiStrings.translate("最大画質") + label.substring(label.indexOf("（"));
                }
            } catch (Exception ignored) { }
            quality.setEntries(labels);
            quality.setSummary("%s");
        }
        Preference disconnect = activity.findPreference("google_cast_disconnect");
        if (disconnect != null) disconnect.setOnPreferenceClickListener(p -> {
            try {
                activity.stopService(new Intent(activity,
                    Class.forName("com.sauzask.nicoid.NicoidChormecastSenderService")));
            } catch (Exception ex) { error(activity, ex); }
            return true;
        });
    }
    public static void attach(Object object) {
        Service service = (Service) object;
        UiStrings.selectLanguage(prefs(service).getString("app_lang", "0"));
        try {
            View root = (View) get(object, "a");
            PlayerIcons.attach(root);
            if (root instanceof PopupPinchLayout) ((PopupPinchLayout) root).bind(object);
            int id = service.getResources().getIdentifier("topmenulay", "id", service.getPackageName());
            View controller = root.findViewById(id);
            if (!(controller instanceof RelativeLayout) || root.findViewWithTag("popup-modern-controls") != null) return;
            State state = new State();
            STATES.put(object, state);
            LinearLayout row = new LinearLayout(service);
            row.setTag("popup-modern-controls");
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(android.view.Gravity.RIGHT | android.view.Gravity.CENTER_VERTICAL);
            state.speed = button(service, row, "速度", () -> choose(object, 1));
            state.quality = button(service, row, "画質", () -> choose(object, 0));
            state.loop = button(service, row, "ループ", () -> {
                try {
                    boolean enabled = !(Boolean) get(object, "v");
                    set(object, "v", enabled);
                    call(get(object, "e"), "setRepeatMode", new Class<?>[]{int.class}, enabled ? 1 : 0);
                    prefs(service).edit().putBoolean("player_isloop", enabled).apply();
                    update(object);
                } catch (Exception ex) { error(service, ex); }
            });
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2,
                Math.round(44 * service.getResources().getDisplayMetrics().density));
            params.addRule(RelativeLayout.ALIGN_PARENT_TOP);
            params.addRule(RelativeLayout.LEFT_OF, service.getResources().getIdentifier("commentbutton", "id", service.getPackageName()));
            ((RelativeLayout) controller).addView(row, params);
            update(object);
            PopupOverlay.attach(root);
        } catch (Exception ex) { error(service, ex); }
    }
    private static Button button(Context c, LinearLayout row, String title, Runnable action) {
        Button b = new Button(c);
        b.setText(title);
        b.setContentDescription(title);
        b.setTextColor(0xffffffff);
        b.setTextSize(14);
        b.setTypeface(android.graphics.Typeface.DEFAULT, android.graphics.Typeface.BOLD);
        b.setAllCaps(false);
        b.setMinimumWidth(0);
        b.setMinimumHeight(0);
        b.setSingleLine(true);
        b.setShadowLayer(0, 0, 0, 0);
        b.setPadding(0, 0, 0, 0);
        b.setBackgroundColor(0x00000000);
        b.setOnClickListener(v -> action.run());
        int height = Math.round(44 * c.getResources().getDisplayMetrics().density);
        int width = Math.round(56 * c.getResources().getDisplayMetrics().density);
        row.addView(b, new LinearLayout.LayoutParams(width, height));
        return b;
    }
    private static void choose(Object object, int mode) {
        PlaybackSession.interaction(object,true);
        Service service = (Service) object;
        try {
            if(mode==1){SpeedSlider.show(service,"再生速度",speed(),true,s->{try{PlaybackSession.setSpeed(get(object,"e"),s);update(object);}catch(Exception ex){error(service,ex);}});return;}
            String[] labels;
            int selected = 1;
            if (mode == 1) {
                labels = PlaybackSession.LABELS;
                float current = speed();
                for (int i = 0; i < SPEEDS.length; i++) if (SPEEDS[i] == current) selected = i;
            } else {
                Class<?> controls = Class.forName("e.e.a.ModernControls");
                labels = new String[3];
                for (int i = 0; i < 3; i++) labels[i] = (String) controls.getMethod("qualityOption", int.class).invoke(null, i);
                int current = (Integer) get(get(object, "z"), "e");
                selected = current == 4 ? 2 : current == 3 ? 1 : 0;
            }
            AlertDialog dialog = new AlertDialog.Builder(PlaybackSession.dialogContext(service))
                .setTitle(mode == 1 ? "再生速度" : "画質")
                .setSingleChoiceItems(labels, selected, (d, index) -> {
                    d.dismiss();
                    if (mode == 1) {
                        try {
                            float speed = SPEEDS[index];
                            Class.forName("e.e.a.ModernControls").getField("speed").setFloat(null, speed);
                            call(get(object, "e"), "setPlaybackSpeed", new Class<?>[]{float.class}, speed);
                            update(object);
                        } catch (Exception ex) { error(service, ex); }
                    } else quality(object, index);
                }).setNegativeButton("キャンセル", null).create();
            dialog.getWindow().setType(Build.VERSION.SDK_INT >= 26 ?
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY : WindowManager.LayoutParams.TYPE_PHONE);
            dialog.show();
            PlaybackSession.styleDialog(dialog);
        } catch (Exception ex) { error(service, ex); }
    }
    private static float speed() throws Exception {
        float result = Class.forName("e.e.a.ModernControls").getField("speed").getFloat(null);
        return result > 0 ? result : 1f;
    }
    private static void quality(Object object, int index) {
        Service service = (Service) object;
        try {
            State state = STATES.get(object);
            if (state == null || !state.alive) return;
            Object model = get(object, "z");
            Object player = get(object, "e");
            String video = (String) get(object, "f");
            if (model == null || player == null || video == null) return;
            int quality = index == 0 ? 0 : index == 1 ? 3 : 4;
            int previous = (Integer) get(model, "e");
            if (previous == quality) return;
            long position = (Long) call(player, "getCurrentPosition", new Class<?>[0]);
            boolean playing = (Boolean) call(player, "isPlaying", new Class<?>[0]);
            state.unplugged = false;
            int generation = ++state.generation;
            set(model, "e", quality);
            new Thread(() -> {
                try {
                    String url = (String) Class.forName("e.e.a.ModernPlayback")
                        .getMethod("stream", model.getClass(), String.class).invoke(null, model, video);
                    ((Handler) get(object, "c")).post(() -> {
                        try {
                            if (!state.alive || state.generation != generation || !video.equals(get(object, "f"))) return;
                            if (url == null || url.isEmpty()) { set(model, "e", previous); throw new IllegalStateException("画質を取得できませんでした"); }
                            state.seek = position;
                            state.resume = playing && !state.unplugged;
                            call(object, "c", new Class<?>[]{String.class}, url);
                            update(object);
                        } catch (Exception ex) { error(service, ex); }
                    });
                } catch (Exception ex) {
                    ((Handler) new Handler(service.getMainLooper())).post(() -> {
                        try { if (state.generation == generation) set(model, "e", previous); }
                        catch (Exception ignored) { }
                        error(service, ex);
                    });
                }
            }, "nicoid-popup-quality").start();
        } catch (Exception ex) { error(service, ex); }
    }
    public static void prepared(Object object) {
        PlaybackSession.prepared(object, true);
        try {
            Object player = get(object, "e");
            call(player, "setPlaybackSpeed", new Class<?>[]{float.class}, speed());
            State state = STATES.get(object);
            if (state != null && state.seek >= 0) {
                call(player, "seekTo", new Class<?>[]{long.class}, state.seek);
                state.seek = -1;
                call(player, state.resume ? "start" : "pause", new Class<?>[0]);
            }
            update(object);
        } catch (Exception ex) { error((Context) object, ex); }
    }
    public static void destroy(Object object) {
        PlaybackSession.destroy(object, true);
        State state = STATES.remove(object);
        if (state != null) { state.alive = false; state.generation++; }
    }
    public static void noisy(Object object) {
        State state = STATES.get(object);
        if (state != null) { state.resume = false; state.unplugged = true; }
    }
    private static void update(Object object) throws Exception {
        State state = STATES.get(object);
        if (state == null) return;
        Object model = get(object, "z");
        int quality = model == null ? 0 : (Integer) get(model, "e");
        String option = (String) Class.forName("e.e.a.ModernControls").getMethod("qualityOption", int.class)
            .invoke(null, quality == 4 ? 2 : quality == 3 ? 1 : 0);
        java.util.regex.Matcher resolution = java.util.regex.Pattern.compile("[0-9]{3,4}p").matcher(option);
        state.quality.setText(resolution.find() ? resolution.group() : quality == 4 ? "低画質" : quality == 3 ? "標準" : "高画質");
        state.quality.setContentDescription("画質: " + option);
        state.speed.setText(SpeedSlider.label(speed()));
        state.speed.setContentDescription("再生速度: " + speed() + "倍");
        boolean loop = (Boolean) get(object, "v");
        state.loop.setText("");
        PlayerIcons.symbol(state.loop,loop ? "repeaton" : "repeatoff");
        state.loop.setContentDescription("ループ再生: " + (loop ? "ON" : "OFF"));
    }
    private static void error(Context c, Exception ex) {
        android.util.Log.w("nicoid-enhancements", "Control failed", ex);
        Toast.makeText(c, "操作に失敗しました。ログを確認してください", Toast.LENGTH_SHORT).show();
    }
}
