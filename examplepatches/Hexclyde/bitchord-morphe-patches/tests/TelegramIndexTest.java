package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

public final class TelegramIndexTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    /** A chat's audio, newest first, paged like SearchChatMessages with an empty query. */
    static final class FakeChat implements TelegramIndex.Pages {
        final TreeMap<Long, TdApi.Message> audio = new TreeMap<>(Comparator.reverseOrder());
        final AtomicInteger calls = new AtomicInteger();
        final AtomicBoolean limited = new AtomicBoolean();

        void add(long id, String title) {
            audio.put(id, TestMessages.audio(-100, id, title));
        }

        @Override
        public TdApi.FoundChatMessages page(long chat, int kind, long from) throws Exception {
            calls.incrementAndGet();
            if (limited.get()) throw new LiveSearch.RateLimited(30);
            List<TdApi.Message> page = new ArrayList<>();
            if (kind == 0)
                for (TdApi.Message m : audio.values())
                    if ((from == 0 || m.id < from) && page.size() < 100) page.add(m);
            TdApi.FoundChatMessages found = new TdApi.FoundChatMessages();
            found.totalCount = kind == 0 ? audio.size() : 0;
            found.messages = page.toArray(new TdApi.Message[0]);
            return found;
        }

        @Override
        public int count(long chat, int kind) {
            return kind == 0 ? audio.size() : 0;
        }

        @Override
        public byte[] range(int file, long offset, int length) {
            return new byte[0];
        }

        @Override
        public int position(long chat, int kind, long messageId) {
            int n = 0;
            if (kind == 0) for (long id : audio.keySet()) if (id >= messageId) n++;
            return n;
        }
    }

    static int build(TelegramIndex index, Set<Long> chats) throws Exception {
        int steps = 0;
        while (index.step(chats)) if (++steps > 100) throw new AssertionError("Never finishes");
        return steps;
    }

    static List<String> titles(List<JSONObject> rows) {
        List<String> out = new ArrayList<>();
        for (JSONObject row : rows) out.add(row.optString("title"));
        return out;
    }

    public static void main(String[] args) throws Exception {
        IndexStore.Memory store = new IndexStore.Memory();
        AtomicLong clock = new AtomicLong(1_000_000);
        FakeChat chat = new FakeChat();
        for (long id = 1; id <= 250; id++) chat.add(id, "Song " + id);
        chat.add(300, "Nobody Knows You When You're Down and Out");
        Set<Long> chats = Collections.singleton(-100L);
        TelegramIndex index = new TelegramIndex(store, chat, clock::get);

        check(index.search(chats, "song", false) == null, "Nothing to answer from yet");
        check(index.step(chats), "Starts building");
        check(index.search(chats, "song", true) == null, "Not complete yet");
        check(index.search(chats, "song", false).size() == 99, "A partial index still answers");
        check(
                index.status(chats).equals("Indexing: 100 files found · 39%"),
                "Progress against Telegram's count: " + index.status(chats));
        clock.addAndGet(60_000);
        check(index.step(chats), "Second page");
        check(
                index.status(chats).equals("Indexing: 200 files found · 79% · about 1 min left"),
                "Time left from the pace so far: " + index.status(chats));
        int steps = build(index, chats);
        // Pages of 100, 100 and 51, an empty one to finish the audio, one for documents.
        check(steps == 3 && chat.calls.get() == 5, "One page per step: " + chat.calls.get());
        check(index.status(chats).equals("251 files indexed from 1 chat"), index.status(chats));
        check(!index.step(chats), "Nothing to do once built");

        List<JSONObject> nobody = index.search(chats, "nobody know", true);
        check(
                titles(nobody).equals(List.of("Nobody Knows You When You're Down and Out")),
                "Words match at their start: " + titles(nobody));
        check(index.search(chats, "you re down", true).size() == 1, "Apostrophes are ignored");
        check(
                index.search(chats, "nobody knows you when youre down out", true).size() == 1,
                "BitChord's 'youre' matches 'You're'");
        check(
                TelegramIndex.withoutContractions(
                                "nobody knows you when youre down out nina simone")
                        .equals("nobody knows you when down out nina simone"),
                "Run-together words dropped for Telegram");
        check(TelegramIndex.withoutContractions("sway dean martin") == null, "Nothing to drop");
        check(TelegramIndex.withoutContractions("youre") == null, "Nothing left");
        check(
                TelegramIndex.withoutContractions("dont stop me now").equals("stop me now"),
                "Other run-together words too");
        check(
                TelegramIndex.withoutContractions("Don't Stop Me Now") == null,
                "A query with its apostrophe is left alone");
        check(
                IndexStore.looseWords("Ain’t No Sunshine").containsAll(List.of("aint", "ain", "t")),
                "Curly apostrophes too");
        check(index.search(chats, "artist nobody", true).size() == 1, "Artist words count");
        check(index.search(chats, "nobody cares", true).isEmpty(), "Every word must match");
        check(index.search(chats, "song", true).size() == TelegramIndex.MAX_RESULTS, "Capped");
        check(
                index.search(chats, "song", true).get(0).optString("title").equals("Song 250"),
                "Newest first");
        check(index.search(Collections.singleton(-200L), "song", false) == null, "Other chats");
        nobody.get(0).put("title", "Changed");
        check(index.search(chats, "nobody", true).size() == 1, "Results are copies");

        // Topped up after a few hours: new posts, and only until a known one.
        chat.add(301, "New Upload");
        clock.addAndGet(TelegramIndex.REFRESH_MILLIS + 1);
        int before = chat.calls.get();
        check(build(index, chats) == 2, "Tops up a page per step");
        check(chat.calls.get() - before == 2, "One page per kind, stopping at a known post");
        check(index.search(chats, "new upload", true).size() == 1, "New post found");

        // Saved: a new index on the same store answers straight away.
        TelegramIndex reopened = new TelegramIndex(store, chat, clock::get);
        check(reopened.search(chats, "new upload", true).size() == 1, "Loaded from disk");
        check(!reopened.step(chats), "Nothing to do after loading");

        // A monthly rebuild drops files deleted from the chat, and answers meanwhile.
        chat.audio.remove(5L);
        clock.addAndGet(TelegramIndex.REBUILD_MILLIS + 1);
        check(reopened.step(chats), "Rebuild starts");
        check(reopened.search(chats, "song 5", true) != null, "Still answers while rebuilding");
        build(reopened, chats);
        boolean gone = true;
        for (JSONObject row : reopened.search(chats, "song", true))
            if (row.optString("title").equals("Song 5")) gone = false;
        check(gone, "Deleted file dropped");
        check(reopened.status(chats).startsWith("251 files"), reopened.status(chats));

        // A rate limit stops the step without losing what was there.
        clock.addAndGet(TelegramIndex.REFRESH_MILLIS + 1);
        chat.limited.set(true);
        try {
            reopened.step(chats);
            check(false, "Rate limit passed on");
        } catch (LiveSearch.RateLimited e) {
            check(e.retrySeconds == 30, "Wait passed on");
        }
        check(reopened.search(chats, "nobody", true).size() == 1, "Kept through a rate limit");
        chat.limited.set(false);

        // Off: no work, no answers, and the files are deleted.
        reopened.enabled = false;
        check(!reopened.step(chats), "No work while off");
        check(reopened.search(chats, "nobody", false) == null, "No answers while off");
        reopened.clear();
        check(store.count(-100) == 0, "Files deleted");
        reopened.enabled = true;
        check(reopened.search(chats, "nobody", false) == null, "Starts again empty");
        check(reopened.step(chats), "And builds again");

        // Playlists and downloads take a chat's newest files, oldest first.
        build(reopened, chats);
        List<JSONObject> newest = reopened.newest(-100, 3);
        check(
                titles(newest)
                        .equals(
                                List.of(
                                        "Song 250",
                                        "Nobody Knows You When You're Down and Out",
                                        "New Upload")),
                "Newest three, in posting order: " + titles(newest));
        check(reopened.newest(-200, 3) == null, "Not for a chat that isn't indexed");
        check(reopened.count(-100) == 251, "Count, without the deleted file");

        // A build that 1.0.8 started picks up its progress from where it had got to.
        IndexStore.Memory old = new IndexStore.Memory();
        old.save(
                IndexStore.State.fromJson(
                        -100,
                        new JSONObject(
                                "{\"cursor\":[151,0],\"complete\":[false,false],\"total\":[0,0],"
                                        + "\"builtAt\":0,\"refreshed\":0}")));
        TelegramIndex resumed = new TelegramIndex(old, chat, clock::get);
        check(resumed.step(chats), "Carries on");
        check(
                resumed.status(chats).equals("Indexing: 100 files found · 80%"),
                "Read count from the message position: " + resumed.status(chats));
        check(TelegramIndex.timeLeft(100).equals("1 h 40 min"), "Hours");
        check(TelegramIndex.timeLeft(3 * 1440).equals("3 days"), "Days");
        check(TelegramIndex.timeLeft(0.2).equals("1 min"), "At least a minute");

        System.out.println(
                "PASS: " + checks + " saved index build, top-up, rebuild and search checks.");
    }
}
