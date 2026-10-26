package app.xposed.extension;

import android.annotation.SuppressLint;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/** Adds the badge to X's post headers and keeps bound headers in sync with lookups. Main thread only. */
final class HeaderBadges {
    /** The last setData arguments of a header, so it can be re-bound when its account loads. */
    private static final class Binding {
        String name, username, timestamp, handle;
        List<Object> badges;
        BadgeDrawable drawable;
        /** X's UsernameBadge wrapping drawable, kept while the look stays the same. */
        Object badge;
        boolean pressed;
    }

    private static final Map<View, Binding> bindings = new WeakHashMap<>();
    private static Method setDataMethod;
    private static Constructor<?> badgeConstructor, spanConstructor;
    private static boolean reflectionFailed;

    static {
        Lookup.addListener(HeaderBadges::onAccountUpdated);
    }

    private HeaderBadges() {
    }

    static List<Object> onSetData(View view, String name, String username, String timestamp, List<Object> badges) {
        String handle = normalizeHandle(username);
        if (handle == null) {
            bindings.remove(view);
            FilterViews.apply(view, Filters.Action.NONE);
            return badges;
        }

        Binding binding = bindings.get(view);
        if (binding == null) {
            binding = new Binding();
            bindings.put(view, binding);
            installTouchListener(view);
        }
        allowOverflow(view);
        binding.name = name;
        binding.username = username;
        binding.timestamp = timestamp;
        binding.handle = handle;
        binding.badges = new ArrayList<>(badges);
        BadgeDrawable previous = binding.drawable;
        binding.drawable = null;
        binding.pressed = false;

        Lookup.init(view.getContext());
        Settings.init(view.getContext());
        Stats.init(view.getContext());
        AccountInfo info = Lookup.get(handle);
        FilterViews.apply(view, Filters.actionFor(info));
        if (info == null || info.isEmpty()) return badges;

        BadgeDrawable drawable;
        Object badge;
        if (previous != null && binding.badge != null && previous.looksLike(view.getContext(), info)) {
            // Recycled rows mostly show accounts that look the same; skip rebuilding.
            drawable = previous;
            badge = binding.badge;
        } else {
            drawable = BadgeDrawable.create(view.getContext(), info);
            if (drawable == null) return badges;
            badge = newUsernameBadge(drawable, describe(info));
            if (badge == null) return badges;
        }

        binding.drawable = drawable;
        binding.badge = badge;
        List<Object> result = new ArrayList<>(badges);
        result.add(badge);
        return result;
    }

    /** "@Example" or "Example" from X's username text; null when it isn't a handle. */
    static String normalizeHandle(String username) {
        if (username == null) return null;
        int start = 0, end = username.length();
        while (start < end && username.charAt(start) <= ' ') start++;
        while (end > start && username.charAt(end - 1) <= ' ') end--;
        if (start < end && username.charAt(start) == '@') start++;
        if (end - start < 1 || end - start > 15) return null;
        for (int i = start; i < end; i++) {
            char c = username.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == '_')) return null;
        }
        return username.substring(start, end).toLowerCase(Locale.ROOT);
    }

    private static String describe(AccountInfo info) {
        return info.location != null ? "Account based in " + info.location : "Account details";
    }

    /** Re-binds every header, e.g. after the filters changed. */
    static void refreshAll() {
        onAccountUpdated(null);
    }

    /** Re-binds the headers showing handle, or all headers when handle is null. */
    private static void onAccountUpdated(String handle) {
        for (Map.Entry<View, Binding> entry : new ArrayList<>(bindings.entrySet())) {
            Binding b = entry.getValue();
            if (handle != null && !handle.equals(b.handle)) continue;
            try {
                setDataMethod(entry.getKey()).invoke(entry.getKey(), b.name, b.username, b.timestamp, b.badges);
            } catch (Exception e) {
                Log.e(Hooks.TAG, "Failed to refresh header", e);
            }
        }
    }

    /**
     * TweetHeaderView is only as tall as the name's glyphs, so the badge box, centred on
     * the name like the verified badge, pokes a few pixels above it by an amount that
     * depends on the letters in the name. Let it draw into the empty space around the
     * header instead of being clipped.
     */
    private static void allowOverflow(View view) {
        if (view.getParent() instanceof ViewGroup) {
            ViewGroup parent = (ViewGroup) view.getParent();
            parent.setClipChildren(false);
            parent.setClipToPadding(false);
        }
    }

    @SuppressLint("ClickableViewAccessibility")
    private static void installTouchListener(View view) {
        view.setOnTouchListener((v, event) -> {
            Binding b = bindings.get(v);
            if (b == null || b.drawable == null) return false;
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    b.pressed = hit(v, b.drawable, event);
                    return b.pressed;
                case MotionEvent.ACTION_MOVE:
                    return b.pressed;
                case MotionEvent.ACTION_UP:
                    if (!b.pressed) return false;
                    b.pressed = false;
                    if (hit(v, b.drawable, event)) BadgeSheet.show(v.getContext(), b.handle);
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    boolean handled = b.pressed;
                    b.pressed = false;
                    return handled;
                default:
                    return b.pressed;
            }
        });
    }

    /** The badge's column across the whole header height, widened to a comfortable touch target. */
    private static boolean hit(View view, BadgeDrawable drawable, MotionEvent event) {
        RectF r = drawable.hitRect();
        if (r == null) return false;
        float slop = 8 * view.getResources().getDisplayMetrics().density;
        return event.getX() >= r.left - slop && event.getX() <= r.right + slop;
    }

    private static Object newUsernameBadge(BadgeDrawable drawable, String description) {
        if (reflectionFailed) return null;
        try {
            if (badgeConstructor == null) {
                Class<?> badgeClass = Class.forName(Hooks.usernameBadgeClass());
                for (Constructor<?> c : badgeClass.getConstructors()) {
                    Class<?>[] types = c.getParameterTypes();
                    if (types.length == 2 && types[1] == String.class) {
                        badgeConstructor = c;
                        spanConstructor = types[0].getConstructor(Drawable.class, float.class);
                    }
                }
                if (badgeConstructor == null) throw new NoSuchMethodException("UsernameBadge(span, String)");
            }
            Object span = spanConstructor.newInstance(drawable, drawable.spanScale());
            return badgeConstructor.newInstance(span, description);
        } catch (Exception e) {
            reflectionFailed = true;
            Log.e(Hooks.TAG, "UsernameBadge is unavailable", e);
            return null;
        }
    }

    private static Method setDataMethod(View view) throws NoSuchMethodException {
        if (setDataMethod == null) {
            for (Method m : view.getClass().getMethods()) {
                Class<?>[] t = m.getParameterTypes();
                if (m.getReturnType() == void.class && t.length == 4 && t[0] == String.class
                        && t[1] == String.class && t[2] == String.class && t[3] == List.class) {
                    setDataMethod = m;
                    break;
                }
            }
            if (setDataMethod == null) throw new NoSuchMethodException("TweetHeaderView.setData");
        }
        return setDataMethod;
    }
}
