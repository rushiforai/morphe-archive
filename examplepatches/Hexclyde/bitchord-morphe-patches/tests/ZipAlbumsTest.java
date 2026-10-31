package app.bitchord.telegram;

import org.drinkless.tdlib.TdApi;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.zip.ZipOutputStream;

public final class ZipAlbumsTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static TdApi.Message zipPost(long chat, long id, int file, String name, byte[] zip) {
        TdApi.Message m = TestMessages.document(chat, id, name);
        TdApi.Document doc = ((TdApi.MessageDocument) m.content).document;
        doc.document.id = file;
        doc.document.size = zip.length;
        doc.document.remote = new TdApi.RemoteFile();
        doc.document.remote.uniqueId = "ZIP" + file;
        doc.mimeType = "application/zip";
        return m;
    }

    /** A chat with one audio post and two zips posted as files. */
    static final class Chat implements TelegramIndex.Pages {
        final List<TdApi.Message> audio = new ArrayList<>(), documents = new ArrayList<>();
        final Map<Integer, byte[]> files = new HashMap<>();
        final AtomicLong read = new AtomicLong();

        @Override
        public TdApi.FoundChatMessages page(long chat, int kind, long from) {
            List<TdApi.Message> page = new ArrayList<>();
            for (TdApi.Message m : kind == 0 ? audio : documents)
                if (m.chatId == chat && (from == 0 || m.id < from)) page.add(m);
            page.sort((a, b) -> Long.compare(b.id, a.id));
            TdApi.FoundChatMessages found = new TdApi.FoundChatMessages();
            found.messages = page.toArray(new TdApi.Message[0]);
            return found;
        }

        @Override
        public int count(long chat, int kind) {
            int n = 0;
            for (TdApi.Message m : kind == 0 ? audio : documents) if (m.chatId == chat) n++;
            return n;
        }

        @Override
        public int position(long chat, int kind, long messageId) {
            return 0;
        }

        @Override
        public byte[] range(int file, long offset, int length) {
            byte[] bytes = files.get(file);
            read.addAndGet(Math.min(length, bytes.length - offset));
            return Arrays.copyOfRange(
                    bytes, (int) offset, (int) Math.min(bytes.length, offset + length));
        }
    }

    public static void main(String[] args) throws Exception {
        byte[] flesh = ZipDirectoryTest.flac(96000, 24, 96000L * 199, 3_000_000, 1);
        byte[] ice = ZipDirectoryTest.wav(44100, 3);
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
            String folder = "Pink Floyd - The Wall (1979) [FLAC 24-96]/";
            ZipDirectoryTest.add(zip, folder + "01 - In The Flesh.flac", flesh, true);
            ZipDirectoryTest.add(zip, folder + "02 - The Thin Ice.wav", ice, false);
            ZipDirectoryTest.add(zip, folder + "cover.jpg", new byte[3000], false);
            ZipDirectoryTest.add(
                    zip, folder + "03 - Roger Waters - Mother (Demo).flac", flesh, true);
        }
        byte[] wall = bytes.toByteArray();

        ByteArrayOutputStream other = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(other)) {
            ZipDirectoryTest.add(zip, "Track 1.flac", flesh, true);
        }
        byte[] loose = other.toByteArray();

        Chat chat = new Chat();
        chat.audio.add(TestMessages.audio(-100, 5, "Comfortably Numb"));
        chat.documents.add(zipPost(-100, 10, 501, "The Wall [FLAC].zip", wall));
        chat.documents.add(zipPost(-100, 11, 502, "Pink Floyd - Animals.zip", loose));
        chat.documents.add(TestMessages.document(-100, 12, "booklet.pdf"));
        chat.documents.add(zipPost(-100, 13, 503, "broken.zip", new byte[4000]));
        chat.files.put(501, wall);
        chat.files.put(502, loose);
        chat.files.put(503, new byte[4000]);

        // A zip post is noticed; anything else isn't.
        JSONObject descriptor = ZipAlbums.descriptor(chat.documents.get(0));
        check(
                descriptor.getInt("file") == 501 && descriptor.getLong("size") == wall.length,
                "Zip noticed");
        check(ZipAlbums.descriptor(chat.documents.get(2)) == null, "A PDF isn't");
        check(ZipAlbums.descriptor(chat.audio.get(0)) == null, "An audio post isn't");

        // Songs, named from their file names, with the album's artist from its folder.
        List<JSONObject> songs = ZipAlbums.songs(descriptor, (o, n) -> chat.range(501, o, n));
        check(songs.size() == 3, "Three songs, no cover: " + songs.size());
        JSONObject first = songs.get(0), second = songs.get(1), third = songs.get(2);
        check(
                first.getString("id").equals("-100_10_1"),
                "Id with the entry: " + first.getString("id"));
        check(
                first.getString("title").equals("In The Flesh")
                        && first.getString("artist").equals("Pink Floyd"),
                "Name from file and folder: " + first);
        check(
                third.getString("title").equals("Mother (Demo)")
                        && third.getString("artist").equals("Roger Waters"),
                "A song's own artist wins: " + third);
        check(
                first.getInt("duration") == 199
                        && first.getJSONObject("header").getInt("bits") == 24,
                "Length and depth from the header");
        check(
                second.getInt("duration") == 3
                        && second.getString("format").equals("wav")
                        && second.getJSONObject("zip").getInt("method") == ZipDirectory.DEFLATED,
                "Deflated WAV");
        check(
                first.getString("album").equals("Pink Floyd - The Wall (1979) [FLAC 24-96]"),
                "Album from the folder");
        check(
                first.getString("unique").equals("ZIP501/1")
                        && first.getLong("size") == flesh.length,
                "Unique per song, its own size");
        check(InternalAddon.quality(first).contains("LOSSLESS"), "Counts as lossless");
        check(
                ZipAlbums.validId("-100_10_1")
                        && !ZipAlbums.validId("-100_10")
                        && !ZipAlbums.validId("-100_10_0"),
                "Ids");
        check(TrackNames.validId("-100_10_1"), "Track names take them");

        // Through the index: queued while reading pages, opened on alternate steps.
        chat.read.set(0);
        AtomicLong clock = new AtomicLong(1_000_000);
        IndexStore.Memory store = new IndexStore.Memory();
        TelegramIndex index = new TelegramIndex(store, chat, clock::get);
        Set<Long> chats = Collections.singleton(-100L);
        for (int i = 0; i < 4; i++) index.step(chats);
        check(
                index.status(chats).contains("zips to open"),
                "Waiting zips shown: " + index.status(chats));
        for (int i = 0; i < 20 && index.step(chats); i++) {}
        check(index.status(chats).equals("5 files indexed from 1 chat"), index.status(chats));
        List<JSONObject> found = index.search(chats, "thin ice", true);
        check(
                found.size() == 1 && found.get(0).getString("id").equals("-100_10_2"),
                "Song in a zip found by title");
        check(
                index.search(chats, "pink floyd", true).size() == 4,
                "And by artist: " + index.search(chats, "pink floyd", true).size());
        check(index.search(chats, "the wall mother", true).size() == 1, "Album name counts too");
        check(
                index.row(-100, 10, 4).getString("title").equals("Mother (Demo)"),
                "Row by id; the cover is entry 3");
        check(index.row(-100, 13, 1) == null, "Not a zip: skipped, nothing added");
        check(
                chat.read.get() < 450_000,
                "Only the ends and song starts are read: " + chat.read.get());

        // A rebuild keeps the songs without opening the zips again.
        long before = chat.read.get();
        clock.addAndGet(TelegramIndex.REBUILD_MILLIS + 1);
        for (int i = 0; i < 20 && index.step(chats); i++) {}
        check(
                index.row(-100, 10, 1) != null && chat.read.get() == before,
                "Kept through a rebuild");
        // Copying into a main channel: a zip goes over once, and not if the main channel has it.
        // A zip sharing a song with another but holding a new one goes over whole.
        ByteArrayOutputStream mixed = new ByteArrayOutputStream();
        try (ZipOutputStream zip = new ZipOutputStream(mixed)) {
            ZipDirectoryTest.add(zip, "Track 1.flac", flesh, true);
            ZipDirectoryTest.add(
                    zip,
                    "Track 9.flac",
                    ZipDirectoryTest.flac(44100, 16, 44100L * 150, 1000, 9),
                    true);
        }
        chat.documents.add(zipPost(-100, 14, 504, "Pink Floyd - Mixed.zip", mixed.toByteArray()));
        chat.files.put(504, mixed.toByteArray());
        chat.documents.add(zipPost(-1, 3, 501, "The Wall [FLAC].zip", wall));
        TelegramIndex both = new TelegramIndex(new IndexStore.Memory(), chat, clock::get);
        for (int i = 0; i < 40 && both.step(List.of(-100L, -1L)); i++) {}
        List<String> copies = new ArrayList<>();
        MainChannel channel =
                new MainChannel(
                        null,
                        (to, from, ids) -> {
                            for (long id : ids) copies.add(from + ":" + id);
                        },
                        clock::get);
        channel.setMain(-1, "Library");
        channel.setCommunity(List.of(-100L));
        channel.setPerHour(500);
        channel.setOption("losslessOnly", true);
        channel.setOption("skipDuplicates", true);
        channel.setOption("import", true);
        channel.step(both);
        check(
                copies.equals(List.of("-100:5", "-100:11", "-100:14")),
                "The FLAC post, Animals, and Mixed for its new song; The Wall is already there: "
                        + copies);
        check(
                channel.progress(both)
                        .startsWith("Copied 4 audio files in 3 posts · 1 duplicate skipped"),
                "Only The Wall counts as skipped: " + channel.progress(both));
        System.out.println(
                "PASS: "
                        + checks
                        + " zip album naming, indexing, search, rebuild and copy checks.");
    }
}
