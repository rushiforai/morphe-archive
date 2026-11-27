package app.geminipatch.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.VibrationEffect;
import android.os.Vibrator;
import android.system.ErrnoException;
import android.system.Os;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.Switch;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.List;

/** Independent app-private controls for Gemini and Google app feedback. */
public final class GeminiHaptics {
    private static final String GEMINI = "geminipatch_haptic_feedback";
    private static final String GOOGLE = "geminipatch_google_haptic_feedback";
    private static final String[] SETTINGS = { GEMINI, GOOGLE };
    private static volatile Context application;

    private GeminiHaptics() {}

    public static void addPreference(Object screen, String names) {
        addPreferences(screen, names, false);
    }

    /** Both settings builders consume AndroidX preferences, including the Compose list adapter. */
    public static void addListPreference(Object screen, String names) {
        addPreferences(screen, names, true);
    }

    private static void addPreferences(Object screen, String names, boolean list) {
        if (screen == null) return;
        try {
            String[] member = names.split(",", -1);
            ClassLoader loader = screen.getClass().getClassLoader();
            Class<?> preference = loader.loadClass("androidx.preference.Preference");
            Class<?> group = loader.loadClass("androidx.preference.PreferenceGroup");
            Context context = (Context) readField(preference, "j").get(screen);
            Class<?> switchType = loader.loadClass("androidx.preference.SwitchPreferenceCompat");
            Constructor<?> constructor = switchType.getConstructor(Context.class, AttributeSet.class);
            Method find = group.getMethod(member[0], String.class);
            Method setKey = preference.getMethod(member[1], String.class);
            Method setTitle = preference.getMethod(member[2], CharSequence.class);
            Method setIcon = preference.getMethod(member[member.length - 1], Drawable.class);
            Field persistent = readField(preference, member[list ? 6 : 5]);
            Field listener = readField(preference, member[list ? 7 : 4]);
            Method checked = switchType.getMethod(member[list ? 8 : 6], boolean.class);
            Method add = group.getMethod(member[list ? 9 : 3], preference);
            boolean composeList = list && member[3].equals(screen.getClass().getName());
            Field keyField = composeList ? readField(preference, member[5]) : null;
            List<?> rows = composeList ? (List<?>) readField(screen.getClass(), member[4]).get(screen) : null;

            for (String key : SETTINGS) {
                if (composeList ? containsKey(rows, keyField, key) : find.invoke(screen, key) != null) continue;
                Object toggle = constructor.newInstance(context, null);
                setKey.invoke(toggle, key);
                setTitle.invoke(toggle, title(context, key));
                setIcon.invoke(toggle, vibrationIcon(context));
                persistent.setBoolean(toggle, false);
                checked.invoke(toggle, isEnabled(context, key));
                listener.set(toggle, Proxy.newProxyInstance(loader, new Class<?>[] { listener.getType() },
                        new SaveSwitchValue(context, key)));
                add.invoke(screen, toggle);
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.w("GeminiPatch", "Cannot add the vibration setting to Gemini settings", e);
        }
    }

    private static boolean containsKey(List<?> rows, Field keyField, String key) throws IllegalAccessException {
        for (Object row : rows) {
            if (key.equals(keyField.get(row))) return true;
        }
        return false;
    }

    private static final class SaveSwitchValue implements InvocationHandler {
        private final Context context;
        private final String key;

        SaveSwitchValue(Context context, String key) {
            this.context = context;
            this.key = key;
        }

        @Override public Object invoke(Object proxy, Method method, Object[] args) {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals": return proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    default: return "Gemini vibration preference listener";
                }
            }
            if (args == null || args.length != 2 || !(args[1] instanceof Boolean)) return false;
            return saveEnabled(context, key, (Boolean) args[1]);
        }
    }

    /** Add a footer to the main Compose settings page. The original view retains its lifecycle. */
    public static View addComposePreference(View content, int titleResource) {
        if (content == null || content.getParent() != null) return content;
        Context context = content.getContext();
        String resourceName;
        try {
            resourceName = context.getResources().getResourceEntryName(titleResource);
        } catch (Resources.NotFoundException e) {
            return content;
        }
        if (!"assistant_ui_settings_settings".equals(resourceName)
                && !"assistant_ui_settings_title".equals(resourceName)) return content;

        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        ViewGroup.LayoutParams params = content.getLayoutParams();
        if (params != null) layout.setLayoutParams(params);
        layout.addView(content, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        float density = context.getResources().getDisplayMetrics().density;
        int horizontalPadding = Math.round(16 * density);
        for (String key : SETTINGS) {
            Switch toggle = new Switch(context);
            toggle.setText(title(context, key));
            toggle.setCompoundDrawablesRelativeWithIntrinsicBounds(vibrationIcon(context), null, null, null);
            toggle.setCompoundDrawablePadding(Math.round(12 * density));
            toggle.setChecked(isEnabled(context, key));
            toggle.setMinHeight(Math.round(48 * density));
            toggle.setPaddingRelative(horizontalPadding, 0, horizontalPadding, 0);
            ToggleBinding binding = new ToggleBinding(toggle, horizontalPadding, key);
            toggle.setOnCheckedChangeListener(binding);
            if (GOOGLE.equals(key)) layout.setOnApplyWindowInsetsListener(binding);
            layout.addView(toggle, ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        }
        return layout;
    }

    private static Drawable vibrationIcon(Context context) {
        Resources resources = context.getResources();
        int size = Math.round(24 * resources.getDisplayMetrics().density);
        Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        bitmap.setDensity(resources.getDisplayMetrics().densityDpi);

        TypedArray colors = context.obtainStyledAttributes(new int[] { android.R.attr.textColorSecondary });
        int color;
        try {
            color = colors.getColor(0, Color.GRAY);
        } finally {
            colors.recycle();
        }
        Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        stroke.setColor(color);
        stroke.setStyle(Paint.Style.STROKE);
        stroke.setStrokeWidth(2);
        stroke.setStrokeCap(Paint.Cap.ROUND);
        stroke.setStrokeJoin(Paint.Join.ROUND);

        Canvas canvas = new Canvas(bitmap);
        canvas.scale(size / 24f, size / 24f);
        canvas.drawRoundRect(7, 3, 17, 21, 2, 2, stroke);

        // Phone outline and mirrored vibration lines from the design proposed in Issue #8.
        Path wave = new Path();
        wave.moveTo(2, 6);
        wave.lineTo(3.06051f, 7.11942f);
        wave.cubicTo(3.58133f, 7.66918f, 3.56352f, 8.53546f, 3.02055f, 9.06335f);
        wave.lineTo(3, 9.08333f);
        wave.cubicTo(2.45233f, 9.61579f, 2.45233f, 10.4953f, 3, 11.0278f);
        wave.cubicTo(3.54767f, 11.5602f, 3.54767f, 12.4398f, 3, 12.9722f);
        wave.cubicTo(2.45233f, 13.5047f, 2.45233f, 14.3842f, 3, 14.9167f);
        wave.lineTo(3.02055f, 14.9366f);
        wave.cubicTo(3.56351f, 15.4645f, 3.58132f, 16.3308f, 3.0605f, 16.8806f);
        wave.lineTo(2, 18);
        canvas.drawPath(wave, stroke);
        canvas.scale(-1, 1, 12, 12);
        canvas.drawPath(wave, stroke);
        return new BitmapDrawable(resources, bitmap);
    }

    private static final class ToggleBinding
            implements CompoundButton.OnCheckedChangeListener, View.OnApplyWindowInsetsListener {
        private final Switch toggle;
        private final int padding;
        private final String key;

        ToggleBinding(Switch toggle, int padding, String key) {
            this.toggle = toggle;
            this.padding = padding;
            this.key = key;
        }

        @Override public void onCheckedChanged(CompoundButton button, boolean enabled) {
            if (!saveEnabled(button.getContext(), key, enabled)) {
                toggle.setOnCheckedChangeListener(null);
                toggle.setChecked(isEnabled(button.getContext(), key));
                toggle.setOnCheckedChangeListener(this);
            }
        }

        @Override public WindowInsets onApplyWindowInsets(View layout, WindowInsets insets) {
            int bottom = insets.getStableInsetBottom();
            if (toggle.getPaddingBottom() != bottom) toggle.setPaddingRelative(padding, 0, padding, bottom);
            return insets;
        }
    }

    private static Field readField(Class<?> owner, String name) throws NoSuchFieldException {
        Field field = owner.getDeclaredField(name);
        field.setAccessible(true);
        return field;
    }

    public static boolean performFeedback(View view, int effect) {
        return isEnabled(view.getContext(), GEMINI) && view.performHapticFeedback(effect);
    }

    public static boolean performGoogleFeedback(View view, int effect) {
        return isEnabled(view.getContext(), GOOGLE) && view.performHapticFeedback(effect);
    }

    public static boolean performGoogleFeedback(View view, int effect, int flags) {
        return isEnabled(view.getContext(), GOOGLE) && view.performHapticFeedback(effect, flags);
    }

    public static void setApplicationContext(Context context) {
        application = context;
    }

    public static void performVibration(Vibrator vibrator, VibrationEffect effect) {
        if (isVibrationEnabled(GEMINI)) vibrator.vibrate(effect);
    }

    public static void performGoogleVibration(Vibrator vibrator, VibrationEffect effect) {
        if (isVibrationEnabled(GOOGLE)) vibrator.vibrate(effect);
    }

    public static void performGoogleVibration(Vibrator vibrator, long duration) {
        if (isVibrationEnabled(GOOGLE)) vibrator.vibrate(duration);
    }

    private static boolean isVibrationEnabled(String key) {
        Context context = application;
        return context == null || isEnabled(context, key);
    }

    private static boolean isEnabled(Context context, String key) {
        try (FileInputStream input = context.openFileInput(key + ".state")) {
            int state = input.read();
            if (state == 0 || state == 1) return state == 1;
        } catch (FileNotFoundException ignored) {
            // Preserve the user's setting from builds that used SharedPreferences alone.
        } catch (IOException e) {
            Log.w("GeminiPatch", "Cannot read the vibration setting", e);
        }
        return preferences(context).getBoolean(key, true);
    }

    private static boolean saveEnabled(Context context, String key, boolean enabled) {
        File temporary = null;
        try {
            File destination = context.getFileStreamPath(key + ".state");
            temporary = File.createTempFile("gemini-haptics-", ".tmp", destination.getParentFile());
            try (FileOutputStream output = new FileOutputStream(temporary)) {
                output.write(enabled ? 1 : 0);
                output.getFD().sync();
            }
            // Other processes only open the final path, so they never cache or read a partial value.
            Os.rename(temporary.getAbsolutePath(), destination.getAbsolutePath());
            preferences(context).edit().putBoolean(key, enabled).apply();
            return true;
        } catch (IOException | ErrnoException e) {
            Log.w("GeminiPatch", "Cannot save the vibration setting", e);
            return false;
        } finally {
            if (temporary != null) temporary.delete();
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    private static String title(Context context, String key) {
        if (GOOGLE.equals(key)) return isJapanese(context) ? "Googleアプリの振動" : "Google app vibration";
        return isJapanese(context) ? "Geminiの振動" : "Gemini vibration";
    }

    private static boolean isJapanese(Context context) {
        return "ja".equals(context.getResources().getConfiguration().getLocales().get(0).getLanguage());
    }
}
