package app.template.extension.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.io.Serializable;
import java.lang.ref.WeakReference;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Adds the playback-speed row to the player's More pane. */
@SuppressWarnings("unused")
public final class PlaybackSpeedMenu {

    private static final String TAG = "TikTokTVSpeed";
    private static final String MENU_ITEM = "com.ss.android.ugc.aweme.tv.feed.fragment.moremenu.a";
    private static final String VALUE_TAG = "app.tiktoktv.menu.value";

    /** Every row this patch adds carries an extra of this shape, which is how it is recognised. */
    private static final String TOKEN = "speed:";
    private static final String ROOT = TOKEN + "root";

    /**
     * The speedometer mark SmartTube uses for its own playback-speed button
     * (drawable/action_video_speed, 192x192 alpha mask).
     */
    private static final String SPEED_MASK =
            "iVBORw0KGgoAAAANSUhEUgAAAMAAAADACAMAAABlApw1AAAAw1BMVEUAAAD/////////////////////////////////////////"
            + "////////////////////////////////////////////////////////////////////////////////////////////////////"
            + "////////////////////////////////////////////////////////////////////////////////////////////////////"
            + "///////////////BhC2fAAAAQXRSTlMAFDxAT19jd1MsCAQwW4uz5//bt49rQxxLc6fT+/PPeziH4yBnw5sM6ySfEKvvGFf3x39v"
            + "kzTfu4OXv9dHKK/LozJ9+i4AAAXfSURBVHgB7MGBAAAAAICg/akXqQIAAAAAAFhUAoxMzMwsrFAAoN6OthLnoSgAH6gokIIcABQp"
            + "iIBWWtEOKAiI+v5P9S9u/ou9OtCTJrTz3XeW3dltSJq5vCpXqvSvUG6tft1gxM1Wu9O9oVy7ue3d9T0+ZjC8ux9RLrkPY05o3C5S"
            + "zkzu+yyQs3soTB9Zw/ipqyh7fu3aY13PT0XK1iwYcDotl7ITtj1O72VG2aj25myEF7xSBt6abEzULtCZFf+wUfNFSGc0e2HjGssq"
            + "nUnh3WMLgpDO42PMFqy6dCaliC149+k81HuyQg/XwWfnzZlMik6tdL/YBK3msfids9V/zafMX6aV+GsvHrZRtvGTu+KjBq2eS8eo"
            + "j+XdKrP4qTbgI3aLkaIkPp6iTOJXdT6i9UXJhZ0+xp9t/aPNnoRGQWQ3fjT5e/3HvZA0hJ21Q2dT2PFf9MuKzKvOyCj/keNFV4os"
            + "GH1XyST1wvG2e7KgWo9GZNQ7x5pPyYbRjutk1BXH+r6xE7/HO7MFqnGcRtlW/OyZLZDjcYzH0Fb8bLhAlQHHeFG24mfDBbppcIy2"
            + "sha/4QL5O45xby9+0wWqM2L2Lu3Fb7pArseIBxcW4zdcIPrDiJ+LluK3UaBpTP4Ve/HHFyh8JV2vc0Zcthh/fIGCDem6Y8SfFuOP"
            + "L1CXvT3p+WLELWUv/vgC+Svmb9JSXTFqhnbixwLhD2GHdDxYfoAh/vgCOXzwQxoqHqOyhfhPF+igZmQKeLAQf4ICHayqJNVl9Khs"
            + "xJ+gQAdXJPXCaGQl/gQFOpgXSObVY/BrNf74AqXo74JBNDEbv6RABw1FEqphYQqG+AUFOrgliTKDRmgyfnGBWDodrxlcmoxfXKAD"
            + "75WS2zPoKwvxQ4FOZdij5NoMuhbixwKBKYOdIKg5zmFW4scC4R+hPxFdMihZiR8LBOoMniipH5wDfCvxY4HAjMHAp2QmDH4txY8F"
            + "AtcMapTMG4OupfixQOCLQUDJbPAbmLIVPxYI4HVNSmaIY2w0fsE//snglZIIGVSsxY8FAkUGF1qbEUN78WOBgMKpoE0g0cAtTcYP"
            + "6rJV1Q8lsYWrXJPxY4FkM6rn02lqALOYShO/sEDgRueF/iEYNmn84tcbHilf0GlLPI1kMH4skPj7SktjO+LSbPxYINlD8Eyn4Wr4"
            + "g8RciF9QIDBiQKdhTlWS2kMGkgKBAoOJ+JIhSfl9Zv0CgWdxHybyVQRos7RAgh3aW/FbtENCMy9VgcBGvDZ0xFeAIF2BQE88EbxJ"
            + "xwyEUboCgZJ4VsIrHJIppSwQuMVDJuLDTY6FBkGBJI3eirelRyQzlBdIcgMrOuVJOnOASFAgKzcQpLyBtAUCe/ENrK3eABZIPK/+"
            + "Ea/HSCiSF0hyA1vxCJBQP2WBwEx8A4F0KwYEkgLJH+I78Z7EiGRKKQsE3sS7i52UxwsKUboCgan4BsriDzvgN12BwEJ83KGYdk3v"
            + "SnaixfPqQvze+iapTaoCgW/xiVWVfknZlBZIsCIri1ehcxLbz/ULhPDg9l4+E/kkVoy9g4ZLYi5+rdP4SF8huX1Mi/p7AwdXfzSm"
            + "0ilp8Dd4HKvtk4YnjT0SnIqvSYv7G/H/omBGWvoa3you8OtslfQUSkE/Yo6GQSkkPT5rLHB9T74nb0uXQaIkHuVzsS33+CLT+vnR"
            + "pMzstJ7HIoMZZcTVO7mqcPbrUEY+GRT1fkC1KCNjPPOgOf1FPmWiyKCtuZDmJWXiPXmDwArfXlXKgHrGP0N/SXJJGSjpHzkrM2gq"
            + "OjvV1D93FXoMyjkYgGeVYndqmMkACBoEKoxuMx8AbJBsLuNt5gMgew4dRg6dVZlRiUQeOWcaikQuOGeWJLTjXJH/GCj94wNAqpGz"
            + "ARBbco70SC6cc27Mw/QLukwtSEc45pxY+aTllnPCIU33OXuFyrU5Bx4ohaXHGfOm6f/7SJaGLqWkShnewvBNkQHuYt3gs2tcL1zK"
            + "zn/twSEBAAAAgKD/r71hAAAAAAAAgK8AiABZollaRWAAAAAASUVORK5CYII=";

    /** The mask, decoded once: the More pane binds its rows again every time it opens. */
    private static Bitmap mark;

    /** The loop switch is the one row every root menu carries, which is how the root is spotted. */
    private static final int TYPE_LOOP = 1;

    /** The player's view, kept so a pick in the panel can repaint the rows it belongs to. */
    private static WeakReference<View> player;

    private static final List<Bound> BOUND = new ArrayList<>();

    private PlaybackSpeedMenu() {
    }

    /** One row on screen, weakly, since the app owns and recycles it. */
    private static final class Bound {
        final WeakReference<View> view;
        final String token;

        Bound(View view, String token) {
            this.view = new WeakReference<>(view);
            this.token = token;
        }
    }

    /** Called with the list the More pane is about to show. */
    public static void addToMenu(Object listObject) {
        if (!(listObject instanceof List)) return;

        List<Object> rows = (List<Object>) listObject;
        int loop = -1;
        for (int i = 0; i < rows.size(); i++) {
            if (isMine(rows.get(i))) return;
            if (typeOf(rows.get(i)) == TYPE_LOOP) loop = i;
        }
        if (loop < 0) return;

        rows.add(loop, row(ROOT, "Playback speed", true, null));
        Log.i(TAG, "playback speed row added to the more menu");
    }

    /** Called with each row the menu adapter binds, so a recycled row loses the value it had. */
    public static void bindRow(Object holder, Object item) {
        View view = itemView(holder);
        if (view == null) return;

        String token = tokenOf(item);
        note(view, token);
        view.post(() -> paint(view, token));
    }

    private static void note(View view, String token) {
        for (int i = BOUND.size() - 1; i >= 0; i--) {
            View held = BOUND.get(i).view.get();
            if (held == null || held == view) BOUND.remove(i);
        }
        BOUND.add(new Bound(view, token));
        while (BOUND.size() > 24) BOUND.remove(0);
    }

    private static void repaint() {
        for (int i = BOUND.size() - 1; i >= 0; i--) {
            Bound bound = BOUND.get(i);
            View view = bound.view.get();
            if (view == null) {
                BOUND.remove(i);
                continue;
            }
            paint(view, bound.token);
        }
    }

    /** Called with the row a viewer picked, before the app decides what to do with it. */
    public static void clicked(Object item) {
        String token = tokenOf(item);
        if (!token.startsWith(TOKEN) || token.equals(ROOT)) return;

        Context context = context();
        if (context == null) return;

        try {
            PlaybackSpeed.setSpeed(context, Float.parseFloat(token.substring(TOKEN.length())));
        } catch (NumberFormatException failure) {
            return;
        }
        repaint();
    }

    /** Called with the player's view, which is where a pick in the panel has to be drawn. */
    public static void notePlayer(View root) {
        player = new WeakReference<>(root);
    }

    // ---------------------------------------------------------------------------------------------
    // The row
    // ---------------------------------------------------------------------------------------------

    private static Context context() {
        View root = player == null ? null : player.get();
        return root == null ? null : root.getContext();
    }

    private static void paint(View view, String token) {
        boolean mine = token.startsWith(TOKEN);
        String text = mine ? valueText(view.getContext(), token) : "";

        // Only our own rows earn a value view; a foreign row just has to lose a recycled one.
        if (!mine && view.findViewWithTag(VALUE_TAG) == null) return;

        TextView value = valueOf(view);
        if (value != null) {
            value.setText(text);
            value.setVisibility(text.isEmpty() ? View.GONE : View.VISIBLE);
        }

        if (!ROOT.equals(token)) return;
        int iconId = Subtitles.idOf(view, "left_icon_view");
        View found = iconId == 0 ? null : view.findViewById(iconId);
        if (found instanceof ImageView) {
            found.setVisibility(View.VISIBLE);
            ((ImageView) found).setImageBitmap(mark());
        }
    }

    /** @return SmartTube's speedometer mark, decoded once. */
    private static Bitmap mark() {
        if (mark != null) return mark;
        try {
            byte[] bytes = Base64.decode(SPEED_MASK, Base64.DEFAULT);
            mark = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
        } catch (Throwable failure) {
            Log.i(TAG, "speed mark not decoded " + failure);
        }
        return mark;
    }

    /** @return what the row says at its end: the rate in force, or a mark on the picked rate. */
    private static String valueText(Context context, String token) {
        float current = PlaybackSpeed.speed(context);
        if (ROOT.equals(token)) return PlaybackSpeed.label(current);

        try {
            float speed = Float.parseFloat(token.substring(TOKEN.length()));
            return Math.abs(speed - current) < 0.001f ? "On" : "";
        } catch (NumberFormatException failure) {
            return "";
        }
    }

    private static TextView valueOf(View view) {
        View found = view.findViewWithTag(VALUE_TAG);
        if (found instanceof TextView) return (TextView) found;
        if (!(view instanceof ViewGroup)) return null;

        ViewGroup row = (ViewGroup) view;
        Context context = row.getContext();
        TextView value = new TextView(context);
        value.setTag(VALUE_TAG);
        value.setVisibility(View.GONE);
        value.setClickable(false);
        value.setFocusable(false);
        value.setSingleLine(true);
        value.setTextColor(0xFF9AA3AE);
        value.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 14f);

        ViewGroup.LayoutParams source = paramsOf(row);
        if (source == null) return null;

        try {
            row.addView(value, source.getClass()
                    .getConstructor(int.class, int.class)
                    .newInstance(ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT));
        } catch (Throwable failure) {
            Log.i(TAG, "menu value not added " + failure);
            return null;
        }

        // The row, not the value: the row is what re-lays out when the arrow it must clear appears.
        row.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> align(row, value));
        return value;
    }

    private static ViewGroup.LayoutParams paramsOf(ViewGroup row) {
        int titleId = Subtitles.idOf(row, "menu_title");
        View title = titleId == 0 ? null : row.findViewById(titleId);
        if (title != null && title.getLayoutParams() != null) return title.getLayoutParams();

        return row.getChildCount() == 0 ? null : row.getChildAt(0).getLayoutParams();
    }

    /** Parks the value where the row leaves room for it: clear of the arrow when the row has one. */
    private static void align(View view, TextView value) {
        int titleId = Subtitles.idOf(view, "menu_title");
        View title = titleId == 0 ? null : view.findViewById(titleId);
        if (title == null || value.getWidth() <= 0) return;

        int arrowId = Subtitles.idOf(view, "right_icon_view");
        View arrow = arrowId == 0 ? null : view.findViewById(arrowId);
        int right = view.getWidth() - view.getPaddingRight();
        // A gone view is never sized, which is how the row says it has no arrow this time.
        if (arrow != null && arrow.getWidth() > 0) {
            right = arrow.getLeft() - Subtitles.sp(view.getContext(), 8f);
        }

        value.setTranslationX(right - value.getWidth() - value.getLeft());
        value.setTranslationY(title.getTop() + (title.getHeight() - value.getHeight()) / 2f
                - value.getTop());
    }

    // ---------------------------------------------------------------------------------------------
    // The item
    // ---------------------------------------------------------------------------------------------

    /** @return an object the menu adapter will bind, answering the interface with these values. */
    private static Object row(String token, String title, boolean hasNext, List<Object> subMenu) {
        try {
            Class<?> iface = Class.forName(MENU_ITEM);
            return Proxy.newProxyInstance(iface.getClassLoader(), new Class<?>[] {iface},
                    new Item(token, title, hasNext, subMenu));
        } catch (Throwable failure) {
            Log.i(TAG, "no menu item " + failure);
            return null;
        }
    }

    /** One row of the menu, as this patch describes it. */
    private static final class Item implements InvocationHandler, Serializable {

        private final String token;
        private final String title;
        private final boolean hasNext;
        private final List<Object> subMenu;

        Item(String token, String title, boolean hasNext, List<Object> subMenu) {
            this.token = token;
            this.title = title;
            this.hasNext = hasNext;
            this.subMenu = subMenu;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) {
            String name = method.getName();
            if ("getTitle".equals(name)) return title;
            if ("getExtra".equals(name)) return token;
            if ("getType".equals(name)) return Integer.valueOf(0);
            if ("getIcon".equals(name)) return Integer.valueOf(-1);
            if ("isSwitch".equals(name)) return Boolean.FALSE;
            if ("hasNextLevel".equals(name)) return Boolean.valueOf(hasNext);
            if ("getSubMenu".equals(name)) return subMenu == null ? options() : subMenu;
            if ("toString".equals(name)) return "PlaybackSpeedRow(" + token + ")";
            if ("hashCode".equals(name)) return Integer.valueOf(System.identityHashCode(proxy));
            if ("equals".equals(name)) return Boolean.valueOf(args != null && args[0] == proxy);
            return null;
        }
    }

    /** @return the rates the root row offers, in the order Lite lists them. */
    private static List<Object> options() {
        List<Object> rows = new ArrayList<>();
        for (float speed : PlaybackSpeed.SPEEDS) {
            rows.add(row(TOKEN + speed, PlaybackSpeed.label(speed), false, Collections.emptyList()));
        }
        return rows;
    }

    // ---------------------------------------------------------------------------------------------
    // Reflection
    // ---------------------------------------------------------------------------------------------

    private static boolean isMine(Object item) {
        return tokenOf(item).startsWith(TOKEN);
    }

    private static String tokenOf(Object item) {
        Object token = Subtitles.call(item, "getExtra");
        return token instanceof String ? (String) token : "";
    }

    private static int typeOf(Object item) {
        Object type = Subtitles.call(item, "getType");
        return type instanceof Integer ? (Integer) type : -1;
    }

    private static View itemView(Object holder) {
        if (holder == null) return null;
        try {
            return (View) holder.getClass().getField("itemView").get(holder);
        } catch (Throwable failure) {
            Log.i(TAG, "no row view " + failure);
            return null;
        }
    }
}
