/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/5197
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-25.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.youtube.patches.ghostplay;

import static app.morphe.extension.shared.utils.StringRef.str;

import android.content.res.ColorStateList;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.NavigationBar;
import app.morphe.extension.youtube.shared.ShortsPlayerState;
import app.morphe.extension.youtube.shared.VideoInformation;
import app.morphe.extension.youtube.utils.ThemeUtils;

import java.lang.ref.WeakReference;
import java.util.List;

/** Inserts native-size actions beside Search instead of drawing over the glass toolbar. */
public final class GhostPlayToolbarButton {
    private static final String TOOLBAR_TAG = "morphe_ghost_actions";
    private static WeakReference<View> searchAnchor = new WeakReference<>(null);
    private static String browseId = "";
    private static boolean listenersRegistered;

    private GhostPlayToolbarButton() {}

    public static void onToolbarButton(String name, View view, ImageView image) {
        if (!GhostPlayPatch.isEnabled() || !Settings.GHOST_PLAY_TOOLBAR_BUTTON.get()
                || !(name.equals("SEARCH") || name.equals("SEARCH_BOLD") || name.equals("SEARCH_CAIRO"))) return;
        searchAnchor = new WeakReference<>(view);
        if (!listenersRegistered) {
            listenersRegistered = true;
            ShortsPlayerState.getOnChange().addObserver(open -> {
                Utils.runOnMainThread(GhostPlayToolbarButton::refresh);
                return kotlin.Unit.INSTANCE;
            });
            NavigationBar.addOnNavigationButtonChangedListener(tab -> {
                if (tab == NavigationBar.NavigationButton.SHORTS) clearBrowseId();
                else Utils.runOnMainThread(GhostPlayToolbarButton::refresh);
            });
        }
        view.post(GhostPlayToolbarButton::refresh);
    }

    public static void setBrowseId(String id) {
        browseId = id == null ? "" : id;
        Utils.runOnMainThread(GhostPlayToolbarButton::refresh);
    }

    public static void clearBrowseId() {
        setBrowseId(null);
    }

    public static void refresh() {
        View item = searchAnchor.get();
        if (item == null) return;
        ViewGroup menu;
        while (true) {
            if (!(item.getParent() instanceof ViewGroup parent)) return;
            if (parent.getClass().getSimpleName().contains("ActionMenuView")) {
                menu = parent;
                break;
            }
            item = parent;
        }

        LinearLayout group = menu.findViewWithTag(TOOLBAR_TAG);
        boolean visible = GhostPlayPatch.isEnabled() && Settings.GHOST_PLAY_TOOLBAR_BUTTON.get()
                && !NavigationBar.isSearchBarActive() && !ShortsPlayerState.getCurrent().isOpen();
        if (!visible) {
            if (group != null) group.setVisibility(View.GONE);
            return;
        }
        if (group == null) {
            group = createGroup(item);
            menu.addView(group, menu.indexOfChild(item));
        }
        group.setVisibility(View.VISIBLE);

        View session = group.getChildAt(0);
        ImageView sessionIcon = (ImageView) ((LinearLayout) session).getChildAt(0);
        TextView timer = (TextView) ((LinearLayout) session).getChildAt(1);
        boolean active = GhostPlayPatch.isSessionGhostActive();
        long minutes = GhostPlayPatch.getTimedGhostRemainingMinutes();
        setIcon(sessionIcon, active ? "morphe_ghost_play_button_on" : "morphe_ghost_play_button_off");
        session.setContentDescription(str(active ? "morphe_ghost_play_session_on_toast"
                : "morphe_ghost_play_dialog_title"));
        timer.setVisibility(minutes > 0 ? View.VISIBLE : View.GONE);
        if (minutes > 0) timer.setText(str("morphe_ghost_play_toolbar_timed_badge", minutes));

        ImageView channel = (ImageView) group.getChildAt(1);
        if (!isChannelPage()) {
            channel.setVisibility(View.GONE);
            channel.setOnClickListener(null);
            return;
        }
        String id = browseId;
        boolean autoGhost = GhostChannelStore.contains(id, null);
        channel.setVisibility(View.VISIBLE);
        channel.setActivated(autoGhost);
        setIcon(channel, autoGhost ? "morphe_ghost_play_button_on" : "morphe_ghost_play_channels");
        channel.setContentDescription(str(autoGhost ? "morphe_ghost_play_channels_disable_here"
                : "morphe_ghost_play_channels_enable_here"));
        channel.setOnClickListener(view -> {
            if (GhostPlayPatch.isEnabled() && isChannelPage() && browseId.equals(id)) toggleChannel(id);
        });
    }

    private static boolean isChannelPage() {
        return browseId.length() == 24 && browseId.startsWith("UC") && NavigationBar.isBackButtonVisible();
    }

    private static LinearLayout createGroup(View anchor) {
        var context = anchor.getContext();
        LinearLayout group = new LinearLayout(context);
        group.setTag(TOOLBAR_TAG);
        group.setOrientation(LinearLayout.HORIZONTAL);
        group.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout session = new LinearLayout(context);
        session.setGravity(Gravity.CENTER);
        session.setPaddingRelative(Dim.dp4, 0, Dim.dp4, 0);
        session.setMinimumWidth(Dim.dp48);
        setActionBackground(session);
        ImageView icon = new ImageView(context);
        session.addView(icon, new LinearLayout.LayoutParams(Dim.dp24, Dim.dp24));
        TextView timer = new TextView(context);
        timer.setTextColor(ThemeUtils.getAppForegroundColor());
        timer.setTextSize(11);
        session.addView(timer);
        session.setOnClickListener(v -> GhostPlayPatch.toggleSessionGhostMode());
        session.setOnLongClickListener(v -> {
            GhostHistoryDialog.showQuickMenu(context);
            return true;
        });
        group.addView(session, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, Dim.dp48));

        ImageView channel = new ImageView(context);
        channel.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
        channel.setPadding(Dim.dp12, Dim.dp12, Dim.dp12, Dim.dp12);
        setActionBackground(channel);
        channel.setOnLongClickListener(v -> {
            GhostChannelManagerDialog.show(context, GhostPlayToolbarButton::refresh);
            return true;
        });
        group.addView(channel, new LinearLayout.LayoutParams(Dim.dp48, Dim.dp48));
        return group;
    }

    private static void setActionBackground(View view) {
        TypedValue value = new TypedValue();
        if (view.getContext().getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless,
                value, true)) view.setBackgroundResource(value.resourceId);
        view.setFocusable(true);
    }

    private static void setIcon(ImageView target, String name) {
        if (!name.equals(target.getTag())) {
            Drawable icon = ResourceUtils.getDrawable(name);
            if (icon != null) target.setImageDrawable(icon);
            target.setTag(name);
        }
        target.setImageTintList(ColorStateList.valueOf(ThemeUtils.getAppForegroundColor()));
    }

    private static void toggleChannel(String id) {
        String name = id.equals(VideoInformation.getChannelId()) ? VideoInformation.getChannelName() : id;
        if (name.isEmpty()) name = id;
        if (GhostChannelStore.remove(id, null)) {
            Utils.showToastShort(str("morphe_ghost_play_channel_removed_toast", name));
        } else {
            GhostChannelStore.addOrUpdate(new GhostChannelStore.ChannelEntry(id, name, "", "", "", "",
                    List.of(), System.currentTimeMillis()));
            GhostPlayPatch.markCurrentVideoIfMatchesChannel();
            Utils.showToastShort(str("morphe_ghost_play_channel_added_toast", name));
        }
        refresh();
    }
}
