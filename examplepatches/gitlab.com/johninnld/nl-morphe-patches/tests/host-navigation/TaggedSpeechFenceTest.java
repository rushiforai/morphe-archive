import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import nl.johninnl.warningprobe.TaggedSpeechFence;

/** Host-only tests: never package these fake native ABI objects into the APK. */
public final class TaggedSpeechFenceTest {
    public static final class Voice {
        public boolean n;
        public int s;
        public int releases;
        public void f() { releases++; if (s > 0) s--; }
        // Deliberately hostile equals/hashCode: registry must use object identity.
        @Override public boolean equals(Object other) { return other instanceof Voice; }
        @Override public int hashCode() { return 1; }
    }
    public static final class Closure {
        public final byte f;
        public final Object h;
        Closure(byte selector, Object voice) { f = selector; h = voice; }
        @Override public boolean equals(Object other) { return other instanceof Closure; }
        @Override public int hashCode() { return 1; }
    }
    private static Closure tagged(Voice voice) {
        TaggedSpeechFence.begin(voice);
        try {
            voice.s++;
            Closure closure = new Closure((byte) 1, voice);
            TaggedSpeechFence.capture(closure);
            return closure;
        } finally { TaggedSpeechFence.end(); }
    }
    private static void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
    }
    private static void reset() { TaggedSpeechFence.reset(); }
    public static void main(String[] args) {
        reset();
        Voice voice = new Voice();
        Closure closure = tagged(voice);
        check(TaggedSpeechFence.allow(closure), "eligible tagged closure must dispatch");
        check(!TaggedSpeechFence.allow(closure), "duplicate eligible allow must not replay speech");
        check(voice.releases == 0 && voice.s == 1, "dispatched native callback retains focus ownership");

        reset(); voice = new Voice(); closure = tagged(voice);
        TaggedSpeechFence.cancel(voice);
        check(!TaggedSpeechFence.allow(closure), "source cancellation rejects tagged closure");
        check(!TaggedSpeechFence.allow(closure), "cancel tombstone rejects duplicate allow");
        check(voice.releases == 1 && voice.s == 0, "pending source cancel releases exactly once");

        reset(); voice = new Voice(); closure = tagged(voice);
        TaggedSpeechFence.invalidate(voice); // Original n() entry hook, before native reset.
        voice.s = 0; // Original n() resets focus count.
        Closure route = new Closure((byte) 1, voice);
        voice.s++; // A new, unrelated native route prompt acquires focus.
        check(!TaggedSpeechFence.allow(closure), "native stop invalidates delayed external closure");
        check(!TaggedSpeechFence.allow(closure), "native-stop tombstone survives duplicate allow");
        check(voice.releases == 0 && voice.s == 1, "stale closure must never decrement new route focus");
        check(TaggedSpeechFence.allow(route), "untagged new route remains executable");

        reset(); voice = new Voice(); closure = tagged(voice);
        route = new Closure((byte) 1, voice); voice.s++;
        TaggedSpeechFence.capture(route); // Native route constructed outside external scope.
        TaggedSpeechFence.cancel(voice);
        check(!TaggedSpeechFence.allow(closure), "selective cancel rejects external closure");
        check(TaggedSpeechFence.allow(route), "selective cancel preserves unrelated native route");
        check(voice.releases == 1 && voice.s == 1, "selective cancel leaves route focus alone");

        reset(); voice = new Voice(); closure = tagged(voice); voice.n = true;
        check(!TaggedSpeechFence.allow(closure), "full mute rejects tagged speech at output boundary");
        check(voice.releases == 1, "mute without native stop balances pending acquisition");

        reset(); voice = new Voice(); voice.n = true;
        route = new Closure((byte) 1, voice);
        TaggedSpeechFence.capture(route);
        TaggedSpeechFence.invalidate(voice); TaggedSpeechFence.cancel(voice);
        check(TaggedSpeechFence.allow(route), "untagged native closure must stay inert even if muted");
        check(TaggedSpeechFence.allow(new Object()), "untagged object requires no reflective ABI");
        check(voice.releases == 0, "untagged calls must not release native focus");

        reset(); voice = new Voice();
        TaggedSpeechFence.begin(voice);
        Closure ui = new Closure((byte) 0, new Object());
        try { TaggedSpeechFence.capture(ui); } finally { TaggedSpeechFence.end(); }
        TaggedSpeechFence.cancel(voice);
        check(TaggedSpeechFence.allow(ui), "merged selector zero UI closure must remain inert");
        check(voice.releases == 0, "UI selector must not release voice focus");

        reset(); voice = new Voice();
        TaggedSpeechFence.begin(voice);
        boolean nestedRejected = false;
        try { TaggedSpeechFence.begin(voice); }
        catch (IllegalStateException expected) { nestedRejected = true; }
        finally { TaggedSpeechFence.end(); }
        check(nestedRejected, "nested synchronous scopes must reject");

        reset(); voice = new Voice();
        TaggedSpeechFence.begin(voice);
        TaggedSpeechFence.invalidate(voice);
        closure = new Closure((byte) 1, voice);
        try { TaggedSpeechFence.capture(closure); } finally { TaggedSpeechFence.end(); }
        check(!TaggedSpeechFence.allow(closure), "capture retains scope-begin native-stop generation");
        check(voice.releases == 0, "scope-begin stale capture cannot release post-stop focus");

        reset(); voice = new Voice();
        Voice other = new Voice();
        TaggedSpeechFence.begin(voice);
        route = new Closure((byte) 1, other);
        try { TaggedSpeechFence.capture(route); } finally { TaggedSpeechFence.end(); }
        TaggedSpeechFence.cancel(voice);
        check(TaggedSpeechFence.allow(route), "closure for other voice must remain untagged");

        reset(); voice = new Voice(); other = new Voice();
        Closure one = tagged(voice);
        Closure two = tagged(other);
        TaggedSpeechFence.cancel(voice);
        check(!TaggedSpeechFence.allow(one), "identity cancel must reject first voice token");
        check(TaggedSpeechFence.allow(two), "equal but distinct voice/closure must stay eligible");
        check(voice.releases == 1 && other.releases == 0, "identity registry must not cross focus ownership");

        reset(); voice = new Voice();
        int limit = ((Number) TaggedSpeechFence.snapshot().get("max_live_closures")).intValue();
        List<Closure> keepAlive = new ArrayList<>();
        for (int index = 0; index < limit; index++) keepAlive.add(tagged(voice));
        boolean overflowRejected = false;
        try { tagged(voice); }
        catch (IllegalStateException expected) { overflowRejected = expected.getMessage().contains("bound exceeded"); }
        check(overflowRejected, "live token bound must fail explicitly rather than evict");
        TaggedSpeechFence.cancel(voice);
        check(!TaggedSpeechFence.allow(keepAlive.get(0)), "oldest live tombstone cannot be silently evicted");
        check(!TaggedSpeechFence.allow(keepAlive.get(0)), "oldest cancellation stays rejected on duplicate allow");
        check(voice.releases == 1, "bound overflow must not break exactly-once pending release");
        check(((Number) TaggedSpeechFence.snapshot().get("live_closures")).intValue() == limit,
                "all live tombstones retained at bound");

        reset();
        boolean abiRejected = false;
        try { TaggedSpeechFence.begin(new Object()); }
        catch (IllegalStateException expected) { abiRejected = expected.getMessage().contains("ABI"); }
        check(abiRejected, "missing native mute/focus ABI must fail explicitly");
        Map<String, Object> snapshot = TaggedSpeechFence.snapshot();
        check(snapshot.containsKey("max_live_closures"), "bounds must be explicit in snapshot");
        System.out.println("PASS TaggedSpeechFenceTest: lifecycle, duplicates, selective cancellation, native-stop/new-route, mute, untagged, UI, identity, bounds, scope and ABI cases");
    }
}
