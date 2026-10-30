package app.hushmessenger.extension;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Auto reply's button under its switch and the sheet that edits the replies: a card per reply, each with an optional
 * picture copied from the phone's picker. One per settings page. Unsaved edits ride along in the page's saved state.
 */
final class AutoReplySheet {
    private final SettingsActivity page;
    private Dialog autoReplyDialog;
    private LinearLayout autoReplyList;
    private android.widget.CheckBox autoReplyGroups;
    private TextView autoReplyCount;
    private Button autoReplyAdd;
    private ScrollView autoReplyScroll;
    /** The picture each reply card holds, by card, until Save. */
    private final java.util.WeakHashMap<View, String> autoReplyPictures = new java.util.WeakHashMap<>();
    private final java.util.WeakHashMap<View, String> autoReplyCardIds = new java.util.WeakHashMap<>();
    private final java.util.Map<View, AutoReplyPicture.Import> autoReplyPictureOps = new java.util.HashMap<>();
    /** Each copy's deadline, posted with its Import as the token. */
    private final android.os.Handler autoReplyDeadlines = new android.os.Handler(android.os.Looper.getMainLooper());
    private Button autoReplySave;
    /** The card whose picture is being picked, by position, or -1. */
    private int autoReplyPictureFor = -1;
    private String autoReplyPictureId;
    /** A picked picture that came back while the sheet was being rebuilt, and the card it's for. */
    private android.net.Uri pendingAutoReplyPicture;
    private int pendingAutoReplyPictureFor = -1;
    private String pendingAutoReplyPictureId;

    AutoReplySheet(SettingsActivity page) {
        this.page = page;
    }

    /** The card a picker was open for when the page was recreated. Its answer arrives before the sheet is back. */
    void restorePick(Bundle draft) {
        autoReplyPictureFor = draft.getInt("picture_for", -1);
        autoReplyPictureId = draft.getString("picture_for_id");
    }

    void destroy() {
        invalidateAutoReplyImports();
        if (autoReplyDialog != null) autoReplyDialog.dismiss();
    }

    /** The picture picker's answer. Copied for the card it was opened from, once the sheet is up. */
    void pictureResult(int result, Intent data) {
        int index = autoReplyPictureFor;
        String cardId = autoReplyPictureId;
        autoReplyPictureFor = -1;
        autoReplyPictureId = null;
        if (index < 0 && cardId == null) return;
        if (result != android.app.Activity.RESULT_OK || data == null || data.getData() == null) return;
        android.net.Uri picked = data.getData();
        // Only a provider grant, never a path read with Messenger's own access.
        if (!"content".equals(picked.getScheme())) {
            page.feedback(page.text.get("auto_reply_picture_failed"), Toast.LENGTH_LONG);
            return;
        }
        if (autoReplyList == null) {
            pendingAutoReplyPicture = picked;
            pendingAutoReplyPictureFor = index;
            pendingAutoReplyPictureId = cardId;
        } else {
            copyAutoReplyPicture(picked, index, cardId);
        }
    }

    /** One button under the auto reply switch that opens the replies. */
    void addAutoReplyActions(LinearLayout content) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        LinearLayout actions = ui.row();
        Button edit = ui.button(text.get("auto_reply_edit"));
        edit.setTag("auto_reply_edit");
        edit.setOnClickListener(clicked -> showAutoReplies());
        actions.addView(edit);
        ui.add(content, actions, 8);
    }

    /** Drafts stay in saved instance state until Save commits them or Cancel discards them. */
    private void showAutoReplies() { showAutoReplies(null); }

    void showAutoReplies(Bundle draft) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        SharedPreferences prefs = Settings.preferences;
        if (prefs == null || page.isFinishing() || page.isDestroyed() || autoReplyDialog != null) return;
        SettingsDialog sheet = new SettingsDialog(page, ui, text, text.get("auto_reply_title"), text.get("auto_reply_hint"));
        Dialog dialog = sheet.dialog;
        autoReplyDialog = dialog;
        autoReplyScroll = sheet.scroll;
        dialog.setOnDismissListener(dismissed -> {
            if (autoReplyDialog != dismissed) return;
            invalidateAutoReplyImports();
            autoReplyDialog = null;
            autoReplyList = null;
            autoReplyGroups = null;
            autoReplyCount = null;
            autoReplyAdd = null;
            autoReplyScroll = null;
            autoReplySave = null;
        });
        if (!Settings.wouldUse(AutoReply.KEY)) {
            TextView status = ui.text(text.get("auto_reply_off"), 14, ui.muted, false);
            status.setPadding(ui.dp(12), ui.dp(12), ui.dp(12), ui.dp(12));
            status.setBackground(ui.shape(ui.surface, ui.line, 12));
            ui.add(sheet.body, status, 0);
        }
        LinearLayout listHeading = ui.row();
        if (ui.largeText) listHeading.setOrientation(LinearLayout.VERTICAL);
        autoReplyCount = ui.text("", 13, ui.muted, true);
        autoReplyCount.setTag("auto_reply_count");
        autoReplyCount.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        listHeading.addView(autoReplyCount, new LinearLayout.LayoutParams(ui.largeText ? -1 : 0, -2, ui.largeText ? 0 : 1));
        autoReplyAdd = ui.button(text.get("auto_reply_add"));
        autoReplyAdd.setTag("auto_reply_add");
        listHeading.addView(autoReplyAdd, new LinearLayout.LayoutParams(ui.largeText ? -1 : -2, -2));
        ui.add(sheet.body, listHeading, 12);
        LinearLayout list = ui.column();
        autoReplyList = list;
        ui.add(sheet.body, list, 0);
        ArrayList<String> words = draft == null ? null : draft.getStringArrayList("words");
        ArrayList<String> replies = draft == null ? null : draft.getStringArrayList("replies");
        if (words != null && replies != null) {
            ArrayList<String> pictures = draft.getStringArrayList("pictures");
            ArrayList<String> ids = draft.getStringArrayList("card_ids");
            for (int i = 0; i < Math.min(AutoReply.MAX_RULES, Math.min(words.size(), replies.size())); i++) {
                String picture = pictures != null && i < pictures.size() ? pictures.get(i) : null;
                View card = autoReplyCard(list, new AutoReply.Rule("", "", picture));
                if (ids != null && i < ids.size() && ids.get(i) != null) autoReplyCardIds.put(card, ids.get(i));
                ((EditText) card.findViewWithTag("auto_reply_when")).setText(words.get(i));
                ((EditText) card.findViewWithTag("auto_reply_reply")).setText(replies.get(i));
                list.addView(card);
            }
        } else {
            for (AutoReply.Rule rule : AutoReply.rules(prefs)) list.addView(autoReplyCard(list, rule));
            if (list.getChildCount() == 0) list.addView(autoReplyCard(list, new AutoReply.Rule("", "")));
        }
        android.widget.CheckBox groups = new android.widget.CheckBox(page);
        autoReplyGroups = groups;
        groups.setTag("auto_reply_groups");
        groups.setText(text.get("auto_reply_groups"));
        groups.setTextSize(15);
        groups.setTextColor(ui.text);
        groups.setButtonTintList(new android.content.res.ColorStateList(new int[][] {{android.R.attr.state_checked}, {}}, new int[] {ui.accent, ui.outline}));
        groups.setMinHeight(ui.dp(48));
        groups.setPadding(ui.dp(4), ui.dp(8), ui.dp(4), ui.dp(8));
        groups.setBackground(ui.interactive(0, 0, 8));
        groups.setChecked(draft == null ? prefs.getBoolean(AutoReply.GROUPS, false) : draft.getBoolean("groups"));
        ui.add(sheet.body, groups, 12);
        autoReplyAdd.setOnClickListener(clicked -> {
            if (list.getChildCount() >= AutoReply.MAX_RULES) return;
            View card = autoReplyCard(list, new AutoReply.Rule("", ""));
            list.addView(card);
            refreshReplyCount();
            View field = card.findViewWithTag("auto_reply_when");
            field.requestFocus();
            field.post(() -> field.requestRectangleOnScreen(new Rect(0, 0, field.getWidth(), field.getHeight()), false));
        });
        Button cancel = ui.button(text.get("auto_reply_cancel"));
        cancel.setTag("auto_reply_cancel");
        cancel.setOnClickListener(clicked -> {
            invalidateAutoReplyImports();
            pruneAutoReplyPictures(prefs);
            dialog.dismiss();
        });
        // Back or a tap outside throws the edits away like Cancel. The dismiss listener can't do this: it also runs
        // when the screen is rebuilt with the edits kept as a draft.
        dialog.setOnCancelListener(canceled -> {
            invalidateAutoReplyImports();
            pruneAutoReplyPictures(prefs);
        });
        sheet.action(cancel);
        Button save = ui.primaryButton(text.get("auto_reply_save"));
        autoReplySave = save;
        save.setTag("auto_reply_save");
        save.setOnClickListener(clicked -> {
            if (!autoReplyPictureOps.isEmpty()) {
                page.feedback(text.get("auto_reply_picture_copying"), Toast.LENGTH_SHORT);
                return;
            }
            List<AutoReply.Rule> rules = new ArrayList<>();
            EditText firstInvalid = null;
            for (int i = 0; i < list.getChildCount(); i++) {
                View card = list.getChildAt(i);
                EditText when = card.findViewWithTag("auto_reply_when"), reply = card.findViewWithTag("auto_reply_reply");
                AutoReply.Rule rule = new AutoReply.Rule(when.getText().toString(), reply.getText().toString(), autoReplyPictures.get(card));
                // A picture only asks for a reply where its row shows. Without the row the card looks blank and goes like one.
                boolean pictureShown = rule.picture != null && card.findViewWithTag("auto_reply_picture_thumb") != null;
                if ((!rule.when.isEmpty() || pictureShown) && rule.reply.isEmpty()) {
                    TextView error = card.findViewWithTag("auto_reply_error");
                    error.setVisibility(View.VISIBLE);
                    reply.setBackground(ui.interactive(ui.surface, ui.error, 12, ui.error));
                    if (Build.VERSION.SDK_INT >= 30) reply.setStateDescription(text.get("auto_reply_required"));
                    if (firstInvalid == null) firstInvalid = reply;
                }
                rules.add(rule);
            }
            if (firstInvalid != null) {
                firstInvalid.requestFocus();
                firstInvalid.requestRectangleOnScreen(new Rect(0, 0, firstInvalid.getWidth(), firstInvalid.getHeight()), false);
                firstInvalid.announceForAccessibility(text.get("auto_reply_required"));
                return;
            }
            invalidateAutoReplyImports();
            int kept = AutoReply.save(prefs, rules, groups.isChecked());
            pruneAutoReplyPictures(prefs);
            page.feedback(kept == 0 ? text.get("auto_reply_saved_none") : text.get("auto_reply_saved", kept), Toast.LENGTH_SHORT);
            dialog.dismiss();
        });
        sheet.action(save);
        refreshReplyCount();
        sheet.show();
        if (draft != null) sheet.post(() -> {
            int index = draft.getInt("focus_index", -1);
            String tag = draft.getString("focus_tag");
            if (index >= 0 && index < list.getChildCount() && tag != null) {
                EditText field = list.getChildAt(index).findViewWithTag(tag);
                if (field != null) {
                    field.requestFocus();
                    int length = field.length();
                    field.setSelection(Math.max(0, Math.min(length, draft.getInt("selection_start", length))),
                        Math.max(0, Math.min(length, draft.getInt("selection_end", length))));
                }
            }
            sheet.scroll.scrollTo(0, draft.getInt("scroll"));
        });
        if (pendingAutoReplyPicture != null) {
            android.net.Uri picked = pendingAutoReplyPicture;
            pendingAutoReplyPicture = null;
            copyAutoReplyPicture(picked, pendingAutoReplyPictureFor, pendingAutoReplyPictureId);
            pendingAutoReplyPictureId = null;
        }
    }

    /** Deletes picture copies no saved reply uses: the ones picked and then discarded, or swapped for another. */
    private void pruneAutoReplyPictures(SharedPreferences prefs) {
        Set<String> keep = new java.util.HashSet<>();
        for (AutoReply.Rule rule : AutoReply.rules(prefs)) if (rule.picture != null) keep.add(rule.picture);
        try {
            AutoReplyPicture.prune(page.getApplicationContext(), keep);
        } catch (RuntimeException failed) {
            android.util.Log.w("HushMessenger", "auto_reply: unused pictures weren't cleared", failed);
        }
    }

    /** The picture part of a reply card: a thumbnail, a line saying what happens, and pick and remove buttons. */
    private void autoReplyPictureRow(LinearLayout card, String picture) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        ui.add(card, ui.text(text.get("auto_reply_picture"), 14, ui.text, true), 16);
        LinearLayout shown = ui.row();
        shown.setGravity(Gravity.CENTER_VERTICAL);
        android.widget.ImageView thumb = new android.widget.ImageView(page);
        thumb.setTag("auto_reply_picture_thumb");
        thumb.setScaleType(android.widget.ImageView.ScaleType.CENTER_CROP);
        thumb.setContentDescription(text.get("auto_reply_picture_thumb"));
        LinearLayout.LayoutParams square = new LinearLayout.LayoutParams(ui.dp(56), ui.dp(56));
        square.setMarginEnd(ui.dp(12));
        shown.addView(thumb, square);
        TextView status = ui.text("", 13, ui.muted, false);
        status.setTag("auto_reply_picture_status");
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        shown.addView(status, new LinearLayout.LayoutParams(0, -2, 1));
        ui.add(card, shown, 8);
        LinearLayout buttons = ui.row();
        if (ui.largeText) buttons.setOrientation(LinearLayout.VERTICAL);
        buttons.setGravity(Gravity.END);
        Button pick = ui.button(text.get("auto_reply_picture_pick"));
        pick.setTag("auto_reply_picture_pick");
        pick.setOnClickListener(clicked -> pickAutoReplyPicture(card));
        buttons.addView(pick);
        Button clear = ui.button(text.get("auto_reply_picture_clear"));
        clear.setTag("auto_reply_picture_clear");
        clear.setOnClickListener(clicked -> {
            invalidateAutoReplyImport(card);
            setAutoReplyPicture(card, null);
            pick.requestFocus();
        });
        LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(-2, -2);
        if (ui.largeText) gap.topMargin = ui.dp(8);
        else gap.setMarginStart(ui.dp(8));
        buttons.addView(clear, gap);
        ui.add(card, buttons, 8);
        setAutoReplyPicture(card, picture);
    }

    /** Shows [name] on its card. The file stays until Save or Cancel, so a draft can still bring it back. */
    private void setAutoReplyPicture(View card, String name) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        String picture = AutoReplyPicture.validName(name) ? name : null;
        autoReplyPictures.put(card, picture);
        android.widget.ImageView thumb = card.findViewWithTag("auto_reply_picture_thumb");
        if (thumb == null) return;
        android.graphics.Bitmap small = picture == null ? null : AutoReplyPicture.thumbnail(page, picture, ui.dp(56));
        thumb.setImageBitmap(small);
        thumb.setVisibility(small == null ? View.GONE : View.VISIBLE);
        ((TextView) card.findViewWithTag("auto_reply_picture_status")).setText(text.get(picture == null ? "auto_reply_picture_none" :
            small == null ? "auto_reply_picture_missing" : "auto_reply_picture_set"));
        ((Button) card.findViewWithTag("auto_reply_picture_pick")).setText(text.get(picture == null ? "auto_reply_picture_pick" : "auto_reply_picture_change"));
        card.findViewWithTag("auto_reply_picture_clear").setVisibility(picture == null ? View.GONE : View.VISIBLE);
    }

    private void pickAutoReplyPicture(View card) {
        SettingsText text = page.text;
        if (autoReplyList == null) return;
        invalidateAutoReplyImport(card);
        setAutoReplyPicture(card, autoReplyPictures.get(card));
        autoReplyPictureFor = autoReplyList.indexOfChild(card);
        autoReplyPictureId = autoReplyCardIds.get(card);
        Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("image/*");
        try { page.startActivityForResult(picker, SettingsActivity.PICK_AUTO_REPLY_PICTURE); }
        catch (android.content.ActivityNotFoundException missing) {
            autoReplyPictureFor = -1;
            autoReplyPictureId = null;
            page.feedback(text.get("auto_reply_picture_no_picker"), Toast.LENGTH_LONG);
        }
        catch (RuntimeException error) {
            autoReplyPictureFor = -1;
            autoReplyPictureId = null;
            page.feedback(text.get("auto_reply_picture_failed"), Toast.LENGTH_LONG);
        }
    }

    /** Copies a selection only for its original card and current operation. */
    private void copyAutoReplyPicture(android.net.Uri uri, int index, String cardId) {
        SettingsText text = page.text;
        if (cardId != null && autoReplyList != null) {
            index = -1;
            for (int i = 0; i < autoReplyList.getChildCount(); i++)
                if (cardId.equals(autoReplyCardIds.get(autoReplyList.getChildAt(i)))) { index = i; break; }
        }
        if (autoReplyList == null || index < 0 || index >= autoReplyList.getChildCount()) return;
        View card = autoReplyList.getChildAt(index);
        AutoReplyPicture.Import operation = new AutoReplyPicture.Import();
        cancelAutoReplyImport(autoReplyPictureOps.put(card, operation));
        updateAutoReplySave();
        TextView status = card.findViewWithTag("auto_reply_picture_status");
        if (status != null) status.setText(text.get("auto_reply_picture_copying"));
        View clear = card.findViewWithTag("auto_reply_picture_clear");
        if (clear != null) clear.setVisibility(View.VISIBLE);
        Context app = page.getApplicationContext();
        Runnable worker = () -> {
            String name = null;
            AutoReplyPicture.Failure.Kind why = null;
            try {
                name = AutoReplyPicture.copy(app, uri, operation);
            } catch (AutoReplyPicture.Failure failed) {
                android.util.Log.w("HushMessenger", "auto_reply: the picked picture wasn't copied, " + failed.getMessage());
                why = failed.kind;
            } catch (java.io.IOException | RuntimeException | OutOfMemoryError failed) {
                android.util.Log.w("HushMessenger", "auto_reply: the picked picture couldn't be copied, " + failed.getClass().getName());
                why = AutoReplyPicture.Failure.Kind.UNREADABLE;
            }
            String copied = name;
            AutoReplyPicture.Failure.Kind reason = why;
            page.runOnUiThread(() -> placeAutoReplyPicture(card, operation, copied, reason));
        };
        // The worker checks the same deadline, but a picker stuck in open() only stops when this gives up on it.
        autoReplyDeadlines.postAtTime(() -> {
            if (autoReplyPictureOps.get(card) != operation) return;
            operation.cancel();
            placeAutoReplyPicture(card, operation, null, AutoReplyPicture.Failure.Kind.TOO_SLOW);
        }, operation, android.os.SystemClock.uptimeMillis() + AutoReplyPicture.DEADLINE_MS);
        try { AutoReplyPicture.submit(operation, worker); }
        catch (java.util.concurrent.RejectedExecutionException busy) {
            placeAutoReplyPicture(card, operation, null, AutoReplyPicture.Failure.Kind.TOO_SLOW);
        }
    }

    private void placeAutoReplyPicture(View card, AutoReplyPicture.Import operation, String name, AutoReplyPicture.Failure.Kind why) {
        SettingsText text = page.text;
        autoReplyDeadlines.removeCallbacksAndMessages(operation);
        if (page.isFinishing() || page.isDestroyed() || autoReplyList == null || autoReplyList.indexOfChild(card) < 0 ||
                autoReplyPictureOps.get(card) != operation) {
            discardAutoReplyPicture(name);
            return;
        }
        autoReplyPictureOps.remove(card);
        updateAutoReplySave();
        if (name == null) page.feedback(text.get(why == AutoReplyPicture.Failure.Kind.TOO_BIG ? "auto_reply_picture_too_big"
            : why == AutoReplyPicture.Failure.Kind.TOO_SLOW ? "auto_reply_picture_too_slow" : "auto_reply_picture_failed"), Toast.LENGTH_LONG);
        setAutoReplyPicture(card, name == null ? autoReplyPictures.get(card) : name);
    }

    /** Stops a replaced or abandoned copy, so it drops its queue slot, its picker stream and the card it holds. */
    private void cancelAutoReplyImport(AutoReplyPicture.Import operation) {
        if (operation == null) return;
        autoReplyDeadlines.removeCallbacksAndMessages(operation);
        operation.cancel();
    }

    private void updateAutoReplySave() {
        if (autoReplySave != null) autoReplySave.setEnabled(autoReplyPictureOps.isEmpty());
    }

    private void invalidateAutoReplyImport(View card) {
        cancelAutoReplyImport(autoReplyPictureOps.remove(card));
        if (autoReplyPictureId != null && autoReplyPictureId.equals(autoReplyCardIds.get(card))) {
            autoReplyPictureId = null;
            autoReplyPictureFor = -1;
        }
        updateAutoReplySave();
    }

    void invalidateAutoReplyImports() {
        for (AutoReplyPicture.Import operation : autoReplyPictureOps.values()) cancelAutoReplyImport(operation);
        autoReplyPictureOps.clear();
        autoReplyPictureFor = -1;
        autoReplyPictureId = null;
        pendingAutoReplyPicture = null;
        pendingAutoReplyPictureId = null;
        updateAutoReplySave();
    }

    private void discardAutoReplyPicture(String name) {
        if (name == null || autoReplyPictures.containsValue(name)) return;
        if (Settings.preferences != null) for (AutoReply.Rule rule : AutoReply.rules(Settings.preferences))
            if (name.equals(rule.picture)) return;
        java.io.File orphan = AutoReplyPicture.fileFor(page.getApplicationContext(), name);
        if (orphan != null && orphan.exists() && !orphan.delete())
            android.util.Log.w("HushMessenger", "auto_reply: an unused picture couldn't be deleted");
    }

    private void refreshReplyCount() {
        SettingsText text = page.text;
        if (autoReplyList == null) return;
        int count = autoReplyList.getChildCount();
        autoReplyCount.setText(text.get("auto_reply_count", text.number(count), text.number(AutoReply.MAX_RULES)));
        autoReplyAdd.setEnabled(count < AutoReply.MAX_RULES);
        for (int i = 0; i < count; i++) {
            View card = autoReplyList.getChildAt(i);
            ((TextView) card.findViewWithTag("auto_reply_number")).setText(text.get("auto_reply_number", text.number(i + 1)));
            card.findViewWithTag("auto_reply_remove").setContentDescription(text.get("auto_reply_remove_number", text.number(i + 1)));
        }
    }

    private View autoReplyCard(LinearLayout list, AutoReply.Rule rule) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        LinearLayout card = ui.column();
        autoReplyCardIds.put(card, java.util.UUID.randomUUID().toString());
        card.setBackground(ui.shape(ui.surface, ui.line, 12));
        card.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(12));
        TextView number = ui.text("", 13, ui.accent, true);
        number.setTag("auto_reply_number");
        number.setAccessibilityHeading(true);
        card.addView(number);
        EditText when = replyField(card, "auto_reply_when", text.get("auto_reply_when"), text.get("auto_reply_when_hint"), rule.when, AutoReply.MAX_WHEN_CHARS, true);
        ui.add(card, ui.text(text.get("auto_reply_any"), 13, ui.muted, false), 6);
        EditText reply = replyField(card, "auto_reply_reply", text.get("auto_reply_reply"), text.get("auto_reply_reply_hint"), rule.reply, AutoReply.MAX_REPLY_CHARS, false);
        TextView error = ui.text(text.get("auto_reply_required"), 13, ui.error, false);
        error.setTag("auto_reply_error");
        error.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        error.setVisibility(View.GONE);
        ui.add(card, error, 6);
        TextWatcher clearError = new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                if (error.getVisibility() != View.VISIBLE) return;
                error.setVisibility(View.GONE);
                reply.setBackground(ui.interactive(ui.surface, ui.outline, 12));
                if (Build.VERSION.SDK_INT >= 30) reply.setStateDescription(null);
            }
            @Override public void afterTextChanged(Editable value) { }
        };
        when.addTextChangedListener(clearError);
        reply.addTextChangedListener(clearError);
        // Without the row the card still carries its picture, so Save doesn't drop it and prune doesn't delete the file.
        if (AutoReplyPicture.supported()) autoReplyPictureRow(card, rule.picture);
        else setAutoReplyPicture(card, rule.picture);
        LinearLayout row = ui.row();
        row.setGravity(Gravity.END);
        Button remove = ui.button(text.get("auto_reply_remove"));
        remove.setTag("auto_reply_remove");
        remove.setOnClickListener(clicked -> {
            int index = list.indexOfChild(card);
            invalidateAutoReplyImport(card);
            autoReplyPictures.remove(card);
            autoReplyCardIds.remove(card);
            list.removeView(card);
            refreshReplyCount();
            if (list.getChildCount() == 0) autoReplyAdd.requestFocus();
            else list.getChildAt(Math.min(index, list.getChildCount() - 1)).findViewWithTag("auto_reply_when").requestFocus();
        });
        row.addView(remove);
        ui.add(card, row, 12);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = ui.dp(12);
        card.setLayoutParams(params);
        return card;
    }

    private EditText replyField(LinearLayout card, String tag, String title, String hint, String value, int max, boolean singleLine) {
        SettingsUi ui = page.ui;
        EditText field = ui.field(hint, max, singleLine);
        field.setTag(tag);
        field.setText(value);
        if (!singleLine) {
            field.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_CAP_SENTENCES |
                android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE);
            field.setMinLines(2);
            // The sheet owns vertical scrolling, so long replies grow instead of trapping drags in a nested editor.
            field.setGravity(Gravity.TOP | Gravity.START);
        }
        TextView label = ui.text(title, 14, ui.text, true);
        label.setLabelFor(field.getId());
        ui.add(card, label, 16);
        ui.add(card, field, 8);
        return field;
    }

    Bundle autoReplyDraft() {
        if (autoReplyDialog == null || autoReplyList == null) return null;
        Bundle draft = new Bundle();
        ArrayList<String> words = new ArrayList<>(), replies = new ArrayList<>(), pictures = new ArrayList<>(), ids = new ArrayList<>();
        for (int i = 0; i < autoReplyList.getChildCount(); i++) {
            View card = autoReplyList.getChildAt(i);
            EditText when = card.findViewWithTag("auto_reply_when"), reply = card.findViewWithTag("auto_reply_reply");
            words.add(when.getText().toString());
            replies.add(reply.getText().toString());
            String picture = autoReplyPictures.get(card);
            pictures.add(picture == null ? "" : picture);
            ids.add(autoReplyCardIds.get(card));
            EditText focused = when.hasFocus() ? when : reply.hasFocus() ? reply : null;
            if (focused != null) {
                draft.putInt("focus_index", i);
                draft.putString("focus_tag", (String) focused.getTag());
                draft.putInt("selection_start", focused.getSelectionStart());
                draft.putInt("selection_end", focused.getSelectionEnd());
            }
        }
        draft.putStringArrayList("words", words);
        draft.putStringArrayList("replies", replies);
        draft.putStringArrayList("pictures", pictures);
        draft.putStringArrayList("card_ids", ids);
        draft.putInt("picture_for", autoReplyPictureFor);
        draft.putString("picture_for_id", autoReplyPictureId);
        draft.putBoolean("groups", autoReplyGroups.isChecked());
        draft.putInt("scroll", autoReplyScroll.getScrollY());
        return draft;
    }
}
