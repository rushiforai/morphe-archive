package e.e.a;

public final class PlaybackRoutingTest {
    public static final class Owner {
        public Object e, a0;
        public String f, b0;
    }
    private static void check(boolean condition, String detail) {
        if (!condition) throw new AssertionError(detail);
    }
    public static void main(String[] args) {
        check(!PlaybackRouting.shouldRoutePopup(false, false), "idle opens normally");
        check(!PlaybackRouting.shouldRoutePopup(false, true), "stale background flag opens normally");
        check(!PlaybackRouting.shouldRoutePopup(true, true), "background playback does not capture another video");
        check(PlaybackRouting.shouldRoutePopup(true, false), "existing popup routing remains available");
        Owner service = new Owner();
        Object first = new Object(), second = new Object();
        service.e = first; service.f = "sm1";
        check(PlaybackRouting.sameMediaBinding(service, true, first, "sm1"), "unchanged binding reused");
        service.e = second; service.f = "sm2";
        check(!PlaybackRouting.sameMediaBinding(service, true, first, "sm1"), "second video replaces released player");
        check(!PlaybackRouting.sameMediaBinding(service, true, second, "sm1"), "video metadata is rebound");
        check(PlaybackRouting.sameMediaBinding(service, true, second, "sm2"), "new media controls bind second player");
        service.e = new Object();
        check(!PlaybackRouting.sameMediaBinding(service, true, second, "sm2"), "replaying the same video replaces its player too");
        service.a0 = first; service.b0 = "sm3";
        check(PlaybackRouting.sameMediaBinding(service, false, first, "sm3"), "normal playback uses its own fields");
        check(!PlaybackRouting.sameMediaBinding(null, true, first, "sm1"), "missing owner is not reusable");
        check(!PlaybackRouting.sameMediaBinding(new Object(), true, first, "sm1"), "unknown owner is not reusable");
        System.out.println("Background routing and replacement-player binding tests passed.");
    }
}
