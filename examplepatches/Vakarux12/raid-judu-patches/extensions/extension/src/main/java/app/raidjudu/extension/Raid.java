package app.raidjudu.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.content.pm.SigningInfo;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.util.Base64;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeProvider;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.PublicKey;
import java.security.cert.CertificateFactory;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

@SuppressWarnings("unused")
public final class Raid {
    private static final String TAG = "raid";
    private static final String PKG = "com.judu";
    // judu's play signing cert, google keys (firebase, sign in) are pinned to it
    private static final String CERT = "MIIFiDCCA3CgAwIBAgIUN0LaltgPQd+coP6M+tfRftcLwoQwDQYJKoZIhvcNAQELBQAwdDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC0dvb2dsZSBJbmMuMRAwDgYDVQQLEwdBbmRyb2lkMRAwDgYDVQQDEwdBbmRyb2lkMCAXDTI0MDcxNjEzMDQ0MVoYDzIwNTQwNzE2MTMwNDQxWjB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLR29vZ2xlIEluYy4xEDAOBgNVBAsTB0FuZHJvaWQxEDAOBgNVBAMTB0FuZHJvaWQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCOG5/a+3gvUPuPCkDAzak8AqDpgjHNsHnfZq8OSHxxbJJM6VJ3Sxm6LP1xugbtGF8OrXpCVjAGWl9YwEftZI4J+RYKdfkzEE9p2kYq6PFX6K/u3mYyNXYYAkWzE5//TqOfYxmDiTFRmBtt3y5BWDAJvzdIfj9sHjn1GFgd4+u6nca8Cr7bXoCLlI/3pdmTvQXrLW+/R2AW5Gv8nifZb7xQdlqFGpxUaqLzkIt2mCNfI88Tpt2BD5EYk7UjLZlLbYyw/payGYnQBY/fDM3ejOCXdmSgh3PkmKYQdALFlXxVpS8YCRFskZAe+Yw80jz9CFZPHD01L0Uyj15pTe8J5awsvxT+dALKdzYmRuBRb/q7fjvKmFY12FYQlE3xzWx87lVulXOo6wo7hE+iSAOU/BbFT+WFBzAEd+aqH13+5xJVLn/2HoYQMWsw3xWWsk0lrAnL/u5NgOMszrCK5MTA4AKPDsuP5iPEIpr3T/eHE0uawLViGNZVgYtOmMMbt2Sy9vDrJUP23V5WlmEu38ryjT9DkhsFddg06JKIA9VVHmCAlfm8KmIsWgan8ppAhuGmfv0J2mghLfDAR2MaZwJ4PNC7MePrLt+covCzzzE6JkuUL9mCz9j17Me+U0XN5JtFm8oz6js/M6j+m3fX1GNXOjPtepk6SizZvYai38RL5QnALQIDAQABoxAwDjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4ICAQAKgC/AiDdKBbxy/JOTbKBkQk3D/LNn3o0k3lVXYBpeReG77bZ5h1LvYYuskT6ZO1QmB7kPxzjym5827dd/Lz85+CBcUmdLbH8Uswup3LRWMAOWHxIkkU9tR6vQYZ96C5CV9Tu3euiqfO6VrcnmZlTu7+2YjJv40ntyZSgDBWX27aXf2u1RGa+NXKUEnISbw7JdeeaMRWddLBpW1MpPYTHd7nrAVfSBHmtVAQAqn30/v4puL9Lq3sOjPzVUJ2GM0FkQhC2TybovjPxmaMkgoHnMEDITirafU/ZkQ/4kWCGsNWdQuteS3qaAT2fdoRfZ1JlwuHmqv26z5GTnLY4mcmg45eXjVrL6qF4SgdFtS9DXtg4A86wubiaidbRXb53KYi8w8SimfOKVEEJX2sajN2T6/JfngcmxSq9t6fzYPX7Wo2sPy6rlKPwY2667+tMqW1yy1O2jjGEi+QEYE6Oy4WVRFmQh+L5a/RjZ81DJn9pSH9slgaHqq9JLxnR2Zpguv2IN39ouiEdNy1kCKKn+XYQ6tzGzreVcxvq4Jthg0g3MDjUYc8Wt0UoVDPjC9bKDqi/gBlvwNYwRs2k4Yn0ZmmyTMRAVOGagAawun4KJuu1BKU66BaUYcDWxr48zaMCyFyi03oTnh3caeYzlw0MDHRjHbA2iggj692a0xSzLxHA8tw==";
    private static final String DOCS = "https://firestore.googleapis.com/v1/projects/raid-lt-live/databases/(default)/documents";
    private static final String KEY = "key=AIzaSyBkzYFg-ETAUecP_Rq_0xOIzexFfGjUj0Q";
    private static final String QUERY = DOCS + ":runQuery?" + KEY;
    private static final Object[][] CITIES = {
            {"Vilnius", 54.683, 25.283}, {"Kaunas", 54.898, 23.906}, {"Klaipėda", 55.703, 21.144},
            {"Panevėžys", 55.735, 24.357}, {"Šiauliai", 55.935, 23.314}, {"Alytus", 54.396, 24.046},
            {"Druskininkai", 54.014, 23.982}};
    private static final long REFRESH_MS = 60_000;
    private static final int NEAR_M = 1000;
    // how long the pill keeps a stop's report after judu last asked for its departures, an open stop asks every 10 s
    private static final long HERE_MS = 20_000;
    // judu's location button labels, every map screen has the button
    private static final String[] MAP = {
            "Rodyti dabartinę vietą", "Vietos prieiga išjungta", "Nustatoma Jūsų vieta", "Centruoti žemėlapį ir sekti Jūsų vietą", "Sekama Jūsų vieta",
            "Center map to current location", "Location access off", "Locating your position", "Center map and follow your location", "Following your location"};
    private static final int GREEN = 0xFF43A047, RED = 0xFFE53935;
    private static final String STYLE = "https://maps.judu.lt/styles/bright/style.json";
    // libapp.so asks for this instead of STYLE, RaidPatch.kt swaps it in
    private static final String LOCAL_STYLE = "http://127.0.0.1:47123/styles/bright/style.js";
    // same for judu's departures, they come to /stops/ and go on to stops.lt
    private static final String DEPARTURES = "https://www.stops.lt/vilnius/departures2.php";
    private static final int PORT = 47123;
    private static final String DOT = "{\"id\":\"raid-dot\",\"type\":\"circle\",\"source\":\"raid\",\"source-layer\":\"raid\","
            + "\"paint\":{\"circle-radius\":7,\"circle-color\":\"#d32f2f\",\"circle-stroke-color\":\"#ffffff\",\"circle-stroke-width\":2}}";
    private static final String LABEL = "{\"id\":\"raid-label\",\"type\":\"symbol\",\"source\":\"raid\",\"source-layer\":\"raid\","
            + "\"layout\":{\"text-field\":\"{label}\",\"text-font\":[\"Noto Sans Bold\"],\"text-size\":12,\"text-anchor\":\"top\",\"text-offset\":[0,0.7],\"text-allow-overlap\":true},"
            + "\"paint\":{\"text-color\":\"#b71c1c\",\"text-halo-color\":\"#ffffff\",\"text-halo-width\":2}}";

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static WeakReference<Activity> activity = new WeakReference<>(null);
    private static TextView pill;
    private static SharedPreferences prefs;
    private static final List<Report> reports = new ArrayList<>();
    private static final HashMap<String, Object[]> byCity = new HashMap<>();
    private static boolean started, running, watching;
    // the report at the stop judu last loaded departures for, and whether its name made it on screen
    private static Report here;
    private static long hereAt;
    private static boolean stopSeen;
    // flutter's semantics nodes, kept by its accessibility bridge
    private static List<HashMap<?, ?>> trees;
    private static Object jni;
    private static final HashMap<Class<?>, List<Field>> texts = new HashMap<>();

    static final class Report {
        String id, stopId, stop, next, user, label;
        double lat, lng;
        long at, created, ageMin, plus, minus, comments;
        float dist = -1;
        final List<Vote> votes = new ArrayList<>();
    }

    static final class Vote {
        boolean up;
        String user;
        long at;
    }

    // runs at the end of MainActivity.<init>, onCreate and onResume are done by the time the post runs
    public static void attach(Activity a) {
        if (!started) spoofSignature();
        activity = new WeakReference<>(a);
        // queued ahead of the engine's first platform calls, so the server is up before dart asks for the style
        main.post(() -> {
            if (!started) {
                started = true;
                prefs = a.getSharedPreferences("raid", 0);
                blockStyleCache(a);
                serve();
            }
            addPill(a);
            trees = null;
            if (!running) {
                running = true;
                tick();
            }
            if (!watching) {
                watching = true;
                watch();
            }
        });
    }

    private static void addPill(Activity a) {
        TextView t = new TextView(a);
        float dp = a.getResources().getDisplayMetrics().density;
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        t.setTextColor(0xFFFFFFFF);
        t.setPadding((int) (12 * dp), (int) (6 * dp), (int) (12 * dp), (int) (6 * dp));
        t.setElevation(6 * dp);
        t.setText("Kontrolė: …");
        // long stop names get cut, not the screen edge
        t.setSingleLine(true);
        t.setEllipsize(TextUtils.TruncateAt.END);
        t.setMaxWidth(a.getResources().getDisplayMetrics().widthPixels - (int) (32 * dp));
        t.setOnClickListener(v -> {
            if (fresh()) open(a, here);
            else list(a);
        });
        int top = 0;
        int id = a.getResources().getIdentifier("status_bar_height", "dimen", "android");
        if (id != 0) top = a.getResources().getDimensionPixelSize(id);
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        lp.topMargin = top + (int) (4 * dp);
        a.addContentView(t, lp);
        pill = t;
        paint(false);
        draggable(t);
    }

    // drag it off whatever it covers, the spot sticks across launches
    private static void draggable(TextView t) {
        t.setTranslationX(prefs.getFloat("x", 0));
        t.setTranslationY(prefs.getFloat("y", 0));
        int slop = ViewConfiguration.get(t.getContext()).getScaledTouchSlop();
        float[] start = new float[4];
        boolean[] dragged = {false};
        t.setOnTouchListener((v, e) -> {
            switch (e.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    start[0] = e.getRawX();
                    start[1] = e.getRawY();
                    start[2] = v.getTranslationX();
                    start[3] = v.getTranslationY();
                    dragged[0] = false;
                    return true;
                case MotionEvent.ACTION_MOVE:
                    float dx = e.getRawX() - start[0], dy = e.getRawY() - start[1];
                    if (Math.hypot(dx, dy) > slop) dragged[0] = true;
                    if (dragged[0]) {
                        v.setTranslationX(start[2] + dx);
                        v.setTranslationY(start[3] + dy);
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    if (dragged[0]) prefs.edit().putFloat("x", v.getTranslationX()).putFloat("y", v.getTranslationY()).apply();
                    else v.performClick();
                    return true;
            }
            return false;
        });
    }

    private static void paint(boolean near) {
        GradientDrawable bg = new GradientDrawable();
        bg.setCornerRadius(999);
        bg.setColor(near ? 0xF0D32F2F : 0xE0303030);
        pill.setBackground(bg);
    }

    private static void tick() {
        Activity a = activity.get();
        if (a == null || a.isDestroyed()) {
            running = false;
            return;
        }
        // in the background (or not drawn yet), look again soon
        boolean visible = a.getWindow().getDecorView().getWindowVisibility() == View.VISIBLE;
        main.postDelayed(Raid::tick, visible ? REFRESH_MS : 2000);
        if (!visible) return;
        Location me = whereAmI(a);
        new Thread(() -> {
            try {
                List<Report> rows = parse(rows(nearestCity(me)), me);
                main.post(() -> show(rows));
            } catch (Throwable t) {
                Log.w(TAG, "fetch failed", t);
                main.post(() -> pill.setText("Kontrolė: nėra ryšio"));
            }
        }).start();
    }

    private static void show(List<Report> rows) {
        reports.clear();
        reports.addAll(rows);
        render();
    }

    private static boolean fresh() {
        return here != null && System.currentTimeMillis() - hereAt < HERE_MS;
    }

    private static void render() {
        if (pill == null) return;
        if (fresh()) {
            pill.setText("Kontrolė " + hhmm(here.at) + " · ▲" + here.plus + " ▼" + here.minus + " · " + here.stop);
            paint(true);
            return;
        }
        List<Report> rows = reports;
        Report first = rows.isEmpty() ? null : rows.get(0);
        boolean near = first != null && first.dist >= 0 && first.dist < NEAR_M;
        String text = "Kontrolė: " + rows.size();
        if (first != null && first.dist >= 0) text += " · artimiausia " + meters(first.dist);
        pill.setText(text);
        paint(near);
    }

    // judu asked stops.lt for this stop's departures, so its stop view (or dashboard) shows it
    private static void atStop(String id) {
        if (id == null) return;
        try {
            for (Report r : parse(rows("Vilnius"), null))
                if (id.equals(r.stopId)) {
                    main.post(() -> {
                        // the same report polled again keeps its state, a new one has to show up on screen first
                        if (here == null || !here.id.equals(r.id)) stopSeen = false;
                        here = r;
                        hereAt = System.currentTimeMillis();
                        render();
                    });
                    return;
                }
        } catch (Throwable t) {
            Log.w(TAG, "stop lookup failed", t);
        }
    }

    // twice a second. the stop report goes once judu stops showing or polling that stop,
    // and the pill only shows on a map or with a stop report
    private static void watch() {
        Activity a = activity.get();
        if (a == null || a.isDestroyed()) {
            watching = false;
            return;
        }
        main.postDelayed(Raid::watch, 500);
        if (pill == null || a.getWindow().getDecorView().getWindowVisibility() != View.VISIBLE) return;
        String screen = screen(a);
        if (here != null && screen != null && screen.contains(here.stop)) stopSeen = true;
        if (here != null && (!fresh() || stopSeen && screen != null && !screen.contains(here.stop))) {
            here = null;
            render();
        }
        // no tree to read, keep it like before
        boolean show = screen == null || here != null;
        for (String m : MAP) show = show || screen.contains(m);
        if (show != (pill.getVisibility() == View.VISIBLE)) Log.d(TAG, "pill " + (show ? "shown" : "hidden") + ", " + (screen == null ? "no tree" : screen.length() + " chars"));
        pill.setVisibility(show ? View.VISIBLE : View.GONE);
    }

    // every text flutter has on screen, null if its semantics can't be read
    private static String screen(Activity a) {
        try {
            if (trees == null) trees = trees(a.getWindow().getDecorView());
            if (trees == null) return null;
            StringBuilder b = new StringBuilder();
            for (HashMap<?, ?> m : trees)
                for (Object node : m.values())
                    for (Field f : texts(node.getClass())) b.append(f.get(node)).append('\n');
            if (b.length() > 0) return b.toString();
            // the bridge switches them off again whenever an accessibility service goes away
            semantics();
            return null;
        } catch (Throwable t) {
            return null;
        }
    }

    // the flutter view holds the accessibility bridge, flutter only builds semantics while one is on,
    // so they get switched on through FlutterJNI two fields down the bridge
    private static List<HashMap<?, ?>> trees(View v) throws Exception {
        if (v instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) v).getChildCount(); i++) {
            List<HashMap<?, ?>> t = trees(((ViewGroup) v).getChildAt(i));
            if (t != null) return t;
        }
        if (!app(v)) return null;
        for (Field f : v.getClass().getDeclaredFields()) {
            if (!AccessibilityNodeProvider.class.isAssignableFrom(f.getType())) continue;
            f.setAccessible(true);
            Object bridge = f.get(v);
            if (bridge == null) continue;
            List<HashMap<?, ?>> maps = new ArrayList<>();
            jni = null;
            for (Field g : bridge.getClass().getDeclaredFields()) {
                g.setAccessible(true);
                Object o = g.get(bridge);
                if (o instanceof HashMap) maps.add((HashMap<?, ?>) o);
                else if (o != null && app(o)) for (Field h : o.getClass().getDeclaredFields()) {
                    h.setAccessible(true);
                    Object x = h.get(o);
                    if (x != null && x.getClass().getName().equals("io.flutter.embedding.engine.FlutterJNI")) jni = x;
                }
            }
            if (jni == null) continue;
            semantics();
            Log.d(TAG, "semantics on, " + maps.size() + " trees");
            return maps;
        }
        return null;
    }

    private static void semantics() throws Exception {
        jni.getClass().getMethod("setSemanticsEnabled", boolean.class).invoke(jni, true);
    }

    // framework classes hide their fields, only judu's own get looked into
    private static boolean app(Object o) {
        return o.getClass().getClassLoader() != View.class.getClassLoader();
    }

    private static List<Field> texts(Class<?> c) {
        List<Field> l = texts.get(c);
        if (l != null) return l;
        l = new ArrayList<>();
        for (Field f : c.getDeclaredFields())
            if (f.getType() == String.class) {
                f.setAccessible(true);
                l.add(f);
            }
        texts.put(c, l);
        return l;
    }

    private static AlertDialog.Builder dialog(Activity a) {
        boolean dark = (a.getResources().getConfiguration().uiMode & 48) == 32;
        return new AlertDialog.Builder(a, dark
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert)
                .setPositiveButton("Gerai", null);
    }

    private static void list(Activity a) {
        AlertDialog.Builder b = dialog(a).setTitle("raid.lt kontrolė");
        // the list can change under an open dialog, taps go to what was shown
        List<Report> shown = new ArrayList<>(reports);
        if (shown.isEmpty()) b.setMessage("Šiuo metu pranešimų nėra.");
        else {
            CharSequence[] items = new CharSequence[shown.size()];
            for (int i = 0; i < items.length; i++) {
                Report r = shown.get(i);
                items[i] = r.stop + " → " + r.next + "\n"
                        + (r.dist >= 0 ? meters(r.dist) + " · " : "")
                        + "prieš " + r.ageMin + " min · ▲" + r.plus + " ▼" + r.minus;
            }
            b.setItems(items, (d, i) -> open(a, shown.get(i)));
        }
        b.show();
    }

    // raid.lt's report page, who voted stovi or nestovi and when, then the comments
    static void open(Activity a, Report r) {
        AlertDialog.Builder b = dialog(a).setTitle("Pranešimas");
        Context c = b.getContext();
        LinearLayout col = new LinearLayout(c);
        col.setOrientation(LinearLayout.VERTICAL);
        col.setPadding(dp(c, 24), dp(c, 8), dp(c, 24), dp(c, 8));
        col.addView(text(c, r.stop, 18, true));
        col.addView(text(c, "Link: " + r.next, 14, false));
        TextView meta = text(c, "@" + r.user + " · " + hhmm(r.created) + " · atnaujinta prieš " + r.ageMin + " min", 13, false);
        meta.setAlpha(0.6f);
        col.addView(meta);
        SpannableStringBuilder score = new SpannableStringBuilder();
        span(score, "STOVI " + r.plus, GREEN);
        score.append("     ");
        span(score, "NESTOVI " + r.minus, RED);
        col.addView(header(c, score));
        // newest first, like raid.lt
        for (int i = r.votes.size() - 1; i >= 0; i--) {
            Vote v = r.votes.get(i);
            col.addView(row(c, v.up ? "▲" : "▼", v.up ? GREEN : RED, v.user, hhmm(v.at)));
        }
        col.addView(header(c, "Komentarai (" + r.comments + ")"));
        TextView wait = text(c, "…", 14, false);
        col.addView(wait);
        ScrollView scroll = new ScrollView(c);
        scroll.addView(col);
        b.setView(scroll).show();
        new Thread(() -> {
            try {
                JSONArray docs = comments(r.id);
                main.post(() -> {
                    col.removeView(wait);
                    if (docs.length() == 0) col.addView(text(c, "Komentarų nėra", 14, false));
                    for (int i = 0; i < docs.length(); i++) comment(c, col, docs.optJSONObject(i).optJSONObject("fields"));
                });
            } catch (Throwable t) {
                Log.w(TAG, "comments failed", t);
                main.post(() -> wait.setText("Nepavyko įkelti komentarų"));
            }
        }).start();
    }

    private static void comment(Context c, LinearLayout col, JSONObject f) {
        if (f == null) return;
        TextView who = text(c, str(f, "username") + " · " + hhmm(ts(f, "createTs")), 13, true);
        who.setPadding(0, dp(c, 8), 0, 0);
        col.addView(who);
        String body = f.has("text") ? str(f, "text") : "";
        if (!body.isEmpty()) col.addView(text(c, body, 14, false));
        String photo = f.has("photoUrl") ? str(f, "photoUrl") : "";
        if (photo.isEmpty()) return;
        TextView link = text(c, "Nuotrauka ↗", 14, false);
        link.setTextColor(0xFF1E88E5);
        link.setOnClickListener(v -> {
            try {
                c.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(photo)));
            } catch (Exception ignored) {
            }
        });
        col.addView(link);
    }

    private static View row(Context c, String mark, int color, String who, String when) {
        LinearLayout l = new LinearLayout(c);
        l.setPadding(0, dp(c, 4), 0, dp(c, 4));
        TextView m = text(c, mark, 14, true);
        m.setTextColor(color);
        m.setMinWidth(dp(c, 28));
        TextView t = text(c, when, 14, false);
        t.setAlpha(0.6f);
        l.addView(m);
        l.addView(text(c, who, 14, false), new LinearLayout.LayoutParams(0, -2, 1));
        l.addView(t);
        return l;
    }

    private static TextView header(Context c, CharSequence s) {
        TextView t = text(c, s, 16, true);
        t.setPadding(0, dp(c, 16), 0, dp(c, 4));
        return t;
    }

    private static TextView text(Context c, CharSequence s, int sp, boolean bold) {
        TextView t = new TextView(c);
        t.setText(s);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        TypedArray fg = c.obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        t.setTextColor(fg.getColor(0, 0xFF000000));
        fg.recycle();
        if (bold) t.setTypeface(Typeface.DEFAULT_BOLD);
        return t;
    }

    private static void span(SpannableStringBuilder b, String s, int color) {
        int start = b.length();
        b.append(s);
        b.setSpan(new ForegroundColorSpan(color), start, b.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    private static int dp(Context c, int n) {
        return (int) (n * c.getResources().getDisplayMetrics().density);
    }

    static String hhmm(long at) {
        return new SimpleDateFormat("HH:mm", Locale.US).format(new Date(at));
    }

    static String meters(float d) {
        return d < 1000 ? Math.round(d / 10) * 10 + " m" : String.format(Locale.US, "%.1f km", d / 1000);
    }

    // judu already holds the location permission, take whatever fix is freshest
    private static Location whereAmI(Activity a) {
        Location best = null;
        try {
            LocationManager lm = (LocationManager) a.getSystemService(Activity.LOCATION_SERVICE);
            for (String p : lm.getProviders(true)) {
                Location l = lm.getLastKnownLocation(p);
                if (l != null && (best == null || l.getTime() > best.getTime())) best = l;
            }
            // no cached fix yet, ask for one so the next tick has it
            if (best == null) for (String p : lm.getProviders(true))
                lm.requestSingleUpdate(p, new LocationListener() {
                    public void onLocationChanged(Location l) {
                    }

                    public void onStatusChanged(String p, int s, Bundle b) {
                    }

                    public void onProviderEnabled(String p) {
                    }

                    public void onProviderDisabled(String p) {
                    }
                }, Looper.getMainLooper());
        } catch (SecurityException ignored) {
        }
        return best;
    }

    static String nearestCity(Location me) {
        return me == null ? "Vilnius" : nearestCity(me.getLatitude(), me.getLongitude());
    }

    static String nearestCity(double lat, double lng) {
        Object[] best = CITIES[0];
        double bestD = Double.MAX_VALUE;
        for (Object[] c : CITIES) {
            double d = Math.pow((double) c[1] - lat, 2) + Math.pow(((double) c[2] - lng) * 0.58, 2);
            if (d < bestD) {
                bestD = d;
                best = c;
            }
        }
        return (String) best[0];
    }

    static List<Report> parse(JSONArray rows, Location me) throws Exception {
        List<Report> out = new ArrayList<>();
        long now = System.currentTimeMillis();
        float[] d = new float[1];
        for (int i = 0; i < rows.length(); i++) {
            JSONObject doc = rows.getJSONObject(i).optJSONObject("document");
            if (doc == null) continue;
            JSONObject f = doc.getJSONObject("fields");
            Report r = new Report();
            r.id = doc.getString("name").substring(doc.getString("name").lastIndexOf('/') + 1);
            r.stopId = str(f, "stopLocationId");
            r.stop = str(f, "stopName");
            r.next = str(f, "nextStopName");
            r.user = str(f, "username");
            r.lat = num(f, "lat");
            r.lng = num(f, "long");
            r.at = ts(f, "updateTs");
            r.created = ts(f, "createTs");
            r.ageMin = Math.max(0, (now - r.at) / 60_000);
            // the time, not the age, a tile keeps it for the whole session
            r.label = "Kontrolė " + hhmm(r.at);
            r.plus = (long) num(f, "agregPointsFor");
            r.minus = (long) num(f, "agregPointsAgainst");
            r.comments = (long) num(f, "commentsCount");
            JSONArray votes = f.optJSONObject("votes") == null ? null
                    : f.getJSONObject("votes").getJSONObject("arrayValue").optJSONArray("values");
            for (int j = 0; votes != null && j < votes.length(); j++) {
                JSONObject vf = votes.getJSONObject(j).getJSONObject("mapValue").getJSONObject("fields");
                Vote v = new Vote();
                v.up = num(vf, "vote") > 0;
                v.user = str(vf, "username");
                v.at = ts(vf, "createTs");
                r.votes.add(v);
            }
            if (me != null) {
                Location.distanceBetween(me.getLatitude(), me.getLongitude(), r.lat, r.lng, d);
                r.dist = d[0];
            }
            out.add(r);
        }
        // nearest first when we know where we are, the query already gives newest first otherwise
        if (me != null) Collections.sort(out, (x, y) -> Float.compare(x.dist, y.dist));
        return out;
    }

    // the pill and every map tile of a city share one fetch a minute
    static synchronized JSONArray rows(String city) throws Exception {
        Object[] hit = byCity.get(city);
        if (hit != null && System.currentTimeMillis() - (long) hit[0] < REFRESH_MS - 10_000) return (JSONArray) hit[1];
        JSONArray rows = fetch(city);
        byCity.put(city, new Object[]{System.currentTimeMillis(), rows});
        return rows;
    }

    static JSONArray fetch(String city) throws Exception {
        String q = "{\"structuredQuery\":{\"from\":[{\"collectionId\":\"inspectorPosts\"}],"
                + "\"where\":{\"compositeFilter\":{\"op\":\"AND\",\"filters\":["
                + "{\"fieldFilter\":{\"field\":{\"fieldPath\":\"city\"},\"op\":\"EQUAL\",\"value\":{\"stringValue\":" + JSONObject.quote(city) + "}}},"
                + "{\"fieldFilter\":{\"field\":{\"fieldPath\":\"isValid\"},\"op\":\"EQUAL\",\"value\":{\"booleanValue\":true}}},"
                + "{\"fieldFilter\":{\"field\":{\"fieldPath\":\"isDeleted\"},\"op\":\"EQUAL\",\"value\":{\"booleanValue\":false}}}]}},"
                + "\"orderBy\":[{\"field\":{\"fieldPath\":\"updateTs\"},\"direction\":\"DESCENDING\"}],\"limit\":50}}";
        HttpURLConnection c = (HttpURLConnection) new URL(QUERY).openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(10_000);
        c.setDoOutput(true);
        c.setRequestProperty("content-type", "application/json");
        try (OutputStream o = c.getOutputStream()) {
            o.write(q.getBytes(StandardCharsets.UTF_8));
        }
        return new JSONArray(read(c));
    }

    // comments sit in a subcollection, read only when a report is opened. the rules allow 50 a page
    static JSONArray comments(String id) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(DOCS + "/inspectorPosts/" + id + "/comments?" + KEY + "&orderBy=createTs&pageSize=50").openConnection();
        c.setConnectTimeout(10_000);
        c.setReadTimeout(10_000);
        JSONArray docs = new JSONObject(read(c)).optJSONArray("documents");
        return docs == null ? new JSONArray() : docs;
    }

    static String read(HttpURLConnection c) throws Exception {
        return new String(bytes(c), StandardCharsets.UTF_8);
    }

    static byte[] bytes(HttpURLConnection c) throws Exception {
        try (InputStream in = c.getInputStream()) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] b = new byte[8192];
            for (int n; (n = in.read(b)) > 0; ) out.write(b, 0, n);
            return out.toByteArray();
        } finally {
            c.disconnect();
        }
    }

    // dart keeps the style 12 h, that would pin one tile url and with it old reports.
    // a directory where its cache file goes makes the write fail, so every map load asks again
    private static void blockStyleCache(Context c) {
        File f = new File(c.getFilesDir(), "flutter_map_vector_tiles/style/" + fnv1a(LOCAL_STYLE) + ".bin");
        if (f.isFile()) f.delete();
        f.mkdirs();
    }

    // flutter_map_vector_tiles names cache files like this, dart's signed hex included
    static String fnv1a(String s) {
        long h = 0xcbf29ce484222325L;
        for (int i = 0; i < s.length(); i++) {
            h ^= s.charAt(i);
            h *= 0x100000001b3L;
        }
        StringBuilder b = new StringBuilder(Long.toString(h, 16));
        while (b.length() < 16) b.insert(0, '0');
        return b.toString();
    }

    // judu's style plus a raid layer, and the raid tiles, for dart on 127.0.0.1
    private static void serve() {
        ServerSocket server;
        try {
            server = new ServerSocket(PORT, 50, InetAddress.getByName("127.0.0.1"));
        } catch (Exception e) {
            Log.e(TAG, "no local map server", e);
            return;
        }
        new Thread(() -> {
            while (true) {
                try {
                    Socket s = server.accept();
                    new Thread(() -> answer(s)).start();
                } catch (Exception e) {
                    Log.w(TAG, "accept failed", e);
                }
            }
        }).start();
    }

    private static void answer(Socket s) {
        try (Socket c = s) {
            BufferedReader in = new BufferedReader(new InputStreamReader(c.getInputStream(), StandardCharsets.UTF_8));
            String first = in.readLine();
            if (first == null) return;
            for (String h = in.readLine(); h != null && !h.isEmpty(); h = in.readLine()) ;
            Log.d(TAG, first);
            String path = first.split(" ")[1];
            String type = null;
            byte[] body;
            boolean stop = path.startsWith("/stops/");
            if (path.startsWith("/raid/")) body = tile(path);
            else if (stop) {
                int q = path.indexOf('?');
                HttpURLConnection up = (HttpURLConnection) new URL(DEPARTURES + (q < 0 ? "" : path.substring(q))).openConnection();
                up.setConnectTimeout(10_000);
                up.setReadTimeout(10_000);
                // dart decodes by this charset, without it lithuanian letters break
                type = up.getContentType();
                body = bytes(up);
            } else body = style().getBytes(StandardCharsets.UTF_8);
            String head = (body.length == 0 ? "HTTP/1.1 204 No Content" : "HTTP/1.1 200 OK")
                    + (type == null ? "" : "\r\ncontent-type: " + type)
                    + "\r\ncontent-length: " + body.length + "\r\nconnection: close\r\n\r\n";
            OutputStream o = c.getOutputStream();
            o.write(head.getBytes(StandardCharsets.UTF_8));
            o.write(body);
            o.flush();
            if (stop) atStop(Uri.parse("http://127.0.0.1" + path).getQueryParameter("stopid"));
        } catch (Throwable t) {
            Log.w(TAG, "map request failed", t);
        }
    }

    private static String style() throws Exception {
        String up;
        try {
            HttpURLConnection c = (HttpURLConnection) new URL(STYLE).openConnection();
            c.setConnectTimeout(10_000);
            c.setReadTimeout(10_000);
            up = read(c);
            prefs.edit().putString("style", up).apply();
        } catch (Exception e) {
            // offline, dart's own copy is blocked so hand it the last one
            up = prefs.getString("style", null);
            if (up == null) throw e;
        }
        JSONObject style = new JSONObject(up);
        // a new url per load, so no tile of an older load comes back from dart's tile cache
        String tiles = "http://127.0.0.1:" + PORT + "/raid/" + System.currentTimeMillis() + "/{z}/{x}/{y}.pbf";
        // from z11 a tile is small enough to sit in one city
        style.getJSONObject("sources").put("raid", new JSONObject()
                .put("type", "vector").put("tiles", new JSONArray().put(tiles)).put("minzoom", 11).put("maxzoom", 14));
        style.getJSONArray("layers").put(new JSONObject(DOT)).put(new JSONObject(LABEL));
        return style.toString();
    }

    // /raid/<load>/<z>/<x>/<y>.pbf
    private static byte[] tile(String path) throws Exception {
        String[] p = path.substring(0, path.length() - 4).split("/");
        int z = Integer.parseInt(p[3]), x = Integer.parseInt(p[4]), y = Integer.parseInt(p[5]);
        double n = 1 << z;
        double lng = (x + 0.5) / n * 360 - 180;
        double lat = Math.toDegrees(Math.atan(Math.sinh(Math.PI * (1 - 2 * (y + 0.5) / n))));
        return Mvt.encode(parse(rows(nearestCity(lat, lng)), null), z, x, y);
    }

    static double num(JSONObject f, String k) {
        JSONObject v = f.optJSONObject(k);
        if (v == null) return 0;
        return v.has("doubleValue") ? v.optDouble("doubleValue") : v.optDouble("integerValue", 0);
    }

    static String str(JSONObject f, String k) {
        JSONObject v = f.optJSONObject(k);
        return v == null ? "?" : v.optString("stringValue", "?");
    }

    static long ts(JSONObject f, String k) {
        JSONObject v = f.optJSONObject(k);
        if (v == null) return System.currentTimeMillis();
        try {
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);
            fmt.setTimeZone(TimeZone.getTimeZone("UTC"));
            return fmt.parse(v.getString("timestampValue")).getTime();
        } catch (Exception e) {
            return System.currentTimeMillis();
        }
    }

    // same trick as raid-trafi, rewrite PackageInfo as it comes out of the parcel
    private static void spoofSignature() {
        try {
            final Signature sig = new Signature(Base64.decode(CERT, 0));
            final Object info = signingInfo(sig);
            final Parcelable.Creator<PackageInfo> orig = PackageInfo.CREATOR;
            Field f = PackageInfo.class.getField("CREATOR");
            f.setAccessible(true);
            f.set(null, new Parcelable.Creator<PackageInfo>() {
                public PackageInfo createFromParcel(Parcel p) {
                    PackageInfo pi = orig.createFromParcel(p);
                    if (!PKG.equals(pi.packageName)) return pi;
                    if (pi.signatures != null) pi.signatures = new Signature[]{sig};
                    if (pi.signingInfo != null && info != null) pi.signingInfo = (SigningInfo) info;
                    return pi;
                }

                public PackageInfo[] newArray(int n) {
                    return orig.newArray(n);
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "signature spoof failed", t);
        }
    }

    // public SigningInfo constructor exists from api 35, older androids keep the real signingInfo
    private static Object signingInfo(Signature sig) {
        try {
            PublicKey key = CertificateFactory.getInstance("X.509")
                    .generateCertificate(new ByteArrayInputStream(sig.toByteArray())).getPublicKey();
            return SigningInfo.class.getConstructor(int.class, Collection.class, Collection.class, Collection.class)
                    .newInstance(2, Collections.singletonList(sig), Collections.singletonList(key), null);
        } catch (Throwable t) {
            Log.w(TAG, "no SigningInfo constructor", t);
            return null;
        }
    }
}
