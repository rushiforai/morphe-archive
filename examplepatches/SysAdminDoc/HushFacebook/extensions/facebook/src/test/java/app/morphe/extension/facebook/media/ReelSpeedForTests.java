/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.media;

import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/** What tests outside this package need of Keep the reel speed: one pick and the next reel. */
public final class ReelSpeedForTests {
    private ReelSpeedForTests() { }

    /**
     * Picks 1.5x on a reel in the Reels viewer, then starts the next reel there. True when the next
     * reel got the picked speed. Leaves nothing kept behind.
     */
    public static boolean keepsAPickedSpeed() {
        ReelSpeed.forget();
        List<Float> set = new ArrayList<>();
        Map<Object, Object> params = new IdentityHashMap<>();
        ReelSpeed.access = new ReelSpeed.Player() {
            @Override
            public void setSpeed(Object player, float speed) {
                set.add(speed);
            }

            @Override
            public Object origin(Object player) {
                return "fb_shorts_viewer";
            }

            @Override
            public Object params(Object player) {
                return params.computeIfAbsent(player, p -> new Object());
            }

            @Override
            public boolean reel(Object videoParams) {
                return true;
            }

            @Override
            public boolean ad(Object videoParams) {
                return false;
            }

            @Override
            public boolean live(Object videoParams) {
                return false;
            }
        };
        try {
            ReelSpeed.speedSet(new Object(), 1.5f);
            ReelSpeed.picked(1.5f);
            ReelSpeed.started(new Object());
            return !set.isEmpty();
        } finally {
            ReelSpeed.forget();
        }
    }
}
