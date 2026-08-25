package com.stremio.morphe;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Runtime bridge for D-pad addon reordering. App classes are accessed reflectively. */
public final class AddonReorderBridge {
    private static final String COLLECTION_GET = "https://api.strem.io/api/addonCollectionGet";
    private static final String COLLECTION_SET = "https://api.strem.io/api/addonCollectionSet";
    private static final int MAX_RESPONSE_BYTES = 4 * 1024 * 1024;
    private static final Object LOCK = new Object();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService NETWORK = Executors.newSingleThreadExecutor();

    private static Session active;

    private AddonReorderBridge() {
    }

    public static void onItemSelected(final Object fragment, Object viewHolder, final Object model) {
        final View view = viewFromHolder(viewHolder);
        final Object descriptor = descriptorFromModel(model);
        if (view == null || descriptor == null) return;

        view.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View pressed) {
                return begin(fragment, descriptor, pressed);
            }
        });
        view.setOnKeyListener(new View.OnKeyListener() {
            @Override
            public boolean onKey(View pressed, int keyCode, KeyEvent event) {
                return handleKey(fragment, pressed, keyCode, event);
            }
        });

        String selectedUrl = transportUrl(descriptor);
        synchronized (LOCK) {
            Session session = active;
            if (session == null || !session.matches(fragment) || !session.active) return;
            if (sameUrl(selectedUrl, session.movingUrl)) {
                bindOutline(session, view);
            } else if (session.outlinedView == view) {
                restoreOutline(session);
            }
        }
    }

    public static boolean consumeClick(Object fragment) {
        synchronized (LOCK) {
            return active != null && active.active && active.matches(fragment);
        }
    }

    public static boolean cancelIfActive(Object fragment) {
        synchronized (LOCK) {
            if (active == null || !active.active || !active.matches(fragment)) return false;
            cancelLocked(active, true);
            return true;
        }
    }

    private static boolean begin(Object fragment, Object descriptor, View pressed) {
        synchronized (LOCK) {
            if (active != null && active.active) return true;

            try {
                Object controller = controller(fragment);
                List<?> rows = listResult(call(controller, "getRows"));
                if (rows == null || rows.size() < 2) {
                    toast(pressed.getContext(), "At least two addons are needed to reorder.");
                    return true;
                }
                if (!allInstalled(rows)) {
                    toast(pressed.getContext(), "Open My Addons to change addon order.");
                    return true;
                }

                String movingUrl = transportUrl(descriptor);
                int index = indexOfUrl(rows, movingUrl);
                if (movingUrl == null || index < 0) {
                    toast(pressed.getContext(), "This addon cannot be reordered.");
                    return true;
                }
                Context context = pressed.getContext().getApplicationContext();
                if (authKey(context) == null) {
                    toast(context, "Sign in to reorder addons.");
                    return true;
                }

                Session session = new Session(fragment, controller, context, rows, movingUrl, index);
                active = session;
                session.active = true;
                session.swallowCenterRelease = true;
                setBackEnabled(session, true);
                bindOutline(session, pressed);
                pressed.performHapticFeedback(0);
                return true;
            } catch (Exception ignored) {
                toast(pressed.getContext(), "Addon reordering is unavailable.");
                return true;
            }
        }
    }

    private static boolean handleKey(Object fragment, View view, int keyCode, KeyEvent event) {
        synchronized (LOCK) {
            final Session session = active;
            if (session == null || !session.active || !session.matches(fragment)) return false;

            if (keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_ENTER
                    || keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER) {
                if (session.swallowCenterRelease) {
                    if (event.getAction() == KeyEvent.ACTION_UP) session.swallowCenterRelease = false;
                    return true;
                }
                if (event.getAction() == KeyEvent.ACTION_DOWN && event.getRepeatCount() == 0) {
                    commitLocked(session);
                }
                return true;
            }

            if (keyCode == KeyEvent.KEYCODE_BACK) {
                if (event.getAction() == KeyEvent.ACTION_DOWN && event.getRepeatCount() == 0) {
                    cancelLocked(session, true);
                }
                return true;
            }

            if (keyCode == KeyEvent.KEYCODE_DPAD_UP || keyCode == KeyEvent.KEYCODE_DPAD_DOWN) {
                if (!session.saving && event.getAction() == KeyEvent.ACTION_DOWN
                        && event.getRepeatCount() == 0) {
                    moveLocked(session, keyCode == KeyEvent.KEYCODE_DPAD_UP ? -1 : 1, view);
                }
                return true;
            }

            if (keyCode == KeyEvent.KEYCODE_DPAD_LEFT || keyCode == KeyEvent.KEYCODE_DPAD_RIGHT) {
                return true;
            }
            return session.saving;
        }
    }

    private static void moveLocked(final Session session, int delta, View view) {
        int target = session.index + delta;
        if (target < 0 || target >= session.workingRows.size()) {
            bindOutline(session, view);
            return;
        }

        restoreOutline(session);
        Collections.swap(session.workingRows, session.index, target);
        session.index = target;
        session.changed = true;
        callQuietly(session.controller, "setRows", new ArrayList<Object>(session.workingRows));
        selectPosition(session, target, 0L);
        selectPosition(session, target, 90L);
    }

    private static void commitLocked(final Session session) {
        if (session.saving) return;
        if (!session.changed) {
            finishLocked(session, false);
            toast(session.context, "Addon order unchanged.");
            return;
        }

        session.saving = true;
        if (session.outline != null) {
            session.outline.setSaving(true);
            if (session.outlinedView != null) session.outlinedView.invalidate();
        }
        final List<String> desiredUrls = urls(session.workingRows);
        if (desiredUrls == null) {
            failOnMain(session);
            return;
        }

        NETWORK.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    persistOrder(session.context, desiredUrls);
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            synchronized (LOCK) {
                                if (active != session || !session.active) return;
                                finishLocked(session, false);
                                toast(session.context, "Addon order saved.");
                                refreshFromAccount(session.fragment.get());
                            }
                        }
                    });
                } catch (Exception ignored) {
                    failOnMain(session);
                }
            }
        });
    }

    private static void failOnMain(final Session session) {
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                synchronized (LOCK) {
                    if (active != session || !session.active) return;
                    callQuietly(session.controller, "setRows", new ArrayList<Object>(session.originalRows));
                    session.index = session.originalIndex;
                    selectPosition(session, session.originalIndex, 0L);
                    selectPosition(session, session.originalIndex, 90L);
                    finishLocked(session, true);
                    toast(session.context, "Could not save addon order; the list was restored.");
                }
            }
        });
    }

    private static void cancelLocked(Session session, boolean notify) {
        if (session.saving) return;
        callQuietly(session.controller, "setRows", new ArrayList<Object>(session.originalRows));
        session.index = session.originalIndex;
        selectPosition(session, session.originalIndex, 0L);
        selectPosition(session, session.originalIndex, 90L);
        finishLocked(session, true);
        if (notify) toast(session.context, "Addon reorder cancelled.");
    }

    private static void finishLocked(Session session, boolean rolledBack) {
        restoreOutline(session);
        session.active = false;
        session.saving = false;
        int finalIndex = rolledBack ? session.originalIndex : session.index;
        setBackEnabled(session, finalIndex != 0);
        if (active == session) active = null;
    }

    private static void bindOutline(Session session, View view) {
        if (session.outlinedView == view && session.outline != null) {
            session.outline.setDirections(session.index > 0, session.index < session.workingRows.size() - 1);
            view.invalidate();
            return;
        }
        restoreOutline(session);
        session.outlinedView = view;
        session.originalForeground = view.getForeground();
        session.outline = new ReorderOutline(view.getContext(), session.index > 0,
                session.index < session.workingRows.size() - 1);
        if (session.originalForeground == null) {
            view.setForeground(session.outline);
        } else {
            view.setForeground(new LayerDrawable(new Drawable[]{session.originalForeground, session.outline}));
        }
        view.invalidate();
    }

    private static void restoreOutline(Session session) {
        if (session.outlinedView != null) {
            session.outlinedView.setForeground(session.originalForeground);
            session.outlinedView.invalidate();
        }
        session.outlinedView = null;
        session.originalForeground = null;
        session.outline = null;
    }

    private static void selectPosition(final Session session, final int position, long delay) {
        final Object fragment = session.fragment.get();
        if (fragment == null) return;
        View anchor = session.outlinedView;
        Runnable action = new Runnable() {
            @Override
            public void run() {
                Object grid = fieldValue(fragment, "gridFragment");
                callQuietly(grid, "setSelectedPosition", Integer.valueOf(position));
            }
        };
        if (anchor != null) anchor.postDelayed(action, delay); else MAIN.postDelayed(action, delay);
    }

    private static void setBackEnabled(Session session, boolean enabled) {
        Object fragment = session.fragment.get();
        Object callback = fragment == null ? null : fieldValue(fragment, "backPressedCallback");
        callQuietly(callback, "setEnabled", Boolean.valueOf(enabled));
    }

    private static void refreshFromAccount(Object fragment) {
        if (fragment == null) return;
        try {
            Object lazy = fieldValue(fragment, "viewModel$delegate");
            Object viewModel = call(lazy, "getValue");
            Method sync = findMethod(viewModel.getClass(), "syncAddons", 0);
            sync.setAccessible(true);
            sync.invoke(viewModel);
        } catch (Exception ignored) {
            // The server order is already committed; the next normal refresh will load it.
        }
    }

    private static void persistOrder(Context context, List<String> desiredUrls) throws Exception {
        String key = authKey(context);
        if (key == null) throw new IllegalStateException("No active auth key");

        JSONObject getRequest = new JSONObject();
        getRequest.put("type", "AddonCollectionGet");
        getRequest.put("authKey", key);
        getRequest.put("update", true);
        JSONObject getResponse = post(COLLECTION_GET, getRequest);
        JSONArray serverAddons = addonArray(getResponse);
        JSONArray reordered = reorderArray(serverAddons, desiredUrls);

        JSONObject setRequest = new JSONObject();
        setRequest.put("type", "AddonCollectionSet");
        setRequest.put("authKey", key);
        setRequest.put("addons", reordered);
        JSONObject setResponse = post(COLLECTION_SET, setRequest);
        throwIfApiError(setResponse);
    }

    static JSONArray reorderArray(JSONArray serverAddons, List<String> desiredUrls) throws Exception {
        Map<String, JSONObject> byUrl = new HashMap<String, JSONObject>();
        Set<String> desired = new HashSet<String>();
        for (String url : desiredUrls) {
            String normalized = normalizeUrl(url);
            if (normalized == null || !desired.add(normalized)) {
                throw new IllegalStateException("Ambiguous visible addon order");
            }
        }

        List<Integer> matchedSlots = new ArrayList<Integer>();
        for (int i = 0; i < serverAddons.length(); i++) {
            Object value = serverAddons.get(i);
            if (!(value instanceof JSONObject)) throw new JSONException("Invalid addon descriptor");
            JSONObject addon = (JSONObject) value;
            String normalized = normalizeUrl(jsonTransportUrl(addon));
            if (normalized != null && desired.contains(normalized)) {
                if (byUrl.put(normalized, addon) != null) {
                    throw new IllegalStateException("Duplicate server addon descriptor");
                }
                matchedSlots.add(Integer.valueOf(i));
            }
        }
        if (matchedSlots.size() != desiredUrls.size()) {
            throw new IllegalStateException("Visible addons do not match the account collection");
        }

        JSONArray result = new JSONArray();
        for (int i = 0; i < serverAddons.length(); i++) result.put(serverAddons.get(i));
        for (int i = 0; i < desiredUrls.size(); i++) {
            JSONObject addon = byUrl.get(normalizeUrl(desiredUrls.get(i)));
            if (addon == null) throw new IllegalStateException("Missing server addon descriptor");
            result.put(matchedSlots.get(i).intValue(), addon);
        }
        return result;
    }

    private static JSONArray addonArray(JSONObject response) throws Exception {
        throwIfApiError(response);
        JSONObject data = response.optJSONObject("data");
        if (data != null) {
            JSONArray direct = data.optJSONArray("addons");
            if (direct != null) return direct;
            Object result = data.opt("result");
            if (result instanceof JSONArray) return (JSONArray) result;
            if (result instanceof JSONObject) {
                JSONArray nested = ((JSONObject) result).optJSONArray("addons");
                if (nested != null) return nested;
            }
        }
        JSONArray direct = response.optJSONArray("addons");
        if (direct != null) return direct;
        Object result = response.opt("result");
        if (result instanceof JSONArray) return (JSONArray) result;
        if (result instanceof JSONObject) {
            JSONArray nested = ((JSONObject) result).optJSONArray("addons");
            if (nested != null) return nested;
        }
        throw new JSONException("Addon collection missing from API response");
    }

    private static void throwIfApiError(JSONObject response) throws JSONException {
        if (response.has("error") && !response.isNull("error")) {
            throw new JSONException("Stremio API rejected the request");
        }
        JSONObject data = response.optJSONObject("data");
        if (data != null && data.has("error") && !data.isNull("error")) {
            throw new JSONException("Stremio API rejected the request");
        }
    }

    private static JSONObject post(String endpoint, JSONObject body) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(endpoint).openConnection();
        try {
            connection.setRequestMethod("POST");
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(15000);
            connection.setDoOutput(true);
            connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
            connection.setRequestProperty("Accept", "application/json");
            byte[] bytes = body.toString().getBytes(StandardCharsets.UTF_8);
            connection.setFixedLengthStreamingMode(bytes.length);
            OutputStream output = connection.getOutputStream();
            try {
                output.write(bytes);
            } finally {
                output.close();
            }

            int status = connection.getResponseCode();
            InputStream input = status >= 200 && status < 300
                    ? connection.getInputStream() : connection.getErrorStream();
            String response = readBounded(input);
            if (status < 200 || status >= 300) throw new IllegalStateException("HTTP " + status);
            return new JSONObject(response);
        } finally {
            connection.disconnect();
        }
    }

    private static String readBounded(InputStream input) throws Exception {
        if (input == null) throw new IllegalStateException("Empty API response");
        try {
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int total = 0;
            int count;
            while ((count = input.read(buffer)) != -1) {
                total += count;
                if (total > MAX_RESPONSE_BYTES) throw new IllegalStateException("API response too large");
                output.write(buffer, 0, count);
            }
            return output.toString("UTF-8");
        } finally {
            input.close();
        }
    }

    private static String authKey(Context context) {
        try {
            SharedPreferences preferences = activeCorePreferences(context);
            String profile = preferences.getString("profile", null);
            if (profile == null || profile.trim().isEmpty()) return null;
            JSONObject root = new JSONObject(profile);
            JSONObject auth = root.optJSONObject("auth");
            String key = auth == null ? null : nonEmpty(auth.optString("key", null));
            if (key == null && auth != null) key = nonEmpty(auth.optString("authKey", null));
            if (key == null) key = nonEmpty(root.optString("authKey", null));
            return key;
        } catch (Exception ignored) {
            return null;
        }
    }

    private static SharedPreferences activeCorePreferences(Context context) {
        try {
            Class<?> isolation = Class.forName("com.stremio.morphe.MorpheIsolation");
            Method method = isolation.getMethod("corePreferences", Context.class);
            Object value = method.invoke(null, context);
            if (value instanceof SharedPreferences) return (SharedPreferences) value;
        } catch (Exception ignored) {
            // Multi-account is optional.
        }
        return context.getSharedPreferences("core", Context.MODE_PRIVATE);
    }

    private static String jsonTransportUrl(JSONObject addon) {
        String value = nonEmpty(addon.optString("transportUrl", null));
        if (value == null) value = nonEmpty(addon.optString("transport_url", null));
        if (value == null) value = nonEmpty(addon.optString("url", null));
        return value;
    }

    private static boolean allInstalled(List<?> rows) {
        for (Object row : rows) {
            Object value = callQuietly(row, "getInstalled");
            if (!(value instanceof Boolean) || !((Boolean) value).booleanValue()) return false;
        }
        return true;
    }

    private static List<String> urls(List<?> rows) {
        List<String> result = new ArrayList<String>(rows.size());
        Set<String> unique = new HashSet<String>();
        for (Object row : rows) {
            String url = transportUrl(row);
            String normalized = normalizeUrl(url);
            if (normalized == null || !unique.add(normalized)) return null;
            result.add(url);
        }
        return result;
    }

    private static int indexOfUrl(List<?> rows, String url) {
        for (int i = 0; i < rows.size(); i++) {
            if (sameUrl(transportUrl(rows.get(i)), url)) return i;
        }
        return -1;
    }

    private static String transportUrl(Object descriptor) {
        Object value = callQuietly(descriptor, "getTransportUrl");
        return value instanceof String ? (String) value : null;
    }

    private static boolean sameUrl(String left, String right) {
        String a = normalizeUrl(left);
        String b = normalizeUrl(right);
        return a != null && a.equals(b);
    }

    private static String normalizeUrl(String value) {
        String normalized = nonEmpty(value);
        if (normalized == null) return null;
        while (normalized.endsWith("/") && normalized.length() > 1) {
            normalized = normalized.substring(0, normalized.length() - 1);
        }
        return normalized;
    }

    private static String nonEmpty(String value) {
        if (value == null) return null;
        String trimmed = value.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    private static Object descriptorFromModel(Object model) {
        return callQuietly(model, "getDescriptor");
    }

    private static View viewFromHolder(Object holder) {
        Object value = fieldValue(holder, "view");
        return value instanceof View ? (View) value : null;
    }

    private static Object controller(Object fragment) throws Exception {
        Object lazy = fieldValue(fragment, "controller$delegate");
        Object value = call(lazy, "getValue");
        if (value == null) throw new IllegalStateException("Missing addon controller");
        return value;
    }

    @SuppressWarnings("unchecked")
    private static List<?> listResult(Object value) {
        return value instanceof List ? (List<?>) value : null;
    }

    private static Object fieldValue(Object target, String name) {
        if (target == null) return null;
        try {
            Field field = findField(target.getClass(), name);
            field.setAccessible(true);
            return field.get(target);
        } catch (Exception ignored) {
            return null;
        }
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        Class<?> current = type;
        while (current != null) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                current = current.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Method findMethod(Class<?> type, String name, int parameterCount)
            throws NoSuchMethodException {
        Class<?> current = type;
        while (current != null) {
            for (Method method : current.getDeclaredMethods()) {
                if (method.getName().equals(name) && method.getParameterTypes().length == parameterCount) {
                    return method;
                }
            }
            current = current.getSuperclass();
        }
        throw new NoSuchMethodException(name);
    }

    private static Object call(Object target, String name, Object... arguments) throws Exception {
        if (target == null) throw new NullPointerException(name);
        Method method = findMethod(target.getClass(), name, arguments.length);
        method.setAccessible(true);
        return method.invoke(target, arguments);
    }

    private static Object callQuietly(Object target, String name, Object... arguments) {
        try {
            return call(target, name, arguments);
        } catch (Exception ignored) {
            return null;
        }
    }

    private static void toast(final Context context, final String message) {
        if (context == null) return;
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
        } else {
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
                }
            });
        }
    }

    private static final class Session {
        final WeakReference<Object> fragment;
        final Object controller;
        final Context context;
        final ArrayList<Object> originalRows;
        final ArrayList<Object> workingRows;
        final String movingUrl;
        final int originalIndex;
        int index;
        boolean active;
        boolean saving;
        boolean changed;
        boolean swallowCenterRelease;
        View outlinedView;
        Drawable originalForeground;
        ReorderOutline outline;

        Session(Object fragment, Object controller, Context context, List<?> rows,
                String movingUrl, int index) {
            this.fragment = new WeakReference<Object>(fragment);
            this.controller = controller;
            this.context = context;
            this.originalRows = new ArrayList<Object>(rows);
            this.workingRows = new ArrayList<Object>(rows);
            this.movingUrl = movingUrl;
            this.originalIndex = index;
            this.index = index;
        }

        boolean matches(Object value) {
            return fragment.get() == value;
        }
    }

    private static final class ReorderOutline extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final float stroke;
        private final float radius;
        private final float chevronWidth;
        private final float chevronHeight;
        private boolean up;
        private boolean down;
        private boolean saving;

        ReorderOutline(Context context, boolean up, boolean down) {
            float density = context.getResources().getDisplayMetrics().density;
            stroke = 4f * density;
            radius = 8f * density;
            chevronWidth = 9f * density;
            chevronHeight = 5f * density;
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(stroke);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            paint.setColor(stremioPurple(context));
            setDirections(up, down);
        }

        private static int stremioPurple(Context context) {
            int resource = context.getResources().getIdentifier(
                    "accentColorSecondary", "color", context.getPackageName());
            if (resource != 0) {
                try {
                    return context.getColor(resource);
                } catch (Exception ignored) {
                    // Keep the bundled Stremio brand-purple fallback below.
                }
            }
            return Color.rgb(123, 91, 245);
        }

        void setDirections(boolean up, boolean down) {
            this.up = up;
            this.down = down;
            invalidateSelf();
        }

        void setSaving(boolean saving) {
            this.saving = saving;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float inset = stroke / 2f;
            paint.setAlpha(saving ? 145 : 255);
            canvas.drawRoundRect(bounds.left + inset, bounds.top + inset,
                    bounds.right - inset, bounds.bottom - inset, radius, radius, paint);

            float center = bounds.exactCenterX();
            float top = bounds.top + stroke + chevronHeight + 2f;
            float bottom = bounds.bottom - stroke - chevronHeight - 2f;
            if (up) {
                path.reset();
                path.moveTo(center - chevronWidth, top + chevronHeight);
                path.lineTo(center, top);
                path.lineTo(center + chevronWidth, top + chevronHeight);
                canvas.drawPath(path, paint);
            }
            if (down) {
                path.reset();
                path.moveTo(center - chevronWidth, bottom - chevronHeight);
                path.lineTo(center, bottom);
                path.lineTo(center + chevronWidth, bottom - chevronHeight);
                canvas.drawPath(path, paint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
