package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.Executor;
import java.util.function.Consumer;

/**
 * Saving the theme to a .json file and opening one (#115), through the phone's own file picker. The file holds the same
 * text Copy theme puts on the clipboard. Reading and writing run off the main thread, since a picker can hand back a
 * cloud document. One per settings page.
 */
final class ThemeDocument {
    /** Theme text is at most ThemeFile.MAX_TEXT characters, so a bigger file isn't a theme. */
    static final int MAX_BYTES = ThemeFile.MAX_TEXT * 4;
    static final String MIME = "application/json";
    /** Where the copy runs. Tests run it in place. */
    static Executor worker = work -> {
        Thread thread = new Thread(work, "HushMessengerThemeFile");
        thread.setDaemon(true);
        thread.start();
    };

    private final SettingsActivity page;
    private final Consumer<ThemeFile> use;
    private final Handler main = new Handler(Looper.getMainLooper());
    /** The text a Save picker is choosing a place for, or null. */
    private String saving;
    /** Bumped when the page closes, so a copy that finishes later says nothing. */
    private long generation;

    ThemeDocument(SettingsActivity page, Consumer<ThemeFile> use) {
        this.page = page;
        this.use = use;
    }

    void destroy() {
        generation++;
        saving = null;
    }

    /** Asks where to save [theme], named after it. */
    void save(ThemeFile theme) {
        saving = theme.encode();
        Intent picker = new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType(MIME)
            .putExtra(Intent.EXTRA_TITLE, fileName(theme.name));
        try { page.startActivityForResult(picker, SettingsActivity.SAVE_THEME); }
        catch (ActivityNotFoundException | SecurityException error) {
            saving = null;
            page.feedback(page.text.get("theme_file_no_picker"), Toast.LENGTH_LONG);
        }
    }

    /** Asks for a theme file. Some file apps call a .json text/plain or application/octet-stream. */
    void open() {
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
            .putExtra(Intent.EXTRA_MIME_TYPES, new String[] {MIME, "text/*", "application/octet-stream"});
        try { page.startActivityForResult(picker, SettingsActivity.READ_THEME); }
        catch (ActivityNotFoundException | SecurityException error) {
            page.feedback(page.text.get("theme_file_no_picker"), Toast.LENGTH_LONG);
        }
    }

    /** The picker's answer. Cancelled: nothing changes and nothing is said. */
    void result(int request, int result, Intent data) {
        Uri uri = result == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (request == SettingsActivity.SAVE_THEME) {
            String text = saving;
            saving = null;
            if (uri == null || text == null) return;
            write(uri, text);
        } else if (request == SettingsActivity.READ_THEME && uri != null) read(uri);
    }

    private void write(Uri uri, String text) {
        long started = generation;
        android.content.ContentResolver resolver = page.getContentResolver();
        worker.execute(() -> {
            boolean saved;
            try (OutputStream out = resolver.openOutputStream(uri, "wt")) {
                if (out == null) throw new IOException("no stream");
                out.write(text.getBytes(StandardCharsets.UTF_8));
                saved = true;
            } catch (IOException | RuntimeException error) {
                // The class only: a provider's message can carry the document's name or address.
                android.util.Log.w("HushMessenger", "Can't save the theme file: " + error.getClass().getSimpleName());
                saved = false;
            }
            String key = saved ? "theme_file_saved" : "theme_file_save_failed";
            int length = saved ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG;
            main.post(() -> {
                if (started != generation || page.isFinishing()) return;
                page.feedback(page.text.get(key), length);
            });
        });
    }

    private void read(Uri uri) {
        long started = generation;
        android.content.ContentResolver resolver = page.getContentResolver();
        worker.execute(() -> {
            ThemeFile theme = null;
            String refusal = null;
            String read = null;
            try (InputStream in = resolver.openInputStream(uri)) {
                if (in == null) throw new IOException("no stream");
                read = readText(in);
            } catch (IOException | SecurityException error) {
                // A file the provider won't hand over gets different advice from one that isn't a theme.
                android.util.Log.w("HushMessenger", "Can't open the theme file: " + error.getClass().getSimpleName());
                refusal = "theme_file_unreadable";
            } catch (RuntimeException error) {
                android.util.Log.w("HushMessenger", "That file isn't a theme: " + error.getClass().getSimpleName());
                refusal = "theme_file_invalid";
            }
            if (refusal == null) {
                try { theme = ThemeFile.parse(read); }
                catch (RuntimeException error) {
                    android.util.Log.w("HushMessenger", "That file isn't a theme: " + error.getClass().getSimpleName());
                    refusal = "theme_file_invalid";
                }
            }
            ThemeFile found = theme;
            String said = refusal;
            main.post(() -> {
                if (started != generation || page.isFinishing()) return;
                if (said != null) page.feedback(page.text.get(said), Toast.LENGTH_LONG);
                else use.accept(found);
            });
        });
    }

    /** The file as UTF-8 text, refusing one bigger than any theme. */
    static String readText(InputStream in) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        byte[] chunk = new byte[1024];
        for (int n; (n = in.read(chunk)) != -1; ) {
            bytes.write(chunk, 0, n);
            if (bytes.size() > MAX_BYTES) throw new IllegalArgumentException("too big for a theme");
        }
        String text = new String(bytes.toByteArray(), StandardCharsets.UTF_8);
        // A byte-order mark some editors write isn't part of the JSON.
        return text.startsWith("\uFEFF") ? text.substring(1) : text;
    }

    /** "Sunset.json" for a theme named Sunset, keeping only what every file app takes in a name. */
    static String fileName(String name) {
        StringBuilder safe = new StringBuilder();
        if (name != null) {
            for (int i = 0; i < name.length() && safe.length() < ThemeFile.MAX_NAME; i++) {
                char c = name.charAt(i);
                safe.append(Character.isLetterOrDigit(c) || c == ' ' || c == '-' || c == '_' ? c : ' ');
            }
        }
        String trimmed = safe.toString().trim().replaceAll(" +", " ");
        return (trimmed.isEmpty() ? "HushMessenger theme" : trimmed) + ".json";
    }
}
