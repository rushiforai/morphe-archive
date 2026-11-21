/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.assertEquals;
import static org.robolectric.Shadows.shadowOf;

import android.os.Looper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.LooperMode;

import java.time.Duration;
import java.util.concurrent.atomic.AtomicInteger;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
@LooperMode(LooperMode.Mode.PAUSED)
public class MinimalMiniplayerTickerTest {
    @Test
    public void rapidExpandAndMinimizeKeepsOnlyTheNewRefreshSchedule() {
        var calls = new AtomicInteger();
        var ticker = new MinimalMiniplayerPatch.BarTicker(calls::incrementAndGet);
        var main = shadowOf(Looper.getMainLooper());

        ticker.setRunning(true);
        main.idleFor(Duration.ofMillis(250));
        ticker.setRunning(false);
        ticker.setRunning(true);
        main.idleFor(Duration.ofMillis(250));
        assertEquals(0, calls.get()); // The first session's callback did not run.
        main.idleFor(Duration.ofMillis(750));
        assertEquals(2, calls.get());

        ticker.setRunning(false);
        main.idleFor(Duration.ofSeconds(2));
        assertEquals(2, calls.get());
    }
}
