package dev.twitchpatches.extension.ui;

import java.util.List;
import java.util.Set;
import org.junit.Test;
import static org.junit.Assert.*;

public final class UiClassicActionsTest {
    private final List<String> buttons = List.of("FollowButton", "bits_button_chat", "subscribe_button", "gift_button_chat", "new_action");

    @Test public void disabledOverridesKeepTheOriginalListAndUnknownActions() {
        assertSame(buttons, UiClassicActions.filter(buttons, id -> id, key -> false));
        assertSame(buttons, UiClassicActions.filter(buttons, id -> id, "unregistered_key"::equals));
    }

    @Test public void filtersBeforeSpacingPreservingOrderFollowAndUnknownActions() {
        Set<String> hidden = Set.of("classic_support_hide_bits", "classic_support_hide_gift");
        assertEquals(List.of("FollowButton", "subscribe_button", "new_action"), UiClassicActions.filter(buttons, id -> id, hidden::contains));
        assertEquals(5, buttons.size());
        assertEquals(List.of("FollowButton", "new_action"), UiClassicActions.filter(buttons, id -> id, key -> true));
    }

    @Test public void everyKnownActionCanCollapseTheNativeRowAndRestoreWithoutMutatingModels() {
        List<String> actions = buttons.subList(1, 4);
        assertTrue(UiClassicActions.filter(actions, id -> id, key -> true).isEmpty());
        assertSame(actions, UiClassicActions.filter(actions, id -> id, key -> false));
    }

    @Test public void chatSubscribeIdentityUsesTheSamePreferenceAsOtherSubscribeButtons() {
        var actions = List.of("subscribe_button_chat", "gift_button_chat", "bits_button_chat");
        assertTrue(UiClassicActions.filter(actions, id -> id, key -> true).isEmpty());
        assertSame(actions, UiClassicActions.filter(actions, id -> id, key -> false));
        assertEquals(List.of("gift_button_chat", "bits_button_chat"),
                UiClassicActions.filter(actions, id -> id, "classic_support_hide_subscribe"::equals));
    }

    @Test public void metadataActionsKeepFollowAndNotificationWhileHidingGiftAndUpgrade() {
        var actions = List.of("follow_button", "notification_button", "gift_button", "upgrade_sub_button", "subscribe_button");
        assertEquals(List.of("follow_button", "notification_button"), UiClassicActions.filter(actions, id -> id, key -> true));
        assertSame(actions, UiClassicActions.filter(actions, id -> id, key -> false));
    }
}
