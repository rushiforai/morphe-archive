package app.template.extension.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Adds the translation controls to the player's More pane. */
@SuppressWarnings("unused")
public final class TranslateCommentsMenu {

    private static final String TAG = "TikTokTVTranslate";
    private static final String MENU_ITEM = "com.ss.android.ugc.aweme.tv.feed.fragment.moremenu.a";
    private static final String VALUE_TAG = "app.tiktoktv.translate.value";

    private static final String TOKEN = "tr:";
    private static final String ROOT = TOKEN + "root";
    private static final String ALWAYS = TOKEN + "always";
    private static final String DONT = TOKEN + "dont";
    private static final String TARGET = TOKEN + "target";
    private static final String CAPTION = TOKEN + "caption";
    private static final String DONT_ITEM = TOKEN + "skip:";
    private static final String TARGET_ITEM = TOKEN + "to:";

    /** The loop switch is the one row every root menu carries, which is how the root is spotted. */
    private static final int TYPE_LOOP = 1;

    private static final List<Bound> BOUND = new ArrayList<>();
    private static WeakReference<Context> contextRef = new WeakReference<>(null);

    private TranslateCommentsMenu() {
    }

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

        rows.add(loop, row(ROOT, "Translation", true, null));
        Log.i(TAG, "translation row added to the more menu");
    }

    /** Called with each row the menu adapter binds. */
    public static void bindRow(Object holder, Object item) {
        View view = itemView(holder);
        if (view == null) return;

        contextRef = new WeakReference<>(view.getContext());
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
        if (!token.startsWith(TOKEN) || token.equals(ROOT)
                || token.equals(DONT) || token.equals(TARGET)) {
            return;
        }

        Context context = contextRef.get();
        if (context == null) return;

        SharedPreferences.Editor editor = TranslateComments.prefs(context).edit();
        if (token.equals(ALWAYS)) {
            editor.putBoolean(TranslateComments.PREF_ALWAYS,
                    !TranslateComments.isAlways(context));
        } else if (token.equals(CAPTION)) {
            editor.putBoolean(TranslateComments.PREF_CAPTION,
                    !TranslateComments.isCaption(context));
        } else if (token.startsWith(DONT_ITEM)) {
            String code = token.substring(DONT_ITEM.length());
            Set<String> codes = new HashSet<>(TranslateComments.dont(context));
            boolean removed = false;
            for (String existing : new HashSet<>(codes)) {
                if (TranslateComments.base(existing)
                        .equalsIgnoreCase(TranslateComments.base(code))) {
                    codes.remove(existing);
                    removed = true;
                }
            }
            if (!removed) codes.add(code);
            editor.putStringSet(TranslateComments.PREF_DONT, codes);
        } else if (token.startsWith(TARGET_ITEM)) {
            editor.putString(TranslateComments.PREF_TARGET, token.substring(TARGET_ITEM.length()));
        } else {
            return;
        }
        editor.apply();

        Log.i(TAG, "translation picked " + token);
        repaint();
        TranslateComments.refresh();
        TranslateComments.refreshCaption();
    }

    // ---------------------------------------------------------------------------------------------
    // The row
    // ---------------------------------------------------------------------------------------------

    private static void paint(View view, String token) {
        boolean mine = token.startsWith(TOKEN);
        Context context = view.getContext();
        String text = mine ? valueText(context, token) : "";

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
            ((ImageView) found).setImageDrawable(new AaGlyph());
        }
    }

    private static String valueText(Context context, String token) {
        if (ROOT.equals(token) || TARGET.equals(token)) {
            return TranslateComments.languageName(TranslateComments.target(context));
        }
        if (token.equals(ALWAYS)) {
            return TranslateComments.isAlways(context) ? "On" : "Off";
        }
        if (token.equals(CAPTION)) {
            return TranslateComments.isCaption(context) ? "On" : "Off";
        }
        if (token.equals(DONT)) {
            int count = TranslateComments.dont(context).size();
            return count == 0 ? "" : count + (count == 1 ? " language" : " languages");
        }
        if (token.startsWith(DONT_ITEM)) {
            return TranslateComments.isDont(context, token.substring(DONT_ITEM.length()))
                    ? "On" : "";
        }
        if (token.startsWith(TARGET_ITEM)) {
            String code = token.substring(TARGET_ITEM.length());
            return TranslateComments.base(code)
                    .equalsIgnoreCase(TranslateComments.base(TranslateComments.target(context)))
                    ? "On" : "";
        }
        return "";
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

        row.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> align(row, value));
        return value;
    }

    private static ViewGroup.LayoutParams paramsOf(ViewGroup row) {
        int titleId = Subtitles.idOf(row, "menu_title");
        View title = titleId == 0 ? null : row.findViewById(titleId);
        if (title != null && title.getLayoutParams() != null) return title.getLayoutParams();

        return row.getChildCount() == 0 ? null : row.getChildAt(0).getLayoutParams();
    }

    private static void align(View view, TextView value) {
        int titleId = Subtitles.idOf(view, "menu_title");
        View title = titleId == 0 ? null : view.findViewById(titleId);
        if (title == null || value.getWidth() <= 0) return;

        int arrowId = Subtitles.idOf(view, "right_icon_view");
        View arrow = arrowId == 0 ? null : view.findViewById(arrowId);
        int right = view.getWidth() - view.getPaddingRight();
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
            if ("toString".equals(name)) return "TranslationRow(" + token + ")";
            if ("hashCode".equals(name)) return Integer.valueOf(System.identityHashCode(proxy));
            if ("equals".equals(name)) return Boolean.valueOf(args != null && args[0] == proxy);
            return null;
        }
    }

    private static List<Object> submenu(String token) {
        if (token.equals(DONT)) return dontList();
        if (token.equals(TARGET)) return targets();
        return panel();
    }

    /** The four rows TikTok's translation panel carries, in the order the brief names them. */
    private static List<Object> panel() {
        List<Object> rows = new ArrayList<>();
        rows.add(row(ALWAYS, "Always translate comments", false, Collections.emptyList()));
        rows.add(row(DONT, "Do not translate", true, null));
        rows.add(row(TARGET, "Translate to", true, null));
        rows.add(row(CAPTION, "Also translate caption", false, Collections.emptyList()));
        return rows;
    }

    /** The languages the viewer has excluded from translation, each marking itself "On". */
    private static List<Object> dontList() {
        List<Object> rows = new ArrayList<>();
        for (String[] entry : Subtitles.serverLanguages()) {
            rows.add(row(DONT_ITEM + entry[1], entry[0], false, Collections.emptyList()));
        }
        if (rows.isEmpty()) {
            String device = java.util.Locale.getDefault().getLanguage();
            rows.add(row(DONT_ITEM + device, TranslateComments.languageName(device), false,
                    Collections.emptyList()));
        }
        return rows;
    }

    /** The languages to translate into, in the order TikTok itself lists them. */
    private static List<Object> targets() {
        List<Object> rows = new ArrayList<>();
        for (String[] entry : Subtitles.serverLanguages()) {
            rows.add(row(TARGET_ITEM + entry[1], entry[0], false, Collections.emptyList()));
        }
        if (!rows.isEmpty()) return rows;

        String device = java.util.Locale.getDefault().getLanguage();
        rows.add(row(TARGET_ITEM + device, TranslateComments.languageName(device), false,
                Collections.emptyList()));
        if (!"en".equals(device)) {
            rows.add(row(TARGET_ITEM + "en", TranslateComments.languageName("en"), false,
                    Collections.emptyList()));
        }
        return rows;
    }

    // ---------------------------------------------------------------------------------------------
    // The Aa mark
    // ---------------------------------------------------------------------------------------------

    /** TikTok's translation mark: a rounded square with a bold "Aa". */
    static final class AaGlyph extends Drawable {

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private boolean focused;

        AaGlyph() {
            paint.setTypeface(Typeface.create("sans-serif", Typeface.BOLD));
            paint.setTextAlign(Paint.Align.CENTER);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            if (bounds.width() <= 0 || bounds.height() <= 0) return;

            int colour = focused ? Color.BLACK : Color.WHITE;
            paint.setColor(colour);

            float inset = bounds.height() * 0.10f;
            RectF box = new RectF(bounds.left + inset, bounds.top + inset,
                    bounds.right - inset, bounds.bottom - inset);
            float radius = bounds.height() * 0.18f;

            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(Math.max(1f, bounds.height() * 0.055f));
            canvas.drawRoundRect(box, radius, radius, paint);

            paint.setStyle(Paint.Style.FILL);
            paint.setTextSize(bounds.height() * 0.43f);
            Paint.FontMetrics metrics = paint.getFontMetrics();
            float centreY = bounds.exactCenterY() - (metrics.ascent + metrics.descent) / 2f;
            canvas.drawText("Aa", bounds.exactCenterX(), centreY, paint);
        }

        @Override
        public boolean isStateful() {
            return true;
        }

        @Override
        protected boolean onStateChange(int[] state) {
            boolean now = false;
            for (int value : state) {
                if (value == android.R.attr.state_focused) {
                    now = true;
                    break;
                }
            }
            if (now != focused) {
                focused = now;
                invalidateSelf();
            }
            return true;
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
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
