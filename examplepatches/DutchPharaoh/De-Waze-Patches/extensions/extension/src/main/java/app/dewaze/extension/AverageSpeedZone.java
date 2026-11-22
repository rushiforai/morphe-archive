package app.dewaze.extension;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;
import java.util.List;

/**
 * Average speed in a section control zone (trajectcontrole), shown as a pill in Android Auto:
 * the speed limit, the average speed so far and the distance left, like Flitsmeister.
 *
 * <p>Waze reports the zone (distance left to its end) but not the average speed, so the average
 * is the distance driven since the zone was first reported divided by the time since then.
 * Painted here, put on screen by {@link BarGl}.
 */
@SuppressWarnings("unused")
public final class AverageSpeedZone {

    private static final String TAG = RouteAlertsBarPatch.TAG;

    /** SegmentInsightInfo.Id.Type.AVERAGE_SPEED_CAMERA */
    private static final int SEGMENT_AVERAGE_SPEED_CAMERA = 7;
    /** SegmentInsightInfo.PositionRelativeToSegment.WITHIN */
    private static final int POSITION_WITHIN = 1;
    /** Without any zone report for this long, the zone is considered over. */
    private static final long STALE_MS = 90_000;
    /** The average is shown once this much has been driven, so it does not jump around. */
    private static final int MIN_METERS_FOR_AVERAGE = 50;
    private static final long MIN_MS_FOR_AVERAGE = 3_000;

    // region State; all access under LOCK.

    private static final Object LOCK = new Object();
    private static boolean inZone;
    private static int startLeft;
    private static long startAt;
    private static int left;
    private static long lastAt;
    /** Speed limit of the road, from Waze's speedometer state; -1 if unknown. */
    private static volatile int limit = -1;

    // endregion

    /** The pill, or null when not in a zone. Read by the compositor. */
    static volatile Bitmap bitmap;
    /** Pill height in pixels on the current car surface; 0 until the compositor set it. */
    static volatile float dpPx;

    private AverageSpeedZone() {
    }

    // region Hooks

    /** NavigationInfoNativeManagerBase.onAverageSpeedCamZoneUpdateJNI(byte[]), on Waze's native thread. */
    public static void onZoneUpdate(byte[] proto) {
        try {
            Object update = parse("com.waze.jni.protos.navigate.AverageSpeedCameraZoneUpdate", proto);
            int leftDistance = (Integer) call(update, "getLeftDistance");
            progress(leftDistance);
        } catch (Throwable t) {
            Log.w(TAG, "zone update", t);
        }
    }

    /** NavigationInfoNativeManagerBase.onAverageSpeedCamZoneClearJNI(). */
    public static void onZoneClear() {
        if (simulating) {
            return;
        }
        end("cleared by Waze");
    }

    /** InsightsInfraNativeManagerBase.onSegmentInsightUpdatedJNI(byte[]). */
    public static void onSegmentInsights(byte[] proto) {
        try {
            Object update = parse("com.waze.jni.protos.insights_infra.SegmentInsightUpdate", proto);
            Integer remaining = null;
            for (Object info : (List<?>) call(update, "getInfoList")) {
                int type = (Integer) call(call(info, "getId"), "getSegmentTypeValue");
                int position = (Integer) call(info, "getPositionRelativeToSegmentValue");
                if (type == SEGMENT_AVERAGE_SPEED_CAMERA && position == POSITION_WITHIN) {
                    remaining = (Integer) call(info, "getRemainingDistanceMeters");
                    break;
                }
            }
            if (remaining != null) {
                progress(remaining);
            } else {
                boolean wasInZone;
                synchronized (LOCK) {
                    wasInZone = inZone;
                }
                if (wasInZone && !simulating) {
                    end("no zone in Waze's insights");
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "segment insights", t);
        }
    }

    /** Constructor of Waze's speedometer state (com.waze.bz.i): keeps the road's speed limit. */
    public static void onSpeedometerState(int maxSpeedRoad) {
        if (maxSpeedRoad > 0 && maxSpeedRoad != limit) {
            limit = maxSpeedRoad;
            boolean repaint;
            synchronized (LOCK) {
                repaint = inZone;
            }
            if (repaint) {
                repaint();
            }
        }
    }

    // endregion

    private static void progress(int leftMeters) {
        long now = SystemClock.elapsedRealtime();
        synchronized (LOCK) {
            if (inZone && now - lastAt > STALE_MS) {
                inZone = false;
            }
            if (!inZone || leftMeters > left + 200) {
                // A new zone (or a new one right after the previous one).
                inZone = true;
                startLeft = leftMeters;
                startAt = now;
                Log.i(TAG, "Average speed zone: " + leftMeters + " m left");
            }
            left = leftMeters;
            lastAt = now;
        }
        repaint();
    }

    private static void end(String why) {
        synchronized (LOCK) {
            if (!inZone) {
                return;
            }
            inZone = false;
        }
        Log.i(TAG, "Average speed zone over (" + why + ")");
        bitmap = null;
    }

    /** Average in km/h, or NaN while too little has been driven. */
    private static float average() {
        synchronized (LOCK) {
            int driven = startLeft - left;
            long ms = lastAt - startAt;
            if (driven < MIN_METERS_FOR_AVERAGE || ms < MIN_MS_FOR_AVERAGE) {
                return Float.NaN;
            }
            return driven / (ms / 1000f) * 3.6f;
        }
    }

    /** Called by the compositor so the pill is hidden after a while without reports. */
    static Bitmap bitmapIfFresh() {
        synchronized (LOCK) {
            if (inZone && SystemClock.elapsedRealtime() - lastAt > STALE_MS) {
                inZone = false;
                bitmap = null;
            }
        }
        return bitmap;
    }

    static void repaint() {
        float px = dpPx;
        if (px <= 0) {
            return;
        }
        int leftMeters;
        synchronized (LOCK) {
            if (!inZone) {
                return;
            }
            leftMeters = left;
        }
        bitmap = paint(px, limit, average(), leftMeters);
    }

    // region Painting

    /** Green up to the limit, orange a little over it, red above that. */
    private static int colorFor(float average, int limit) {
        if (Float.isNaN(average) || limit <= 0) {
            return Color.WHITE;
        }
        if (average <= limit) {
            return 0xFF43A047;
        }
        float tolerance = Math.max(3f, limit * 0.03f);
        return average <= limit + tolerance ? 0xFFFB8C00 : 0xFFE53935;
    }

    static Bitmap paint(float px, int limit, float average, int leftMeters) {
        float height = 56 * px;
        float pad = 8 * px;
        float sign = height - 2 * pad;
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setTypeface(Typeface.DEFAULT_BOLD);

        String line1 = (Float.isNaN(average) ? "–" : String.valueOf(Math.round(average))) + " km/u gem.";
        String line2 = "Nog " + RouteAlertsBarPatch.BarPainter.formatDistance(leftMeters);
        float size1 = 18 * px;
        float size2 = 14 * px;
        paint.setTextSize(size1);
        float w1 = paint.measureText(line1);
        paint.setTypeface(Typeface.DEFAULT);
        paint.setTextSize(size2);
        float w2 = paint.measureText(line2);

        boolean hasSign = limit > 0;
        float textLeft = pad + (hasSign ? sign + pad : 4 * px);
        float width = textLeft + Math.max(w1, w2) + pad * 1.5f;

        Bitmap bmp = Bitmap.createBitmap(Math.round(width), Math.round(height), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bmp);
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(0xE61F2226);
        float radius = height / 2f;
        canvas.drawRoundRect(new RectF(0, 0, bmp.getWidth(), bmp.getHeight()), radius, radius, paint);

        if (hasSign) {
            float cx = pad + sign / 2f;
            float cy = height / 2f;
            float r = sign / 2f;
            paint.setColor(Color.WHITE);
            canvas.drawCircle(cx, cy, r, paint);
            paint.setColor(0xFFE53935);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(r * 0.2f);
            canvas.drawCircle(cx, cy, r * 0.9f, paint);
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(Color.BLACK);
            paint.setTypeface(Typeface.DEFAULT_BOLD);
            String text = String.valueOf(limit);
            paint.setTextSize(r * (text.length() > 2 ? 0.75f : 0.95f));
            paint.setTextAlign(Paint.Align.CENTER);
            Paint.FontMetrics fm = paint.getFontMetrics();
            canvas.drawText(text, cx, cy - (fm.ascent + fm.descent) / 2f, paint);
        }

        paint.setTextAlign(Paint.Align.LEFT);
        paint.setTypeface(Typeface.DEFAULT_BOLD);
        paint.setTextSize(size1);
        paint.setColor(colorFor(average, limit));
        canvas.drawText(line1, textLeft, height / 2f - 2 * px, paint);
        paint.setTypeface(Typeface.DEFAULT);
        paint.setTextSize(size2);
        paint.setColor(0xFFDADCE0);
        canvas.drawText(line2, textLeft, height / 2f + size2 + 1 * px, paint);
        return bmp;
    }

    // endregion

    // region Test

    private static final String ACTION_TEST = "app.dewaze.ZONE_TEST";
    private static boolean testReceiverRegistered;
    /** A simulated zone is not ended by Waze's real insights, which have no zone. */
    private static volatile boolean simulating;

    /**
     * Only when enabled with {@code adb shell setprop log.tag.DeWazeAlertsBar DEBUG}: lets a zone be
     * simulated with {@code adb shell am broadcast -a app.dewaze.ZONE_TEST --ei left 5000 --ei limit 100}
     * (and {@code --ez clear true} to end it).
     */
    @android.annotation.SuppressLint("UnspecifiedRegisterReceiverFlag") // the flag exists from API 33 only
    static synchronized void registerTestReceiver(Context context) {
        if (testReceiverRegistered || context == null || !Log.isLoggable(TAG, Log.DEBUG)) {
            return;
        }
        BroadcastReceiver receiver = new BroadcastReceiver() {
            @Override
            public void onReceive(Context c, Intent intent) {
                if (intent.getBooleanExtra("clear", false)) {
                    simulating = false;
                    end("test cleared");
                    return;
                }
                if (intent.hasExtra("limit")) {
                    onSpeedometerState(intent.getIntExtra("limit", -1));
                }
                if (intent.hasExtra("left")) {
                    simulating = true;
                    progress(intent.getIntExtra("left", 0));
                }
            }
        };
        IntentFilter filter = new IntentFilter(ACTION_TEST);
        if (Build.VERSION.SDK_INT >= 33) {
            context.registerReceiver(receiver, filter, Context.RECEIVER_EXPORTED);
        } else {
            context.registerReceiver(receiver, filter);
        }
        testReceiverRegistered = true;
        Log.d(TAG, "Average speed zone test receiver on");
    }

    // endregion

    // region Reflection

    private static Object parse(String className, byte[] proto) throws Exception {
        return Class.forName(className).getMethod("parseFrom", byte[].class).invoke(null, (Object) proto);
    }

    private static Object call(Object target, String method) throws Exception {
        Method m = target.getClass().getMethod(method);
        return m.invoke(target);
    }

    // endregion
}
