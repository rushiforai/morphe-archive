/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.settings.preference;

import android.content.Context;
import android.preference.Preference;
import android.preference.SwitchPreference;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.ListView;
import android.widget.Switch;

import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.tiktok.Utils;
import app.morphe.extension.tiktok.settings.L10n;
import app.morphe.extension.tiktok.settings.SettingsSearchHistory;

/**
 * A switch found by the settings search, flipped where it stands. It saves under the setting's own
 * key, so the page's change handling treats it exactly like the row on its page.
 *
 * <p>Not a {@link TogglePreference}: the title and summary arrive translated from the search index,
 * with the restart sentence and the page name already in them, and that class would look them up
 * again and add the sentence a second time in every language but English.
 */
@SuppressWarnings("deprecation")
final class SearchTogglePreference extends SwitchPreference {
    private static final int LOCATION_OWNER = 0x7f7f4004;
    private final String query;
    private final Runnable locate;

    SearchTogglePreference(
            Context context,
            String title,
            String summary,
            BooleanSetting setting,
            String query,
            Runnable locate) {
        super(context);
        this.query = query;
        this.locate = locate;
        setTitle(title);
        setSummary(summary);
        setKey(setting.key);
        setChecked(setting.savedValue());
    }

    /**
     * Flipping a found switch is the search doing its job, so it's kept like opening a result
     * (#232).
     */
    @Override
    protected void onClick() {
        SettingsSearchHistory.add(query);
        super.onClick();
    }

    boolean openLocation() {
        if (!isEnabled()) return false;
        SettingsSearchHistory.add(query);
        locate.run();
        return true;
    }

    static void clearLocationAction(View row) {
        if (row != null && row.getTag(LOCATION_OWNER) instanceof Preference) {
            row.setTag(LOCATION_OWNER, null);
            row.setAccessibilityDelegate(null);
        }
    }

    private static ListView owner(View row, Preference preference) {
        if (!row.isAttachedToWindow() || row.getTag(LOCATION_OWNER) != preference) return null;
        for (ViewParent parent = row.getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof ListView) {
                ListView list = (ListView) parent;
                int position = list.getPositionForView(row);
                return position >= 0
                                && position < list.getCount()
                                && list.getItemAtPosition(position) == preference
                        ? list
                        : null;
            }
        }
        return null;
    }

    static void bindTapOnly(View view, Preference preference) {
        view.setTag(LOCATION_OWNER, preference);
        view.setAccessibilityDelegate(
                new View.AccessibilityDelegate() {
                    @Override
                    public void onInitializeAccessibilityNodeInfo(
                            View host, AccessibilityNodeInfo info) {
                        super.onInitializeAccessibilityNodeInfo(host, info);
                        ListView list = owner(host, preference);
                        if (list == null) return;
                        list.onInitializeAccessibilityNodeInfoForItem(
                                host, list.getPositionForView(host), info);
                        info.setLongClickable(false);
                        info.removeAction(
                                AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK);
                    }

                    @Override
                    public boolean performAccessibilityAction(
                            View host, int action, android.os.Bundle args) {
                        ListView list = owner(host, preference);
                        if (list == null || !preference.isEnabled()) return false;
                        if (action == AccessibilityNodeInfo.ACTION_LONG_CLICK) return false;
                        if (action == AccessibilityNodeInfo.ACTION_CLICK) {
                            int position = list.getPositionForView(host);
                            return list.performItemClick(
                                    host, position, list.getItemIdAtPosition(position));
                        }
                        return super.performAccessibilityAction(host, action, args);
                    }
                });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        Utils.setTitleAndSummaryColor(view);
        view.setTag(LOCATION_OWNER, this);
        // ListView owns touch clicks and long clicks. Making its child long-clickable steals taps.
        view.setAccessibilityDelegate(
                new View.AccessibilityDelegate() {
                    @Override
                    public void onInitializeAccessibilityNodeInfo(
                            View host, AccessibilityNodeInfo info) {
                        super.onInitializeAccessibilityNodeInfo(host, info);
                        ListView list = owner(host, SearchTogglePreference.this);
                        if (list == null) return;
                        info.setCollectionItemInfo(
                                AccessibilityNodeInfo.CollectionItemInfo.obtain(
                                        list.getPositionForView(host),
                                        1,
                                        0,
                                        1,
                                        false,
                                        host.isSelected()));
                        info.setClassName(Switch.class.getName());
                        info.setCheckable(true);
                        info.setChecked(isChecked());
                        info.setEnabled(isEnabled());
                        info.setClickable(isEnabled());
                        info.setLongClickable(isEnabled());
                        if (isEnabled()) {
                            info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
                            info.addAction(
                                    new AccessibilityNodeInfo.AccessibilityAction(
                                            AccessibilityNodeInfo.ACTION_LONG_CLICK,
                                            L10n.t(getContext(), "Open setting location")));
                        }
                    }

                    @Override
                    public boolean performAccessibilityAction(
                            View host, int action, android.os.Bundle args) {
                        ListView list = owner(host, SearchTogglePreference.this);
                        if (list == null || !isEnabled()) return false;
                        if (action == AccessibilityNodeInfo.ACTION_LONG_CLICK)
                            return openLocation();
                        if (action == AccessibilityNodeInfo.ACTION_CLICK) {
                            int position = list.getPositionForView(host);
                            return list.performItemClick(
                                    host, position, list.getItemIdAtPosition(position));
                        }
                        return super.performAccessibilityAction(host, action, args);
                    }
                });
    }
}
