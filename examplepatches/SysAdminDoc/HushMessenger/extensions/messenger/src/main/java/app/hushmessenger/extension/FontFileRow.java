package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The rows under Use your own font: the picked file's status, Choose, Stop and Use your phone's font, and the size and
 * move steps for the picked file. A copy and the saves outlive the page that started them, so their state is
 * process-wide and they come back to whichever page shows the rows then. One per settings page.
 */
final class FontFileRow {
    /** The names providers give fonts, and plain bytes for one that doesn't know a font. The copy checks what it really is. */
    static final String[] FONT_TYPES = {"font/ttf", "font/otf", "font/collection", "font/sfnt", "application/x-font-ttf",
        "application/x-font-otf", "application/font-sfnt", "application/vnd.ms-opentype", "application/octet-stream"};
    static final int MAX_FONT_NAME = 80;
    /** The font copy running now, if any. Process-wide, like the page that shows it, which the theme switch can recreate. */
    private static volatile FontJob fontJob;
    /** A provider that never answers leaves its copy's thread waiting, so at most two ever wait at once. */
    private static final java.util.concurrent.Semaphore fontSlots = new java.util.concurrent.Semaphore(2);
    static int fontTimeoutMillis = 60_000;
    /** Size, move and phone font saves, off the main thread and one at a time, so each tap starts from the one before. */
    static final java.util.concurrent.ExecutorService FONT_WRITES = java.util.concurrent.Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMessengerFontSave");
        thread.setDaemon(true);
        return thread;
    });
    /**
     * Saves tapped and not yet back on the main thread, how many of them put the phone's font back, and what the latest
     * finished one had to say. Main thread only.
     */
    private static int fontWrites, phoneFontWrites;
    private static String fontWriteMessage;
    private static java.lang.ref.WeakReference<FontFileRow> fontPage = new java.lang.ref.WeakReference<>(null);
    private TextView fontStatus, fontSize, fontShift;
    private Button fontChoose, fontStop, fontPhone, fontSmaller, fontLarger, fontUp, fontDown;
    private LinearLayout fontAdjust;
    private final SettingsActivity page;

    FontFileRow(SettingsActivity page) {
        this.page = page;
    }

    /** The font file rows under Use your own font. Use your phone's font shows only while there's a file to go back from. */
    void addTo(LinearLayout content) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        fontPage = new java.lang.ref.WeakReference<>(this);
        fontStatus = ui.text("", 13, ui.muted, false);
        fontStatus.setTag("font_file_status");
        fontStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, fontStatus, 8);
        fontChoose = ui.button(text.get("font_file_choose"));
        fontChoose.setTag("font_file");
        fontChoose.setOnClickListener(view -> pickFontFile());
        ui.add(content, fontChoose, 8);
        fontStop = ui.button(text.get("font_file_stop"));
        fontStop.setTag("font_file_stop");
        fontStop.setOnClickListener(view -> {
            FontJob job = fontJob;
            if (job != null) job.stop("font_file_stopped");
        });
        ui.add(content, fontStop, 8);
        fontPhone = ui.button(text.get("font_phone"));
        fontPhone.setTag("font_phone");
        fontPhone.setOnClickListener(view -> usePhoneFont());
        ui.add(content, fontPhone, 8);
        ui.add(content, ui.text(text.get("font_file_help"), 13, ui.muted, false), 8);
        // #48: size and place the picked file, for a font that draws small or sits high in a bubble.
        fontAdjust = new LinearLayout(page);
        fontAdjust.setTag("font_adjust");
        fontAdjust.setOrientation(LinearLayout.VERTICAL);
        fontSize = ui.text("", 14, ui.text, false);
        fontSize.setTag("font_size_value");
        fontSmaller = ui.button(text.get("font_size_smaller"));
        fontSmaller.setTag("font_size_smaller");
        fontSmaller.setOnClickListener(view -> stepFont(OwnFont.SCALE_KEY, -FontFile.SCALE_STEP));
        fontLarger = ui.button(text.get("font_size_larger"));
        fontLarger.setTag("font_size_larger");
        fontLarger.setOnClickListener(view -> stepFont(OwnFont.SCALE_KEY, FontFile.SCALE_STEP));
        fontAdjustRow(fontSize, fontSmaller, fontLarger);
        fontShift = ui.text("", 14, ui.text, false);
        fontShift.setTag("font_shift_value");
        fontUp = ui.button(text.get("font_shift_up_button"));
        fontUp.setTag("font_shift_up");
        fontUp.setOnClickListener(view -> stepFont(OwnFont.SHIFT_KEY, -FontFile.SHIFT_STEP));
        fontDown = ui.button(text.get("font_shift_down_button"));
        fontDown.setTag("font_shift_down");
        fontDown.setOnClickListener(view -> stepFont(OwnFont.SHIFT_KEY, FontFile.SHIFT_STEP));
        fontAdjustRow(fontShift, fontUp, fontDown);
        ui.add(fontAdjust, ui.text(text.get("font_adjust_help"), 13, ui.muted, false), 8);
        ui.add(content, fontAdjust, 4);
        refreshFontFile();
    }

    /** A value with its two step buttons beside it. The value says the change out loud as it happens. */
    private void fontAdjustRow(TextView value, Button less, Button more) {
        SettingsUi ui = page.ui;
        value.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        LinearLayout row = ui.row();
        if (ui.largeText) ui.add(fontAdjust, value, 16);
        else row.addView(value, new LinearLayout.LayoutParams(0, -2, 1));
        LinearLayout.LayoutParams first = new LinearLayout.LayoutParams(ui.largeText ? 0 : -2, -2, ui.largeText ? 1 : 0);
        row.addView(less, first);
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(first);
        gap.setMarginStart(ui.dp(8));
        if (!ui.largeText) first.setMarginStart(ui.dp(8));
        row.addView(more, new LinearLayout.LayoutParams(gap));
        ui.add(fontAdjust, row, 8);
    }

    /**
     * Moves the size or the text one step, held inside what the font file can take. The save waits its turn off the main
     * thread and starts from what the tap before it saved, so quick taps add up.
     */
    private void stepFont(String key, int step) {
        SettingsText text = page.text;
        if (fontJob != null) return;
        SharedPreferences prefs = Settings.preferences;
        SettingsText words = text;
        writeFont(page.getApplicationContext(), () -> {
            boolean size = OwnFont.SCALE_KEY.equals(key);
            synchronized (FontFile.LOCK) {
                // The phone's font went back in first, so there's no picked file left to size.
                if (prefs.getString(OwnFont.NAME_KEY, "").isEmpty()) return null;
                int now = size ? OwnFont.scale(prefs) : OwnFont.shift(prefs);
                int next = size ? Math.max(FontFile.SCALE_LEAST, Math.min(FontFile.SCALE_MOST, now + step))
                    : Math.max(-FontFile.SHIFT_MOST, Math.min(FontFile.SHIFT_MOST, now + step));
                if (next == now) return null;
                if (!OwnFont.save(prefs, key, next)) throw new IllegalStateException("Not saved");
                return words.get("font_adjust_saved", size ? fontSizeText(words, next) : fontShiftText(words, next));
            }
        }, words.get("font_adjust_failed"), Toast.LENGTH_SHORT, false);
    }

    /**
     * Runs [save] on the font save thread and comes back to whichever page shows the rows then. [save] answers what to say,
     * or null for nothing, and a throw says [failed] at once. Otherwise only the last of a run of taps says its result.
     * [phone] marks the save that puts the phone's font back, which holds the size and move buttons until it's done.
     */
    private void writeFont(Context app, java.util.concurrent.Callable<String> save, String failed, int length, boolean phone) {
        fontWrites++;
        if (phone) phoneFontWrites++;
        refreshFontFile();
        android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
        FONT_WRITES.execute(() -> {
            String message;
            boolean ok;
            try {
                message = save.call();
                ok = true;
            } catch (Exception | LinkageError error) {
                android.util.Log.w("HushMessenger", "Can't save the font choice: " + error.getClass().getSimpleName());
                message = failed;
                ok = false;
            }
            String said = message;
            boolean saved = ok;
            main.post(() -> {
                fontWrites--;
                if (phone) phoneFontWrites--;
                if (said != null) fontWriteMessage = said;
                FontFileRow row = shownFontPage();
                if (row != null) row.refreshFontFile();
                if ((!saved || fontWrites == 0) && fontWriteMessage != null) {
                    sayFont(app, row, fontWriteMessage, length);
                    fontWriteMessage = null;
                }
            });
        });
    }

    private static String fontSizeText(SettingsText words, int scale) {
        return words.get("font_size", scale);
    }

    private static String fontShiftText(SettingsText words, int shift) {
        return shift == 0 ? words.get("font_shift_none") : words.get(shift > 0 ? "font_shift_down" : "font_shift_up", Math.abs(shift));
    }

    void refreshFontFile() {
        SettingsText text = page.text;
        // A new file under the old name saves nothing new, so no settings change calls refreshChoices.
        page.updateRestartRow();
        if (fontStatus == null) return;
        String name = Settings.preferences.getString(OwnFont.NAME_KEY, "");
        boolean copy = FontFile.file(page).isFile(), busy = fontJob != null, on = Settings.preferences.getBoolean(OwnFont.KEY, false);
        // A file swap waits for queued saves, and a queued phone font save would remove what it picked.
        boolean saving = fontWrites > 0, reverting = phoneFontWrites > 0;
        // Two stopped copies still waiting on their files hold both slots, so a third can't start until one gives up.
        boolean stuck = !busy && fontSlots.availablePermits() == 0;
        // With the switch off nothing here is in use yet, so the line says what turning it on would do.
        String status = busy ? text.get("font_file_copying")
            : name.isEmpty() ? text.get(on ? "font_file_none" : "font_file_none_off", FontFile.MAX_MEGABYTES)
            : !copy ? text.get("font_file_missing", name)
            : text.get(on ? "font_file_using" : "font_file_picked_off", name);
        // Stuck copies don't change which font is in use, so the line still says that first.
        if (stuck) status = status + " " + text.get("font_file_stuck");
        if (!status.contentEquals(fontStatus.getText())) fontStatus.setText(status);
        fontChoose.setEnabled(!busy && !saving && !stuck);
        fontStop.setVisibility(busy ? View.VISIBLE : View.GONE);
        fontPhone.setEnabled(!busy && !saving);
        // A copy no name points at still gets a way out.
        fontPhone.setVisibility(!name.isEmpty() || copy ? View.VISIBLE : View.GONE);
        // Sizing works on the picked file, so it shows only while there is one.
        fontAdjust.setVisibility(!name.isEmpty() && copy ? View.VISIBLE : View.GONE);
        SharedPreferences prefs = Settings.preferences;
        int scale = OwnFont.scale(prefs), shift = OwnFont.shift(prefs);
        String size = fontSizeText(text, scale), place = fontShiftText(text, shift);
        if (!size.contentEquals(fontSize.getText())) fontSize.setText(size);
        if (!place.contentEquals(fontShift.getText())) fontShift.setText(place);
        fontSmaller.setEnabled(!busy && !reverting && scale > FontFile.SCALE_LEAST);
        fontLarger.setEnabled(!busy && !reverting && scale < FontFile.SCALE_MOST);
        fontUp.setEnabled(!busy && !reverting && shift > -FontFile.SHIFT_MOST);
        fontDown.setEnabled(!busy && !reverting && shift < FontFile.SHIFT_MOST);
    }

    private void pickFontFile() {
        SettingsText text = page.text;
        if (fontJob != null || fontWrites > 0) return;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
            .putExtra(Intent.EXTRA_MIME_TYPES, FONT_TYPES);
        try { page.startActivityForResult(picker, SettingsActivity.PICK_FONT); }
        catch (android.content.ActivityNotFoundException missing) { page.feedback(text.get("font_file_no_picker"), Toast.LENGTH_LONG); }
        catch (RuntimeException error) { page.feedback(text.get("font_file_picker_failed"), Toast.LENGTH_LONG); }
    }

    /** Copies the picked file in on a worker. The saved name changes only once the copy has passed its checks. */
    void copyFontFile(android.net.Uri uri) {
        SettingsText text = page.text;
        // A stuck copy can't be ended from here, only left behind, so a third waits until one of two gives up.
        if (fontJob != null || fontWrites > 0 || !fontSlots.tryAcquire()) {
            page.feedback(text.get("font_file_busy"), Toast.LENGTH_LONG);
            return;
        }
        FontJob job = new FontJob(page.getApplicationContext(), Settings.preferences, uri, text);
        fontJob = job;
        refreshFontFile();
        job.handler.postDelayed(job.deadline, Math.max(1, fontTimeoutMillis));
        try {
            job.worker.start();
        } catch (RuntimeException | OutOfMemoryError error) {
            // No thread, so nothing will hand the slot back but this.
            android.util.Log.w("HushMessenger", "Can't start the font copy: " + error.getClass().getSimpleName());
            job.handler.removeCallbacks(job.deadline);
            fontJob = null;
            fontSlots.release();
            refreshFontFile();
            page.feedback(text.get("font_file_busy"), Toast.LENGTH_LONG);
        }
    }

    /**
     * A picked file's copy on a thread of its own. Its provider can stall in any call, so the copy has a deadline and a
     * Stop button, and a stopped copy never saves: the name and file change only from RUNNING, and a stop ends RUNNING.
     */
    private static final class FontJob implements Runnable {
        static final int RUNNING = 0, SAVING = 1, STOPPED = 2, FINISHED = 3;
        final java.util.concurrent.atomic.AtomicInteger state = new java.util.concurrent.atomic.AtomicInteger(RUNNING);
        final android.os.CancellationSignal cancellation = new android.os.CancellationSignal();
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline = () -> stop("font_file_timeout", false);
        final Context app;
        final SharedPreferences prefs;
        final android.net.Uri uri;
        final SettingsText words;
        final Thread worker;
        volatile java.io.Closeable input;

        FontJob(Context app, SharedPreferences prefs, android.net.Uri uri, SettingsText words) {
            this.app = app;
            this.prefs = prefs;
            this.uri = uri;
            this.words = words;
            worker = new Thread(this, "HushMessengerFontCopy");
            worker.setDaemon(true);
        }

        @Override public void run() {
            String message = null;
            try {
                message = copyFont(this);
            } catch (RuntimeException | LinkageError error) {
                android.util.Log.e("HushMessenger", "Can't copy the font file: " + error.getClass().getSimpleName());
            } finally {
                // In finally, so even an error this can't catch frees the slot and the page.
                input = null;
                // Done: a deadline or Stop from here on can't stand in for the copy's own answer.
                if (!state.compareAndSet(RUNNING, FINISHED)) state.compareAndSet(SAVING, FINISHED);
                fontSlots.release();
                String said = message != null ? message : words.get("font_file_not_saved");
                handler.post(() -> {
                    handler.removeCallbacks(deadline);
                    if (fontJob == this) fontJob = null;
                    // A stopped copy said so when it stopped, and saved nothing after. Its slot is free again, though.
                    if (state.get() != STOPPED) fontDone(app, said);
                    else {
                        FontFileRow row = shownFontPage();
                        if (row != null) row.refreshFontFile();
                    }
                });
            }
        }

        /** Whether the copy may save its name and file now. Once it may, a stop no longer takes it back. */
        boolean startSaving() {
            return state.compareAndSet(RUNNING, SAVING);
        }

        boolean stopped() {
            return state.get() == STOPPED;
        }

        /** The Stop button. */
        void stop(String status) {
            stop(status, true);
        }

        /** On the main thread, from the Stop button or the deadline. A copy already saving finishes and says how it went. */
        void stop(String status, boolean tapped) {
            if (!state.compareAndSet(RUNNING, STOPPED)) {
                // Saving can't be taken back. A tap hears it's finishing; the deadline lets it finish without a word.
                if (tapped && state.get() == SAVING) sayFont(app, shownFontPage(), words.get("font_file_finishing"), Toast.LENGTH_SHORT);
                return;
            }
            handler.removeCallbacks(deadline);
            if (fontJob == this) fontJob = null;
            worker.interrupt();
            // A provider's cancellation and close can both block, so neither runs on the main thread.
            Thread closer = new Thread(() -> {
                try {
                    cancellation.cancel();
                } catch (RuntimeException ignored) {
                    // Closing the stream is the other way out.
                } finally {
                    java.io.Closeable open = input;
                    try {
                        if (open != null) open.close();
                    } catch (java.io.IOException | RuntimeException ignored) {
                        // The copy is stopped either way and saves nothing.
                    }
                }
            }, "HushMessengerFontStop");
            closer.setDaemon(true);
            closer.start();
            fontDone(app, words.get(status));
        }
    }

    private static String copyFont(FontJob job) {
        Context app = job.app;
        SharedPreferences prefs = job.prefs;
        SettingsText words = job.words;
        String name = fontName(app, job.uri, job.cancellation);
        try {
            if (job.stopped()) throw new FontFile.Refused(FontFile.Refusal.UNREADABLE, "Stopped");
            java.io.InputStream opened;
            try {
                opened = app.getContentResolver().openInputStream(job.uri);
            } catch (java.io.IOException | RuntimeException error) {
                // The class only: a provider's message can carry the document's name or address.
                throw new FontFile.Refused(FontFile.Refusal.UNREADABLE, error.getClass().getSimpleName());
            }
            job.input = opened;
            // A provider can swallow the interrupt, so every read also asks whether the copy was stopped.
            java.io.InputStream input = opened == null ? null : new java.io.FilterInputStream(opened) {
                @Override public int read(byte[] buffer, int offset, int length) throws java.io.IOException {
                    if (job.stopped()) throw new java.io.InterruptedIOException("Stopped");
                    return super.read(buffer, offset, length);
                }
            };
            FontFile.copy(input, FontFile.file(app), OwnFont.fileCheck, new FontFile.Choice() {
                private boolean wrote;
                private Object before;

                @Override public boolean save() {
                    if (!job.startSaving()) return false;
                    // Read under FontFile.LOCK, so it's the name the copy in place goes with.
                    before = prefs.getAll().get(OwnFont.NAME_KEY);
                    wrote = true;
                    return prefs.edit().putString(OwnFont.NAME_KEY, name).commit();
                }

                @Override public void undo() {
                    if (wrote) OwnFont.restore(prefs, OwnFont.NAME_KEY, before);
                }
            });
            // With the switch off a restart changes nothing, so the toast names the switch instead. The status line
            // under it names the file, which can be too long for a toast.
            return words.get(prefs.getBoolean(OwnFont.KEY, false) ? "font_file_set" : "font_file_set_off");
        } catch (FontFile.Refused refused) {
            android.util.Log.i("HushMessenger", "Font file refused: " + refused.reason);
            switch (refused.reason) {
                case NOT_A_FONT: return words.get("font_file_not_font");
                case TOO_LARGE: return words.get("font_file_too_large", FontFile.MAX_MEGABYTES);
                case WONT_LOAD: return words.get("font_file_wont_load");
                case NOT_SAVED: return words.get("font_file_not_saved");
                default: return words.get("font_file_unreadable");
            }
        }
    }

    static String fontName(Context context, android.net.Uri uri) {
        return fontName(context, uri, null);
    }

    /** The picked file's name as its provider gives it, or the last part of its address. Never its path. */
    static String fontName(Context context, android.net.Uri uri, android.os.CancellationSignal cancellation) {
        String name = null;
        try (android.database.Cursor cursor = context.getContentResolver().query(uri,
                new String[] {android.provider.OpenableColumns.DISPLAY_NAME}, null, null, null, cancellation)) {
            if (cursor != null && cursor.moveToFirst()) name = cursor.getString(0);
        } catch (RuntimeException unknown) {
            // A provider that can't say leaves the address's own last part.
        }
        if (name == null || name.trim().isEmpty()) name = lastPart(uri.getLastPathSegment());
        return cleanFontName(name);
    }

    /** A document ID like "primary:Download/Fonts/x.ttf" is a path, so only what follows its last '/' or ':' is kept. */
    static String lastPart(String segment) {
        return segment == null ? null : segment.substring(Math.max(segment.lastIndexOf('/'), segment.lastIndexOf(':')) + 1);
    }

    /** One line with no control or formatting characters, at most {@link #MAX_FONT_NAME} long, and a stand-in when nothing's left. */
    static String cleanFontName(String name) {
        if (name == null) return "your font file";
        StringBuilder clean = new StringBuilder();
        int kept = 0;
        for (int index = 0; index < name.length() && kept < MAX_FONT_NAME; ) {
            int at = name.codePointAt(index);
            index += Character.charCount(at);
            int type = Character.getType(at);
            if (type == Character.CONTROL || type == Character.FORMAT || type == Character.UNASSIGNED || type == Character.LINE_SEPARATOR
                || type == Character.PARAGRAPH_SEPARATOR || type == Character.PRIVATE_USE || type == Character.SURROGATE) continue;
            clean.appendCodePoint(Character.isWhitespace(at) ? ' ' : at);
            kept++;
        }
        String trimmed = clean.toString().trim().replaceAll(" {2,}", " ");
        return trimmed.isEmpty() ? "your font file" : trimmed;
    }

    /** Back on the main thread: the page showing the rows now, which may be a newer one than started the copy. */
    private static void fontDone(Context app, String message) {
        FontFileRow row = shownFontPage();
        if (row != null) row.refreshFontFile();
        sayFont(app, row, message, Toast.LENGTH_LONG);
    }

    /** The font rows showing now, if a page with them is open. */
    private static FontFileRow shownFontPage() {
        FontFileRow row = fontPage.get();
        return row != null && row.page.isDestroyed() ? null : row;
    }

    /** On [row]'s page when one shows the rows, or a toast of its own once settings have closed. */
    private static void sayFont(Context app, FontFileRow row, String message, int length) {
        if (row != null) {
            row.page.feedback(message, length);
            return;
        }
        if (SettingsActivity.toast != null) SettingsActivity.toast.cancel();
        SettingsActivity.toast = Toast.makeText(app, message, length);
        SettingsActivity.toast.show();
    }

    /**
     * Saves the phone's font as the choice, then removes the copy, so the name never points at a deleted file. A save that
     * fails keeps the picked name and its copy together. Both run on the font save thread.
     */
    private void usePhoneFont() {
        SettingsText text = page.text;
        if (fontJob != null) return;
        SharedPreferences prefs = Settings.preferences;
        Context app = page.getApplicationContext();
        String set = text.get("font_phone_set");
        writeFont(app, () -> {
            java.io.File copy = FontFile.file(app);
            synchronized (FontFile.LOCK) {
                if (!OwnFont.save(prefs, OwnFont.NAME_KEY, "")) throw new IllegalStateException("Not saved");
                if (copy.exists() && !copy.delete()) android.util.Log.i("HushMessenger", "The font file copy couldn't be removed");
            }
            FontFile.dropAdjusted(copy.getParentFile(), null);
            return set;
        }, text.get("font_phone_failed"), Toast.LENGTH_LONG, true);
    }
}
