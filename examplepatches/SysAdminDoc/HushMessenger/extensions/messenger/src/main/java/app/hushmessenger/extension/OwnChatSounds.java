package app.hushmessenger.extension;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.Resources;
import android.media.MediaMetadataRetriever;
import android.os.ParcelFileDescriptor;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.BooleanSupplier;
import java.util.function.Predicate;

/**
 * #224: Your own chat sounds. Messenger plays its send, sent and in-app message sounds through one method of its sound
 * player, which opens the sound's raw resource as a file descriptor and hands that to a MediaPlayer. The patch sends the
 * open here. A sound picked in settings answers with a descriptor of its copy in Messenger's files, and every other sound
 * gets Messenger's own open, so the player and everything that decides when a sound plays stay Messenger's.
 *
 * <p>A sound is known by its resource's name, or by the stock file's SHA-256 in a build that renames it, so a sound
 * swapped in by Custom chat sounds at patch time is still known by its name. Off, Pause, safe mode, a sound with nothing
 * picked and every failure play Messenger's own. Public, since the call comes from Messenger's sound code.
 */
public final class OwnChatSounds {
    static final String KEY = "own_chat_sounds";
    /** The sounds the settings page offers, in the order a message goes: out, through, and one coming in. */
    static final String[] SOUNDS = {"send", "sent", "in_app"};
    /** Each sound's raw resource in Messenger, in the order of {@link #SOUNDS}. */
    private static final String[] RESOURCES = {"sound_send", "sound_sent", "in_app_notification"};
    /** Each stock sound file's SHA-256, in the order of {@link #SOUNDS}. Tests put their own in. */
    static String[] stockHashes = {
        "f4751c0839ad07327aec9c097221e4a3fcbdd461bc6b303a2522051366498c9c",
        "e765cf8d429db8aa6e24cfea5ecb7a147b940ebf837523ca0161df63365524f7",
        "dfcdabe221fe3b72b3d052d446b5249cf0470af8defc1ac316c5d68a3704f60f",
    };
    /** The largest file taken, the same limit Custom chat sounds has at patch time. */
    static final int MAX_MEGABYTES = 1;
    static final long MAX_BYTES = MAX_MEGABYTES * 1024L * 1024L;
    /** The copy of a picked sound, in Messenger's files. */
    static final String FILE = "hushmessenger-sound-";
    /** Whether a copy plays, asked of Android's media reader. Tests put their own in, since Robolectric's reads nothing. */
    static Predicate<File> playCheck = OwnChatSounds::plays;
    /** Which of {@link #SOUNDS} each resource id is, or -1 for another sound. Ids don't change while Messenger runs. */
    private static final ConcurrentHashMap<Integer, Integer> SOUND_OF = new ConcurrentHashMap<>();

    /** Why a picked file wasn't taken. Each reaches the person as a sentence of its own. */
    enum Refusal { UNREADABLE, NOT_A_SOUND, TOO_LARGE, NOT_SAVED }

    /** A file turned down. Nothing was written, and the copy it would have replaced is still there. */
    static final class Refused extends Exception {
        final Refusal reason;

        Refused(Refusal reason, String message) {
            super(message);
            this.reason = reason;
        }
    }

    private OwnChatSounds() { }

    /**
     * The descriptor Messenger plays the raw sound [id] from: the picked copy's, or Messenger's own open. Messenger closes
     * it once the player has it. Only Messenger's own open can throw, as it always could.
     */
    public static AssetFileDescriptor rawSound(Resources resources, int id) {
        AssetFileDescriptor own = null;
        try {
            own = picked(resources, id);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't play your chat sound", error);
        }
        return own != null ? own : resources.openRawResourceFd(id);
    }

    private static AssetFileDescriptor picked(Resources resources, int id) throws IOException {
        if (resources == null || !Settings.wouldUse(KEY)) return null;
        Context context = Settings.appContext;
        if (context == null) return null;
        int sound = soundOf(resources, id);
        if (sound < 0) return null;
        File copy = file(context, SOUNDS[sound]);
        if (!copy.isFile()) return null;
        ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(copy, ParcelFileDescriptor.MODE_READ_ONLY);
        long length = descriptor.getStatSize();
        if (length <= 0) {
            descriptor.close();
            return null;
        }
        Settings.enabled(KEY);
        return new AssetFileDescriptor(descriptor, 0, length);
    }

    /** Which of {@link #SOUNDS} the raw resource [id] is, or -1. */
    static int soundOf(Resources resources, int id) {
        Integer known = SOUND_OF.get(id);
        if (known != null) return known;
        int sound = byName(resources, id);
        if (sound < 0) sound = byStockFile(resources, id);
        SOUND_OF.put(id, sound);
        return sound;
    }

    private static int byName(Resources resources, int id) {
        try {
            if (!"raw".equals(resources.getResourceTypeName(id))) return -1;
            String name = resources.getResourceEntryName(id);
            for (int i = 0; i < RESOURCES.length; i++) if (RESOURCES[i].equals(name)) return i;
        } catch (Resources.NotFoundException unnamed) {
            // An id the table has no name for is matched by its file below.
        }
        return -1;
    }

    /** The raw file's SHA-256 against the stock sounds'. A file past the size limit is none of them. */
    private static int byStockFile(Resources resources, int id) {
        String hash;
        try (InputStream input = resources.openRawResource(id)) {
            hash = sha256(input);
        } catch (IOException | RuntimeException unreadable) {
            return -1;
        }
        if (hash == null) return -1;
        for (int i = 0; i < stockHashes.length; i++) if (stockHashes[i].equals(hash)) return i;
        return -1;
    }

    private static String sha256(InputStream input) throws IOException {
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException missing) {
            throw new IOException("No SHA-256", missing);
        }
        byte[] buffer = new byte[16 * 1024];
        long total = 0;
        for (int read; (read = input.read(buffer)) != -1; ) {
            total += read;
            if (total > MAX_BYTES) return null;
            digest.update(buffer, 0, read);
        }
        StringBuilder hex = new StringBuilder();
        for (byte b : digest.digest()) hex.append(Character.forDigit((b >> 4) & 15, 16)).append(Character.forDigit(b & 15, 16));
        return hex.toString();
    }

    /** The resource ids read so far, for a test that swaps the stock sounds. */
    static void forget() {
        SOUND_OF.clear();
    }

    /** The copy of the file picked for [sound]. */
    static File file(Context context, String sound) {
        return new File(context.getFilesDir(), FILE + sound);
    }

    /** Whether any sound has a copy, so Save to a file makes a zip. */
    static boolean anyPicked(Context context) {
        for (String sound : SOUNDS) if (file(context, sound).isFile()) return true;
        return false;
    }

    /** Whether [bytes] start like an .ogg, .mp3, .m4a or .wav file, the formats Custom chat sounds takes. */
    static boolean looksLikeSound(byte[] bytes) {
        if (startsWith(bytes, "OggS") || startsWith(bytes, "ID3")) return true;
        if (bytes.length > 1 && bytes[0] == (byte) 0xFF && (bytes[1] & 0xE0) == 0xE0) return true;
        if (bytes.length > 8 && "ftyp".equals(new String(bytes, 4, 4, StandardCharsets.US_ASCII))) return true;
        return startsWith(bytes, "RIFF") && bytes.length > 12 && "WAVE".equals(new String(bytes, 8, 4, StandardCharsets.US_ASCII));
    }

    private static boolean startsWith(byte[] bytes, String head) {
        if (bytes.length < head.length()) return false;
        for (int i = 0; i < head.length(); i++) if (bytes[i] != (byte) head.charAt(i)) return false;
        return true;
    }

    /** Whether Android reads audio out of [copy]. A file that starts like a sound and isn't one plays nothing. */
    private static boolean plays(File copy) {
        MediaMetadataRetriever reader = new MediaMetadataRetriever();
        try {
            reader.setDataSource(copy.getPath());
            return "yes".equals(reader.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_AUDIO));
        } catch (RuntimeException unreadable) {
            return false;
        } finally {
            try {
                reader.release();
            } catch (IOException | RuntimeException ignored) {
                // Read already, or never opened.
            }
        }
    }

    /**
     * Copies [input] to [target] and closes [input]. The bytes go to a file beside [target] first, which takes its place
     * in one rename once it's whole, plays, and [wanted] still says yes, so a refused file, one that stops halfway and a
     * pick that was given up on all leave [target] as it was.
     */
    static void copy(InputStream input, File target, BooleanSupplier wanted) throws Refused {
        if (input == null) throw new Refused(Refusal.UNREADABLE, "No stream to read");
        File partial = HomeHeaderPicture.partial(target);
        boolean kept = false;
        try {
            byte[] bytes = readAll(input);
            if (!looksLikeSound(bytes)) throw new Refused(Refusal.NOT_A_SOUND, "Doesn't start like a sound file");
            try {
                Files.write(partial.toPath(), bytes);
            } catch (IOException | RuntimeException failure) {
                // The class only: a message can carry a path.
                throw new Refused(Refusal.NOT_SAVED, failure.getClass().getSimpleName());
            }
            if (!playCheck.test(partial)) throw new Refused(Refusal.NOT_A_SOUND, "Android reads no audio in it");
            if (!wanted.getAsBoolean()) throw new Refused(Refusal.NOT_SAVED, "Given up on");
            try {
                Files.move(partial.toPath(), target.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
            } catch (IOException | RuntimeException failure) {
                throw new Refused(Refusal.NOT_SAVED, failure.getClass().getSimpleName());
            }
            kept = true;
        } finally {
            try {
                input.close();
            } catch (IOException | RuntimeException ignored) {
                // Every byte wanted was read, or the copy was already turned down.
            }
            // A leftover that won't go is written over by the next pick.
            if (!kept) partial.delete();
        }
    }

    /** Every byte of [input], at most {@link #MAX_BYTES}, so a stream that never ends is turned down too. Empty isn't a sound. */
    static byte[] readAll(InputStream input) throws Refused {
        java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
        byte[] buffer = new byte[64 * 1024];
        long total = 0;
        while (true) {
            int count;
            try {
                count = input.read(buffer);
            } catch (IOException | RuntimeException error) {
                throw new Refused(Refusal.UNREADABLE, error.getClass().getSimpleName());
            }
            if (count == -1) break;
            total += count;
            if (total > MAX_BYTES) throw new Refused(Refusal.TOO_LARGE, "Larger than " + MAX_BYTES + " bytes");
            bytes.write(buffer, 0, count);
        }
        if (total == 0) throw new Refused(Refusal.NOT_A_SOUND, "Empty file");
        return bytes.toByteArray();
    }
}
