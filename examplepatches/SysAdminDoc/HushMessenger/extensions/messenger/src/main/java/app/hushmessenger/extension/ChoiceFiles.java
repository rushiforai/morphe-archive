package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.BitmapFactory;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * The choices that live in files instead of preferences: the home header picture, the tab pictures, your own font, the
 * auto reply pictures and who Special contacts follows. Save to a file carries them in a zip beside the same text the
 * clipboard carries. Read a file puts each one back through the copy its own row makes, under that row's limits, so a
 * backup can't save anything a pick couldn't. Special contacts go in as who's followed, never what was seen of them.
 */
final class ChoiceFiles {
    static final String TEXT = "choices.txt";
    static final String HEADER = "header.png";
    static final String FONT = "font";
    static final String FONT_NAME = "font-name.txt";
    static final String TAB = "tab-";
    static final String AUTO_REPLY = "auto-reply/";
    static final String SPECIAL = "special/";
    /** Everything one backup holds unpacked. A whole font and twenty reply pictures fit. */
    static final long MAX_TOTAL = 64L * 1024 * 1024;
    static final int MAX_ENTRIES = 128;
    /** A header or tab copy is a PNG of at most 1024 by 256 pixels, well under this. */
    static final int MAX_PICTURE = 4 * 1024 * 1024;
    /** An auto reply copy is a JPEG at most 2048 pixels on its long side, well under this. */
    static final int MAX_REPLY_PICTURE = 8 * 1024 * 1024;
    static final int MAX_SPECIAL = 64 * 1024;
    static final int MAX_FONT_NAME_BYTES = 1024;
    /** Every entry gets the same time, so the same choices always make the same file. */
    private static final long ENTRY_TIME = 315_532_800_000L;

    private ChoiceFiles() { }

    /** A backup as read: its choices text, its files by entry name, and how many entries this version doesn't know. */
    static final class Backup {
        final String text;
        final Map<String, byte[]> files;
        final int unknown;

        Backup(String text, Map<String, byte[]> files, int unknown) {
            this.text = text;
            this.files = files;
            this.unknown = unknown;
        }
    }

    /** What a restore did with the files, counted the way the choices are. */
    static final class Result {
        int total, changed, unavailable, damaged;
    }

    private interface Sink {
        void put(String name, byte[] bytes) throws IOException;
    }

    /** A zip starts with a local file header, which a text backup never does. */
    static boolean isZip(byte[] head, int length) {
        return length >= 4 && head[0] == 'P' && head[1] == 'K' && head[2] == 3 && head[3] == 4;
    }

    /** Whether there's a file-backed choice to carry, so Save makes a zip. Only asks whether the files are there. */
    static boolean any(Context context, SharedPreferences prefs, Set<String> installed) {
        if (installed.contains(HomeHeader.KEY) && HomeHeader.file(context).isFile()) return true;
        if (installed.contains(TabIcons.KEY)) for (String key : TabIcons.SHOWN) if (TabIcons.file(context, key).isFile()) return true;
        if (installed.contains(OwnFont.KEY) && !prefs.getString(OwnFont.NAME_KEY, "").isEmpty() && FontFile.file(context).isFile())
            return true;
        if (installed.contains(AutoReply.KEY)) for (String name : pictures(prefs)) if (AutoReplyPicture.fileFor(context, name).isFile())
            return true;
        if (installed.contains(SpecialContacts.KEY)) for (String account : SpecialContacts.accounts(context)) {
            String[] people = new File(SpecialContacts.folder(context), account).list();
            if (people != null && people.length > 0) return true;
        }
        return false;
    }

    /**
     * The zip Save writes: [text] first, then each file-backed choice there is, read one at a time. Too large once the
     * whole would be more than Read a file takes. Runs off the main thread.
     */
    static byte[] zip(Context context, String text, SharedPreferences prefs, Set<String> installed) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        long[] total = {0};
        try (ZipOutputStream zip = new ZipOutputStream(bytes)) {
            Sink sink = (name, data) -> {
                total[0] += data.length;
                if (total[0] > MAX_TOTAL) throw new ChoiceCodec.TooLarge();
                ZipEntry entry = new ZipEntry(name);
                entry.setTime(ENTRY_TIME);
                zip.putNextEntry(entry);
                zip.write(data);
                zip.closeEntry();
            };
            sink.put(TEXT, text.getBytes(StandardCharsets.UTF_8));
            collect(context, prefs, installed, sink);
        }
        return bytes.toByteArray();
    }

    /** Each file-backed choice of an installed patch, under the entry name it gets. */
    private static void collect(Context context, SharedPreferences prefs, Set<String> installed, Sink sink) throws IOException {
        if (installed.contains(HomeHeader.KEY)) add(sink, HEADER, HomeHeader.file(context), MAX_PICTURE);
        if (installed.contains(TabIcons.KEY))
            for (String key : TabIcons.SHOWN) add(sink, TAB + key + ".png", TabIcons.file(context, key), MAX_PICTURE);
        if (installed.contains(OwnFont.KEY)) {
            // The name and the copy change together under this lock, so the two read here belong together.
            synchronized (FontFile.LOCK) {
                String name = prefs.getString(OwnFont.NAME_KEY, "");
                if (!name.isEmpty() && add(sink, FONT, FontFile.file(context), FontFile.MAX_BYTES))
                    sink.put(FONT_NAME, name.getBytes(StandardCharsets.UTF_8));
            }
        }
        if (installed.contains(AutoReply.KEY))
            for (String name : pictures(prefs)) add(sink, AUTO_REPLY + name, AutoReplyPicture.fileFor(context, name), MAX_REPLY_PICTURE);
        if (installed.contains(SpecialContacts.KEY)) for (String account : SpecialContacts.accounts(context)) {
            List<SpecialContactsStore.Person> people = SpecialContacts.store(context, account).people();
            people.sort((a, b) -> a.id.compareTo(b.id));
            StringBuilder list = new StringBuilder();
            for (SpecialContactsStore.Person person : people) list.append(person.id).append('\t').append(person.name).append('\n');
            if (list.length() > 0) sink.put(SPECIAL + account + ".txt", list.toString().getBytes(StandardCharsets.UTF_8));
        }
    }

    /** Adds [file] when it's there and within [max]. One that can't be read stays out; the rest still go in. */
    private static boolean add(Sink sink, String name, File file, long max) throws IOException {
        byte[] bytes;
        try {
            if (!file.isFile() || file.length() <= 0 || file.length() > max) return false;
            bytes = Files.readAllBytes(file.toPath());
        } catch (IOException | RuntimeException unreadable) {
            // The class only: a message can carry a path.
            android.util.Log.w("HushMessenger", "A choice's file stayed out of the backup: " + unreadable.getClass().getSimpleName());
            return false;
        }
        sink.put(name, bytes);
        return true;
    }

    /** The pictures the saved auto replies send. */
    static Set<String> pictures(SharedPreferences prefs) {
        Set<String> names = new TreeSet<>();
        for (AutoReply.Rule rule : AutoReply.rules(prefs)) if (rule.picture != null) names.add(rule.picture);
        return names;
    }

    /** The most an entry called [name] may hold, or -1 for a name this version doesn't keep. */
    static long limit(String name) {
        if (TEXT.equals(name)) return ChoiceCodec.MAX_BYTES;
        if (HEADER.equals(name)) return MAX_PICTURE;
        if (FONT.equals(name)) return FontFile.MAX_BYTES;
        if (FONT_NAME.equals(name)) return MAX_FONT_NAME_BYTES;
        if (tab(name) != null) return MAX_PICTURE;
        if (name.startsWith(AUTO_REPLY) && AutoReplyPicture.validName(name.substring(AUTO_REPLY.length()))) return MAX_REPLY_PICTURE;
        if (account(name) != null) return MAX_SPECIAL;
        return -1;
    }

    /** The tab a tab entry is for, or null when [name] isn't one for a tab the settings offer. */
    private static String tab(String name) {
        if (!name.startsWith(TAB) || !name.endsWith(".png")) return null;
        String key = name.substring(TAB.length(), name.length() - ".png".length());
        return Arrays.asList(TabIcons.SHOWN).contains(key) ? key : null;
    }

    /** The account a Special contacts entry is for, or null when [name] isn't one. */
    private static String account(String name) {
        if (!name.startsWith(SPECIAL) || !name.endsWith(".txt")) return null;
        String account = name.substring(SPECIAL.length(), name.length() - ".txt".length());
        return SpecialContactsStore.validId(account) ? account : null;
    }

    /**
     * Reads a zip backup to its end. An entry over its own limit, or a backup over {@link #MAX_TOTAL} or
     * {@link #MAX_ENTRIES}, is too large. A damaged zip, a repeated entry or one without choices isn't a backup. Entries
     * this version doesn't keep are counted and left unread.
     */
    static Backup unzip(InputStream input) throws IOException {
        Map<String, byte[]> files = new LinkedHashMap<>();
        String text = null;
        long total = 0;
        int entries = 0, unknown = 0;
        try {
            ZipInputStream zip = new ZipInputStream(input);
            for (ZipEntry entry; (entry = zip.getNextEntry()) != null; ) {
                if (++entries > MAX_ENTRIES) throw new ChoiceCodec.TooLarge();
                String name = entry.getName();
                long limit = entry.isDirectory() ? -1 : limit(name);
                if (limit < 0) {
                    unknown++;
                    continue;
                }
                if (files.containsKey(name) || (TEXT.equals(name) && text != null)) throw new IllegalArgumentException("Repeated entry");
                byte[] bytes = readUpTo(zip, Math.min(limit, MAX_TOTAL - total));
                total += bytes.length;
                // Decoded the way a text backup is, so a zip can't carry what a text file couldn't.
                if (TEXT.equals(name)) text = ChoiceCodec.read(new ByteArrayInputStream(bytes));
                else files.put(name, bytes);
            }
        } catch (ZipException | java.io.EOFException damaged) {
            throw new IllegalArgumentException("Damaged zip", damaged);
        }
        if (text == null) throw new IllegalArgumentException("No choices in the zip");
        return new Backup(text, files, unknown);
    }

    private static byte[] readUpTo(InputStream input, long limit) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] buffer = new byte[64 * 1024];
        for (int read; (read = input.read(buffer)) != -1; ) {
            if (bytes.size() + (long) read > limit) throw new ChoiceCodec.TooLarge();
            bytes.write(buffer, 0, read);
        }
        return bytes.toByteArray();
    }

    /**
     * Puts [files] back after the choices text was restored, each through its row's own copy, which checks it the way a
     * pick is checked. A file whose patch isn't installed is unavailable, one its copy turns down is damaged, and one
     * that matches what's already there counts as unchanged. Runs off the main thread, since the font is loaded to check it.
     */
    static Result restore(Context context, SharedPreferences prefs, Map<String, byte[]> files, Set<String> installed) {
        Result result = new Result();
        Set<String> replies = pictures(prefs);
        for (Map.Entry<String, byte[]> file : files.entrySet()) {
            String name = file.getKey();
            byte[] bytes = file.getValue();
            if (FONT_NAME.equals(name)) continue;
            String owner = HEADER.equals(name) ? HomeHeader.KEY : FONT.equals(name) ? OwnFont.KEY : name.startsWith(TAB) ? TabIcons.KEY
                : name.startsWith(AUTO_REPLY) ? AutoReply.KEY : SpecialContacts.KEY;
            if (!installed.contains(owner)) {
                result.unavailable++;
                continue;
            }
            // A picture no restored reply sends would only be pruned again.
            if (name.startsWith(AUTO_REPLY) && !replies.contains(name.substring(AUTO_REPLY.length()))) continue;
            Boolean changed;
            try {
                if (HEADER.equals(name)) changed = picture(bytes, HomeHeader.file(context), HomeHeaderPicture.MAX_WIDTH,
                    HomeHeaderPicture.MAX_HEIGHT, HomeHeader::forget);
                else if (name.startsWith(TAB)) changed = picture(bytes, TabIcons.file(context, tab(name)), TabIcons.MAX_SIDE,
                    TabIcons.MAX_SIDE, TabIcons::forget);
                else if (FONT.equals(name)) changed = font(context, prefs, bytes, files.get(FONT_NAME));
                else if (name.startsWith(AUTO_REPLY)) changed = replyPicture(context, name.substring(AUTO_REPLY.length()), bytes);
                else changed = special(context, account(name), bytes);
            } catch (RuntimeException | OutOfMemoryError failure) {
                android.util.Log.w("HushMessenger", "A choice's file wasn't restored: " + failure.getClass().getSimpleName());
                changed = null;
            }
            if (changed == null) {
                result.damaged++;
                continue;
            }
            result.total++;
            if (changed) result.changed++;
        }
        return result;
    }

    /** True once [bytes] took [target]'s place, false when it already matched, null when the row's copy turned it down. */
    private static Boolean picture(byte[] bytes, File target, int maxWidth, int maxHeight, Runnable forget) {
        if (Arrays.equals(bytes, HomeHeaderPicture.keep(target))) return false;
        try {
            HomeHeaderPicture.copy(new ByteArrayInputStream(bytes), target, () -> true, maxWidth, maxHeight, forget);
            return true;
        } catch (HomeHeaderPicture.Refused refused) {
            android.util.Log.w("HushMessenger", "A restored picture was turned down: " + refused.reason);
            return null;
        }
    }

    private static Boolean font(Context context, SharedPreferences prefs, byte[] bytes, byte[] savedName) {
        // Cleaned the way a picked file's name is, so the row shows it the same.
        String name = FontFileRow.cleanFontName(savedName == null ? null : new String(savedName, StandardCharsets.UTF_8));
        File target = FontFile.file(context);
        synchronized (FontFile.LOCK) {
            try {
                if (name.equals(prefs.getString(OwnFont.NAME_KEY, "")) && target.length() == bytes.length
                        && Arrays.equals(bytes, Files.readAllBytes(target.toPath()))) return false;
            } catch (IOException | RuntimeException unreadable) {
                // Copied again below.
            }
        }
        try {
            FontFile.copy(new ByteArrayInputStream(bytes), target, OwnFont.fileCheck, new FontFile.Choice() {
                private boolean wrote;
                private Object before;

                @Override public boolean save() {
                    before = prefs.getAll().get(OwnFont.NAME_KEY);
                    wrote = true;
                    return prefs.edit().putString(OwnFont.NAME_KEY, name).commit();
                }

                @Override public void undo() {
                    if (wrote) OwnFont.restore(prefs, OwnFont.NAME_KEY, before);
                }
            });
            return true;
        } catch (FontFile.Refused refused) {
            android.util.Log.w("HushMessenger", "A restored font was turned down: " + refused.reason);
            return null;
        }
    }

    /**
     * An auto reply's picture goes back under the name its reply sends, once it decodes as a JPEG no bigger than a copy
     * the reply's own picker makes. Written beside it first and renamed, so a half-written one never takes its place.
     */
    private static Boolean replyPicture(Context context, String name, byte[] bytes) {
        File target = AutoReplyPicture.fileFor(context, name);
        try {
            if (target.length() == bytes.length && Arrays.equals(bytes, Files.readAllBytes(target.toPath()))) return false;
        } catch (IOException | RuntimeException unreadable) {
            // Written again below.
        }
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0 || Math.max(bounds.outWidth, bounds.outHeight) > AutoReplyPicture.MAX_EDGE
                || !"image/jpeg".equals(bounds.outMimeType)) return null;
        File folder = target.getParentFile();
        File partial = null;
        try {
            if (!folder.mkdirs() && !folder.isDirectory()) throw new IOException("No folder for the picture");
            // The name AutoReplyPicture.prune clears when a crash leaves one behind.
            partial = File.createTempFile("PIC_", ".part", folder);
            Files.write(partial.toPath(), bytes);
            Files.move(partial.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            return true;
        } catch (IOException | RuntimeException failure) {
            android.util.Log.w("HushMessenger", "A restored auto reply picture wasn't saved: " + failure.getClass().getSimpleName());
            return null;
        } finally {
            if (partial != null && partial.exists() && !partial.delete())
                android.util.Log.w("HushMessenger", "auto_reply: a half-restored picture stayed behind");
        }
    }

    /**
     * Follows each person in [bytes] again in [account]'s list. Nobody already followed is touched, so their history
     * stays. Null when no line names a person.
     */
    private static Boolean special(Context context, String account, byte[] bytes) {
        List<String[]> people = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        for (String line : new String(bytes, StandardCharsets.UTF_8).split("\n")) {
            int tab = line.indexOf('\t');
            String id = tab < 0 ? line : line.substring(0, tab);
            if (SpecialContactsStore.validId(id) && seen.add(id)) people.add(new String[] {id, tab < 0 ? "" : line.substring(tab + 1)});
        }
        if (people.isEmpty()) return null;
        SpecialContactsStore store = SpecialContacts.store(context, account);
        boolean added = false;
        long now = SpecialContacts.clock.getAsLong();
        for (String[] person : people) added |= store.track(person[0], person[1], now) == SpecialContactsStore.Result.ADDED;
        if (added) SpecialContacts.restored(store);
        return added;
    }
}
