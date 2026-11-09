package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.ImageSpan;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
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
    /** Joey's own order for the info line. */
    private static final String[][] DETAILS = {
            {"flair", "Flair and tags"},
            {"subreddit", "Subreddit"},
            {"author", "Author"},
            {"score", "Score"},
            {"comments", "Comments"},
            {"time", "Time"},
            {"domain", "Domain"},
            {"percent", "Upvote percentage"},
    };

    /** The star and download stay left of the gap. Votes stay on the right, beside the score. */
    private static final String[][] ACTIONS = {
            {"save", "Save"},
            {"download", "Download"},
            {"share_icon", "Share"},
            {"link_icon", "Link"},
            {"preview_icon", "Text preview"},
            {"reply", "Reply"},
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
            View view = find(item, def[0]);
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
            seatLeft(item);
        } catch (Throwable t) {
            Log.e(TAG, "apply", t);
        }
    }

    public static boolean offerLayout(Activity activity) {
        return activity != null && ModernUi.isModernUiEnabled(activity);
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
        MorpheDialog.choices(activity, "Image style",
                new String[]{"Full height image", "16:9 image", "Thumbnail"}, selected, index -> {
                    String name = index == 0 ? "FULL_HEIGHT" : index == 1 ? "_16_IS_TO_9" : "THUMBNAIL";
                    writeJoey("PREF_SUBMISSION_IMAGE_STYLE", name, "jc.k$b", "b");
                    if (subtitle != null) subtitle.setText(imageBlurb());
                    changed(activity);
                });
    }

    public static void showDetails(Activity activity) {
        showPlaces(activity, "Post details",
                "Drag the handle to change the order. Hide takes a detail off the line.",
                DETAILS, false, false, KEY_DETAIL_ORDER, KEY_DETAIL_PLACE, PostLayout::drawDetails);
    }

    public static void showActions(Activity activity) {
        showPlaces(activity, "Post bar",
                "Drag the handle to change the order. Hide takes an item off the bar. "
                        + "Download stays on the left, with the star. The votes stay on the right, beside the score.",
                ACTIONS, false, false, KEY_ACTION_ORDER, KEY_ACTION_PLACE, PostLayout::drawActions);
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
            if (place != null && modeOf(place, id) == HIDDEN) continue;
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
     * Moves save and download, in the saved order, to just before the gap.
     * Upvote and downvote go back beside the score, on the right.
     */
    private static void seatLeft(View item) {
        View barView = find(item, "actionbar_layout");
        if (!(barView instanceof ViewGroup)) return;
        ViewGroup bar = (ViewGroup) barView;
        View gap = spacer(bar);
        if (gap == null) return;
        List<String> order = barOrder(item.getContext());
        boolean chosen = prefs(item.getContext()).contains(KEY_ACTION_PLACE);
        JSONObject place = places(item.getContext(), KEY_ACTION_PLACE, ACTIONS);
        List<View> left = new ArrayList<>();
        for (String id : order) {
            if (!leftIcon(id)) continue;
            View view = actionView(item, id);
            if (view == null || view.getParent() != bar) continue;
            if (chosen && modeOf(place, id) == HIDDEN) view.setVisibility(View.GONE);
            left.add(view);
        }
        int at = bar.indexOfChild(gap);
        boolean seated = at >= 0;
        for (View view : left) {
            if (bar.indexOfChild(view) != at) {
                seated = false;
                break;
            }
            at++;
        }
        if (!seated) {
            for (View view : left) bar.removeView(view);
            at = Math.max(0, bar.indexOfChild(gap));
            for (View view : left) {
                bar.addView(view, Math.min(at, bar.getChildCount()));
                at++;
            }
        }
        seatVotes(item, bar, chosen, place);
    }

    /** Upvote, the score, and downvote sit together on the right, as Joey lays them out. */
    private static void seatVotes(View item, ViewGroup bar, boolean chosen, JSONObject place) {
        View score = find(item, "score");
        View up = find(item, "upvote");
        View down = find(item, "downvote");
        showVote(up, "upvote", chosen, place);
        showVote(down, "downvote", chosen, place);
        if (score == null || score.getParent() != bar) return;
        if (up != null && up.getParent() == bar && up.getVisibility() != View.GONE) {
            bar.removeView(up);
            bar.addView(up, bar.indexOfChild(score));
        }
        if (down != null && down.getParent() == bar && down.getVisibility() != View.GONE) {
            bar.removeView(down);
            bar.addView(down, Math.min(bar.indexOfChild(score) + 1, bar.getChildCount()));
        }
    }

    private static void showVote(View view, String id, boolean chosen, JSONObject place) {
        if (view == null || !chosen) return;
        view.setVisibility(modeOf(place, id) == HIDDEN ? View.GONE : View.VISIBLE);
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
            if (!joeyFlag("za.a", "e")) put(place, "save", HIDDEN);
            if (!joeyShareAction()) put(place, "share_icon", HIDDEN);
        } else {
            put(place, "score", HIDDEN);
            put(place, "comments", HIDDEN);
            if (joeyOption("v0")) put(place, "domain", HIDDEN);
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
            template.setBackgroundColor(palette.canvas);
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
        rule.setVisibility(View.VISIBLE);
        rule.setAlpha(1f);
        rule.setBackgroundColor(color);
        ViewGroup.LayoutParams lp = rule.getLayoutParams();
        if (lp != null && lp.height != 1) {
            lp.height = 1;
            rule.setLayoutParams(lp);
        }
    }

    /** The picture is the only raised surface. Full-height, 16:9 and thumbnail all use these views. */
    private static void plate(View item, int color) {
        View thumb = find(item, "thumbnail");
        if (thumb != null && thumb.getVisibility() == View.VISIBLE) thumb.setBackgroundColor(color);
        View preview = find(item, "previewImage");
        if (preview != null && preview.getVisibility() == View.VISIBLE) preview.setBackgroundColor(color);
    }

    /**
     * Joey pads its thumbnail inside the slot and centres it on the whole row.
     * Here the padding becomes picture, it sits level with the title, and the
     * action bar runs the full width underneath.
     */
    private static void placeThumbnail(View item) {
        if (!"THUMBNAIL".equals(imageName())) return;
        View thumb = find(item, "thumbnail");
        View title = find(item, "titleTextView");
        View bar = find(item, "actionbar_layout");
        if (thumb == null || title == null || thumb.getVisibility() == View.GONE) return;
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
        lp.width = size;
        lp.height = size;
        setConstraint(lp, "topToTop", title.getId());
        setConstraint(lp, "topToBottom", -1);
        setConstraint(lp, "bottomToBottom", -1);
        setConstraint(lp, "bottomToTop", -1);
        setConstraint(lp, "rightToRight", 0);
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) lp;
            mlp.rightMargin = Math.round((roomy ? 12 : 10) * density);
            mlp.topMargin = title.getLayoutParams() instanceof ViewGroup.MarginLayoutParams
                    ? ((ViewGroup.MarginLayoutParams) title.getLayoutParams()).topMargin + Math.round(2 * density) : 0;
            mlp.bottomMargin = 0;
        }
        thumb.setLayoutParams(lp);
        try {
            thumb.getClass().getMethod("setCornerRadius", float.class).invoke(thumb, 10f * density);
        } catch (Throwable ignored) {
        }
        if (bar == null) return;
        ViewGroup.LayoutParams barLp = bar.getLayoutParams();
        setConstraint(barLp, "rightToLeft", -1);
        setConstraint(barLp, "rightToRight", 0);
        bar.setLayoutParams(barLp);
        int baseKey = id(item, "filler_view");
        if (baseKey == 0 || !(barLp instanceof ViewGroup.MarginLayoutParams)) return;
        if (!(bar.getTag(baseKey) instanceof Integer)) {
            bar.setTag(baseKey, ((ViewGroup.MarginLayoutParams) barLp).topMargin);
            int gap = Math.round(4 * density);
            bar.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, orr, ob) -> clearThumbnail(bar, thumb, baseKey, gap));
        }
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
        if (thumb.getVisibility() != View.GONE && "THUMBNAIL".equals(imageName())) {
            need = Math.max(0, thumb.getBottom() + gap - (bar.getTop() - extra));
        }
        if (need == extra) return;
        mlp.topMargin = base + need;
        bar.post(() -> bar.setLayoutParams(mlp));
    }

    private static void ensureActionClicks(Object card, View item) {
        JSONObject place = places(item.getContext(), KEY_ACTION_PLACE, ACTIONS);
        if (place.optInt("save", HIDDEN) != HIDDEN) {
            try {
                Class<?> za = Class.forName("za.a");
                if (!za.getField("e").getBoolean(null)) {
                    SharedPreferences prefs = (SharedPreferences) za.getField("E").get(null);
                    if (prefs != null) prefs.edit().putBoolean("postSaveAsAction", true).apply();
                    za.getField("e").setBoolean(null, true);
                    invokeDeclared(card, "R");
                }
            } catch (Throwable ignored) {
            }
        }
        if (place.optInt("share_icon", HIDDEN) != HIDDEN) {
            try {
                Object options = Class.forName("mb.o").getMethod("i").invoke(null);
                SharedPreferences prefs = (SharedPreferences) field(options, "a");
                if (prefs != null && !prefs.getBoolean("PREF_SHOW_SHARE_AS_ACTION", false)) {
                    prefs.edit().putBoolean("PREF_SHOW_SHARE_AS_ACTION", true).commit();
                    invokeDeclared(card, "T");
                }
            } catch (Throwable ignored) {
            }
        }
    }

    private static void placeActions(View item) {
        View barView = find(item, "actionbar_layout");
        if (!(barView instanceof ViewGroup)) return;
        ViewGroup bar = (ViewGroup) barView;
        bar.setVisibility(View.VISIBLE);
        List<String> order = order(item.getContext(), KEY_ACTION_ORDER, ACTIONS);
        JSONObject place = places(item.getContext(), KEY_ACTION_PLACE, ACTIONS);
        List<View> moving = new ArrayList<>();
        try {
            for (String[] def : ACTIONS) {
                View view = actionView(item, def[0]);
                if (view == null) continue;
                if (view.getParent() == null) bar.addView(view);
                if ("more".equals(def[0])) continue;
                if (modeOf(place, def[0]) == HIDDEN) view.setVisibility(View.GONE);
            }
            List<String> leftIds = new ArrayList<>();
            List<String> rightIds = new ArrayList<>();
            sides(order, place, leftIds, rightIds);
            List<View> left = new ArrayList<>();
            List<View> right = new ArrayList<>();
            for (String id : leftIds) addAction(item, bar, id, left);
            for (String id : rightIds) addAction(item, bar, id, right);
            if (left.isEmpty() && right.isEmpty()) return;
            moving.addAll(left);
            moving.addAll(right);
            for (View view : moving) bar.removeView(view);
            View gap = spacer(bar);
            int at = gap == null ? 0 : Math.max(0, bar.indexOfChild(gap));
            for (View view : left) {
                bar.addView(view, Math.min(at, bar.getChildCount()));
                at++;
            }
            at = gap == null ? bar.getChildCount() : bar.indexOfChild(gap) + 1;
            if (at < 0) at = bar.getChildCount();
            for (View view : right) {
                bar.addView(view, Math.min(at, bar.getChildCount()));
                at++;
            }
            View more = find(item, "overflow_menu");
            if (more != null && more.getParent() == bar && modeOf(place, "more") != HIDDEN) {
                bar.removeView(more);
                bar.addView(more);
                more.setVisibility(View.VISIBLE);
            }
        } catch (Throwable t) {
            Log.e(TAG, "placeActions", t);
            for (View view : moving) {
                if (view.getParent() == null) bar.addView(view);
            }
        }
    }

    private static View actionView(View item, String id) {
        return "download".equals(id) ? MediaDownload.button(item) : find(item, id);
    }

    private static void addAction(View item, ViewGroup bar, String id, List<View> into) {
        View view = actionView(item, id);
        if (view == null) return;
        if (view.getParent() != bar) return;
        if ("download".equals(id) && view.getVisibility() != View.VISIBLE) return;
        view.setVisibility(View.VISIBLE);
        into.add(view);
    }

    /** Shown actions that do not fit the row move into the menu instead of wrapping over the next post. */
    private static void fitActions(View item, ViewGroup bar, List<View> left, List<View> right,
                                   List<View> overflow, int hidKey) {
        float density = item.getResources().getDisplayMetrics().density;
        int room = bar.getWidth();
        if (room <= 0 && item.getWidth() > 0) room = item.getWidth();
        if (room <= 0) room = item.getResources().getDisplayMetrics().widthPixels;
        int moreSlot = Math.round(48 * density);
        List<View> shown = new ArrayList<>();
        shown.addAll(left);
        shown.addAll(right);
        int total = 0;
        for (View view : shown) total += actionWidth(view, density);
        int limit = total + (overflow.isEmpty() ? 0 : moreSlot) <= room ? room : Math.max(moreSlot, room - moreSlot);
        int used = 0;
        Set<View> keep = new HashSet<>();
        for (View view : shown) {
            int width = actionWidth(view, density);
            if ("Download".contentEquals(view.getContentDescription())) {
                keep.add(view);
                used += width;
                continue;
            }
            if (!keep.isEmpty() && used + width > limit) overflow.add(view);
            else {
                keep.add(view);
                used += width;
            }
        }
        for (View view : overflow) {
            if (keep.contains(view)) continue;
            if (hidKey != 0 && !(view.getTag(hidKey) instanceof Integer)) view.setTag(hidKey, View.VISIBLE);
            view.setVisibility(View.GONE);
        }
        left.retainAll(keep);
        right.retainAll(keep);
    }

    private static int actionWidth(View view, float density) {
        if (view.getWidth() > 0) return view.getWidth();
        String name = "";
        if (view.getId() != View.NO_ID) {
            try {
                name = view.getResources().getResourceEntryName(view.getId());
            } catch (Throwable ignored) {
            }
        }
        return Math.round(("score".equals(name) ? 64 : 44) * density);
    }

    private static void wireOverflow(View item, View more, List<View> overflow, boolean moreWanted) {
        int key = id(item, "overflow_menu");
        Object current = clickListener(more);
        if (current instanceof View.OnClickListener && !(current instanceof OverflowClick) && key != 0) {
            more.setTag(key, current);
        }
        Object original = key == 0 ? null : more.getTag(key);
        View.OnClickListener sheet = original instanceof View.OnClickListener ? (View.OnClickListener) original : null;
        if (overflow.isEmpty()) {
            if (sheet != null) more.setOnClickListener(sheet);
            return;
        }
        more.setOnClickListener(new OverflowClick(overflow, moreWanted ? sheet : null));
    }

    private static final class OverflowClick implements View.OnClickListener {
        private final List<View> overflow;
        private final View.OnClickListener sheet;

        OverflowClick(List<View> overflow, View.OnClickListener sheet) {
            this.overflow = new ArrayList<>(overflow);
            this.sheet = sheet;
        }

        @Override
        public void onClick(View v) {
            Context context = v.getContext();
            if (!(context instanceof Activity)) {
                if (sheet != null) sheet.onClick(v);
                return;
            }
            Activity activity = (Activity) context;
            LinearLayout page = MorpheDialog.page(activity, "Post", null);
            AlertDialog[] shown = new AlertDialog[1];
            for (View action : overflow) {
                TextView row = MorpheDialog.action(activity, labelFor(action), MorpheDialog.TEXT);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setOnClickListener(click -> {
                    if (shown[0] != null) shown[0].dismiss();
                    action.performClick();
                });
                page.addView(row);
            }
            if (sheet != null) {
                TextView row = MorpheDialog.action(activity, "More actions", MorpheDialog.TEXT);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setOnClickListener(click -> {
                    if (shown[0] != null) shown[0].dismiss();
                    sheet.onClick(v);
                });
                page.addView(row);
            }
            TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
            cancel.setOnClickListener(click -> {
                if (shown[0] != null) shown[0].dismiss();
            });
            page.addView(MorpheDialog.actions(activity, cancel));
            shown[0] = MorpheDialog.show(activity, page);
        }
    }

    private static void placeDetails(Object card, View item) {
        View infoView = find(item, "submissionInfo");
        if (!(infoView instanceof TextView)) return;
        TextView info = (TextView) infoView;
        Object submission = field(card, "b");
        Object node = submission == null ? null : call(submission, "n");
        if (node == null) return;
        int memo = id(item, "submissionInfo");
        CharSequence original = info.getText();
        Object kept = memo == 0 ? null : info.getTag(memo);
        if (kept instanceof CharSequence[] && original != null
                && original.toString().equals(((CharSequence[]) kept)[0].toString())) {
            original = ((CharSequence[]) kept)[1];
        }
        List<String> order = order(item.getContext(), KEY_DETAIL_ORDER, DETAILS);
        JSONObject place = places(item.getContext(), KEY_DETAIL_PLACE, DETAILS);
        boolean roomy = findCard(item) != null;
        ModernUi.Palette palette = ModernUi.getPalette(item.getContext());
        String subreddit = jsonText(node, "subreddit");
        String author = jsonText(node, "author");
        String domain = jsonText(node, "domain");
        int score = jsonInt(node, "score");
        int comments = jsonInt(node, "num_comments");
        double ratio = jsonDouble(node, "upvote_ratio");
        long created = (long) jsonDouble(node, "created_utc");
        CharSequence tags = place.optInt("flair", HIDDEN) == SHOWN ? tags(submission, info) : null;

        SpannableStringBuilder line = new SpannableStringBuilder();
        if (tags != null && tags.length() > 0) {
            line.append(tags);
            line.append(roomy ? "\n" : "  ");
        }
        int lineStart = line.length();
        String previous = "";
        for (String key : order) {
            if ("flair".equals(key) || place.optInt(key, HIDDEN) != SHOWN) continue;
            String piece = piece(key, subreddit, author, domain, score, comments, ratio, created);
            if (piece == null || piece.isEmpty()) continue;
            if (line.length() > lineStart) {
                line.append(roomy && "subreddit".equals(previous) ? "\n" : "  ·  ");
            }
            int start = line.length();
            if ("subreddit".equals(key)) {
                appendIcon(line, original);
                start = line.length();
            }
            line.append(piece);
            copyClicks(original, piece, line, start);
            if ("subreddit".equals(key)) {
                line.setSpan(new ForegroundColorSpan(palette.accent), start, line.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            } else if ("author".equals(key)) {
                line.setSpan(new ForegroundColorSpan(palette.onSurface), start, line.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            }
            previous = key;
        }
        while (line.length() > 0 && line.charAt(line.length() - 1) == '\n') line.delete(line.length() - 1, line.length());
        info.setText(line, TextView.BufferType.SPANNABLE);
        if (memo != 0) info.setTag(memo, new CharSequence[]{line.toString(), original});
        info.setTextColor(palette.onSurfaceVariant);
        info.setVisibility(line.length() == 0 ? View.GONE : View.VISIBLE);
    }

    private static CharSequence tags(Object submission, View view) {
        try {
            Class<?> type = Class.forName("ud.a");
            for (Method method : type.getDeclaredMethods()) {
                Class<?>[] params = method.getParameterTypes();
                if ("a".equals(method.getName()) && params.length == 2 && params[1] == View.class) {
                    method.setAccessible(true);
                    Object result = method.invoke(null, submission, view);
                    return result instanceof CharSequence ? (CharSequence) result : null;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void appendIcon(SpannableStringBuilder line, CharSequence original) {
        if (!(original instanceof Spanned)) return;
        Spanned spanned = (Spanned) original;
        String raw = original.toString();
        int newline = raw.indexOf('\n');
        int from = newline < 0 ? 0 : newline + 1;
        ImageSpan[] images = spanned.getSpans(from, Math.min(spanned.length(), from + 4), ImageSpan.class);
        for (ImageSpan image : images) {
            int start = spanned.getSpanStart(image);
            int end = spanned.getSpanEnd(image);
            if (start < 0 || end <= start) continue;
            int at = line.length();
            line.append(original.subSequence(start, end).toString());
            line.setSpan(image, at, line.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            line.append(' ');
            return;
        }
    }

    private static void copyClicks(CharSequence original, String piece, SpannableStringBuilder line, int start) {
        if (!(original instanceof Spanned) || piece == null || piece.isEmpty()) return;
        int at = original.toString().indexOf(piece);
        if (at < 0) return;
        Spanned spanned = (Spanned) original;
        ClickableSpan[] spans = spanned.getSpans(at, at + piece.length(), ClickableSpan.class);
        for (ClickableSpan span : spans) {
            line.setSpan(new ClickableSpan() {
                @Override
                public void onClick(View widget) {
                    span.onClick(widget);
                }

                @Override
                public void updateDrawState(TextPaint ds) {
                    span.updateDrawState(ds);
                }
            }, start, start + piece.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
    }

    private static String piece(String key, String subreddit, String author, String domain,
                                int score, int comments, double ratio, long created) {
        if ("subreddit".equals(key)) return subreddit;
        if ("time".equals(key)) return created > 0 ? age(created) : "";
        if ("score".equals(key)) return compact(score) + " points";
        if ("comments".equals(key)) return compact(comments) + " comments";
        if ("author".equals(key)) return author;
        if ("domain".equals(key)) return domain;
        if ("percent".equals(key) && ratio > 0) return Math.round(ratio * 100) + "%";
        return "";
    }

    private static String age(long createdUtc) {
        long seconds = Math.max(0, System.currentTimeMillis() / 1000L - createdUtc);
        if (seconds < 60) return seconds + "s";
        if (seconds < 3600) return seconds / 60 + "m";
        if (seconds < 86400) return seconds / 3600 + "h";
        if (seconds < 86400L * 7) return seconds / 86400 + "d";
        if (seconds < 86400L * 30) return seconds / (86400L * 7) + "w";
        if (seconds < 86400L * 365) return seconds / (86400L * 30) + "mo";
        return seconds / (86400L * 365) + "y";
    }

    private static String compact(int n) {
        int value = Math.abs(n);
        String sign = n < 0 ? "-" : "";
        if (value < 1000) return sign + value;
        if (value < 10000) return sign + (value / 1000) + "." + ((value % 1000) / 100) + "k";
        if (value < 1000000) return sign + (value / 1000) + "k";
        return sign + (value / 1000000) + "." + ((value % 1000000) / 100000) + "m";
    }

    private interface Strip {
        void draw(Activity activity, LinearLayout host, int slots, List<String> order, JSONObject place);
    }

    private static void showPlaces(Activity activity, String title, String info,
                                   String[][] items, boolean allowOverflow, boolean screenSize,
                                   String orderKey, String placeKey, Strip strip) {
        List<String> order = new ArrayList<>(items == ACTIONS ? barOrder(activity) : order(activity, orderKey, items));
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
        rebuild[0] = () -> {
            rows.removeAllViews();
            Set<String> onBar = new HashSet<>();
            List<String> visible = new ArrayList<>();
            for (String id : order) {
                if (findDef(items, id) == null) continue;
                visible.add(id);
                if (modeOf(place, id) == SHOWN) onBar.add(id);
            }
            for (String id : visible) {
                String[] def = findDef(items, id);
                boolean bar = onBar.contains(id);
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
                if (allowOverflow && canMenu) {
                    TextView overflow = MorpheDialog.action(activity, "Overflow", MorpheDialog.TEXT);
                    MorpheDialog.setFilled(activity, overflow, !bar);
                    overflow.setOnClickListener(v -> {
                        boolean nextBar = modeOf(place, id) != SHOWN;
                        put(place, id, nextBar ? SHOWN : OVERFLOW);
                        if (nextBar) onBar.add(id);
                        else onBar.remove(id);
                        savePlaces(activity, placeKey, place);
                        saveOrder(activity, orderKey, order);
                        rebuild[0].run();
                        refreshFeed(activity);
                    });
                    LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    gap.leftMargin = Math.round(12 * activity.getResources().getDisplayMetrics().density);
                    line.addView(overflow, gap);
                } else if (!allowOverflow) {
                    TextView hide = MorpheDialog.action(activity, "Hide", MorpheDialog.TEXT);
                    MorpheDialog.setFilled(activity, hide, !bar);
                    hide.setOnClickListener(v -> {
                        boolean nextBar = modeOf(place, id) != SHOWN;
                        put(place, id, nextBar ? SHOWN : HIDDEN);
                        if (nextBar) onBar.add(id);
                        else onBar.remove(id);
                        savePlaces(activity, placeKey, place);
                        saveOrder(activity, orderKey, order);
                        rebuild[0].run();
                        refreshFeed(activity);
                    });
                    LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    gap.leftMargin = Math.round(12 * activity.getResources().getDisplayMetrics().density);
                    line.addView(hide, gap);
                }
                line.addView(DragOrder.handle(activity, rows, (from, to) -> {
                    if (from < 0 || to < 0 || from >= rows.getChildCount() || to >= rows.getChildCount()) return false;
                    String fromId = String.valueOf(rows.getChildAt(from).getTag());
                    String toId = String.valueOf(rows.getChildAt(to).getTag());
                    if (items == ACTIONS && leftIcon(fromId) != leftIcon(toId)) return false;
                    int ia = order.indexOf(fromId);
                    int ib = order.indexOf(toId);
                    if (ia < 0 || ib < 0) return false;
                    Collections.swap(order, ia, ib);
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

    private static boolean canNudge(List<String> sequence, String id, Set<String> onBar, int dir) {
        int index = sequence.indexOf(id);
        int next = index + dir;
        if (index < 0 || next < 0 || next >= sequence.size()) return false;
        return onBar.contains(id) == onBar.contains(sequence.get(next));
    }

    private static int pinMode(int mode) {
        if (mode == SHOWN) return 2;
        if (mode == OVERFLOW) return 1;
        return 0;
    }

    private static void drawDetails(Activity activity, LinearLayout host, int slots,
                                    List<String> order, JSONObject place) {
        float density = activity.getResources().getDisplayMetrics().density;
        int text = MorpheDialog.text(activity);
        int sub = MorpheDialog.sub(activity);
        TextView title = new TextView(activity);
        title.setText("me_irl");
        title.setTextColor(text);
        title.setTextSize(16);
        title.setPadding(Math.round(16 * density), Math.round(14 * density), Math.round(16 * density), 0);
        host.addView(title);
        SpannableStringBuilder rich = new SpannableStringBuilder();
        for (String id : order) {
            if (modeOf(place, id) == HIDDEN) continue;
            if (rich.length() > 0) rich.append("  ·  ");
            int start = rich.length();
            rich.append(sampleDetail(id));
            int color = "subreddit".equals(id) ? MorpheDialog.accent(activity) : sub;
            rich.setSpan(new ForegroundColorSpan(color), start, rich.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
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

    private static String sampleDetail(String id) {
        if ("flair".equals(id)) return "politics";
        if ("subreddit".equals(id)) return "me_irl";
        if ("author".equals(id)) return "keyholepossums";
        if ("score".equals(id)) return "14k points";
        if ("comments".equals(id)) return "403 comments";
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
        if (modeOf(place, "more") != HIDDEN) {
            bar.addView(BarPreview.icon(activity, "abc_ic_menu_overflow_material", text, 24));
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

    private static String actionDrawable(String id) {
        if ("save".equals(id)) return "star";
        if ("share_icon".equals(id)) return "share";
        if ("link_icon".equals(id)) return "link";
        if ("reply".equals(id)) return "comment_right_arrow_outline";
        if ("hide_icon".equals(id)) return "comment_eye_outline_png";
        if ("upvote".equals(id)) return "upvote_arrow_outline";
        if ("downvote".equals(id)) return "downvote_arrow_outline";
        return null;
    }

    private static String labelOf(String id) {
        String[] def = findDef(ACTIONS, id);
        return def == null ? id : def[1];
    }

    private static String glyph(String id) {
        if ("save".equals(id)) return "☆";
        if ("share_icon".equals(id)) return "↗";
        if ("link_icon".equals(id)) return "⧉";
        if ("download".equals(id)) return "↓";
        if ("preview_icon".equals(id)) return "Aa";
        if ("reply".equals(id)) return "↩";
        if ("hide_icon".equals(id)) return "—";
        if ("commentsTextView".equals(id)) return "403";
        if ("upvote".equals(id)) return "↑";
        if ("score".equals(id)) return "14k";
        if ("downvote".equals(id)) return "↓";
        return "•";
    }

    private static int modeOf(JSONObject place, String id) {
        int mode = place.optInt(id, HIDDEN);
        if (mode == OVERFLOW && ("more".equals(id) || "score".equals(id))) return SHOWN;
        if (mode != SHOWN && mode != OVERFLOW) return HIDDEN;
        return mode;
    }

    private static int nextPlace(int current, boolean allowOverflow) {
        if (!allowOverflow) return current == SHOWN ? HIDDEN : SHOWN;
        if (current == SHOWN) return OVERFLOW;
        if (current == OVERFLOW) return HIDDEN;
        return SHOWN;
    }

    private static TextView arrow(Activity activity, String symbol, boolean enabled, int accent, int sub) {
        float density = activity.getResources().getDisplayMetrics().density;
        TextView button = new TextView(activity);
        button.setText(symbol);
        button.setTextSize(16);
        button.setTextColor(enabled ? accent : sub);
        button.setAlpha(enabled ? 1f : 0.3f);
        button.setGravity(Gravity.CENTER);
        int padH = Math.round(12 * density);
        int padV = Math.round(8 * density);
        button.setPadding(padH, padV, padH, padV);
        button.setEnabled(enabled);
        return button;
    }

    private static String labelFor(View action) {
        String named = "Download".equals(action.getContentDescription()) ? "download" : resourceName(action);
        String[] def = findDef(ACTIONS, named);
        String label = def != null ? def[1] : "Action";
        if ("save".equals(resourceName(action)) && action.isSelected()) label = "Unsave";
        return label;
    }

    private static String resourceName(View view) {
        if (view.getId() == View.NO_ID) return "";
        try {
            return view.getResources().getResourceEntryName(view.getId());
        } catch (Throwable t) {
            return "";
        }
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

    private static String enumName(String field, String fallback) {
        try {
            Object value = Class.forName("za.a").getField(field).get(null);
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

    private static int id(View view, String name) {
        return view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
    }

    private static View findCard(View item) {
        if (item.getClass().getName().endsWith("CardView")) return item;
        View card = find(item, "cardview");
        return card != null && card.getClass().getName().endsWith("CardView") ? card : null;
    }

    private static void setConstraint(ViewGroup.LayoutParams lp, String field, int value) {
        if (lp == null) return;
        try {
            lp.getClass().getField(field).setInt(lp, value);
            return;
        } catch (Throwable ignored) {
        }
        if (!"androidx.constraintlayout.widget.ConstraintLayout$LayoutParams".equals(lp.getClass().getName())) return;
        for (int i = 0; i < CONSTRAINT_NAMES.length; i++) {
            if (!CONSTRAINT_NAMES[i].equals(field)) continue;
            try {
                Field target = lp.getClass().getField(CONSTRAINT_FIELDS[i]);
                if (target.getType() == int.class) target.setInt(lp, value);
            } catch (Throwable t) {
                Log.e(TAG, "constraint " + field, t);
            }
            return;
        }
    }

    private static void invoke(Object target, String name, Object arg) {
        try {
            Class<?> type = arg instanceof Float ? float.class
                    : arg instanceof Boolean ? boolean.class
                    : arg instanceof Integer ? int.class : arg.getClass();
            target.getClass().getMethod(name, type).invoke(target, arg);
        } catch (Throwable ignored) {
        }
    }

    private static void invokeDeclared(Object target, String name) {
        try {
            Method method = target.getClass().getDeclaredMethod(name);
            method.setAccessible(true);
            method.invoke(target);
        } catch (Throwable ignored) {
        }
    }

    private static Object field(Object target, String name) {
        Class<?> type = target.getClass();
        while (type != null) {
            try {
                Field found = type.getDeclaredField(name);
                found.setAccessible(true);
                return found.get(target);
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    private static Object call(Object target, String name) {
        try {
            return target.getClass().getMethod(name).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object clickListener(View view) {
        try {
            Field info = View.class.getDeclaredField("mListenerInfo");
            info.setAccessible(true);
            Object holder = info.get(view);
            if (holder == null) return null;
            Field click = holder.getClass().getDeclaredField("mOnClickListener");
            click.setAccessible(true);
            return click.get(holder);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String jsonText(Object node, String key) {
        Object value = json(node, key);
        if (value == null || truth(value, "isNull") || truth(value, "isMissingNode")) return "";
        try {
            Object text = value.getClass().getMethod("asText").invoke(value);
            return text == null || "null".equals(text) ? "" : text.toString();
        } catch (Throwable t) {
            return "";
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
