package io.github.sabopura.morphe.extension.twitch.chat;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static org.junit.Assert.*;

public class UnfollowButtonTest {
    /** Twitch's buttons are objects named by their toString. */
    private static Object button(String name) {
        return new Object() {
            @Override public String toString() {
                return name;
            }
        };
    }

    private static List<String> names(List<?> buttons) {
        List<String> names = new ArrayList<>();
        for (Object button : buttons) names.add(String.valueOf(button));
        return names;
    }

    @Test public void anArrayListLosesTheHeartInPlace() {
        // 31.9.0 and 32.0.0 declare an ArrayList, and the patch casts what comes back to one.
        ArrayList<Object> buttons = new ArrayList<>(Arrays.asList(
                button("UnfollowIconButton"), button("NotificationButton"), button("SubscribeButton")));
        assertSame(buttons, ViewCustomization.withoutUnfollow(buttons));
        assertEquals(Arrays.asList("NotificationButton", "SubscribeButton"), names(buttons));
    }

    @Test public void aReadOnlyListIsAnsweredWithACopyWithoutTheHeart() {
        // 30.7.2 declares a List; removing from a read-only one throws, which used to leave the heart.
        List<Object> buttons = Collections.unmodifiableList(Arrays.asList(
                button("NotificationButton"), button("UnfollowIconButton"), button("SubscribeButton")));
        List<?> kept = ViewCustomization.withoutUnfollow(buttons);
        assertEquals(Arrays.asList("NotificationButton", "SubscribeButton"), names(kept));
        assertEquals("Twitch's own list is left alone", 3, buttons.size());
    }

    @Test public void aListWithoutTheHeartIsReturnedAsItIs() {
        List<Object> buttons = Collections.unmodifiableList(Arrays.asList(button("FollowButton"), button("SubscribeButton")));
        assertSame(buttons, ViewCustomization.withoutUnfollow(buttons));
        List<Object> none = Collections.emptyList();
        assertSame(none, ViewCustomization.withoutUnfollow(none));
    }
}
