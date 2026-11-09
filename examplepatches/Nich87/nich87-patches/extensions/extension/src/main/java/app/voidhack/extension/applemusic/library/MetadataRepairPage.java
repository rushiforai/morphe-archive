package app.voidhack.extension.applemusic.library;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.function.Consumer;

final class MetadataRepairPage {
    private final Activity activity;
    private final Dialog dialog;
    private final LinearLayout root;
    private final int background, primary, secondary, accent, fill, separator;
    private final Typeface regular, semibold;
    private TextView progress;

    MetadataRepairPage(Activity activity, String title, Runnable back) {
        this.activity = activity;
        background = color("background_color"); primary = color("label_color");
        secondary = color("secondary_label_color"); accent = color("key_color");
        fill = color("tertiary_fill_color"); separator = color("separator_color");
        regular = activity.getResources().getFont(id("font", "regular"));
        semibold = activity.getResources().getFont(id("font", "semibold"));
        dialog = new Dialog(activity, id("style", "AppTheme.FullScreenDialog"));
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.setForceDarkAllowed(false);
        root.setFocusableInTouchMode(true);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            android.graphics.Insets safe = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime());
            view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
            return insets;
        });
        FrameLayout toolbar = new FrameLayout(activity);
        TextView heading = text(title, 17, true, primary);
        heading.setGravity(Gravity.CENTER);
        FrameLayout.LayoutParams headingParams = new FrameLayout.LayoutParams(-1, -1);
        headingParams.setMargins(dp(56), 0, dp(56), 0);
        toolbar.addView(heading, headingParams);
        ImageButton close = new ImageButton(activity);
        close.setImageResource(id("drawable", "sf_chevron_backward_monochrome_medium_medium"));
        close.setImageTintList(ColorStateList.valueOf(accent));
        close.setBackground(ripple(null));
        close.setContentDescription(label("back"));
        close.setOnClickListener(view -> back.run());
        toolbar.addView(close, new FrameLayout.LayoutParams(dp(52), -1, Gravity.START));
        root.addView(toolbar, new LinearLayout.LayoutParams(-1, dp(52)));
        root.addView(line(), new LinearLayout.LayoutParams(-1, 1));
        dialog.setContentView(root);
        dialog.setOnCancelListener(d -> back.run());
        Window window = dialog.getWindow();
        window.setBackgroundDrawable(new ColorDrawable(background));
        window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
                | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN | WindowManager.LayoutParams.FLAG_LAYOUT_INSET_DECOR);
        window.setDecorFitsSystemWindows(false);
        window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
        window.setStatusBarColor(Color.TRANSPARENT);
        window.setNavigationBarColor(background);
        dialog.show();
        window.setLayout(-1, -1);
        boolean light = Color.luminance(background) > 0.5;
        window.getInsetsController().setSystemBarsAppearance(light
                        ? WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS : 0,
                WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS);
        root.requestApplyInsets();
    }

    void message(String message, String actionLabel, Runnable action) {
        ScrollView scroll = new ScrollView(activity);
        TextView body = text(message, 17, false, primary);
        body.setTextIsSelectable(true);
        body.setPadding(dp(24), dp(24), dp(24), dp(24));
        body.setLineSpacing(dp(4), 1);
        scroll.addView(body);
        body(scroll);
        footer(actionLabel, true, action);
    }

    void progress(String message, Runnable stop) {
        dialog.setCancelable(false);
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setGravity(Gravity.CENTER);
        content.setPadding(dp(32), 0, dp(32), 0);
        ProgressBar spinner = new ProgressBar(activity);
        spinner.setIndeterminateTintList(ColorStateList.valueOf(accent));
        content.addView(spinner, new LinearLayout.LayoutParams(dp(28), dp(28)));
        spinner.setVisibility(View.INVISIBLE);
        root.postDelayed(() -> { if (spinner.isAttachedToWindow()) spinner.setVisibility(View.VISIBLE); }, 1000);
        progress = text(message, 17, false, primary);
        progress.setGravity(Gravity.CENTER);
        progress.setPadding(0, dp(20), 0, 0);
        content.addView(progress, new LinearLayout.LayoutParams(-1, -2));
        body(content);
        TextView cancel = footer(label("stop"), true, stop);
        cancel.setOnClickListener(view -> { cancel.setEnabled(false); cancel.setAlpha(0.5f); stop.run(); });
    }

    void setProgress(String value) { if (progress != null) progress.setText(value); }

    void candidates(LibraryMetadata.Scan scan, Set<Long> selected, String query, boolean onlyRomanized,
                    Consumer<String> queryChanged, Consumer<Boolean> scopeChanged, Runnable proceed) {
        LinearLayout header = new LinearLayout(activity);
        header.setOrientation(LinearLayout.VERTICAL);
        header.setPadding(dp(20), dp(12), dp(20), 0);
        LinearLayout searchRow = new LinearLayout(activity);
        searchRow.setGravity(Gravity.CENTER_VERTICAL);
        searchRow.setBackground(round(fill, 10));
        ImageButton searchIcon = new ImageButton(activity);
        searchIcon.setImageResource(id("drawable", "ic_search_magnifyingglass"));
        searchIcon.setImageTintList(ColorStateList.valueOf(secondary));
        searchIcon.setBackgroundColor(Color.TRANSPARENT);
        searchIcon.setClickable(false);
        searchIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        searchRow.addView(searchIcon, new LinearLayout.LayoutParams(dp(40), dp(44)));
        EditText search = new EditText(activity);
        search.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        search.setTypeface(regular);
        search.setTextSize(17);
        search.setTextColor(primary);
        search.setHintTextColor(secondary);
        search.setSingleLine(true);
        search.setBackgroundColor(Color.TRANSPARENT);
        search.setPadding(0, 0, dp(12), 0);
        search.setHint(label("filter_hint"));
        search.setContentDescription(label("filter"));
        search.setText(query);
        searchRow.addView(search, new LinearLayout.LayoutParams(0, dp(44), 1));
        header.addView(searchRow, new LinearLayout.LayoutParams(-1, -2));
        Switch scope = new Switch(activity);
        scope.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        scope.setText(label("romanized_only"));
        scope.setTextColor(primary);
        scope.setTextSize(15);
        scope.setTypeface(regular);
        scope.setChecked(onlyRomanized);
        scope.setThumbTintList(new ColorStateList(new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}}, new int[]{accent, color("system_gray")}));
        header.addView(scope, new LinearLayout.LayoutParams(-1, dp(48)));
        LinearLayout tools = new LinearLayout(activity);
        tools.setGravity(Gravity.CENTER_VERTICAL);
        TextView count = text("", 15, false, secondary);
        tools.addView(count, new LinearLayout.LayoutParams(0, -2, 1));
        TextView all = action("", false);
        tools.addView(all, new LinearLayout.LayoutParams(-2, dp(44)));
        header.addView(tools);
        root.addView(header, new LinearLayout.LayoutParams(-1, -2));
        FrameLayout container = new FrameLayout(activity);
        ListView list = new ListView(activity);
        list.setDivider(new ColorDrawable(separator));
        list.setDividerHeight(1);
        list.setClipToPadding(false);
        list.setPadding(dp(20), 0, dp(20), 0);
        list.setSelector(ripple(null));
        list.setScrollBarStyle(View.SCROLLBARS_OUTSIDE_OVERLAY);
        TextView empty = text(label("no_matches"), 17, false, secondary);
        empty.setGravity(Gravity.CENTER);
        empty.setPadding(dp(24), dp(24), dp(24), dp(24));
        container.addView(list, new FrameLayout.LayoutParams(-1, -1));
        container.addView(empty, new FrameLayout.LayoutParams(-1, -1));
        body(container);
        TextView repair = footer(label("selected", selected.size()), !selected.isEmpty(), proceed);
        CandidateRows adapter = new CandidateRows(scan, selected);
        Runnable update = () -> {
            count.setText(label("shown_count", adapter.getCount(), scan.total));
            all.setText(label(adapter.allSelected() ? "clear_selection" : "select_all"));
            all.setEnabled(adapter.getCount() > 0);
            repair.setText(label("selected", selected.size()));
            repair.setEnabled(!selected.isEmpty());
            repair.setAlpha(selected.isEmpty() ? 0.45f : 1);
            empty.setVisibility(adapter.getCount() == 0 ? View.VISIBLE : View.GONE);
        };
        adapter.changed = update;
        adapter.filter(query, onlyRomanized);
        list.setAdapter(adapter);
        all.setOnClickListener(view -> {
            boolean clear = adapter.allSelected();
            for (LibraryMetadata.Candidate item : adapter.shown) {
                if (clear) selected.remove(item.track.cloudId); else selected.add(item.track.cloudId);
            }
            adapter.notifyDataSetChanged();
            update.run();
        });
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                queryChanged.accept(s.toString()); adapter.filter(s.toString(), scope.isChecked()); update.run();
            }
            @Override public void afterTextChanged(Editable s) {}
        });
        scope.setOnCheckedChangeListener((button, checked) -> {
            scopeChanged.accept(checked); adapter.filter(search.getText().toString(), checked); update.run();
        });
        update.run();
        root.requestFocus();
    }

    void review(List<LibraryMetadata.Candidate> selected, Runnable repair) {
        ScrollView scroll = new ScrollView(activity);
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(24), dp(16), dp(24), dp(24));
        TextView summary = text(label("confirm", selected.size()), 15, false, secondary);
        summary.setPadding(0, 0, 0, dp(24));
        content.addView(summary);
        for (LibraryMetadata.Candidate item : selected) {
            TextView title = text(item.track.values.getOrDefault("minm", ""), 20, true, primary);
            content.addView(title);
            TextView artist = text(item.track.values.getOrDefault("asar", ""), 15, false, secondary);
            artist.setPadding(0, dp(4), 0, dp(12));
            content.addView(artist);
            appendChanges(content, item);
            content.addView(line(), new LinearLayout.LayoutParams(-1, 1));
        }
        scroll.addView(content);
        body(scroll);
        footer(label("repair"), true, repair);
    }

    private final class CandidateRows extends BaseAdapter {
        private final LibraryMetadata.Scan scan;
        private final Set<Long> selected;
        private final Set<Long> expanded = new java.util.HashSet<>();
        final List<LibraryMetadata.Candidate> shown = new ArrayList<>();
        Runnable changed = () -> {};
        CandidateRows(LibraryMetadata.Scan scan, Set<Long> selected) { this.scan = scan; this.selected = selected; }
        void filter(String query, boolean romanized) {
            shown.clear();
            String normalized = query.trim().toLowerCase(Locale.ROOT);
            for (LibraryMetadata.Candidate item : scan.candidates) {
                if (romanized && !item.romanized) continue;
                String names = String.join("\n", item.track.values.values()) + "\n" + String.join("\n", item.changes.values());
                if (names.toLowerCase(Locale.ROOT).contains(normalized)) shown.add(item);
            }
            notifyDataSetChanged();
        }
        boolean allSelected() {
            if (shown.isEmpty()) return false;
            for (LibraryMetadata.Candidate item : shown) if (!selected.contains(item.track.cloudId)) return false;
            return true;
        }
        @Override public int getCount() { return shown.size(); }
        @Override public Object getItem(int position) { return shown.get(position); }
        @Override public long getItemId(int position) { return shown.get(position).track.cloudId; }
        @Override public View getView(int position, View recycled, ViewGroup parent) {
            LibraryMetadata.Candidate item = shown.get(position);
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.VERTICAL);
            row.setPadding(0, dp(12), 0, dp(12));
            LinearLayout entry = new LinearLayout(activity);
            entry.setGravity(Gravity.CENTER_VERTICAL);
            CheckBox selection = new CheckBox(activity);
            android.graphics.drawable.StateListDrawable check = new android.graphics.drawable.StateListDrawable();
            android.graphics.drawable.Drawable on = activity.getDrawable(id("drawable", "ic_checked_checkbox")).mutate();
            android.graphics.drawable.Drawable off = activity.getDrawable(id("drawable", "ic_unchecked_checkbox")).mutate();
            on.setTint(accent); off.setTint(secondary);
            check.addState(new int[]{android.R.attr.state_checked}, on);
            check.addState(new int[]{}, off);
            selection.setButtonDrawable(check);
            selection.setButtonTintList(null);
            selection.setChecked(selected.contains(item.track.cloudId));
            selection.setContentDescription(label("select_song", item.track.values.getOrDefault("minm", "")));
            selection.setOnCheckedChangeListener((button, checked) -> {
                if (checked) selected.add(item.track.cloudId); else selected.remove(item.track.cloudId);
                changed.run();
            });
            entry.addView(selection, new LinearLayout.LayoutParams(dp(44), dp(52)));
            LinearLayout names = new LinearLayout(activity);
            names.setOrientation(LinearLayout.VERTICAL);
            String title = item.changes.getOrDefault("minm", item.track.values.getOrDefault("minm", ""));
            TextView name = text(title, 17, false, primary);
            name.setMaxLines(2);
            name.setEllipsize(TextUtils.TruncateAt.END);
            names.addView(name);
            TextView artist = text(item.track.values.getOrDefault("asar", ""), 15, false, secondary);
            artist.setSingleLine(true);
            artist.setEllipsize(TextUtils.TruncateAt.END);
            names.addView(artist);
            entry.addView(names, new LinearLayout.LayoutParams(0, -2, 1));
            ImageButton details = new ImageButton(activity);
            details.setImageResource(id("drawable", "ic_actionsheet_chevron_down"));
            details.setImageTintList(ColorStateList.valueOf(secondary));
            details.setRotation(expanded.contains(item.track.cloudId) ? 180 : 0);
            details.setBackground(ripple(null));
            details.setContentDescription(label(expanded.contains(item.track.cloudId) ? "hide_changes" : "show_changes", item.changes.size()));
            details.setOnClickListener(view -> {
                if (!expanded.remove(item.track.cloudId)) expanded.add(item.track.cloudId);
                notifyDataSetChanged();
            });
            entry.addView(details, new LinearLayout.LayoutParams(dp(44), dp(52)));
            row.addView(entry);
            TextView preview = text(preview(item), 15, false, secondary);
            preview.setPadding(dp(44), dp(6), dp(44), 0);
            preview.setMaxLines(2);
            preview.setEllipsize(TextUtils.TruncateAt.END);
            row.addView(preview);
            if (expanded.contains(item.track.cloudId)) {
                LinearLayout changes = new LinearLayout(activity);
                changes.setOrientation(LinearLayout.VERTICAL);
                changes.setPadding(dp(44), 0, dp(12), 0);
                appendChanges(changes, item);
                row.addView(changes);
            }
            return row;
        }
    }

    private String preview(LibraryMetadata.Candidate item) {
        for (String tag : new String[]{"minm", "asar", "asal"}) {
            String before = item.track.values.getOrDefault(tag, ""), after = item.changes.getOrDefault(tag, "");
            if (LibraryMetadata.romanizedField(before, after)) return before + " → " + after;
        }
        for (String tag : new String[]{"minm", "asar", "asal"}) if (item.changes.containsKey(tag))
            return item.track.values.getOrDefault(tag, label("blank")) + " → " + item.changes.get(tag);
        return label("show_changes", item.changes.size());
    }

    private void appendChanges(LinearLayout content, LibraryMetadata.Candidate item) {
        for (MetadataField field : MetadataField.values()) {
            String value = item.changes.get(field.tag);
            if (value == null) continue;
            TextView label = text(label("field_" + field.label), 15, true, secondary);
            label.setPadding(0, dp(16), 0, dp(4));
            content.addView(label);
            String before = item.track.values.getOrDefault(field.tag, "");
            TextView current = text(label("before", before.isEmpty() ? label("blank") : before), 15, false, secondary);
            current.setTextIsSelectable(true);
            content.addView(current);
            TextView after = text(label("after", value), 17, false, primary);
            after.setTextIsSelectable(true);
            after.setPadding(0, dp(4), 0, dp(12));
            content.addView(after);
        }
    }

    private void body(View body) { root.addView(body, new LinearLayout.LayoutParams(-1, 0, 1)); }
    private TextView footer(String label, boolean enabled, Runnable callback) {
        LinearLayout footer = new LinearLayout(activity);
        footer.setOrientation(LinearLayout.VERTICAL);
        footer.addView(line(), new LinearLayout.LayoutParams(-1, 1));
        TextView button = action(label, true);
        button.setEnabled(enabled);
        button.setAlpha(enabled ? 1 : 0.45f);
        button.setOnClickListener(view -> {
            ((InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(root.getWindowToken(), 0);
            callback.run();
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, dp(50));
        params.setMargins(dp(20), dp(12), dp(20), dp(12));
        footer.addView(button, params);
        root.addView(footer, new LinearLayout.LayoutParams(-1, -2));
        return button;
    }
    private TextView action(String label, boolean filled) {
        TextView text = text(label, 17, true, filled ? Color.WHITE : accent);
        text.setGravity(Gravity.CENTER);
        text.setPadding(dp(8), 0, dp(8), 0);
        text.setBackground(ripple(filled ? round(accent, 10) : null));
        text.setMinHeight(dp(44));
        text.setClickable(true);
        text.setFocusable(true);
        return text;
    }
    private TextView text(String value, int size, boolean bold, int color) {
        TextView text = new TextView(activity);
        text.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        text.setText(value); text.setTextSize(size); text.setTextColor(color);
        text.setTypeface(bold ? semibold : regular);
        text.setIncludeFontPadding(false);
        return text;
    }
    private View line() { View view = new View(activity); view.setBackgroundColor(separator); return view; }
    private GradientDrawable round(int color, int radius) {
        GradientDrawable shape = new GradientDrawable(); shape.setColor(color); shape.setCornerRadius(dp(radius)); return shape;
    }
    private RippleDrawable ripple(android.graphics.drawable.Drawable content) {
        return new RippleDrawable(ColorStateList.valueOf((primary & 0x00ffffff) | 0x18000000), content, new ColorDrawable(Color.WHITE));
    }
    private int id(String type, String name) { return LibraryStrings.id(activity, type, name); }
    private int color(String name) { return activity.getColor(id("color", name)); }
    private int dp(int value) { return Math.round(value * activity.getResources().getDisplayMetrics().density); }
    private String label(String name, Object... args) { return MetadataStrings.text(activity, name, args); }
    void dismiss() { dialog.dismiss(); }
}
