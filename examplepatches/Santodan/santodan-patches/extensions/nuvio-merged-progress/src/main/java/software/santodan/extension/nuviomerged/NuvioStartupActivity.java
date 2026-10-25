package software.santodan.extension.nuviomerged;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.Window;
import java.io.File;
import java.net.URI;
import java.util.Locale;
import java.util.concurrent.*;

/** Draw the full splash before constructing Nuvio's Hilt-backed MainActivity. */
public final class NuvioStartupActivity extends Activity {
    private static final String TAG = "SantodanStartup";
    private static final String PREFS = "santodan_nuvio_launch";
    private static volatile String currentProfile;
    private static final ThreadPoolExecutor IO = new ThreadPoolExecutor(1, 1, 0, TimeUnit.SECONDS,
        new ArrayBlockingQueue<>(1), task -> {
            Thread thread = new Thread(task, "SantodanSplashCache"); thread.setDaemon(true); return thread;
        }, new ThreadPoolExecutor.AbortPolicy());
    private final NuvioStartupGate gate = new NuvioStartupGate();
    private SplashView splash;
    private Future<?> pending;
    private boolean appearanceReady;
    private long started;
    private final Runnable cacheDeadline = () -> prepared(null, null, null);

    public static void profile(String value) { currentProfile = value; }
    /** Called on the existing cache IO path, never from a composition callback. */
    public static void rememberProfile(Context context, String value) {
        currentProfile = value;
        context.getSharedPreferences(PREFS, 0).edit().putString("profile", value).apply();
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        started = SystemClock.uptimeMillis();
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_FULLSCREEN |
            View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY |
            View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
            View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
        splash = new SplashView(this);
        setContentView(splash);
        Log.d(TAG, "Early splash created; native MainActivity has not started");
        // A stalled or unavailable cache must never trap the user on the splash.
        splash.postDelayed(cacheDeadline, 1500);
        try {
            pending = IO.submit(() -> {
                Bitmap image = null;
                String color = null, theme = null;
                try {
                    String id = currentProfile;
                    if (id == null) id = getSharedPreferences(PREFS, 0).getString("profile", null);
                    if (id != null) {
                        SharedPreferences nativeCache = getSharedPreferences("startup_splash", 0);
                        color = nativeCache.getString("color_" + id, null);
                        theme = nativeCache.getString("theme_" + id, null);
                        image = cachedBackground(nativeCache.getString("bg_url_" + id, null));
                    }
                } catch (Exception error) { Log.w(TAG, "Cached splash appearance unavailable", error); }
                final Bitmap background = image;
                final String cachedColor = color, cachedTheme = theme;
                runOnUiThread(() -> prepared(background, cachedColor, cachedTheme));
            });
        } catch (RejectedExecutionException error) {
            prepared(null, null, null);
        }
    }

    private Bitmap cachedBackground(String location) throws Exception {
        if (location == null || !location.startsWith("file:")) return null;
        File image = new File(new URI(location)).getCanonicalFile();
        String path = image.getPath();
        if (!(path.startsWith(getFilesDir().getCanonicalPath() + File.separator) ||
                path.startsWith(getCacheDir().getCanonicalPath() + File.separator)) || !image.isFile()) return null;
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(path, options);
        options.inSampleSize = 1;
        while (Math.max(options.outWidth, options.outHeight) / options.inSampleSize > 1920) options.inSampleSize *= 2;
        options.inJustDecodeBounds = false;
        options.inPreferredConfig = Bitmap.Config.RGB_565;
        return BitmapFactory.decodeFile(path, options);
    }

    private void prepared(Bitmap image, String color, String theme) {
        if (isFinishing() || isDestroyed() || appearanceReady) {
            if (image != null) image.recycle();
            return;
        }
        appearanceReady = true;
        splash.removeCallbacks(cacheDeadline);
        splash.appearance(image, color, theme);
        gate.prepared();
        splash.invalidate();
        Log.d(TAG, "Early splash prepared: cachedBackground=" + (image != null) +
            " elapsedMs=" + (SystemClock.uptimeMillis() - started));
    }

    private void handoff() {
        if (!gate.takeHandoff()) return;
        Log.d(TAG, "Early splash frame submitted; starting native MainActivity elapsedMs=" +
            (SystemClock.uptimeMillis() - started));
        Intent target = new Intent(getIntent());
        target.setClassName(getPackageName(), "com.nuvio.tv.MainActivity");
        // Keep data, categories, extras, ClipData and URI permissions. The second
        // Activity belongs to this task, not a second launcher-created task.
        int grants = getIntent().getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION |
            Intent.FLAG_GRANT_WRITE_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION |
            Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        target.setFlags(grants | Intent.FLAG_ACTIVITY_NO_ANIMATION | Intent.FLAG_ACTIVITY_SINGLE_TOP |
            Intent.FLAG_ACTIVITY_CLEAR_TOP);
        try { startActivity(target); overridePendingTransition(0, 0); }
        catch (RuntimeException error) { Log.e(TAG, "Unable to start native activity", error); }
        finish();
    }

    @Override public void onResume() { super.onResume(); gate.resumed(true); splash.invalidate(); }
    @Override public void onNewIntent(Intent intent) { super.onNewIntent(intent); setIntent(intent); }
    @Override public void onPause() { gate.resumed(false); super.onPause(); }
    @Override public void onDestroy() {
        gate.destroyed();
        if (pending != null) pending.cancel(true);
        if (splash != null) splash.removeCallbacks(cacheDeadline);
        super.onDestroy();
    }

    private final class SplashView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final float density = getResources().getDisplayMetrics().density;
        private Bitmap background;
        private Drawable wordmark;
        private int accent = 0xff1e88e5;
        private boolean scheduled;
        SplashView(Context context) { super(context); appearance(null, null, null); }
        void appearance(Bitmap image, String color, String theme) {
            background = image;
            if (color != null) try { accent = Color.parseColor(color); } catch (IllegalArgumentException ignored) {}
            String suffix = theme == null ? "" : theme.toLowerCase(Locale.ROOT);
            if (!(suffix.equals("gold") || suffix.equals("jade") || suffix.equals("rose_gold") ||
                    suffix.equals("arctic_blue") || suffix.equals("graphite"))) suffix = "";
            int id = getResources().getIdentifier("app_logo_wordmark" + (suffix.isEmpty() ? "" : "_" + suffix), "drawable", getPackageName());
            if (id != 0) wordmark = getResources().getDrawable(id, getTheme());
        }
        @Override protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float width = getWidth(), height = getHeight();
            paint.setShader(null);
            canvas.drawColor(0xff121212);
            if (background != null) {
                float scale = Math.max(width / background.getWidth(), height / background.getHeight());
                float w = background.getWidth() * scale, h = background.getHeight() * scale;
                canvas.drawBitmap(background, null, new RectF((width-w)/2, (height-h)/2, (width+w)/2, (height+h)/2), paint);
            } else {
                paint.setShader(new LinearGradient(0, 0, 0, height,
                    new int[]{blend(0xff1e1e1e, accent, .30f), blend(0xff121212, accent, .14f), 0xff121212},
                    new float[]{0, .42f, 1}, Shader.TileMode.CLAMP));
                canvas.drawRect(0, 0, width, height, paint);
                paint.setShader(new LinearGradient(0, 0, width, 0,
                    new int[]{(accent & 0xffffff) | 0x42000000, (accent & 0xffffff) | 0x14000000, 0, 0},
                    new float[]{0, .45f, .72f, 1}, Shader.TileMode.CLAMP));
                canvas.drawRect(0, 0, width, height, paint);
            }
            paint.setShader(null);
            // Same native splash layout: 48dp wordmark, 32dp gap, 48dp indicator.
            float top = height / 2 - 64 * density;
            if (wordmark != null) {
                float h = 48 * density;
                float w = h * wordmark.getIntrinsicWidth() / Math.max(1, wordmark.getIntrinsicHeight());
                wordmark.setBounds((int)((width-w)/2), (int)top, (int)((width+w)/2), (int)(top+h));
                wordmark.draw(canvas);
            }
            float cy = top + 104 * density, radius = 150f * 48 * density * .75f / 350f;
            float frame = (SystemClock.uptimeMillis() % 2000) * 60f / 2000;
            float start = 99 * ease((frame - 10) / 50), end = 1 + 99 * ease(frame / 50);
            paint.setColor(accent); paint.setStyle(Paint.Style.STROKE); paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeWidth(50f * 48 * density * .75f / 350f);
            canvas.drawArc(new RectF(width/2-radius, cy-radius, width/2+radius, cy+radius),
                -90 + frame / 60 * 363 + start * 3.6f, (end-start)*3.6f, false, paint);
            paint.setStyle(Paint.Style.FILL);
            if (appearanceReady && !scheduled) {
                scheduled = true;
                gate.drawn();
                // Yield a frame to the renderer before native initialization.
                postOnAnimation(() -> post(() -> { scheduled = false; handoff(); }));
            }
            if (!isFinishing() && !isDestroyed()) postInvalidateOnAnimation();
        }
    }

    private static float ease(float value) { float t = Math.max(0, Math.min(1, value)); return t*t*(3-2*t); }
    private static int blend(int first, int second, float amount) {
        return Color.rgb((int)(Color.red(first)*(1-amount)+Color.red(second)*amount),
            (int)(Color.green(first)*(1-amount)+Color.green(second)*amount),
            (int)(Color.blue(first)*(1-amount)+Color.blue(second)*amount));
    }
}
