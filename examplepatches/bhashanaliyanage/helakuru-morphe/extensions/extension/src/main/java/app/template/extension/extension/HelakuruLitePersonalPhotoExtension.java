package app.template.extension.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.preference.PreferenceManager;
import android.util.AtomicFile;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.IdentityHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Local photo storage and rendering; never creates a Lite Pro/personal theme model. */
public final class HelakuruLitePersonalPhotoExtension {
    private static final String TAG = "HelakuruPersonalPhoto";
    private static final String GLASS = "morphe_live_keyboard_blur_lite";
    private static final String PATH = "morphe_personal_photo_theme_path";
    private static final String BASE = "morphe_personal_photo_color_base";
    private static final int REQUEST = 101;
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile Bitmap cachedPhoto;
    private static volatile String cachedPath;
    private static volatile String loadingPath;

    private HelakuruLitePersonalPhotoExtension() { }

    public static void openPhotoPicker(Object fragment) {
        try {
            Context context = (Context) fragment.getClass().getMethod("k").invoke(fragment);
            if (context == null) return;
            String[] actions = prefs(context).contains(PATH)
                    ? new String[] { "Choose photo", "Remove photo background" }
                    : new String[] { "Choose photo" };
            new AlertDialog.Builder(context).setTitle("Personal photo background")
                    .setItems(actions, (dialog, which) -> {
                        if (which == 0) launchPicker(fragment, context);
                        else {
                            prefs(context).edit().remove(PATH).remove(BASE).apply();
                            cachedPhoto = null;
                            cachedPath = null;
                            Toast.makeText(context, "Photo background removed", Toast.LENGTH_SHORT).show();
                        }
                    }).setNegativeButton("Cancel", null).show();
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.e(TAG, "Unable to open photo settings", exception);
        }
    }

    private static void launchPicker(Object fragment, Context context) {
        for (String action : new String[] { Intent.ACTION_OPEN_DOCUMENT, Intent.ACTION_GET_CONTENT }) {
            Intent intent = new Intent(action).setType("image/*")
                    .addCategory(Intent.CATEGORY_OPENABLE).addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            try {
                fragment.getClass().getMethod("R", Intent.class, int.class, Bundle.class)
                        .invoke(fragment, intent, REQUEST, null);
                return;
            } catch (InvocationTargetException exception) {
                if (exception.getCause() instanceof android.content.ActivityNotFoundException) continue;
                Log.e(TAG, "Photo picker failed", exception.getCause());
                break;
            } catch (ReflectiveOperationException | RuntimeException exception) {
                Log.e(TAG, "Photo picker failed", exception);
                break;
            }
        }
        Toast.makeText(context, "Unable to open image picker", Toast.LENGTH_LONG).show();
    }

    // URI grants replace the legacy storage permission on every supported version.
    public static int checkPickerPermission(Context context, String permission) {
        return PackageManager.PERMISSION_GRANTED;
    }

    /** Consume our result before Lite creates a Pro-gated type-3 theme. */
    public static boolean onPhotoResult(Object fragment, int request, int result, Intent data) {
        if (request != REQUEST) return false;
        if (result != Activity.RESULT_OK || data == null || data.getData() == null) return true;
        try {
            Context host = (Context) fragment.getClass().getMethod("k").invoke(fragment);
            if (host == null) return true;
            Context context = host.getApplicationContext();
            Uri uri = data.getData();
            Toast.makeText(host, "Loading photo…", Toast.LENGTH_SHORT).show();
            IO.execute(() -> {
                FileOutputStream output = null;
                AtomicFile file = new AtomicFile(new File(context.getFilesDir(), "morphe_keyboard_photo.png"));
                try {
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    options.inJustDecodeBounds = true;
                    try (InputStream input = context.getContentResolver().openInputStream(uri)) {
                        BitmapFactory.decodeStream(input, null, options);
                    }
                    options.inSampleSize = sampleSize(options.outWidth, options.outHeight);
                    options.inJustDecodeBounds = false;
                    Bitmap photo;
                    try (InputStream input = context.getContentResolver().openInputStream(uri)) {
                        photo = BitmapFactory.decodeStream(input, null, options);
                    }
                    if (photo == null) throw new java.io.IOException("Unsupported image");
                    output = file.startWrite();
                    if (!photo.compress(Bitmap.CompressFormat.PNG, 100, output)) {
                        throw new java.io.IOException("Unable to save photo");
                    }
                    file.finishWrite(output);
                    output = null;
                    String path = file.getBaseFile().getAbsolutePath();
                    cachedPhoto = photo;
                    cachedPath = path;
                    MAIN.post(() -> {
                        Object base = useColorBase(context);
                        // A previous patch may have left the activity editing a Pro model.
                        // Keep the screen's model aligned with the ordinary color base.
                        Object selected = field(host, "s");
                        Object kind = field(selected, "a");
                        if (base != null && kind instanceof Integer && (Integer) kind != 1) {
                            try {
                                Field active = host.getClass().getField("s");
                                active.set(host, base);
                            } catch (ReflectiveOperationException exception) {
                                Log.w(TAG, "Unable to update legacy theme editor", exception);
                            }
                        }
                        prefs(context).edit().putString(PATH, path).putString(BASE, signature(base))
                                .putBoolean(GLASS, false).apply();
                        Log.i(TAG, "Independent photo background saved: " + photo.getWidth() + "x" + photo.getHeight());
                        Toast.makeText(context, "Photo background applied", Toast.LENGTH_SHORT).show();
                    });
                } catch (Exception | OutOfMemoryError exception) {
                    if (output != null) file.failWrite(output);
                    Log.e(TAG, "Unable to save photo background", exception);
                    MAIN.post(() -> Toast.makeText(context, "Unable to load photo; background unchanged", Toast.LENGTH_LONG).show());
                }
            });
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.e(TAG, "Unable to handle photo result", exception);
        }
        return true;
    }

    /** Old patch versions may have left a Pro theme selected; keep only its color base. */
    private static Object useColorBase(Context context) {
        try {
            Class<?> helper = Class.forName("D3.b");
            Object theme = helper.getMethod("k", Context.class).invoke(null, context);
            if (theme.getClass().getField("a").getInt(theme) == 1) return theme;
            Object[] defaults = (Object[]) Class.forName("u5.c").getField("a").get(null);
            Object base = defaults[1];
            helper.getMethod("p", Context.class, base.getClass(), Class.forName("t5.f"))
                    .invoke(null, context, base, null);
            helper.getField("a").set(null, base);
            return base;
        } catch (ReflectiveOperationException | RuntimeException exception) {
            Log.w(TAG, "Unable to reset legacy photo theme", exception);
            return null;
        }
    }

    /** Explicitly confirming a Lite theme replaces the independent photo background. */
    public static void onThemeConfirmed(Object activity) {
        if (!(activity instanceof Context)) return;
        SharedPreferences preferences = prefs((Context) activity);
        String base = preferences.getString(BASE, null);
        // Saving the unchanged editor or changing key borders must keep the photo.
        // A different color theme replaces it; the photo menu also offers Remove.
        if (base != null && !base.equals(signature(field(activity, "s")))) {
            preferences.edit().remove(PATH).remove(BASE).apply();
        }
    }

    private static String signature(Object theme) {
        return String.valueOf(field(theme, "a")) + ":" + field(theme, "b") + ":" + field(theme, "f");
    }

    /** Called after each root theme update, independently of Frosted Glass. */
    public static void bindPhotoBackground(Object rootObject) {
        if (!(rootObject instanceof View)) return;
        View root = (View) rootObject;
        // Store state on the root itself: no static strong references to IME views.
        final int tag = 0x7e50484f;
        State state = root.getTag(tag) instanceof State ? (State) root.getTag(tag) : null;
        if (state == null) {
            state = new State();
            root.setTag(tag, state);
            State saved = state;
            root.getViewTreeObserver().addOnPreDrawListener(() -> {
                render(root, saved);
                return true;
            });
        }
        render(root, state);
    }

    private static void render(View root, State state) {
        SharedPreferences preferences = prefs(root.getContext());
        String path = preferences.getString(PATH, null);
        if (path == null || preferences.getBoolean(GLASS, false)) {
            for (Map.Entry<View, Surface> entry : state.surfaces.entrySet()) {
                if (entry.getKey().getBackground() == entry.getValue().applied) {
                    entry.getKey().setBackground(entry.getValue().original);
                }
            }
            state.surfaces.clear();
            return;
        }
        Bitmap photo = cachedPhoto;
        if (!path.equals(cachedPath) || photo == null) {
            if (!path.equals(loadingPath)) {
                loadingPath = path;
                IO.execute(() -> {
                    BitmapFactory.Options options = new BitmapFactory.Options();
                    options.inJustDecodeBounds = true;
                    BitmapFactory.decodeFile(path, options);
                    options.inJustDecodeBounds = false;
                    options.inSampleSize = sampleSize(options.outWidth, options.outHeight);
                    try {
                        Bitmap decoded = BitmapFactory.decodeFile(path, options);
                        if (decoded != null) {
                            cachedPhoto = decoded;
                            cachedPath = path;
                        } else {
                            Log.w(TAG, "Saved photo is unavailable; using the color theme");
                            if (path.equals(prefs(root.getContext()).getString(PATH, null))) {
                                prefs(root.getContext()).edit().remove(PATH).remove(BASE).apply();
                            }
                        }
                    } catch (OutOfMemoryError exception) {
                        Log.e(TAG, "Unable to decode saved background", exception);
                    }
                    loadingPath = null;
                    MAIN.post(root::invalidate);
                });
            }
            return;
        }
        if (state.bitmap != photo) {
            state.bitmap = photo;
            state.photo = new PhotoDrawable(photo);
        }
        background(root, state, state.photo);
        Object keyboard = field(root, "keyboardView");
        if (keyboard instanceof View) clearBackground((View) keyboard, state);
        Object theme = field(root, "theme");
        Object surface = field(theme, "f");
        Object candidates = field(root.getContext(), "candidateViews");
        Object toolbarColor = field(candidates, "predictionBarColor");
        if (toolbarColor instanceof Integer) surface = toolbarColor;
        int id = root.getResources().getIdentifier("candidate_container", "id", root.getContext().getPackageName());
        View toolbar = id == 0 ? null : root.findViewById(id);
        if (toolbar != null) {
            clearBackground(toolbar, state);
            if (surface instanceof Integer) clearToolbar(toolbar, (Integer) surface, state);
        }
    }

    private static void clearToolbar(View view, int color, State state) {
        Drawable drawable = view.getBackground();
        if (drawable instanceof ColorDrawable && ((ColorDrawable) drawable).getColor() == color) {
            clearBackground(view, state);
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) clearToolbar(group.getChildAt(i), color, state);
        }
    }

    private static void clearBackground(View view, State state) {
        Surface surface = state.surfaces.get(view);
        if (surface != null && view.getBackground() == surface.applied
                && surface.applied instanceof ColorDrawable
                && ((ColorDrawable) surface.applied).getColor() != 0) {
            surface.original = new ColorDrawable(((ColorDrawable) surface.applied).getColor());
        }
        Drawable clear = surface != null && surface.applied instanceof ColorDrawable
                ? surface.applied : new ColorDrawable(0);
        ((ColorDrawable) clear).setColor(0);
        background(view, state, clear);
    }

    private static void background(View view, State state, Drawable drawable) {
        Surface surface = state.surfaces.get(view);
        if (surface == null) {
            surface = new Surface();
            surface.original = view.getBackground();
            state.surfaces.put(view, surface);
        } else if (view.getBackground() != surface.applied) surface.original = view.getBackground();
        if (view.getBackground() != drawable) view.setBackground(drawable);
        surface.applied = drawable;
    }

    private static SharedPreferences prefs(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context);
    }

    private static int sampleSize(int width, int height) {
        int sample = 1;
        while (Math.max(width, height) / sample > 2048) sample *= 2;
        return sample;
    }

    private static Object field(Object object, String name) {
        if (object == null) return null;
        try {
            Field field = object.getClass().getDeclaredField(name);
            field.setAccessible(true);
            return field.get(object);
        } catch (ReflectiveOperationException exception) { return null; }
    }

    private static final class Surface { Drawable original, applied; }
    private static final class State {
        final Map<View, Surface> surfaces = new IdentityHashMap<>();
        Bitmap bitmap;
        Drawable photo;
    }

    private static final class PhotoDrawable extends Drawable {
        final Bitmap photo;
        final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        PhotoDrawable(Bitmap photo) { this.photo = photo; }
        @Override public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.width() == 0 || bounds.height() == 0) return;
            float scale = Math.max((float) bounds.width() / photo.getWidth(), (float) bounds.height() / photo.getHeight());
            float width = photo.getWidth() * scale, height = photo.getHeight() * scale;
            canvas.drawBitmap(photo, null, new android.graphics.RectF(bounds.centerX() - width / 2,
                    bounds.centerY() - height / 2, bounds.centerX() + width / 2, bounds.centerY() + height / 2), paint);
        }
        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); invalidateSelf(); }
        @Override public void setColorFilter(ColorFilter filter) { paint.setColorFilter(filter); invalidateSelf(); }
        @Override public int getOpacity() { return PixelFormat.OPAQUE; }
    }
}
