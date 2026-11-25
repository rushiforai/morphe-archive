package app.template.extension.stayfree;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Entry points for the StayFree "In-app QR scanner" patch.
 * <p>
 * The browser extension and desktop app show a QR code with
 * {@code https://stayfreeapps.com/android-connect-device?pairingCode=…}. Scanned with the camera
 * app, that link only opens StayFree when Android has verified the app for stayfreeapps.com,
 * which never happens for a re-signed (patched) build, so it lands in the browser instead.
 * {@link QrScanActivity} scans it inside the app and hands the same link to
 * {@code MainActivity}, which runs StayFree's own QR pairing flow.
 */
@SuppressWarnings("unused")
public final class QrPairing {
    static final String TAG = "StayFreeQrPairing";

    static final String MAIN_ACTIVITY = "com.burockgames.timeclocker.main.MainActivity";
    private static final String DEEP_LINK = "https://stayfreeapps.com/android-connect-device?pairingCode=";

    // Unobfuscated StayFree classes/names used to recognise the "enter pairing code" sheet.
    private static final String SCREEN_BUNDLE = "com.burockgames.timeclocker.common.data.ScreenBundle";
    private static final String SHEET_TYPE = "com.burockgames.timeclocker.common.enums.ConnectDeviceBottomSheetType";
    private static final String ENTER_CODE_SHEET = "enter-pairing-code-bottom-sheet";
    private static final String SHEET_TYPE_ARG = "arg_string_json_platform_bottom_sheet_type_id";
    /** Platforms that show a QR code for the phone to scan. */
    private static final String[] SCANNABLE_SHEET_TYPES = {"CONNECT_WITH_BROWSER_EXTENSION", "CONNECT_WITH_DESKTOP_APP"};

    private static final String SHORTCUT_ID = "mben_scan_pairing_qr";

    private QrPairing() {
    }

    /**
     * Called at the start of {@code Application.onCreate()}: adds a "Scan pairing QR code"
     * launcher shortcut (long-press the app icon).
     */
    public static void start(Context context) {
        try {
            Context app = context.getApplicationContext();
            ShortcutManager shortcuts = app.getSystemService(ShortcutManager.class);
            if (shortcuts == null) return;
            ShortcutInfo info = new ShortcutInfo.Builder(app, SHORTCUT_ID)
                    .setShortLabel("Scan QR code")
                    .setLongLabel("Scan pairing QR code")
                    .setIcon(Icon.createWithAdaptiveBitmap(shortcutIcon()))
                    .setIntent(new Intent(Intent.ACTION_VIEW).setClass(app, QrScanActivity.class))
                    .build();
            shortcuts.addDynamicShortcuts(Collections.singletonList(info));
        } catch (Throwable t) {
            Log.w(TAG, "Could not add the scan shortcut", t);
        }
    }

    /**
     * Called at the start of StayFree's {@code navigateTo(BaseActivity, Screen)}. Opening the
     * "enter pairing code" sheet for the browser extension or desktop app also opens the scanner
     * on top of it; closing the scanner leaves the sheet to type the code by hand.
     */
    public static void onNavigate(Activity activity, Object screen) {
        try {
            if (activity == null || screen == null || !isScannableEnterCodeSheet(screen)) return;
            activity.startActivity(new Intent(activity, QrScanActivity.class));
        } catch (Throwable t) {
            Log.w(TAG, "Could not open the QR scanner", t);
        }
    }

    private static boolean isScannableEnterCodeSheet(Object screen) throws ReflectiveOperationException {
        Object bundle = null;
        for (Class<?> c = screen.getClass(); c != null && bundle == null; c = c.getSuperclass()) {
            for (Field field : c.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) || !SCREEN_BUNDLE.equals(field.getType().getName())) continue;
                field.setAccessible(true);
                bundle = field.get(screen);
                break;
            }
        }
        if (bundle == null || !ENTER_CODE_SHEET.equals(bundle.getClass().getMethod("getPathPrefix").invoke(bundle))) {
            return false;
        }

        String typeId = null;
        for (Object arg : (List<?>) bundle.getClass().getMethod("getScreenArgList").invoke(bundle)) {
            if (arg == null || !SHEET_TYPE_ARG.equals(arg.getClass().getMethod("getName").invoke(arg))) continue;
            Field value = arg.getClass().getDeclaredField("value");
            value.setAccessible(true);
            Object v = value.get(arg);
            typeId = v == null ? null : String.valueOf(v);
        }
        if (typeId == null) return false;

        Class<?> sheetType = Class.forName(SHEET_TYPE, false, screen.getClass().getClassLoader());
        for (Object constant : sheetType.getEnumConstants()) {
            String name = ((Enum<?>) constant).name();
            for (String scannable : SCANNABLE_SHEET_TYPES) {
                if (scannable.equals(name) && typeId.equals(String.valueOf(sheetType.getMethod("getId").invoke(constant)))) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * The pairing code in a scanned QR code: StayFree's own pairing link, or a bare code.
     * {@code null} for anything else.
     */
    static String pairingCode(String text) {
        if (text == null) return null;
        String value = text.trim();
        String lower = value.toLowerCase(Locale.US);
        if (lower.startsWith("http://") || lower.startsWith("https://")) {
            Uri uri = Uri.parse(value);
            String host = uri.getHost() == null ? "" : uri.getHost().toLowerCase(Locale.US);
            if (!host.equals("stayfreeapps.com") && !host.endsWith(".stayfreeapps.com")) return null;
            String code = uri.getQueryParameter("pairingCode");
            return code == null || code.trim().isEmpty() ? null : code.trim();
        }
        return value.matches("[A-Za-z0-9]{4,16}") ? value : null;
    }

    /** Hands the code to StayFree's own QR deep-link handling in {@code MainActivity.onCreate}. */
    static void openPairing(Activity activity, String code) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(DEEP_LINK + Uri.encode(code)))
                .setClassName(activity.getPackageName(), MAIN_ACTIVITY)
                // MainActivity uses the standard launch mode: CLEAR_TOP recreates it, so
                // onCreate() sees the link even when the app is already open.
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        activity.startActivity(intent);
    }

    /** {@code ip:port} of the local sync server on this phone's LAN, if it runs. */
    static String localSyncAddress() {
        if (!LocalSync.isRunning()) return null;
        String fallback = null;
        try {
            for (NetworkInterface nif : Collections.list(NetworkInterface.getNetworkInterfaces())) {
                if (!nif.isUp() || nif.isLoopback()) continue;
                for (InetAddress address : Collections.list(nif.getInetAddresses())) {
                    if (!(address instanceof Inet4Address) || !address.isSiteLocalAddress()) continue;
                    String value = address.getHostAddress() + ":" + LocalSync.PORT;
                    if (nif.getName().startsWith("wlan")) return value;
                    if (fallback == null) fallback = value;
                }
            }
        } catch (Exception ignored) {
        }
        return fallback;
    }

    /** Adaptive launcher icon: white QR finder squares on StayFree blue. */
    private static Bitmap shortcutIcon() {
        int size = 216; // 108dp at 2x; the launcher masks the outer third.
        Bitmap bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        canvas.drawColor(0xFF4E7CFF);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        paint.setColor(0xFFFFFFFF);
        float unit = size / 18f; // 6 units of safe zone each side, 6 units of glyph
        float[][] corners = {{6, 6}, {9.6f, 6}, {6, 9.6f}};
        for (float[] corner : corners) {
            float x = corner[0] * unit, y = corner[1] * unit, s = 2.4f * unit;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(unit * 0.45f);
            canvas.drawRoundRect(new RectF(x, y, x + s, y + s), unit * 0.3f, unit * 0.3f, paint);
            paint.setStyle(Paint.Style.FILL);
            canvas.drawRect(x + s * 0.32f, y + s * 0.32f, x + s * 0.68f, y + s * 0.68f, paint);
        }
        paint.setStyle(Paint.Style.FILL);
        float d = unit * 0.6f;
        float[][] dots = {{10, 10}, {11, 11}, {10.9f, 9.7f}, {9.8f, 11.2f}, {11.3f, 10.2f}};
        for (float[] dot : dots) canvas.drawRect(dot[0] * unit, dot[1] * unit, dot[0] * unit + d, dot[1] * unit + d, paint);
        return bitmap;
    }
}
