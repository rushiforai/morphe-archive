import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import dev.supperelias2.sbs.morphe.features.BufferRecoveryHooks;
import dev.supperelias2.sbs.morphe.features.BufferRecoveryHooks.Policy;

public final class BufferRecoveryHooksTest {
    private static int assertions;

    private static void eq(String reason, Object expected, Object actual) {
        assertions++;
        if (!expected.equals(actual)) throw new AssertionError(reason + ": expected " + expected + ", got " + actual);
    }

    private static final class Parameters {
        final float speed;
        final float pitch;
        Parameters(float speed, float pitch) { this.speed = speed; this.pitch = pitch; }
    }

    /** Non-public concrete class models Media3's ExoPlayerImpl reflection access. */
    private static final class Player {
        final List<String> calls = new ArrayList<>();
        final Object item = new Object();
        long position = 123_456L;
        Parameters parameters = new Parameters(1.75f, 1f);
        public void stop() { calls.add("stop"); position = 0; parameters = new Parameters(1f, 1f); }
        public void prepare() { calls.add("prepare"); }
        public void seekTo(long position) { calls.add("seek"); this.position = position; }
        public void play() { calls.add("play"); }
        public long getCurrentPosition() { return position; }
        public Parameters getPlaybackParameters() { return parameters; }
        public void setPlaybackParameters(Parameters parameters) { calls.add("parameters"); this.parameters = parameters; }
    }

    private static final class IncompletePlayer {
        boolean stopped;
        public void stop() { stopped = true; }
    }

    private static void bounds() {
        Policy policy = new Policy();
        Object player = new Object();
        Object item = new Object();
        eq("initial sample starts clock", false, policy.shouldRecover(0L, "episode", player, item, true));
        eq("no early recovery", false, policy.shouldRecover(24_999L, "episode", player, item, true));
        eq("first recovery after 25s", true, policy.shouldRecover(25_000L, "episode", player, item, true));
        eq("attempt consumed", 1, policy.attempts());
        eq("second stall must reach threshold", false, policy.shouldRecover(49_999L, "episode", player, item, true));
        eq("second recovery after another25s", true, policy.shouldRecover(50_000L, "episode", player, item, true));
        eq("two-attempt budget exhausted", false, policy.shouldRecover(100_000L, "episode", player, item, true));
        eq("no unbounded later retries", false, policy.shouldRecover(1_000_000L, "episode", player, item, true));
        eq("budget stays2", 2, policy.attempts());
        eq("replacement player does not reset same-media budget", false, policy.shouldRecover(1_000_001L, "episode", new Object(), item, true));
        eq("new media starts fresh clock", false, policy.shouldRecover(1_000_002L, "next", player, item, true));
        eq("new media has own budget", 0, policy.attempts());
        eq("new media can recover", true, policy.shouldRecover(1_025_002L, "next", player, item, true));
    }

    private static void interruptions() {
        Object player = new Object();
        Object item = new Object();
        for (String reason : new String[]{"pause", "background", "live", "DAI", "DRM", "player error", "ads", "setting disabled"}) {
            Policy policy = new Policy();
            policy.shouldRecover(0L, "episode", player, item, true);
            eq(reason + " interrupts continuous stall", false, policy.shouldRecover(24_000L, "episode", player, item, false));
            eq(reason + " resume starts clock again", false, policy.shouldRecover(26_000L, "episode", player, item, true));
            eq(reason + " old time is not carried over", false, policy.shouldRecover(50_999L, "episode", player, item, true));
            eq(reason + " new full stall can recover", true, policy.shouldRecover(51_000L, "episode", player, item, true));
        }
        Policy replaced = new Policy();
        replaced.shouldRecover(0L, "episode", player, item, true);
        Object nextPlayer = new Object();
        eq("player replacement resets clock", false, replaced.shouldRecover(24_000L, "episode", nextPlayer, item, true));
        eq("replacement does not inherit old timer", false, replaced.shouldRecover(25_000L, "episode", nextPlayer, item, true));
        eq("replacement can recover after full delay", true, replaced.shouldRecover(49_000L, "episode", nextPlayer, item, true));
        Object nextItem = new Object();
        eq("item replacement resets clock", false, replaced.shouldRecover(50_000L, "episode", nextPlayer, nextItem, true));
        eq("item replacement retains spent budget", 1, replaced.attempts());
        eq("item replacement second attempt only", true, replaced.shouldRecover(75_000L, "episode", nextPlayer, nextItem, true));
        replaced.resetClock();
        eq("off/on does not reset spent budget", false, replaced.shouldRecover(1_000_000L, "episode", nextPlayer, nextItem, true));
        Policy missing = new Policy();
        eq("missing media id rejected", false, missing.shouldRecover(100_000L, "", player, item, true));
        eq("missing player rejected", false, missing.shouldRecover(100_000L, "episode", null, item, true));
        eq("missing item rejected", false, missing.shouldRecover(100_000L, "episode", player, null, true));
        missing.shouldRecover(100L, "episode", player, item, true);
        eq("backward clock cannot fire recovery", false, missing.shouldRecover(50L, "episode", player, item, true));
    }

    private static void gates() {
        eq("focused clear direct buffering eligible", true, Policy.eligible(true, true, true, false, true, true, true, 2));
        eq("disabled excluded", false, Policy.eligible(false, true, true, false, true, true, true, 2));
        eq("background excluded", false, Policy.eligible(true, false, true, false, true, true, true, 2));
        eq("live or DAI excluded", false, Policy.eligible(true, true, false, false, true, true, true, 2));
        eq("ads excluded", false, Policy.eligible(true, true, true, true, true, true, true, 2));
        eq("DRM or unknown config excluded", false, Policy.eligible(true, true, true, false, false, true, true, 2));
        eq("existing player error excluded", false, Policy.eligible(true, true, true, false, true, false, true, 2));
        eq("pause excluded", false, Policy.eligible(true, true, true, false, true, true, false, 2));
        eq("IDLE excluded", false, Policy.eligible(true, true, true, false, true, true, true, 1));
        eq("READY excluded", false, Policy.eligible(true, true, true, false, true, true, true, 3));
        eq("ENDED excluded", false, Policy.eligible(true, true, true, false, true, true, true, 4));
    }

    private static void restart() {
        Player player = new Player();
        Object originalItem = player.item;
        Object originalParameters = player.parameters;
        eq("same-player restart succeeds", true, BufferRecoveryHooks.restart(player));
        eq("action order is bounded deterministic", Arrays.asList("stop", "prepare", "seek", "parameters", "play"), player.calls);
        eq("position preserved", 123_456L, player.position);
        eq("item unchanged", originalItem, player.item);
        eq("original parameters restored", originalParameters, player.parameters);
        eq("custom speed preserved", 1.75f, player.parameters.speed);
        eq("pitch preserved", 1f, player.parameters.pitch);
        IncompletePlayer missingApi = new IncompletePlayer();
        eq("missing API rejects restart", false, BufferRecoveryHooks.restart(missingApi));
        eq("all methods resolve before mutation", false, missingApi.stopped);
        eq("missing player rejected", false, BufferRecoveryHooks.restart(null));
    }

    public static void main(String[] args) {
        bounds();
        interruptions();
        gates();
        restart();
        System.out.println("BufferRecoveryHooks semantic checks passed: " + assertions + " assertions");
    }
}
