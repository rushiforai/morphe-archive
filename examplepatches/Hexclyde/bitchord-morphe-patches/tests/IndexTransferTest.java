package app.bitchord.telegram;

import org.json.JSONObject;

import java.io.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicLong;
import java.util.zip.GZIPOutputStream;

public final class IndexTransferTest {
    static int checks;

    static void check(boolean okay, String message) {
        checks++;
        if (!okay) throw new AssertionError(message);
    }

    static JSONObject row(long chat, long message, int entry, String title) throws Exception {
        return new JSONObject()
                .put("id", chat + "_" + message + (entry > 0 ? "_" + entry : ""))
                .put("chat", chat)
                .put("message", message)
                .put("entry", entry)
                .put("file", 1234)
                .put("cover", 99)
                .put("title", title)
                .put("artist", "Artist")
                .put("format", "flac")
                .put("size", 1000)
                .put("duration", 200)
                .put("unique", "U" + message)
                .put(
                        "header",
                        new JSONObject().put("codec", "flac").put("bits", 24).put("rate", 96000));
    }

    public static void main(String[] args) throws Exception {
        long chat = -100;
        IndexStore.Memory store = new IndexStore.Memory();
        List<JSONObject> rows = new ArrayList<>();
        for (int m = 1; m <= 1500; m++) rows.add(row(chat, m, 0, "Song " + m));
        // A zip post with 700 songs straddles a page boundary.
        for (int e = 1; e <= 700; e++)
            rows.add(
                    row(chat, 1600, e, "Zip song " + e)
                            .put(
                                    "zip",
                                    new JSONObject()
                                            .put("data", 10)
                                            .put("method", 0)
                                            .put("compressed", 5)));
        store.put(chat, rows, 1);
        AtomicLong clock = new AtomicLong(1_000_000);
        TelegramIndex source = new TelegramIndex(store, new MainChannelTest.Chats(), clock::get);

        ByteArrayOutputStream out = new ByteArrayOutputStream();
        IndexTransfer.Section section = new IndexTransfer.Section();
        section.chat = chat;
        section.title = "Lossless";
        section.complete = true;
        section.newest = 1600;
        IndexTransfer.write(
                out,
                new JSONObject().put("format", IndexTransfer.INDEX).put("version", 1),
                List.of(section),
                source::exportRows);
        IndexTransfer.Contents read =
                IndexTransfer.read(new ByteArrayInputStream(out.toByteArray()));
        check(read.sections.size() == 1, "One chat");
        List<JSONObject> back = read.sections.get(0).rows;
        check(
                back.size() == 2200,
                "Every file, across pages and inside the large post: " + back.size());
        Set<String> ids = new HashSet<>();
        for (JSONObject r : back) ids.add(r.getString("id"));
        check(ids.size() == 2200, "Each once");
        JSONObject first = back.get(0);
        check(
                first.getInt("file") == 0 && !first.has("cover"),
                "No file numbers from the other phone");
        check(first.getJSONObject("header").getInt("bits") == 24, "Format details kept");

        // Into a phone that hasn't read the chat: built from the file, then topped up.
        IndexStore.Memory other = new IndexStore.Memory();
        TelegramIndex mine = new TelegramIndex(other, new MainChannelTest.Chats(), clock::get);
        other.put(chat, List.of(row(chat, 5, 0, "Own copy").put("file", 77)), 1);
        int added = mine.importSection(read.sections.get(0));
        check(added == 2199, "Added all but the one it had: " + added);
        check(other.row(chat, 5, 0).getInt("file") == 77, "Its own file kept");
        check(mine.built(chat), "Counts as built");
        check(mine.search(Set.of(chat), "zip song 650", true).size() == 1, "Searchable");

        // Someone else's file is read strictly.
        ByteArrayOutputStream hostile = new ByteArrayOutputStream();
        try (Writer w = new OutputStreamWriter(new GZIPOutputStream(hostile), "UTF-8")) {
            w.write("{\"format\":\"bitchord-index\",\"version\":1}\n");
            w.write("{\"chat\":-100,\"complete\":true}\n");
            w.write(row(-999, 1, 0, "Other chat").toString() + "\n");
            w.write(row(-100, -5, 0, "Bad id").toString() + "\n");
            w.write(row(-100, 9, 0, "").toString() + "\n");
            w.write(
                    row(-100, 10, 0, "Fine")
                                    .put("evil", "x")
                                    .put("cue", new JSONObject().put("source", "exe"))
                                    .toString()
                            + "\n");
            w.write(row(-100, 11, 0, "Good\u0007 one").put("extra", 1).toString() + "\n");
            w.write("{\"end\":true}\n");
        }
        List<JSONObject> kept =
                IndexTransfer.read(new ByteArrayInputStream(hostile.toByteArray()))
                        .sections
                        .get(0)
                        .rows;
        check(kept.size() == 1, "Only the sensible row: " + kept);
        check(
                !kept.get(0).has("extra") && kept.get(0).getString("title").equals("Good  one"),
                "Unknown fields and control characters dropped");
        try {
            IndexTransfer.read(new ByteArrayInputStream(new byte[] {1, 2, 3}));
            check(false, "Not gzip");
        } catch (IOException e) {
            check(true, "Refused");
        }
        check(
                IndexTransfer.forChat(IndexTransfer.fileName(-1001234, "20261029"), -1001234),
                "Named for its chat");
        check(
                !IndexTransfer.forChat("bitchord-index-1001234-x.jsonl.gz", -100123),
                "Not another chat's");
        System.out.println(
                "PASS: " + checks + " index file export, import and strict reading checks.");
    }
}
