/*
 * Story mention indicator for Instagram (Morphe).
 *
 * Approach derived from the "View story mentions" feature of Piko
 * <https://github.com/crimera/piko> (GPLv3; see NOTICE.piko).
 */

package app.morphe.extension.instagram.patches.story;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import android.text.Layout;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.WeakHashMap;

/**
 * Adds an "@N mention" pill to the story header, as a real child of the header's own layout, right
 * after the username. Being part of the header, it is shown, hidden, animated and recycled together
 * with it, which is what the earlier overlay-on-the-screen approaches could not do reliably.
 *
 * Mention data is read by reflection using Instagram's non-obfuscated model class names; only the
 * two obfuscated method names are supplied by the patch.
 */
@SuppressWarnings("unused")
public final class StoryMentionIcon {
    private static final String TAG = "StoryMentionIcon";
    private static final String PILL_TAG = "wagg13_story_mention_pill";
    private static final String WRAPPER_TAG = "wagg13_story_mention_row";

    private static final String REEL_ITEM_MEDIA = "com.instagram.feed.media.Media";
    private static final String MEDIA_DICT = "com.instagram.feed.media.LiveTreeMediaDict";
    private static final String USER = "com.instagram.user.model.User";
    private static final String USER_DICT = "com.instagram.user.model.LiveTreeUserDict";

    private static final int GAP_DP = 8;
    private static final int MAX_RETRIES = 30;
    private static final long RETRY_DELAY_MS = 100L;
    private static final String[] RESOURCE_PACKAGES = {null, "com.instagram.android"};

    private static int titleId = -1;

    /**
     * Latest binding token per story view. Several story fragments are bound at the same time
     * (current and neighbours), so a token must be per view: a shared one let a neighbour's bind
     * cancel the pending retries of the story being watched, which then never got its pill.
     */
    private static final WeakHashMap<View, Integer> BINDINGS = new WeakHashMap<>();
    private static final WeakHashMap<Pill, Boolean> PILLS = new WeakHashMap<>();
    private static int bindingCounter;
    private static WeakReference<Activity> activityRef = new WeakReference<>(null);

    private StoryMentionIcon() {
    }

    private static final String ITEM_VIEW_GROUP = "com.instagram.reels.viewer.common.ReelViewGroup";

    /**
     * Hook entry point, called when a story item becomes the active one. The viewer fragment's view
     * can contain the views of several items (the current one and its neighbours), so the header is
     * looked up in the active item's own view (the ReelViewGroup held by its view holder), not in the
     * fragment's view: otherwise the first header found may belong to another item.
     */
    public static void update(Object fragmentObject, Object reelItem, Object holder,
                              String mentionsMethod, String usernameMethod) {
        try {
            if (reelItem == null) return;
            View root = itemRoot(holder);
            String source = "holder";
            if (root == null && fragmentObject != null) {
                // Fragment.getView() via reflection: androidx.fragment is not on this module's
                // compile classpath.
                Object viewObject = fragmentObject.getClass().getMethod("getView").invoke(fragmentObject);
                if (viewObject instanceof View) root = (View) viewObject;
                source = "fragment";
            }
            if (root == null) return;
            Activity activity = activityOf(root.getContext());
            if (activity != null) activityRef = new WeakReference<>(activity);

            List<String> usernames = readMentions(reelItem, mentionsMethod, usernameMethod);
            Log.w(TAG, "update: mentions=" + usernames.size() + " " + usernames
                    + " root=" + source + "@" + Integer.toHexString(System.identityHashCode(root)));
            int token = ++bindingCounter;
            BINDINGS.put(root, token);
            bind(root, usernames, token, 0);
        } catch (Throwable t) {
            Log.e(TAG, "update failed", t);
        }
    }

    /** The active item's root view: the ReelViewGroup field of its view holder (or a superclass). */
    private static View itemRoot(Object holder) throws Exception {
        if (holder == null) return null;
        for (Class<?> c = holder.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (!f.getType().getName().equals(ITEM_VIEW_GROUP)) continue;
                f.setAccessible(true);
                Object value = f.get(holder);
                if (value instanceof View) return (View) value;
            }
        }
        return null;
    }

    /** Re-applies the on/off setting to every pill. */
    public static void refresh() {
        try {
            for (Pill pill : new ArrayList<>(PILLS.keySet())) apply(pill, pill.usernames);
        } catch (Throwable t) {
            Log.e(TAG, "refresh failed", t);
        }
    }

    // ---- data ----------------------------------------------------------------------------

    private static List<String> readMentions(Object reelItem, String mentionsMethod, String usernameMethod)
            throws Exception {
        // ReelItem has more than one Media field (the final one is the story's own media, which is
        // what Piko reads). Try the final one first, then any other, and take the first with mentions.
        for (Object media : mediaCandidates(reelItem)) {
            Object dict = firstFieldOfType(media, MEDIA_DICT);
            if (dict == null) continue;
            List<String> names = readNames(dict, mentionsMethod, usernameMethod);
            if (!names.isEmpty()) return names;
        }
        return new ArrayList<>();
    }

    private static List<String> readNames(Object dict, String mentionsMethod, String usernameMethod)
            throws Exception {
        Object list = invokeNoArg(dict, mentionsMethod);
        LinkedHashSet<String> result = new LinkedHashSet<>();
        if (!(list instanceof List)) return new ArrayList<>();

        for (Object mention : (List<?>) list) {
            if (mention == null) continue;
            Object user = callReturning(mention, USER);
            Object userDict = user == null ? null : firstFieldOfType(user, USER_DICT);
            if (userDict == null) continue;
            Object name = invokeNoArg(userDict, usernameMethod);
            if (name instanceof String && !((String) name).isEmpty()) result.add((String) name);
        }
        return new ArrayList<>(result);
    }

    private static List<Object> mediaCandidates(Object reelItem) throws Exception {
        List<Object> finals = new ArrayList<>();
        List<Object> others = new ArrayList<>();
        for (Class<?> c = reelItem.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (!f.getType().getName().equals(REEL_ITEM_MEDIA)) continue;
                f.setAccessible(true);
                Object value = f.get(reelItem);
                if (value == null) continue;
                (Modifier.isFinal(f.getModifiers()) ? finals : others).add(value);
            }
        }
        finals.addAll(others);
        return finals;
    }

    private static Object firstFieldOfType(Object target, String typeName) throws Exception {
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (f.getType().getName().equals(typeName)) {
                    f.setAccessible(true);
                    Object value = f.get(target);
                    if (value != null) return value;
                }
            }
        }
        return null;
    }

    /** Calls the first no-arg method of the object whose return type is exactly typeName. */
    private static Object callReturning(Object target, String typeName) throws Exception {
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Method m : c.getDeclaredMethods()) {
                if (m.getParameterTypes().length == 0 && m.getReturnType().getName().equals(typeName)) {
                    m.setAccessible(true);
                    Object value = m.invoke(target);
                    if (value != null) return value;
                }
            }
        }
        return null;
    }

    private static Object invokeNoArg(Object target, String methodName) throws Exception {
        for (Class<?> c = target.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(methodName);
                m.setAccessible(true);
                return m.invoke(target);
            } catch (NoSuchMethodException ignored) {
                // Try the superclass.
            }
        }
        return null;
    }

    // ---- UI ------------------------------------------------------------------------------

    /** The pill: a TextView that remembers the mentions it shows. */
    private static final class Pill extends TextView {
        List<String> usernames = new ArrayList<>();
        int appliedStyle = -1;

        Pill(Context context) {
            super(context);
        }
    }

    /**
     * Finds the header (retrying briefly: it may not be inflated yet when the story is bound),
     * makes sure it contains the pill and applies the mentions to it. A newer binding of the same
     * story view cancels the retries of an older one.
     */
    private static void bind(View root, List<String> usernames, int token, int attempt) {
        Integer current = BINDINGS.get(root);
        if (current == null || current != token) return;

        View title = root.findViewById(titleId(root.getContext()));
        if (usernames.isEmpty()) {
            // Nothing to show: only hide a pill this header already has, never add one.
            Pill existing = title == null ? null : findPill(title);
            if (existing != null) apply(existing, usernames);
            return;
        }

        Pill pill = title == null ? null : ensurePill(title);
        if (pill == null) {
            if (attempt < MAX_RETRIES) {
                root.postDelayed(() -> bind(root, usernames, token, attempt + 1), RETRY_DELAY_MS);
            } else {
                Log.w(TAG, "header or its layout not usable after retries (title="
                        + (title == null ? "null" : title.getClass().getName()) + ")");
            }
            return;
        }
        apply(pill, usernames);
    }

    private static void apply(Pill pill, List<String> usernames) {
        pill.usernames = usernames;
        if (usernames.isEmpty() || !StoryMentionSettings.isEnabled(pill.getContext())) {
            pill.setVisibility(View.GONE);
            return;
        }
        int style = StoryMentionSettings.style(pill.getContext());
        if (pill.appliedStyle != style) {
            applyStyle(pill, style);
            pill.appliedStyle = style;
        }
        int count = usernames.size();
        pill.setText("@" + count + (count == 1 ? " mention" : " mentions"));
        pill.setOnClickListener(v -> showMentions(v.getContext(), pill.usernames));
        pill.setVisibility(View.VISIBLE);
    }

    private static Pill findPill(View title) {
        ViewGroup parent = (ViewGroup) title.getParent();
        if (parent == null) return null;
        View existing = parent.findViewWithTag(PILL_TAG);
        return existing instanceof Pill ? (Pill) existing : null;
    }

    /**
     * Returns the pill living next to the username, creating it on first use. The username's parent
     * is a LinearLayout (its LayoutParams are LinearLayout ones): horizontal, the pill is inserted
     * right after the username; vertical (username above the subtitle), the username is moved into
     * a small horizontal row together with the pill. Anything else is logged and left untouched.
     */
    private static Pill ensurePill(View title) {
        ViewGroup parent = (ViewGroup) title.getParent();
        if (parent == null) return null;
        Pill existing = findPill(title);
        if (existing != null) return existing;

        Context context = title.getContext();
        ViewGroup.LayoutParams titleLp = title.getLayoutParams();
        Log.w(TAG, "header layout: parent=" + parent.getClass().getName()
                + (parent instanceof LinearLayout ? " orientation=" + ((LinearLayout) parent).getOrientation() : "")
                + " titleLp=" + (titleLp == null ? "null" : titleLp.getClass().getName()
                + " w=" + titleLp.width
                + (titleLp instanceof LinearLayout.LayoutParams ? " weight=" + ((LinearLayout.LayoutParams) titleLp).weight : "")));
        if (!(parent instanceof LinearLayout)) return null;

        Pill pill = newPill(context);
        LinearLayout.LayoutParams pillLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        pillLp.gravity = Gravity.CENTER_VERTICAL;
        pillLp.setMarginStart(dp(context, GAP_DP));

        LinearLayout row;
        if (((LinearLayout) parent).getOrientation() == LinearLayout.HORIZONTAL) {
            parent.addView(pill, parent.indexOfChild(title) + 1, pillLp);
            row = (LinearLayout) parent;
        } else {
            int index = parent.indexOfChild(title);
            row = new LinearLayout(context);
            row.setTag(WRAPPER_TAG);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            parent.removeViewAt(index);
            row.addView(title, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            row.addView(pill, pillLp);
            parent.addView(row, index, titleLp);
        }
        keepPillNextToName(row, title, pill);
        PILLS.put(pill, Boolean.TRUE);
        return pill;
    }

    /**
     * Keeps the pill glued to the username on every layout of the row:
     * - the header sometimes gives the username all the free space (weight 1), which would leave the
     *   pill at the far end of the row; it is shifted left over that empty space (translation does
     *   not affect the layout of the other header elements);
     * - a long username must not push the pill out of the row: while the pill is shown, the
     *   username's max width is capped to what is left after the pill, and restored afterwards.
     */
    private static void keepPillNextToName(View row, View title, Pill pill) {
        if (!(title instanceof TextView)) return;
        TextView name = (TextView) title;
        int originalMaxWidth = name.getMaxWidth();
        row.addOnLayoutChangeListener((v, l, t, r, b, oldL, oldT, oldR, oldB) -> {
            if (pill.getVisibility() != View.VISIBLE) {
                if (name.getMaxWidth() != originalMaxWidth) name.setMaxWidth(originalMaxWidth);
                if (pill.getTranslationX() != 0) pill.setTranslationX(0);
                return;
            }
            Layout layout = name.getLayout();
            if (layout != null && layout.getLineCount() > 0) {
                int textWidth = name.getCompoundPaddingLeft() + (int) Math.ceil(layout.getLineWidth(0))
                        + name.getCompoundPaddingRight();
                float shift = -Math.max(0, name.getWidth() - textWidth);
                if (pill.getTranslationX() != shift) pill.setTranslationX(shift);
            }
            int rowWidth = r - l - v.getPaddingLeft() - v.getPaddingRight();
            pill.measure(View.MeasureSpec.UNSPECIFIED, View.MeasureSpec.UNSPECIFIED);
            int available = rowWidth - pill.getMeasuredWidth() - dp(v.getContext(), GAP_DP);
            if (available > 0 && name.getMaxWidth() > available) name.setMaxWidth(available);
        });
    }

    private static Pill newPill(Context context) {
        Pill pill = new Pill(context);
        pill.setTag(PILL_TAG);
        pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        pill.setSingleLine(true);
        pill.setGravity(Gravity.CENTER);
        pill.setClickable(true);
        pill.setVisibility(View.GONE);
        return pill;
    }

    private static int titleId(Context context) {
        if (titleId <= 0) titleId = resolveId(context, "reel_viewer_title");
        return titleId;
    }

    /** Resource package may be renamed in patched builds, so try both. */
    private static int resolveId(Context context, String name) {
        for (String pkg : RESOURCE_PACKAGES) {
            int id = context.getResources().getIdentifier(name, "id", pkg == null ? context.getPackageName() : pkg);
            if (id != 0) return id;
        }
        return 0;
    }

    /** The header's views can carry a non-Activity themed context; dialogs need the Activity. */
    private static Activity activityOf(Context context) {
        Context c = context;
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return c instanceof Activity ? (Activity) c : activityRef.get();
    }

    // ---- styles --------------------------------------------------------------------------

    public static final int STYLE_CLASSIC = 0;
    public static final int STYLE_GLASS = 1;
    public static final int STYLE_MATERIAL = 2;
    public static final int STYLE_NEO = 3;
    public static final int STYLE_PEARL = 4;
    public static final int STYLE_COUNT = 5;

    public static String styleName(int style, boolean portuguese) {
        switch (style) {
            case STYLE_GLASS:
                return "Glassmorphism";
            case STYLE_MATERIAL:
                return "Material You";
            case STYLE_NEO:
                return "Neo-Brutalist Line";
            case STYLE_PEARL:
                return "Soft-Material & Pearl";
            default:
                return portuguese ? "Clássico" : "Classic";
        }
    }

    /** Applies one of the bubble styles to a TextView (the header pill and the settings previews). */
    public static void applyStyle(TextView tv, int style) {
        Context c = tv.getContext();
        int padH = 10;
        int padV = 3;
        tv.setElevation(0);
        tv.setShadowLayer(0, 0, 0, 0);
        tv.setTypeface(Typeface.DEFAULT);
        switch (style) {
            case STYLE_GLASS: {
                // Frosted glass: translucent vertical gradient with a bright thin edge. A real
                // backdrop blur is not available to a plain view, so it is only suggested.
                GradientDrawable glass = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM,
                        new int[]{0x70FFFFFF, 0x2AFFFFFF});
                glass.setCornerRadius(dp(c, 100));
                glass.setStroke(Math.max(1, dp(c, 1)), 0xB3FFFFFF);
                tv.setBackground(glass);
                tv.setTextColor(Color.WHITE);
                tv.setShadowLayer(dp(c, 2), 0, 1, 0x66000000);
                padH = 12;
                padV = 4;
                break;
            }
            case STYLE_MATERIAL: {
                GradientDrawable outer = new GradientDrawable();
                outer.setColor(0xFFE3EEF8);
                outer.setCornerRadius(dp(c, 100));
                outer.setStroke(Math.max(1, dp(c, 2)), 0xFFA9C1D6);
                GradientDrawable ring = new GradientDrawable();
                ring.setColor(Color.TRANSPARENT);
                ring.setCornerRadius(dp(c, 100));
                ring.setStroke(Math.max(1, dp(c, 1)), 0xFFC4D6E6);
                tv.setBackground(new LayerDrawable(new Drawable[]{
                        outer, new InsetDrawable(ring, dp(c, 3))}));
                tv.setTextColor(0xFF1C2B36);
                tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                padH = 14;
                padV = 5;
                break;
            }
            case STYLE_NEO: {
                tv.setBackground(new RainbowFrame(c));
                tv.setTextColor(Color.WHITE);
                padH = 14;
                padV = 7;
                break;
            }
            case STYLE_PEARL: {
                GradientDrawable pearl = new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT,
                        new int[]{0xFFF8F2F9, 0xFFE7EDF8, 0xFFF4E9F3});
                pearl.setCornerRadius(dp(c, 100));
                pearl.setStroke(Math.max(1, dp(c, 1)), 0xFFFFFFFF);
                tv.setBackground(pearl);
                tv.setTextColor(0xFF6E6A75);
                tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                tv.setElevation(dp(c, 3));
                padH = 14;
                padV = 4;
                break;
            }
            default: {
                GradientDrawable classic = new GradientDrawable();
                classic.setColor(0xFFE8425F);
                classic.setCornerRadius(dp(c, 14));
                tv.setBackground(classic);
                tv.setTextColor(Color.WHITE);
                break;
            }
        }
        // After the background: some backgrounds would otherwise override the padding.
        tv.setPadding(dp(c, padH), dp(c, padV), dp(c, padH), dp(c, padV));
    }

    /** Two nested rounded outlines with colour gradients over a dark translucent fill. */
    private static final class RainbowFrame extends Drawable {
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint outer = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint inner = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final float stroke;
        private final float outerRadius;
        private final float innerRadius;
        private final RectF rect = new RectF();

        RainbowFrame(Context c) {
            stroke = Math.max(1f, dp(c, 2));
            outerRadius = dp(c, 8);
            innerRadius = dp(c, 5);
            fill.setStyle(Paint.Style.FILL);
            fill.setColor(0x40000000);
            outer.setStyle(Paint.Style.STROKE);
            outer.setStrokeWidth(stroke);
            inner.setStyle(Paint.Style.STROKE);
            inner.setStrokeWidth(stroke);
        }

        @Override
        protected void onBoundsChange(Rect b) {
            outer.setShader(new LinearGradient(b.left, 0, b.right, 0,
                    new int[]{0xFF00E5FF, 0xFF5B8CFF, 0xFFFF3DCB}, null, Shader.TileMode.CLAMP));
            inner.setShader(new LinearGradient(b.left, 0, b.right, 0,
                    new int[]{0xFF7CFF4D, 0xFFFFD400, 0xFFFF4DA6}, null, Shader.TileMode.CLAMP));
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            rect.set(b);
            rect.inset(stroke / 2f, stroke / 2f);
            canvas.drawRoundRect(rect, outerRadius, outerRadius, fill);
            canvas.drawRoundRect(rect, outerRadius, outerRadius, outer);
            rect.set(b);
            rect.inset(stroke * 2.5f, stroke * 2.5f);
            canvas.drawRoundRect(rect, innerRadius, innerRadius, inner);
        }

        @Override
        public void setAlpha(int alpha) {
            fill.setAlpha(alpha);
            outer.setAlpha(alpha);
            inner.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            fill.setColorFilter(colorFilter);
            outer.setColorFilter(colorFilter);
            inner.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    // ---- dialog / navigation -------------------------------------------------------------

    private static void showMentions(Context viewContext, List<String> usernames) {
        Activity activity = activityOf(viewContext);
        if (activity == null || activity.isFinishing()) {
            Log.w(TAG, "no Activity available to show the mentions dialog");
            return;
        }
        String[] items = new String[usernames.size()];
        for (int i = 0; i < items.length; i++) items[i] = "@" + usernames.get(i);
        new AlertDialog.Builder(activity)
                .setTitle(items.length == 1 ? "Mention" : "Mentions")
                .setItems(items, (dialog, which) -> openProfile(activity, usernames.get(which)))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    /**
     * Opens the profile with the same intent Instagram's own UrlHandlerLauncherActivity builds for
     * itself (class UrlHandlerActivity, CLEAR_TOP, data = deep link). Going through the launcher
     * activity (what Piko's openUrl does) starts it but nothing opens on 439, and no UrlHandlerActivity
     * start follows in the activity manager log. Logged at WARN while this is being diagnosed.
     */
    private static void openProfile(Context context, String username) {
        Uri uri = Uri.parse("instagram://user?username=" + Uri.encode(username));
        try {
            Intent intent = new Intent();
            intent.setClassName(context.getPackageName(), "com.instagram.url.UrlHandlerActivity");
            intent.setData(uri);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            Log.w(TAG, "openProfile " + uri + " via UrlHandlerActivity");
            context.startActivity(intent);
        } catch (Throwable first) {
            Log.w(TAG, "UrlHandlerActivity start failed, trying the deep link", first);
            try {
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                intent.setPackage(context.getPackageName());
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            } catch (Throwable second) {
                Log.e(TAG, "openProfile failed for " + uri, second);
            }
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }
}
