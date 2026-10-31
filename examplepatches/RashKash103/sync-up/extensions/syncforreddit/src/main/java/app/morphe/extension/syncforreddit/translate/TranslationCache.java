package app.morphe.extension.syncforreddit.translate;

import android.content.Context;

import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;

import app.morphe.extension.shared.Logger;

/**
 * Translations already made, kept so that reading a thread again does not pay for it again.
 *
 * <p>One file for each piece of text, named after what was translated, by what, and into what,
 * so that changing the service or the language asks afresh rather than answering with another
 * service's work. Kept in the app's own cache, which the system may empty when it wants room.
 *
 * @noinspection unused
 */
public final class TranslationCache {
    private static final String FOLDER = "sync-up-translations";

    /** What is written down: the translation, and the language it was translated from. */
    private static final String TEXT = "text";
    private static final String FROM = "from";

    private static final long A_DAY = 24L * 60 * 60 * 1000;

    private static final int KEPT_FOR_A_MONTH = 30;

    private TranslationCache() {}

    /** @return What was translated before, or null where it was not, or is too old to keep. */
    static Translated remembered(Context context, String text, String service, String into) {
        try {
            File held = fileFor(context, text, service, into);
            if (held == null || !held.exists()) {
                return null;
            }
            if (tooOld(context, held)) {
                deleteQuietly(held);
                return null;
            }
            JSONObject said = new JSONObject(read(held));
            return new Translated(said.optString(TEXT), said.optString(FROM));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not read a remembered translation: " + ex);
            return null;
        }
    }

    static void remember(Context context, String text, String service, String into,
                         Translated translated) {
        try {
            File held = fileFor(context, text, service, into);
            if (held == null) {
                return;
            }
            File folder = held.getParentFile();
            if (folder != null && !folder.exists() && !folder.mkdirs()) {
                return;
            }
            JSONObject said = new JSONObject();
            said.put(TEXT, translated.text);
            said.put(FROM, translated.from);
            write(held, said.toString());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not remember a translation: " + ex);
        }
    }

    /** How much room what is kept takes up, said the way the app says other sizes. */
    public static String size(Context context) {
        long bytes = 0;
        File[] held = folder(context).listFiles();
        if (held != null) {
            for (File one : held) {
                bytes += one.length();
            }
        }
        if (bytes == 0) {
            return "Empty";
        }
        if (bytes < 1024 * 1024) {
            return String.format(Locale.US, "%.0f kB", bytes / 1024f);
        }
        return String.format(Locale.US, "%.1f MB", bytes / (1024f * 1024f));
    }

    /** Throws away everything kept. */
    public static void clear(Context context) {
        File[] held = folder(context).listFiles();
        if (held == null) {
            return;
        }
        for (File one : held) {
            deleteQuietly(one);
        }
    }

    /** Throws away what has been kept longer than the settings say to keep it. */
    static void tidy(Context context) {
        try {
            File[] held = folder(context).listFiles();
            if (held == null) {
                return;
            }
            for (File one : held) {
                if (tooOld(context, one)) {
                    deleteQuietly(one);
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not tidy away old translations: " + ex);
        }
    }

    private static boolean tooOld(Context context, File held) {
        int days = keptForDays(context);
        return days > 0 && System.currentTimeMillis() - held.lastModified() > days * A_DAY;
    }

    /** @return How many days to keep a translation, or zero to keep it always. */
    private static int keptForDays(Context context) {
        try {
            return Integer.parseInt(TranslationSettings.text(
                    context, TranslationSettings.KEEP, String.valueOf(KEPT_FOR_A_MONTH)));
        } catch (Exception ex) {
            return KEPT_FOR_A_MONTH;
        }
    }

    private static File folder(Context context) {
        return new File(context.getCacheDir(), FOLDER);
    }

    private static File fileFor(Context context, String text, String service, String into) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update((service + ' ' + into + ' ' + text).getBytes(StandardCharsets.UTF_8));

            StringBuilder named = new StringBuilder();
            for (byte part : digest.digest()) {
                named.append(String.format(Locale.US, "%02x", part));
            }
            return new File(folder(context), named.toString());
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not name a translation: " + ex);
            return null;
        }
    }

    private static void deleteQuietly(File held) {
        if (!held.delete()) {
            Logger.printInfo(() -> "Could not throw away " + held.getName());
        }
    }

    private static String read(File held) throws Exception {
        byte[] bytes = new byte[(int) held.length()];
        try (FileInputStream from = new FileInputStream(held)) {
            int read = 0;
            while (read < bytes.length) {
                int some = from.read(bytes, read, bytes.length - read);
                if (some < 0) {
                    break;
                }
                read += some;
            }
        }
        return new String(bytes, StandardCharsets.UTF_8);
    }

    private static void write(File held, String what) throws Exception {
        try (FileOutputStream into = new FileOutputStream(held)) {
            into.write(what.getBytes(StandardCharsets.UTF_8));
        }
    }

    /** A translation, and the language it was translated from. */
    static final class Translated {
        final String text;
        final String from;

        Translated(String text, String from) {
            this.text = text;
            this.from = from;
        }
    }
}
