package app.bitchord.telegram;

import androidx.media3.common.Player;

import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

public final class SmoothUpgradeTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    public static void main(String[] args) {
        List<String> calls = new ArrayList<>();
        Player player =
                (Player)
                        Proxy.newProxyInstance(
                                Player.class.getClassLoader(),
                                new Class<?>[] {Player.class},
                                (proxy, method, arguments) -> {
                                    switch (method.getName()) {
                                        case "hashCode":
                                            return System.identityHashCode(proxy);
                                        case "equals":
                                            return proxy == arguments[0];
                                        case "getPlaybackState":
                                            return Player.STATE_READY;
                                        default:
                                            // Reading the player changes nothing.
                                            if (!method.getName().startsWith("get"))
                                                calls.add(method.getName());
                                            return null;
                                    }
                                });
        // The host test build links against the compile-only service, whose swap always
        // declines, so this exercises the fallback: BitChord's original three calls, in order.
        SmoothUpgrade.enabled = true;
        SmoothUpgrade.replace(new Object(), player, 0, null);
        SmoothUpgrade.seekTo(player, 0, 1234);
        SmoothUpgrade.prepare(player);
        check(
                calls.equals(List.of("replaceMediaItem", "seekTo", "prepare")),
                "Declined swap falls back to the original calls: " + calls);
        check(
                SmoothUpgrade.settled(player) == Player.STATE_READY,
                "No swap of ours waiting: BitChord's own swaps see the real state");
        calls.clear();
        SmoothUpgrade.enabled = false;
        SmoothUpgrade.replace(new Object(), player, 0, null);
        SmoothUpgrade.seekTo(player, 0, 1234);
        SmoothUpgrade.prepare(player);
        check(
                calls.equals(List.of("replaceMediaItem", "seekTo", "prepare")),
                "Switched off, the original calls run");
        System.out.println("PASS: " + checks + " smooth-upgrade fallback checks.");
    }
}
