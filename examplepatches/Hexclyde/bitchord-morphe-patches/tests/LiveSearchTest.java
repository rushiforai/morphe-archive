package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

public final class LiveSearchTest {
    static int checks;

    static synchronized void check(boolean ok, String text) {
        checks++;
        if (!ok) throw new AssertionError(text);
    }

    static Set<Long> chats(long... ids) {
        Set<Long> result = new HashSet<>();
        for (long id : ids) result.add(id);
        return result;
    }

    static TdApi.FoundChatMessages found(TdApi.Message... messages) {
        return new TdApi.FoundChatMessages(messages.length, messages, 0);
    }

    public static void main(String[] args) throws Exception {
        // The remote fixture models a channel with 223,657 tracks; only the matching old message is
        // returned.
        AtomicInteger calls = new AtomicInteger();
        AtomicLong clock = new AtomicLong(1000);
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            calls.incrementAndGet();
                            check(
                                    request.query.equals("Happy Nation"),
                                    "Search words forwarded to Telegram");
                            check(request.chatId == -100123, "Only selected chat searched");
                            check(
                                    request.fromMessageId == 0 && request.offset == 0,
                                    "Search starts at newest matching message");
                            check(
                                    request.limit == 100
                                            && request.topicId == null
                                            && request.senderId == null,
                                    "Valid typed TDLib search options");
                            check(
                                    timeout > 0 && timeout <= 12000,
                                    "Per-query deadline passed to TDLib");
                            return request.filter instanceof TdApi.SearchMessagesFilterAudio
                                    ? found(TestMessages.audio(-100123, 1, "Happy Nation"))
                                    : found();
                        },
                        clock::get,
                        12000)) {
            LiveSearch.Result a = search.search(chats(-100123), " Happy Nation ", 1);
            check(
                    a.tracks.size() == 1 && a.tracks.get(0).getLong("message") == 1,
                    "Old track found without indexing preceding 223,656 files");
            check(calls.get() == 2, "Audio and document search only; no full history traversal");
            search.search(chats(-100123), "Happy Nation", 1);
            check(calls.get() == 2, "Repeated query served by short cache");
            clock.addAndGet(30001);
            search.search(chats(-100123), "Happy Nation", 1);
            check(calls.get() == 4, "Expired query refreshed");
            search.search(chats(-100123), "Happy Nation", 2);
            check(calls.get() == 6, "Different account generation does not reuse cache");
            search.clear();
            search.search(chats(-100123), "Happy Nation", 2);
            check(calls.get() == 8, "Selection/reset invalidates cache");
        }
        AtomicInteger multipleCalls = new AtomicInteger();
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            multipleCalls.incrementAndGet();
                            long chat = request.chatId;
                            if (request.filter instanceof TdApi.SearchMessagesFilterAudio)
                                return found(
                                        TestMessages.audio(chat, 1, "Song"),
                                        TestMessages.audio(999, 2, "Foreign"));
                            return found(
                                    TestMessages.audio(chat, 1, "Song"),
                                    TestMessages.document(chat, 2, "Another.FLAC"),
                                    TestMessages.document(chat, 3, "not-music.pdf"));
                        })) {
            LiveSearch.Result result = search.search(chats(10, 20), "song", 1);
            check(multipleCalls.get() == 4, "Both filters search every selected chat");
            check(
                    result.tracks.size() == 4,
                    "Duplicate IDs, foreign messages and non-music documents excluded");
            for (JSONObject row : result.tracks)
                check(
                        chats(10, 20).contains(row.getLong("chat")),
                        "Result stays inside selected chats");
            int before = multipleCalls.get();
            check(
                    search.search(chats(), "song", 1).tracks.isEmpty()
                            && before == multipleCalls.get(),
                    "No selected chats means no remote requests");
            boolean rejected = false;
            try {
                search.search(chats(10), String.join("", Collections.nCopies(257, "x")), 1);
            } catch (Exception e) {
                rejected = true;
            }
            check(rejected, "Excessive search text rejected");
        }
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            TdApi.Message[] messages = new TdApi.Message[100];
                            for (int i = 0; i < 100; i++)
                                messages[i] =
                                        TestMessages.audio(
                                                request.chatId,
                                                (request.filter
                                                                        instanceof
                                                                        TdApi
                                                                                .SearchMessagesFilterAudio
                                                                ? 1
                                                                : 101)
                                                        + i,
                                                "Song");
                            return found(messages);
                        })) {
            check(
                    search.search(chats(10, 20), "song", 1).tracks.size() == 200,
                    "Overall response bounded to 200 rows");
        }
        AtomicInteger cacheCalls = new AtomicInteger();
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            cacheCalls.incrementAndGet();
                            return found();
                        })) {
            for (int i = 0; i < 9; i++) search.search(chats(10), "query" + i, 1);
            search.search(chats(10), "query8", 1);
            check(cacheCalls.get() == 18, "Latest query cached");
            search.search(chats(10), "query0", 1);
            check(cacheCalls.get() == 20, "LRU cache bounded to eight queries");
        }
        AtomicInteger joinedCalls = new AtomicInteger();
        CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1);
        ExecutorService users = Executors.newFixedThreadPool(2);
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            joinedCalls.incrementAndGet();
                            started.countDown();
                            release.await(1, TimeUnit.SECONDS);
                            return found(TestMessages.audio(10, 1, "Song"));
                        })) {
            Future<LiveSearch.Result> first =
                    users.submit(() -> search.search(chats(10), "song", 1));
            started.await(1, TimeUnit.SECONDS);
            Future<LiveSearch.Result> second =
                    users.submit(() -> search.search(chats(10), "song", 1));
            release.countDown();
            check(
                    first.get().tracks.size() == 1 && second.get().tracks.size() == 1,
                    "Concurrent identical searches both complete");
            check(joinedCalls.get() == 2, "Concurrent identical searches coalesced");
        } finally {
            users.shutdownNow();
        }
        AtomicLong rateClock = new AtomicLong(1000);
        AtomicBoolean rateLimited = new AtomicBoolean(true);
        AtomicInteger rateCalls = new AtomicInteger();
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            rateCalls.incrementAndGet();
                            if (rateLimited.get()) throw new LiveSearch.RateLimited(60);
                            return found();
                        },
                        rateClock::get,
                        1000)) {
            List<Integer> notices = Collections.synchronizedList(new ArrayList<>());
            search.onRateLimited = notices::add;
            boolean denied = false;
            try {
                search.search(chats(10, 11), "a", 1);
            } catch (LiveSearch.RateLimited e) {
                denied = true;
            }
            check(denied, "Telegram rate limit surfaced");
            check(notices.equals(List.of(60)), "One notice for a pause, not one per request");
            int before = rateCalls.get();
            try {
                search.search(chats(10), "b", 1);
            } catch (LiveSearch.RateLimited e) {
            }
            check(before == rateCalls.get(), "Cooldown prevents further Telegram requests");
            try {
                search.page(10, 0, 0);
                check(false, "Index page sent during a pause");
            } catch (LiveSearch.RateLimited e) {
                check(before == rateCalls.get(), "Index pages wait out the pause too");
            }
            check(search.idle(), "Idle with nothing searching");
            rateLimited.set(false);
            rateClock.addAndGet(60001);
            search.search(chats(10), "b", 1);
            check(rateCalls.get() > before, "Search resumes after cooldown");
            check(notices.size() == 1, "No notice while searches work");
            rateLimited.set(true);
            try {
                search.search(chats(10), "c", 1);
            } catch (LiveSearch.RateLimited e) {
            }
            check(notices.size() == 2, "A later pause gets its own notice");
        }
        check(
                LiveSearch.rateLimitNotice(45)
                        .equals("Telegram API rate limited. Searching again in 45 s."),
                "Notice in seconds");
        check(LiveSearch.rateLimitNotice(300).endsWith("in 5 min."), "Notice in minutes");
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            if (request.filter instanceof TdApi.SearchMessagesFilterDocument)
                                throw new java.io.IOException("fixture failure");
                            return found(TestMessages.audio(10, 1, "Song"));
                        })) {
            LiveSearch.Result result = search.search(chats(10), "song", 1);
            check(
                    result.tracks.size() == 1 && !result.warning.isEmpty(),
                    "Partial results carry a warning");
        }
        AtomicBoolean interrupted = new AtomicBoolean();
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            try {
                                Thread.sleep(5000);
                            } catch (InterruptedException e) {
                                interrupted.set(true);
                                throw e;
                            }
                            return found();
                        },
                        () -> System.nanoTime() / 1000000L,
                        80)) {
            long start = System.nanoTime();
            boolean timedOut = false;
            try {
                search.search(chats(10), "song", 1);
            } catch (Exception e) {
                timedOut = true;
            }
            check(
                    timedOut && TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - start) < 1000,
                    "Remote search has a bounded deadline");
        }
        Set<Long> selected = chats(10);
        AtomicInteger lookups = new AtomicInteger();
        JSONObject resolved =
                TrackMetadata.resolve(
                        "10_20",
                        selected,
                        (chat, message) -> {
                            lookups.incrementAndGet();
                            return TestMessages.audio(chat, message, "Song");
                        });
        check(
                resolved != null && lookups.get() == 1,
                "Saved track ID resolves without a local index");
        for (String id :
                new String[] {
                    "999_20",
                    "10_0",
                    "10_-1",
                    "010_20",
                    "10_020",
                    "../config.json",
                    "10_20/..",
                    "10_9223372036854775808"
                })
            check(
                    TrackMetadata.resolve(
                                    id,
                                    selected,
                                    (c, m) -> {
                                        throw new AssertionError("Invalid ID reached Telegram");
                                    })
                            == null,
                    "Reject invalid/unselected reference: " + id);
        check(
                TrackMetadata.resolve(
                                "10_20", selected, (c, m) -> TestMessages.audio(999, m, "Foreign"))
                        == null,
                "Reject mismatched Telegram response");
        check(
                TrackMetadata.resolve(
                                "10_20",
                                selected,
                                (c, m) -> TestMessages.document(c, m, "file.pdf"))
                        == null,
                "Reject non-music file during playback resolution");
        check(
                TrackMetadata.resolve(
                                "10_20",
                                selected,
                                (c, m) -> {
                                    selected.clear();
                                    return TestMessages.audio(c, m, "Song");
                                })
                        == null,
                "Recheck selection after remote lookup");
        // Searches for playback wait for a free slot; background searches give way.
        CountDownLatch slowRelease = new CountDownLatch(1);
        AtomicInteger slowStarted = new AtomicInteger();
        ExecutorService pool = Executors.newFixedThreadPool(4);
        try (LiveSearch search =
                new LiveSearch(
                        (request, timeout) -> {
                            slowStarted.incrementAndGet();
                            if (request.query.startsWith("slow"))
                                slowRelease.await(10, TimeUnit.SECONDS);
                            return found();
                        },
                        System::currentTimeMillis,
                        12000)) {
            List<Future<LiveSearch.Result>> slow = new ArrayList<>();
            for (int i = 0; i < 3; i++) {
                String q = "slow " + i;
                slow.add(pool.submit(() -> search.search(chats(-100123), q, 1)));
            }
            while (slowStarted.get() < 4) Thread.sleep(5);
            Future<LiveSearch.Result> waiting =
                    pool.submit(() -> search.search(chats(-100123), "song for playback", 1));
            Thread.sleep(200);
            check(!waiting.isDone(), "A fourth search waits instead of failing");
            try {
                search.search(chats(-100123), "legend lookup", 1, true);
                check(false, "Background search runs during a playback lookup");
            } catch (java.io.IOException e) {
                check(e.getMessage().equals(LiveSearch.BUSY), "Background search gives way");
            }
            slowRelease.countDown();
            check(waiting.get(5, TimeUnit.SECONDS).tracks.isEmpty(), "Waiting search then runs");
            for (Future<LiveSearch.Result> f : slow) f.get(5, TimeUnit.SECONDS);
            check(
                    search.search(chats(-100123), "idle legend lookup", 1, true).tracks.isEmpty(),
                    "Background search runs when nothing else is");
        } finally {
            pool.shutdownNow();
        }
        System.out.println(
                "PASS: "
                        + checks
                        + " direct Telegram search, cache, deadline, rate-limit and saved-reference"
                        + " checks.");
    }
}
