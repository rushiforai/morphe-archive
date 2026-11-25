package app.hushmessenger.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Outline;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewOutlineProvider;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.Function;

/**
 * The message log's buttons and keep choices under its switch, the sheet that shows the log, and Clear with its Undo. One
 * per settings page. A Clear still running when the page is recreated is handed to the new page's sheet.
 */
final class MessageLogSheet {
    /** Opens the log's sheet over settings, for the shortcut beside Messenger's new-chat button. */
    static final String OPEN_EXTRA = "hush_open_message_log";
    /** With OPEN_EXTRA, the chat the log opens on, from the Message log row in a chat's long-press menu. */
    static final String THREAD_EXTRA = "hush_message_log_thread";
    /** Cards built at a time. A full log is 20,000 of them, and building 500 at once froze the screen for two seconds. */
    static final int MESSAGE_LOG_PAGE = 20;
    /** The All, Direct and Groups buttons, in MessageLogSearch's order. */
    private static final String[] KINDS = {"message_log_kind_all", "message_log_kind_direct", "message_log_kind_groups"};
    /** Pictures open one at a time, so a page of photo messages doesn't start a thread for each. */
    private static final java.util.concurrent.ExecutorService MESSAGE_LOG_PICTURES = java.util.concurrent.Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMessageLogPictures");
        thread.setDaemon(true);
        return thread;
    });
    /** Clears and their Undos run one at a time in the order they were tapped, so a Clear right after Undo stays cleared. */
    private static final java.util.concurrent.ExecutorService MESSAGE_LOG_WORK = java.util.concurrent.Executors.newSingleThreadExecutor(work -> {
        Thread thread = new Thread(work, "HushMessageLogWork");
        thread.setDaemon(true);
        return thread;
    });

    private final SettingsActivity page;
    private Dialog messageLogDialog;
    /** The video playing over the log, in its own dialog, or null when none is. */
    private Dialog messageLogVideoDialog;
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
    /** Which chats the open log shows: MessageLogSearch.ALL, DIRECT or GROUPS. */
    private int messageLogKind = MessageLogSearch.ALL;
    private LinearLayout messageLogKinds;
    /** The loaded messages the search and filters choose from, and the column that shows what they leave. */
    private MessageLogSearch.Index messageLogIndex;
    private LinearLayout messageLogResults;
    private Button messageLogSaveText, messageLogSaveCsv;
    /** The format of the file picker that's open, 0 when none is. */
    private int messageLogSaving;
    /** The open log's colors, taken from Messenger's chats when it opens, and the layout drawn in them. */
    private MessageLogLook messageLogLook;
    private SettingsUi messageLogUi;
    /** Faces opened for the open log, by file name, a page or so of them; a face that scrolled further back opens again. */
    private final Map<String, Bitmap> messageLogFaces = new LinkedHashMap<String, Bitmap>(16, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String, Bitmap> eldest) { return size() > MESSAGE_LOG_FACES; }
    };
    /** The faces on screen waiting for a picture being opened, and the names with no picture, until the log reloads. */
    private final Map<String, List<MessageLogFace>> messageLogFacesWaiting = new HashMap<>();
    private final Set<String> messageLogNoFace = new HashSet<>();
    private long messageLogFaceGeneration;
    /** Faces held open at a time, about three pages of rows. Each is 64 KB. */
    private static final int MESSAGE_LOG_FACES = 64;

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
        messageLogKind = state.getInt("message_log_kind", MessageLogSearch.ALL);
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
        state.putInt("message_log_kind", messageLogKind);
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
        if (messageLogVideoDialog != null) messageLogVideoDialog.dismiss();
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

    /**
     * Two actions under the message-log switch, open the log or wipe it, no confirmation, just a toast. Then how long
     * messages stay.
     */
    void addMessageLogActions(LinearLayout content) {
        LinearLayout actions = page.ui.row();
        Button view = page.ui.button(page.text.get("message_log_view"));
        view.setTag("message_log_view");
        view.setOnClickListener(clicked -> showMessageLog());
        actions.addView(view);
        Button clear = page.ui.destructiveButton(page.text.get("message_log_clear"));
        clear.setTag("message_log_clear");
        clear.setOnClickListener(clicked -> clearMessageLog());
        LinearLayout.LayoutParams clearParams = new LinearLayout.LayoutParams(-2, -2);
        clearParams.setMarginStart(page.ui.dp(8));
        actions.addView(clear, clearParams);
        page.ui.add(content, actions, 8);

        TextView keepTitle = page.ui.text(page.text.get("message_log_keep"), 14, page.ui.text, true);
        page.ui.add(content, keepTitle, 12);
        RadioGroup keep = new RadioGroup(page);
        keep.setTag("message_log_keep");
        keep.setOrientation(LinearLayout.VERTICAL);
        int picked = MessageLog.keepDays();
        for (int days : MessageLog.KEEP_CHOICES) {
            RadioButton choice = page.radio("message_log_keep_" + days, page.text.get("message_log_keep_" + days));
            choice.setChecked(days == picked);
            choice.setOnClickListener(clicked -> keepMessagesFor(days));
            keep.addView(choice, new RadioGroup.LayoutParams(-1, -2));
        }
        page.ui.add(content, keep, 4);
    }

    /** A keep choice was tapped. A shorter time says older messages wait a few minutes, in case it was a slip. */
    private void keepMessagesFor(int days) {
        long now = System.currentTimeMillis();
        long before = MessageLog.keepMs(now);
        MessageLog.keepFor(days, now);
        String said;
        if (days == 0) {
            said = page.text.get("message_log_keep_forever");
        } else {
            boolean shorter = before == 0 || days * MessageLog.DAY_MS < before;
            said = page.text.get(shorter ? "message_log_keep_shorter" : "message_log_keep_changed", page.text.format("message_log_keep_" + days));
        }
        page.feedback(said, Toast.LENGTH_LONG);
    }

    /** The log narrowed to [thread]'s messages, or every chat's when it's null or empty. All chats widens it again. */
    void showMessageLog(String thread) {
        if (messageLogDialog != null) return;
        messageLogThread = thread == null || thread.isEmpty() ? null : thread;
        showMessageLog();
    }

    void showMessageLog() {
        if (page.isFinishing() || page.isDestroyed() || messageLogDialog != null) return;
        // The log reads like Messenger's chats, so it takes their light or dark look and Material You's colors, not the page's.
        messageLogLook = MessageLogLook.current();
        messageLogUi = new SettingsUi(page, messageLogLook);
        SettingsDialog sheet = new SettingsDialog(page, messageLogUi, page.text, page.text.get("message_log_title"),
            page.text.get(messageLogHint()));
        Dialog dialog = sheet.dialog;
        messageLogDialog = dialog;
        hideFromRecents(dialog);
        dialog.setOnDismissListener(dismissed -> {
            showInRecents();
            if (messageLogVideoDialog != null) messageLogVideoDialog.dismiss();
            MessageLogClip.stop();
            if (messageLogDialog == dismissed) {
                forgetMessageLogFaces();
                messageLogDialog = null;
                messageLogList = null;
                messageLogScroll = null;
                messageLogMore = null;
                messageLogClear = null;
                messageLogUnsentOnly = false;
                messageLogQuery = "";
                messageLogThread = null;
                messageLogByChat = false;
                messageLogKind = MessageLogSearch.ALL;
                messageLogKinds = null;
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
        messageLogClear = messageLogUi.destructiveButton(page.text.get("message_log_clear"));
        messageLogClear.setTag("message_log_dialog_clear");
        messageLogClear.setOnClickListener(clicked -> clearMessageLog());
        sheet.action(messageLogClear);
        Button close = messageLogUi.primaryButton(page.text.get("message_log_close"));
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

    /** The open log's layout, else the page's for a callback that lands after the log closed. */
    private SettingsUi ui() {
        SettingsUi ui = messageLogUi;
        return ui != null ? ui : page.ui;
    }

    private MessageLogLook look() {
        MessageLogLook look = messageLogLook;
        return look != null ? look : MessageLogLook.current();
    }

    private void loadMessageLog() {
        final LinearLayout list = messageLogList;
        if (list == null) return;
        final long generation = ++messageLogGeneration;
        messageLogMore = null;
        messageLogResults = null;
        messageLogIndex = null;
        // A Clear or its Undo can take or bring back faces, so they open again.
        forgetMessageLogFaces();
        list.removeAllViews();
        SettingsUi ui = ui();
        SettingsText text = page.text;
        TextView loading = ui.text(text.get("message_log_loading"), 14, ui.muted, false);
        loading.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        list.addView(loading);
        if (messageLogClear != null) messageLogClear.setEnabled(false);
        if (messageLogClearJob != null && !messageLogClearJob.finished) return;
        new Thread(() -> {
            final MessageLog.LoadResult result = MessageLog.loadResult();
            final MessageLogSearch.Index index = new MessageLogSearch.Index(result.entries, result.names);
            page.runOnUiThread(() -> {
                if (messageLogList != list || generation != messageLogGeneration) return;
                list.removeAllViews();
                if (messageLogClear != null) messageLogClear.setEnabled(result.failed || result.setAside || messageLogClearFailed || !result.entries.isEmpty());
                if (result.failed || messageLogClearFailed) {
                    LinearLayout failure = messageLogPanel(ui);
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
                        LinearLayout notice = messageLogPanel(ui);
                        notice.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                        notice.addView(ui.title(text.get("message_log_set_aside"), 18));
                        ui.add(notice, ui.text(text.get("message_log_set_aside_help"), 14, ui.muted, false), 8);
                        Button remove = ui.destructiveButton(text.get("message_log_set_aside_remove"));
                        remove.setTag("message_log_set_aside_remove");
                        remove.setOnClickListener(view -> { view.setEnabled(false); removeSetAsideLog(); });
                        ui.add(notice, remove, 16);
                        ui.add(list, notice, 0);
                    }
                    if (result.entries.isEmpty()) {
                        LinearLayout empty = messageLogPanel(ui);
                        empty.setPadding(ui.dp(20), ui.dp(20), ui.dp(20), ui.dp(20));
                        empty.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
                        View accent = new View(page);
                        accent.setBackground(ui.shape(ui.accent, 0, 0));
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

    /**
     * A note's box in the log: the sheet's own color ringed in the bubbles' grey, so the grey buttons inside it still
     * read as buttons.
     */
    private static LinearLayout messageLogPanel(SettingsUi ui) {
        LinearLayout panel = ui.panel();
        panel.setBackground(ui.shape(ui.dialog, ui.card, SettingsUi.CARD_RADIUS, 1));
        return panel;
    }

    /** The search box, the two ways to narrow the log and the two ways to save it, with the results column under them. */
    private void addMessageLogTools(LinearLayout list, MessageLogSearch.Index index) {
        SettingsUi ui = ui();
        MessageLogLook look = look();
        SettingsText text = page.text;
        messageLogIndex = index;
        // Messenger's search field: a grey pill with the magnifier at its start.
        EditText search = ui.field(text.get("message_log_search"), 200, true);
        search.setTag("message_log_search");
        search.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        search.setBackground(look.pill(ui, look.raised, 2));
        Drawable glass = SettingsIcons.icon(page, SettingsIcons.SEARCH, look.muted);
        glass.setBounds(0, 0, ui.dp(20), ui.dp(20));
        search.setCompoundDrawablesRelative(glass, null, null, null);
        search.setCompoundDrawablePadding(ui.dp(8));
        search.setPaddingRelative(ui.dp(14), ui.dp(12), ui.dp(16), ui.dp(12));
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

        // Messenger's filter chips in one row that scrolls sideways when the words don't fit: the kinds, then the two views.
        LinearLayout chips = ui.row();
        chips.setGravity(Gravity.CENTER_VERTICAL);
        messageLogKinds = ui.row();
        messageLogKinds.setTag("message_log_kinds");
        chips.addView(messageLogKinds, new LinearLayout.LayoutParams(-2, -2));
        showMessageLogKinds();
        Button byChat = messageLogChip(text.get(messageLogByChat ? "message_log_by_date" : "message_log_by_chat"), false);
        byChat.setTag("message_log_by_chat");
        byChat.setOnClickListener(view -> {
            messageLogByChat = !messageLogByChat;
            messageLogThread = null;
            byChat.setText(text.get(messageLogByChat ? "message_log_by_date" : "message_log_by_chat"));
            showMessageLogResults();
        });
        chips.addView(byChat, chipParams(ui, true));
        // Only a log with unsent messages in it gets the filter.
        if (index.hasUnsent) {
            Button filter = messageLogChip(text.get(messageLogUnsentOnly ? "message_log_show_all" : "message_log_unsent_only"), false);
            filter.setTag("message_log_unsent_only");
            filter.setOnClickListener(view -> {
                messageLogUnsentOnly = !messageLogUnsentOnly;
                filter.setText(text.get(messageLogUnsentOnly ? "message_log_show_all" : "message_log_unsent_only"));
                showMessageLogResults();
            });
            chips.addView(filter, chipParams(ui, true));
        }
        HorizontalScrollView chipScroll = new HorizontalScrollView(page);
        chipScroll.setHorizontalScrollBarEnabled(false);
        chipScroll.setFillViewport(true);
        chipScroll.addView(chips, new HorizontalScrollView.LayoutParams(-2, -2));
        ui.add(list, chipScroll, 4);

        LinearLayout saves = ui.row();
        messageLogSaveText = messageLogChip(text.get("message_log_save_text"), false);
        messageLogSaveText.setTag("message_log_save_text");
        messageLogSaveText.setOnClickListener(view -> pickSaveFile(MessageLogExport.TEXT));
        saves.addView(messageLogSaveText, new LinearLayout.LayoutParams(0, -2, 1));
        messageLogSaveCsv = messageLogChip(text.get("message_log_save_csv"), false);
        messageLogSaveCsv.setTag("message_log_save_csv");
        messageLogSaveCsv.setOnClickListener(view -> pickSaveFile(MessageLogExport.CSV));
        LinearLayout.LayoutParams csvParams = new LinearLayout.LayoutParams(0, -2, 1);
        csvParams.setMarginStart(ui.dp(8));
        saves.addView(messageLogSaveCsv, csvParams);
        ui.add(list, saves, 0);
        ui.add(list, ui.text(text.get("message_log_save_help"), 13, ui.muted, false), 2);

        messageLogResults = ui.column();
        messageLogResults.setTag("message_log_results");
        LinearLayout.LayoutParams resultsParams = new LinearLayout.LayoutParams(-1, -2);
        resultsParams.topMargin = ui.dp(8);
        list.addView(messageLogResults, resultsParams);
    }

    /**
     * A chip like Messenger's filters: a round-ended grey button, or the blue-washed one with blue words when [picked].
     * Its touch target stays 48 dp tall while the chip shows 36.
     */
    private Button messageLogChip(String title, boolean picked) {
        SettingsUi ui = ui();
        MessageLogLook look = look();
        Button chip = ui.button(title);
        chip.setTextSize(14);
        chip.setSingleLine(true);
        chip.setTextColor(new android.content.res.ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}},
            new int[] {(look.muted & 0x00ffffff) | 0x99000000, picked ? look.pickedText : look.text}));
        chip.setBackground(look.pill(ui, picked ? look.picked : look.raised, 6));
        chip.setPadding(ui.dp(16), 0, ui.dp(16), 0);
        chip.setMinWidth(ui.dp(48));
        chip.setMinimumWidth(ui.dp(48));
        chip.setSelected(picked);
        return chip;
    }

    private static LinearLayout.LayoutParams chipParams(SettingsUi ui, boolean gap) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
        if (gap) params.setMarginStart(ui.dp(8));
        return params;
    }

    /** All, Direct and Groups, the picked one filled in. Picking one goes back to every chat of that kind. */
    private void showMessageLogKinds() {
        LinearLayout row = messageLogKinds;
        if (row == null) return;
        SettingsUi ui = ui();
        row.removeAllViews();
        for (int kind = 0; kind < KINDS.length; kind++) {
            int choice = kind;
            boolean picked = kind == messageLogKind;
            Button button = messageLogChip(page.text.get(KINDS[kind]), picked);
            button.setTag(KINDS[kind]);
            button.setOnClickListener(view -> {
                if (messageLogKind == choice) return;
                messageLogKind = choice;
                messageLogThread = null;
                showMessageLogKinds();
                showMessageLogResults();
            });
            row.addView(button, chipParams(ui, kind > 0));
        }
    }

    /** What the search and the filters leave, from memory, so a typed letter doesn't read the file again. */
    private void showMessageLogResults() {
        LinearLayout results = messageLogResults;
        MessageLogSearch.Index index = messageLogIndex;
        if (results == null || index == null) return;
        SettingsUi ui = ui();
        SettingsText text = page.text;
        long generation = ++messageLogGeneration;
        messageLogMore = null;
        // The hint is the line that says what order the list is in.
        View hint = results.getRootView().findViewWithTag("dialog_hint");
        if (hint instanceof TextView) ((TextView) hint).setText(text.get(messageLogHint()));
        results.removeAllViews();
        List<MessageLog.Entry> found = index.find(messageLogQuery, messageLogThread, messageLogUnsentOnly && index.hasUnsent, messageLogKind);
        messageLogSaveText.setEnabled(!found.isEmpty());
        messageLogSaveCsv.setEnabled(!found.isEmpty());
        if (messageLogThread != null) {
            Button all = messageLogChip(text.get("message_log_all_chats"), false);
            all.setTag("message_log_all_chats");
            all.setTextColor(look().link);
            Drawable back = SettingsIcons.icon(page, SettingsIcons.BACK, look().link);
            back.setBounds(0, 0, ui.dp(18), ui.dp(18));
            back.setAutoMirrored(true);
            all.setCompoundDrawablesRelative(back, null, null, null);
            all.setCompoundDrawablePadding(ui.dp(4));
            all.setPaddingRelative(ui.dp(10), 0, ui.dp(16), 0);
            all.setOnClickListener(view -> openMessageLogChat(null));
            results.addView(all, new LinearLayout.LayoutParams(-2, -2));
            if (!messageLogThread.isEmpty()) {
                addMessageLogChatTop(results, index, messageLogThread, found.size());
                addMessageLogRename(results, index, messageLogThread);
            }
        }
        if (found.isEmpty()) {
            TextView none = ui.text(text.get("message_log_no_match"), 14, ui.muted, false);
            none.setTag("message_log_no_match");
            none.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
            ui.add(results, none, 12);
        } else if (messageLogByChat && messageLogThread == null) {
            showMessageLogPage(results, generation, MessageLogSearch.chats(found, index.names()), 0, this::messageLogChat);
        } else {
            showMessageLogPage(results, generation, found, 0, this::messageLogEntry);
        }
    }

    /** The open chat's name field: what it's called in the log, typed by you, or empty for the name its messages carry. */
    private void addMessageLogRename(LinearLayout results, MessageLogSearch.Index index, String thread) {
        SettingsUi ui = ui();
        MessageLogLook look = look();
        SettingsText text = page.text;
        LinearLayout row = ui.row();
        row.setGravity(Gravity.CENTER_VERTICAL);
        EditText name = ui.field(text.get("message_log_rename_hint"), MessageLog.MAX_NAME_CHARS, true);
        name.setTag("message_log_rename");
        name.setImeOptions(EditorInfo.IME_ACTION_DONE | EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING);
        name.setBackground(look.pill(ui, look.raised, 2));
        name.setPaddingRelative(ui.dp(16), ui.dp(12), ui.dp(16), ui.dp(12));
        name.setText(index.picked(thread));
        row.addView(name, new LinearLayout.LayoutParams(0, -2, 1));
        Button save = messageLogChip(text.get("message_log_rename_save"), false);
        save.setTextColor(new android.content.res.ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}},
            new int[] {(look.muted & 0x00ffffff) | 0x99000000, look.link}));
        save.setTag("message_log_rename_save");
        save.setOnClickListener(view -> renameMessageLogChat(thread, name, save));
        name.setOnEditorActionListener((field, action, event) -> {
            if (action != EditorInfo.IME_ACTION_DONE) return false;
            renameMessageLogChat(thread, name, save);
            return true;
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
        params.setMarginStart(ui.dp(8));
        row.addView(save, params);
        ui.add(results, row, 8);
    }

    /** The open chat's face and name over its messages, as at the top of a Messenger chat, with how many are listed. */
    private void addMessageLogChatTop(LinearLayout results, MessageLogSearch.Index index, String thread, int count) {
        SettingsUi ui = ui();
        MessageLogLook look = look();
        SettingsText text = page.text;
        LinearLayout top = ui.column();
        top.setGravity(Gravity.CENTER_HORIZONTAL);
        top.setTag("message_log_chat_top");
        boolean direct = ChatNotifications.oneToOne(thread);
        top.addView(messageLogFaceView(MessageLogFaces.chatName(thread), !direct, 64));
        String called = index.chatName(thread);
        TextView name = ui.text(called.isEmpty() ? text.get("message_log_unknown_thread") : called, 18, look.text, true);
        name.setGravity(Gravity.CENTER_HORIZONTAL);
        name.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        name.setAccessibilityHeading(true);
        ui.add(top, name, 8);
        TextView many = ui.text(text.get("message_log_chat_count", String.valueOf(count)), 13, look.muted, false);
        many.setGravity(Gravity.CENTER_HORIZONTAL);
        ui.add(top, many, 4);
        ui.add(results, top, 8);
    }

    /** Saves the typed name off the main thread, then shows the chat under it. An empty name takes the picked one away. */
    private void renameMessageLogChat(String thread, EditText field, Button save) {
        if (!save.isEnabled()) return;
        String name = MessageLog.cleanName(field.getText().toString());
        save.setEnabled(false);
        InputMethodManager keyboard = page.getSystemService(InputMethodManager.class);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(field.getWindowToken(), 0);
        MESSAGE_LOG_WORK.execute(() -> {
            boolean saved = MessageLog.rename(thread, name);
            page.runOnUiThread(() -> {
                if (page.isFinishing() || page.isDestroyed()) return;
                page.feedback(page.text.get(!saved ? "message_log_rename_failed" : name.isEmpty() ? "message_log_rename_removed" : "message_log_renamed"), Toast.LENGTH_SHORT);
                MessageLogSearch.Index index = messageLogIndex;
                if (!saved || index == null || !thread.equals(messageLogThread)) {
                    save.setEnabled(true);
                    return;
                }
                index.rename(thread, name);
                showMessageLogResults();
            });
        });
    }

    /** Chat cards come latest message first. Messages, one chat's included, come newest first. */
    private String messageLogHint() {
        return messageLogByChat && messageLogThread == null ? "message_log_hint_by_chat" : "message_log_hint";
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

    /** Room for the face and the gap after it, which the name and badge over a bubble are indented by. */
    private static final int ENTRY_FACE = 32, ENTRY_GAP = 8;

    /**
     * One message as Messenger shows it: who sent it and when over a grey bubble, with their face beside it at its foot.
     * A one-to-one chat's face is the other person's, a group's is its sender's.
     */
    private View messageLogEntry(MessageLog.Entry entry) {
        SettingsUi ui = ui();
        MessageLogLook look = look();
        SettingsText text = page.text;
        LinearLayout card = ui.column();
        // A name that opens its chat is a full-height tap target, so it sits over the bubble's start, not on it.
        boolean opens = messageLogThread == null && !entry.thread.isEmpty();
        int indent = ui.dp(ENTRY_FACE + ENTRY_GAP);
        String who = messageLogWho(entry);
        TextView metadata = ui.text(who + "  ·  " + page.formatSince(entry.time, "message_log_now", "message_log_ago"), 12, look.muted, true);
        metadata.setContentDescription(who + ". " + android.text.format.DateFormat.getDateFormat(page).format(new java.util.Date(entry.time)) + ", " +
            android.text.format.DateFormat.getTimeFormat(page).format(new java.util.Date(entry.time)));
        metadata.setPaddingRelative(ui.dp(12), 0, ui.dp(12), 0);
        if (opens) {
            metadata.setTag("message_log_open_chat");
            // In the link color, so the name reads as something to tap and the plain ones in a chat's own log don't.
            metadata.setTextColor(look.link);
            metadata.setMinHeight(ui.dp(48));
            metadata.setGravity(Gravity.CENTER_VERTICAL);
            metadata.setBackground(ui.interactive(0, 0, 8));
            metadata.setFocusable(true);
            metadata.setOnClickListener(view -> openMessageLogChat(entry.thread));
        }
        LinearLayout.LayoutParams metadataParams = new LinearLayout.LayoutParams(-2, -2);
        metadataParams.setMarginStart(indent);
        card.addView(metadata, metadataParams);
        if (entry.unsent) {
            TextView badge = ui.text(text.get("message_log_unsent"), 12, look.link, true);
            badge.setTag("message_log_unsent_badge");
            badge.setPaddingRelative(ui.dp(12), 0, 0, 0);
            LinearLayout.LayoutParams badgeParams = new LinearLayout.LayoutParams(-2, -2);
            badgeParams.setMarginStart(indent);
            badgeParams.topMargin = ui.dp(2);
            card.addView(badge, badgeParams);
        }
        LinearLayout row = ui.row();
        row.setGravity(Gravity.BOTTOM);
        boolean direct = MessageLogSearch.direct(entry);
        String face = entry.thread.isEmpty() ? null : direct ? MessageLogFaces.chatName(entry.thread)
            : entry.sender.isEmpty() ? null : MessageLogFaces.senderName(entry.thread, entry.sender);
        row.addView(messageLogFaceView(face, false, ENTRY_FACE));
        // Bubbles stop short of the far edge, as Messenger's do, so a long message still reads as one person's.
        LinearLayout bubbles = ui.column();
        LinearLayout.LayoutParams bubblesParams = new LinearLayout.LayoutParams(0, -2, 1);
        bubblesParams.setMarginStart(ui.dp(ENTRY_GAP));
        bubblesParams.setMarginEnd(ui.dp(24));
        row.addView(bubbles, bubblesParams);
        String words = entry.text == null || entry.text.isEmpty() ? text.get(entry.attachment ? "message_log_attachment" : "message_log_no_text") : entry.text;
        TextView body = ui.text(words, 15, look.text, false);
        body.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        body.setTextIsSelectable(true);
        body.setBackground(look.bubble(ui));
        body.setPadding(ui.dp(12), ui.dp(8), ui.dp(12), ui.dp(9));
        bubbles.addView(body, new LinearLayout.LayoutParams(-2, -2));
        if (MessageLogAttachment.AUDIO.equals(entry.mediaType)) {
            if (!entry.media.isEmpty()) messageLogClipRow(bubbles, entry.media);
        } else if (MessageLogAttachment.VIDEO.equals(entry.mediaType)) {
            if (!entry.media.isEmpty()) messageLogVideoRow(bubbles, entry.media);
        } else if (!entry.media.isEmpty()) {
            ImageView picture = new ImageView(page);
            picture.setTag("message_log_photo");
            picture.setContentDescription(text.get("message_log_photo"));
            picture.setAdjustViewBounds(true);
            picture.setScaleType(ImageView.ScaleType.FIT_START);
            picture.setMaxHeight(ui.dp(280));
            picture.setVisibility(View.GONE);
            // Rounded like the bubble above it.
            int corner = ui.dp(18);
            picture.setOutlineProvider(new ViewOutlineProvider() {
                @Override public void getOutline(View view, Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), corner);
                }
            });
            picture.setClipToOutline(true);
            LinearLayout.LayoutParams pictureParams = new LinearLayout.LayoutParams(-2, -2);
            pictureParams.topMargin = ui.dp(4);
            bubbles.addView(picture, pictureParams);
            TextView missing = ui.text(text.get("message_log_photo_missing"), 13, look.muted, false);
            missing.setTag("message_log_photo_missing");
            missing.setVisibility(View.GONE);
            ui.add(bubbles, missing, 4);
            showMessageLogPicture(picture, missing, entry.media);
        }
        ui.add(card, row, 2);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(12);
        card.setLayoutParams(params);
        return card;
    }

    /**
     * Who a card names. A one-to-one chat is the other person, so its picked name stands for them. A group names its
     * sender in the group's picked or known name. Messenger's chat key means nothing to a reader, so a message nobody
     * named reads as an unknown chat.
     */
    private String messageLogWho(MessageLog.Entry entry) {
        SettingsText text = page.text;
        MessageLogSearch.Index index = messageLogIndex;
        String picked = index == null ? "" : index.picked(entry.thread);
        if (MessageLogSearch.direct(entry)) {
            String name = !picked.isEmpty() ? picked : !entry.sender.isEmpty() ? entry.sender : index == null ? "" : index.chatName(entry.thread);
            return name.isEmpty() ? text.get("message_log_unknown_thread") : name;
        }
        String chat = !picked.isEmpty() ? picked : !entry.chat.isEmpty() ? entry.chat : index == null ? "" : index.groupName(entry.thread);
        if (entry.sender.isEmpty()) return chat.isEmpty() ? text.get("message_log_unknown_thread") : chat;
        return chat.isEmpty() ? entry.sender : text.get("message_log_in_group", entry.sender, chat);
    }

    /**
     * The Play button on a voice message's card. It opens and plays the clip off the main thread, turns into Stop while
     * the clip runs, and says so in its place when the clip can't be played.
     */
    private void messageLogClipRow(LinearLayout card, String name) {
        SettingsUi ui = ui();
        SettingsText text = page.text;
        Button play = messageLogPlay(text.get(MessageLogClip.playing(name) ? "message_log_clip_stop" : "message_log_clip_play"));
        play.setTag("message_log_clip");
        card.addView(play, messageLogPlayParams(ui));
        TextView missing = ui.text(text.get("message_log_clip_missing"), 13, ui.muted, false);
        missing.setTag("message_log_clip_missing");
        missing.setVisibility(View.GONE);
        ui.add(card, missing, 4);
        Context context = page.getApplicationContext();
        LinearLayout results = messageLogResults;
        play.setOnClickListener(clicked -> {
            if (MessageLogClip.playing(name)) {
                MessageLogClip.stop();
                return;
            }
            play.setEnabled(false);
            MESSAGE_LOG_PICTURES.execute(() -> {
                boolean started = MessageLogClip.play(context, name, () -> page.runOnUiThread(() -> {
                    if (messageLogResults != results || page.isFinishing() || page.isDestroyed()) return;
                    play.setText(text.get("message_log_clip_play"));
                }));
                page.runOnUiThread(() -> {
                    if (messageLogResults != results || page.isFinishing() || page.isDestroyed()) return;
                    play.setEnabled(true);
                    play.setText(text.get(started ? "message_log_clip_stop" : "message_log_clip_play"));
                    if (!started) missing.setVisibility(View.VISIBLE);
                });
            });
        });
    }

    /** The Play button on a video message's card. The video plays over the log, in a window of its own. */
    private void messageLogVideoRow(LinearLayout card, String name) {
        Button play = messageLogPlay(page.text.get("message_log_video_play"));
        play.setTag("message_log_video");
        card.addView(play, messageLogPlayParams(ui()));
        play.setOnClickListener(clicked -> showMessageLogVideo(name));
    }

    /** A voice message's or video's Play, a grey chip under its bubble with the words in the link color. */
    private Button messageLogPlay(String title) {
        Button play = messageLogChip(title, false);
        play.setTextColor(new android.content.res.ColorStateList(new int[][] {{-android.R.attr.state_enabled}, {}},
            new int[] {(look().muted & 0x00ffffff) | 0x99000000, look().link}));
        return play;
    }

    private static LinearLayout.LayoutParams messageLogPlayParams(SettingsUi ui) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-2, -2);
        params.topMargin = ui.dp(2);
        return params;
    }

    /**
     * Plays the video kept under [name] in its own window over the log, from the log's sealed copy, with nothing written
     * out in the clear. The window takes the shape of the video once its size is known, and closing it stops playback,
     * as does closing the log.
     */
    private void showMessageLogVideo(String name) {
        if (page.isFinishing() || page.isDestroyed() || messageLogVideoDialog != null) return;
        SettingsUi ui = ui();
        SettingsText text = page.text;
        SettingsDialog sheet = new SettingsDialog(page, ui, text, text.get("message_log_video_title"),
            text.get("message_log_video_hint"));
        Dialog dialog = sheet.dialog;
        messageLogVideoDialog = dialog;
        // The log's own window is kept out of screenshots before Android 13, so the video's is too.
        if (Build.VERSION.SDK_INT < 33 && dialog.getWindow() != null) {
            dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        }
        SurfaceView screen = new SurfaceView(page);
        screen.setTag("message_log_video_screen");
        sheet.body.addView(screen, new LinearLayout.LayoutParams(-1, ui.dp(220)));
        TextView missing = ui.text(text.get("message_log_video_missing"), 13, ui.muted, false);
        missing.setTag("message_log_video_missing");
        missing.setVisibility(View.GONE);
        ui.add(sheet.body, missing, 8);
        dialog.setOnDismissListener(dismissed -> {
            MessageLogClip.stop();
            if (messageLogVideoDialog == dismissed) messageLogVideoDialog = null;
        });
        Button close = ui.primaryButton(text.get("message_log_close"));
        close.setTag("message_log_video_close");
        close.setOnClickListener(clicked -> dialog.dismiss());
        sheet.action(close);
        screen.getHolder().addCallback(new SurfaceHolder.Callback() {
            @Override public void surfaceCreated(SurfaceHolder holder) {
                playMessageLogVideo(name, holder.getSurface(), screen, missing, dialog);
            }
            @Override public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {}
            @Override public void surfaceDestroyed(SurfaceHolder holder) {
                MessageLogClip.stop();
            }
        });
        sheet.show();
    }

    /** Opens the video off the main thread and plays it onto [surface]. One that can't be played says so in its place. */
    private void playMessageLogVideo(String name, android.view.Surface surface, SurfaceView screen, TextView missing, Dialog dialog) {
        Context context = page.getApplicationContext();
        MESSAGE_LOG_PICTURES.execute(() -> {
            boolean started = MessageLogClip.play(context, name, surface,
                (width, height) -> page.runOnUiThread(() -> fitMessageLogVideo(screen, dialog, width, height)),
                () -> page.runOnUiThread(() -> {
                    if (messageLogVideoDialog == dialog) dialog.dismiss();
                }));
            if (started) return;
            page.runOnUiThread(() -> {
                if (page.isFinishing() || page.isDestroyed() || messageLogVideoDialog != dialog) return;
                screen.setVisibility(View.GONE);
                missing.setVisibility(View.VISIBLE);
            });
        });
    }

    /** Gives the video's window the shape of the video, so a portrait clip isn't stretched across a landscape box. */
    private void fitMessageLogVideo(SurfaceView screen, Dialog dialog, int width, int height) {
        if (messageLogVideoDialog != dialog || width <= 0 || height <= 0) return;
        int across = screen.getWidth();
        if (across <= 0) return;
        android.view.ViewGroup.LayoutParams params = screen.getLayoutParams();
        params.height = Math.max(1, (int) ((long) across * height / width));
        screen.setLayoutParams(params);
    }

    /** Opens the picture off the main thread and shows it once it's ready. One that can't be opened says so in its place. */
    private void showMessageLogPicture(ImageView view, TextView missing, String name) {
        Context context = page.getApplicationContext();
        int width = page.getResources().getDisplayMetrics().widthPixels;
        LinearLayout results = messageLogResults;
        MESSAGE_LOG_PICTURES.execute(() -> {
            android.graphics.Bitmap picture = null;
            try {
                picture = MessageLogMedia.picture(context, name, width);
            } catch (Exception unreadable) {
                Settings.hookFailedPrivately(MessageLog.KEY, "Can't open a photo in the message log", unreadable);
            }
            android.graphics.Bitmap shown = picture;
            page.runOnUiThread(() -> {
                if (messageLogResults != results || page.isFinishing() || page.isDestroyed()) return;
                if (shown == null) {
                    missing.setVisibility(View.VISIBLE);
                    return;
                }
                view.setImageBitmap(shown);
                view.setVisibility(View.VISIBLE);
            });
        });
    }

    /**
     * One chat in the by-chat view, as a row of Messenger's chat list: the chat's face, its name with when it last
     * spoke, and its newest message under them. Tapping it narrows the log to that chat.
     */
    private View messageLogChat(MessageLogSearch.Chat chat) {
        SettingsUi ui = ui();
        MessageLogLook look = look();
        SettingsText text = page.text;
        LinearLayout card = ui.row();
        card.setTag("message_log_chat");
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setBackground(ui.interactive(0, 0, 12));
        card.setPadding(ui.dp(8), ui.dp(8), ui.dp(8), ui.dp(8));
        card.setMinimumHeight(ui.dp(72));
        boolean group = !chat.thread.isEmpty() && !ChatNotifications.oneToOne(chat.thread);
        card.addView(messageLogFaceView(chat.thread.isEmpty() ? null : MessageLogFaces.chatName(chat.thread), group, 56));

        LinearLayout lines = ui.column();
        LinearLayout.LayoutParams linesParams = new LinearLayout.LayoutParams(0, -2, 1);
        linesParams.setMarginStart(ui.dp(12));
        card.addView(lines, linesParams);
        LinearLayout top = ui.row();
        top.setGravity(Gravity.CENTER_VERTICAL);
        String called = chat.name.isEmpty() ? text.get("message_log_unknown_thread") : chat.name;
        TextView name = ui.text(called, 16, look.text, true);
        name.setSingleLine(true);
        name.setEllipsize(TextUtils.TruncateAt.END);
        name.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        top.addView(name, new LinearLayout.LayoutParams(0, -2, 1));
        String since = page.formatSince(chat.latest, "message_log_now", "message_log_ago");
        TextView when = ui.text(since, 13, look.muted, false);
        LinearLayout.LayoutParams whenParams = new LinearLayout.LayoutParams(-2, -2);
        whenParams.setMarginStart(ui.dp(8));
        top.addView(when, whenParams);
        lines.addView(top, new LinearLayout.LayoutParams(-1, -2));

        // A group's newest line says who wrote it, the way Messenger's list does, unless the chat is named after them.
        MessageLog.Entry newest = chat.newest;
        String words = newest.text == null || newest.text.isEmpty() ? text.get(newest.attachment ? "message_log_attachment" : "message_log_no_text") : newest.text;
        boolean saysWho = group && !newest.sender.isEmpty() && !newest.sender.equals(chat.name);
        LinearLayout preview = ui.row();
        if (saysWho) {
            TextView sender = ui.text(newest.sender + ": ", 14, look.muted, false);
            sender.setSingleLine(true);
            sender.setEllipsize(TextUtils.TruncateAt.END);
            sender.setMaxWidth(ui.dp(120));
            preview.addView(sender, new LinearLayout.LayoutParams(-2, -2));
        }
        TextView latest = ui.text(words, 14, look.muted, false);
        latest.setSingleLine(true);
        latest.setEllipsize(TextUtils.TruncateAt.END);
        latest.setTextDirection(View.TEXT_DIRECTION_FIRST_STRONG);
        preview.addView(latest, new LinearLayout.LayoutParams(0, -2, 1));
        ui.add(lines, preview, 4);

        // The row is read out as one: the chat, how many messages the log holds from it and when, then the newest.
        card.setContentDescription(called + ". " + text.get("message_log_chat_count", String.valueOf(chat.count)) + ", " + since + ". " +
            (saysWho ? newest.sender + ": " : "") + words);
        card.setFocusable(true);
        card.setOnClickListener(view -> openMessageLogChat(chat.thread));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(2);
        card.setLayoutParams(params);
        return card;
    }

    /**
     * A round face [size] dp across: the picture kept under [name] once it opens, else Messenger's blank one, two of
     * them for a [group]. Null [name] is a chat or sender the log never had a picture for.
     */
    private View messageLogFaceView(String name, boolean group, int size) {
        SettingsUi ui = ui();
        MessageLogFace face = look().face(group);
        View view = new View(page);
        view.setTag("message_log_face");
        view.setBackground(face);
        view.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        view.setLayoutParams(new LinearLayout.LayoutParams(ui.dp(size), ui.dp(size)));
        if (name != null) showMessageLogFace(face, name);
        return view;
    }

    /**
     * Opens the face kept under [name] off the main thread, one at a time with the log's photos, and puts it on [face]
     * and every other row waiting on it. A name with no face stays blank until the log reloads.
     */
    private void showMessageLogFace(MessageLogFace face, String name) {
        Bitmap known = messageLogFaces.get(name);
        if (known != null) {
            face.setPicture(known);
            return;
        }
        if (messageLogNoFace.contains(name)) return;
        List<MessageLogFace> waiting = messageLogFacesWaiting.get(name);
        if (waiting != null) {
            waiting.add(face);
            return;
        }
        waiting = new ArrayList<>();
        waiting.add(face);
        messageLogFacesWaiting.put(name, waiting);
        Context context = page.getApplicationContext();
        long generation = messageLogFaceGeneration;
        MESSAGE_LOG_PICTURES.execute(() -> {
            Bitmap picture = null;
            try {
                picture = MessageLogFaces.picture(context, name);
            } catch (MessageLog.Damaged sealedBefore) {
                // Sealed under a key the log has since replaced: the drawn face stands in until it's kept again.
            } catch (Exception | OutOfMemoryError unreadable) {
                Settings.hookFailedPrivately(MessageLog.KEY, "Can't open a face in the message log", unreadable);
            }
            Bitmap shown = picture;
            page.runOnUiThread(() -> {
                if (generation != messageLogFaceGeneration || page.isFinishing() || page.isDestroyed()) return;
                List<MessageLogFace> faces = messageLogFacesWaiting.remove(name);
                if (shown == null) {
                    messageLogNoFace.add(name);
                    return;
                }
                messageLogFaces.put(name, shown);
                if (faces != null) for (MessageLogFace each : faces) each.setPicture(shown);
            });
        });
    }

    /** Drops the opened faces, so a closed log holds none and a reloaded one opens them again. */
    private void forgetMessageLogFaces() {
        messageLogFaceGeneration++;
        messageLogFaces.clear();
        messageLogFacesWaiting.clear();
        messageLogNoFace.clear();
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
        int kind = messageLogKind;
        Context context = page.getApplicationContext();
        MessageLogExport.Labels labels = new MessageLogExport.Labels(page.text);
        MESSAGE_LOG_WORK.execute(() -> {
            int saved = -1;
            try {
                saved = MessageLogExport.save(context, document, format, query, thread, unsentOnly, kind, labels);
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
            MessageLog.Cleared removed = job.removed;
            job.removed = null;
            if (page.started && job.undoable && job.cleared && removed != null && !removed.removed.isEmpty()) {
                page.offerUndo(page.text.format("message_log_clear"), () -> restoreMessageLog(removed));
                messageLogUndo = true;
            }
        }
        if (messageLogList != null) loadMessageLog();
    }

    /** Undo for Clear log: writes back the copy the clear kept, off the main thread, ahead of anything logged since. */
    private void restoreMessageLog(MessageLog.Cleared removed) {
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
        /** What the clear took, with its chat names and pictures, until the page hands it to Undo. */
        MessageLog.Cleared removed;

        MessageLogClearJob(MessageLogSheet sheet) { owner = new java.lang.ref.WeakReference<>(sheet); }

        void start() {
            MESSAGE_LOG_WORK.execute(() -> {
                MessageLog.Cleared result = MessageLog.clearForUndo();
                new android.os.Handler(android.os.Looper.getMainLooper()).post(() -> {
                    cleared = result.cleared;
                    removed = result;
                    finished = true;
                    MessageLogSheet sheet = owner.get();
                    if (sheet != null) sheet.messageLogCleared(this);
                });
            });
        }
    }
}
