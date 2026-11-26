package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The rows under Your own home header: the words, the picture's status, Choose and Remove for the picture, and the
 * words' own font file (#212). A copy outlives the page that started it, so its state is process-wide and it comes back
 * to whichever page shows the rows then. One per settings page.
 */
final class HomeHeaderRow {
    /** A picker's provider can stall, so a copy that hasn't finished by then is given up and Choose works again. */
    static int copyTimeoutMillis = 60_000;
    /** Typing waits this long for a pause before the words are saved and the chat list redraws. */
    static final int SAVE_DELAY_MILLIS = 300;
    /** The picture or font copy running now, if any, one at a time. Main thread only. */
    private static Job job;
    /** Whether Remove the font is still on the font save thread. Main thread only. */
    private static boolean removingFont;
    private static java.lang.ref.WeakReference<HomeHeaderRow> shown = new java.lang.ref.WeakReference<>(null);
    private final SettingsActivity page;
    private final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable save = this::saveWords;
    private EditText words;
    /** Whether the words were typed since the last save. A page left untouched never puts its old words back. */
    private boolean typed;
    private TextView status, fontStatus;
    private Button choose, remove, chooseFont, removeFont;

    HomeHeaderRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        shown = new java.lang.ref.WeakReference<>(this);
        words = ui.field(text.get("home_header_words_hint", HomeHeader.MAX_LENGTH), HomeHeader.MAX_LENGTH, true);
        words.setTag("home_header_text");
        // Leaving the page saves what was typed, so a page made again reads the words from there, never its own old copy.
        words.setSaveEnabled(false);
        words.setText(Settings.preferences.getString(HomeHeader.TEXT, ""));
        TextView label = ui.text(text.get("home_header_words"), 14, ui.text, true);
        label.setLabelFor(words.getId());
        ui.add(content, label, 12);
        ui.add(content, words, 8);
        words.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence typed, int start, int count, int after) { }

            @Override public void onTextChanged(CharSequence typed, int start, int before, int count) { }

            @Override public void afterTextChanged(android.text.Editable edited) {
                typed = true;
                handler.removeCallbacks(save);
                handler.postDelayed(save, SAVE_DELAY_MILLIS);
            }
        });
        words.setOnFocusChangeListener((view, focused) -> { if (!focused) saveWords(); });
        status = ui.text("", 13, ui.muted, false);
        status.setTag("home_header_status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, status, 12);
        choose = ui.button(text.get("home_header_choose"));
        choose.setTag("home_header_choose");
        choose.setOnClickListener(view -> pick());
        ui.add(content, choose, 8);
        remove = ui.destructiveButton(text.get("home_header_remove"));
        remove.setTag("home_header_remove");
        remove.setOnClickListener(view -> removePicture());
        ui.add(content, remove, 8);
        ui.add(content, ui.text(text.get("home_header_help", HomeHeaderPicture.MAX_MEGABYTES), 13, ui.muted, false), 8);
        // #212: a font file for the words alone. Messenger's own text keeps Use your own font's choice.
        ui.add(content, ui.text(text.get("home_header_font"), 14, ui.text, true), 12);
        fontStatus = ui.text("", 13, ui.muted, false);
        fontStatus.setTag("home_header_font_status");
        fontStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, fontStatus, 8);
        chooseFont = ui.button(text.get("home_header_font_choose"));
        chooseFont.setTag("home_header_font_choose");
        chooseFont.setOnClickListener(view -> pickFont());
        ui.add(content, chooseFont, 8);
        removeFont = ui.destructiveButton(text.get("home_header_font_remove"));
        removeFont.setTag("home_header_font_remove");
        removeFont.setOnClickListener(view -> removeFont());
        ui.add(content, removeFont, 8);
        ui.add(content, ui.text(text.get("home_header_font_help"), 13, ui.muted, false), 8);
        refresh();
    }

    /** Saves the words typed so far, if they changed. Leaving the field or the page saves them at once. */
    void saveWords() {
        handler.removeCallbacks(save);
        if (words == null || !typed) return;
        typed = false;
        String now = words.getText().toString();
        if (now.equals(Settings.preferences.getString(HomeHeader.TEXT, ""))) return;
        Settings.preferences.edit().putString(HomeHeader.TEXT, now).apply();
        refresh();
    }

    /** Shows the saved words again after something other than typing changed them, such as a Quick setup or its Undo. */
    void reload() {
        if (words != null) {
            String saved = Settings.preferences.getString(HomeHeader.TEXT, "");
            if (!saved.contentEquals(words.getText())) words.setText(saved);
            // Setting the field reads as typing, so drop the save that queued: the words came from the saved value.
            typed = false;
        }
        handler.removeCallbacks(save);
        refresh();
    }

    void refresh() {
        page.updateRestartRow();
        if (status == null) return;
        SettingsText text = page.text;
        boolean picture = HomeHeader.file(page).isFile(), busy = job != null;
        String words = HomeHeader.clean(Settings.preferences.getString(HomeHeader.TEXT, ""));
        String line = busy && !job.font ? text.get("home_header_copying") : picture ? text.get("home_header_picture")
            : words.isEmpty() ? text.get("home_header_none") : text.get("home_header_using_words");
        if (!line.contentEquals(status.getText())) status.setText(line);
        choose.setEnabled(!busy);
        remove.setEnabled(!busy);
        remove.setVisibility(picture ? View.VISIBLE : View.GONE);
        String name = Settings.preferences.getString(HomeHeader.FONT_NAME, "");
        boolean font = HomeHeader.fontFile(page).isFile();
        String fontLine = busy && job.font ? text.get("font_file_copying")
            : name.isEmpty() ? text.get("home_header_font_none", FontFile.MAX_MEGABYTES)
            : !font ? text.get("home_header_font_missing", name) : text.get("home_header_font_using", name);
        if (!fontLine.contentEquals(fontStatus.getText())) fontStatus.setText(fontLine);
        chooseFont.setEnabled(!busy && !removingFont);
        removeFont.setEnabled(!busy && !removingFont);
        // A copy no name points at still gets a way out.
        removeFont.setVisibility(!name.isEmpty() || font ? View.VISIBLE : View.GONE);
    }

    private void pick() {
        if (job != null) return;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        open(picker, SettingsActivity.PICK_HOME_HEADER);
    }

    /** The system picker for a .ttf or .otf, asked for the way Use your own font asks. */
    private void pickFont() {
        if (job != null || removingFont) return;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
            .putExtra(Intent.EXTRA_MIME_TYPES, FontFileRow.FONT_TYPES);
        open(picker, SettingsActivity.PICK_HOME_HEADER_FONT);
    }

    private void open(Intent picker, int request) {
        try { page.startActivityForResult(picker, request); }
        catch (android.content.ActivityNotFoundException missing) { page.feedback(page.text.get("font_file_no_picker"), Toast.LENGTH_LONG); }
        catch (RuntimeException error) { page.feedback(page.text.get("font_file_picker_failed"), Toast.LENGTH_LONG); }
    }

    /** The picker's answer. Cancelled says nothing; only a provider's grant is read, never a path with Messenger's own access. */
    void pictureResult(int result, Intent data) {
        copyResult(result, data, false);
    }

    /** The font picker's answer, read the same way as a picture's. */
    void fontResult(int result, Intent data) {
        copyResult(result, data, true);
    }

    private void copyResult(int result, Intent data, boolean font) {
        if (result != android.app.Activity.RESULT_OK || data == null || data.getData() == null) return;
        if (!"content".equals(data.getData().getScheme())) {
            page.feedback(page.text.get(font ? "font_file_unreadable" : "home_header_unreadable"), Toast.LENGTH_LONG);
            return;
        }
        if (job != null) {
            page.feedback(page.text.get("home_header_busy"), Toast.LENGTH_LONG);
            return;
        }
        Job started = new Job(page.getApplicationContext(), data.getData(), page.text, font);
        job = started;
        refresh();
        started.handler.postDelayed(started.deadline, Math.max(1, copyTimeoutMillis));
        try {
            started.worker.start();
        } catch (RuntimeException | OutOfMemoryError error) {
            android.util.Log.w("HushMessenger", "Can't start the header copy: " + error.getClass().getSimpleName());
            started.handler.removeCallbacks(started.deadline);
            job = null;
            refresh();
            page.feedback(page.text.get(font ? "font_file_not_saved" : "home_header_not_saved"), Toast.LENGTH_LONG);
        }
    }

    /**
     * Back to bold sans: the name goes first, so it never points at a deleted file, then the copy. A name that won't
     * save keeps the font and its copy together. Runs on the font save thread under FontFile.LOCK, the way Use your own
     * font removes its copy, so a restore from a backup never lands between the two.
     */
    private void removeFont() {
        if (job != null || removingFont) return;
        Context app = page.getApplicationContext();
        android.content.SharedPreferences prefs = Settings.preferences;
        SettingsText text = page.text;
        android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
        removingFont = true;
        refresh();
        try {
            FontFileRow.FONT_WRITES.execute(() -> {
                boolean gone = false;
                try {
                    java.io.File copy = HomeHeader.fontFile(app);
                    synchronized (FontFile.LOCK) {
                        gone = OwnFont.save(prefs, HomeHeader.FONT_NAME, "");
                        if (gone && copy.exists() && !copy.delete())
                            android.util.Log.i("HushMessenger", "The home header font copy couldn't be removed");
                    }
                } catch (RuntimeException failure) {
                    android.util.Log.w("HushMessenger", "Can't remove the home header font: " + failure.getClass().getSimpleName());
                }
                boolean removed = gone;
                main.post(() -> {
                    removingFont = false;
                    if (removed) HomeHeader.forget();
                    say(app, text.get(removed ? "home_header_font_removed" : "home_header_font_remove_failed"));
                });
            });
        } catch (java.util.concurrent.RejectedExecutionException refused) {
            removingFont = false;
            refresh();
            page.feedback(text.get("home_header_font_remove_failed"), Toast.LENGTH_LONG);
        }
    }

    private void removePicture() {
        if (job != null) return;
        java.io.File file = HomeHeader.file(page);
        // A few hundred KB at most, held only while Undo shows.
        byte[] kept = HomeHeaderPicture.keep(file);
        boolean gone = HomeHeaderPicture.remove(file);
        refresh();
        page.feedback(page.text.get(gone ? "home_header_removed" : "home_header_remove_failed"), Toast.LENGTH_SHORT);
        if (gone && kept != null) page.offerUndo(page.text.format("home_header_remove"), () -> putBack(kept));
    }

    /** Undo for Remove the picture. A picture picked since then stays, since Undo shouldn't take that one away. */
    private void putBack(byte[] kept) {
        java.io.File file = HomeHeader.file(page);
        if (job != null || file.isFile()) return;
        boolean back = HomeHeaderPicture.restore(kept, file);
        refresh();
        if (!back) page.feedback(page.text.get("home_header_not_saved"), Toast.LENGTH_LONG);
    }

    /** What a refused pick says. */
    static String refusal(SettingsText text, HomeHeaderPicture.Refusal reason) {
        switch (reason) {
            case NOT_A_PICTURE: return text.get("home_header_not_picture");
            case TOO_LARGE: return text.get("home_header_too_large", HomeHeaderPicture.MAX_MEGABYTES);
            case UNREADABLE: return text.get("home_header_unreadable");
            default: return text.get("home_header_not_saved");
        }
    }

    private static HomeHeaderRow shownRow() {
        HomeHeaderRow row = shown.get();
        return row != null && row.page.isDestroyed() ? null : row;
    }

    /** On the shown page when there is one, or a toast of its own once settings have closed. */
    private static void say(Context app, String message) {
        HomeHeaderRow row = shownRow();
        if (row != null) {
            row.refresh();
            row.page.feedback(message, Toast.LENGTH_LONG);
            return;
        }
        if (SettingsActivity.toast != null) SettingsActivity.toast.cancel();
        SettingsActivity.toast = Toast.makeText(app, message, Toast.LENGTH_LONG);
        SettingsActivity.toast.show();
    }

    /** What a refused font file says. The words keep the font they had. */
    static String fontRefusal(SettingsText text, FontFile.Refusal reason) {
        switch (reason) {
            case NOT_A_FONT: return text.get("font_file_not_font");
            case TOO_LARGE: return text.get("font_file_too_large", FontFile.MAX_MEGABYTES);
            case WONT_LOAD: return text.get("font_file_wont_load");
            case NOT_SAVED: return text.get("font_file_not_saved");
            default: return text.get("font_file_unreadable");
        }
    }

    /**
     * A picked picture's or font file's copy on a thread of its own. The copy moves in only from RUNNING, and the deadline
     * ends RUNNING, so a copy that was given up on never replaces the picture or the font.
     */
    private static final class Job implements Runnable {
        static final int RUNNING = 0, SAVING = 1, GIVEN_UP = 2;
        final java.util.concurrent.atomic.AtomicInteger state = new java.util.concurrent.atomic.AtomicInteger(RUNNING);
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline = this::giveUp;
        final Context app;
        final android.net.Uri uri;
        final SettingsText words;
        /** A font file for the words, not a picture. */
        final boolean font;
        final Thread worker;

        Job(Context app, android.net.Uri uri, SettingsText words, boolean font) {
            this.app = app;
            this.uri = uri;
            this.words = words;
            this.font = font;
            worker = new Thread(this, "HushMessengerHeaderCopy");
            worker.setDaemon(true);
        }

        @Override public void run() {
            String message = words.get(font ? "font_file_not_saved" : "home_header_not_saved");
            try {
                message = font ? copyFont() : copyPicture();
            } catch (RuntimeException | OutOfMemoryError | LinkageError error) {
                android.util.Log.e("HushMessenger", "Can't copy the header " + (font ? "font" : "picture") + ": " + error.getClass().getSimpleName());
            } finally {
                boolean givenUp = state.get() == GIVEN_UP;
                String said = message;
                handler.post(() -> {
                    handler.removeCallbacks(deadline);
                    if (job == this) job = null;
                    // A copy given up on said so then, and changed nothing after.
                    if (givenUp) {
                        HomeHeaderRow row = shownRow();
                        if (row != null) row.refresh();
                    } else say(app, said);
                });
            }
        }

        private java.io.InputStream open() throws java.io.IOException {
            return app.getContentResolver().openInputStream(uri);
        }

        private String copyPicture() {
            try {
                java.io.InputStream input;
                try {
                    input = open();
                } catch (java.io.IOException | RuntimeException error) {
                    // The class only: a provider's message can carry the document's name or address.
                    throw new HomeHeaderPicture.Refused(HomeHeaderPicture.Refusal.UNREADABLE, error.getClass().getSimpleName());
                }
                HomeHeaderPicture.copy(input, HomeHeader.file(app), () -> state.compareAndSet(RUNNING, SAVING));
                return words.get("home_header_saved");
            } catch (HomeHeaderPicture.Refused refused) {
                android.util.Log.w("HushMessenger", "Header picture not taken: " + refused.reason);
                return refusal(words, refused.reason);
            }
        }

        /**
         * Use your own font's copy and checks, into the words' own file, with the name saved under FontFile.LOCK the way
         * that row saves its own. A file that isn't a font, is too large or won't load in Android is turned down.
         */
        private String copyFont() {
            android.content.SharedPreferences prefs = Settings.preferences;
            String name = FontFileRow.fontName(app, uri);
            try {
                java.io.InputStream input;
                try {
                    input = open();
                } catch (java.io.IOException | RuntimeException error) {
                    throw new FontFile.Refused(FontFile.Refusal.UNREADABLE, error.getClass().getSimpleName());
                }
                FontFile.copy(input, HomeHeader.fontFile(app), OwnFont.fileCheck, new FontFile.Choice() {
                    private boolean wrote;
                    private Object before;

                    @Override public boolean save() {
                        if (!state.compareAndSet(RUNNING, SAVING)) return false;
                        before = prefs.getAll().get(HomeHeader.FONT_NAME);
                        wrote = true;
                        return prefs.edit().putString(HomeHeader.FONT_NAME, name).commit();
                    }

                    @Override public void undo() {
                        if (wrote) OwnFont.restore(prefs, HomeHeader.FONT_NAME, before);
                    }
                });
                HomeHeader.forget();
                return words.get("home_header_font_saved");
            } catch (FontFile.Refused refused) {
                android.util.Log.w("HushMessenger", "Header font not taken: " + refused.reason);
                return fontRefusal(words, refused.reason);
            }
        }

        /** The deadline, on the main thread. A copy already moving in finishes and says how it went. */
        void giveUp() {
            if (!state.compareAndSet(RUNNING, GIVEN_UP)) return;
            if (job == this) job = null;
            worker.interrupt();
            say(app, words.get(font ? "font_file_timeout" : "home_header_timeout"));
        }
    }
}
