package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.json.JSONArray;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Adds a Subreddit suffix filter row in Settings -> Filters, checkboxes to toggle
 * individual subreddit/prefix/suffix filter entries without deleting them, and
 * quick-toggle checkboxes in the feed "Filter out following posts" popup.
 */
public final class SubredditFilters {
    private static final String FILTER_PREFS = "filter_prefs";
    private static final String SETTINGS_PREFS = "settings";
    private static final String KEY_SUBREDDIT_LIST = "PREF_SUBREDDIT_FILTER_LIST";
    private static final String KEY_PREFIX_LIST = "PREF_SUBREDDIT_PREFIX_FILTER_LIST";
    private static final String KEY_SUFFIX_LIST = "PREF_SUBREDDIT_SUFFIX_FILTER_LIST";

    private static final String KEY_SUBREDDIT_ENABLED = "PREF_FILTER_SUBREDDIT_ENABLED";
    private static final String KEY_PREFIX_ENABLED = "PREF_FILTER_SUBREDDIT_PREFIX_ENABLED";
    private static final String KEY_SUFFIX_ENABLED = "PREF_FILTER_SUBREDDIT_SUFFIX_ENABLED";

    private static final String SUFFIX_ROW_TAG = "subreddit_suffix_filter_row";
    private static final String SUFFIX_TITLE = "Subreddit suffix filter";
    private static final String SUFFIX_SUBTEXT = "Filter out posts with these subreddit suffixes";
    private static final String SUFFIX_HINT = "Add subreddit suffix to filter...";

    private static final int FALLBACK_ACCENT = 0xFFF0A202;

    private static final Set<List<String>> SUBREDDIT_FILTER_LISTS =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private static volatile List<String> cachedSuffixList;
    private static volatile List<String> activeSubredditList;
    private static volatile List<String> activePrefixList;

    private SubredditFilters() {
    }

    @SuppressWarnings("unchecked")
    public static void onFilterSettingsCreated(Activity activity) {
        try {
            List<String> suffixList = getSuffixFilterList(activity);
            SUBREDDIT_FILTER_LISTS.add(suffixList);

            Field s0Field = activity.getClass().getDeclaredField("S0");
            s0Field.setAccessible(true);
            Object s0 = s0Field.get(activity);
            if (s0 instanceof List) {
                activeSubredditList = (List<String>) s0;
                SUBREDDIT_FILTER_LISTS.add(activeSubredditList);
            }

            Field w0Field = activity.getClass().getDeclaredField("W0");
            w0Field.setAccessible(true);
            Object w0 = w0Field.get(activity);
            if (w0 instanceof List) {
                activePrefixList = (List<String>) w0;
                SUBREDDIT_FILTER_LISTS.add(activePrefixList);
            }

            attachSuffixFilterRow(activity, suffixList);
        } catch (Throwable ignored) {
        }
    }

    public static void onFilterSettingsPaused(Activity activity) {
        try {
            List<String> suffixList = cachedSuffixList;
            if (suffixList != null) {
                saveJsonList(filterPrefs(activity), KEY_SUFFIX_LIST, suffixList);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void attachSuffixFilterRow(Activity activity, List<String> suffixList) {
        int prefixId = activity.getResources().getIdentifier(
                "subreddit_prefix_filter_clickable", "id", activity.getPackageName());
        if (prefixId == 0) return;
        View prefixView = activity.findViewById(prefixId);
        if (!(prefixView instanceof ViewGroup) || !(prefixView.getParent() instanceof ViewGroup)) return;

        ViewGroup prefixRow = (ViewGroup) prefixView;
        ViewGroup parent = (ViewGroup) prefixView.getParent();
        if (parent.findViewWithTag(SUFFIX_ROW_TAG) != null) return;

        TextView titleSample = prefixRow.getChildCount() > 0 && prefixRow.getChildAt(0) instanceof TextView
                ? (TextView) prefixRow.getChildAt(0) : null;
        TextView subSample = prefixRow.getChildCount() > 1 && prefixRow.getChildAt(1) instanceof TextView
                ? (TextView) prefixRow.getChildAt(1) : null;

        LinearLayout row = new LinearLayout(activity);
        row.setTag(SUFFIX_ROW_TAG);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setLayoutParams(copyParams(prefixRow.getLayoutParams()));
        row.setPadding(prefixRow.getPaddingLeft(), prefixRow.getPaddingTop(),
                prefixRow.getPaddingRight(), prefixRow.getPaddingBottom());
        row.setMinimumHeight(prefixRow.getMinimumHeight());
        Drawable bg = prefixRow.getBackground();
        if (bg != null && bg.getConstantState() != null) {
            row.setBackground(bg.getConstantState().newDrawable(activity.getResources()).mutate());
        }
        row.setClickable(true);
        row.setFocusable(true);

        TextView title = new TextView(activity);
        title.setText(SUFFIX_TITLE);
        copyTextStyle(title, titleSample);
        row.addView(title);

        TextView subtitle = new TextView(activity);
        subtitle.setText(SUFFIX_SUBTEXT);
        copyTextStyle(subtitle, subSample);
        row.addView(subtitle);

        row.setOnClickListener(v -> openSuffixDialog(activity, suffixList));

        int index = parent.indexOfChild(prefixRow);
        parent.addView(row, index >= 0 ? index + 1 : parent.getChildCount());
    }

    private static void openSuffixDialog(Activity activity, List<String> suffixList) {
        try {
            SUBREDDIT_FILTER_LISTS.add(suffixList);
            Class<?> c1Class = Class.forName("zd.c1");
            Class<?> eInterface = Class.forName("zd.c1$e");
            Class<?> fInterface = Class.forName("zd.c1$f");
            Method showMethod = c1Class.getMethod("e",
                    Context.class, List.class, String.class, String.class,
                    eInterface, Integer.class, fInterface);
            showMethod.invoke(null, activity, suffixList, SUFFIX_TITLE, SUFFIX_HINT, null, null, null);
            notifyFiltersChanged(activity);
        } catch (Throwable ignored) {
        }
    }

    public static void decorateListRow(
            View row,
            List<String> list,
            String rawItem,
            LinearLayout container,
            Object clickCallback
    ) {
        try {
            if (clickCallback != null || !(row instanceof LinearLayout) || list == null || rawItem == null) {
                return;
            }
            if (!isSubredditFilterList(list)) {
                return;
            }

            Context context = row.getContext();
            int nameId = context.getResources().getIdentifier("domain_name", "id", context.getPackageName());
            int removeId = context.getResources().getIdentifier("remove", "id", context.getPackageName());
            if (nameId == 0 || removeId == 0) return;

            View nameView = row.findViewById(nameId);
            View removeBtn = row.findViewById(removeId);
            if (!(nameView instanceof TextView) || removeBtn == null) return;

            TextView label = (TextView) nameView;
            boolean initialEnabled = !rawItem.startsWith("!");
            String cleanText = initialEnabled ? rawItem : rawItem.substring(1);
            if (cleanText.isEmpty()) return;

            final String[] currentRaw = {rawItem};

            label.setText(cleanText);
            updateLabelStyle(label, initialEnabled);

            CheckBox checkBox = new CheckBox(context);
            checkBox.setChecked(initialEnabled);
            int accent = resolveAccentColor(row);
            checkBox.setButtonTintList(ColorStateList.valueOf(accent));

            float density = context.getResources().getDisplayMetrics().density;
            LinearLayout.LayoutParams cbParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            cbParams.gravity = Gravity.CENTER_VERTICAL;
            cbParams.rightMargin = Math.round(8 * density);
            checkBox.setLayoutParams(cbParams);

            checkBox.setOnCheckedChangeListener((buttonView, isChecked) -> {
                String updated = isChecked ? cleanText : ("!" + cleanText);
                int idx = list.indexOf(currentRaw[0]);
                if (idx >= 0) {
                    list.set(idx, updated);
                }
                currentRaw[0] = updated;
                updateLabelStyle(label, isChecked);
                persistListChange(context, list);
            });

            LinearLayout rowLayout = (LinearLayout) row;
            rowLayout.addView(checkBox, 0);
            rowLayout.setOnClickListener(v -> checkBox.toggle());

            removeBtn.setOnClickListener(v -> {
                list.remove(currentRaw[0]);
                list.remove(cleanText);
                list.remove("!" + cleanText);
                if (container != null) {
                    container.removeView(row);
                }
                persistListChange(context, list);
            });
        } catch (Throwable ignored) {
        }
    }

    public static void appendQuickFilterItems(List<String> labels, List<Integer> checkedIndices) {
        try {
            if (labels == null || checkedIndices == null) return;
            Context context = appContext();
            int baseIndex = labels.size();

            labels.add("Subreddit filter");
            if (isSubredditFilterEnabled(context)) {
                checkedIndices.add(baseIndex);
            }

            labels.add("Subreddit prefix filter");
            if (isPrefixFilterEnabled(context)) {
                checkedIndices.add(baseIndex + 1);
            }

            labels.add(SUFFIX_TITLE);
            if (isSuffixFilterEnabled(context)) {
                checkedIndices.add(baseIndex + 2);
            }
        } catch (Throwable ignored) {
        }
    }

    public static void applyQuickFilterItems(List<?> contentFilters, Integer[] selectedIndices) {
        try {
            if (contentFilters == null) return;
            Context context = appContext();
            if (context == null) return;

            int baseIndex = contentFilters.size();
            boolean subEnabled = containsIndex(selectedIndices, baseIndex);
            boolean prefixEnabled = containsIndex(selectedIndices, baseIndex + 1);
            boolean suffixEnabled = containsIndex(selectedIndices, baseIndex + 2);

            filterPrefs(context).edit()
                    .putBoolean(KEY_SUBREDDIT_ENABLED, subEnabled)
                    .putBoolean(KEY_PREFIX_ENABLED, prefixEnabled)
                    .putBoolean(KEY_SUFFIX_ENABLED, suffixEnabled)
                    .apply();
        } catch (Throwable ignored) {
        }
    }

    public static boolean shouldFilterSubreddit(List<String> subredditFilterList, String subreddit) {
        try {
            if (subreddit == null || subreddit.isEmpty()) return false;
            Context context = appContext();

            if (isSubredditFilterEnabled(context) && subredditFilterList != null) {
                for (String raw : subredditFilterList) {
                    if (raw == null || raw.isEmpty() || raw.startsWith("!")) continue;
                    String entry = normalizeSubName(raw);
                    if (!entry.isEmpty() && entry.equalsIgnoreCase(subreddit)) {
                        return true;
                    }
                }
            }

            if (isSuffixFilterEnabled(context)) {
                List<String> suffixes = getSuffixFilterList(context);
                if (suffixes != null) {
                    for (String raw : suffixes) {
                        if (raw == null || raw.isEmpty() || raw.startsWith("!")) continue;
                        String suffix = normalizeAffix(raw);
                        if (!suffix.isEmpty() && endsWithIgnoreCase(subreddit, suffix)) {
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    public static boolean shouldFilterSubredditPrefix(String subreddit, List<String> prefixFilterList) {
        try {
            if (subreddit == null || subreddit.isEmpty() || prefixFilterList == null) return false;
            Context context = appContext();
            if (!isPrefixFilterEnabled(context)) return false;

            for (String raw : prefixFilterList) {
                if (raw == null || raw.isEmpty() || raw.startsWith("!")) continue;
                String prefix = normalizeAffix(raw);
                if (!prefix.isEmpty() && startsWithIgnoreCase(subreddit, prefix)) {
                    return true;
                }
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean isSubredditFilterList(List<String> list) {
        if (SUBREDDIT_FILTER_LISTS.contains(list)) return true;
        if (list == activeSubredditList || list == activePrefixList || list == cachedSuffixList) return true;
        try {
            Class<?> zaClass = Class.forName("za.a");
            Field pField = zaClass.getDeclaredField("P");
            pField.setAccessible(true);
            if (list == pField.get(null)) return true;
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static void persistListChange(Context context, List<String> list) {
        try {
            if (context == null) context = appContext();
            if (context == null) return;

            if (list == cachedSuffixList) {
                saveJsonList(filterPrefs(context), KEY_SUFFIX_LIST, list);
                return;
            }
            if (list == activePrefixList) {
                Class<?> mbClass = Class.forName("mb.e");
                Object mbInstance = mbClass.getMethod("b").invoke(null);
                mbClass.getMethod("f", List.class).invoke(mbInstance, new ArrayList<>(list));
                return;
            }
            if (list == activeSubredditList) {
                saveJsonList(settingsPrefs(context), KEY_SUBREDDIT_LIST, list);
            }
        } catch (Throwable ignored) {
        }
    }

    private static List<String> getSuffixFilterList(Context context) {
        List<String> list = cachedSuffixList;
        if (list != null) return list;
        synchronized (SubredditFilters.class) {
            if (cachedSuffixList == null) {
                if (context == null) context = appContext();
                cachedSuffixList = context != null
                        ? loadJsonList(filterPrefs(context), KEY_SUFFIX_LIST)
                        : new ArrayList<>();
            }
            return cachedSuffixList;
        }
    }

    private static List<String> loadJsonList(SharedPreferences prefs, String key) {
        List<String> result = new ArrayList<>();
        if (prefs == null) return result;
        String raw = prefs.getString(key, null);
        if (raw == null || raw.isEmpty() || "dhenchu".equalsIgnoreCase(raw)) return result;
        try {
            JSONArray array = new JSONArray(raw);
            for (int i = 0; i < array.length(); i++) {
                String item = array.optString(i, "");
                if (!item.isEmpty()) result.add(item);
            }
        } catch (Throwable ignored) {
        }
        return result;
    }

    private static void saveJsonList(SharedPreferences prefs, String key, List<String> list) {
        if (prefs == null || list == null) return;
        JSONArray array = new JSONArray();
        for (String item : list) {
            if (item != null && !item.isEmpty()) {
                array.put(item);
            }
        }
        prefs.edit().putString(key, array.toString()).apply();
    }

    private static boolean isSubredditFilterEnabled(Context context) {
        if (context == null) return true;
        return filterPrefs(context).getBoolean(KEY_SUBREDDIT_ENABLED, true);
    }

    private static boolean isPrefixFilterEnabled(Context context) {
        if (context == null) return true;
        return filterPrefs(context).getBoolean(KEY_PREFIX_ENABLED, true);
    }

    private static boolean isSuffixFilterEnabled(Context context) {
        if (context == null) return true;
        return filterPrefs(context).getBoolean(KEY_SUFFIX_ENABLED, true);
    }

    private static SharedPreferences filterPrefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(FILTER_PREFS, Context.MODE_PRIVATE);
    }

    private static SharedPreferences settingsPrefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(SETTINGS_PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        try {
            Object app = Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
            if (app instanceof Context) return (Context) app;
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void notifyFiltersChanged(Activity activity) {
        try {
            Method v3 = activity.getClass().getDeclaredMethod("v3");
            v3.setAccessible(true);
            v3.invoke(activity);
        } catch (Throwable ignored) {
        }
    }

    private static int resolveAccentColor(View view) {
        try {
            Class<?> mClass = Class.forName("ec.m");
            Object theme = mClass.getMethod("c", View.class).invoke(null, view);
            Object color = theme.getClass().getMethod("e").invoke(theme);
            if (color instanceof Integer) return (Integer) color;
        } catch (Throwable ignored) {
        }
        return FALLBACK_ACCENT;
    }

    private static void updateLabelStyle(TextView label, boolean enabled) {
        if (enabled) {
            label.setAlpha(1.0f);
            label.setPaintFlags(label.getPaintFlags() & ~Paint.STRIKE_THRU_TEXT_FLAG);
        } else {
            label.setAlpha(0.45f);
            label.setPaintFlags(label.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
        }
    }

    private static void copyTextStyle(TextView target, TextView sample) {
        if (sample == null) return;
        target.setLayoutParams(copyParams(sample.getLayoutParams()));
        target.setPadding(sample.getPaddingLeft(), sample.getPaddingTop(),
                sample.getPaddingRight(), sample.getPaddingBottom());
        target.setTextSize(TypedValue.COMPLEX_UNIT_PX, sample.getTextSize());
        target.setTextColor(sample.getCurrentTextColor());
        target.setTypeface(sample.getTypeface());
        target.setGravity(sample.getGravity());
    }

    private static ViewGroup.LayoutParams copyParams(ViewGroup.LayoutParams source) {
        if (source instanceof ViewGroup.MarginLayoutParams) {
            return new LinearLayout.LayoutParams((ViewGroup.MarginLayoutParams) source);
        }
        if (source != null) {
            return new LinearLayout.LayoutParams(source);
        }
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static boolean containsIndex(Integer[] indices, int target) {
        if (indices == null) return false;
        for (Integer idx : indices) {
            if (idx != null && idx == target) return true;
        }
        return false;
    }

    private static String normalizeSubName(String s) {
        String clean = s.trim();
        if (clean.startsWith("/r/") || clean.startsWith("/R/")) {
            clean = clean.substring(3);
        } else if (clean.startsWith("r/") || clean.startsWith("R/")) {
            clean = clean.substring(2);
        }
        if (clean.endsWith("/")) {
            clean = clean.substring(0, clean.length() - 1);
        }
        return clean.trim();
    }

    private static String normalizeAffix(String s) {
        String clean = normalizeSubName(s);
        while (clean.startsWith("*")) {
            clean = clean.substring(1);
        }
        while (clean.endsWith("*")) {
            clean = clean.substring(0, clean.length() - 1);
        }
        return clean.trim();
    }

    private static boolean startsWithIgnoreCase(String text, String prefix) {
        if (text.length() < prefix.length()) return false;
        return text.regionMatches(true, 0, prefix, 0, prefix.length());
    }

    private static boolean endsWithIgnoreCase(String text, String suffix) {
        if (text.length() < suffix.length()) return false;
        return text.regionMatches(true, text.length() - suffix.length(), suffix, 0, suffix.length());
    }
}
