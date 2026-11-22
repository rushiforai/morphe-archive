package io.github.daydreamfix.ext;

import android.accounts.Account;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.ImageView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Google's store server is gone, so the store, Discovery, the library and search are all served
 * from store.json. Same behaviour as the root version's hooks in MainHook.
 */
public final class Store {
    private Store() {}

    private static final String TAG = Daydream.TAG;
    private static final String STORE_JSON_URL =
            "https://raw.githubusercontent.com/patapon888/morphe-patches/main/store/store.json";
    private static final String FAKE = "FAKE:";
    private static final int IMAGE_PROMOTIONAL_WIDE = 3;
    private static final int IMAGE_PREVIEW = 4;

    private static Class<?> cls(String name) throws ClassNotFoundException {
        return Class.forName(name);
    }

    private static Object staticField(String cls, String name) throws Exception {
        return Reflect.field(cls(cls), name).get(null);
    }

    private static Object create(String cls) throws Exception {
        Constructor<?> c = cls(cls).getDeclaredConstructor();
        c.setAccessible(true);
        return c.newInstance();
    }

    private static void deliver(Object callback, Object result, Exception failure) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                if (failure != null) {
                    Reflect.call(callback, "a", new Class<?>[] {Exception.class}, failure);
                } else {
                    Reflect.call(callback, "a", new Class<?>[] {Object.class}, result);
                }
            } catch (Throwable t) {
                Log.e(TAG, "store delivery failed", t);
            }
        });
    }

    // ── Requests ───────────────────────────────────────────────────────────

    /** amu.a(Account, dvq, ada). biw is the VR store, ahd 2D Discovery and bcw the VR library. */
    public static boolean onStoreRequest(Object amu, Account account, Object request, Object callback) {
        String name = callback.getClass().getSimpleName();
        if (!"biw".equals(name) && !"ahd".equals(name) && !"bcw".equals(name)) return false;
        new Thread(() -> {
            Object result = null;
            Exception failure = null;
            try {
                result = buildStoreResponse("bcw".equals(name));
            } catch (Exception e) {
                Log.e(TAG, "store.json failed", e);
                failure = e;
            }
            deliver(callback, result, failure);
        }, "DaydreamStore").start();
        return true;
    }

    /** amu.a(Account, String, int, efz[], byte[], ada). akw is the 2D search screen. */
    public static boolean onSearch(Object amu, Account account, String query, int size, Object filters,
            byte[] nextPage, Object callback) {
        String lowered = query.toLowerCase();
        boolean forVr = !"akw".equals(callback.getClass().getSimpleName());
        new Thread(() -> {
            Object result = null;
            Exception failure = null;
            try {
                result = buildSearchResults(lowered, nextPage != null, forVr);
            } catch (Exception e) {
                Log.e(TAG, "search failed", e);
                failure = e;
            }
            deliver(callback, result, failure);
        }, "DaydreamSearch").start();
        return true;
    }

    private static Object buildSearchResults(String query, boolean nextPage, boolean forVr) throws Exception {
        List<Object> groups = new ArrayList<>();
        // Everything fits on the first page.
        if (!nextPage) {
            Object response = buildStoreResponse(forVr);
            for (Object collection : (Object[]) Reflect.get(Reflect.get(response, "e"), "a")) {
                List<Object> matches = new ArrayList<>();
                for (Object entry : (Object[]) Reflect.get(collection, "d")) {
                    String title = (String) Reflect.get(Reflect.get(entry, "b"), "c");
                    if (title != null && title.toLowerCase().contains(query)) matches.add(entry);
                }
                if (matches.isEmpty()) continue;
                Object group = create("egx");
                Reflect.set(group, "a", Reflect.get(collection, "b"));
                Reflect.set(group, "b", matches.toArray((Object[]) Array.newInstance(cls("egu"), 0)));
                groups.add(group);
            }
        }
        Object result = create("dwh");
        Reflect.set(result, "b", groups.toArray((Object[]) Array.newInstance(cls("egx"), 0)));
        return result;
    }

    private static Object storeImage(String url, int type) throws Exception {
        Object image = create("egy");
        Reflect.set(image, "a", url);
        Reflect.set(image, "d", Integer.valueOf(type));
        return image;
    }

    /** A network blip shouldn't empty the store: retry, then fall back to the last good copy. */
    private static String storeJson() throws Exception {
        // Testing: a store.json pushed to the app's external files folder wins.
        File local = new File(Daydream.app.getExternalFilesDir(null), "store.json");
        if (local.isFile()) {
            try (FileInputStream in = new FileInputStream(local)) {
                byte[] data = new byte[(int) local.length()];
                int read = 0;
                while (read < data.length) {
                    int n = in.read(data, read, data.length - read);
                    if (n < 0) break;
                    read += n;
                }
                Log.i(TAG, "Using local store.json");
                return new String(data, 0, read, StandardCharsets.UTF_8);
            }
        }
        File saved = new File(Daydream.app.getCacheDir(), "store.json");
        Exception failure = null;
        for (int attempt = 0; attempt < 3; attempt++) {
            if (attempt > 0) Thread.sleep(1500);
            try {
                String json = download();
                new JSONObject(json);
                try (FileOutputStream out = new FileOutputStream(saved)) {
                    out.write(json.getBytes(StandardCharsets.UTF_8));
                }
                return json;
            } catch (IOException | JSONException e) {
                failure = e;
            }
        }
        if (!saved.isFile()) throw failure;
        Log.w(TAG, "store.json unreachable, using the saved copy: " + failure);
        try (FileInputStream in = new FileInputStream(saved)) {
            byte[] data = new byte[(int) saved.length()];
            int read = 0;
            while (read < data.length) {
                int n = in.read(data, read, data.length - read);
                if (n < 0) break;
                read += n;
            }
            return new String(data, 0, read, StandardCharsets.UTF_8);
        }
    }

    private static String download() throws IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL(STORE_JSON_URL).openConnection();
        conn.setConnectTimeout(8000);
        conn.setReadTimeout(8000);
        StringBuilder sb = new StringBuilder();
        try (BufferedReader r = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = r.readLine()) != null) sb.append(line);
        }
        return sb.toString();
    }

    private static Object buildStoreResponse(boolean forLibrary) throws Exception {
        JSONArray collections = new JSONObject(storeJson()).getJSONArray("collections");

        Object[] egvs = (Object[]) Array.newInstance(cls("egv"), collections.length());
        for (int i = 0; i < collections.length(); i++) {
            JSONObject col = collections.getJSONObject(i);
            JSONArray apps = col.getJSONArray("apps");
            Object[] egus = (Object[]) Array.newInstance(cls("egu"), apps.length());
            for (int j = 0; j < apps.length(); j++) egus[j] = buildEntry(apps.getJSONObject(j), forLibrary);

            Object egv = create("egv");
            Reflect.set(egv, "a", col.getString("id"));
            Reflect.set(egv, "b", col.getString("title"));
            Reflect.set(egv, "d", egus);
            egvs[i] = egv;
        }

        // dvw.e is read by the store and Discovery, dvw.c by the library.
        Object dwa = create("dwa");
        Reflect.set(dwa, "a", egvs);
        Object dvz = create("dvz");
        Reflect.set(dvz, "a", egvs);
        Object dvw = create("dvw");
        Reflect.set(dvw, "e", dwa);
        Reflect.set(dvw, "c", dvz);
        return dvw;
    }

    private static Object buildEntry(JSONObject app, boolean forLibrary) throws Exception {
        String pkg = app.getString("package");
        String iconUrl = app.optString("icon_url", null);
        String backgroundUrl = app.optString("background_url", null);

        Object egr = create("egr");
        Reflect.set(egr, "j", FAKE + pkg);
        if (iconUrl != null) Reflect.set(egr, "b", iconUrl);
        Reflect.set(egr, "c", app.getString("title"));
        Reflect.set(egr, "k", pkg);
        // App cards (VR library and the phone's Apps row) stay blank without a store link and
        // an offer. The default offer is free.
        Reflect.set(egr, "t", "https://play.google.com/store/apps/details?id=" + pkg);
        Object offers = Array.newInstance(cls("egi"), 1);
        Array.set(offers, 0, staticField("egi", "c"));
        Reflect.set(egr, "e", offers);

        Object egw = create("egw");
        Reflect.set(egw, "d", Integer.valueOf(app.optInt("motion", 2)));
        if (iconUrl != null) {
            // Store tiles show the image's top part, without a crop of their own.
            Reflect.set(egw, "a", forLibrary ? iconUrl
                    : CardImages.withLogoArea(iconUrl, (RectF) staticField("bjz", "a")));
            if (backgroundUrl != null) Reflect.set(egw, "b", backgroundUrl);
        }
        Reflect.set(egr, "q", egw);

        Object egu = create("egu");
        Reflect.set(egu, "b", egr);
        // Only the VR library wants a content type: it breaks the Discovery cards' layout.
        if (forLibrary) Reflect.set(egu, "a", Integer.valueOf(3));

        Object egz = create("egz");
        if (iconUrl != null) {
            // DiscoveryWindow stacks these with the first on top. Its slides take the layers from
            // PREVIEW images and its cards from PROMOTIONAL_WIDE.
            List<Object> layers = new ArrayList<>();
            layers.add(storeImage(iconUrl, IMAGE_PREVIEW));
            if (backgroundUrl != null) {
                layers.add(storeImage(backgroundUrl, IMAGE_PREVIEW));
                layers.add(storeImage(backgroundUrl, IMAGE_PROMOTIONAL_WIDE));
            }
            Object images = Array.newInstance(cls("egy"), layers.size());
            for (int k = 0; k < layers.size(); k++) Array.set(images, k, layers.get(k));
            Reflect.set(egz, "d", images);
        }
        Reflect.set(egu, "c", egz);
        return egu;
    }

    private static boolean isOurs(Object egu) {
        Object egr = Reflect.get(egu, "b");
        if (egr == null) return false;
        String marker = (String) Reflect.get(egr, "j");
        return marker != null && marker.startsWith(FAKE);
    }

    // ── Images ─────────────────────────────────────────────────────────────

    /** aeg.a and aeg.b(String, int, RectF). Null keeps Google's own cropping URL. */
    public static String imageUrl(Object aeg, String url, int size, RectF crop) {
        if (url == null || CardImages.isGoogleHosted(url)) return null;
        try {
            // The 2D cards hold a whole square image: nothing to crop, but a logo must fit.
            return crop != null && crop.equals(staticField("alr", "a"))
                    ? CardImages.withLogoArea(url, new RectF(0f, 0f, 1f, 1f))
                    : CardImages.withCrop(url, crop);
        } catch (Exception e) {
            Log.e(TAG, "imageUrl", e);
            return null;
        }
    }

    /** The crop alz.a(String, int, RectF, amc) should use. */
    public static RectF cropFor(String url, RectF crop) {
        RectF own = CardImages.cropOf(url);
        return own != null ? own : crop;
    }

    /** alz.a(Bitmap, int, RectF). Null lets the app do it. */
    public static Bitmap fitLogo(Bitmap image, int size, RectF crop) {
        return CardImages.fitCentredLogo(image, crop);
    }

    // ── 2D Discovery ───────────────────────────────────────────────────────

    /**
     * The layers are zoomed up to 1.65x so they can slide with the scroll position. Art made for
     * this leaves room for that; store.json's images do not, so they stay still at their real size.
     */
    public static Object stillLayers(Object config) {
        try {
            Object builder = Reflect.method(cls("aif"), "j").invoke(null);
            Class<?> b = builder.getClass();
            Reflect.method(b, "a", float.class).invoke(builder, 1f);
            Reflect.method(b, "b", float.class).invoke(builder, 1f);
            Reflect.method(b, "a", int.class).invoke(builder, Reflect.call(config, "c"));
            Reflect.method(b, "a", boolean.class).invoke(builder, false);
            Reflect.method(b, "b", boolean.class).invoke(builder, false);
            return Reflect.method(b, "a").invoke(builder);
        } catch (Exception e) {
            Log.e(TAG, "stillLayers", e);
            return config;
        }
    }

    /** The same scale for every layer, or a foreground no longer lines up with its background. */
    public static void cropLayers(Object window, Object config) {
        for (ImageView layer : (ImageView[]) Reflect.get(window, "e")) {
            layer.setScaleType(ImageView.ScaleType.CENTER_CROP);
        }
    }

    /** agv.onEvent(aiz): the install and open paths need the dead catalog, so launch directly. */
    public static boolean onDiscoveryClick(Object agv, Object event) {
        int type = Reflect.getInt(event, "a");
        if (type != 1 && type != 2 && type != 3) return false;
        String pkg = (String) Reflect.get(event, "c");
        if (pkg == null || pkg.isEmpty()) return false;
        if (pkg.startsWith(FAKE)) pkg = pkg.substring(FAKE.length());
        Activity activity = (Activity) Reflect.get(agv, "h");
        if (activity == null) return false;
        PackageManager pm = activity.getPackageManager();
        // Apps such as Photos VR have a separate VR activity next to their normal one.
        Intent vr = new Intent(Intent.ACTION_MAIN).addCategory("com.google.intent.category.DAYDREAM").setPackage(pkg);
        ResolveInfo found = pm.resolveActivity(vr, 0);
        if (found == null) {
            // OpenXR apps run in VR through DuskDream's Monado runtime.
            vr = new Intent(Intent.ACTION_MAIN).addCategory(OpenXrApps.OPENXR).setPackage(pkg);
            found = pm.resolveActivity(vr, 0);
        }
        Intent launch = found != null
                ? vr.setComponent(new ComponentName(found.activityInfo.packageName, found.activityInfo.name))
                : pm.getLaunchIntentForPackage(pkg);
        if (launch == null) return false;
        activity.startActivity(launch);
        return true;
    }

    // ── Library and VR tiles ───────────────────────────────────────────────

    /** alu.a(egu, ...): the library drops entries the dead catalog doesn't know. */
    public static void onAppStatus(Object status, Object egu, android.content.Context context, Object afb, Object afp) {
        if (status != null && egu != null && isOurs(egu)) Reflect.setBoolean(status, "h", true);
    }

    /** bhd.a(egu, int, int, int): placeholder art, and text readable on any background. */
    public static void onTile(Object tile, Object bhd, Object egu, int a, int b, int c) {
        if (tile == null || !isOurs(egu)) return;
        try {
            Reflect.set(tile, "o", "textures/app_icon_background_placeholder.webp");
            String foreground = (String) Reflect.get(tile, "n");
            if (foreground == null || foreground.isEmpty()) {
                Reflect.set(tile, "n", "textures/app_icon_foreground_placeholder.webp");
            }
            Reflect.call(tile, "d");
            tint(Reflect.get(tile, "i"), 0.1f, 0.1f, 0.1f, 0.85f);
            tint(Reflect.get(tile, "j"), 1f, 1f, 1f, 1f);
        } catch (Exception e) {
            Log.e(TAG, "onTile", e);
        }
    }

    private static void tint(Object entity, float r, float g, float b, float a) throws Exception {
        if (entity == null) return;
        Class<?> vec4 = cls("com.google.vr.internal.lullaby.Mathfu$Vec4");
        Object colour = null;
        for (Constructor<?> c : vec4.getDeclaredConstructors()) {
            c.setAccessible(true);
            if (c.getParameterCount() == 4) {
                colour = c.newInstance(r, g, b, a);
                break;
            }
            if (c.getParameterCount() == 5) {
                Constructor<?> outer = cls("com.google.vr.internal.lullaby.Mathfu").getDeclaredConstructor();
                outer.setAccessible(true);
                colour = c.newInstance(outer.newInstance(), r, g, b, a);
            }
        }
        if (colour == null) throw new NoSuchMethodException("Vec4 constructor");
        Method set = Reflect.method(cls("eia"), "a", vec4);
        set.invoke(entity, colour);
    }
}
