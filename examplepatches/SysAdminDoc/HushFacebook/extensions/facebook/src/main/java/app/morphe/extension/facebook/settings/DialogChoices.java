/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.res.ColorStateList;
import android.database.DataSetObserver;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.CheckedTextView;
import android.widget.ListAdapter;

/** Styles the framework's real single-choice rows without replacing their selection behavior. */
final class DialogChoices extends BaseAdapter {
    private final ListAdapter source;
    private final ScreenColors colors;

    DialogChoices(ListAdapter source, ScreenColors colors) {
        this.source = source;
        this.colors = colors;
    }

    @Override public int getCount() { return source.getCount(); }
    @Override public Object getItem(int position) { return source.getItem(position); }
    @Override public long getItemId(int position) { return source.getItemId(position); }
    @Override public boolean hasStableIds() { return source.hasStableIds(); }
    @Override public boolean isEnabled(int position) { return source.isEnabled(position); }
    @Override public boolean areAllItemsEnabled() { return source.areAllItemsEnabled(); }
    @Override public int getItemViewType(int position) { return source.getItemViewType(position); }
    @Override public int getViewTypeCount() { return source.getViewTypeCount(); }
    @Override public void registerDataSetObserver(DataSetObserver observer) { source.registerDataSetObserver(observer); }
    @Override public void unregisterDataSetObserver(DataSetObserver observer) { source.unregisterDataSetObserver(observer); }

    @Override public View getView(int position, View recycled, ViewGroup parent) {
        View row = source.getView(position, recycled, parent);
        if (row instanceof CheckedTextView) {
            CheckedTextView choice = (CheckedTextView) row;
            float density = row.getResources().getDisplayMetrics().density;
            choice.setTextColor(colors.title);
            choice.setTextSize(16);
            choice.setSingleLine(false);
            choice.setMaxLines(Integer.MAX_VALUE);
            choice.setMinHeight(Math.round(48 * density));
            ColorStateList indicator = new ColorStateList(new int[][]{{android.R.attr.state_checked}, {}},
                    new int[]{colors.accent, colors.summary});
            choice.setCheckMarkTintList(indicator);
            // Material's framework layout uses a start drawable for its radio indicator.
            for (android.graphics.drawable.Drawable drawable : choice.getCompoundDrawablesRelative()) {
                if (drawable != null) drawable.mutate().setTintList(indicator);
            }
            StateListDrawable background = new StateListDrawable();
            background.addState(new int[]{android.R.attr.state_checked}, new ColorDrawable((colors.accent & 0xFFFFFF) | 0x22000000));
            background.addState(new int[]{}, new ColorDrawable(android.graphics.Color.TRANSPARENT));
            choice.setBackground(background);
            // Rounding both sides up at densities such as 450dpi exceeds the measured 48dp row.
            int verticalPadding = (int) (8 * density);
            choice.setPaddingRelative(Math.round(20 * density), verticalPadding,
                    Math.round(20 * density), verticalPadding);
        }
        return row;
    }
}
