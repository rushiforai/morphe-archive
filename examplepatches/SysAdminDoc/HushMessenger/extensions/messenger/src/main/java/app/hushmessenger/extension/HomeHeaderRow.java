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
 * The rows under Your own home header: the words, the picture's status, and Choose and Remove for the picture. A copy
 * outlives the page that started it, so its state is process-wide and it comes back to whichever page shows the rows
 * then. One per settings page.
 */
final class HomeHeaderRow {
    /** A picker's provider can stall, so a copy that hasn't finished by then is given up and Choose works again. */
    static int copyTimeoutMillis = 60_000;
    /** The picture copy running now, if any. Main thread only. */
    private static Job job;
    private static java.lang.ref.WeakReference<HomeHeaderRow> shown = new java.lang.ref.WeakReference<>(null);
    private final SettingsActivity page;
    private TextView status;
    private Button choose, remove;

    HomeHeaderRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        shown = new java.lang.ref.WeakReference<>(this);
        EditText words = ui.field(text.get("home_header_words_hint", HomeHeader.MAX_LENGTH), HomeHeader.MAX_LENGTH, true);
        words.setTag("home_header_text");
        words.setText(Settings.preferences.getString(HomeHeader.TEXT, ""));
        TextView label = ui.text(text.get("home_header_words"), 14, ui.text, true);
        label.setLabelFor(words.getId());
        ui.add(content, label, 12);
        ui.add(content, words, 8);
        words.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence typed, int start, int count, int after) { }

            @Override public void onTextChanged(CharSequence typed, int start, int before, int count) { }

            @Override public void afterTextChanged(android.text.Editable typed) {
                Settings.preferences.edit().putString(HomeHeader.TEXT, typed.toString()).apply();
                refresh();
            }
        });
        status = ui.text("", 13, ui.muted, false);
        status.setTag("home_header_status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        ui.add(content, status, 12);
        choose = ui.button(text.get("home_header_choose"));
        choose.setTag("home_header_choose");
        choose.setOnClickListener(view -> pick());
        ui.add(content, choose, 8);
        remove = ui.button(text.get("home_header_remove"));
        remove.setTag("home_header_remove");
        remove.setOnClickListener(view -> removePicture());
        ui.add(content, remove, 8);
        ui.add(content, ui.text(text.get("home_header_help", HomeHeaderPicture.MAX_MEGABYTES), 13, ui.muted, false), 8);
        refresh();
    }

    void refresh() {
        page.updateRestartRow();
        if (status == null) return;
        SettingsText text = page.text;
        boolean picture = HomeHeader.file(page).isFile(), busy = job != null;
        String words = HomeHeader.clean(Settings.preferences.getString(HomeHeader.TEXT, ""));
        String line = busy ? text.get("home_header_copying") : picture ? text.get("home_header_picture")
            : words.isEmpty() ? text.get("home_header_none") : text.get("home_header_using_words");
        if (!line.contentEquals(status.getText())) status.setText(line);
        choose.setEnabled(!busy);
        remove.setEnabled(!busy);
        remove.setVisibility(picture ? View.VISIBLE : View.GONE);
    }

    private void pick() {
        if (job != null) return;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        try { page.startActivityForResult(picker, SettingsActivity.PICK_HOME_HEADER); }
        catch (android.content.ActivityNotFoundException missing) { page.feedback(page.text.get("font_file_no_picker"), Toast.LENGTH_LONG); }
        catch (RuntimeException error) { page.feedback(page.text.get("font_file_picker_failed"), Toast.LENGTH_LONG); }
    }

    /** The picker's answer. Cancelled says nothing; only a provider's grant is read, never a path with Messenger's own access. */
    void pictureResult(int result, Intent data) {
        if (result != android.app.Activity.RESULT_OK || data == null || data.getData() == null) return;
        if (!"content".equals(data.getData().getScheme())) {
            page.feedback(page.text.get("home_header_unreadable"), Toast.LENGTH_LONG);
            return;
        }
        if (job != null) {
            page.feedback(page.text.get("home_header_busy"), Toast.LENGTH_LONG);
            return;
        }
        Job started = new Job(page.getApplicationContext(), data.getData(), page.text);
        job = started;
        refresh();
        started.handler.postDelayed(started.deadline, Math.max(1, copyTimeoutMillis));
        try {
            started.worker.start();
        } catch (RuntimeException | OutOfMemoryError error) {
            android.util.Log.w("HushMessenger", "Can't start the header picture copy: " + error.getClass().getSimpleName());
            started.handler.removeCallbacks(started.deadline);
            job = null;
            refresh();
            page.feedback(page.text.get("home_header_not_saved"), Toast.LENGTH_LONG);
        }
    }

    private void removePicture() {
        if (job != null) return;
        boolean gone = HomeHeaderPicture.remove(HomeHeader.file(page));
        refresh();
        page.feedback(page.text.get(gone ? "home_header_removed" : "home_header_remove_failed"), Toast.LENGTH_SHORT);
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

    /**
     * A picked picture's copy on a thread of its own. The copy moves in only from RUNNING, and the deadline ends RUNNING,
     * so a copy that was given up on never replaces the picture.
     */
    private static final class Job implements Runnable {
        static final int RUNNING = 0, SAVING = 1, GIVEN_UP = 2;
        final java.util.concurrent.atomic.AtomicInteger state = new java.util.concurrent.atomic.AtomicInteger(RUNNING);
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline = this::giveUp;
        final Context app;
        final android.net.Uri uri;
        final SettingsText words;
        final Thread worker;

        Job(Context app, android.net.Uri uri, SettingsText words) {
            this.app = app;
            this.uri = uri;
            this.words = words;
            worker = new Thread(this, "HushMessengerHeaderCopy");
            worker.setDaemon(true);
        }

        @Override public void run() {
            String message = words.get("home_header_not_saved");
            try {
                java.io.InputStream input;
                try {
                    input = app.getContentResolver().openInputStream(uri);
                } catch (java.io.IOException | RuntimeException error) {
                    // The class only: a provider's message can carry the document's name or address.
                    throw new HomeHeaderPicture.Refused(HomeHeaderPicture.Refusal.UNREADABLE, error.getClass().getSimpleName());
                }
                HomeHeaderPicture.copy(input, HomeHeader.file(app), () -> state.compareAndSet(RUNNING, SAVING));
                message = words.get("home_header_saved");
            } catch (HomeHeaderPicture.Refused refused) {
                android.util.Log.w("HushMessenger", "Header picture not taken: " + refused.reason);
                message = refusal(words, refused.reason);
            } catch (RuntimeException | OutOfMemoryError | LinkageError error) {
                android.util.Log.e("HushMessenger", "Can't copy the header picture: " + error.getClass().getSimpleName());
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

        /** The deadline, on the main thread. A copy already moving in finishes and says how it went. */
        void giveUp() {
            if (!state.compareAndSet(RUNNING, GIVEN_UP)) return;
            if (job == this) job = null;
            worker.interrupt();
            say(app, words.get("home_header_timeout"));
        }
    }
}
