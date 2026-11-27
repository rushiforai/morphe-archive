package app.hushmessenger.extension;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;

/**
 * The rows under Your own chat sounds (#224): one line per sound, with Choose and Remove for a file of your own. A sound
 * without one plays Messenger's. A copy outlives the page that started it, so its state is process-wide and it comes
 * back to whichever page shows the rows then. One per settings page. A picked sound plays from the next message on, with
 * no restart, since Messenger opens the sound each time it plays it.
 */
final class OwnChatSoundsRow {
    /** The types the picker offers. Some providers call an .ogg file application/ogg. */
    static final String[] SOUND_TYPES = {"audio/*", "application/ogg"};
    /** A picker's provider can stall, so a copy that hasn't finished by then is given up and Choose works again. */
    static int copyTimeoutMillis = 60_000;
    /** The sound copy running now, if any. Main thread only. */
    private static Job job;
    /** The sound Choose was tapped for, kept until the picker answers, since the answer carries only the file. */
    private static String picking;
    private static java.lang.ref.WeakReference<OwnChatSoundsRow> shown = new java.lang.ref.WeakReference<>(null);
    private final SettingsActivity page;
    private LinearLayout list;

    OwnChatSoundsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        shown = new java.lang.ref.WeakReference<>(this);
        list = page.ui.column();
        list.setTag("own_chat_sounds_list");
        page.ui.add(content, list, 0);
        page.ui.add(content, page.ui.text(page.text.get("own_chat_sounds_help", OwnChatSounds.MAX_MEGABYTES), 13, page.ui.muted, false), 8);
        fill(null);
    }

    /** Filled again from the saved sounds. Focus goes back to the button that was used, if any, for TalkBack. */
    void fill(String focusTag) {
        if (list == null) return;
        list.removeAllViews();
        for (String sound : OwnChatSounds.SOUNDS) addRow(sound);
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled() && used.getVisibility() == View.VISIBLE)
            used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addRow(String sound) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String label = text.get("own_chat_sounds_sound_" + sound);
        boolean own = OwnChatSounds.file(page, sound).isFile();
        boolean busy = job != null;
        LinearLayout row = ui.row();
        row.setTag("own_chat_sounds_row_" + sound);
        if (ui.largeText) row.setOrientation(LinearLayout.VERTICAL);
        String state = busy && sound.equals(job.sound) ? text.get("own_chat_sounds_copying")
            : text.get(own ? "own_chat_sounds_yours" : "own_chat_sounds_stock");
        TextView title = ui.text(label + " · " + state, 15, ui.text, false);
        row.addView(title, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button choose = ui.button(text.get("own_chat_sounds_choose"));
        choose.setTag("own_chat_sounds_choose_" + sound);
        choose.setContentDescription(text.get("own_chat_sounds_choose") + ", " + label);
        choose.setEnabled(!busy);
        choose.setOnClickListener(view -> pick(sound));
        row.addView(choose, new LinearLayout.LayoutParams(-2, -2));
        if (own) {
            Button remove = ui.destructiveButton(text.get("own_chat_sounds_remove"));
            remove.setTag("own_chat_sounds_remove_" + sound);
            remove.setContentDescription(text.get("own_chat_sounds_remove") + ", " + label);
            remove.setEnabled(!busy);
            remove.setOnClickListener(view -> removeSound(sound));
            row.addView(remove, new LinearLayout.LayoutParams(-2, -2));
        }
        ui.add(list, row, 8);
    }

    private void pick(String sound) {
        if (job != null) return;
        picking = sound;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
            .putExtra(Intent.EXTRA_MIME_TYPES, SOUND_TYPES);
        try { page.startActivityForResult(picker, SettingsActivity.PICK_CHAT_SOUND); }
        catch (android.content.ActivityNotFoundException missing) { page.feedback(page.text.get("font_file_no_picker"), Toast.LENGTH_LONG); }
        catch (RuntimeException error) { page.feedback(page.text.get("font_file_picker_failed"), Toast.LENGTH_LONG); }
    }

    /** The picker's answer. Cancelled says nothing; only a provider's grant is read, never a path with Messenger's own access. */
    void soundResult(int result, Intent data) {
        String sound = picking;
        picking = null;
        if (result != android.app.Activity.RESULT_OK || data == null || data.getData() == null || sound == null) return;
        if (!"content".equals(data.getData().getScheme())) {
            page.feedback(page.text.get("own_chat_sounds_unreadable"), Toast.LENGTH_LONG);
            return;
        }
        if (job != null) {
            page.feedback(page.text.get("own_chat_sounds_busy"), Toast.LENGTH_LONG);
            return;
        }
        Job started = new Job(page.getApplicationContext(), data.getData(), page.text, sound);
        job = started;
        fill(null);
        started.handler.postDelayed(started.deadline, Math.max(1, copyTimeoutMillis));
        try {
            started.worker.start();
        } catch (RuntimeException | OutOfMemoryError error) {
            android.util.Log.w("HushMessenger", "Can't start the chat sound copy: " + error.getClass().getSimpleName());
            started.handler.removeCallbacks(started.deadline);
            job = null;
            fill(null);
            page.feedback(page.text.get("own_chat_sounds_not_saved"), Toast.LENGTH_LONG);
        }
    }

    private void removeSound(String sound) {
        if (job != null) return;
        File file = OwnChatSounds.file(page, sound);
        // A megabyte at most, held only while Undo shows.
        byte[] kept = HomeHeaderPicture.keep(file);
        boolean gone = HomeHeaderPicture.remove(file, () -> { });
        fill("own_chat_sounds_choose_" + sound);
        page.feedback(page.text.get(gone ? "own_chat_sounds_removed" : "own_chat_sounds_remove_failed"), Toast.LENGTH_SHORT);
        if (gone && kept != null) page.offerUndo(page.text.format("own_chat_sounds_remove"), () -> putBack(sound, kept));
    }

    /** Undo for Remove. A sound picked since then stays, since Undo shouldn't take that one away. */
    private void putBack(String sound, byte[] kept) {
        File file = OwnChatSounds.file(page, sound);
        if (job != null || file.isFile()) return;
        boolean back = HomeHeaderPicture.restore(kept, file, () -> { });
        fill(null);
        if (!back) page.feedback(page.text.get("own_chat_sounds_not_saved"), Toast.LENGTH_LONG);
    }

    /** What a refused pick says. */
    static String refusal(SettingsText text, OwnChatSounds.Refusal reason) {
        switch (reason) {
            case NOT_A_SOUND: return text.get("own_chat_sounds_not_sound");
            case TOO_LARGE: return text.get("own_chat_sounds_too_large", OwnChatSounds.MAX_MEGABYTES);
            case UNREADABLE: return text.get("own_chat_sounds_unreadable");
            default: return text.get("own_chat_sounds_not_saved");
        }
    }

    private static OwnChatSoundsRow shownRow() {
        OwnChatSoundsRow row = shown.get();
        return row != null && row.page.isDestroyed() ? null : row;
    }

    /** On the shown page when there is one, or a toast of its own once settings have closed. */
    private static void say(Context app, String message) {
        OwnChatSoundsRow row = shownRow();
        if (row != null) {
            row.fill(null);
            row.page.feedback(message, Toast.LENGTH_LONG);
            return;
        }
        if (SettingsActivity.toast != null) SettingsActivity.toast.cancel();
        SettingsActivity.toast = Toast.makeText(app, message, Toast.LENGTH_LONG);
        SettingsActivity.toast.show();
    }

    /**
     * A picked sound's copy on a thread of its own. The copy moves in only from RUNNING, and the deadline ends RUNNING,
     * so a copy that was given up on never replaces the sound.
     */
    private static final class Job implements Runnable {
        static final int RUNNING = 0, SAVING = 1, GIVEN_UP = 2;
        final java.util.concurrent.atomic.AtomicInteger state = new java.util.concurrent.atomic.AtomicInteger(RUNNING);
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline = this::giveUp;
        final Context app;
        final android.net.Uri uri;
        final SettingsText words;
        final String sound;
        final Thread worker;

        Job(Context app, android.net.Uri uri, SettingsText words, String sound) {
            this.app = app;
            this.uri = uri;
            this.words = words;
            this.sound = sound;
            worker = new Thread(this, "HushMessengerChatSoundCopy");
            worker.setDaemon(true);
        }

        @Override public void run() {
            String message = words.get("own_chat_sounds_not_saved");
            try {
                java.io.InputStream input;
                try {
                    input = app.getContentResolver().openInputStream(uri);
                } catch (java.io.IOException | RuntimeException error) {
                    // The class only: a provider's message can carry the document's name or address.
                    throw new OwnChatSounds.Refused(OwnChatSounds.Refusal.UNREADABLE, error.getClass().getSimpleName());
                }
                OwnChatSounds.copy(input, OwnChatSounds.file(app, sound), () -> state.compareAndSet(RUNNING, SAVING));
                message = words.get("own_chat_sounds_saved");
            } catch (OwnChatSounds.Refused refused) {
                android.util.Log.w("HushMessenger", "Chat sound not taken: " + refused.reason);
                message = refusal(words, refused.reason);
            } catch (RuntimeException | OutOfMemoryError | LinkageError error) {
                android.util.Log.e("HushMessenger", "Can't copy the chat sound: " + error.getClass().getSimpleName());
            } finally {
                boolean givenUp = state.get() == GIVEN_UP;
                String said = message;
                handler.post(() -> {
                    handler.removeCallbacks(deadline);
                    if (job == this) job = null;
                    // A copy given up on said so then, and changed nothing after.
                    if (givenUp) {
                        OwnChatSoundsRow row = shownRow();
                        if (row != null) row.fill(null);
                    } else say(app, said);
                });
            }
        }

        /** The deadline, on the main thread. A copy already moving in finishes and says how it went. */
        void giveUp() {
            if (!state.compareAndSet(RUNNING, GIVEN_UP)) return;
            if (job == this) job = null;
            worker.interrupt();
            say(app, words.get("own_chat_sounds_timeout"));
        }
    }
}
