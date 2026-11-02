package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.IOException;
import java.util.List;
import java.util.function.Function;

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
    /** The search box's words, and the chat the open log is narrowed to, or null for all of them. */
    private String messageLogQuery = "";
    private String messageLogThread;
    /** The open log lists chats to pick from instead of messages. */
    private boolean messageLogByChat;
    /** The loaded messages the search and filters choose from, and the column that shows what they leave. */
    private MessageLogSearch.Index messageLogIndex;
    private LinearLayout messageLogResults;
    private Button messageLogSaveText, messageLogSaveCsv;
    /** The format of the file picker that's open, 0 when none is. */
    private int messageLogSaving;

    MessageLogSheet(SettingsActivity page) {
        this.page = page;
    }

    void restoreState(Bundle state) {
        messageLogClearFailed = state.getBoolean("message_log_clear_failed");
        messageLogSaving = state.getInt("message_log_saving");
        messageLogQuery = state.getString("message_log_query", "");
        messageLogThread = state.getString("message_log_thread");
        messageLogUnsentOnly = state.getBoolean("message_log_unsent");
        messageLogByChat = state.getBoolean("message_log_by_chat");
    }

    void saveState(Bundle state) {
        state.putBoolean("message_log_open", messageLogDialog != null && messageLogDialog.isShowing());
        state.putBoolean("message_log_clear_failed", messageLogClearFailed);
        // A picker's result can land on a new page, and it saves what this page was showing.
        state.putInt("message_log_saving", messageLogSaving);
        state.putString("message_log_query", messageLogQuery);
        state.putString("message_log_thread", messageLogThread);
        state.putBoolean("message_log_unsent", messageLogUnsentOnly);
        state.putBoolean("message_log_by_chat", messageLogByChat);
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
                messageLogQuery = "";
                messageLogThread = null;
                messageLogByChat = false;
                messageLogIndex = null;
                messageLogResults = null;
                messageLogSaveText = null;
                messageLogSaveCsv = null;
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
        messageLogResults = null;
        messageLogIndex = null;
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
            final MessageLogSearch.Index index = new MessageLogSearch.Index(result.entries);
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
                if (!result.entries.isEmpty()) {
                    ui.add(list, ui.text(text.get("message_log_retention"), 13, ui.muted, false), list.getChildCount() > 0 ? 12 : 0);
                    addMessageLogTools(list, index);
                    showMessageLogResults();
                }
            });
        }, "HushMessageLogView").start();
    }

    /** The search box, the two ways to narrow the log and the two ways to save it, with the results column under them. */
    private void addMessageLogTools(LinearLayout list, MessageLogSearch.Index index) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        messageLogIndex = index;
        EditText search = ui.field(text.get("message_log_search"), 200, true);
        search.setTag("message_log_search");
        search.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        search.setText(messageLogQuery);
        // Results sit in their own column, so the box keeps its focus and its keyboard while they change.
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence typed, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence typed, int start, int before, int count) {}
            @Override public void afterTextChanged(Editable typed) {
                messageLogQuery = typed.toString();
                showMessageLogResults();
            }
        });
        ui.add(list, search, 12);

        LinearLayout views = ui.row();
        Button byChat = ui.button(text.get(messageLogByChat ? "message_log_by_date" : "message_log_by_chat"));
        byChat.setTag("message_log_by_chat");
        byChat.setOnClickListener(view -> {
            messageLogByChat = !messageLogByChat;
            messageLogThread = null;
            byChat.setText(text.get(messageLogByChat ? "message_log_by_date" : "message_log_by_chat"));
            showMessageLogResults();
        });
        views.addView(byChat, new LinearLayout.LayoutParams(0, -2, 1));
        // Only a log with unsent messages in it gets the filter.
        if (index.hasUnsent) {
            Button filter = ui.button(text.get(messageLogUnsentOnly ? "message_log_show_all" : "message_log_unsent_only"));
            filter.setTag("message_log_unsent_only");
            filter.setOnClickListener(view -> {
                messageLogUnsentOnly = !messageLogUnsentOnly;
                filter.setText(text.get(messageLogUnsentOnly ? "message_log_show_all" : "message_log_unsent_only"));
                showMessageLogResults();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, -2, 1);
            params.setMarginStart(ui.dp(8));
            views.addView(filter, params);
        }
        ui.add(list, views, 8);

        LinearLayout saves = ui.row();
        messageLogSaveText = ui.button(text.get("message_log_save_text"));
        messageLogSaveText.setTag("message_log_save_text");
        messageLogSaveText.setOnClickListener(view -> pickSaveFile(MessageLogExport.TEXT));
        saves.addView(messageLogSaveText, new LinearLayout.LayoutParams(0, -2, 1));
        messageLogSaveCsv = ui.button(text.get("message_log_save_csv"));
        messageLogSaveCsv.setTag("message_log_save_csv");
        messageLogSaveCsv.setOnClickListener(view -> pickSaveFile(MessageLogExport.CSV));
        LinearLayout.LayoutParams csvParams = new LinearLayout.LayoutParams(0, -2, 1);
        csvParams.setMarginStart(ui.dp(8));
        saves.addView(messageLogSaveCsv, csvParams);
        ui.add(list, saves, 8);
        ui.add(list, ui.text(text.get("message_log_save_help"), 13, ui.muted, false), 4);

        messageLogResults = ui.column();
        messageLogResults.setTag("message_log_results");
        list.addView(messageLogResults, new LinearLayout.LayoutParams(-1, -2));
    }

    /** What the search and the filters leave, from memory, so a typed letter doesn't read the file again. */
    private void showMessageLogResults() {
        LinearLayout results = messageLogResults;
        MessageLogSearch.Index index = messageLogIndex;
        if (results == null || index == null) return;
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        long generation = ++messageLogGeneration;
        messageLogMore = null;
        results.removeAllViews();
        List<MessageLog.Entry> found = index.find(messageLogQuery, messageLogThread, messageLogUnsentOnly && index.hasUnsent);
        messageLogSaveText.setEnabled(!found.isEmpty());
        messageLogSaveCsv.setEnabled(!found.isEmpty());
        if (messageLogThread != null) {
            Button all = ui.button(text.get("message_log_all_chats"));
            all.setTag("message_log_all_chats");
            all.setOnClickListener(view -> openMessageLogChat(null));
            ui.add(results, all, 12);
        }
        if (found.isEmpty()) {
            TextView none = ui.text(text.get("message_log_no_match"), 14, ui.muted, false);
            none.setTag("message_log_no_match");
            none.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            ui.add(results, none, 12);
        } else if (messageLogByChat && messageLogThread == null) {
            showMessageLogPage(results, generation, MessageLogSearch.chats(found), 0, this::messageLogChat);
        } else {
            showMessageLogPage(results, generation, found, 0, this::messageLogEntry);
        }
    }

    private void openMessageLogChat(String thread) {
        messageLogThread = thread;
        showMessageLogResults();
        if (messageLogScroll != null) messageLogScroll.scrollTo(0, 0);
    }

    private <T> void showMessageLogPage(LinearLayout results, long generation, List<T> items, int from, Function<T, View> card) {
        messageLogMore = null;
        if (messageLogResults != results || generation != messageLogGeneration) return;
        int to = Math.min(items.size(), from + MESSAGE_LOG_PAGE);
        for (int i = from; i < to; i++) results.addView(card.apply(items.get(i)));
        if (to < items.size()) messageLogMore = () -> showMessageLogPage(results, generation, items, to, card);
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

    /** One chat in the by-chat view. Tapping it narrows the log to that chat. */
    private View messageLogChat(MessageLogSearch.Chat chat) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        LinearLayout card = ui.column();
        card.setTag("message_log_chat");
        card.setBackground(ui.interactive(ui.surface, ui.line, 12));
        card.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        card.addView(ui.title(chat.name.isEmpty() ? text.get("message_log_unknown_thread") : chat.name, 15));
        ui.add(card, ui.text(text.get("message_log_chat_count", String.valueOf(chat.count)) + "  ·  " +
            page.formatSince(chat.latest, "message_log_now", "message_log_ago"), 12, ui.muted, true), 4);
        card.setFocusable(true);
        card.setOnClickListener(view -> openMessageLogChat(chat.thread));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(8);
        card.setLayoutParams(params);
        return card;
    }

    private void pickSaveFile(int format) {
        if (messageLogSaving != 0) return;
        messageLogSaving = format;
        Intent picker = new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
            .setType(MessageLogExport.mime(format)).putExtra(Intent.EXTRA_TITLE, MessageLogExport.fileName(format, System.currentTimeMillis()));
        try { page.startActivityForResult(picker, SettingsActivity.SAVE_MESSAGE_LOG); }
        catch (android.content.ActivityNotFoundException | SecurityException unavailable) {
            messageLogSaving = 0;
            page.feedback(page.text.get("message_log_save_failed"), Toast.LENGTH_LONG);
        }
    }

    /** The picker's answer. It reads the log again rather than holding chat text across another app. */
    void saveResult(int result, Intent data) {
        int format = messageLogSaving;
        messageLogSaving = 0;
        // Cancelled: nothing to do and nothing to say.
        if (result != Activity.RESULT_OK || format == 0 || data == null || data.getData() == null) return;
        Uri document = data.getData();
        if (!"content".equals(document.getScheme())) {
            page.feedback(page.text.get("message_log_save_failed"), Toast.LENGTH_LONG);
            return;
        }
        String query = messageLogQuery, thread = messageLogThread;
        boolean unsentOnly = messageLogUnsentOnly;
        Context context = page.getApplicationContext();
        MessageLogExport.Labels labels = new MessageLogExport.Labels(page.text);
        MESSAGE_LOG_WORK.execute(() -> {
            int saved = -1;
            try {
                saved = MessageLogExport.save(context, document, format, query, thread, unsentOnly, labels);
            } catch (IOException | RuntimeException failure) {
                Settings.hookFailedPrivately(MessageLog.KEY, "Can't save the message log", failure);
            }
            int count = saved;
            page.runOnUiThread(() -> {
                if (page.isFinishing() || page.isDestroyed()) return;
                page.feedback(count < 0 ? page.text.get("message_log_save_failed") : page.text.get("message_log_saved", String.valueOf(count)), Toast.LENGTH_LONG);
            });
        });
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
