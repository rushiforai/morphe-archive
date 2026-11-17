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
 * The rows under Your own tab icons (#186): one line per tab in the bar at the bottom, with Choose and Remove for a
 * picture of your own. A tab without one draws the plain outlined icon. A copy outlives the page that started it, so
 * its state is process-wide and it comes back to whichever page shows the rows then. One per settings page.
 */
final class TabIconsRow {
    /** A picker's provider can stall, so a copy that hasn't finished by then is given up and Choose works again. */
    static int copyTimeoutMillis = 60_000;
    /** The picture copy running now, if any. Main thread only. */
    private static Job job;
    /** The tab Choose was tapped for, kept until the picker answers, since the answer carries only the file. */
    private static String picking;
    private static java.lang.ref.WeakReference<TabIconsRow> shown = new java.lang.ref.WeakReference<>(null);
    private final SettingsActivity page;
    private LinearLayout list;

    TabIconsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        shown = new java.lang.ref.WeakReference<>(this);
        list = page.ui.column();
        list.setTag("tab_icons_list");
        page.ui.add(content, list, 0);
        page.ui.add(content, page.ui.text(page.text.get("tab_icons_help", HomeHeaderPicture.MAX_MEGABYTES), 13, page.ui.muted, false), 8);
        fill(null);
    }

    /** Filled again from the saved pictures. Focus goes back to the button that was used, if any, for TalkBack. */
    void fill(String focusTag) {
        page.updateRestartRow();
        if (list == null) return;
        list.removeAllViews();
        for (String key : TabIcons.SHOWN) addRow(key);
        if (focusTag == null) return;
        View used = list.findViewWithTag(focusTag);
        if (used != null && used.isEnabled() && used.getVisibility() == View.VISIBLE)
            used.post(() -> used.performAccessibilityAction(AccessibilityNodeInfo.ACTION_ACCESSIBILITY_FOCUS, null));
    }

    private void addRow(String key) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String label = text.get("tab_icons_tab_" + key);
        boolean picture = TabIcons.file(page, key).isFile();
        boolean busy = job != null;
        LinearLayout row = ui.row();
        row.setTag("tab_icons_row_" + key);
        if (ui.largeText) row.setOrientation(LinearLayout.VERTICAL);
        String state = busy && key.equals(job.key) ? text.get("tab_icons_copying")
            : text.get(picture ? "tab_icons_yours" : "tab_icons_plain");
        TextView title = ui.text(label + " · " + state, 15, ui.text, false);
        row.addView(title, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        Button choose = ui.button(text.get("tab_icons_choose"));
        choose.setTag("tab_icons_choose_" + key);
        choose.setContentDescription(text.get("tab_icons_choose") + ", " + label);
        choose.setEnabled(!busy);
        choose.setOnClickListener(view -> pick(key));
        row.addView(choose, new LinearLayout.LayoutParams(-2, -2));
        if (picture) {
            Button remove = ui.destructiveButton(text.get("tab_icons_remove"));
            remove.setTag("tab_icons_remove_" + key);
            remove.setContentDescription(text.get("tab_icons_remove") + ", " + label);
            remove.setEnabled(!busy);
            remove.setOnClickListener(view -> removePicture(key));
            row.addView(remove, new LinearLayout.LayoutParams(-2, -2));
        }
        ui.add(list, row, 8);
    }

    private void pick(String key) {
        if (job != null) return;
        picking = key;
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        try { page.startActivityForResult(picker, SettingsActivity.PICK_TAB_ICON); }
        catch (android.content.ActivityNotFoundException missing) { page.feedback(page.text.get("font_file_no_picker"), Toast.LENGTH_LONG); }
        catch (RuntimeException error) { page.feedback(page.text.get("font_file_picker_failed"), Toast.LENGTH_LONG); }
    }

    /** The picker's answer. Cancelled says nothing; only a provider's grant is read, never a path with Messenger's own access. */
    void pictureResult(int result, Intent data) {
        String key = picking;
        picking = null;
        if (result != android.app.Activity.RESULT_OK || data == null || data.getData() == null || key == null) return;
        if (!"content".equals(data.getData().getScheme())) {
            page.feedback(page.text.get("tab_icons_unreadable"), Toast.LENGTH_LONG);
            return;
        }
        if (job != null) {
            page.feedback(page.text.get("tab_icons_busy"), Toast.LENGTH_LONG);
            return;
        }
        Job started = new Job(page.getApplicationContext(), data.getData(), page.text, key);
        job = started;
        fill(null);
        started.handler.postDelayed(started.deadline, Math.max(1, copyTimeoutMillis));
        try {
            started.worker.start();
        } catch (RuntimeException | OutOfMemoryError error) {
            android.util.Log.w("HushMessenger", "Can't start the tab icon copy: " + error.getClass().getSimpleName());
            started.handler.removeCallbacks(started.deadline);
            job = null;
            fill(null);
            page.feedback(page.text.get("tab_icons_not_saved"), Toast.LENGTH_LONG);
        }
    }

    private void removePicture(String key) {
        if (job != null) return;
        File file = TabIcons.file(page, key);
        // A few tens of KB at most, held only while Undo shows.
        byte[] kept = HomeHeaderPicture.keep(file);
        boolean gone = HomeHeaderPicture.remove(file, TabIcons::forget);
        fill("tab_icons_choose_" + key);
        page.feedback(page.text.get(gone ? "tab_icons_removed" : "tab_icons_remove_failed"), Toast.LENGTH_SHORT);
        if (gone && kept != null) page.offerUndo(page.text.format("tab_icons_remove"), () -> putBack(key, kept));
    }

    /** Undo for Remove. A picture picked since then stays, since Undo shouldn't take that one away. */
    private void putBack(String key, byte[] kept) {
        File file = TabIcons.file(page, key);
        if (job != null || file.isFile()) return;
        boolean back = HomeHeaderPicture.restore(kept, file, TabIcons::forget);
        fill(null);
        if (!back) page.feedback(page.text.get("tab_icons_not_saved"), Toast.LENGTH_LONG);
    }

    /** What a refused pick says. */
    static String refusal(SettingsText text, HomeHeaderPicture.Refusal reason) {
        switch (reason) {
            case NOT_A_PICTURE: return text.get("tab_icons_not_picture");
            case TOO_LARGE: return text.get("tab_icons_too_large", HomeHeaderPicture.MAX_MEGABYTES);
            case UNREADABLE: return text.get("tab_icons_unreadable");
            default: return text.get("tab_icons_not_saved");
        }
    }

    private static TabIconsRow shownRow() {
        TabIconsRow row = shown.get();
        return row != null && row.page.isDestroyed() ? null : row;
    }

    /** On the shown page when there is one, or a toast of its own once settings have closed. */
    private static void say(Context app, String message) {
        TabIconsRow row = shownRow();
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
     * A picked picture's copy on a thread of its own. The copy moves in only from RUNNING, and the deadline ends RUNNING,
     * so a copy that was given up on never replaces the tab's icon.
     */
    private static final class Job implements Runnable {
        static final int RUNNING = 0, SAVING = 1, GIVEN_UP = 2;
        final java.util.concurrent.atomic.AtomicInteger state = new java.util.concurrent.atomic.AtomicInteger(RUNNING);
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline = this::giveUp;
        final Context app;
        final android.net.Uri uri;
        final SettingsText words;
        final String key;
        final Thread worker;

        Job(Context app, android.net.Uri uri, SettingsText words, String key) {
            this.app = app;
            this.uri = uri;
            this.words = words;
            this.key = key;
            worker = new Thread(this, "HushMessengerTabIconCopy");
            worker.setDaemon(true);
        }

        @Override public void run() {
            String message = words.get("tab_icons_not_saved");
            try {
                java.io.InputStream input;
                try {
                    input = app.getContentResolver().openInputStream(uri);
                } catch (java.io.IOException | RuntimeException error) {
                    // The class only: a provider's message can carry the document's name or address.
                    throw new HomeHeaderPicture.Refused(HomeHeaderPicture.Refusal.UNREADABLE, error.getClass().getSimpleName());
                }
                HomeHeaderPicture.copy(input, TabIcons.file(app, key), () -> state.compareAndSet(RUNNING, SAVING),
                    TabIcons.MAX_SIDE, TabIcons.MAX_SIDE, TabIcons::forget);
                message = words.get("tab_icons_saved");
            } catch (HomeHeaderPicture.Refused refused) {
                android.util.Log.w("HushMessenger", "Tab icon not taken: " + refused.reason);
                message = refusal(words, refused.reason);
            } catch (RuntimeException | OutOfMemoryError | LinkageError error) {
                android.util.Log.e("HushMessenger", "Can't copy the tab icon: " + error.getClass().getSimpleName());
            } finally {
                boolean givenUp = state.get() == GIVEN_UP;
                String said = message;
                handler.post(() -> {
                    handler.removeCallbacks(deadline);
                    if (job == this) job = null;
                    // A copy given up on said so then, and changed nothing after.
                    if (givenUp) {
                        TabIconsRow row = shownRow();
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
            say(app, words.get("tab_icons_timeout"));
        }
    }
}
