package app.spicetify.extension.spotify.extensions;

import static java.nio.charset.StandardCharsets.UTF_8;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import com.spotify.cosmos.cosmos.Lifetime;
import com.spotify.cosmos.cosmos.Request;
import com.spotify.cosmos.cosmos.ResolveCallback;
import com.spotify.cosmos.cosmos.Response;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.FutureTask;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35, manifest = Config.NONE)
public class PlayerBridgeTest {
    /** Generous, so only a hang fails a test, never a slow machine. */
    static final long CEILING_SECONDS = 60;
    private static final String SKIP_NEXT = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/SkipNext";
    private static final String GET_STATE = "sp://esperanto/spotify.player.esperanto.proto.ContextPlayer/GetState";

    private final Context context = RuntimeEnvironment.getApplication();
    private final FakeRouter router = new FakeRouter();
    private final List<PlayerBridge.StateListener> listeners = new ArrayList<>();

    @Before
    public void attachAFakeRouter() {
        // The bridge is process-wide, so each test points it at its own application and router.
        Extensions.setAppContext(context);
        PlayerBridge.attach(router);
    }

    @After
    public void removeListeners() {
        for (PlayerBridge.StateListener listener : listeners) PlayerBridge.removeStateListener(listener);
    }

    // ---- Calls ----

    @Test
    public void callPostsToEsperantoAndDeliversTheBodyOnTheBridgeThread() throws Exception {
        Answer answer = new Answer();
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[] {1, 2}, answer);

        FakeRequest request = router.only();
        assertEquals("POST", request.action);
        assertEquals(SKIP_NEXT, request.uri);
        assertArrayEquals(new byte[] {1, 2}, request.body);

        request.callback.onResponse(200, new byte[] {7});

        answer.await();
        assertArrayEquals(new byte[] {7}, answer.body);
        assertEquals("Spicetify player bridge", answer.thread);
        assertTrue("an answered call releases its request", request.cancelled);
    }

    @Test
    public void getSendsAPlainCosmosGet() throws Exception {
        Answer answer = new Answer();
        PlayerBridge.get("sp://auth/v2/token?renew=0", answer);

        FakeRequest request = router.only();
        assertEquals("GET", request.action);
        assertEquals("sp://auth/v2/token?renew=0", request.uri);
        assertArrayEquals(new byte[0], request.body);
        request.callback.onResponse(200, "{}".getBytes(UTF_8));

        answer.await();
        assertEquals("{}", new String(answer.body, UTF_8));
    }

    @Test
    public void aStatusOtherThan200Fails() throws Exception {
        Answer answer = new Answer();
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);

        router.only().callback.onResponse(500, new byte[0]);

        answer.await();
        assertEquals("status 500", answer.reason);
        assertNull(answer.body);
    }

    @Test
    public void aRouterErrorFails() throws Exception {
        Answer answer = new Answer();
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);
        FakeRequest request = router.only();

        request.callback.onError(new IllegalStateException("router gone"));

        answer.await();
        assertTrue(answer.reason, answer.reason.contains("router gone"));
        assertTrue("an error releases the request", request.cancelled);
    }

    @Test
    public void aCallbackCopiesTheBodyAndLeavesTheWorkToTheBridgeThread() throws Exception {
        CountDownLatch busy = new CountDownLatch(1);
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], new PlayerBridge.Result() {
            @Override
            public void done(byte[] body) {
                awaitQuietly(busy);
            }

            @Override
            public void failed(String reason) {}
        });
        Answer answer = new Answer();
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);

        router.requests.get(0).callback.onResponse(200, new byte[0]); // holds the bridge thread
        byte[] body = {5};
        router.requests.get(1).callback.onResponse(200, body); // returns while the bridge thread is held
        body[0] = 6; // Spotify owns this array once its callback returns
        busy.countDown();

        answer.await();
        assertArrayEquals(new byte[] {5}, answer.body);
    }

    @Test
    public void onlyTheFirstAnswerCountsEvenWhenItArrivesBeforeResolveReturns() throws Exception {
        router.answerWhileResolving = new byte[] {42};
        Answer answer = new Answer();

        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);

        FakeRequest request = router.only();
        assertTrue("released as soon as resolve handed it back", request.cancelled);
        request.callback.onResponse(500, new byte[0]);
        flush(router);
        assertEquals(1, answer.count);
        assertArrayEquals(new byte[] {42}, answer.body);
    }

    @Test
    public void aDestroyedRouterFailsCallsWithBridgeNotConnected() throws Exception {
        router.destroyed = true;
        Answer answer = new Answer();

        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);

        answer.await();
        assertEquals("bridge not connected", answer.reason);
        assertTrue(router.requests.isEmpty());
        assertFalse(PlayerBridge.connected());
    }

    @Test
    public void aRouterDestroyedAfterTheBridgesCheckFailsTheCallWithoutCallingIn() throws Exception {
        FakeService service = new FakeService();
        PlayerBridge.attach(CosmosRouter.reflective(service));
        service.router.destroyAfterFirstCheck = true;
        Answer answer = new Answer();

        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);

        answer.await();
        assertEquals("bridge not connected", answer.reason);
        assertNull("never sent to the destroyed router", service.router.request);
    }

    @Test
    public void attachingANewRouterFailsTheOldRoutersPendingCalls() throws Exception {
        Answer answer = new Answer();
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], answer);
        FakeRequest pending = router.only();
        FakeRouter replacement = new FakeRouter();

        PlayerBridge.attach(replacement);

        answer.await();
        assertEquals("bridge not connected", answer.reason);
        assertTrue("its request is released", pending.cancelled);
        pending.callback.onResponse(200, new byte[] {1}); // a late answer from the old router
        flush(replacement);
        assertEquals(1, answer.count);
        assertNull(answer.body);
    }

    // ---- The player state stream ----

    @Test
    public void theFirstListenerOpensOneStreamAndRemovingTheLastCancelsIt() {
        States first = listen(new States());

        FakeRequest stream = router.only();
        assertEquals("SUB", stream.action);
        assertEquals(GET_STATE, stream.uri);
        assertArrayEquals(Esperanto.getState(), stream.body);

        States second = listen(new States());
        assertEquals("a second listener opens none", 1, router.requests.size());

        PlayerBridge.removeStateListener(first);
        assertFalse(stream.cancelled);
        PlayerBridge.removeStateListener(second);
        assertTrue(stream.cancelled);
    }

    @Test
    public void aStateReachesListenersParsed() throws Exception {
        States states = listen(new States());

        router.only().callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));

        Esperanto.PlayerState state = states.next();
        assertEquals("spotify:track:x", state.trackUri);
        assertEquals("uid-1", state.trackUid);
        assertEquals(2, state.artistUris.size());
        assertEquals("Spicetify player bridge", states.thread);
        assertSame(state, PlayerBridge.lastState());
    }

    @Test
    public void removingTheLastListenerForgetsTheLastState() throws Exception {
        States states = listen(new States());
        router.only().callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));
        states.next();

        PlayerBridge.removeStateListener(states);

        assertNull("no stream, so the track may have changed", PlayerBridge.lastState());
    }

    @Test
    public void aStreamErrorForgetsTheStateShowsWhyAndTheNextListenerReopens() throws Exception {
        States states = listen(new States());
        FakeRequest stream = router.only();
        stream.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));
        states.next();

        FutureTask<String> line = new FutureTask<>(PlayerBridge::problemLine);
        onBridge(() -> {
            stream.callback.onError(new IllegalStateException("stream gone"));
            PlayerBridge.post(line); // behind the error's handling, and before its reopen
            return null;
        });

        assertEquals("Player bridge: stream error, retrying"
                + " (The player state stream ended: java.lang.IllegalStateException: stream gone)",
                line.get(CEILING_SECONDS, TimeUnit.SECONDS)); // the error has been handled by now
        assertTrue("an ended stream is released", stream.cancelled);
        assertNull(PlayerBridge.lastState());

        listen(new States());
        FakeRequest reopened = router.requests.get(router.requests.size() - 1);
        assertEquals("SUB", reopened.action);
        assertEquals(GET_STATE, reopened.uri);
        reopened.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:y"));
        assertEquals("spotify:track:y", states.next().trackUri);
        assertNull(PlayerBridge.problemLine());
        assertEquals("a good state clears the problem", "Player bridge: waiting for Spotify", lineWhileDestroyed(router));
    }

    @Test
    public void anEndedStreamOpensAgainAfterABackoffThatDoublesUntilAStateArrives() throws Exception {
        FakeRouter waiting = new FakeRouter();
        PlayerBridge.attach(waiting);
        States states = listen(new States());

        FakeRequest second = reopenedAfter(waiting.next(), waiting, 1000);
        FakeRequest third = reopenedAfter(second, waiting, 2000); // doubled
        third.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));
        states.next(); // a state sets the backoff back to a second
        reopenedAfter(third, waiting, 1000);
    }

    @Test
    public void theReopenWaitDoublesUpToAMinute() {
        assertEquals(2000, PlayerBridge.nextBackoff(1000));
        assertEquals(60_000, PlayerBridge.nextBackoff(32_000));
        assertEquals("a minute is the most", 60_000, PlayerBridge.nextBackoff(60_000));
    }

    @Test
    public void anErrorAnswerEndsTheStreamWhichOpensAgainAfterTheBackoffUntilAStateArrives() throws Exception {
        FakeRouter waiting = new FakeRouter();
        PlayerBridge.attach(waiting);
        States states = listen(new States());
        FakeRequest first = waiting.next();

        // Spotify's core answers 404 until its player is ready, and ends the subscription.
        FakeRequest second = reopenedAfter(first, waiting, 1000, 404);
        assertTrue("the ended subscription is released", first.cancelled);
        assertEquals("Player bridge: waiting for Spotify (Couldn't read the player state: status 404)",
                lineWhileDestroyed(waiting));
        FakeRequest third = reopenedAfter(second, waiting, 2000, 404); // doubled
        third.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));
        assertEquals("spotify:track:x", states.next().trackUri);
        assertEquals("spotify:track:x", PlayerBridge.lastState().trackUri);
        assertEquals("the state clears the problem", "Player bridge: waiting for Spotify", lineWhileDestroyed(waiting));
        reopenedAfter(third, waiting, 1000, 404); // the state set the backoff back to a second
        assertNull("an error answer forgets the last state", PlayerBridge.lastState());
    }

    @Test
    public void aStreamSpotifyWontOpenIsTriedAgainASecondLater() throws Exception {
        FakeRouter waiting = new FakeRouter();
        AtomicBoolean refused = new AtomicBoolean();
        PlayerBridge.attach(new CosmosRouter() {
            @Override
            public Cancel resolve(String action, String uri, byte[] body, Callback callback) {
                if (refused.compareAndSet(false, true)) throw new IllegalStateException("refused");
                return waiting.resolve(action, uri, body, callback);
            }

            @Override
            public boolean destroyed() {
                return false;
            }
        });

        States states = new States();
        listeners.add(states);
        FutureTask<String> line = new FutureTask<>(PlayerBridge::problemLine);
        onBridge(() -> {
            PlayerBridge.addStateListener(states); // refused, so a reopen is due in a second
            PlayerBridge.post(line); // due now, so before that reopen
            return null;
        });

        assertEquals("Player bridge: stream error, retrying"
                + " (Couldn't open the player state stream: java.lang.IllegalStateException: refused)",
                line.get(CEILING_SECONDS, TimeUnit.SECONDS));
        FakeRequest retried = waiting.next();
        assertEquals("SUB", retried.action);
        assertEquals(GET_STATE, retried.uri);
    }

    @Test
    public void aReopenOpensNothingWhileAStreamIsOpenOrOnceNothingListens() throws Exception {
        FakeRouter waiting = new FakeRouter();
        PlayerBridge.attach(waiting);
        States first = listen(new States());
        FakeRequest ended = waiting.next();

        // A new listener opens a stream while the reopen is due, and the reopen leaves it alone. The
        // listener comes in a task queued right behind the error's handling, so before the reopen, and
        // the probe, queued behind both and due a second later, runs after the reopen.
        States second = new States();
        listeners.add(second);
        FutureTask<Integer> afterReopen = new FutureTask<>(waiting.requests::size);
        onBridge(() -> {
            ended.callback.onError(new IllegalStateException("stream gone"));
            PlayerBridge.post(() -> PlayerBridge.addStateListener(second));
            PlayerBridge.post(() -> PlayerBridge.postDelayed(afterReopen, 1000));
            return null;
        });
        FakeRequest opened = waiting.next();
        assertEquals("the new listener's stream, and no second one",
                2, (int) afterReopen.get(CEILING_SECONDS, TimeUnit.SECONDS));

        // That stream ends too, and nothing listens by the time its reopen is due, 2 s later. The
        // listeners go in a task queued right behind the error's handling, so before that reopen.
        FutureTask<Integer> afterSecondReopen = new FutureTask<>(waiting.requests::size);
        onBridge(() -> {
            opened.callback.onError(new IllegalStateException("stream gone again"));
            PlayerBridge.post(() -> {
                PlayerBridge.removeStateListener(first);
                PlayerBridge.removeStateListener(second);
            });
            PlayerBridge.post(() -> PlayerBridge.postDelayed(afterSecondReopen, 2000));
            return null;
        });
        assertEquals("no stream when nothing listens", 2, (int) afterSecondReopen.get(CEILING_SECONDS, TimeUnit.SECONDS));
    }

    @Test
    public void aFailureWhileAReopenIsDueSchedulesNoSecondReopen() throws Exception {
        FakeRouter waiting = new FakeRouter();
        AtomicInteger resolves = new AtomicInteger();
        PlayerBridge.attach(new CosmosRouter() {
            @Override
            public Cancel resolve(String action, String uri, byte[] body, Callback callback) {
                if (resolves.incrementAndGet() == 2) throw new IllegalStateException("refused");
                return waiting.resolve(action, uri, body, callback);
            }

            @Override
            public boolean destroyed() {
                return false;
            }
        });
        listen(new States());
        FakeRequest ended = waiting.next();

        // The stream ends, so a reopen is due in a second and the backoff is now 2 s. A listener queued
        // behind the end finds Spotify refusing to open the stream: that must not schedule a second
        // reopen, or double the backoff again.
        States second = new States();
        listeners.add(second);
        onBridge(() -> {
            ended.callback.onError(new IllegalStateException("stream gone"));
            PlayerBridge.post(() -> PlayerBridge.addStateListener(second));
            return null;
        });
        FakeRequest reopened = waiting.next(); // the reopen that was due
        reopenedAfter(reopened, waiting, 2000);
    }

    @Test
    public void aNewRouterStartsTheRetryOver() throws Exception {
        FakeRouter old = new FakeRouter();
        PlayerBridge.attach(old);
        listen(new States());
        FakeRequest ended = old.next();
        FakeRouter replacement = new FakeRouter();
        // The new router comes half a second after the error, by the bridge's own clock. It's scheduled
        // before the error is even handled, so it falls due after that handling and before the old
        // router's reopen, however slow the machine.
        FutureTask<Void> attached = new FutureTask<>(() -> PlayerBridge.attach(replacement), null);
        onBridge(() -> {
            PlayerBridge.postDelayed(attached, 500);
            ended.callback.onError(new IllegalStateException("stream gone"));
            return null;
        });
        attached.get(CEILING_SECONDS, TimeUnit.SECONDS);
        FakeRequest moved = replacement.next(); // the stream moved to it at once

        // Its stream ends too: it reopens a whole second later, not when the old router's reopen was due.
        reopenedAfter(moved, replacement, 1000);
        assertEquals("nothing more went to the old router", 1, old.requests.size());
    }

    @Test
    public void aThrowingListenerDoesNotStopTheOthers() throws Exception {
        listen(state -> {
            throw new IllegalStateException("listener failed");
        });
        States states = listen(new States());

        router.only().callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));

        assertEquals("spotify:track:x", states.next().trackUri);
    }

    @Test
    public void attachingANewRouterMovesTheStreamToIt() throws Exception {
        States states = listen(new States());
        FakeRequest old = router.only();

        FakeRouter replacement = new FakeRouter();
        PlayerBridge.attach(replacement);

        assertTrue(old.cancelled);
        FakeRequest reopened = replacement.only();
        assertEquals("SUB", reopened.action);
        assertEquals(GET_STATE, reopened.uri);

        // What the old router still had queued is dropped; the bridge thread runs tasks in order. An
        // answer it can't read leaves no problem behind, since that stream is gone.
        old.callback.onResponse(200, new byte[] {0x12, 0x05, 'a'});
        onBridge(() -> null);
        assertEquals("Player bridge: waiting for Spotify", lineWhileDestroyed(replacement));
        old.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:old"));
        reopened.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:new"));
        assertEquals("spotify:track:new", states.next().trackUri);
    }

    @Test
    public void aStateThatCantBeReadIsReportedAndTheStreamStaysOpen() throws Exception {
        States states = listen(new States());
        FakeRequest stream = router.only();

        byte[] truncated = {0x12, 0x05, 'a'}; // field 2 declares 5 bytes and carries 1
        FutureTask<Integer> dueReopen = new FutureTask<>(router.requests::size);
        onBridge(() -> {
            stream.callback.onResponse(200, truncated);
            // Behind the answer's handling, and due when a reopen of an ended stream would be.
            PlayerBridge.post(() -> PlayerBridge.postDelayed(dueReopen, 1000));
            return null;
        });
        assertEquals("the stream is alive, so no new SUB", 1, (int) dueReopen.get(CEILING_SECONDS, TimeUnit.SECONDS));
        assertNull("connected, with the stream open", PlayerBridge.problemLine());
        assertEquals("Player bridge: waiting for Spotify (Couldn't read the player state: Truncated message)",
                lineWhileDestroyed(router));

        stream.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));
        assertEquals("spotify:track:x", states.next().trackUri);
        assertFalse(stream.cancelled);
        assertEquals("a good state clears it", "Player bridge: waiting for Spotify", lineWhileDestroyed(router));
    }

    @Test
    public void theProblemLineIsNullWhileTheBridgeWorks() throws Exception {
        router.destroyed = true;
        assertEquals("Player bridge: waiting for Spotify", PlayerBridge.problemLine());
        router.destroyed = false;
        assertNull("connected", PlayerBridge.problemLine());

        States states = listen(new States());
        FakeRequest stream = router.only();
        stream.callback.onResponse(200, EsperantoTest.contextPlayerState("spotify:track:x"));
        states.next();
        assertNull("connected and playing", PlayerBridge.problemLine());
    }

    // ---- Spotify's router, through reflection ----

    @Test
    public void reflectiveBuildsSpotifysRequestAndMapsItsCallback() throws Exception {
        FakeService service = new FakeService();
        CosmosRouter reflective = CosmosRouter.reflective(service);
        Recorded recorded = new Recorded();

        CosmosRouter.Cancel cancel = reflective.resolve("SUB", GET_STATE, new byte[] {3}, recorded);

        Request request = service.router.request;
        assertEquals("SUB", request.getAction());
        assertEquals(GET_STATE, request.getUri());
        assertArrayEquals(new byte[] {3}, request.getBody());

        ResolveCallback callback = service.router.callback;
        callback.onResolved(new Response(200, new byte[] {9}));
        assertEquals(200, recorded.status);
        assertArrayEquals(new byte[] {9}, recorded.body);
        IllegalStateException error = new IllegalStateException("gone");
        callback.onError(error);
        assertSame(error, recorded.error);

        // Spotify may keep callbacks in hashed collections, so the proxy answers Object's methods.
        assertTrue(callback.equals(callback));
        assertFalse(callback.equals(new Object()));
        Set<ResolveCallback> callbacks = new HashSet<>();
        callbacks.add(callback);
        assertTrue(callbacks.contains(callback));
        assertNotNull(callback.toString());

        assertEquals(0, service.router.released);
        cancel.cancel();
        assertEquals(1, service.router.released);

        assertFalse(reflective.destroyed());
        service.router.destroyed = true;
        assertTrue(reflective.destroyed());
    }

    @Test
    public void onCosmosAttachesSpotifysRouterAndStartsTheExtensionsThatAreOn() throws Exception {
        CountDownLatch started = new CountDownLatch(1);
        Extensions.onSwitch("test_started", (switchContext, on) -> {
            if (on && switchContext == context) started.countDown();
        });
        context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE).edit()
                .putBoolean("test_started", true).commit();
        Extensions.setAppContext(null);
        FakeService service = new FakeService();

        PlayerBridge.onCosmos(service, true);

        assertSame("found through the router's class loader", context, Extensions.appContext());
        assertTrue(PlayerBridge.connected());
        assertTrue("an extension that is on starts with Spotify", started.await(CEILING_SECONDS, TimeUnit.SECONDS));
        PlayerBridge.call(Esperanto.CONTEXT_PLAYER, "SkipNext", new byte[0], new Answer());
        assertEquals(SKIP_NEXT, service.router.request.getUri());
    }

    @Test
    public void withoutTheExtensionsPatchOnCosmosConnectsTheBridgeButStartsNoExtension() throws Exception {
        AtomicBoolean started = new AtomicBoolean();
        Extensions.onSwitch("test_left_on", (switchContext, on) -> started.set(true));
        // Switched on in an earlier build that had the extensions patch.
        context.getSharedPreferences("spicetify_extensions", Context.MODE_PRIVATE).edit()
                .putBoolean("test_left_on", true).commit();
        FakeService service = new FakeService();

        PlayerBridge.onCosmos(service); // Home pins alone: InstalledPatches.extensions() is false, as in every test
        onBridge(() -> null); // runs after anything onCosmos posted

        assertTrue(PlayerBridge.connected());
        assertFalse("nothing starts without the extensions patch", started.get());
        PlayerBridge.call(Esperanto.YOUR_LIBRARY, "All", Esperanto.yourLibraryAll(), new Answer());
        assertEquals("sp://esperanto/" + Esperanto.YOUR_LIBRARY + "/All", service.router.request.getUri());
    }

    @Test
    public void onCosmosWithoutSpotifysRouterKeepsTheBridgeAndShowsWhy() {
        PlayerBridge.onCosmos(new Object());

        assertTrue(PlayerBridge.connected());
        String line = lineWhileDestroyed(router);
        assertTrue(line, line.startsWith(
                "Player bridge: waiting for Spotify (Couldn't connect: java.lang.NoSuchMethodException"));
    }

    // ---- Helpers ----

    private <T extends PlayerBridge.StateListener> T listen(T listener) {
        listeners.add(listener);
        PlayerBridge.addStateListener(listener);
        return listener;
    }

    /**
     * Attaches a fresh router that answers nothing, one Spotify has destroyed when {@code destroyed};
     * for tests outside this package, since the bridge is process-wide.
     */
    public static void attachRouter(boolean destroyed) {
        FakeRouter fresh = new FakeRouter();
        fresh.destroyed = destroyed;
        PlayerBridge.attach(fresh);
    }

    /**
     * Attaches a fresh router that answers nothing and returns the uris sent through it, in order; for tests
     * outside this package. A run sends from the bridge thread, so {@link #awaitBridge} lets it get there.
     */
    public static List<String> attachRecordingRouter() {
        List<String> uris = new CopyOnWriteArrayList<>();
        PlayerBridge.attach(new CosmosRouter() {
            @Override
            public Cancel resolve(String action, String uri, byte[] body, Callback callback) {
                uris.add(uri);
                return () -> {};
            }

            @Override
            public boolean destroyed() {
                return false;
            }
        });
        return uris;
    }

    /** Waits for the bridge thread to run everything posted to it so far; for tests outside this package. */
    public static void awaitBridge() throws Exception {
        onBridge(() -> null);
    }

    /** Runs {@code task} on the bridge thread, after everything posted before it, and returns its result. */
    static <T> T onBridge(Callable<T> task) throws Exception {
        FutureTask<T> run = new FutureTask<>(task);
        PlayerBridge.post(run);
        try {
            return run.get(CEILING_SECONDS, TimeUnit.SECONDS);
        } catch (TimeoutException e) {
            throw new AssertionError("the bridge thread didn't run a task within " + CEILING_SECONDS + " s");
        }
    }

    /**
     * The problem line {@code attached} shows once Spotify destroys it: the latest problem, which
     * the line shows only while the bridge waits or retries, or none once it's resolved.
     */
    private static String lineWhileDestroyed(FakeRouter attached) {
        attached.destroyed = true;
        try {
            return PlayerBridge.problemLine();
        } finally {
            attached.destroyed = false;
        }
    }

    /** Waits for the bridge thread to run everything posted so far; it runs tasks in order. */
    private static void flush(FakeRouter attached) throws InterruptedException {
        Answer marker = new Answer();
        PlayerBridge.call("flush", "flush", new byte[0], marker);
        attached.requests.get(attached.requests.size() - 1).callback.onResponse(200, new byte[0]);
        marker.await();
    }

    /**
     * Ends {@code stream} and checks, by the bridge's own clock, that its reopen comes {@code backoff}
     * ms after the error is handled: a probe due 1 ms sooner finds no new request, and one due that
     * late finds the reopen. The bridge runs tasks in the order they fall due, ties in the order they
     * were posted, so a slow machine can hold the probes up but can't move them around the reopen.
     */
    private static FakeRequest reopenedAfter(FakeRequest stream,
            FakeRouter waiting, long backoff) throws Exception {
        return reopenedAfter(stream, waiting, backoff, () -> stream.callback.onError(new IllegalStateException("stream gone")));
    }

    /** The same, with the stream ended by an answer of {@code status}. */
    private static FakeRequest reopenedAfter(FakeRequest stream,
            FakeRouter waiting, long backoff, int status) throws Exception {
        return reopenedAfter(stream, waiting, backoff, () -> stream.callback.onResponse(status, new byte[0]));
    }

    /** The same, with the stream ended by {@code end}. */
    private static FakeRequest reopenedAfter(FakeRequest stream,
            FakeRouter waiting, long backoff, Runnable end) throws Exception {
        int sent = waiting.requests.size();
        FutureTask<Integer> sooner = new FutureTask<>(waiting.requests::size);
        FutureTask<Integer> onTime = new FutureTask<>(waiting.requests::size);
        onBridge(() -> {
            PlayerBridge.postDelayed(sooner, backoff - 1); // before the end, so due before its reopen
            end.run();
            PlayerBridge.post(() -> PlayerBridge.postDelayed(onTime, backoff)); // after the end's handling
            return null;
        });
        assertEquals("nothing reopened within " + (backoff - 1) + " ms",
                sent, (int) sooner.get(CEILING_SECONDS, TimeUnit.SECONDS));
        assertEquals("reopened by " + backoff + " ms",
                sent + 1, (int) onTime.get(CEILING_SECONDS, TimeUnit.SECONDS));
        FakeRequest reopened = waiting.next();
        assertEquals("SUB", reopened.action);
        assertEquals(GET_STATE, reopened.uri);
        return reopened;
    }

    static void awaitQuietly(CountDownLatch latch) {
        try {
            latch.await(CEILING_SECONDS, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    /** Records every request and answers none, unless {@link #answerWhileResolving} is set. */
    static final class FakeRouter implements CosmosRouter {
        final List<FakeRequest> requests = new CopyOnWriteArrayList<>();
        private final BlockingQueue<FakeRequest> unread = new LinkedBlockingQueue<>();
        volatile boolean destroyed;
        volatile byte[] answerWhileResolving;

        @Override
        public Cancel resolve(String action, String uri, byte[] body, Callback callback) {
            FakeRequest request = new FakeRequest(action, uri, body, callback);
            requests.add(request);
            unread.add(request);
            byte[] answer = answerWhileResolving;
            if (answer != null) callback.onResponse(200, answer);
            return () -> request.cancelled = true;
        }

        @Override
        public boolean destroyed() {
            return destroyed;
        }

        FakeRequest only() {
            assertEquals(1, requests.size());
            return requests.get(0);
        }

        /** The oldest request {@link #next} hasn't returned yet, waiting for one to come. */
        FakeRequest next() throws InterruptedException {
            FakeRequest request = unread.poll(CEILING_SECONDS, TimeUnit.SECONDS);
            assertNotNull("no request within " + CEILING_SECONDS + " s", request);
            return request;
        }
    }

    static final class FakeRequest {
        final String action;
        final String uri;
        final byte[] body;
        final CosmosRouter.Callback callback;
        /** The thread that sent it, since resolve runs on the sender's thread. */
        final String thread = Thread.currentThread().getName();
        volatile boolean cancelled;

        FakeRequest(String action, String uri, byte[] body, CosmosRouter.Callback callback) {
            this.action = action;
            this.uri = uri;
            this.body = body;
            this.callback = callback;
        }
    }

    private static final class Answer implements PlayerBridge.Result {
        private final CountDownLatch answered = new CountDownLatch(1);
        volatile byte[] body;
        volatile String reason;
        volatile String thread;
        volatile int count; // written only by the bridge thread

        @Override
        public void done(byte[] body) {
            this.body = body;
            answered();
        }

        @Override
        public void failed(String reason) {
            this.reason = reason;
            answered();
        }

        private void answered() {
            thread = Thread.currentThread().getName();
            count++;
            answered.countDown();
        }

        void await() throws InterruptedException {
            assertTrue("no answer within " + CEILING_SECONDS + " s", answered.await(CEILING_SECONDS, TimeUnit.SECONDS));
        }
    }

    private static final class States implements PlayerBridge.StateListener {
        private final BlockingQueue<Esperanto.PlayerState> received = new LinkedBlockingQueue<>();
        volatile String thread;

        @Override
        public void onState(Esperanto.PlayerState state) {
            thread = Thread.currentThread().getName();
            received.add(state);
        }

        Esperanto.PlayerState next() throws InterruptedException {
            Esperanto.PlayerState state = received.poll(CEILING_SECONDS, TimeUnit.SECONDS);
            assertNotNull("no state within " + CEILING_SECONDS + " s", state);
            return state;
        }
    }

    private static final class Recorded implements CosmosRouter.Callback {
        int status;
        byte[] body;
        Throwable error;

        @Override
        public void onResponse(int status, byte[] body) {
            this.status = status;
            this.body = body;
        }

        @Override
        public void onError(Throwable error) {
            this.error = error;
        }
    }

    /** Stands in for {@code SharedCosmosRouterService}; reflective() only calls getRemoteNativeRouter(). */
    public static final class FakeService {
        final FakeNativeRouter router = new FakeNativeRouter();

        public FakeNativeRouter getRemoteNativeRouter() {
            return router;
        }
    }

    /** Stands in for {@code RemoteNativeRouter}. */
    public static final class FakeNativeRouter {
        volatile Request request;
        volatile ResolveCallback callback;
        volatile int released;
        volatile boolean destroyed;
        /** Destroys the router right after its first check, as a logout between check and call would. */
        volatile boolean destroyAfterFirstCheck;

        public Lifetime performNativeResolve(Request request, ResolveCallback callback) {
            // Spotify's own resolve holds this monitor, and destroy() takes it.
            assertTrue("sent under the router's monitor", Thread.holdsLock(this));
            this.request = request;
            this.callback = callback;
            return () -> released++;
        }

        public boolean getRouterDestroyed() {
            boolean was = destroyed;
            if (destroyAfterFirstCheck) destroyed = true;
            return was;
        }
    }
}
