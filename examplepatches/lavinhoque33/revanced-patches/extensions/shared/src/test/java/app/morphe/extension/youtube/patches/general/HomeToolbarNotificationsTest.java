/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.general;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import com.google.protobuf.ByteString;
import com.google.protobuf.InvalidProtocolBufferException;
import com.google.protobuf.MessageLite;

import org.junit.Test;

import java.util.List;

import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.BrowseEndpoint;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.ButtonRenderer;
import app.morphe.extension.youtube.innertube.GuideResponseOuterClass.NavigationEndpoint;
import app.morphe.extension.youtube.innertube.IconOuterClass.Icon;
import app.morphe.extension.youtube.innertube.IconOuterClass.YTIconType;

public class HomeToolbarNotificationsTest {
    private static final String HOME = "FEwhat_to_watch";
    private static final Object CAST_CONTROLLER = new Object();
    private static final ButtonRenderer SEARCH = button(YTIconType.SEARCH_CAIRO);
    private static final ButtonRenderer CREATE = button(YTIconType.CREATION_ENTRY);
    private static final ButtonRenderer SETTINGS = button(YTIconType.SETTINGS_CAIRO);
    private static final ButtonRenderer RESTORED_BELL = HomeToolbarNotifications.renderer("Notifications");

    @Test
    public void addsNativeInboxRendererBeforeStandardSearchWithoutChangingOtherActions() throws Exception {
        List<?> stock = List.of(CAST_CONTROLLER, SEARCH, SETTINGS);
        List<?> restored = restore(stock, HOME, true, false, false);
        assertEquals(List.of(CAST_CONTROLLER, RESTORED_BELL, SEARCH, SETTINGS), restored);
        assertSame(CAST_CONTROLLER, restored.get(0));
        assertSame(SEARCH, restored.get(2));
        assertSame(SETTINGS, restored.get(3));
        assertEquals(List.of(CAST_CONTROLLER, SEARCH, SETTINGS), stock);

        assertEquals(1156, RESTORED_BELL.getIcon().getYtIconTypeValue());
        assertEquals("Notifications", RESTORED_BELL.getButtonRendererAccessibilityData().getLabel());
        assertEquals("FEnotifications_inbox", RESTORED_BELL.getCommand().getBrowseEndpoint().getBrowseId());
        assertEquals(8, ButtonRenderer.ICON_FIELD_NUMBER);
        assertEquals(10, ButtonRenderer.BUTTONRENDERERACCESSIBILITYDATA_FIELD_NUMBER);
        assertEquals(19, ButtonRenderer.COMMAND_FIELD_NUMBER);
        assertEquals(48687626, NavigationEndpoint.BROWSEENDPOINT_FIELD_NUMBER);
        assertEquals(2, BrowseEndpoint.BROWSEID_FIELD_NUMBER);
    }

    @Test
    public void addsBeforeSettingsWhenSearchLivesInTheWideHeader() throws Exception {
        assertEquals(List.of(CAST_CONTROLLER, RESTORED_BELL, SETTINGS),
                restore(List.of(CAST_CONTROLLER, SETTINGS), HOME, true, false, false));
    }

    @Test
    public void leavesNativeBellAndItsUnknownFieldsUntouched() throws Exception {
        ButtonRenderer nativeBell = ButtonRenderer.parseFrom(button(YTIconType.TAB_ACTIVITY).toByteString()
                .concat(ByteString.copyFrom(new byte[]{0x70, 0x01})));
        List<?> stock = List.of(CAST_CONTROLLER, nativeBell, SEARCH);
        assertNull(restore(stock, HOME, true, false, false));
        assertSame(nativeBell, stock.get(1));

        ButtonRenderer inboxWithDifferentIcon = button(YTIconType.UNKNOWN).toBuilder().setNavigationEndpoint(
                NavigationEndpoint.newBuilder().setBrowseEndpoint(BrowseEndpoint.newBuilder().setBrowseId("FEactivity")))
                .build();
        assertNull(restore(List.of(inboxWithDifferentIcon, SEARCH), HOME, true, false, false));
        assertNull(restore(List.of(RESTORED_BELL, SEARCH), HOME, true, false, false));
    }

    @Test
    public void skipsYouOtherTabsGuestsAndHiddenToolbarBell() throws Exception {
        List<?> stock = List.of(SEARCH, SETTINGS);
        assertNull(restore(stock, "FElibrary", true, false, false));
        assertNull(restore(stock, "FEsubscriptions", true, false, false));
        assertNull(restore(stock, null, true, false, false));
        assertNull(restore(stock, HOME, false, false, false));
        assertNull(restore(stock, HOME, true, true, false));
    }

    @Test
    public void onlyVisibleBottomBellPreventsRestoreAndToolbarCreateIsPreserved() throws Exception {
        List<?> stock = List.of(CREATE, SEARCH);
        assertNull(restore(stock, HOME, true, false, true));
        List<?> restored = restore(stock, HOME, true, false, false);
        assertEquals(List.of(CREATE, RESTORED_BELL, SEARCH), restored);
        assertSame(CREATE, restored.get(0));
    }

    @Test
    public void hiddenOrUnservedBottomBellDoesNotCountAsVisible() {
        assertTrue(HomeToolbarNotifications.hasBottomBell(false, false, true));
        assertFalse(HomeToolbarNotifications.hasBottomBell(false, true, true));
        assertFalse(HomeToolbarNotifications.hasBottomBell(true, false, true));
        assertFalse(HomeToolbarNotifications.hasBottomBell(false, false, false));
    }

    private static ButtonRenderer button(YTIconType icon) {
        return ButtonRenderer.newBuilder().setIcon(Icon.newBuilder().setYtIconType(icon)).build();
    }

    private static List<?> restore(List<?> stock, String browseId, boolean signedIn, boolean hidden,
                                   boolean bottomBell) throws InvalidProtocolBufferException {
        return HomeToolbarNotifications.withBell(stock, browseId, signedIn, hidden, bottomBell,
                item -> item instanceof MessageLite message ? message : null, () -> RESTORED_BELL);
    }
}
