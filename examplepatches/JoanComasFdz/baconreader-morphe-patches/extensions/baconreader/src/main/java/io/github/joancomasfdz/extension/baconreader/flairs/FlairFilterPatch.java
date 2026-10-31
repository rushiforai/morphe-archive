// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.flairs;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.onelouder.baconreader.connectivity.Tasks;
import com.onelouder.baconreader.reddit.LinkFlair;
import com.onelouder.baconreader.reddit.RedditApi;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import io.github.joancomasfdz.extension.baconreader.errors.ErrorDialog;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * <p>
 * A "Flair" control in the sort bar of the post list. The selected flairs are applied as a Reddit search in the
 * subreddit (flair_name:"A" OR flair_name:"B"), which the app already loads like any listing when its LinksetKey
 * has a query.
 */
@SuppressWarnings("unused")
public final class FlairFilterPatch {
    private static final String CONTROL_TAG = "revanced_flair_filter";

    /** Subreddit (lower case) -> flairs seen in loaded posts, in order of appearance. */
    private static final Map<String, Set<String>> SEEN_FLAIRS = new HashMap<>();
    /** Subreddit (lower case) -> flairs from api/link_flair. */
    private static final Map<String, List<String>> API_FLAIRS = new HashMap<>();
    /** The queries this patch built -> their flairs. */
    private static final Map<String, List<String>> QUERY_FLAIRS = new HashMap<>();

    private FlairFilterPatch() {
    }

    // region Hooks

    /** Injected at the start of LinksetManager.addToLinkset(LinksetKey, Listing, int, long). */
    public static void onListingLoaded(Object linksetKey, Object listing) {
        try {
            Class<?> linkClass = Class.forName("com.onelouder.baconreader.reddit.Link");
            List<?> links = (List<?>) listing.getClass().getMethod("getChildren", Class.class).invoke(listing, linkClass);
            if (links == null) return;
            Field subredditField = linkClass.getField("subreddit");
            Field flairField = linkClass.getField("link_flair_text");
            synchronized (SEEN_FLAIRS) {
                for (Object link : links) {
                    String subreddit = (String) subredditField.get(link);
                    String flair = clean((String) flairField.get(link));
                    if (subreddit == null || flair == null) continue;
                    Set<String> flairs = SEEN_FLAIRS.get(key(subreddit));
                    if (flairs == null) {
                        flairs = new LinkedHashSet<>();
                        SEEN_FLAIRS.put(key(subreddit), flairs);
                    }
                    flairs.add(flair);
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read the flairs of the loaded posts", ex);
        }
    }

    /** Injected at the start of MainActivity.openLinkset(): a feed is opened, also with another sort or filter. */
    public static void onOpenLinkset(final Activity activity) {
        try {
            TextView control = control(activity);
            if (control == null) return;
            Object linksetKey = linksetKey(activity);
            String subreddit = subreddit(linksetKey);
            if (subreddit == null) {
                control.setVisibility(View.GONE);
                return;
            }
            control.setVisibility(View.VISIBLE);
            List<String> selected = selected(linksetKey);
            int textColor = textColor(activity);
            if (selected.isEmpty()) {
                control.setText(str("revanced_flair_filter_button"));
                control.setTextColor(textColor);
            } else {
                control.setText(TextUtils.join(", ", selected));
                control.setTextColor(accentColor(activity, textColor));
            }
            for (Drawable drawable : control.getCompoundDrawablesRelative()) {
                if (drawable != null) drawable.setTintList(ColorStateList.valueOf(control.getCurrentTextColor()));
            }
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not update the flair filter", ex);
        }
    }

    // endregion

    // region Control

    /** The control, added to the sort bar the first time. */
    private static TextView control(final Activity activity) {
        View sortLayout = activity.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "sortLayout"));
        if (!(sortLayout instanceof RelativeLayout)) return null;
        RelativeLayout bar = (RelativeLayout) sortLayout;
        View existing = bar.findViewWithTag(CONTROL_TAG);
        if (existing instanceof TextView) return (TextView) existing;

        TextView sortTitle = activity.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "sortTitle"));
        final TextView control = new TextView(activity);
        control.setTag(CONTROL_TAG);
        control.setId(View.generateViewId());
        // Same text as the sort title ("What's hot"): size, color and font of the app's theme.
        if (sortTitle != null) {
            control.setTextSize(TypedValue.COMPLEX_UNIT_PX, sortTitle.getTextSize());
            control.setTextColor(sortTitle.getTextColors());
            control.setTypeface(sortTitle.getTypeface());
        }
        control.setSingleLine(true);
        control.setEllipsize(TextUtils.TruncateAt.END);
        control.setMaxWidth(activity.getResources().getDisplayMetrics().widthPixels * 2 / 5);
        control.setGravity(Gravity.CENTER_VERTICAL);
        int padding = dp(activity, 12);
        control.setPadding(padding, 0, dp(activity, 4), 0);
        Drawable arrow = themeDrawable(activity, "ic_arrow_dropdown");
        if (arrow != null) {
            int size = Math.round(control.getTextSize() * 1.4f);
            arrow.setBounds(0, 0, size, size);
            control.setCompoundDrawablesRelative(null, null, arrow, null);
        }
        control.setBackground(themeDrawable(activity, android.R.attr.selectableItemBackground));
        control.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showDialog(activity);
            }
        });

        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.MATCH_PARENT);
        params.addRule(RelativeLayout.ALIGN_PARENT_END);
        // Left of the sort icon (16dp margin + 24dp icon).
        params.setMarginEnd(dp(activity, 48));
        bar.addView(control, params);

        // The sort title ends where the control starts.
        if (sortTitle != null) {
            sortTitle.setSingleLine(true);
            sortTitle.setEllipsize(TextUtils.TruncateAt.END);
            RelativeLayout.LayoutParams titleParams = (RelativeLayout.LayoutParams) sortTitle.getLayoutParams();
            titleParams.addRule(RelativeLayout.START_OF, control.getId());
            sortTitle.setLayoutParams(titleParams);
        }
        return control;
    }

    // endregion

    // region Dialog

    private static void showDialog(final Activity activity) {
        try {
            final Object linksetKey = linksetKey(activity);
            final String subreddit = subreddit(linksetKey);
            if (subreddit == null) return;
            synchronized (API_FLAIRS) {
                if (API_FLAIRS.containsKey(key(subreddit))) {
                    showDialog(activity, linksetKey, subreddit);
                    return;
                }
            }
            RedditApi.getLinkFlairs(activity, subreddit, new Tasks.OnCompleteListener<List<LinkFlair>>() {
                @Override
                public void onComplete(List<LinkFlair> flairs) {
                    List<String> names = new ArrayList<>();
                    if (flairs != null) {
                        for (LinkFlair flair : flairs) {
                            String name = clean(flair.text);
                            if (name != null && !names.contains(name)) names.add(name);
                        }
                    }
                    done(names);
                }

                @Override
                public void onCancel(String error) {
                    // Only subreddits that let users choose their flair list them: use the flairs seen in posts.
                    Logger.printInfo(() -> "api/link_flair failed for " + subreddit + ": " + error);
                    done(Collections.<String>emptyList());
                }

                private void done(List<String> names) {
                    synchronized (API_FLAIRS) {
                        API_FLAIRS.put(key(subreddit), names);
                    }
                    Utils.runOnMainThread(() -> {
                        try {
                            if (!activity.isFinishing()) showDialog(activity, linksetKey, subreddit);
                        } catch (Exception ex) {
                            ErrorDialog.printException(() -> "Could not show the flair filter", ex);
                        }
                    });
                }
            });
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not show the flair filter", ex);
        }
    }

    private static void showDialog(final Activity activity, final Object linksetKey, String subreddit) throws Exception {
        final List<String> selected = selected(linksetKey);
        final List<String> flairs = new ArrayList<>(selected);
        synchronized (API_FLAIRS) {
            List<String> api = API_FLAIRS.get(key(subreddit));
            if (api != null) for (String flair : api) if (!flairs.contains(flair)) flairs.add(flair);
        }
        synchronized (SEEN_FLAIRS) {
            Set<String> seen = SEEN_FLAIRS.get(key(subreddit));
            if (seen != null) for (String flair : seen) if (!flairs.contains(flair)) flairs.add(flair);
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(activity)
                .setTitle(str("revanced_flair_filter_title"));
        if (flairs.isEmpty()) {
            builder.setMessage(str("revanced_flair_filter_empty"))
                    .setPositiveButton(android.R.string.ok, null)
                    .show();
            return;
        }

        final boolean[] checked = new boolean[flairs.size()];
        for (int i = 0; i < flairs.size(); i++) checked[i] = selected.contains(flairs.get(i));
        builder.setMultiChoiceItems(flairs.toArray(new CharSequence[0]), checked, (dialog, which, isChecked) -> checked[which] = isChecked)
                .setPositiveButton(str("revanced_flair_filter_apply"), (dialog, which) -> {
                    List<String> chosen = new ArrayList<>();
                    for (int i = 0; i < flairs.size(); i++) if (checked[i]) chosen.add(flairs.get(i));
                    apply(activity, chosen);
                })
                .setNeutralButton(str("revanced_flair_filter_clear"), (dialog, which) -> apply(activity, Collections.<String>emptyList()))
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    // endregion

    // region Filter

    /** Opens the feed again with the flair search, or without it when nothing is chosen. */
    private static void apply(Activity activity, List<String> flairs) {
        try {
            Object linksetKey = linksetKey(activity);
            if (linksetKey == null) return;
            if (flairs.equals(selected(linksetKey))) return;

            String query = null;
            String sort = (String) field(linksetKey, "sort");
            if (!flairs.isEmpty()) {
                StringBuilder builder = new StringBuilder();
                for (String flair : flairs) {
                    if (builder.length() > 0) builder.append(" OR ");
                    builder.append("flair_name:\"").append(flair.replace("\"", "")).append('"');
                }
                query = builder.toString();
                synchronized (QUERY_FLAIRS) {
                    QUERY_FLAIRS.put(query, new ArrayList<>(flairs));
                }
                // Search has no "best" (null) sort: use hot.
                if (sort == null) sort = "hot";
            }

            Class<?> keyClass = linksetKey.getClass();
            Class<?> redditIdClass = Class.forName("com.onelouder.baconreader.data.RedditId");
            Constructor<?> constructor = keyClass.getConstructor(redditIdClass, String.class, String.class, String.class);
            Object newKey = constructor.newInstance(field(linksetKey, "redditId"), sort, field(linksetKey, "sortTime"), query);

            declaredField(activity.getClass(), "linksetKey").set(activity, newKey);
            declaredMethod(activity.getClass(), "openLinkset").invoke(activity);
        } catch (Exception ex) {
            ErrorDialog.printException(() -> "Could not apply the flair filter", ex);
        }
    }

    /** The flairs of the feed's query, if this patch built it. */
    private static List<String> selected(Object linksetKey) throws Exception {
        String query = linksetKey == null ? null : (String) field(linksetKey, "query");
        if (query == null) return new ArrayList<>();
        synchronized (QUERY_FLAIRS) {
            List<String> flairs = QUERY_FLAIRS.get(query);
            return flairs == null ? new ArrayList<>() : new ArrayList<>(flairs);
        }
    }

    // endregion

    // region Helpers

    private static Object linksetKey(Activity activity) throws Exception {
        return declaredField(activity.getClass(), "linksetKey").get(activity);
    }

    /** A field declared by the class or one of its superclasses (MainActivity has subclasses). */
    private static Field declaredField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Method declaredMethod(Class<?> type, String name) throws NoSuchMethodException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                Method method = current.getDeclaredMethod(name);
                method.setAccessible(true);
                return method;
            } catch (NoSuchMethodException ignored) {
            }
        }
        throw new NoSuchMethodException(name);
    }

    /** The subreddit of the feed, or null for Front Page, All, Popular, Friends and multireddits. */
    private static String subreddit(Object linksetKey) throws Exception {
        if (linksetKey == null) return null;
        Object redditId = field(linksetKey, "redditId");
        if (redditId == null) return null;
        if (!Boolean.TRUE.equals(redditId.getClass().getMethod("isPureSubreddit").invoke(redditId))) return null;
        String name = (String) redditId.getClass().getMethod("getName").invoke(redditId);
        if (name == null || "popular".equalsIgnoreCase(name)) return null;
        return name;
    }

    private static Object field(Object target, String name) throws Exception {
        return target.getClass().getField(name).get(target);
    }

    private static String key(String subreddit) {
        return subreddit.toLowerCase(Locale.ROOT);
    }

    private static String clean(String flair) {
        if (flair == null) return null;
        String trimmed = flair.trim();
        return trimmed.isEmpty() ? null : trimmed;
    }

    private static int textColor(Activity activity) {
        TextView sortTitle = activity.findViewById(ResourceUtils.getIdentifier(ResourceType.ID, "sortTitle"));
        return sortTitle != null ? sortTitle.getCurrentTextColor() : 0xFF888888;
    }

    private static int accentColor(Activity activity, int fallback) {
        TypedArray array = activity.getTheme().obtainStyledAttributes(new int[]{android.R.attr.colorAccent});
        try {
            return array.getColor(0, fallback);
        } finally {
            array.recycle();
        }
    }

    private static Drawable themeDrawable(Activity activity, String attributeName) {
        int attribute = ResourceUtils.getIdentifier(ResourceType.ATTR, attributeName);
        return attribute == 0 ? null : themeDrawable(activity, attribute);
    }

    private static Drawable themeDrawable(Activity activity, int attribute) {
        TypedValue value = new TypedValue();
        if (!activity.getTheme().resolveAttribute(attribute, value, true) || value.resourceId == 0) return null;
        return activity.getDrawable(value.resourceId).mutate();
    }

    private static int dp(Activity activity, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                activity.getResources().getDisplayMetrics()));
    }

    // endregion
}
