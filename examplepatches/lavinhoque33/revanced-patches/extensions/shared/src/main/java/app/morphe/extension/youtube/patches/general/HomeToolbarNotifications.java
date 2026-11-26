/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general;

import androidx.annotation.Nullable;

import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.MessageLite;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;
import java.util.function.Supplier;

import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.BrowseEndpoint;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.ButtonRenderer;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.ButtonRendererAccessibilityData;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.NavigationEndpoint;
import app.morphe.extension.youtube.innertube.IconOuterClass.Icon;
import app.morphe.extension.youtube.innertube.IconOuterClass.YTIconType;

final class HomeToolbarNotifications {
    private static final String HOME = "FEwhat_to_watch";
    static final String INBOX = "FEnotifications_inbox";

    private HomeToolbarNotifications() {
    }

    static boolean hasBottomBell(boolean navBarHidden, boolean bottomBellHidden, boolean guideHasBell) {
        return guideHasBell && !navBarHidden && !bottomBellHidden;
    }

    /** Builds the same ButtonRenderer used by the action bar, with a native inbox browse command. */
    static ButtonRenderer renderer(String label) {
        return ButtonRenderer.newBuilder()
                .setIcon(Icon.newBuilder().setYtIconType(YTIconType.TAB_ACTIVITY_CAIRO))
                .setButtonRendererAccessibilityData(ButtonRendererAccessibilityData.newBuilder().setLabel(label))
                .setCommand(NavigationEndpoint.newBuilder()
                        .setBrowseEndpoint(BrowseEndpoint.newBuilder().setBrowseId(INBOX)))
                .build();
    }

    /** The model is shared by both toolbar layouts; only copy the actual Home menu when adding an item. */
    @Nullable
    static List<Object> withBell(Collection<?> menu, @Nullable String browseId, boolean signedIn,
                                 boolean hidden, boolean bottomBellVisible,
                                 Function<Object, MessageLite> readRenderer, Supplier<Object> makeBell)
            throws InvalidProtocolBufferException {
        if (!HOME.equals(browseId) || !signedIn || hidden || bottomBellVisible) {
            return null;
        }

        int insertIndex = menu.size();
        int index = 0;
        for (Object item : menu) {
            MessageLite message = readRenderer.apply(item);
            if (message != null) {
                ButtonRenderer renderer = ButtonRenderer.parseFrom(message.toByteArray());
                YTIconType icon = renderer.getIcon().getYtIconType();
                if (icon == YTIconType.TAB_ACTIVITY || icon == YTIconType.TAB_ACTIVITY_CAIRO
                        || opensInbox(renderer.getNavigationEndpoint()) || opensInbox(renderer.getCommand())) {
                    return null;
                }

                if (insertIndex == menu.size() && isTrailingToolbarAction(icon)) {
                    insertIndex = index;
                }
            }
            index++;
        }

        Object bell = makeBell.get();
        if (bell == null) {
            return null;
        }

        ArrayList<Object> expanded = new ArrayList<>(menu.size() + 1);
        index = 0;
        for (Object item : menu) {
            if (index++ == insertIndex) {
                expanded.add(bell);
            }
            expanded.add(item);
        }
        if (index == insertIndex) {
            expanded.add(bell);
        }
        return expanded;
    }

    private static boolean isTrailingToolbarAction(YTIconType icon) {
        return icon == YTIconType.SEARCH || icon == YTIconType.SEARCH_BOLD
                || icon == YTIconType.SEARCH_CAIRO || icon == YTIconType.SETTINGS_CAIRO;
    }

    private static boolean opensInbox(NavigationEndpoint endpoint) {
        String id = endpoint.getBrowseEndpoint().getBrowseId();
        return INBOX.equals(id) || "FEactivity".equals(id) || "FEnotifications".equals(id)
                || "FEsandbox_activity_page".equals(id);
    }
}
