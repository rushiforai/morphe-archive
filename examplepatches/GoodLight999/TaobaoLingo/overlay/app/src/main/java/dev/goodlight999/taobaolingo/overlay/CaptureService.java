package dev.goodlight999.taobaolingo.overlay;

import android.app.*;
import android.content.*;
import android.content.pm.ServiceInfo;
import android.graphics.*;
import android.hardware.display.DisplayManager;
import android.hardware.display.VirtualDisplay;
import android.media.Image;
import android.media.ImageReader;
import android.media.projection.MediaProjection;
import android.media.projection.MediaProjectionManager;
import android.os.*;
import android.provider.Settings;
import android.view.*;
import com.google.mlkit.nl.translate.*;
import com.google.mlkit.vision.common.InputImage;
import com.google.mlkit.vision.text.Text;
import com.google.mlkit.vision.text.TextRecognition;
import com.google.mlkit.vision.text.chinese.ChineseTextRecognizerOptions;
import com.google.mlkit.vision.text.TextRecognizer;
import java.nio.ByteBuffer;
import java.util.*;

/**
 * Screen capture -> bundled Chinese OCR -> on-device translation -> touch-through overlay.
 * Never alters the Taobao APK, records files, or uploads screenshots/transcriptions.
 */
public final class CaptureService extends Service {
    static final String ACTION_START = "dev.goodlight999.taobaolingo.START";
    static final String ACTION_STOP = "dev.goodlight999.taobaolingo.STOP";
    static final String EXTRA_RESULT = "result";
    static final String EXTRA_DATA = "data";
    static final String EXTRA_LANGUAGE = "language";
    private static final String CHANNEL = "translation";
    private static final long CAPTURE_INTERVAL_MS = 2600L;

    private final Handler main = new Handler(Looper.getMainLooper());
    private final Map<String, String> cache = new LinkedHashMap<String, String>(220, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, String> e) {
            return size() > 220;
        }
    };
    private WindowManager wm;
    private TranslationOverlayView overlay;
    private ImageReader reader;
    private MediaProjection projection;
    private VirtualDisplay display;
    private TextRecognizer recognizer;
    private Translator translator;
    private boolean modelReady;
    private boolean busy;
    private boolean closing;
    private int screenWidth;
    private int screenHeight;
    private int densityDpi;
    private long lastCapture;

    @Override public IBinder onBind(Intent intent) { return null; }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent == null) { stopSelf(); return START_NOT_STICKY; }
        if (ACTION_STOP.equals(intent.getAction())) {
            stopSelf();
            return START_NOT_STICKY;
        }
        if (!ACTION_START.equals(intent.getAction()) || projection != null) return START_NOT_STICKY;
        if (!Settings.canDrawOverlays(this)) { stopSelf(); return START_NOT_STICKY; }
        String locale = intent.getStringExtra(EXTRA_LANGUAGE);
        if (!"en".equals(locale) && !"ja".equals(locale)) locale = "ja";
        createNotification("翻訳モデルを準備中");
        int code = intent.getIntExtra(EXTRA_RESULT, Activity.RESULT_CANCELED);
        Intent data = Build.VERSION.SDK_INT >= 33
                ? intent.getParcelableExtra(EXTRA_DATA, Intent.class)
                : intent.getParcelableExtra(EXTRA_DATA);
        if (code != Activity.RESULT_OK || data == null) {
            stopSelf();
            return START_NOT_STICKY;
        }
        try {
            recognizer = TextRecognition.getClient(new ChineseTextRecognizerOptions.Builder().build());
            translator = Translation.getClient(new TranslatorOptions.Builder()
                    .setSourceLanguage(TranslateLanguage.CHINESE)
                    .setTargetLanguage("ja".equals(locale) ? TranslateLanguage.JAPANESE : TranslateLanguage.ENGLISH)
                    .build());
            wm = (WindowManager) getSystemService(WINDOW_SERVICE);
            overlay = new TranslationOverlayView(this);
            WindowManager.LayoutParams layer = new WindowManager.LayoutParams(
                    WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT,
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
                            | WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                    PixelFormat.TRANSLUCENT);
            layer.gravity = Gravity.TOP | Gravity.START;
            // Android 12+ permits touch-through of untrusted overlays with alpha <= 0.8.
            layer.alpha = 0.75f;
            wm.addView(overlay, layer);

            MediaProjectionManager mgr = (MediaProjectionManager) getSystemService(MEDIA_PROJECTION_SERVICE);
            projection = mgr.getMediaProjection(code, data);
            projection.registerCallback(new MediaProjection.Callback() {
                @Override public void onStop() { main.post(() -> stopSelf()); }
                @Override public void onCapturedContentResize(int width, int height) {
                    main.post(() -> resize(width, height));
                }
            }, main);

            Rect bounds;
            if (Build.VERSION.SDK_INT >= 30) {
                bounds = wm.getMaximumWindowMetrics().getBounds();
            } else {
                android.util.DisplayMetrics dm = new android.util.DisplayMetrics();
                wm.getDefaultDisplay().getRealMetrics(dm);
                bounds = new Rect(0, 0, dm.widthPixels, dm.heightPixels);
            }
            screenWidth = bounds.width();
            screenHeight = bounds.height();
            densityDpi = getResources().getDisplayMetrics().densityDpi;
            reader = makeReader(screenWidth, screenHeight);
            display = projection.createVirtualDisplay("TaobaoLingoOverlay",
                    screenWidth, screenHeight, densityDpi,
                    DisplayManager.VIRTUAL_DISPLAY_FLAG_AUTO_MIRROR,
                    reader.getSurface(), null, main);
            translator.downloadModelIfNeeded()
                    .addOnSuccessListener(v -> {
                        modelReady = true;
                        createNotification("翻訳中・アプリで停止できます");
                    })
                    .addOnFailureListener(e -> {
                        modelReady = false;
                        createNotification("翻訳モデル取得失敗・再起動してください");
                    });
        } catch (Exception ex) {
            android.util.Log.e("TaobaoLingo", "Capture startup failed", ex);
            stopSelf();
        }
        return START_NOT_STICKY;
    }

    private void createNotification(String message) {
        NotificationManager nm = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);
        nm.createNotificationChannel(new NotificationChannel(CHANNEL, "TaobaoLingo翻訳",
                NotificationManager.IMPORTANCE_LOW));
        Intent stop = new Intent(this, CaptureService.class).setAction(ACTION_STOP);
        PendingIntent stopAction = PendingIntent.getService(this, 0, stop,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        Notification note = new Notification.Builder(this, CHANNEL)
                .setSmallIcon(android.R.drawable.ic_menu_search)
                .setContentTitle("TaobaoLingo")
                .setContentText(message)
                .setOngoing(true)
                .addAction(new Notification.Action.Builder(
                        android.R.drawable.ic_delete, "停止", stopAction).build())
                .build();
        startForeground(33, note, ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROJECTION);
    }

    private ImageReader makeReader(int width, int height) {
        ImageReader r = ImageReader.newInstance(width, height, PixelFormat.RGBA_8888, 2);
        r.setOnImageAvailableListener(this::onImage, main);
        return r;
    }

    private void resize(int width, int height) {
        if (closing || display == null || width <= 0 || height <= 0 ||
                (width == screenWidth && height == screenHeight)) return;
        ImageReader old = reader;
        screenWidth = width;
        screenHeight = height;
        reader = makeReader(width, height);
        display.resize(width, height, densityDpi);
        display.setSurface(reader.getSurface());
        if (old != null) old.close();
        busy = false;
        if (overlay != null) overlay.update(Collections.emptyList(), width, height);
    }

    private void onImage(ImageReader source) {
        Image image = null;
        try {
            image = source.acquireLatestImage();
            if (image == null) return;
            long time = SystemClock.elapsedRealtime();
            if (!modelReady || busy || time - lastCapture < CAPTURE_INTERVAL_MS) return;
            lastCapture = time;
            Image.Plane plane = image.getPlanes()[0];
            ByteBuffer buffer = plane.getBuffer();
            int width = image.getWidth();
            int height = image.getHeight();
            int pixelStride = plane.getPixelStride();
            int rowStride = plane.getRowStride();
            int padded = width + (rowStride - pixelStride * width) / pixelStride;
            Bitmap aligned = Bitmap.createBitmap(padded, height, Bitmap.Config.ARGB_8888);
            aligned.copyPixelsFromBuffer(buffer);
            Bitmap frame = Bitmap.createBitmap(aligned, 0, 0, width, height);
            aligned.recycle();
            busy = true;
            recognizer.process(InputImage.fromBitmap(frame, 0))
                    .addOnSuccessListener(text -> translateFrame(text, width, height))
                    .addOnFailureListener(e -> {
                        android.util.Log.w("TaobaoLingo", "OCR failed", e);
                        busy = false;
                    })
                    .addOnCompleteListener(t -> frame.recycle());
        } catch (Exception e) {
            busy = false;
            android.util.Log.w("TaobaoLingo", "Capture failed", e);
        } finally {
            if (image != null) image.close();
        }
    }

    private static boolean hasChinese(String s) {
        for (int i = 0; i < s.length(); ++i) {
            char c = s.charAt(i);
            if ((c >= '\u3400' && c <= '\u9fff') || (c >= '\uf900' && c <= '\ufaff'))
                return true;
        }
        return false;
    }

    private void translateFrame(Text text, int width, int height) {
        if (closing || overlay == null) { busy = false; return; }
        List<TranslationOverlayView.Label> labels = new ArrayList<>();
        List<Text.TextBlock> missing = new ArrayList<>();
        int limit = 0;
        for (Text.TextBlock block : text.getTextBlocks()) {
            if (++limit > 40) break;
            Rect bounds = block.getBoundingBox();
            String source = block.getText().trim();
            if (bounds == null || source.isEmpty() || !hasChinese(source)) continue;
            String saved = cache.get(source);
            if (saved != null) labels.add(new TranslationOverlayView.Label(bounds, saved));
            else missing.add(block);
        }
        if (missing.isEmpty()) { showLabels(labels, width, height); return; }
        final int[] pending = {missing.size()};
        for (Text.TextBlock block : missing) {
            String source = block.getText().trim();
            Rect box = new Rect(block.getBoundingBox());
            translator.translate(source)
                .addOnSuccessListener(value -> {
                    if (closing) return;
                    cache.put(source, value);
                    labels.add(new TranslationOverlayView.Label(box, value));
                })
                .addOnFailureListener(e -> android.util.Log.w("TaobaoLingo", "Translate failed", e))
                .addOnCompleteListener(t -> {
                    pending[0]--;
                    if (pending[0] == 0) showLabels(labels, width, height);
                });
        }
    }

    private void showLabels(List<TranslationOverlayView.Label> labels, int width, int height) {
        if (!closing && overlay != null) overlay.update(labels, width, height);
        busy = false;
    }

    @Override public void onDestroy() {
        closing = true;
        if (reader != null) { reader.close(); reader = null; }
        if (display != null) { display.release(); display = null; }
        if (projection != null) { projection.stop(); projection = null; }
        if (wm != null && overlay != null) { wm.removeView(overlay); overlay = null; }
        if (translator != null) { translator.close(); translator = null; }
        if (recognizer != null) { recognizer.close(); recognizer = null; }
        super.onDestroy();
    }
}
