package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
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
import java.util.Locale;

/** Adds the subtitles controls to the player's More pane. */
@SuppressWarnings("unused")
public final class SubtitlesMenu {

    private static final String TAG = "TikTokTVSub";
    private static final String MENU_ITEM = "com.ss.android.ugc.aweme.tv.feed.fragment.moremenu.a";
    private static final String VALUE_TAG = "app.tiktoktv.menu.value";

    /** Every row this patch adds carries an extra of this shape, which is how it is recognised. */
    private static final String TOKEN = "sub:";
    private static final String ROOT = TOKEN + "root";
    /**
     * The one row that turns captions on and off. The app renders its own switches from a row whose
     * extra is a Boolean (see MenuAdapter).
     */
    private static final String TOGGLE = TOKEN + "toggle";
    private static final String TRANS = TOKEN + "trans:";

    /** The row that opens the list of languages to translate into, named for the one it holds. */
    private static final String TARGET = TOKEN + "target:";

    /**
     * The appearance categories, modelled on SmartTube's subtitle settings: a style preset, a size
     * and a bottom shift.
     */
    private static final String STYLE = TOKEN + "style";
    private static final String SIZE = TOKEN + "size";
    private static final String POSITION = TOKEN + "pos";

    /** The loop switch is the one row every root menu carries, which is how the root is spotted. */
    private static final int TYPE_LOOP = 1;

    /** The player's view, kept so a pick in the panel can redraw the picture it belongs to. */
    private static WeakReference<View> player;

    /**
     * The rows on screen with the item each was last bound to, which a pick has to repaint because
     * the app never rebinds a list it has already shown.
     */
    private static final List<Bound> BOUND = new ArrayList<>();

    private SubtitlesMenu() {
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

        rows.add(loop, row(ROOT, "Subtitles", true, null));
        Log.i(TAG, "subtitles row added to the more menu");
    }

    /**
     * Called with each row the menu adapter binds. A recycled holder keeps the value text of
     * whatever row was there before.
     */
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

        SharedPreferences.Editor editor = Subtitles.prefs(context).edit();
        boolean appearance = false;
        if (token.equals(TOGGLE)) {
            boolean on = !Subtitles.isEnabled(context);
            // The saved track and target stay: switching back on returns to what was playing
            // before, not to the default language.
            editor.putBoolean(Subtitles.PREF_ENABLED, on);
        } else if (token.startsWith(TRANS)) {
            editor.putBoolean(Subtitles.PREF_ENABLED, true)
                    .putString(Subtitles.PREF_TRACK, "")
                    .putString(Subtitles.PREF_TARGET, token.substring(TRANS.length()));
        } else if (token.startsWith(STYLE + ":")) {
            editor.putInt(Subtitles.PREF_STYLE,
                    Integer.parseInt(token.substring(STYLE.length() + 1)));
            appearance = true;
        } else if (token.startsWith(SIZE + ":")) {
            editor.putInt(Subtitles.PREF_SIZE,
                    Integer.parseInt(token.substring(SIZE.length() + 1)));
            appearance = true;
        } else if (token.startsWith(POSITION + ":")) {
            editor.putInt(Subtitles.PREF_POSITION,
                    Integer.parseInt(token.substring(POSITION.length() + 1)));
            appearance = true;
        } else {
            return;
        }
        editor.apply();

        Log.i(TAG, "subtitles picked " + token);
        repaint();
        if (appearance) {
            Subtitles.applyStyle(player());
            return;
        }
        SubtitleButton.syncGlyphs(context);
        Subtitles.refresh(player());
    }

    /** Called with the player's view, which is where a pick in the panel has to be drawn. */
    public static void notePlayer(View root) {
        player = new WeakReference<>(root);
    }

    // ---------------------------------------------------------------------------------------------
    // The row
    // ---------------------------------------------------------------------------------------------

    private static View player() {
        return player == null ? null : player.get();
    }

    private static Context context() {
        View root = player();
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
            ((ImageView) found).setImageDrawable(
                    new SubtitleButton.Glyph(Subtitles.isEnabled(view.getContext())));
        }
    }

    /** @return what the row says at its end: the language the captions are on, or the switch. */
    private static String valueText(Context context, String token) {
        SharedPreferences prefs = Subtitles.prefs(context);
        boolean enabled = prefs.getBoolean(Subtitles.PREF_ENABLED, false);
        String track = prefs.getString(Subtitles.PREF_TRACK, "");
        String target = prefs.getString(Subtitles.PREF_TARGET, "");
        // The floating button turns captions on without naming a language, so ask the player.
        String chosen = isEmpty(track) ? Subtitles.currentLanguage(context) : track;

        if (ROOT.equals(token)) {
            if (!enabled) return "Off";
            if (!isEmpty(target)) return language(target);
            return isEmpty(chosen) ? "On" : language(chosen);
        }
        if (token.equals(TOGGLE)) return enabled ? "On" : "Off";
        if (token.equals(STYLE)) return Subtitles.STYLE_NAMES[Subtitles.styleIndex(context)];
        if (token.equals(SIZE)) return Subtitles.sizeLabel(Subtitles.sizePercent(context));
        if (token.equals(POSITION)) return Subtitles.positionPercent(context) + "%";
        if (token.startsWith(STYLE + ":")) {
            return token.equals(STYLE + ":" + Subtitles.styleIndex(context)) ? "On" : "";
        }
        if (token.startsWith(SIZE + ":")) {
            return token.equals(SIZE + ":" + Subtitles.sizePercent(context)) ? "On" : "";
        }
        if (token.startsWith(POSITION + ":")) {
            return token.equals(POSITION + ":" + Subtitles.positionPercent(context)) ? "On" : "";
        }
        // The language row carries its name and an arrow only; the switch above owns the On/Off.
        return enabled && token.equals(TRANS + target) ? "On" : "";
    }

    private static boolean isEmpty(String value) {
        return value == null || value.isEmpty();
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

    /** The params class the row lays its own children out with. */
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
            if ("getSubMenu".equals(name)) return subMenu == null ? submenu(token) : subMenu;
            if ("toString".equals(name)) return "SubtitlesRow(" + token + ")";
            if ("hashCode".equals(name)) return Integer.valueOf(System.identityHashCode(proxy));
            if ("equals".equals(name)) return Boolean.valueOf(args != null && args[0] == proxy);
            return null;
        }
    }

    /** @return the rows of the panel this row opens. */
    private static List<Object> submenu(String token) {
        if (token.startsWith(TARGET)) return targets();
        if (token.equals(STYLE)) return styles();
        if (token.equals(SIZE)) return sizes();
        if (token.equals(POSITION)) return positions();
        return languages();
    }

    /**
     * The panel's rows, read when the panel opens: a switch and one language row naming what the
     * captions show in now, which opens the chooser.
     */
    private static List<Object> languages() {
        List<Object> rows = new ArrayList<>();
        rows.add(row(TOGGLE, "Subtitles", false, Collections.emptyList()));
        String code = displayLanguage();
        rows.add(row(TARGET + code, language(code), true, null));
        rows.add(row(STYLE, "Style", true, null));
        rows.add(row(SIZE, "Size", true, null));
        rows.add(row(POSITION, "Position", true, null));
        return rows;
    }

    /** The style presets, in SmartTube's order, each marking itself when it is the one in force. */
    private static List<Object> styles() {
        List<Object> rows = new ArrayList<>();
        for (int i = 0; i < Subtitles.STYLE_NAMES.length; i++) {
            rows.add(row(STYLE + ":" + i, Subtitles.STYLE_NAMES[i], false, Collections.emptyList()));
        }
        return rows;
    }

    private static List<Object> sizes() {
        List<Object> rows = new ArrayList<>();
        for (int percent : Subtitles.SIZES) {
            rows.add(row(SIZE + ":" + percent, Subtitles.sizeLabel(percent), false,
                    Collections.emptyList()));
        }
        return rows;
    }

    private static List<Object> positions() {
        List<Object> rows = new ArrayList<>();
        for (int percent : Subtitles.POSITIONS) {
            rows.add(row(POSITION + ":" + percent, percent + "%", false, Collections.emptyList()));
        }
        return rows;
    }

    /**
     * @return the language the one row names: the translate target if there is one, else the picked
     * or playing track.
     */
    private static String displayLanguage() {
        Context context = context();
        if (context == null) return Locale.getDefault().getLanguage();

        String target = Subtitles.pref(context, Subtitles.PREF_TARGET);
        if (!isEmpty(target)) return target;

        String track = Subtitles.pref(context, Subtitles.PREF_TRACK);
        if (!isEmpty(track)) return track;

        String current = Subtitles.currentLanguage(context);
        return isEmpty(current) ? Locale.getDefault().getLanguage() : current;
    }

    /** The languages to translate into, in the order TikTok itself lists them. */
    private static List<Object> targets() {
        List<Object> rows = new ArrayList<>();
        for (String[] entry : Subtitles.serverLanguages()) {
            rows.add(row(TRANS + entry[1], entry[0], false, Collections.emptyList()));
        }
        if (!rows.isEmpty()) return rows;

        // The table is in every build this patch runs against, but a panel that offers nothing is
        // worse than one that falls back to the device language.
        String device = Locale.getDefault().getLanguage();
        rows.add(row(TRANS + device, language(device), false, Collections.emptyList()));
        if (!"en".equals(device)) {
            rows.add(row(TRANS + "en", language("en"), false, Collections.emptyList()));
        }
        return rows;
    }

    /** @return the language's own name, which is what a viewer reads it as on this device. */
    private static String language(String code) {
        if (code == null || code.isEmpty()) return "";

        String server = Subtitles.serverName(code);
        if (server != null) return server;
        if ("zh".equals(code)) return "中文";

        String name = new Locale(code).getDisplayLanguage(Locale.getDefault());
        if (name == null || name.isEmpty()) return code;
        return Character.toUpperCase(name.charAt(0)) + name.substring(1);
    }

    // ---------------------------------------------------------------------------------------------
    // Reflection
    // ---------------------------------------------------------------------------------------------

    private static boolean isMine(Object item) {
        return tokenOf(item).startsWith(TOKEN);
    }

    private static String tokenOf(Object item) {
        Object token = call(item, "getExtra");
        return token instanceof String ? (String) token : "";
    }

    private static int typeOf(Object item) {
        Object type = call(item, "getType");
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

    private static Object call(Object target, String name) {
        return Subtitles.call(target, name);
    }
}
