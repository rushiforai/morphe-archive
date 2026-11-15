package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.view.ViewParent;
import android.view.MotionEvent;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TableLayout;
import android.view.ViewTreeObserver;
import android.widget.TableRow;
import android.widget.CheckBox;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Card and compact stay two different post arrangements. Image style stays
 * full height, 16:9, or thumbnail. Details and actions are one ordered list.
 */
public final class PostLayout {
    private static final String TAG = "MorphePost";
    private static final String PREFS = "mighty_morphing";
    private static final String KEY_DETAIL_ORDER = "post_detail_order_v2";
    private static final String KEY_DETAIL_PLACE = "post_detail_place_v2";
    private static final String KEY_ACTION_ORDER = "post_action_order_v2";
    private static final String KEY_ACTION_PLACE = "post_action_place_v2";
    private static final int SHOWN = 'S';
    private static final int OVERFLOW = 'O';
    private static final int HIDDEN = 'H';
    /** Joey's own order for the info line (ud.a.f). Score is not on Joey's line, so it comes last. */
    private static final String[][] DETAILS = {
            {"subreddit", "Subreddit"},
            {"comments", "Comments"},
            {"time", "Time"},
            {"author", "Author"},
            {"flair", "User flair"},
            {"percent", "Upvote percentage"},
            {"domain", "Domain"},
            {"score", "Score"},
    };

    /** The star and download stay left of the gap. Votes stay on the right, beside the score. */
    private static final String[][] ACTIONS = {
            {"save", "Save"},
            {"download", "Download"},
            {"share_icon", "Share"},
            {"link_icon", "Link"},
            {"preview_icon", "Text preview"},
            {"hide_icon", "Hide"},
            {"commentsTextView", "Comments"},
            {"upvote", "Upvote"},
            {"score", "Score"},
            {"downvote", "Downvote"},
            {"more", "More actions"},
    };
    private static final String[] CONSTRAINT_NAMES = {
            "leftToLeft", "leftToRight", "rightToLeft", "rightToRight",
            "topToTop", "topToBottom", "bottomToTop", "bottomToBottom",
    };
    /** Joey's minified ConstraintLayout.LayoutParams, same order as CONSTRAINT_NAMES. */
    private static final String[] CONSTRAINT_FIELDS = {"e", "f", "g", "h", "i", "j", "k", "l"};

    private static final Map<Object, Boolean> BINDING = new WeakHashMap<>();

    /** Post bar or post details settings, read once and dropped when any setting changes. */
    private static final class Settings {
        List<String> order;
        JSONObject place;
    }

    private static volatile Settings sBar;
    private static volatile Settings sDetails;
    private static final SharedPreferences.OnSharedPreferenceChangeListener WATCH = (prefs, key) -> {
        sBar = null;
        sDetails = null;
        sMenu = null;
    };
    private static boolean sWatched;

    private static void watch(Context context) {
        if (sWatched) return;
        sWatched = true;
        prefs(context).registerOnSharedPreferenceChangeListener(WATCH);
    }

    private static final String KEY_MIGRATED = "post_actions_migrated";

    /**
     * The old Post bar popup's Hide left save, share and hide in Joey's menu. In Post actions,
     * Hide means nowhere, so those three move to Menu once.
     */
    private static void migrate(Context context) {
        SharedPreferences prefs = prefs(context);
        if (prefs.getBoolean(KEY_MIGRATED, false)) return;
        SharedPreferences.Editor edit = prefs.edit().putBoolean(KEY_MIGRATED, true);
        String raw = prefs.getString(KEY_ACTION_PLACE, null);
        if (raw != null) {
            try {
                JSONObject place = new JSONObject(raw);
                for (String id : new String[]{"save", "share_icon", "hide_icon"}) {
                    if (place.optInt(id, SHOWN) == HIDDEN) place.put(id, OVERFLOW);
                }
                edit.putString(KEY_ACTION_PLACE, place.toString());
            } catch (Throwable ignored) {
            }
        }
        edit.commit();
    }

    private static Settings bar(Context context) {
        Settings cached = sBar;
        if (cached != null) return cached;
        migrate(context);
        watch(context);
        Settings next = new Settings();
        next.order = Collections.unmodifiableList(barOrder(context));
        next.place = places(context, KEY_ACTION_PLACE, ACTIONS);
        sBar = next;
        return next;
    }

    private static Settings details(Context context) {
        Settings cached = sDetails;
        if (cached != null) return cached;
        watch(context);
        Settings next = new Settings();
        next.order = Collections.unmodifiableList(order(context, KEY_DETAIL_ORDER, DETAILS));
        next.place = places(context, KEY_DETAIL_PLACE, DETAILS);
        sDetails = next;
        return next;
    }

    private PostLayout() {
    }

    /** Joey's factory entry. Modern UI uses one post arrangement. */
    public static Enum<?> layoutFor(ViewGroup parent, Enum<?> type) {
        if (type == null || parent == null || !ModernUi.isModernUiEnabled(parent.getContext())) return type;
        if ("COMPACT".equals(type.name())) return type;
        try {
            @SuppressWarnings({"unchecked", "rawtypes"})
            Enum<?> compact = Enum.valueOf((Class) type.getDeclaringClass(), "COMPACT");
            return compact;
        } catch (Throwable t) {
            return type;
        }
    }

    public static void prepare(View postView) {
        if (postView == null || !ModernUi.isModernUiEnabled(postView.getContext())) return;
        try {
            styleChrome(postView);
        } catch (Throwable t) {
            Log.e(TAG, "prepare", t);
        }
    }

    public static void begin(Object card) {
        if (card == null) return;
        BINDING.put(card, Boolean.TRUE);
        View item = itemOf(card);
        if (item == null) return;
        int key = id(item, "actionbar_layout");
        if (key == 0) return;
        for (String[] def : ACTIONS) {
            View view = actionView(item, def[0]);
            Object before = view == null ? null : view.getTag(key);
            if (before instanceof Integer) {
                view.setTag(key, null);
                view.setVisibility((Integer) before);
            }
        }
    }

    /** End of Joey's bind. */
    public static void apply(Object card) {
        if (card == null) return;
        BINDING.remove(card);
        run(card);
    }

    /** Joey rebuilt the info line or comment count after marking a post seen. */
    public static void refresh(Object card) {
        if (card == null || BINDING.containsKey(card)) return;
        run(card);
    }

    private static void run(Object card) {
        try {
            View item = itemOf(card);
            if (item == null || !ModernUi.isModernUiEnabled(item.getContext())) return;
            styleChrome(item);
            placeThumbnail(item);
            PostMotion.wireTaps(item);
            MediaDownload.attach(item, field(card, "b"));
            arrangeBar(item);
        } catch (Throwable t) {
            Log.e(TAG, "apply", t);
        }
    }

    public static boolean offerLayout(Activity activity) {
        return activity != null && ModernUi.isModernUiEnabled(activity);
    }

    /** Modern UI already fixes layout, thumbnail side, and corner radius. */
    public static void trimPostStyle(Activity activity) {
        if (activity == null || !ModernUi.isModernUiEnabled(activity)) return;
        hideRow(activity, "post_type_clickable");
        hideRow(activity, "thumbnail_radius_clickable");
        hideRow(activity, "thumbnail_right_clickable");
        // Post bar and Post details own these in Modern.
        hideRow(activity, "author_clickable");
        hideRow(activity, "domain_clickable");
        hideParent(activity, "save_as_action_switch", 1);
        hideParent(activity, "hide_as_action_switch", 1);
        hideParent(activity, "share_as_action_switch", 1);
        hideParent(activity, "author_flair_switch", 1);
        // Modern always gives the post on the comments screen the feed's layout.
        hideParent(activity, "comment_screen_post_layout_same_as_above", 3);
    }

    private static void hideParent(Activity activity, String name, int levels) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        if (id == 0) return;
        View view = activity.findViewById(id);
        for (int i = 0; i < levels && view != null; i++) {
            view = view.getParent() instanceof View ? (View) view.getParent() : null;
        }
        if (view != null) view.setVisibility(View.GONE);
    }

    private static void hideRow(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        if (id == 0) return;
        View row = activity.findViewById(id);
        if (row != null) row.setVisibility(View.GONE);
    }

    public static boolean offerImage(Activity activity) {
        if (activity == null || !ModernUi.isModernUiEnabled(activity)) return false;
        showImage(activity, null);
        return true;
    }

    public static String layoutBlurb() {
        String which = "CARD".equals(layoutName()) ? "Card" : "Compact";
        return which + ". Card is the roomier post, with the community on its own line. "
                + "Compact is the denser list. You can also change this from the subreddit menu "
                + "when Post layout is not hidden.";
    }

    public static String imageBlurb() {
        return imageLabel() + ". Full height, 16:9, or a thumbnail beside the title.";
    }

    public static void showLayout(Activity activity, TextView subtitle) {
        String current = layoutName();
        int selected = "CARD".equals(current) ? 0 : "COMPACT".equals(current) ? 1 : -1;
        MorpheDialog.choices(activity, "Post layout", new String[]{"Card", "Compact"}, selected, index -> {
            writeJoey("PREF_SUBMISSION_CARD_VIEW_TYPE", index == 0 ? "CARD" : "COMPACT", "jc.k$c", "a");
            if (subtitle != null) subtitle.setText(layoutBlurb());
            changed(activity);
        });
    }

    public static void showImage(Activity activity, TextView subtitle) {
        String current = imageName();
        int selected = "FULL_HEIGHT".equals(current) ? 0 : "_16_IS_TO_9".equals(current) ? 1
                : "THUMBNAIL".equals(current) ? 2 : -1;
        float density = activity.getResources().getDisplayMetrics().density;
        int accent = MorpheDialog.accent(activity);
        int sub = MorpheDialog.sub(activity);
        LinearLayout page = MorpheDialog.page(activity, "Image style", "How a post's picture sits in the feed.");
        LinearLayout cards = new LinearLayout(activity);
        cards.setOrientation(LinearLayout.HORIZONTAL);
        AlertDialog[] shown = new AlertDialog[1];
        String[] labels = {"Full height", "16:9", "Thumbnail"};
        for (int i = 0; i < 3; i++) {
            int index = i;
            LinearLayout card = new LinearLayout(activity);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setGravity(Gravity.CENTER_HORIZONTAL);
            int pad = Math.round(10 * density);
            card.setPadding(pad, pad, pad, pad);
            GradientDrawable frame = new GradientDrawable();
            frame.setCornerRadius(12 * density);
            frame.setColor(i == selected ? (accent & 0x00FFFFFF) | 0x22000000 : 0);
            frame.setStroke(Math.round((i == selected ? 2 : 1) * density), i == selected ? accent : (sub & 0x00FFFFFF) | 0x66000000);
            card.setBackground(frame);
            card.addView(imageSketch(activity, i, i == selected ? accent : sub));
            TextView label = new TextView(activity);
            label.setText(labels[i]);
            label.setTextColor(i == selected ? accent : MorpheDialog.text(activity));
            label.setTextSize(14);
            label.setGravity(Gravity.CENTER);
            label.setPadding(0, Math.round(8 * density), 0, 0);
            card.addView(label);
            card.setOnClickListener(v -> {
                String name = index == 0 ? "FULL_HEIGHT" : index == 1 ? "_16_IS_TO_9" : "THUMBNAIL";
                writeJoey("PREF_SUBMISSION_IMAGE_STYLE", name, "jc.k$b", "b");
                if (subtitle != null) subtitle.setText(imageBlurb());
                if (shown[0] != null) shown[0].dismiss();
                changed(activity);
            });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            if (i > 0) lp.leftMargin = Math.round(8 * density);
            cards.addView(card, lp);
        }
        page.addView(cards);
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        page.addView(MorpheDialog.actions(activity, cancel));
        shown[0] = MorpheDialog.show(activity, page, 520);
    }

    /** A small drawing of a post: title lines, and the picture where that style puts it. */
    private static View imageSketch(Activity activity, int style, int color) {
        float density = activity.getResources().getDisplayMetrics().density;
        int line = (color & 0x00FFFFFF) | 0x88000000;
        LinearLayout sketch = new LinearLayout(activity);
        sketch.setOrientation(style == 2 ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);
        int width = Math.round(84 * density);
        LinearLayout title = new LinearLayout(activity);
        title.setOrientation(LinearLayout.VERTICAL);
        for (int i = 0; i < 2; i++) {
            View bar = new View(activity);
            GradientDrawable shape = new GradientDrawable();
            shape.setCornerRadius(2 * density);
            shape.setColor(line);
            bar.setBackground(shape);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    i == 0 ? ViewGroup.LayoutParams.MATCH_PARENT : Math.round(40 * density), Math.round(5 * density));
            lp.bottomMargin = Math.round(4 * density);
            title.addView(bar, lp);
        }
        View picture = new View(activity);
        GradientDrawable fill = new GradientDrawable();
        fill.setCornerRadius(4 * density);
        fill.setColor(color);
        picture.setBackground(fill);
        if (style == 2) {
            sketch.setGravity(Gravity.CENTER_VERTICAL);
            sketch.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(Math.round(26 * density), Math.round(26 * density));
            lp.leftMargin = Math.round(6 * density);
            sketch.addView(picture, lp);
        } else {
            sketch.addView(title, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            int height = style == 0 ? Math.round(64 * density) : Math.round(width * 9f / 16f);
            sketch.addView(picture, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        }
        LinearLayout box = new LinearLayout(activity);
        box.setGravity(Gravity.CENTER);
        box.setMinimumHeight(Math.round(86 * density));
        box.addView(sketch, new LinearLayout.LayoutParams(width, ViewGroup.LayoutParams.WRAP_CONTENT));
        return box;
    }

    public static void showDetails(Activity activity) {
        showPlaces(activity, "Post details",
                "Drag the handle to change the order. Hide takes a detail off the line.",
                DETAILS, false, false, KEY_DETAIL_ORDER, KEY_DETAIL_PLACE, PostLayout::drawDetails);
    }


    private static void changed(Activity activity) {
        refreshFeed(activity);
        if (activity.getClass().getName().endsWith("PostStyleSettings")) activity.recreate();
    }

    private static boolean leftIcon(String id) {
        return "save".equals(id) || "download".equals(id);
    }

    /** The star and download stay left of the gap, in the saved order. */
    private static void sides(List<String> order, JSONObject place, List<String> left, List<String> right) {
        for (String id : order) {
            if ("more".equals(id)) continue;
            if (place != null && modeOf(place, id) != SHOWN) continue;
            (leftIcon(id) ? left : right).add(id);
        }
    }

    /** Left icons as one block, then everything else. Download starts just after the star. */
    private static List<String> barOrder(Context context) {
        List<String> raw = order(context, KEY_ACTION_ORDER, ACTIONS);
        List<String> left = new ArrayList<>();
        List<String> right = new ArrayList<>();
        for (String id : raw) {
            if (leftIcon(id)) left.add(id);
            else right.add(id);
        }
        if (!left.contains("download")) {
            int save = left.indexOf("save");
            left.add(save < 0 ? left.size() : save + 1, "download");
        }
        List<String> merged = new ArrayList<>();
        merged.addAll(left);
        merged.addAll(right);
        flankScore(merged);
        return merged;
    }

    /** Upvote sits just before the score, and downvote just after it. */
    private static void flankScore(List<String> order) {
        order.remove("upvote");
        order.remove("downvote");
        int score = order.indexOf("score");
        if (score < 0) {
            order.add("upvote");
            order.add("downvote");
            return;
        }
        order.add(score, "upvote");
        order.add(order.indexOf("score") + 1, "downvote");
    }

    /**
     * Shows, hides and orders every bar item in one pass. In Modern, Joey sets up every
     * item, so each one has its tap action, and this decides which stay on the bar.
     * Save and download sit left of the gap. The votes sit either side of the score.
     */
    private static void arrangeBar(View item) {
        View barView = find(item, "actionbar_layout");
        if (!(barView instanceof ViewGroup)) return;
        ViewGroup bar = (ViewGroup) barView;
        View gap = spacer(bar);
        if (gap == null) return;
        int key = id(item, "actionbar_layout");
        if (key == 0) return;
        Settings settings = bar(item.getContext());
        JSONObject place = settings.place;
        boolean menu = false;
        List<View> left = new ArrayList<>();
        List<View> right = new ArrayList<>();
        for (String id : settings.order) {
            if ("more".equals(id)) continue;
            View view = actionView(item, id);
            if (view == null || view.getParent() != bar || left.contains(view) || right.contains(view)) continue;
            int mode = modeOf(place, id);
            if (mode == OVERFLOW && joeyShows(view, key)) menu = true;
            setShown(view, key, mode == SHOWN);
            (leftIcon(id) ? left : right).add(view);
        }
        View more = actionView(item, "more");
        boolean hasMore = more != null && more.getParent() == bar;
        if (hasMore) setShown(more, key, menu || modeOf(place, "more") != HIDDEN);
        List<View> wanted = new ArrayList<>();
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child != gap && child != more && !left.contains(child) && !right.contains(child)) wanted.add(child);
        }
        wanted.addAll(left);
        wanted.add(gap);
        wanted.addAll(right);
        if (hasMore) wanted.add(more);
        if (wanted.size() != bar.getChildCount()) return;
        boolean same = true;
        for (int i = 0; i < wanted.size(); i++) {
            if (bar.getChildAt(i) != wanted.get(i)) {
                same = false;
                break;
            }
        }
        // Moving a view lays the bar out again, so the bar is only rebuilt when the order is off.
        if (same) return;
        for (View view : wanted) bar.removeView(view);
        for (View view : wanted) bar.addView(view);
    }

    /** Hides an item and keeps the visibility Joey gave it, or gives that visibility back. */
    private static void setShown(View view, int key, boolean show) {
        Object kept = view.getTag(key);
        if (show) {
            if (kept instanceof Integer) {
                view.setTag(key, null);
                if (view.getVisibility() != (Integer) kept) view.setVisibility((Integer) kept);
            }
            return;
        }
        if (!(kept instanceof Integer)) view.setTag(key, view.getVisibility());
        if (view.getVisibility() != View.GONE) view.setVisibility(View.GONE);
    }

    /** Whether Joey shows this item for this post. The link button is only on link posts, for example. */
    private static boolean joeyShows(View view, int key) {
        Object kept = view.getTag(key);
        int visibility = kept instanceof Integer ? (Integer) kept : view.getVisibility();
        return visibility == View.VISIBLE;
    }

    private static View spacer(ViewGroup bar) {
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if ("morphe_spacer".equals(child.getTag())) return child;
        }
        for (int i = 0; i < bar.getChildCount(); i++) {
            View child = bar.getChildAt(i);
            if (child.getId() != View.NO_ID) continue;
            ViewGroup.LayoutParams lp = child.getLayoutParams();
            if (!(lp instanceof LinearLayout.LayoutParams)) continue;
            if (((LinearLayout.LayoutParams) lp).weight <= 0f) continue;
            child.setTag("morphe_spacer");
            return child;
        }
        return null;
    }

    private static boolean customized(Context context, String orderKey, String placeKey) {
        SharedPreferences prefs = prefs(context);
        return prefs.contains(orderKey) || prefs.contains(placeKey);
    }

    /** What Joey itself shows, so an untouched dialog matches the posts. */
    private static JSONObject joeyDefaults(String[][] items) {
        JSONObject place = new JSONObject();
        for (String[] def : items) put(place, def[0], SHOWN);
        if (items == ACTIONS) {
            // Joey keeps save, share and hide in its menu when they are not on the bar.
            if (!joeyFlag("za.a", "e")) put(place, "save", OVERFLOW);
            if (!joeyShareAction()) put(place, "share_icon", OVERFLOW);
            if (!joeyFlag("za.a", "a0")) put(place, "hide_icon", OVERFLOW);
            // Joey's "compact thumbnail action bar" keeps the bar short and the comment count on
            // the info line. Someone who had it on starts with that look.
            if (joeyOption("g")) {
                put(place, "link_icon", HIDDEN);
                put(place, "preview_icon", HIDDEN);
                put(place, "commentsTextView", HIDDEN);
            }
        } else {
            put(place, "score", HIDDEN);
            if (!joeyOption("g")) put(place, "comments", HIDDEN);
            if (!joeyFlag("za.a", "f")) put(place, "author", HIDDEN);
            if (!joeyFlag("za.a", "g")) put(place, "domain", HIDDEN);
            if (!joeyOption("D0")) put(place, "flair", HIDDEN);
        }
        return place;
    }

    private static boolean joeyFlag(String type, String field) {
        try {
            return Class.forName(type).getField(field).getBoolean(null);
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean joeyOption(String method) {
        try {
            Object options = Class.forName("mb.o").getMethod("i").invoke(null);
            Object value = options.getClass().getMethod(method).invoke(options);
            return value instanceof Boolean && (Boolean) value;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean joeyShareAction() {
        try {
            Object options = Class.forName("mb.o").getMethod("i").invoke(null);
            SharedPreferences prefs = (SharedPreferences) field(options, "a");
            return prefs != null && prefs.getBoolean("PREF_SHOW_SHARE_AS_ACTION", false);
        } catch (Throwable t) {
            return false;
        }
    }

    private static void styleChrome(View item) {
        Context context = item.getContext();
        ModernUi.Palette palette = ModernUi.getPalette(context);
        View template = find(item, "constraintLayout_submission_template");
        View card = findCard(item);

        if (card != null) {
            invoke(card, "setUseCompatPadding", false);
            invoke(card, "setRadius", 0f);
            invoke(card, "setCardElevation", 0f);
            invoke(card, "setMaxCardElevation", 0f);
            invoke(card, "setCardBackgroundColor", palette.canvas);
            ViewGroup.LayoutParams lp = card.getLayoutParams();
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                if (mlp.leftMargin != 0 || mlp.rightMargin != 0 || mlp.topMargin != 0 || mlp.bottomMargin != 0) {
                    mlp.leftMargin = 0;
                    mlp.rightMargin = 0;
                    mlp.topMargin = 0;
                    mlp.bottomMargin = 0;
                    card.setLayoutParams(mlp);
                }
            }
        }
        if (template != null) {
            paintBackground(template, palette.canvas);
            ViewGroup.LayoutParams lp = template.getLayoutParams();
            if (lp instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
                if (mlp.leftMargin != 0 || mlp.rightMargin != 0 || mlp.topMargin != 0 || mlp.bottomMargin != 0) {
                    mlp.leftMargin = 0;
                    mlp.rightMargin = 0;
                    mlp.topMargin = 0;
                    mlp.bottomMargin = 0;
                    template.setLayoutParams(mlp);
                }
            }
        }
        drawRule(item, palette.outline);
        plate(item, palette.containerHigh);
    }

    /** A one-pixel line in the theme outline, under each post. */
    private static void drawRule(View item, int color) {
        View frame = find(item, "revealFrameLayout");
        if (!(frame instanceof ViewGroup)) frame = item;
        if (!(frame instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) frame;
        View rule = null;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            String type = child.getClass().getName();
            if ("morphe_post_rule".equals(child.getTag()) || type.endsWith("CView")) {
                rule = child;
                break;
            }
        }
        if (rule == null) {
            rule = new View(item.getContext());
            rule.setTag("morphe_post_rule");
            group.addView(rule, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 1, Gravity.BOTTOM));
        }
        if (rule.getVisibility() != View.VISIBLE) rule.setVisibility(View.VISIBLE);
        if (rule.getAlpha() != 1f) rule.setAlpha(1f);
        paintBackground(rule, color);
        ViewGroup.LayoutParams lp = rule.getLayoutParams();
        if (lp != null && lp.height != 1) {
            lp.height = 1;
            rule.setLayoutParams(lp);
        }
    }

    /** The picture is the only raised surface. Full-height, 16:9 and thumbnail all use these views. */
    private static void plate(View item, int color) {
        View thumb = find(item, "thumbnail");
        if (thumb != null && thumb.getVisibility() == View.VISIBLE) paintBackground(thumb, color);
        View preview = find(item, "previewImage");
        if (preview != null && preview.getVisibility() == View.VISIBLE) paintBackground(preview, color);
    }

    /** setBackgroundColor makes a new drawable and redraws every time, even for the same colour. */
    private static void paintBackground(View view, int color) {
        Drawable background = view.getBackground();
        if (background instanceof android.graphics.drawable.ColorDrawable
                && ((android.graphics.drawable.ColorDrawable) background).getColor() == color) return;
        view.setBackgroundColor(color);
    }

    /**
     * Joey pads its thumbnail inside the slot and centres it on the whole row.
     * Here the padding becomes picture, it sits level with the title, and the
     * action bar runs the full width underneath.
     */
    private static void placeThumbnail(View item) {
        View thumb = find(item, "thumbnail");
        View title = find(item, "titleTextView");
        View bar = find(item, "actionbar_layout");
        if (!"THUMBNAIL".equals(imageName()) || thumb == null || title == null
                || thumb.getVisibility() == View.GONE) {
            // A recycled row that had a thumbnail keeps the moved constraints. Put Joey's back.
            unseat(item, bar);
            return;
        }
        float density = item.getResources().getDisplayMetrics().density;
        boolean roomy = findCard(item) != null;
        int sizeKey = id(item, "thumbnail");
        ViewGroup.LayoutParams lp = thumb.getLayoutParams();
        Object stored = sizeKey == 0 ? null : thumb.getTag(sizeKey);
        int size;
        if (stored instanceof Integer) {
            size = (Integer) stored;
        } else {
            size = Math.max(Math.max(lp.width, lp.height), Math.round((roomy ? 88 : 72) * density));
            if (sizeKey != 0) thumb.setTag(sizeKey, size);
        }
        thumb.setPadding(0, 0, 0, 0);
        // Joey's bind does not reset these, so on a recycled row they are usually already set.
        // setLayoutParams lays the row out again, so it only runs when a value changed.
        boolean changed = false;
        if (lp.width != size || lp.height != size) {
            lp.width = size;
            lp.height = size;
            changed = true;
        }
        changed |= setConstraint(lp, "topToTop", title.getId());
        changed |= setConstraint(lp, "topToBottom", -1);
        changed |= setConstraint(lp, "bottomToBottom", -1);
        changed |= setConstraint(lp, "bottomToTop", -1);
        changed |= setConstraint(lp, "rightToRight", 0);
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
            int right = Math.round((roomy ? 12 : 10) * density);
            int top = title.getLayoutParams() instanceof ViewGroup.MarginLayoutParams
                    ? ((ViewGroup.MarginLayoutParams) title.getLayoutParams()).topMargin + Math.round(2 * density) : 0;
            if (mlp.rightMargin != right || mlp.topMargin != top || mlp.bottomMargin != 0) {
                mlp.rightMargin = right;
                mlp.topMargin = top;
                mlp.bottomMargin = 0;
                changed = true;
            }
        }
        if (changed) thumb.setLayoutParams(lp);
        roundThumbnail(thumb, 10f * density);
        seatBody(item, thumb);
        if (bar == null) return;
        ViewGroup.LayoutParams barLp = bar.getLayoutParams();
        remember(bar, BAR_FIELDS);
        boolean barChanged = setConstraint(barLp, "rightToLeft", -1);
        barChanged |= setConstraint(barLp, "rightToRight", 0);
        if (barChanged) bar.setLayoutParams(barLp);
        int baseKey = id(item, "filler_view");
        if (baseKey == 0 || !(barLp instanceof ViewGroup.MarginLayoutParams)) return;
        if (!(bar.getTag(baseKey) instanceof Integer)) {
            bar.setTag(baseKey, ((ViewGroup.MarginLayoutParams) barLp).topMargin);
            int gap = Math.round(4 * density);
            bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> clearThumbnail(bar, thumb, baseKey, gap));
        }
    }

    private static Method sCornerRadius;
    private static Method sGetCornerRadius;
    private static Class<?> sCornerClass;

    /** Joey's RoundedImageView rebuilds its drawable on every setCornerRadius, so only set it once. */
    private static void roundThumbnail(View thumb, float radius) {
        try {
            if (sCornerClass != thumb.getClass()) {
                sCornerClass = thumb.getClass();
                sCornerRadius = sCornerClass.getMethod("setCornerRadius", float.class);
                try {
                    sGetCornerRadius = sCornerClass.getMethod("getCornerRadius");
                } catch (Throwable ignored) {
                    sGetCornerRadius = null;
                }
            }
            if (sGetCornerRadius != null) {
                Object now = sGetCornerRadius.invoke(thumb);
                if (now instanceof Float && (Float) now == radius) return;
            }
            sCornerRadius.invoke(thumb, radius);
        } catch (Throwable ignored) {
        }
    }

    private static final int BODY_SEATED = 0x4d4f0007;
    private static final int ORIGINAL = 0x4d4f0042;
    private static final String[] BODY_FIELDS = {
            "topToTop", "topToBottom", "leftToRight", "leftToLeft", "rightToLeft", "rightToRight",
    };
    private static final String[] FILLER_FIELDS = {"bottomToTop"};
    private static final String[] BAR_FIELDS = {"rightToLeft", "rightToRight"};

    /**
     * A visible written body is full width and starts under the square.
     * The title and the info line stay beside it. A row with no body is unchanged.
     */
    private static void seatBody(View item, View thumb) {
        View body = find(item, "htmlDisplay_submission_card");
        if (body == null) return;
        if (body.getVisibility() != View.VISIBLE) {
            restore(body, BODY_FIELDS);
            restore(find(item, "filler_view"), FILLER_FIELDS);
            return;
        }
        ViewGroup.LayoutParams lp = body.getLayoutParams();
        remember(body, BODY_FIELDS);
        boolean changed = setConstraint(lp, "topToTop", -1);
        changed |= setConstraint(lp, "topToBottom", thumb.getId());
        changed |= setConstraint(lp, "leftToRight", -1);
        changed |= setConstraint(lp, "leftToLeft", 0);
        changed |= setConstraint(lp, "rightToLeft", -1);
        changed |= setConstraint(lp, "rightToRight", 0);
        if (body.getTag(BODY_SEATED) == null && lp instanceof ViewGroup.MarginLayoutParams
                && ((ViewGroup.MarginLayoutParams) lp).topMargin != 0) {
            // First seat only. After that clearBody owns this margin.
            ((ViewGroup.MarginLayoutParams) lp).topMargin = 0;
            changed = true;
        }
        if (changed) body.setLayoutParams(lp);
        View filler = find(item, "filler_view");
        if (filler != null) {
            ViewGroup.LayoutParams fillerLp = filler.getLayoutParams();
            remember(filler, FILLER_FIELDS);
            if (setConstraint(fillerLp, "bottomToTop", -1)) filler.setLayoutParams(fillerLp);
        }
        if (body.getTag(BODY_SEATED) == null) {
            body.setTag(BODY_SEATED, Boolean.TRUE);
            View.OnLayoutChangeListener clear = (v, l, t, r, b, ol, ot, orr, ob) -> clearBody(body, thumb, item);
            body.addOnLayoutChangeListener(clear);
            // The margin depends on where the info line ends, which can move while the body stays put.
            View info = find(item, "submissionInfo");
            View spoken = find(item, "submission_tts");
            if (info != null) info.addOnLayoutChangeListener(clear);
            if (spoken != null) spoken.addOnLayoutChangeListener(clear);
        }
    }

    /** Puts Joey's own constraints back on a row that no longer shows a thumbnail. */
    private static void unseat(View item, View bar) {
        restore(find(item, "htmlDisplay_submission_card"), BODY_FIELDS);
        restore(find(item, "filler_view"), FILLER_FIELDS);
        restore(bar, BAR_FIELDS);
    }

    /** Keeps Joey's values the first time a view is moved: the listed constraints, then the top margin. */
    private static void remember(View view, String[] fields) {
        if (view == null || view.getTag(ORIGINAL) != null) return;
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp == null) return;
        int[] values = new int[fields.length + 1];
        for (int i = 0; i < fields.length; i++) values[i] = getConstraint(lp, fields[i]);
        values[fields.length] = lp instanceof ViewGroup.MarginLayoutParams
                ? ((ViewGroup.MarginLayoutParams) lp).topMargin : 0;
        view.setTag(ORIGINAL, values);
    }

    private static void restore(View view, String[] fields) {
        if (view == null) return;
        Object saved = view.getTag(ORIGINAL);
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (!(saved instanceof int[]) || lp == null) return;
        int[] values = (int[]) saved;
        if (values.length != fields.length + 1) return;
        boolean changed = false;
        for (int i = 0; i < fields.length; i++) changed |= setConstraint(lp, fields[i], values[i]);
        if (lp instanceof ViewGroup.MarginLayoutParams
                && ((ViewGroup.MarginLayoutParams) lp).topMargin != values[fields.length]) {
            ((ViewGroup.MarginLayoutParams) lp).topMargin = values[fields.length];
            changed = true;
        }
        if (changed) view.setLayoutParams(lp);
    }

    /** Keep the body under the info line when that line is taller than the square. */
    private static void clearBody(View body, View thumb, View item) {
        if (body.getVisibility() != View.VISIBLE || thumb.getVisibility() == View.GONE) return;
        if (getConstraint(body.getLayoutParams(), "topToBottom") != thumb.getId()) return;
        ViewGroup.LayoutParams lp = body.getLayoutParams();
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
        int textBottom = 0;
        View info = find(item, "submissionInfo");
        View spoken = find(item, "submission_tts");
        if (info != null && info.getVisibility() != View.GONE) textBottom = info.getBottom();
        if (spoken != null && spoken.getVisibility() != View.GONE) {
            textBottom = Math.max(textBottom, spoken.getBottom());
        }
        int need = Math.max(0, textBottom - thumb.getBottom());
        if (mlp.topMargin == need) return;
        mlp.topMargin = need;
        body.post(() -> body.setLayoutParams(mlp));
    }

    /** The full-width action row starts below the thumbnail when the text is shorter than it. */
    private static void clearThumbnail(View bar, View thumb, int baseKey, int gap) {
        Object stored = bar.getTag(baseKey);
        if (!(stored instanceof Integer)) return;
        ViewGroup.LayoutParams lp = bar.getLayoutParams();
        if (!(lp instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
        int base = (Integer) stored;
        int extra = mlp.topMargin - base;
        int need = 0;
        View body = thumb.getParent() instanceof View
                ? find((View) thumb.getParent(), "htmlDisplay_submission_card") : null;
        boolean written = body != null && body.getVisibility() == View.VISIBLE;
        if (!written && thumb.getVisibility() != View.GONE && "THUMBNAIL".equals(imageName())) {
            need = Math.max(0, thumb.getBottom() + gap - (bar.getTop() - extra));
        }
        if (need == extra) return;
        mlp.topMargin = base + need;
        bar.post(() -> bar.setLayoutParams(mlp));
    }

    private static View actionView(View item, String id) {
        if ("download".equals(id)) return MediaDownload.button(item);
        if ("more".equals(id)) return find(item, "overflow_menu");
        return find(item, id);
    }

    private static String compact(int n) {
        int value = Math.abs(n);
        String sign = n < 0 ? "-" : "";
        if (value < 1000) return sign + value;
        if (value < 10000) return sign + (value / 1000) + "." + ((value % 1000) / 100) + "k";
        if (value < 1000000) return sign + (value / 1000) + "k";
        return sign + (value / 1000000) + "." + ((value % 1000000) / 100000) + "m";
    }

    // ---- Joey's own switches, as Modern sees them ----

    private static boolean modern() {
        Context context = ModernUi.getContext();
        return context != null && ModernUi.isModernUiEnabled(context);
    }

    /** Joey asks whether to set up save, share or hide on the bar. Modern sets each one up and places it itself. */
    public static boolean joeyBar(boolean joey) {
        return joey || modern();
    }

    /**
     * Joey asks whether to put the author, the domain or the post flair on the info line, or
     * whether the post on the comments screen uses the feed's layout. Modern always says yes.
     */
    public static boolean joeyLine(boolean joey) {
        return joey || modern();
    }

    /**
     * Joey's "compact thumbnail action bar" setting trims the bar: no link, and the comment
     * count moves to the info line. In Modern the Post bar and Post details decide instead.
     */
    public static boolean joeyMinimalBar(boolean joey) {
        return joey && !modern();
    }

    /** Joey asks whether to put the comment count on the info line. */
    public static boolean joeyComments(boolean joey) {
        Context context = ModernUi.getContext();
        if (context == null || !ModernUi.isModernUiEnabled(context)) return joey;
        return modeOf(details(context).place, "comments") == SHOWN;
    }

    /** Joey's menu asks whether save is on the bar. A saved post moved to Menu gets Joey's own row. */
    public static boolean onBarSave(boolean joey) {
        return onBar("save", joey, true);
    }

    public static boolean onBarShare(boolean joey) {
        return onBar("share_icon", joey, true);
    }

    /** Joey only offers hide on the bar for some lists. Where it cannot be on the bar, it stays in the menu. */
    public static boolean onBarHide(boolean joey) {
        return onBar("hide_icon", joey, joey);
    }

    private static boolean onBar(String id, boolean joey, boolean possible) {
        Context context = ModernUi.getContext();
        if (context == null || !ModernUi.isModernUiEnabled(context)) return joey;
        if (!possible) return false;
        // Hidden is in neither place, so the menu treats it as on the bar.
        return modeOf(bar(context).place, id) != OVERFLOW;
    }

    // ---- Post details ----

    /** Where each piece of Joey's info line starts, for the line being built on this thread. */
    private static final ThreadLocal<Object[]> LINE = new ThreadLocal<>();

    private static void mark(SpannableStringBuilder line, String key) {
        if (line == null || !modern()) return;
        Object[] state = LINE.get();
        if (state == null || state[0] != line) {
            state = new Object[]{line, new ArrayList<Object[]>()};
            LINE.set(state);
        }
        @SuppressWarnings("unchecked")
        List<Object[]> marks = (List<Object[]>) state[1];
        int at = line.length();
        if (!marks.isEmpty() && (Integer) marks.get(marks.size() - 1)[1] == at) marks.remove(marks.size() - 1);
        marks.add(new Object[]{key, at});
    }

    public static void markSubreddit(SpannableStringBuilder line) {
        mark(line, "subreddit");
    }

    public static void markComments(SpannableStringBuilder line) {
        mark(line, "comments");
    }

    public static void markTime(SpannableStringBuilder line) {
        mark(line, "time");
    }

    public static void markAuthor(SpannableStringBuilder line) {
        mark(line, "author");
    }

    public static void markFlair(SpannableStringBuilder line) {
        mark(line, "flair");
    }

    public static void markViews(SpannableStringBuilder line) {
        mark(line, "+views");
    }

    public static void markType(SpannableStringBuilder line) {
        mark(line, "+type");
    }

    public static void markPercent(SpannableStringBuilder line) {
        mark(line, "percent");
    }

    public static void markDomain(SpannableStringBuilder line) {
        mark(line, "domain");
    }

    public static void markOther(SpannableStringBuilder line) {
        mark(line, "+other");
    }

    /**
     * Joey has built the info line and added it to the end of [all]. Modern puts the pieces in
     * the user's order and drops the hidden ones. Each piece keeps Joey's icons, colours and
     * tap targets. Pieces the dialog does not list (view count, post type, awards) stay at the end.
     */
    public static void details(SpannableStringBuilder all, SpannableStringBuilder line, Object submission) {
        Object[] state = LINE.get();
        LINE.remove();
        if (all == null || line == null || state == null || state[0] != line) return;
        Context context = ModernUi.getContext();
        if (context == null || !ModernUi.isModernUiEnabled(context)) return;
        try {
            @SuppressWarnings("unchecked")
            List<Object[]> marks = (List<Object[]>) state[1];
            if (marks.isEmpty()) return;
            Settings settings = details(context);
            Map<String, CharSequence[]> pieces = new HashMap<>();
            List<String> extras = new ArrayList<>();
            CharSequence carry = "";
            for (int i = 0; i < marks.size(); i++) {
                String key = (String) marks.get(i)[0];
                int from = (Integer) marks.get(i)[1];
                int to = i + 1 < marks.size() ? (Integer) marks.get(i + 1)[1] : line.length();
                if (from < 0 || to > line.length() || to <= from) continue;
                CharSequence piece = line.subSequence(from, to);
                int lead = separatorStart(piece);
                int tail = separatorEnd(piece, lead);
                CharSequence sep = lead > 0 ? piece.subSequence(0, lead) : carry;
                carry = tail < piece.length() ? piece.subSequence(tail, piece.length()) : "";
                if (tail <= lead) continue;
                CharSequence body = piece.subSequence(lead, tail);
                if (key.startsWith("+")) {
                    key = key + i;
                    extras.add(key);
                }
                pieces.put(key, new CharSequence[]{sep, body});
            }
            SpannableStringBuilder out = new SpannableStringBuilder();
            for (String key : settings.order) {
                if (modeOf(settings.place, key) != SHOWN) continue;
                CharSequence[] piece = pieces.get(key);
                if (piece == null && "score".equals(key)) piece = scorePiece(submission);
                join(out, piece);
            }
            for (String key : extras) join(out, pieces.get(key));
            int start = all.length() - line.length();
            if (start < 0) return;
            all.replace(start, all.length(), out);
        } catch (Throwable t) {
            Log.e(TAG, "details", t);
        }
    }

    private static void join(SpannableStringBuilder out, CharSequence[] piece) {
        if (piece == null || piece[1].length() == 0) return;
        if (out.length() > 0) {
            CharSequence sep = piece[0];
            boolean plain = sep.toString().replace('\u00a0', ' ').trim().isEmpty();
            out.append(plain && sep.length() < 3 ? "   " : sep);
        }
        out.append(piece[1]);
    }

    /** Joey does not put the score on the info line, so it is written out here. */
    private static CharSequence[] scorePiece(Object submission) {
        Object node = submission == null ? null : call(submission, "n");
        if (node == null || json(node, "score") == null) return null;
        int score = jsonInt(node, "score");
        String text = joeyFlag("za.a", "j") ? compact(score) : String.valueOf(score);
        return new CharSequence[]{"   ", text + (Math.abs(score) == 1 ? " point" : " points")};
    }

    private static volatile String[] sSeparators;

    /** Joey's separators between info-line pieces, as the two layouts set them. */
    private static String[] separators() {
        String[] cached = sSeparators;
        if (cached != null) return cached;
        List<String> found = new ArrayList<>();
        for (String name : new String[]{"F", "w"}) {
            try {
                Method method = Class.forName("zd.n").getDeclaredMethod(name);
                method.setAccessible(true);
                Object value = method.invoke(null);
                String mark = value instanceof String ? ((String) value).replace('\u00a0', ' ').trim() : "";
                // The full separator for the preview, and its bare mark, so spaces either side are trimmed.
                if (!mark.isEmpty()) {
                    found.add((String) value);
                    if (!found.contains(mark)) found.add(mark);
                }
            } catch (Throwable ignored) {
            }
        }
        cached = found.toArray(new String[0]);
        sSeparators = cached;
        return cached;
    }

    private static boolean gapChar(char c) {
        return c == ' ' || c == '\u00a0';
    }

    /** Length of the separator a piece starts with: spaces and Joey's separator mark. */
    private static int separatorStart(CharSequence piece) {
        String text = piece.toString();
        int at = 0;
        boolean moved = true;
        while (moved && at < text.length()) {
            moved = false;
            if (gapChar(text.charAt(at))) {
                at++;
                moved = true;
                continue;
            }
            for (String sep : separators()) {
                if (text.startsWith(sep, at)) {
                    at += sep.length();
                    moved = true;
                    break;
                }
            }
        }
        return at;
    }

    /** Where a piece's text ends, before any separator Joey added for the next piece. */
    private static int separatorEnd(CharSequence piece, int from) {
        String text = piece.toString();
        int end = text.length();
        boolean moved = true;
        while (moved && end > from) {
            moved = false;
            if (gapChar(text.charAt(end - 1))) {
                end--;
                moved = true;
                continue;
            }
            for (String sep : separators()) {
                if (end - sep.length() >= from && text.startsWith(sep, end - sep.length())) {
                    end -= sep.length();
                    moved = true;
                    break;
                }
            }
        }
        return end;
    }

    // ---- Joey's menu ----

    /** Joey keeps these in its own menu when they are not on the bar. */
    private static boolean joeyMenuItem(String id) {
        return "save".equals(id) || "share_icon".equals(id) || "hide_icon".equals(id);
    }

    private static volatile Method sSheetColumns;
    private static volatile Method sSheetRow;
    private static volatile Method sSheetCell;

    // ---- Joey's ⋮ menu ----

    private static final String KEY_MENU_ORDER = "post_menu_order_v1";
    private static final String KEY_MENU_HIDDEN = "post_menu_hidden_v1";
    private static final String KEY_MENU_COLUMNS = "post_menu_columns";
    private static final String KEY_MENU_EXPAND = "post_menu_expand";
    private static final String KEY_MENU_ROWS = "post_menu_rows";
    private static final int MAX_MENU_ROWS = 12;

    /**
     * Joey's own menu rows in Joey's order, keyed by the jc.i method that adds each one.
     * Save, hide and share are the bar items of the same name. jc.i.H, the column switch,
     * is not listed: Post actions owns the column count in Modern, so that row is dropped.
     */
    private static final String[][] MENU = {
            {"m:A", "Inbox replies"},
            {"m:v", "Edit post"},
            {"m:u", "Delete"},
            {"m:B", "Save this theme"},
            {"m:D", "QA view"},
            {"hide_icon", "Hide"},
            {"m:y", "Hide this and previous posts"},
            {"m:K", "Unhide"},
            {"m:L", "Author's profile"},
            {"m:x", "Subreddit"},
            {"m:s", "Reading list"},
            {"m:I", "Track new comments"},
            {"save", "Save"},
            {"m:t", "Copy"},
            {"share_icon", "Share"},
            {"m:C", "Open externally"},
            {"m:w", "Filter"},
            {"m:E", "Report"},
            {"m:J", "Translate"},
            {"m:r", "Award details"},
    };

    private static String menuKey(String method) {
        if ("z".equals(method)) return "hide_icon";
        if ("F".equals(method)) return "save";
        if ("G".equals(method)) return "share_icon";
        return "m:" + method;
    }

    private static boolean joeyOnly(String id) {
        return id.startsWith("m:");
    }

    private static boolean canBar(String id) {
        return findDef(ACTIONS, id) != null;
    }

    private static boolean canMenu(String id) {
        if (joeyOnly(id)) return findDef(MENU, id) != null;
        return canBar(id) && !"more".equals(id) && !"score".equals(id);
    }

    private static String labelAny(String id) {
        String[] def = joeyOnly(id) ? findDef(MENU, id) : findDef(ACTIONS, id);
        return def == null ? id : def[1];
    }

    /** The menu settings, read once and dropped when any setting changes. */
    private static final class MenuSettings {
        List<String> order;
        Set<String> hidden;
        int columns;
        boolean expand;
        int rows;
    }

    private static volatile MenuSettings sMenu;

    private static MenuSettings menu(Context context) {
        MenuSettings cached = sMenu;
        if (cached != null) return cached;
        watch(context);
        MenuSettings next = readMenu(context);
        sMenu = next;
        return next;
    }

    private static MenuSettings readMenu(Context context) {
        SharedPreferences prefs = prefs(context);
        MenuSettings next = new MenuSettings();
        List<String> order = new ArrayList<>();
        try {
            JSONArray arr = new JSONArray(prefs.getString(KEY_MENU_ORDER, "[]"));
            for (int i = 0; i < arr.length(); i++) {
                String id = arr.optString(i, "");
                if (canMenu(id) && !order.contains(id)) order.add(id);
            }
        } catch (Throwable ignored) {
        }
        for (String[] def : MENU) {
            if (!order.contains(def[0])) order.add(def[0]);
        }
        for (String[] def : ACTIONS) {
            if (canMenu(def[0]) && !order.contains(def[0])) order.add(def[0]);
        }
        Set<String> hidden = new HashSet<>();
        try {
            JSONArray arr = new JSONArray(prefs.getString(KEY_MENU_HIDDEN, "[]"));
            for (int i = 0; i < arr.length(); i++) hidden.add(arr.optString(i, ""));
        } catch (Throwable ignored) {
        }
        next.order = Collections.unmodifiableList(order);
        next.hidden = Collections.unmodifiableSet(hidden);
        next.columns = prefs.getInt(KEY_MENU_COLUMNS, 0);
        next.expand = prefs.getBoolean(KEY_MENU_EXPAND, false);
        next.rows = Math.max(0, Math.min(MAX_MENU_ROWS, prefs.getInt(KEY_MENU_ROWS, 0)));
        return next;
    }

    /** Joey's column switch: true is one column. Modern uses the Post actions setting once it is set. */
    public static boolean joeyOneColumn(boolean joey) {
        Context context = ModernUi.getContext();
        if (context == null || !ModernUi.isModernUiEnabled(context)) return joey;
        int columns = menu(context).columns;
        return columns == 0 ? joey : columns == 1;
    }

    private static boolean joeyOneColumnSaved() {
        try {
            Object options = Class.forName("mb.o").getMethod("i").invoke(null);
            Object value = options.getClass().getMethod("B0").invoke(options);
            return value instanceof Boolean && (Boolean) value;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Which of Joey's menu methods is filling the row now, and how many cells the row had. */
    private static Object sBuildRow;
    private static int sBuildCount;
    private static String sBuildKey;

    private static int menuTag(View view) {
        return id(view, "bottom_sheet_container_table_layout");
    }

    /** Joey is about to add one menu item to [row]. */
    public static void menuBefore(Object row, String method) {
        if (!(row instanceof ViewGroup)) {
            sBuildRow = null;
            return;
        }
        sBuildRow = row;
        sBuildCount = ((ViewGroup) row).getChildCount();
        sBuildKey = menuKey(method);
    }

    /** Tags the cells Joey just added, so they can be ordered and hidden by name. */
    public static void menuAfter(Object row) {
        if (row == null || row != sBuildRow) return;
        sBuildRow = null;
        ViewGroup group = (ViewGroup) row;
        int tag = menuTag(group);
        if (tag == 0) return;
        for (int i = sBuildCount; i < group.getChildCount(); i++) group.getChildAt(i).setTag(tag, sBuildKey);
    }

    private static void sheetMethods() throws Exception {
        if (sSheetCell != null) return;
        Class<?> type = Class.forName("jc.i");
        Method columns = type.getDeclaredMethod("W");
        Method row = type.getDeclaredMethod("X", TableLayout.class, Context.class, int.class);
        Method cell = type.getDeclaredMethod("V", ViewGroup.class, int.class, String.class);
        columns.setAccessible(true);
        row.setAccessible(true);
        cell.setAccessible(true);
        sSheetColumns = columns;
        sSheetRow = row;
        sSheetCell = cell;
    }

    /**
     * Joey has filled its menu for a post. In Modern this adds the bar items moved to the menu,
     * then lays every item out again in the Post actions order, without the hidden ones, and
     * sets how far the menu opens. Joey's own items keep their own rows and actions.
     */
    public static void sheet(Object sheet, Object dialog, Object table) {
        try {
            if (!(table instanceof TableLayout)) return;
            TableLayout grid = (TableLayout) table;
            Context context = grid.getContext();
            if (!ModernUi.isModernUiEnabled(context)) return;
            int tag = menuTag(grid);
            if (tag == 0) return;
            sheetMethods();
            Settings bar = bar(context);
            MenuSettings menu = menu(context);
            Object holder = field(sheet, "e");
            View item = holder instanceof View ? (View) holder : null;
            int barKey = item == null ? 0 : id(item, "actionbar_layout");

            List<View> cells = new ArrayList<>();
            for (int i = 0; i < grid.getChildCount(); i++) {
                View child = grid.getChildAt(i);
                if (!(child instanceof TableRow)) continue;
                TableRow row = (TableRow) child;
                for (int j = 0; j < row.getChildCount(); j++) cells.add(row.getChildAt(j));
            }
            if (item != null && barKey != 0) {
                for (String id : menu.order) {
                    if (joeyOnly(id) || joeyMenuItem(id)) continue;
                    if (modeOf(bar.place, id) != OVERFLOW) continue;
                    View action = actionView(item, id);
                    if (action == null || !joeyShows(action, barKey)) continue;
                    View cell = sheetCell(context, dialog, action, id);
                    if (cell == null) continue;
                    cell.setTag(tag, id);
                    cells.add(cell);
                }
            }

            Map<String, List<View>> byKey = new HashMap<>();
            List<View> untagged = new ArrayList<>();
            for (View cell : cells) {
                Object key = cell.getTag(tag);
                if (key instanceof String) {
                    List<View> list = byKey.get(key);
                    if (list == null) {
                        list = new ArrayList<>();
                        byKey.put((String) key, list);
                    }
                    list.add(cell);
                } else {
                    untagged.add(cell);
                }
            }
            List<View> ordered = new ArrayList<>();
            for (String id : menu.order) {
                List<View> list = byKey.remove(id);
                if (list != null && !menu.hidden.contains(id)) ordered.addAll(list);
            }
            // Anything not in the order: the column switch is dropped, an unknown cell is kept.
            for (Map.Entry<String, List<View>> entry : byKey.entrySet()) {
                if (!"m:H".equals(entry.getKey()) && !menu.hidden.contains(entry.getKey())) {
                    ordered.addAll(entry.getValue());
                }
            }
            ordered.addAll(untagged);

            for (View cell : cells) {
                if (cell.getParent() instanceof ViewGroup) ((ViewGroup) cell.getParent()).removeView(cell);
            }
            for (int i = grid.getChildCount() - 1; i >= 0; i--) {
                if (grid.getChildAt(i) instanceof TableRow) grid.removeViewAt(i);
            }
            int columns = (Integer) sSheetColumns.invoke(null);
            for (View cell : ordered) {
                Object row = sSheetRow.invoke(null, grid, context, columns);
                if (row instanceof ViewGroup) ((ViewGroup) row).addView(cell);
            }
            sheetHeight(dialog, grid, menu);
        } catch (Throwable t) {
            Log.e(TAG, "sheet", t);
        }
    }

    /** A menu cell for a bar item, built by Joey's own cell maker. Tapping it taps the bar button. */
    private static View sheetCell(Context context, Object dialog, View action, String id) throws Exception {
        int icon = context.getResources().getIdentifier(sheetIcon(id), "drawable", context.getPackageName());
        if (icon == 0) icon = context.getResources().getIdentifier("link", "drawable", context.getPackageName());
        if (icon == 0) return null;
        Object cellView = sSheetCell.invoke(null, new TableRow(context), icon, labelOf(id));
        if (!(cellView instanceof View)) return null;
        View cell = (View) cellView;
        if (cell.getParent() instanceof ViewGroup) ((ViewGroup) cell.getParent()).removeView(cell);
        cell.setOnClickListener(v -> {
            if (dialog instanceof Dialog) ((Dialog) dialog).dismiss();
            action.performClick();
        });
        return cell;
    }

    /**
     * Opens the menu fully, or to the chosen number of rows. More rows than the menu has opens it
     * fully. Nothing is changed when neither is set, so Joey's own height stays.
     */
    private static void sheetHeight(Object dialog, TableLayout grid, MenuSettings menu) {
        if (!(dialog instanceof Dialog) || (!menu.expand && menu.rows <= 0)) return;
        Dialog sheetDialog = (Dialog) dialog;
        // Joey's sheet takes its behaviour from design_bottom_sheet in onStart and sets it up
        // there, so this waits for the first layout and then applies twice, the second time
        // after the opening animation has settled.
        Runnable apply = () -> {
            try {
                int id = grid.getResources().getIdentifier("design_bottom_sheet", "id", grid.getContext().getPackageName());
                View sheetView = id == 0 ? null : sheetDialog.findViewById(id);
                if (sheetView == null) return;
                Class<?> type = Class.forName("com.google.android.material.bottomsheet.BottomSheetBehavior");
                Object behavior = type.getMethod("from", View.class).invoke(null, sheetView);
                if (behavior == null) return;
                List<View> rows = new ArrayList<>();
                for (int i = 0; i < grid.getChildCount(); i++) {
                    if (grid.getChildAt(i) instanceof TableRow) rows.add(grid.getChildAt(i));
                }
                if (menu.expand || menu.rows >= rows.size()) {
                    type.getMethod("setSkipCollapsed", boolean.class).invoke(behavior, true);
                    type.getMethod("setState", int.class).invoke(behavior, 3);
                    return;
                }
                View last = rows.get(menu.rows - 1);
                int[] top = new int[2];
                int[] end = new int[2];
                sheetView.getLocationOnScreen(top);
                last.getLocationOnScreen(end);
                int peek = end[1] + last.getHeight() - top[1];
                if (peek <= 0) return;
                type.getMethod("setSkipCollapsed", boolean.class).invoke(behavior, false);
                type.getMethod("setPeekHeight", int.class).invoke(behavior, Math.min(peek, sheetView.getHeight()));
                type.getMethod("setState", int.class).invoke(behavior, 4);
            } catch (Throwable t) {
                Log.e(TAG, "sheet height", t);
            }
        };
        grid.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (grid.getHeight() == 0) return;
                grid.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                grid.post(apply);
                grid.postDelayed(apply, 250);
            }
        });
    }

    private static String sheetIcon(String id) {
        if ("download".equals(id)) return "download";
        if ("commentsTextView".equals(id)) return "commentoutline";
        String drawable = actionDrawable(id);
        return drawable == null ? "link" : drawable;
    }

    // ---- Post actions popup ----

    public static void showActions(Activity activity) {
        showPostActions(activity);
    }

    private static final int AT_BAR = 0;
    private static final int AT_MENU = 1;
    private static final int AT_HIDDEN = 2;

    private static void showPostActions(Activity activity) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        List<List<String>> lists = actionLists(activity);
        LinearLayout page = MorpheDialog.page(activity, "Post actions",
                "Choose what shows on the post bar and in its \u22ee menu.");
        SharedPreferences prefs = prefs(activity);
        int[] columns = new int[]{prefs.getInt(KEY_MENU_COLUMNS, 0)};
        if (columns[0] == 0) columns[0] = joeyOneColumnSaved() ? 1 : 2;
        boolean[] expand = new boolean[]{prefs.getBoolean(KEY_MENU_EXPAND, false)};
        int[] firstRows = new int[]{Math.max(0, Math.min(MAX_MENU_ROWS, prefs.getInt(KEY_MENU_ROWS, 0)))};
        ActionEditor editor = new ActionEditor(activity, lists, () -> {
            saveActionLists(activity, lists);
            refreshFeed(activity);
        }, columns, expand, firstRows);
        page.addView(editor.view());

        // Menu options: columns, open fully, and rows shown at first.
        LinearLayout options = new LinearLayout(activity);
        options.setOrientation(LinearLayout.VERTICAL);
        options.setPadding(0, Math.round(8 * density), 0, 0);
        LinearLayout columnLine = optionLine(activity, "Menu layout", text);
        TextView one = MorpheDialog.action(activity, "1 column", MorpheDialog.TEXT);
        TextView two = MorpheDialog.action(activity, "2 columns", MorpheDialog.TEXT);
        Runnable paintColumns = () -> {
            MorpheDialog.setFilled(activity, one, columns[0] == 1);
            MorpheDialog.setFilled(activity, two, columns[0] == 2);
        };
        one.setOnClickListener(v -> {
            columns[0] = 1;
            prefs.edit().putInt(KEY_MENU_COLUMNS, 1).apply();
            paintColumns.run();
            editor.rebuild();
        });
        two.setOnClickListener(v -> {
            columns[0] = 2;
            prefs.edit().putInt(KEY_MENU_COLUMNS, 2).apply();
            paintColumns.run();
            editor.rebuild();
        });
        paintColumns.run();
        columnLine.addView(one, modeGap(activity));
        columnLine.addView(two, modeGap(activity));
        options.addView(columnLine);

        LinearLayout rowsLine = optionLine(activity, "Default rows shown in menu (turn off Auto-expand to change)", text);
        TextView fewer = MorpheDialog.action(activity, "\u2212", MorpheDialog.TEXT);
        TextView count = new TextView(activity);
        count.setTextColor(text);
        count.setTextSize(15);
        count.setGravity(Gravity.CENTER);
        count.setMinWidth(Math.round(72 * density));
        TextView more = MorpheDialog.action(activity, "+", MorpheDialog.TEXT);
        Runnable paintRows = () -> {
            count.setText(firstRows[0] == 0 ? "Joey's" : String.valueOf(firstRows[0]));
            boolean on = !expand[0];
            rowsLine.setAlpha(on ? 1f : 0.4f);
            fewer.setEnabled(on && firstRows[0] > 0);
            more.setEnabled(on && firstRows[0] < MAX_MENU_ROWS);
        };
        fewer.setOnClickListener(v -> {
            firstRows[0] = Math.max(0, firstRows[0] - 1);
            prefs.edit().putInt(KEY_MENU_ROWS, firstRows[0]).apply();
            paintRows.run();
            editor.rebuild();
        });
        more.setOnClickListener(v -> {
            firstRows[0] = Math.min(MAX_MENU_ROWS, firstRows[0] + 1);
            prefs.edit().putInt(KEY_MENU_ROWS, firstRows[0]).apply();
            paintRows.run();
            editor.rebuild();
        });
        rowsLine.addView(fewer, modeGap(activity));
        rowsLine.addView(count);
        rowsLine.addView(more, modeGap(activity));
        CheckBox open = MorpheDialog.check(activity, "Auto-expand menu", expand[0], null);
        open.setOnCheckedChangeListener((button, checked) -> {
            expand[0] = checked;
            prefs.edit().putBoolean(KEY_MENU_EXPAND, checked).apply();
            paintRows.run();
            editor.rebuild();
        });
        options.addView(open);
        options.addView(rowsLine);
        paintRows.run();
        page.addView(options);

        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done));
        // MorpheDialog.show scrolls the popup when it does not fit. A drag stops the scrolling
        // for as long as an item is held.
        AlertDialog dialog = MorpheDialog.show(activity, page, 960);
        reset.setOnClickListener(v -> {
            prefs.edit().remove(KEY_ACTION_ORDER).remove(KEY_ACTION_PLACE).remove(KEY_MENU_ORDER)
                    .remove(KEY_MENU_HIDDEN).remove(KEY_MENU_COLUMNS).remove(KEY_MENU_EXPAND)
                    .remove(KEY_MENU_ROWS).commit();
            List<List<String>> fresh = actionLists(activity);
            for (int i = 0; i < 3; i++) {
                lists.get(i).clear();
                lists.get(i).addAll(fresh.get(i));
            }
            columns[0] = joeyOneColumnSaved() ? 1 : 2;
            expand[0] = false;
            firstRows[0] = 0;
            open.setChecked(false);
            paintColumns.run();
            paintRows.run();
            editor.rebuild();
            refreshFeed(activity);
        });
        done.setOnClickListener(v -> dialog.dismiss());
    }

    private static LinearLayout optionLine(Activity activity, String label, int text) {
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        line.setMinimumHeight(Math.round(48 * activity.getResources().getDisplayMetrics().density));
        TextView name = new TextView(activity);
        name.setText(label);
        name.setTextColor(text);
        name.setTextSize(15);
        line.addView(name, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        return line;
    }

    private static boolean allowedIn(String id, int section) {
        if (section == AT_BAR) return canBar(id);
        if (section == AT_MENU) return canMenu(id);
        return true;
    }

    /** The bar, the menu and the hidden list, as saved. */
    private static List<List<String>> actionLists(Context context) {
        migrate(context);
        List<List<String>> lists = new ArrayList<>();
        for (int i = 0; i < 3; i++) lists.add(new ArrayList<>());
        List<String> barIds = barOrder(context);
        JSONObject place = places(context, KEY_ACTION_PLACE, ACTIONS);
        MenuSettings menu = readMenu(context);
        for (String id : barIds) {
            if (modeOf(place, id) == SHOWN) lists.get(AT_BAR).add(id);
        }
        for (String id : menu.order) {
            if (joeyOnly(id)) {
                if (!menu.hidden.contains(id)) lists.get(AT_MENU).add(id);
            } else if (modeOf(place, id) == OVERFLOW) {
                lists.get(AT_MENU).add(id);
            }
        }
        for (String id : barIds) {
            if (modeOf(place, id) == HIDDEN) lists.get(AT_HIDDEN).add(id);
        }
        for (String id : menu.order) {
            if (joeyOnly(id) && menu.hidden.contains(id)) lists.get(AT_HIDDEN).add(id);
        }
        tidyBar(lists.get(AT_BAR));
        return lists;
    }

    /** Save and download first, the votes either side of the score, and the menu button last. */
    private static void tidyBar(List<String> bar) {
        boolean more = bar.remove("more");
        boolean up = bar.remove("upvote");
        boolean down = bar.remove("downvote");
        List<String> left = new ArrayList<>();
        List<String> right = new ArrayList<>();
        for (String id : bar) (leftIcon(id) ? left : right).add(id);
        bar.clear();
        bar.addAll(left);
        bar.addAll(right);
        int score = bar.indexOf("score");
        if (score < 0) {
            if (up) bar.add("upvote");
            if (down) bar.add("downvote");
        } else {
            if (down) bar.add(score + 1, "downvote");
            if (up) bar.add(score, "upvote");
        }
        if (more) bar.add("more");
    }

    private static JSONObject placeOf(List<List<String>> lists) {
        JSONObject place = new JSONObject();
        for (String[] def : ACTIONS) {
            String id = def[0];
            put(place, id, lists.get(AT_BAR).contains(id) ? SHOWN
                    : lists.get(AT_MENU).contains(id) ? OVERFLOW : HIDDEN);
        }
        return place;
    }

    private static void saveActionLists(Context context, List<List<String>> lists) {
        tidyBar(lists.get(AT_BAR));
        JSONArray barOrder = new JSONArray();
        List<String> seen = new ArrayList<>();
        for (List<String> list : lists) {
            for (String id : list) {
                if (canBar(id) && !seen.contains(id)) {
                    seen.add(id);
                    barOrder.put(id);
                }
            }
        }
        JSONArray menuOrder = new JSONArray();
        JSONArray hidden = new JSONArray();
        for (String id : lists.get(AT_MENU)) menuOrder.put(id);
        for (String id : lists.get(AT_HIDDEN)) {
            if (canMenu(id)) menuOrder.put(id);
            if (joeyOnly(id)) hidden.put(id);
        }
        prefs(context).edit()
                .putString(KEY_ACTION_ORDER, barOrder.toString())
                .putString(KEY_ACTION_PLACE, placeOf(lists).toString())
                .putString(KEY_MENU_ORDER, menuOrder.toString())
                .putString(KEY_MENU_HIDDEN, hidden.toString())
                .apply();
    }

    // ---- Post actions editor: the bar, Joey's menu sheet and a hidden tray, all draggable ----

    /** Joey's own menu icons (the drawable each jc.i method uses). */
    private static final String[][] MENU_ICONS = {
            {"m:A", "outline_edit_notifications_24"}, {"m:v", "pencil_outline"}, {"m:u", "delete"},
            {"m:B", "paint_sponge"}, {"m:D", "mic_outline"}, {"m:y", "arrow_collapse_up"},
            {"m:K", "eye_outline"}, {"m:L", "account_circle_outline"}, {"m:x", "subreddit_r"},
            {"m:s", "bookmark_plus_outline"}, {"m:I", "eye_remove_outline"}, {"m:t", "copy"},
            {"m:C", "openexternally"}, {"m:w", "filter_outline"}, {"m:E", "flag_outline"},
            {"m:J", "translate"}, {"m:r", "award_cup"},
    };

    private static String iconFor(String id) {
        if (joeyOnly(id)) {
            for (String[] pair : MENU_ICONS) if (pair[0].equals(id)) return pair[1];
            return "more";
        }
        if ("more".equals(id)) return "more";
        if ("score".equals(id)) return null;
        return sheetIcon(id);
    }

    /** Sample names, so the author and subreddit rows read like the real menu. */
    private static String sampleLabel(String id) {
        if ("m:L".equals(id)) return "example_user";
        if ("m:x".equals(id)) return "me_irl";
        return labelAny(id);
    }

    /** A row of children that wraps onto new lines. */
    private static final class Flow extends ViewGroup {
        private final int gap;

        Flow(Context context, int gap) {
            super(context);
            this.gap = gap;
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            int max = MeasureSpec.getSize(widthSpec) - getPaddingLeft() - getPaddingRight();
            int x = 0;
            int y = 0;
            int line = 0;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                measureChild(child, MeasureSpec.makeMeasureSpec(max, MeasureSpec.AT_MOST),
                        MeasureSpec.makeMeasureSpec(0, MeasureSpec.UNSPECIFIED));
                int w = child.getMeasuredWidth();
                int h = child.getMeasuredHeight();
                if (x > 0 && x + w > max) {
                    x = 0;
                    y += line + gap;
                    line = 0;
                }
                x += w + gap;
                line = Math.max(line, h);
            }
            setMeasuredDimension(max + getPaddingLeft() + getPaddingRight(),
                    y + line + getPaddingTop() + getPaddingBottom());
        }

        @Override
        protected void onLayout(boolean changed, int l, int t, int r, int b) {
            int max = r - l - getPaddingLeft() - getPaddingRight();
            int x = 0;
            int y = 0;
            int line = 0;
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                int w = child.getMeasuredWidth();
                int h = child.getMeasuredHeight();
                if (x > 0 && x + w > max) {
                    x = 0;
                    y += line + gap;
                    line = 0;
                }
                int left = getPaddingLeft() + x;
                int top = getPaddingTop() + y;
                child.layout(left, top, left + w, top + h);
                x += w + gap;
                line = Math.max(line, h);
            }
        }
    }

    /**
     * The editor. Long-press an item and drag it along the bar, into the menu sheet, or onto the
     * hidden tray. A tap selects an item and shows the same moves as buttons. The colours are a
     * fixed preview theme.
     */
    private static final class ActionEditor {
        private static final int BG = 0xFF121A1C;
        private static final int SHEET = 0xFF1B2527;
        private static final int SLOT = 0xFF1F2A2C;
        private static final int TEXT = 0xFFE6ECEB;
        private static final int ICON = 0xFF9FB3B1;
        private static final int MUTED = 0xFF7F9190;
        private static final int LINE = 0xFF3D4C4E;

        private final Activity activity;
        private final List<List<String>> lists;
        private final Runnable changed;
        private final int[] columns;
        private final boolean[] expand;
        private final int[] firstRows;
        private final float d;
        private final int accent;
        private final FrameLayout root;
        private final LinearLayout content;
        private LinearLayout bar;
        private LinearLayout grid;
        private Flow tray;
        private View ghost;
        private View marker;
        private String dragId;
        private View dragView;
        private int[] target;
        private float downX;
        private float downY;

        ActionEditor(Activity activity, List<List<String>> lists, Runnable changed,
                     int[] columns, boolean[] expand, int[] firstRows) {
            this.activity = activity;
            this.lists = lists;
            this.changed = changed;
            this.columns = columns;
            this.expand = expand;
            this.firstRows = firstRows;
            this.d = activity.getResources().getDisplayMetrics().density;
            this.accent = MorpheDialog.accent(activity);
            root = new FrameLayout(activity);
            content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            int pad = dp(12);
            content.setPadding(pad, pad, pad, pad);
            content.setBackground(round(BG, 0, 0, 12));
            root.addView(content, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.topMargin = dp(8);
            root.setLayoutParams(lp);
            rebuild();
        }

        View view() {
            return root;
        }

        private int dp(float value) {
            return Math.round(value * d);
        }

        private GradientDrawable round(int fill, int stroke, int dash, float radius) {
            GradientDrawable shape = new GradientDrawable();
            shape.setColor(fill);
            shape.setCornerRadius(radius * d);
            if (stroke != 0) {
                if (dash > 0) shape.setStroke(Math.max(1, dp(1)), stroke, dp(dash), dp(dash));
                else shape.setStroke(Math.max(1, dp(1)), stroke);
            }
            return shape;
        }

        private ImageView icon(String drawable, int color, int size) {
            ImageView view = new ImageView(activity);
            view.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            int id = drawable == null ? 0
                    : activity.getResources().getIdentifier(drawable, "drawable", activity.getPackageName());
            if (id != 0) {
                Drawable image = activity.getDrawable(id);
                if (image != null) {
                    image = image.mutate();
                    image.setTint(color);
                    view.setImageDrawable(image);
                }
            }
            view.setLayoutParams(new LinearLayout.LayoutParams(dp(size), dp(size)));
            return view;
        }

        private TextView text(String value, int color, float size) {
            TextView view = new TextView(activity);
            view.setText(value);
            view.setTextColor(color);
            view.setTextSize(size);
            view.setSingleLine(true);
            return view;
        }

        private boolean locked(String id) {
            return "more".equals(id) || "upvote".equals(id) || "downvote".equals(id);
        }

        void rebuild() {
            content.removeAllViews();
            bar = buildBar();
            content.addView(bar);

            LinearLayout sheet = new LinearLayout(activity);
            sheet.setOrientation(LinearLayout.VERTICAL);
            sheet.setPadding(dp(10), dp(8), dp(10), dp(8));
            sheet.setBackground(round(SHEET, 0, 0, 12));
            View grab = new View(activity);
            grab.setBackground(round(0xFF4A5A5C, 0, 0, 2));
            LinearLayout.LayoutParams grabLp = new LinearLayout.LayoutParams(dp(28), dp(3));
            grabLp.gravity = Gravity.CENTER_HORIZONTAL;
            grabLp.bottomMargin = dp(8);
            sheet.addView(grab, grabLp);
            grid = buildGrid();
            sheet.addView(grid);
            LinearLayout.LayoutParams sheetLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            sheetLp.topMargin = dp(10);
            content.addView(sheet, sheetLp);

            TextView how = text("Press and hold an item to pick it up, then drag it: along the bar to "
                    + "reorder, into the menu, or down to Hidden to remove it.", accent, 13);
            how.setSingleLine(false);
            how.setPadding(dp(2), dp(10), dp(2), 0);
            content.addView(how);
            TextView colours = text("These colours are only for the preview.", MUTED, 11);
            colours.setPadding(dp(2), dp(2), dp(2), 0);
            content.addView(colours);

            TextView hiddenLabel = text("Hidden", MUTED, 11);
            hiddenLabel.setPadding(0, dp(10), 0, dp(4));
            content.addView(hiddenLabel);
            tray = buildTray();
            content.addView(tray, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        private LinearLayout buildBar() {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setPadding(dp(4), dp(4), dp(4), dp(4));
            row.setBackground(round(BG, LINE, 3, 10));
            List<String> items = lists.get(AT_BAR);
            int screen = activity.getResources().getDisplayMetrics().widthPixels;
            int room = Math.min(screen - dp(96), dp(900)) - dp(32);
            float units = 1;
            for (String id : items) units += wide(id) ? 1.6f : 1f;
            int slot = Math.max(dp(26), Math.min(dp(40), Math.round(room / units)));
            LinearLayout left = new LinearLayout(activity);
            left.setOrientation(LinearLayout.HORIZONTAL);
            left.setPadding(dp(2), dp(2), dp(2), dp(2));
            left.setBackground(round(SHEET, 0, 0, 8));
            boolean hasLeft = false;
            for (String id : items) {
                if (!leftIcon(id)) continue;
                left.addView(slot(id, slot));
                hasLeft = true;
            }
            if (hasLeft) row.addView(left);
            View gap = new View(activity);
            gap.setTag("#gap");
            row.addView(gap, new LinearLayout.LayoutParams(0, dp(4), 1f));
            for (String id : items) {
                if (!leftIcon(id)) row.addView(slot(id, slot));
            }
            return row;
        }

        /** The score and the comment count carry a number, so their slots are wider. */
        private boolean wide(String id) {
            return "score".equals(id) || "commentsTextView".equals(id);
        }

        private View slot(String id, int size) {
            LinearLayout box = new LinearLayout(activity);
            box.setOrientation("commentsTextView".equals(id) ? LinearLayout.HORIZONTAL : LinearLayout.VERTICAL);
            box.setGravity(Gravity.CENTER);
            boolean lock = locked(id);
            box.setBackground(round(lock ? BG : SLOT, lock ? 0xFF2C393B : 0, 0, 8));
            String drawable = iconFor(id);
            if (drawable != null) box.addView(icon(drawable, lock ? MUTED : TEXT, 18));
            if ("score".equals(id)) {
                // Wrap the width, so the slot's centre gravity centres the number.
                box.addView(text("14k", TEXT, 12), new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            if ("commentsTextView".equals(id)) {
                TextView number = text("403", ICON, 11);
                number.setPadding(dp(3), 0, 0, 0);
                box.addView(number);
            }
            if (lock) box.addView(icon("lock_outline", MUTED, 10));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    wide(id) ? Math.round(size * 1.6f) : size, dp(44));
            lp.leftMargin = dp(1);
            lp.rightMargin = dp(1);
            box.setLayoutParams(lp);
            wire(box, id, lock);
            return box;
        }

        private LinearLayout buildGrid() {
            LinearLayout table = new LinearLayout(activity);
            table.setOrientation(LinearLayout.VERTICAL);
            List<String> items = lists.get(AT_MENU);
            int perRow = Math.max(1, columns[0]);
            int row = 0;
            for (int i = 0; i < items.size(); i += perRow) {
                if (!expand[0] && firstRows[0] > 0 && row == firstRows[0]) {
                    View cut = new View(activity);
                    cut.setBackground(round(0, accent, 4, 0));
                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                            Math.max(1, dp(1)));
                    lp.topMargin = dp(2);
                    lp.bottomMargin = dp(2);
                    table.addView(cut, lp);
                }
                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                if (!expand[0] && firstRows[0] > 0 && row >= firstRows[0]) line.setAlpha(0.4f);
                for (int c = 0; c < perRow; c++) {
                    View cell = i + c < items.size() ? cell(items.get(i + c)) : new View(activity);
                    line.addView(cell, new LinearLayout.LayoutParams(0, dp(36), 1f));
                }
                table.addView(line);
                row++;
            }
            if (items.isEmpty()) {
                TextView empty = text("Drag items here to put them in the menu", MUTED, 12);
                empty.setGravity(Gravity.CENTER);
                empty.setTag("#empty");
                table.addView(empty, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(36)));
            }
            return table;
        }

        private View cell(String id) {
            LinearLayout box = new LinearLayout(activity);
            box.setOrientation(LinearLayout.HORIZONTAL);
            box.setGravity(Gravity.CENTER_VERTICAL);
            box.setPadding(dp(6), 0, dp(6), 0);
            box.setBackground(round(SHEET, 0, 0, 6));
            box.addView(icon(iconFor(id), ICON, 18));
            TextView label = text(sampleLabel(id), TEXT, 12);
            label.setPadding(dp(10), 0, 0, 0);
            box.addView(label);
            wire(box, id, false);
            return box;
        }

        private Flow buildTray() {
            Flow flow = new Flow(activity, dp(6));
            flow.setPadding(dp(4), dp(4), dp(4), dp(4));
            flow.setMinimumHeight(dp(36));
            for (String id : lists.get(AT_HIDDEN)) {
                LinearLayout chip = new LinearLayout(activity);
                chip.setOrientation(LinearLayout.HORIZONTAL);
                chip.setGravity(Gravity.CENTER_VERTICAL);
                chip.setPadding(dp(10), dp(5), dp(10), dp(5));
                chip.setBackground(round(BG, LINE, 0, 14));
                String drawable = iconFor(id);
                if (drawable != null) chip.addView(icon(drawable, ICON, 14));
                TextView label = text(labelAny(id), TEXT, 11);
                label.setPadding(dp(6), 0, 0, 0);
                chip.addView(label);
                wire(chip, id, false);
                flow.addView(chip);
            }
            if (lists.get(AT_HIDDEN).isEmpty()) {
                TextView drop = text("Drop here to hide", MUTED, 11);
                drop.setPadding(dp(10), dp(5), dp(10), dp(5));
                drop.setBackground(round(BG, LINE, 3, 14));
                flow.addView(drop);
            }
            return flow;
        }

        private int sectionOf(String id) {
            for (int i = 0; i < 3; i++) if (lists.get(i).contains(id)) return i;
            return -1;
        }

        private void moveTo(String id, int section, int index) {
            int from = sectionOf(id);
            if (from < 0 || !allowedIn(id, section)) return;
            List<String> source = lists.get(from);
            int old = source.indexOf(id);
            source.remove(id);
            List<String> list = lists.get(section);
            if (from == section && old < index) index--;
            list.add(Math.max(0, Math.min(index, list.size())), id);
            commit();
        }

        private void commit() {
            tidyBar(lists.get(AT_BAR));
            changed.run();
            rebuild();
        }

        // ---- dragging ----

        /**
         * Press and hold starts a drag. This view takes the touch from the start, so a drag along
         * the bar is never handed to the dialog. A vertical swipe before the hold still scrolls
         * the dialog, which then cancels the hold.
         */
        private void wire(View view, String id, boolean lock) {
            view.setTag("#item");
            if (lock) return;
            int slop = android.view.ViewConfiguration.get(activity).getScaledTouchSlop();
            int hold = android.view.ViewConfiguration.getLongPressTimeout();
            Runnable[] pending = new Runnable[1];
            view.setOnTouchListener((v, event) -> {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    downX = event.getRawX();
                    downY = event.getRawY();
                    pending[0] = () -> {
                        pending[0] = null;
                        v.performHapticFeedback(android.view.HapticFeedbackConstants.LONG_PRESS);
                        startDrag(v, id);
                    };
                    v.postDelayed(pending[0], hold);
                    return true;
                }
                if (dragId != null && id.equals(dragId)) {
                    if (action == MotionEvent.ACTION_MOVE) drag(event.getRawX(), event.getRawY());
                    else if (action == MotionEvent.ACTION_UP) endDrag(true);
                    else if (action == MotionEvent.ACTION_CANCEL) endDrag(false);
                    return true;
                }
                if (action == MotionEvent.ACTION_MOVE && pending[0] != null
                        && Math.hypot(event.getRawX() - downX, event.getRawY() - downY) > slop) {
                    v.removeCallbacks(pending[0]);
                    pending[0] = null;
                    return false;
                }
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
                    if (pending[0] != null) v.removeCallbacks(pending[0]);
                    pending[0] = null;
                }
                return true;
            });
        }

        private void startDrag(View view, String id) {
            dragId = id;
            dragView = view;
            view.setAlpha(0.3f);
            ViewParent parent = view.getParent();
            if (parent != null) parent.requestDisallowInterceptTouchEvent(true);
            LinearLayout chip = new LinearLayout(activity);
            chip.setOrientation(LinearLayout.HORIZONTAL);
            chip.setGravity(Gravity.CENTER_VERTICAL);
            chip.setPadding(dp(10), dp(6), dp(10), dp(6));
            chip.setBackground(round(accent, 0, 0, 14));
            String drawable = iconFor(id);
            if (drawable != null) chip.addView(icon(drawable, 0xFF04342C, 16));
            TextView label = text(labelAny(id), 0xFF04342C, 12);
            label.setPadding(dp(6), 0, 0, 0);
            chip.addView(label);
            ghost = chip;
            root.addView(ghost, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));
            marker = new View(activity);
            marker.setBackgroundColor(accent);
            marker.setVisibility(View.GONE);
            root.addView(marker, new FrameLayout.LayoutParams(dp(3), dp(36)));
            drag(downX, downY);
        }

        private int[] origin(View view) {
            int[] at = new int[2];
            view.getLocationOnScreen(at);
            return at;
        }

        private boolean inside(View view, float x, float y, int slack) {
            int[] at = origin(view);
            return x >= at[0] - slack && x <= at[0] + view.getWidth() + slack
                    && y >= at[1] - slack && y <= at[1] + view.getHeight() + slack;
        }

        private void drag(float x, float y) {
            int[] base = origin(root);
            ghost.setX(x - base[0] - dp(30));
            ghost.setY(y - base[1] - dp(40));
            target = find(x, y);
            if (target != null && !fits(target)) target = null;
            tray.setBackground(target != null && target[0] == AT_HIDDEN ? round(0, accent, 3, 8) : null);
            if (target == null || target[0] == AT_HIDDEN) {
                marker.setVisibility(View.GONE);
                return;
            }
            float[] spot = markerSpot(target);
            if (spot == null) {
                marker.setVisibility(View.GONE);
                return;
            }
            marker.setX(spot[0] - base[0]);
            marker.setY(spot[1] - base[1]);
            ViewGroup.LayoutParams lp = marker.getLayoutParams();
            lp.height = Math.round(spot[2]);
            marker.setLayoutParams(lp);
            marker.setVisibility(View.VISIBLE);
        }

        /** The bar slots or menu cells, in list order, with their ids. */
        private List<View> items(ViewGroup group) {
            List<View> found = new ArrayList<>();
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if ("#item".equals(child.getTag())) {
                    found.add(child);
                } else if (child instanceof ViewGroup) {
                    found.addAll(items((ViewGroup) child));
                }
            }
            return found;
        }

        /** Section and index for a point, or null when over nothing. */
        private int[] find(float x, float y) {
            if (inside(bar, x, y, dp(14))) {
                List<View> slots = items(bar);
                int index = 0;
                for (View slot : slots) {
                    int[] at = origin(slot);
                    if (x > at[0] + slot.getWidth() / 2f) index++;
                }
                return new int[]{AT_BAR, index};
            }
            if (inside(grid, x, y, dp(14))) {
                List<View> cells = items(grid);
                if (cells.isEmpty()) return new int[]{AT_MENU, 0};
                int best = 0;
                double bestDistance = Double.MAX_VALUE;
                for (int i = 0; i < cells.size(); i++) {
                    int[] at = origin(cells.get(i));
                    double cx = at[0] + cells.get(i).getWidth() / 2.0;
                    double cy = at[1] + cells.get(i).getHeight() / 2.0;
                    double distance = Math.hypot(x - cx, (y - cy) * 2);
                    if (distance < bestDistance) {
                        bestDistance = distance;
                        best = i;
                    }
                }
                int[] at = origin(cells.get(best));
                boolean after = x > at[0] + cells.get(best).getWidth() / 2f;
                return new int[]{AT_MENU, best + (after ? 1 : 0)};
            }
            if (inside(tray, x, y, dp(14))) return new int[]{AT_HIDDEN, lists.get(AT_HIDDEN).size()};
            return null;
        }

        /** Save and download stay in the left block, everything else stays right of it. */
        private boolean fits(int[] spot) {
            if (!allowedIn(dragId, spot[0])) return false;
            if (spot[0] != AT_BAR) return true;
            List<String> items = new ArrayList<>(lists.get(AT_BAR));
            items.remove(dragId);
            int leftCount = 0;
            for (String id : items) if (leftIcon(id)) leftCount++;
            int index = spot[1];
            if (lists.get(AT_BAR).contains(dragId) && lists.get(AT_BAR).indexOf(dragId) < index) index--;
            return leftIcon(dragId) ? index <= leftCount : index >= leftCount;
        }

        /** Where the insertion line goes: x, y and height on screen. */
        private float[] markerSpot(int[] spot) {
            List<View> views = items(spot[0] == AT_BAR ? bar : grid);
            if (views.isEmpty()) {
                int[] at = origin(spot[0] == AT_BAR ? bar : grid);
                return new float[]{at[0] + dp(4), at[1], dp(36)};
            }
            int index = Math.min(spot[1], views.size());
            View anchor = views.get(Math.max(0, Math.min(index, views.size() - 1)));
            int[] at = origin(anchor);
            float x = index >= views.size() ? at[0] + anchor.getWidth() : at[0];
            return new float[]{x - dp(1.5f), at[1], anchor.getHeight()};
        }

        private void endDrag(boolean drop) {
            if (ghost != null) root.removeView(ghost);
            if (marker != null) root.removeView(marker);
            ghost = null;
            marker = null;
            if (dragView != null) dragView.setAlpha(1f);
            tray.setBackground(null);
            String id = dragId;
            int[] spot = target;
            dragId = null;
            dragView = null;
            target = null;
            if (drop && id != null && spot != null) moveTo(id, spot[0], spot[1]);
        }
    }

    private interface Strip {
        void draw(Activity activity, LinearLayout host, int slots, List<String> order, JSONObject place);
    }

    private static void showPlaces(Activity activity, String title, String info,
                                   String[][] items, boolean allowOverflow, boolean screenSize,
                                   String orderKey, String placeKey, Strip strip) {
        List<String> order = new ArrayList<>(items == ACTIONS ? barOrder(activity) : order(activity, orderKey, items));
        // The menu button is always last on the bar, so its row is locked at the end.
        if (order.remove("more")) order.add("more");
        JSONObject place = places(activity, placeKey, items);
        LinearLayout page = MorpheDialog.page(activity, title, info);
        FrameLayout stage = new FrameLayout(activity);
        stage.setClipChildren(true);
        int[] width = new int[]{BarPreview.widthIndex(activity)};
        Runnable paint = () -> {
            LinearLayout host = new LinearLayout(activity);
            host.setOrientation(LinearLayout.VERTICAL);
            strip.draw(activity, host, BarPreview.slots(activity, width[0]), order, place);
            BarPreview.show(activity, stage, host);
        };
        if (screenSize) page.addView(BarPreview.widthRow(activity, width, paint));
        page.addView(stage);
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        int accent = MorpheDialog.accent(activity);
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        Runnable[] rebuild = new Runnable[1];
        boolean[] flankPending = new boolean[1];
        rebuild[0] = () -> {
            rows.removeAllViews();
            List<String> visible = new ArrayList<>();
            for (String id : order) {
                if (findDef(items, id) != null) visible.add(id);
            }
            for (String id : visible) {
                String[] def = findDef(items, id);
                boolean canMenu = allowOverflow && !"more".equals(id) && !"score".equals(id);
                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setTag(id);
                line.setMinimumHeight(Math.round(48 * activity.getResources().getDisplayMetrics().density));
                TextView label = new TextView(activity);
                label.setText(def[1]);
                label.setTextColor(text);
                label.setTextSize(15);
                line.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                Runnable after = () -> {
                    savePlaces(activity, placeKey, place);
                    saveOrder(activity, orderKey, order);
                    rebuild[0].run();
                    refreshFeed(activity);
                };
                if (canMenu) line.addView(modeButton(activity, "Menu", OVERFLOW, id, place, after), modeGap(activity));
                line.addView(modeButton(activity, "Hide", HIDDEN, id, place, after), modeGap(activity));
                boolean vote = items == ACTIONS && ("upvote".equals(id) || "downvote".equals(id));
                if ("more".equals(id) || vote) {
                    // Locked rows: the menu button is always last, and the votes move with the score.
                    // A greyed name and a lock where the handle would be.
                    label.setAlpha(0.6f);
                    ImageView lock = BarPreview.icon(activity, "lock_outline", sub, 20);
                    int pad = Math.round(12 * activity.getResources().getDisplayMetrics().density);
                    lock.setPadding(pad, pad, pad, pad);
                    int box = Math.round(44 * activity.getResources().getDisplayMetrics().density);
                    lock.setLayoutParams(new LinearLayout.LayoutParams(box, box));
                    lock.setAlpha(0.7f);
                    line.addView(lock);
                    rows.addView(line);
                    continue;
                }
                line.addView(DragOrder.handle(activity, rows, (from, to) -> {
                    if (from < 0 || to < 0 || from >= rows.getChildCount() || to >= rows.getChildCount()) return false;
                    String fromId = String.valueOf(rows.getChildAt(from).getTag());
                    String toId = String.valueOf(rows.getChildAt(to).getTag());
                    if (items == ACTIONS && leftIcon(fromId) != leftIcon(toId)) return false;
                    if ("more".equals(fromId) || "more".equals(toId)) return false;
                    int ia = order.indexOf(fromId);
                    int ib = order.indexOf(toId);
                    if (ia < 0 || ib < 0) return false;
                    if (items == ACTIONS && voteGroup(toId) && voteGroup(fromId)) {
                        // The score passing its own votes changes nothing.
                    } else if (items == ACTIONS && voteGroup(toId) && !"score".equals(fromId)) {
                        // Another item jumps the votes and the score as one block.
                        order.remove(fromId);
                        if (to > from) order.add(order.indexOf("downvote") + 1, fromId);
                        else order.add(order.indexOf("upvote"), fromId);
                    } else {
                        Collections.swap(order, ia, ib);
                    }
                    if (items == ACTIONS && !flankPending[0]) {
                        // The bar keeps the votes either side of the score, so the list does too.
                        // Runs once the drag has settled.
                        flankPending[0] = true;
                        rows.post(() -> {
                            flankPending[0] = false;
                            flankScore(order);
                            saveOrder(activity, orderKey, order);
                            rebuild[0].run();
                        });
                    }
                    saveOrder(activity, orderKey, order);
                    paint.run();
                    return true;
                }));
                rows.addView(line);
            }
            paint.run();
        };
        rebuild[0].run();
        page.addView(BarPreview.options(activity, rows));
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done));
        AlertDialog dialog = MorpheDialog.show(activity, page, 960);
        reset.setOnClickListener(v -> {
            prefs(activity).edit().remove(orderKey).remove(placeKey).commit();
            order.clear();
            for (String[] def : items) order.add(def[0]);
            JSONObject fresh = joeyDefaults(items);
            for (String[] def : items) put(place, def[0], fresh.optInt(def[0], HIDDEN));
            rebuild[0].run();
            refreshFeed(activity);
        });
        done.setOnClickListener(v -> dialog.dismiss());
    }

    /** One of the Menu or Hide buttons. Filled while the item is there. Tapping it again puts the item back on the post. */
    private static TextView modeButton(Activity activity, String text, int mode, String id,
                                       JSONObject place, Runnable after) {
        TextView button = MorpheDialog.action(activity, text, MorpheDialog.TEXT);
        MorpheDialog.setFilled(activity, button, modeOf(place, id) == mode);
        button.setOnClickListener(v -> {
            put(place, id, modeOf(place, id) == mode ? SHOWN : mode);
            after.run();
        });
        return button;
    }

    private static boolean voteGroup(String id) {
        return "upvote".equals(id) || "score".equals(id) || "downvote".equals(id);
    }

    private static LinearLayout.LayoutParams modeGap(Activity activity) {
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gap.leftMargin = Math.round(8 * activity.getResources().getDisplayMetrics().density);
        return gap;
    }

    private static void drawDetails(Activity activity, LinearLayout host, int slots,
                                    List<String> order, JSONObject place) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        TextView title = new TextView(activity);
        title.setText("Sample post title");
        title.setTextColor(text);
        title.setTextSize(16);
        title.setPadding(Math.round(16 * density), Math.round(14 * density), Math.round(16 * density), 0);
        host.addView(title);
        // Built the way Joey builds the real line: the same gaps, and Joey's own icons.
        SpannableStringBuilder rich = new SpannableStringBuilder();
        for (String id : order) {
            if (modeOf(place, id) != SHOWN) continue;
            SpannableStringBuilder body = new SpannableStringBuilder();
            CharSequence icon = sampleIcon(id);
            if (icon.length() > 0) body.append(icon).append('\u00a0');
            body.append(sampleDetail(id));
            if ("subreddit".equals(id)) {
                body.setSpan(new ForegroundColorSpan(MorpheDialog.accent(activity)), 0, body.length(),
                        Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            join(rich, new CharSequence[]{sampleSeparator(id), body});
        }
        TextView meta = new TextView(activity);
        meta.setText(rich.length() == 0 ? "Nothing on this line" : rich);
        meta.setTextColor(sub);
        meta.setTextSize(13);
        meta.setSingleLine(true);
        meta.setPadding(Math.round(16 * density), Math.round(6 * density), Math.round(16 * density), Math.round(16 * density));
        int box = Math.round(Math.min(
                activity.getResources().getDisplayMetrics().widthPixels - 96 * density, 640 * density));
        float size = 13f;
        while (size > 8f && meta.getPaint().measureText(meta.getText().toString()) > box) {
            size -= 0.5f;
            meta.setTextSize(size);
        }
        host.addView(meta);
        host.setMinimumHeight(Math.round(88 * density));
        host.setBackgroundColor(ModernUi.isModernUiEnabled(activity)
                ? ModernUi.getPalette(activity).canvas : 0xFF102022);
    }

    /** Joey's icon for a piece of the line: clock, person, speech bubble, or the vote ratio. */
    private static CharSequence sampleIcon(String id) {
        String method = "time".equals(id) ? "m" : "author".equals(id) ? "o"
                : "comments".equals(id) ? "e" : "percent".equals(id) ? "n" : null;
        if (method == null) return "";
        try {
            Class<?> icons = Class.forName("zd.x");
            Object guy = icons.getMethod("q").invoke(null);
            Object value = "n".equals(method)
                    ? icons.getMethod("n", boolean.class).invoke(guy, false)
                    : icons.getMethod(method).invoke(guy);
            return value instanceof CharSequence ? (CharSequence) value : "";
        } catch (Throwable t) {
            return "";
        }
    }

    /** The separator Joey puts before a piece. The domain uses the layout's separator mark. */
    private static CharSequence sampleSeparator(String id) {
        if ("domain".equals(id)) {
            // Joey's feed separator, submission_info_seperator, read through zd.n.F.
            for (String mark : separators()) {
                if (mark.length() > 1) return mark;
            }
        }
        return "   ";
    }

    private static String sampleDetail(String id) {
        if ("flair".equals(id)) return "Verified";
        if ("subreddit".equals(id)) return "me_irl";
        if ("author".equals(id)) return "example_user";
        if ("score".equals(id)) return "14k points";
        if ("comments".equals(id)) return "403";
        if ("time".equals(id)) return "2h";
        if ("domain".equals(id)) return "i.redd.it";
        if ("percent".equals(id)) return "98%";
        return id;
    }

    private static void drawActions(Activity activity, LinearLayout host, int slots,
                                    List<String> order, JSONObject place) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        LinearLayout bar = new LinearLayout(activity);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setMinimumHeight(Math.round(48 * density));
        bar.setPadding(Math.round(4 * density), 0, Math.round(4 * density), 0);
        List<String> left = new ArrayList<>();
        List<String> right = new ArrayList<>();
        sides(order, place, left, right);
        for (String id : left) bar.addView(actionIcon(activity, id, text, sub));
        bar.addView(new View(activity), new LinearLayout.LayoutParams(0, 1, 1f));
        for (String id : right) bar.addView(actionIcon(activity, id, text, sub));
        boolean menu = false;
        for (String id : order) {
            if (!"more".equals(id) && modeOf(place, id) == OVERFLOW) menu = true;
        }
        if (menu || modeOf(place, "more") != HIDDEN) {
            bar.addView(BarPreview.icon(activity, "more", text, 22));
        }
        host.addView(bar);
        host.setBackgroundColor(BarPreview.canvas(activity));
    }

    private static View actionIcon(Activity activity, String id, int text, int sub) {
        float density = activity.getResources().getDisplayMetrics().density;
        if ("download".equals(id)) return MediaDownload.glyph(activity, text);
        String drawable = actionDrawable(id);
        if (drawable != null && !"commentsTextView".equals(id) && !"score".equals(id)) {
            return BarPreview.icon(activity, drawable, text, 22);
        }
        LinearLayout group = new LinearLayout(activity);
        group.setGravity(Gravity.CENTER_VERTICAL);
        if ("commentsTextView".equals(id)) {
            group.addView(BarPreview.icon(activity, "commentoutline", text, 22));
        }
        TextView label = new TextView(activity);
        label.setText("score".equals(id) ? "14k" : "403");
        label.setTextColor("score".equals(id) ? text : sub);
        label.setTextSize(13);
        label.setPadding(0, 0, Math.round(8 * density), 0);
        group.addView(label);
        return group;
    }

    /** The drawables Joey's own bar uses (submission_template.xml). */
    private static String actionDrawable(String id) {
        if ("save".equals(id)) return "star_outline";
        if ("share_icon".equals(id)) return "share";
        if ("link_icon".equals(id)) return "link";
        if ("preview_icon".equals(id)) return "text_content_type";
        if ("hide_icon".equals(id)) return "eye_off_outline";
        if ("upvote".equals(id)) return "upvote_arrow_outline";
        if ("downvote".equals(id)) return "downvote_arrow_outline";
        return null;
    }

    private static String labelOf(String id) {
        String[] def = findDef(ACTIONS, id);
        return def == null ? id : def[1];
    }

    private static int modeOf(JSONObject place, String id) {
        int mode = place.optInt(id, HIDDEN);
        if (mode == OVERFLOW && ("more".equals(id) || "score".equals(id))) return SHOWN;
        if (mode != SHOWN && mode != OVERFLOW) return HIDDEN;
        return mode;
    }

    private static List<String> order(Context context, String key, String[][] items) {
        List<String> result = new ArrayList<>();
        String raw = prefs(context).getString(key, null);
        if (raw != null) {
            try {
                JSONArray arr = new JSONArray(raw);
                for (int i = 0; i < arr.length(); i++) {
                    String id = arr.optString(i, "");
                    if (findDef(items, id) != null && !result.contains(id)) result.add(id);
                }
            } catch (Throwable ignored) {
            }
        }
        for (String[] def : items) {
            if (!result.contains(def[0])) result.add(def[0]);
        }
        return result;
    }

    private static JSONObject places(Context context, String key, String[][] items) {
        JSONObject defaults = joeyDefaults(items);
        String raw = prefs(context).getString(key, null);
        if (raw == null) return defaults;
        JSONObject place;
        try {
            place = new JSONObject(raw);
        } catch (Throwable ignored) {
            return defaults;
        }
        for (String[] def : items) {
            if (!place.has(def[0])) put(place, def[0], defaults.optInt(def[0], HIDDEN));
        }
        return place;
    }

    private static void put(JSONObject object, String key, int value) {
        try {
            object.put(key, value);
        } catch (Throwable ignored) {
        }
    }

    private static void saveOrder(Context context, String key, List<String> order) {
        JSONArray arr = new JSONArray();
        for (String id : order) arr.put(id);
        prefs(context).edit().putString(key, arr.toString()).apply();
    }

    private static void savePlaces(Context context, String key, JSONObject place) {
        prefs(context).edit().putString(key, place.toString()).apply();
    }

    private static String[] findDef(String[][] items, String id) {
        for (String[] def : items) {
            if (def[0].equals(id)) return def;
        }
        return null;
    }

    private static String layoutName() {
        return enumName("a", "LIST");
    }

    private static String imageName() {
        return enumName("b", "FULL_HEIGHT");
    }

    private static String imageLabel() {
        String name = imageName();
        if ("_16_IS_TO_9".equals(name)) return "16:9 image";
        if ("THUMBNAIL".equals(name)) return "Thumbnail";
        if ("BLANK_THUMBNAIL".equals(name)) return "Blank thumbnail";
        if ("NO_IMAGE".equals(name)) return "No image";
        return "Full height image";
    }

    private static final Map<String, Field> JOEY_SETTINGS = new HashMap<>();

    /** Reads Joey's live setting each time; only the field lookup is kept. */
    private static String enumName(String field, String fallback) {
        try {
            Field found = JOEY_SETTINGS.get(field);
            if (found == null) {
                found = Class.forName("za.a").getField(field);
                JOEY_SETTINGS.put(field, found);
            }
            Object value = found.get(null);
            if (value instanceof Enum) return ((Enum<?>) value).name();
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    private static void writeJoey(String key, String name, String enumClass, String field) {
        try {
            Class<?> za = Class.forName("za.a");
            Class<?> type = Class.forName(enumClass);
            @SuppressWarnings({"unchecked", "rawtypes"})
            Object value = Enum.valueOf((Class) type, name);
            za.getField(field).set(null, value);
            SharedPreferences prefs = (SharedPreferences) za.getField("E").get(null);
            if (prefs != null) prefs.edit().putString(key, name).apply();
        } catch (Throwable t) {
            Log.e(TAG, "writeJoey " + key, t);
        }
    }

    /**
     * Joey's RestartGuy, except a settings screen hosting the Morphe page is
     * left alone: recreating it would close the page under the user.
     */
    private static void refreshFeed(Activity host) {
        try {
            Object cache = Class.forName("wb.b").getMethod("k").invoke(null);
            cache.getClass().getMethod("p").invoke(cache);
        } catch (Throwable t) {
            Log.e(TAG, "refreshFeed cache", t);
        }
        boolean keepHost = host != null && host.getClass().getName().contains(".SettingActivities.");
        try {
            Class<?> guy = Class.forName("xd.b");
            Object instance = guy.getMethod("b").invoke(null);
            Object list = field(instance, "a");
            if (!(list instanceof List)) return;
            Class<?> listener = Class.forName("xd.b$a");
            Method restart = listener.getMethod("K", boolean.class);
            restart.setAccessible(true);
            for (Object entry : new ArrayList<>((List<?>) list)) {
                Object target = entry instanceof java.lang.ref.Reference ? ((java.lang.ref.Reference<?>) entry).get() : null;
                if (target == null || (keepHost && target == host)) continue;
                try {
                    restart.invoke(target, true);
                } catch (Throwable t) {
                    Log.e(TAG, "refreshFeed " + target.getClass().getName(), t);
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "refreshFeed", t);
        }
    }

    private static View itemOf(Object card) {
        Object holder = field(card, "f");
        Object item = holder == null ? null : field(holder, "itemView");
        return item instanceof View ? (View) item : null;
    }

    private static View find(View item, String name) {
        int found = id(item, name);
        return found == 0 ? null : item.findViewById(found);
    }

    private static final Map<String, Integer> IDS = new HashMap<>();

    private static int id(View view, String name) {
        Integer cached = IDS.get(name);
        if (cached != null) return cached;
        int found = view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
        IDS.put(name, found);
        return found;
    }

    private static View findCard(View item) {
        if (item.getClass().getName().endsWith("CardView")) return item;
        View card = find(item, "cardview");
        return card != null && card.getClass().getName().endsWith("CardView") ? card : null;
    }

    private static final Map<String, Field> CONSTRAINTS = new HashMap<>();
    private static final Set<String> NO_CONSTRAINT = new HashSet<>();

    /**
     * Joey's ConstraintLayout.LayoutParams has minified field names. The plain name is tried
     * first, then the minified one. Both are found once per class instead of on every bind.
     */
    private static Field constraintField(ViewGroup.LayoutParams lp, String name) {
        String key = lp.getClass().getName() + "#" + name;
        Field cached = CONSTRAINTS.get(key);
        if (cached != null || NO_CONSTRAINT.contains(key)) return cached;
        Field found = null;
        try {
            found = lp.getClass().getField(name);
        } catch (Throwable ignored) {
        }
        if (found == null && "androidx.constraintlayout.widget.ConstraintLayout$LayoutParams".equals(lp.getClass().getName())) {
            for (int i = 0; i < CONSTRAINT_NAMES.length; i++) {
                if (!CONSTRAINT_NAMES[i].equals(name)) continue;
                try {
                    Field target = lp.getClass().getField(CONSTRAINT_FIELDS[i]);
                    if (target.getType() == int.class) found = target;
                } catch (Throwable t) {
                    Log.e(TAG, "constraint " + name, t);
                }
                break;
            }
        }
        if (found == null) NO_CONSTRAINT.add(key);
        else CONSTRAINTS.put(key, found);
        return found;
    }

    /** Sets one constraint and says whether it changed. */
    private static boolean setConstraint(ViewGroup.LayoutParams lp, String field, int value) {
        if (lp == null) return false;
        Field target = constraintField(lp, field);
        if (target == null) return false;
        try {
            if (target.getInt(lp) == value) return false;
            target.setInt(lp, value);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static int getConstraint(ViewGroup.LayoutParams lp, String field) {
        if (lp == null) return -1;
        Field target = constraintField(lp, field);
        if (target == null) return -1;
        try {
            return target.getInt(lp);
        } catch (Throwable t) {
            return -1;
        }
    }

    private static final Map<String, Method> METHODS = new HashMap<>();

    private static void invoke(Object target, String name, Object arg) {
        try {
            Class<?> type = arg instanceof Float ? float.class
                    : arg instanceof Boolean ? boolean.class
                    : arg instanceof Integer ? int.class : arg.getClass();
            String key = target.getClass().getName() + "#" + name + "#" + type.getName();
            Method method = METHODS.get(key);
            if (method == null) {
                method = target.getClass().getMethod(name, type);
                METHODS.put(key, method);
            }
            method.invoke(target, arg);
        } catch (Throwable ignored) {
        }
    }

    private static final Map<String, Field> FIELDS = new HashMap<>();
    private static final Set<String> NO_FIELD = new HashSet<>();

    /**
     * Runs several times per bind. The old walk threw an exception for every superclass it
     * passed, so each field is now found once per class and kept.
     */
    private static Object field(Object target, String name) {
        if (target == null) return null;
        String key = target.getClass().getName() + "#" + name;
        Field found = FIELDS.get(key);
        if (found == null) {
            if (NO_FIELD.contains(key)) return null;
            Class<?> type = target.getClass();
            while (type != null && found == null) {
                try {
                    found = type.getDeclaredField(name);
                    found.setAccessible(true);
                } catch (NoSuchFieldException ignored) {
                    type = type.getSuperclass();
                } catch (Throwable t) {
                    break;
                }
            }
            if (found == null) {
                NO_FIELD.add(key);
                return null;
            }
            FIELDS.put(key, found);
        }
        try {
            return found.get(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object call(Object target, String name) {
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static int jsonInt(Object node, String key) {
        return (int) jsonDouble(node, key);
    }

    private static double jsonDouble(Object node, String key) {
        Object value = json(node, key);
        if (value == null) return 0;
        try {
            Object number = value.getClass().getMethod("asDouble").invoke(value);
            return number instanceof Double ? (Double) number : 0;
        } catch (Throwable t) {
            return 0;
        }
    }

    private static Object json(Object node, String key) {
        try {
            return node.getClass().getMethod("get", String.class).invoke(node, key);
        } catch (Throwable t) {
            return null;
        }
    }

    private static boolean truth(Object target, String name) {
        try {
            Object value = target.getClass().getMethod(name).invoke(target);
            return value instanceof Boolean && (Boolean) value;
        } catch (Throwable t) {
            return false;
        }
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
