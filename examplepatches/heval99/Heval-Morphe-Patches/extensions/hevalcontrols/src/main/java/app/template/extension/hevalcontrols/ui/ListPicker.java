package app.template.extension.hevalcontrols.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.text.Collator;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import app.template.extension.hevalcontrols.Feature;
import app.template.extension.hevalcontrols.HevalSettings;

/**
 * The picker of a list feature ("pick items to hide"), shown by {@link HevalControlsActivity} in
 * place of its main screen: the feature name, an "N hidden" summary, a search field, "Clear all"
 * (which turns into "Undo clear" until the next change) and an alphabetical checklist of the
 * options from {@link HevalSettings#options(String)}. Every tap is saved at once, like a switch.
 *
 * <p>Each checklist row is one focus stop, announced as a checkbox with its label and state.
 */
final class ListPicker {
    final Feature feature;
    final LinearLayout panel;

    private final HevalControlsActivity activity;
    private final Views views;
    private final Palette palette;
    private final TextView summary, inactiveNote, empty;
    private final EditText search;
    private final Button clear;
    private final ListView list;
    private final OptionAdapter adapter = new OptionAdapter();
    /** The picks before "Clear all", while "Undo clear" is offered; null otherwise. */
    private Set<String> undo;

    ListPicker(HevalControlsActivity activity, Views views, Palette palette, Feature feature) {
        this.activity = activity;
        this.views = views;
        this.palette = palette;
        this.feature = feature;

        panel = views.column();
        panel.setPaddingRelative(views.dp(16), views.dp(12), views.dp(16), views.dp(12));

        LinearLayout header = views.row();
        TextView title = views.text(feature.name, 22, palette.text, true);
        Views.markHeading(title);
        header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        Button done = views.primaryButton("Done");
        done.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                ListPicker.this.activity.closePicker(true);
            }
        });
        LinearLayout.LayoutParams doneParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        doneParams.setMarginStart(views.dp(12));
        header.addView(done, doneParams);
        panel.addView(header);

        if (!feature.description.isEmpty()) {
            views.add(panel, views.text(feature.description, 13, palette.muted, false), 6);
        }
        summary = views.text("", 14, palette.text, true);
        // Spoken after every change without moving focus.
        summary.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        views.add(panel, summary, 8);
        inactiveNote = views.text("", 13, palette.warning, false);
        views.add(panel, inactiveNote, 4);

        LinearLayout tools = views.row();
        search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint("Search");
        search.setTextSize(16);
        search.setTextColor(palette.text);
        search.setHintTextColor(palette.muted);
        search.setMinHeight(views.dp(48));
        search.setMinimumHeight(views.dp(48));
        search.setPaddingRelative(views.dp(14), views.dp(8), views.dp(14), views.dp(8));
        search.setBackground(views.interactive(palette.surface, palette.outline, 12, palette.accent));
        search.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        search.setImeOptions(EditorInfo.IME_ACTION_SEARCH | EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        search.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
        search.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence text, int start, int count, int after) { }

            @Override
            public void onTextChanged(CharSequence text, int start, int before, int count) { }

            @Override
            public void afterTextChanged(Editable text) {
                adapter.filter(text.toString());
                updateEmpty();
            }
        });
        tools.addView(search, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        clear = views.button("Clear all");
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                clearOrUndo(view);
            }
        });
        LinearLayout.LayoutParams clearParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        clearParams.setMarginStart(views.dp(8));
        tools.addView(clear, clearParams);
        views.add(panel, tools, 12);

        list = new ListView(activity);
        list.setAdapter(adapter);
        list.setDivider(new ColorDrawable(palette.line));
        list.setDividerHeight(Math.max(1, views.dp(1) / 2));
        list.setBackground(views.shape(palette.surface, palette.line, 14));
        list.setClipToOutline(true);
        list.setSelector(new ColorDrawable(palette.ripple));
        list.setCacheColorHint(0);
        list.setItemsCanFocus(false);
        list.setFastScrollEnabled(true);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                toggle(adapter.getItem(position), view);
            }
        });
        empty = views.text("", 14, palette.muted, false);
        empty.setGravity(Gravity.CENTER);
        empty.setPaddingRelative(views.dp(16), views.dp(24), views.dp(16), views.dp(24));
        LinearLayout.LayoutParams listParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1);
        listParams.topMargin = views.dp(12);
        panel.addView(list, listParams);
        views.add(panel, empty, 12);
    }

    /** Loads the options and applies a restored search. */
    void start(String query) {
        OptionImageLoader.retryFailed();
        adapter.load(HevalSettings.options(feature.id));
        if (query != null && !query.isEmpty()) {
            search.setText(query);
            search.setSelection(query.length());
        } else {
            adapter.filter("");
        }
        update();
        updateEmpty();
        panel.announceForAccessibility(feature.name + ". " + summary.getText());
    }

    String query() {
        return search.getText().toString();
    }

    void dismissKeyboard() {
        try {
            InputMethodManager input = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (input != null) input.hideSoftInputFromWindow(search.getWindowToken(), 0);
        } catch (Throwable ignored) {
            // The keyboard closes with the panel anyway.
        }
    }

    private void toggle(Option option, View view) {
        if (option == null) return;
        boolean hide = !HevalSettings.pickedHidden(feature.id).contains(option.key);
        if (!HevalSettings.setHidden(feature.id, option.key, hide)) {
            activity.toast(hide && HevalSettings.pickedHidden(feature.id).size() >= HevalSettings.MAX_HIDDEN
                    ? "You can hide up to " + HevalSettings.MAX_HIDDEN + " items" : "Could not save the change");
        }
        undo = null;
        adapter.notifyDataSetChanged();
        update();
        boolean nowHidden = HevalSettings.pickedHidden(feature.id).contains(option.key);
        view.announceForAccessibility(option.label + (nowHidden ? " hidden" : " shown"));
    }

    private void clearOrUndo(View view) {
        if (undo != null) {
            Set<String> previous = undo;
            undo = null;
            if (!HevalSettings.setHidden(feature.id, previous)) activity.toast("Could not save the change");
            view.announceForAccessibility("Restored " + HevalSettings.pickedHidden(feature.id).size() + " hidden items");
        } else {
            Set<String> current = new HashSet<>(HevalSettings.pickedHidden(feature.id));
            if (current.isEmpty()) return;
            if (HevalSettings.clearHidden(feature.id)) {
                undo = current;
                view.announceForAccessibility("Every item is shown again. Undo clear is available.");
            } else {
                activity.toast("Could not save the change");
            }
        }
        adapter.notifyDataSetChanged();
        update();
    }

    /** Summary, inactive note and the Clear all / Undo clear button. */
    private void update() {
        int count = HevalSettings.pickedHidden(feature.id).size();
        summary.setText(HevalControlsActivity.hiddenSummary(count));
        String note = null;
        if (count > 0 && !HevalSettings.isEnabled(feature.id)) {
            note = HevalSettings.isEngineFailed() ? "Settings are unavailable, so nothing is hidden right now."
                    : HevalSettings.isSafeMode() ? "Safe mode is on, so nothing is hidden right now. Your picks are kept."
                    : HevalSettings.isPaused() ? "Patches are paused, so nothing is hidden right now. Your picks are kept."
                    : "Another feature this list needs is off, so nothing is hidden right now.";
        } else if (feature.restartRequired && HevalSettings.stateOf(feature) == HevalSettings.State.RESTART_REQUIRED) {
            note = "Restart the app to apply the change.";
        }
        inactiveNote.setText(note == null ? "" : note);
        inactiveNote.setVisibility(note == null ? View.GONE : View.VISIBLE);
        clear.setText(undo != null ? "Undo clear" : "Clear all");
        clear.setEnabled(undo != null || count > 0);
    }

    private void updateEmpty() {
        boolean none = adapter.getCount() == 0;
        if (none) {
            empty.setText(adapter.total() == 0
                    ? "Nothing to pick yet. Items appear here after the app has shown them."
                    : "No matches.");
        }
        empty.setVisibility(none ? View.VISIBLE : View.GONE);
        list.setVisibility(none ? View.GONE : View.VISIBLE);
    }

    // -------------------------------------------------------------------------------------------
    // Options
    // -------------------------------------------------------------------------------------------

    static final class Option {
        final String key, label, folded;
        /** Drawn before the label (an emoji flag), or null. Not searched, sorted on or spoken. */
        final String icon;
        /** Shown in place of {@link #icon} once loaded (OptionImageLoader), or null. Never spoken. */
        final String imageUrl;

        Option(String key, String label, String icon, String imageUrl) {
            this.key = key;
            this.label = label;
            this.icon = icon;
            this.imageUrl = imageUrl;
            this.folded = fold(label) + "\n" + fold(key);
        }
    }

    /** Lower case without accents, so "cote" finds "Côte d'Ivoire". */
    static String fold(String text) {
        String decomposed = Normalizer.normalize(text, Normalizer.Form.NFD);
        StringBuilder out = new StringBuilder(decomposed.length());
        for (int i = 0; i < decomposed.length(); i++) {
            char c = decomposed.charAt(i);
            int type = Character.getType(c);
            if (type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK) continue;
            out.append(c);
        }
        return out.toString().toLowerCase(Locale.ROOT);
    }

    private final class OptionAdapter extends BaseAdapter {
        private final List<Option> all = new ArrayList<>();
        private final List<Option> visible = new ArrayList<>();
        /** Whether any option has an icon: then every row keeps an icon column, so labels line up. */
        private boolean icons;

        void load(Map<String, String> options) {
            all.clear();
            icons = false;
            for (Map.Entry<String, String> entry : options.entrySet()) {
                String icon = HevalSettings.optionIcon(feature.id, entry.getKey());
                String imageUrl = HevalSettings.optionImageUrl(feature.id, entry.getKey());
                if (icon != null || imageUrl != null) icons = true;
                all.add(new Option(entry.getKey(), entry.getValue(), icon, imageUrl));
            }
            final Collator collator = Collator.getInstance();
            collator.setStrength(Collator.SECONDARY);
            Collections.sort(all, new Comparator<Option>() {
                @Override
                public int compare(Option a, Option b) {
                    int byLabel = collator.compare(a.label, b.label);
                    return byLabel != 0 ? byLabel : a.key.compareTo(b.key);
                }
            });
        }

        void filter(String query) {
            String needle = fold(query.trim());
            visible.clear();
            for (Option option : all) {
                if (needle.isEmpty() || option.folded.contains(needle)) visible.add(option);
            }
            notifyDataSetChanged();
        }

        int total() {
            return all.size();
        }

        @Override
        public int getCount() {
            return visible.size();
        }

        @Override
        public Option getItem(int position) {
            return position >= 0 && position < visible.size() ? visible.get(position) : null;
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Holder holder = convertView == null ? null : (Holder) convertView.getTag();
            if (holder == null) holder = new Holder();
            Option option = visible.get(position);
            boolean hidden = HevalSettings.pickedHidden(feature.id).contains(option.key);
            holder.option = option;
            holder.hidden = hidden;
            holder.label.setText(option.label);
            holder.icon.setText(option.icon == null ? "" : option.icon);
            // No icon column at all when the list has none (the original look). The text icon shows
            // at once; the image, if any, replaces it once loaded and the text stays on a failure.
            holder.iconColumn.setVisibility(icons ? View.VISIBLE : View.GONE);
            OptionImageLoader.bind(holder.image, holder.icon, icons ? option.imageUrl : null, holder.imageSize);
            holder.check.setChecked(hidden);
            if (Build.VERSION.SDK_INT >= 30) {
                holder.row.setContentDescription(option.label);
                Api30.stateDescription(holder.row, hidden ? "Hidden" : "Shown");
            } else {
                holder.row.setContentDescription(option.label + ". " + (hidden ? "Hidden" : "Shown"));
            }
            return holder.row;
        }
    }

    /**
     * One checklist row: an optional icon (text, or an image over it once loaded), the label and a
     * checkbox that only shows the state (the row is the target). The row is spoken by its content
     * description, so neither the icon nor the image is read.
     */
    private final class Holder {
        final LinearLayout row = views.row();
        final FrameLayout iconColumn = new FrameLayout(activity);
        final TextView icon = views.text("", 20, palette.text, false);
        final ImageView image = new ImageView(activity);
        final int imageSize = views.dp(32);
        final TextView label = views.text("", 16, palette.text, false);
        final CheckBox check = new CheckBox(activity);
        Option option;
        boolean hidden;

        Holder() {
            row.setMinimumHeight(views.dp(52));
            row.setPaddingRelative(views.dp(16), views.dp(4), views.dp(8), views.dp(4));
            // A fixed-width column, so the labels line up whatever the icon's width.
            icon.setGravity(Gravity.CENTER);
            icon.setSingleLine(true);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            iconColumn.addView(icon, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
            image.setScaleType(ImageView.ScaleType.FIT_CENTER);
            image.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            image.setVisibility(View.GONE);
            iconColumn.addView(image, new FrameLayout.LayoutParams(imageSize, imageSize, Gravity.CENTER));
            iconColumn.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            iconColumn.setVisibility(View.GONE);
            LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(
                    views.dp(32), ViewGroup.LayoutParams.WRAP_CONTENT);
            iconParams.setMarginEnd(views.dp(12));
            row.addView(iconColumn, iconParams);
            row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            check.setFocusable(false);
            check.setClickable(false);
            check.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            check.setButtonTintList(android.content.res.ColorStateList.valueOf(palette.accent));
            check.setMinWidth(views.dp(48));
            check.setMinHeight(views.dp(48));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMarginStart(views.dp(8));
            row.addView(check, params);
            row.setTag(this);
            row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override
                public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    // Spoken as a checkbox: "Spain, checked" means Spain is hidden.
                    info.setClassName(CheckBox.class.getName());
                    info.setCheckable(true);
                    info.setChecked(hidden);
                }
            });
        }
    }

    @TargetApi(30)
    private static final class Api30 {
        static void stateDescription(View view, String state) {
            view.setStateDescription(state);
        }
    }
}
