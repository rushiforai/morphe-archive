package app.template.extension.watch;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.RippleDrawable;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import app.template.extension.settings.AccentPresets;
import app.template.extension.ui.LoadingIndicator;
import app.template.extension.ui.ThemedDialogPanel;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;

final class WatchServicePicker {
    interface Catalog {
        void load(String region, Consumer<List<WatchAvailability.Service>> success, Runnable failure);
    }

    private final Context context;
    private final WatchPreferences preferences;
    private final Catalog catalog;
    private final ThemedDialogPanel panel;
    private final EditText search;
    private final TextView regionAction, status, bulk, apply;
    private final GridView grid;
    private final LoadingIndicator loading;
    private final ServiceGrid adapter = new ServiceGrid();
    private final Map<String, Set<Integer>> draft = new HashMap<>();
    private ThemedDialogPanel regionPanel;
    private String region;
    private Set<Integer> checked;
    private List<WatchAvailability.Service> services = List.of();
    private Set<Integer> catalogIds = Set.of();
    private boolean catalogPending;
    private int request;

    WatchServicePicker(Context context, WatchPreferences preferences, Catalog catalog, Runnable onApply) {
        this.context = context;
        this.preferences = preferences;
        this.catalog = catalog;
        panel = new ThemedDialogPanel(context, "Streaming services");

        View regionRow = WatchViews.row(panel.body, "Region", " ", this::chooseRegion);
        regionAction = WatchViews.find(regionRow, "rightLabel");
        regionAction.setTextColor(panel.secondary);
        panel.body.addView(regionRow);

        search = panel.search("Search services");
        panel.body.addView(search);
        watchText(search, query -> {
            adapter.filter(query);
            gridToStart();
        });

        loading = new LoadingIndicator(context, true);
        panel.body.addView(loading, new LinearLayout.LayoutParams(-1, -2));
        status = panel.text("BodyMedium", panel.secondary);
        status.setGravity(Gravity.CENTER);
        status.setPadding(0, panel.dp(8), 0, panel.dp(8));
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        panel.body.addView(status);

        grid = new GridView(context);
        grid.setNumColumns(GridView.AUTO_FIT);
        grid.setColumnWidth(panel.dp(66));
        grid.setStretchMode(GridView.STRETCH_COLUMN_WIDTH);
        grid.setHorizontalSpacing(panel.dp(6));
        grid.setVerticalSpacing(panel.dp(6));
        grid.setPadding(0, panel.dp(8), 0, panel.dp(4));
        grid.setClipToPadding(false);
        grid.setSelector(neutralTile(Color.TRANSPARENT, 0));
        grid.setDrawSelectorOnTop(true);
        grid.setAdapter(adapter);
        grid.setOnItemClickListener((parent, view, position, id) -> {
            int key = adapter.getItem(position).id();
            if (!checked.remove(key)) checked.add(key);
            ((Tile) view).setChecked(checked.contains(key));
            reorder();
            refreshBulk();
        });
        panel.body.addView(grid, new LinearLayout.LayoutParams(-1, 0, 1));

        LinearLayout actions = new LinearLayout(context);
        actions.setGravity(Gravity.END | Gravity.CENTER_VERTICAL);
        bulk = panel.action("Select all", false, () -> {
            if (checked.containsAll(catalogIds)) checked.removeAll(catalogIds);
            else checked.addAll(catalogIds);
            reorder();
            refreshBulk();
        });
        apply = panel.action("Apply", true, () -> {
            preferences.save(region, draft);
            panel.dialog.dismiss();
            onApply.run();
        });
        LinearLayout.LayoutParams bulkParams = new LinearLayout.LayoutParams(0, -2, 1);
        bulkParams.setMarginEnd(panel.dp(8));
        actions.addView(bulk, bulkParams);
        actions.addView(apply, new LinearLayout.LayoutParams(0, -2, 1));
        LinearLayout.LayoutParams footer = new LinearLayout.LayoutParams(-1, -2);
        footer.topMargin = panel.dp(12);
        panel.body.addView(actions, footer);
    }

    void show() {
        panel.dialog.setOnDismissListener(d -> loading.setLoading(false));
        panel.show(610);
        if (panel.dialog.isShowing()) setRegion(preferences.region());
    }

    void dismiss() {
        if (regionPanel != null) regionPanel.dialog.dismiss();
        panel.dialog.dismiss();
    }

    private void chooseRegion() {
        ThemedDialogPanel countries = new ThemedDialogPanel(context, "Region");
        regionPanel = countries;
        EditText field = countries.search("Search regions");
        countries.body.addView(field);
        ListView list = new ListView(context);
        list.setDivider(null);
        String[] ordered = Locale.getISOCountries();
        Arrays.sort(ordered, Comparator.comparing(WatchServicePicker::countryName, String.CASE_INSENSITIVE_ORDER));
        ArrayList<String> visible = new ArrayList<>(Arrays.asList(ordered));
        BaseAdapter countryRows = new BaseAdapter() {
            @Override public int getCount() { return visible.size(); }
            @Override public String getItem(int position) { return visible.get(position); }
            @Override public long getItemId(int position) { return position; }
            @Override public View getView(int position, View convertView, ViewGroup parent) {
                TextView row = convertView instanceof TextView
                        ? (TextView) convertView : countries.text("LabelLarge", countries.primary);
                String code = getItem(position);
                boolean selected = region.equals(code);
                row.setText(countryName(code));
                row.setTextColor(countries.primary);
                row.setSelected(selected);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPaddingRelative(countries.dp(12), 0, countries.dp(12), 0);
                row.setMinimumHeight(countries.dp(48));
                row.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, selected
                        ? WatchViews.resource(context, "drawable", "ic_checked_checkbox") : 0, 0);
                row.setCompoundDrawableTintList(ColorStateList.valueOf(countries.secondary));
                return row;
            }
        };
        list.setAdapter(countryRows);
        list.setOnItemClickListener((parent, view, index, id) -> {
            countries.dialog.dismiss();
            String next = countryRows.getItem(index).toString();
            if (!region.equals(next)) setRegion(next);
        });
        countries.body.addView(list, new LinearLayout.LayoutParams(-1, 0, 1));
        watchText(field, text -> {
            String query = normal(text);
            visible.clear();
            for (String code : ordered) {
                if (normal(countryName(code)).contains(query)) visible.add(code);
            }
            countryRows.notifyDataSetChanged();
            list.setSelection(0);
        });
        countries.show(540);
        list.setSelection(Math.max(0, visible.indexOf(region)));
    }

    private void setRegion(String value) {
        region = value;
        checked = draft.computeIfAbsent(region, key -> new HashSet<>(preferences.services(key)));
        regionAction.setText(countryName(region));
        search.setText("");
        panel.body.requestFocus();
        load();
    }

    private void load() {
        int current = ++request;
        catalogPending = true;
        services = List.of();
        catalogIds = Set.of();
        search.setEnabled(false);
        refreshBulk();
        apply.setVisibility(View.INVISIBLE);
        status.setVisibility(View.VISIBLE);
        status.setText("Loading services…");
        status.setOnClickListener(null);
        status.setClickable(false);
        loading.setLoading(true);
        adapter.filter("");
        catalog.load(region, result -> {
            if (current != request || !panel.dialog.isShowing()) return;
            catalogPending = false;
            loading.setLoading(false);
            services = result;
            catalogIds = new HashSet<>();
            for (WatchAvailability.Service service : result) catalogIds.add(service.id());
            search.setEnabled(!result.isEmpty());
            apply.setVisibility(result.isEmpty() ? View.INVISIBLE : View.VISIBLE);
            refreshBulk();
            adapter.filter(search.getText().toString());
        }, () -> {
            if (current != request || !panel.dialog.isShowing()) return;
            catalogPending = false;
            loading.setLoading(false);
            status.setText("Couldn’t load services. Tap to retry.");
            status.setOnClickListener(v -> load());
        });
    }

    private void refreshBulk() {
        bulk.setVisibility(catalogIds.isEmpty() ? View.INVISIBLE : View.VISIBLE);
        bulk.setText(checked.containsAll(catalogIds) ? "Clear all" : "Select all");
    }

    private void gridToStart() {
        if (grid != null) grid.setSelection(0);
    }

    private void reorder() {
        int first = grid.getFirstVisiblePosition();
        adapter.filter(search.getText().toString());
        if (first >= 0 && first < adapter.getCount()) grid.setSelection(first);
    }

    private RippleDrawable neutralTile(int color, int outline) {
        return new RippleDrawable(ColorStateList.valueOf((panel.primary & 0xFFFFFF) | 0x25000000),
                panel.shape(color, 10, outline), panel.shape(Color.WHITE, 10, 0));
    }

    private static String normal(String value) { return value.trim().toLowerCase(Locale.ROOT); }
    private static String countryName(String code) { return new Locale("", code).getDisplayCountry(); }

    private static void watchText(EditText field, Consumer<String> changed) {
        field.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                changed.accept(s.toString());
            }
            @Override public void afterTextChanged(Editable value) {}
        });
    }

    private final class ServiceGrid extends BaseAdapter {
        private final List<WatchAvailability.Service> visible = new ArrayList<>();

        void filter(String input) {
            String query = normal(input);
            visible.clear();
            for (WatchAvailability.Service service : services) {
                if (checked.contains(service.id()) && normal(service.name()).contains(query)) {
                    visible.add(service);
                }
            }
            for (WatchAvailability.Service service : services) {
                if (!checked.contains(service.id()) && normal(service.name()).contains(query)) {
                    visible.add(service);
                }
            }
            notifyDataSetChanged();
            if (catalogPending) return;
            status.setVisibility(visible.isEmpty() ? View.VISIBLE : View.GONE);
            status.setText(services.isEmpty() ? "No services available in this region."
                    : "No services match your search.");
        }

        @Override public int getCount() { return visible.size(); }
        @Override public WatchAvailability.Service getItem(int position) { return visible.get(position); }
        @Override public long getItemId(int position) { return getItem(position).id(); }
        @Override public boolean hasStableIds() { return true; }

        @Override public View getView(int position, View recycled, ViewGroup parent) {
            Tile tile = recycled instanceof Tile ? (Tile) recycled : new Tile();
            WatchAvailability.Service service = getItem(position);
            tile.bind(service, checked.contains(service.id()));
            return tile;
        }
    }

    private final class Tile extends LinearLayout {
        final ImageView icon;
        final ImageView check;
        final TextView initials, label;
        boolean selected;

        Tile() {
            super(WatchServicePicker.this.context);
            setOrientation(VERTICAL);
            setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            setPadding(panel.dp(3), panel.dp(6), panel.dp(3), panel.dp(6));
            android.widget.FrameLayout logo = new android.widget.FrameLayout(context);
            icon = new ImageView(context);
            icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            initials = panel.text("TitleMedium", panel.secondary);
            initials.setGravity(Gravity.CENTER);
            initials.setBackground(panel.shape(panel.surface, 10, 0));
            logo.addView(initials, new android.widget.FrameLayout.LayoutParams(-1, -1));
            logo.addView(icon, new android.widget.FrameLayout.LayoutParams(-1, -1));
            android.widget.FrameLayout artwork = new android.widget.FrameLayout(context);
            artwork.addView(logo, new android.widget.FrameLayout.LayoutParams(panel.dp(38), panel.dp(38), Gravity.CENTER));
            check = new ImageView(context);
            check.setImageResource(WatchViews.resource(context, "drawable", "ic_m3_chip_check"));
            check.setImageTintList(ColorStateList.valueOf(AccentPresets.readableText(panel.surface, panel.primary)));
            check.setPadding(panel.dp(2), panel.dp(2), panel.dp(2), panel.dp(2));
            check.setBackground(panel.shape(panel.primary, 10, 0));
            check.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            artwork.addView(check, new android.widget.FrameLayout.LayoutParams(
                    panel.dp(14), panel.dp(14), Gravity.TOP | Gravity.END));
            addView(artwork, new LinearLayout.LayoutParams(panel.dp(48), panel.dp(42)));
            label = panel.text("LabelSmall", panel.secondary);
            label.setGravity(Gravity.TOP | Gravity.CENTER_HORIZONTAL);
            label.setLines(2);
            label.setEllipsize(TextUtils.TruncateAt.END);
            label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
            lp.topMargin = panel.dp(4);
            addView(label, lp);
        }

        void bind(WatchAvailability.Service service, boolean checked) {
            setContentDescription(service.name());
            label.setText(service.name());
            int codePoint = service.name().codePointAt(0);
            initials.setText(new String(Character.toChars(Character.toUpperCase(codePoint))));
            JustWatch.icon(icon, service.icon(), () -> initials.setVisibility(View.INVISIBLE));
            initials.setVisibility(icon.getDrawable() == null ? View.VISIBLE : View.INVISIBLE);
            setChecked(checked);
        }

        void setChecked(boolean checked) {
            selected = checked;
            int fill = checked ? androidx.core.graphics.ColorUtils.compositeColors(
                    (panel.primary & 0xFFFFFF) | 0x12000000, panel.surface) : panel.surface;
            int outline = checked ? androidx.core.graphics.ColorUtils.compositeColors(
                    (panel.secondary & 0xFFFFFF) | 0x99000000, panel.surface) : 0;
            setBackground(neutralTile(fill, outline));
            check.setVisibility(checked ? View.VISIBLE : View.GONE);
            setSelected(checked);
        }

        @Override public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName(android.widget.CheckBox.class.getName());
            info.setCheckable(true);
            info.setChecked(selected);
        }
    }
}
