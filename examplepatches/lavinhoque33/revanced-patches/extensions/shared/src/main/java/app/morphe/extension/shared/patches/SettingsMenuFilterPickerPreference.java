/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2029
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-20.
 */

package app.morphe.extension.shared.patches;

import static app.morphe.extension.shared.settings.preference.CustomDialogListPreference.ID_REVANCED_CHECK_ICON;
import static app.morphe.extension.shared.settings.preference.CustomDialogListPreference.ID_REVANCED_CHECK_ICON_PLACEHOLDER;
import static app.morphe.extension.shared.settings.preference.CustomDialogListPreference.ID_REVANCED_ITEM_TEXT;
import static app.morphe.extension.shared.settings.preference.CustomDialogListPreference.LAYOUT_REVANCED_CUSTOM_LIST_ITEM_CHECKED;
import static app.morphe.extension.shared.utils.StringRef.str;

import android.app.Dialog;
import android.content.Context;
import android.graphics.Typeface;
import android.preference.Preference;
import android.util.AttributeSet;
import android.util.Pair;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Predicate;

import app.morphe.extension.shared.patches.BaseSettingsMenuFilter.DiscoveredNode;
import app.morphe.extension.shared.settings.preference.AbstractPreferenceFragment;
import app.morphe.extension.shared.ui.CustomDialog;
import app.morphe.extension.shared.utils.BaseThemeUtils;

/**
 * Selecting a category grays and locks its children because the filter hides descendants
 * recursively, keeping the picker state consistent with what actually gets hidden.
 */
@SuppressWarnings({"unused", "deprecation"})
public class SettingsMenuFilterPickerPreference extends Preference {

    public SettingsMenuFilterPickerPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    public SettingsMenuFilterPickerPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    public SettingsMenuFilterPickerPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public SettingsMenuFilterPickerPreference(Context context) {
        super(context);
        init();
    }

    private void init() {
        setSelectable(true);
        setPersistent(false);
    }

    @Override
    protected void onClick() {
        showPickerDialog();
    }

    private void showPickerDialog() {
        Context context = getContext();
        List<Row> rows = buildRows(BaseSettingsMenuFilter.discoveredTree());

        LinearLayout content = new LinearLayout(context);
        content.setOrientation(LinearLayout.VERTICAL);

        Predicate<DiscoveredNode> selected = BaseSettingsMenuFilter.selectionSnapshot();
        HierarchyAdapter[] adapterRef = {null};
        boolean[] changesMade = {false};

        if (rows.isEmpty()) {
            TextView hint = new TextView(context);
            hint.setText(str("morphe_settings_menu_filter_picker_empty"));
            hint.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            hint.setTextColor(BaseThemeUtils.getAppForegroundColor());
            hint.setPadding(0, 24, 0, 24);
            content.addView(hint, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT));
        } else {
            ListView listView = new ListView(context);
            listView.setId(android.R.id.list);

            HierarchyAdapter adapter = new HierarchyAdapter(context, rows, selected);
            adapterRef[0] = adapter;
            listView.setAdapter(adapter);

            listView.setOnItemClickListener((parent, view, position, id) -> {
                Row row = adapter.getItem(position);
                if (row == null || adapter.isLockedByParent(row)) return;
                BaseSettingsMenuFilter.toggleDiscoveredRow(row.node());
                adapter.refreshSelection();
                changesMade[0] = true;
            });

            LinearLayout.LayoutParams listViewParams = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    0,
                    1.0f);
            content.addView(listView, listViewParams);
        }

        Pair<Dialog, LinearLayout> dialogPair = CustomDialog.create(
                context,
                getTitle() != null ? getTitle().toString() : "",
                null,
                null,
                null,
                () -> {
                    if (changesMade[0]) AbstractPreferenceFragment.setRestartNeeded();
                },
                null,
                str("revanced_settings_reset"),
                () -> {
                    if (BaseSettingsMenuFilter.hasSelections()) changesMade[0] = true;
                    BaseSettingsMenuFilter.clearFilter();
                    if (adapterRef[0] != null) adapterRef[0].refreshSelection();
                },
                false
        );

        LinearLayout mainLayout = dialogPair.second;
        mainLayout.addView(content, mainLayout.getChildCount() - 1,
                new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        1.0f));

        dialogPair.first.show();
    }

    private static List<Row> buildRows(List<DiscoveredNode> tree) {
        Map<String, DiscoveredNode> roots = new LinkedHashMap<>();
        Map<String, Map<String, DiscoveredNode>> childrenByParent = new HashMap<>();
        Map<String, Integer> labelCounts = new HashMap<>();

        for (DiscoveredNode node : tree) {
            String parent = node.parentIdentity();
            if (parent == null) {
                roots.putIfAbsent(node.identity(), node);
            } else {
                childrenByParent.computeIfAbsent(parent, key -> new LinkedHashMap<>())
                        .putIfAbsent(node.identity(), node);
            }
            labelCounts.merge(node.title(), 1, Integer::sum);
        }

        List<Row> rows = new ArrayList<>();
        for (DiscoveredNode root : roots.values()) {
            Map<String, DiscoveredNode> children = childrenByParent.get(root.identity());
            RowType type = children == null ? RowType.LEAF : RowType.CATEGORY;
            rows.add(new Row(type, root, null, displayTitle(root, labelCounts)));

            if (children != null) {
                for (DiscoveredNode child : children.values()) {
                    rows.add(new Row(RowType.CHILD, child, root, displayTitle(child, labelCounts)));
                }
            }
        }
        return rows;
    }

    private static String displayTitle(DiscoveredNode node, Map<String, Integer> labelCounts) {
        return node.key() != null && labelCounts.get(node.title()) > 1
                ? node.title() + " (" + node.key() + ")"
                : node.title();
    }

    private enum RowType { CATEGORY, LEAF, CHILD }

    private record Row(RowType type, DiscoveredNode node, @Nullable DiscoveredNode parent, String title) {}

    private static final class HierarchyAdapter extends BaseAdapter {
        private static final int CHILD_INDENT_DP = 24;
        private static final float DISABLED_ALPHA = 0.5f;

        private final Context context;
        private final List<Row> rows;
        private Predicate<DiscoveredNode> selected;
        private final int childIndentPx;
        private final int foregroundColor;

        HierarchyAdapter(Context context, List<Row> rows, Predicate<DiscoveredNode> selected) {
            this.context = context;
            this.rows = rows;
            this.selected = selected;
            this.childIndentPx = (int) (CHILD_INDENT_DP * context.getResources().getDisplayMetrics().density);
            this.foregroundColor = BaseThemeUtils.getAppForegroundColor();
        }

        @Override public int getCount() { return rows.size(); }
        @Override public Row getItem(int position) { return rows.get(position); }
        @Override public long getItemId(int position) { return position; }

        @Override
        public boolean isEnabled(int position) {
            return !isLockedByParent(rows.get(position));
        }

        boolean isLockedByParent(Row row) {
            return row.parent() != null && selected.test(row.parent());
        }

        void refreshSelection() {
            selected = BaseSettingsMenuFilter.selectionSnapshot();
            notifyDataSetChanged();
        }

        @NonNull
        @Override
        public View getView(int position, View convertView, @NonNull ViewGroup parent) {
            View view = convertView;
            Holder holder;
            if (view == null) {
                view = LayoutInflater.from(context)
                        .inflate(LAYOUT_REVANCED_CUSTOM_LIST_ITEM_CHECKED, parent, false);
                holder = new Holder();
                holder.placeholder = view.findViewById(ID_REVANCED_CHECK_ICON_PLACEHOLDER);
                holder.itemText = view.findViewById(ID_REVANCED_ITEM_TEXT);
                holder.checkIcon = view.findViewById(ID_REVANCED_CHECK_ICON);
                holder.defaultPaddingLeft = holder.itemText.getPaddingLeft();
                view.setTag(holder);
            } else {
                holder = (Holder) view.getTag();
            }

            Row row = rows.get(position);
            holder.itemText.setText(row.title());
            holder.itemText.setTextColor(foregroundColor);
            holder.itemText.setTypeface(null, row.type() == RowType.CATEGORY ? Typeface.BOLD : Typeface.NORMAL);
            holder.itemText.setPadding(
                    row.type() == RowType.CHILD ? holder.defaultPaddingLeft + childIndentPx : holder.defaultPaddingLeft,
                    holder.itemText.getPaddingTop(),
                    holder.itemText.getPaddingRight(),
                    holder.itemText.getPaddingBottom());

            boolean parentSelected = isLockedByParent(row);
            boolean visualChecked = parentSelected || selected.test(row.node());

            holder.checkIcon.setVisibility(visualChecked ? View.VISIBLE : View.GONE);
            holder.checkIcon.setColorFilter(foregroundColor);
            holder.placeholder.setVisibility(visualChecked ? View.GONE : View.VISIBLE);

            float alpha = parentSelected ? DISABLED_ALPHA : 1.0f;
            holder.itemText.setAlpha(alpha);
            holder.checkIcon.setAlpha(alpha);

            return view;
        }

        private static final class Holder {
            ImageView checkIcon;
            View placeholder;
            TextView itemText;
            int defaultPaddingLeft;
        }
    }
}
