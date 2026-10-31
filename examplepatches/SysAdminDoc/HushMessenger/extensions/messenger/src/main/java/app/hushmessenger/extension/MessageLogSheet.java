package app.hushmessenger.extension;

import android.app.Dialog;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.List;

/**
 * The message log's buttons under its switch, the sheet that shows the log, and Clear with its Undo. One per settings page.
 * A Clear still running when the page is recreated is handed to the new page's sheet.
 */
final class MessageLogSheet {
    /** Cards built at a time. A full log is 500 of them, and building them all at once froze the screen for two seconds. */
    static final int MESSAGE_LOG_PAGE = 20;
    /** Clears and their Undos run one at a time in the order they were tapped, so a Clear right after Undo stays cleared. */
    private static final java.util.concurrent.ExecutorService MESSAGE_LOG_WORK = java.util.concurrent.Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMessageLogWork");
        thread.setDaemon(true);
        return thread;
    });

    private final SettingsActivity page;
    private Dialog messageLogDialog;
    private LinearLayout messageLogList;
    private ScrollView messageLogScroll;
    /** Builds the log's next page of cards, while one is left. */
    private Runnable messageLogMore;
    private Button messageLogClear;
    private long messageLogGeneration;
    private boolean messageLogClearFailed;
    /** Opening the log is what put FLAG_SECURE on this screen's window, so closing it takes back only that. */
    private boolean messageLogSecured;
    private MessageLogClearJob messageLogClearJob;
    /** While Undo can still put back the log a Clear took, the log's empty page shows an Undo too. */
    private boolean messageLogUndo;
    /** The open log shows only the messages their senders unsent. */
    private boolean messageLogUnsentOnly;

    MessageLogSheet(SettingsActivity page) {
        this.page = page;
    }

    void restoreState(Bundle state) {
        messageLogClearFailed = state.getBoolean("message_log_clear_failed");
    }

    void saveState(Bundle state) {
        state.putBoolean("message_log_open", messageLogDialog != null && messageLogDialog.isShowing());
        state.putBoolean("message_log_clear_failed", messageLogClearFailed);
    }

    /** Takes over a Clear the page before this one started, and reports it if it finished in between. */
    void adopt(Object retained, View root) {
        if (!(retained instanceof MessageLogClearJob)) return;
        messageLogClearJob = (MessageLogClearJob) retained;
        messageLogClearJob.owner = new java.lang.ref.WeakReference<>(this);
        if (messageLogClearJob.finished) {
            messageLogClearFailed = !messageLogClearJob.cleared;
            root.post(() -> messageLogCleared(messageLogClearJob));
        }
    }

    /** What the page keeps across a rotation: only a Clear, never a screen or chat text. */
    Object retained() { return messageLogClearJob; }

    /** Leaving settings makes a Clear final, one still running included. */
    void stop() {
        if (messageLogClearJob != null) messageLogClearJob.undoable = false;
    }

    void destroy() {
        if (messageLogDialog != null) messageLogDialog.dismiss();
        if (messageLogClearJob != null && messageLogClearJob.owner.get() == this) messageLogClearJob.owner.clear();
    }

    /** Undo was tapped. The log's page shows what the undo brings back once it's written, not an empty page in between. */
    void undoTaken() {
        messageLogUndo = false;
        View sheetUndo = messageLogList == null ? null : messageLogList.findViewWithTag("message_log_undo");
        if (sheetUndo != null) sheetUndo.setEnabled(false);
    }

    /** Undo is gone, so the log's empty page drops its Undo too. */
    void undoEnded() {
        if (messageLogUndo) {
            messageLogUndo = false;
            if (messageLogList != null) loadMessageLog();
        }
    }

    /** Two actions under the message-log switch: open the log or wipe it, no confirmation, just a toast. */
    void addMessageLogActions(LinearLayout content) {
        LinearLayout actions = page.ui.row();
        Button view = page.ui.button(page.text.get("message_log_view"));
        view.setTag("message_log_view");
        view.setOnClickListener(clicked -> showMessageLog());
        actions.addView(view);
        Button clear = page.ui.button(page.text.get("message_log_clear"));
        clear.setTag("message_log_clear");
        clear.setOnClickListener(clicked -> clearMessageLog());
        LinearLayout.LayoutParams clearParams = new LinearLayout.LayoutParams(-2, -2);
        clearParams.setMarginStart(page.ui.dp(8));
        actions.addView(clear, clearParams);
        page.ui.add(content, actions, 8);
    }

    void showMessageLog() {
        if (page.isFinishing() || page.isDestroyed() || messageLogDialog != null) return;
        SettingsDialog sheet = new SettingsDialog(page, page.ui, page.text, page.text.get("message_log_title"), page.text.get("message_log_hint"));
        Dialog dialog = sheet.dialog;
        messageLogDialog = dialog;
        hideFromRecents(dialog);
        dialog.setOnDismissListener(dismissed -> {
            showInRecents();
            if (messageLogDialog == dismissed) {
                messageLogDialog = null;
                messageLogList = null;
                messageLogScroll = null;
                messageLogMore = null;
                messageLogClear = null;
                messageLogUnsentOnly = false;
                messageLogGeneration++;
            }
        });
        messageLogList = sheet.body;
        messageLogScroll = sheet.scroll;
        // Scrolling near the end builds the next page, and so does a layout that leaves the end in view.
        sheet.scroll.setOnScrollChangeListener((view, x, y, oldX, oldY) -> moreMessageLogIfNear());
        sheet.scroll.getViewTreeObserver().addOnGlobalLayoutListener(this::moreMessageLogIfNear);
        messageLogClear = page.ui.button(page.text.get("message_log_clear"));
        messageLogClear.setTag("message_log_dialog_clear");
        messageLogClear.setOnClickListener(clicked -> clearMessageLog());
        sheet.action(messageLogClear);
        Button close = page.ui.primaryButton(page.text.get("message_log_close"));
        close.setTag("message_log_dialog_close");
        close.setOnClickListener(clicked -> dialog.dismiss());
        sheet.action(close);
        sheet.show();
        loadMessageLog();
    }

    /**
     * The log holds chat text, so the Recents thumbnail leaves it out while it's open. Android 13 and newer can do that on
     * its own, and screenshots still work. Before that the only way is FLAG_SECURE, on this screen's window and on the
     * log's own, which blocks screenshots of the log too. Both are set before any message is loaded.
     */
    private void hideFromRecents(Dialog dialog) {
        if (Build.VERSION.SDK_INT >= 33) {
            page.setRecentsScreenshotEnabled(false);
            return;
        }
        android.view.Window window = page.getWindow();
        messageLogSecured = (window.getAttributes().flags & WindowManager.LayoutParams.FLAG_SECURE) == 0;
        if (messageLogSecured) window.addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        if (dialog.getWindow() != null) dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }

    private void showInRecents() {
        if (Build.VERSION.SDK_INT >= 33) {
            page.setRecentsScreenshotEnabled(true);
            return;
        }
        if (!messageLogSecured) return;
        messageLogSecured = false;
        page.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_SECURE);
    }

    private void loadMessageLog() {
        final LinearLayout list = messageLogList;
        if (list == null) return;
        final long generation = ++messageLogGeneration;
        messageLogMore = null;
        list.removeAllViews();
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        TextView loading = ui.text(text.get("message_log_loading"), 14, ui.muted, false);
        loading.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        list.addView(loading);
        if (messageLogClear != null) messageLogClear.setEnabled(false);
        if (messageLogClearJob != null && !messageLogClearJob.finished) return;
        new Thread(() -> {
            final MessageLog.LoadResult result = MessageLog.loadResult();
            page.runOnUiThread(() -> {
                if (messageLogList != list || generation != messageLogGeneration) return;
                list.removeAllViews();
                if (messageLogClear != null) messageLogClear.setEnabled(result.failed || result.setAside || messageLogClearFailed || !result.entries.isEmpty());
                if (result.failed || messageLogClearFailed) {
                    LinearLayout failure = ui.panel();
                    failure.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                    failure.addView(ui.text(text.get(messageLogClearFailed ? "message_log_clear_failed" : "message_log_load_failed"), 18, ui.error, true));
                    ui.add(failure, ui.text(text.get(messageLogClearFailed ? "message_log_clear_help" : "message_log_load_help"), 14, ui.muted, false), 8);
                    Button retry = ui.button(text.get(messageLogClearFailed ? "message_log_clear" : "retry"));
                    retry.setTag("message_log_retry");
                    retry.setOnClickListener(view -> { if (messageLogClearFailed) clearMessageLog(); else loadMessageLog(); });
                    ui.add(failure, retry, 16);
                    ui.add(list, failure, 0);
                } else {
                    // The log works; only an older file it couldn't read was moved aside. Say so without calling it a failure.
                    if (result.setAside) {
                        LinearLayout notice = ui.panel();
                        notice.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                        notice.addView(ui.title(text.get("message_log_set_aside"), 18));
                        ui.add(notice, ui.text(text.get("message_log_set_aside_help"), 14, ui.muted, false), 8);
                        Button remove = ui.button(text.get("message_log_set_aside_remove"));
                        remove.setTag("message_log_set_aside_remove");
                        remove.setOnClickListener(view -> { view.setEnabled(false); removeSetAsideLog(); });
                        ui.add(notice, remove, 16);
                        ui.add(list, notice, 0);
                    }
                    if (result.entries.isEmpty()) {
                        LinearLayout empty = ui.panel();
                        empty.setPadding(ui.dp(20), ui.dp(20), ui.dp(20), ui.dp(20));
                        empty.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                        View accent = new View(page);
                        accent.setBackground(ui.shape(ui.accent, 0, 2));
                        empty.addView(accent, new LinearLayout.LayoutParams(ui.dp(36), ui.dp(4)));
                        TextView emptyLog = ui.title(text.get("message_log_empty"), 18);
                        emptyLog.setTag("message_log_empty_title");
                        ui.add(empty, emptyLog, 16);
                        ui.add(empty, ui.text(text.get(Settings.wouldUse(MessageLog.KEY) ? "message_log_empty_on" : "message_log_empty_off"), 14, ui.muted, false), 8);
                        // The settings page's Undo sits behind this sheet.
                        if (messageLogUndo) {
                            Button undo = ui.button(text.get("undo"));
                            undo.setTag("message_log_undo");
                            undo.setOnClickListener(view -> page.undo());
                            ui.add(empty, undo, 16);
                        }
                        ui.add(list, empty, result.setAside ? 12 : 0);
                    }
                }
                if (!result.entries.isEmpty()) ui.add(list, ui.text(text.get("message_log_retention"), 13, ui.muted, false), list.getChildCount() > 0 ? 12 : 0);
                List<MessageLog.Entry> shown = result.entries;
                List<MessageLog.Entry> unsent = new java.util.ArrayList<>();
                for (MessageLog.Entry entry : result.entries) if (entry.unsent) unsent.add(entry);
                // Only a log with unsent messages in it gets the filter.
                if (!unsent.isEmpty()) {
                    Button filter = ui.button(text.get(messageLogUnsentOnly ? "message_log_show_all" : "message_log_unsent_only"));
                    filter.setTag("message_log_unsent_only");
                    filter.setOnClickListener(view -> {
                        messageLogUnsentOnly = !messageLogUnsentOnly;
                        loadMessageLog();
                    });
                    ui.add(list, filter, 12);
                    if (messageLogUnsentOnly) shown = unsent;
                }
                showMessageLogPage(list, generation, shown, 0);
            });
        }, "HushMessageLogView").start();
    }

    private void showMessageLogPage(LinearLayout list, long generation, List<MessageLog.Entry> entries, int from) {
        messageLogMore = null;
        if (messageLogList != list || generation != messageLogGeneration) return;
        int to = Math.min(entries.size(), from + MESSAGE_LOG_PAGE);
        for (int i = from; i < to; i++) list.addView(messageLogEntry(entries.get(i)));
        if (to < entries.size()) messageLogMore = () -> showMessageLogPage(list, generation, entries, to);
    }

    /**
     * Builds the next page once the log is scrolled within a screen of its end. A list still waiting for its layout is
     * measured after it, so a page that was just added can't count as the end and pull in the rest. The dismiss listener
     * runs a message after the sheet goes, so a page asked for just before then checks the sheet is still up.
     */
    private void moreMessageLogIfNear() {
        ScrollView scroll = messageLogScroll;
        Runnable more = messageLogMore;
        if (scroll == null || more == null || scroll.getChildCount() == 0) return;
        View content = scroll.getChildAt(0);
        int height = scroll.getHeight();
        if (height == 0 || content.isLayoutRequested()) return;
        if (content.getBottom() - (scroll.getScrollY() + height) < height) scroll.post(() -> { if (messageLogMore == more && scroll.isAttachedToWindow()) more.run(); });
    }

    private void removeSetAsideLog() {
        new Thread(() -> {
            final boolean removed = MessageLog.removeSetAside();
            page.runOnUiThread(() -> {
                if (page.isFinishing() || page.isDestroyed()) return;
                if (!removed) page.feedback(page.text.get("message_log_set_aside_failed"), Toast.LENGTH_LONG);
                loadMessageLog();
            });
        }, "HushMessageLogView").start();
    }

    private View messageLogEntry(MessageLog.Entry entry) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        LinearLayout card = ui.column();
        card.setBackground(ui.shape(ui.surface, ui.line, 12));
        card.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        // Messenger's chat key means nothing to a reader, so an entry without a name reads as an unknown chat.
        String who = entry.sender.isEmpty() ? (entry.chat.isEmpty() ? text.get("message_log_unknown_thread") : entry.chat)
            : entry.chat.isEmpty() ? entry.sender : text.get("message_log_in_group", entry.sender, entry.chat);
        TextView metadata = ui.text(who + "  ·  " + page.formatSince(entry.time, "message_log_now", "message_log_ago"), 12, ui.muted, true);
        metadata.setContentDescription(who + ". " + android.text.format.DateFormat.getDateFormat(page).format(new java.util.Date(entry.time)) + ", " +
            android.text.format.DateFormat.getTimeFormat(page).format(new java.util.Date(entry.time)));
        card.addView(metadata);
        if (entry.unsent) {
            TextView badge = ui.text(text.get("message_log_unsent"), 12, ui.accent, true);
            badge.setTag("message_log_unsent_badge");
            ui.add(card, badge, 4);
        }
        TextView body = ui.text(entry.text == null || entry.text.isEmpty() ? text.get("message_log_no_text") : entry.text, 15, ui.text, false);
        body.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        body.setTextIsSelectable(true);
        ui.add(card, body, 8);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(8);
        card.setLayoutParams(params);
        return card;
    }

    private void clearMessageLog() {
        if (messageLogClearJob != null && !messageLogClearJob.finished) return;
        messageLogClearJob = new MessageLogClearJob(this);
        loadMessageLog();
        messageLogClearJob.start();
    }

    private void messageLogCleared(MessageLogClearJob job) {
        if (job != messageLogClearJob || page.isFinishing() || page.isDestroyed()) return;
        messageLogClearFailed = !job.cleared;
        if (!job.notified) {
            job.notified = true;
            page.feedback(page.text.get(job.cleared ? "message_log_cleared" : "message_log_clear_failed"), Toast.LENGTH_LONG);
            // Undo gets the only copy of what went, and nothing is offered after a failed or empty clear.
            List<MessageLog.Entry> removed = job.removed;
            job.removed = null;
            if (page.started && job.undoable && job.cleared && removed != null && !removed.isEmpty()) {
                page.offerUndo(page.text.format("message_log_clear"), () -> restoreMessageLog(removed));
                messageLogUndo = true;
            }
        }
        if (messageLogList != null) loadMessageLog();
    }

    /** Undo for Clear log: writes back the copy the clear kept, off the main thread, ahead of anything logged since. */
    private void restoreMessageLog(List<MessageLog.Entry> removed) {
        MESSAGE_LOG_WORK.execute(() -> {
            boolean restored = MessageLog.restore(removed);
            page.runOnUiThread(() -> {
                if (page.isFinishing() || page.isDestroyed()) return;
                page.feedback(page.text.get(restored ? "message_log_restored" : "message_log_restore_failed"), Toast.LENGTH_LONG);
                if (messageLogList != null) loadMessageLog();
            });
        });
    }

    /** Only the work and its outcome survive rotation. The worker never owns a screen or chat text. */
    private static final class MessageLogClearJob {
        java.lang.ref.WeakReference<MessageLogSheet> owner;
        boolean finished, cleared, notified;
        /** Cleared when settings stop while this runs, so coming back before it ends doesn't bring Undo back. */
        boolean undoable = true;
        /** What the clear took, until the page hands it to Undo. */
        List<MessageLog.Entry> removed;

        MessageLogClearJob(MessageLogSheet sheet) { owner = new java.lang.ref.WeakReference<>(sheet); }

        void start() {
            MESSAGE_LOG_WORK.execute(() -> {
                MessageLog.Cleared result = MessageLog.clearForUndo();
                new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                    cleared = result.cleared;
                    removed = result.removed;
                    finished = true;
                    MessageLogSheet sheet = owner.get();
                    if (sheet != null) sheet.messageLogCleared(this);
                });
            });
        }
    }
}
