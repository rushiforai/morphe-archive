/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.function.BooleanSupplier;
import java.util.function.Consumer;

import app.hushtumblr.extension.shared.L10n;
import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.tumblr.settings.HushTumblrPreferenceFragment;
import app.hushtumblr.extension.tumblr.settings.ScreenColors;
import app.hushtumblr.extension.tumblr.settings.SpokenLine;

/** Private management and an immediate, nonmodal Undo. No post IDs leave this local screen. */
final class RootPostMuteUi {
    private RootPostMuteUi() {}
    private static WeakReference<View> notice = new WeakReference<>(null);

    static Activity activity(Context context) {
        for (int i = 0; i < 16 && context != null; i++) {
            if (context instanceof Activity) return (Activity) context;
            if (!(context instanceof ContextWrapper)) break;
            Context next = ((ContextWrapper) context).getBaseContext();
            if (next == context) break;
            context = next;
        }
        return null;
    }

    static void changed(Context context, String message, RootPostMutes.Undo undo) {
        changed(context, message, undo, null);
    }

    static void changed(Context context, String message, RootPostMutes.Undo undo, Runnable afterRestore) {
        changed(context, message, undo, afterRestore, null);
    }

    static void recoverMute(Context context, RootPostMutes.Undo saved, String root) {
        changed(context, RootPostMuteStore.validBlogRule(root) ? L10n.t("Couldn't update this feed. The blog rule is still saved.")
                : L10n.t("Couldn't update this feed. The post is still muted locally."), saved, null, root);
    }

    // A list entry is a post or one half of a blog. Each kind gets its own words everywhere it shows.
    static String menuTitle(String entry) {
        if (!RootPostMuteStore.validBlogRule(entry)) return L10n.t("Mute this post locally");
        String blog = L10n.isolate(RootPostMuteStore.ruleBlog(entry));
        return RootPostMuteStore.reblogRule(entry) ? L10n.f("Hide reblogs from %1$s", blog) : L10n.f("Hide originals from %1$s", blog);
    }

    static String mutedMessage(String entry) {
        if (!RootPostMuteStore.validBlogRule(entry)) return L10n.t("Post muted locally");
        String blog = L10n.isolate(RootPostMuteStore.ruleBlog(entry));
        return RootPostMuteStore.reblogRule(entry) ? L10n.f("Hiding reblogs from %1$s", blog) : L10n.f("Hiding originals from %1$s", blog);
    }

    static String removedMessage(String entry) {
        return RootPostMuteStore.validBlogRule(entry) ? L10n.t("Blog rule removed") : L10n.t("Post unmuted");
    }

    private static String rowText(String entry) {
        if (!RootPostMuteStore.validBlogRule(entry)) return L10n.t("Post") + " " + L10n.isolate(entry);
        String blog = L10n.isolate(RootPostMuteStore.ruleBlog(entry));
        return RootPostMuteStore.reblogRule(entry) ? L10n.f("Reblogs from %1$s", blog) : L10n.f("Originals from %1$s", blog);
    }

    private static String rowDescription(String entry) {
        if (!RootPostMuteStore.validBlogRule(entry)) return L10n.f("Unmute post %1$s", L10n.isolate(entry));
        String blog = L10n.isolate(RootPostMuteStore.ruleBlog(entry));
        return RootPostMuteStore.reblogRule(entry) ? L10n.f("Show reblogs from %1$s again", blog) : L10n.f("Show originals from %1$s again", blog);
    }

    private static void changed(Context context, String message, RootPostMutes.Undo undo, Runnable afterRestore, String rootToUnmute) {
        if (undo == null) { Utils.showToastShort(L10n.t("Couldn't update muted posts")); return; }
        Activity activity = activity(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed() || !RootPostMutes.current(undo.account)) return;
        View previous = notice.get();
        if (previous != null && previous.getParent() instanceof ViewGroup) ((ViewGroup) previous.getParent()).removeView(previous);
        ViewGroup root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        Context themed = HushTumblrPreferenceFragment.themed(context);
        UndoPanel bar = new UndoPanel(themed,
                () -> !activity.isFinishing() && !activity.isDestroyed() && RootPostMutes.current(undo.account),
                ignored -> { }, panel -> {
                    root.removeView(panel);
                    if (afterRestore != null) afterRestore.run();
                    Utils.showToastShort(rootToUnmute == null ? L10n.t("Muted posts restored") : removedMessage(rootToUnmute));
                }, root::removeView);
        bar.setLayoutDirection(themed.getResources().getConfiguration().getLayoutDirection());
        int padding = dp(themed, 12);
        bar.setPadding(padding, padding, padding, padding);
        GradientDrawable background = new GradientDrawable();
        background.setColor(ScreenColors.DEFAULT.card);
        background.setCornerRadius(dp(themed, 12));
        background.setStroke(dp(themed, 1), ScreenColors.DEFAULT.outline);
        bar.setBackground(background);
        bar.setElevation(dp(themed, 8));
        bar.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View view) { }
            @Override public void onViewDetachedFromWindow(View view) { bar.close(); }
        });
        Runnable accountChanged = () -> Utils.runOnMainThreadNowOrLater(() -> {
            if (!RootPostMutes.current(undo.account)) { bar.close(); root.removeView(bar); }
        });
        bar.setTag(accountChanged);
        RootPostMutes.addAccountObserver(accountChanged);
        FrameLayout.LayoutParams position = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM);
        position.setMargins(padding, padding, padding, padding * 2);
        root.addView(bar, position);
        notice = new WeakReference<>(bar);
        bar.offer(message, undo, rootToUnmute);
    }

    static AlertDialog manage(Context context) {
        RootPostMutes.Session account = RootPostMutes.capture();
        // A failed read opens the manager too, which says so and offers a retry. A loading account doesn't.
        if (account == null) account = RootPostMutes.unreadable();
        Activity owner = activity(context);
        if (account == null || owner == null || owner.isFinishing() || owner.isDestroyed()) {
            Utils.showToastShort(L10n.t("Muted posts aren't available for this account yet")); return null;
        }
        return new Manager(HushTumblrPreferenceFragment.themed(context), owner, account).dialog;
    }

    /**
     * One scroll surface keeps both the explanation and all private rows reachable at large text
     * sizes. The notice stays outside it, under the rows.
     */
    private static final class Manager {
        final Activity owner;
        final RootPostMutes.Session account;
        final AlertDialog dialog;
        final ListView list;
        final List<String> roots = new ArrayList<>();
        final BaseAdapter rows;
        final TextView help, limits, empty;
        final UndoPanel feedback;
        final Button retry;
        final Runnable accountChanged;
        boolean alive = true, busy;

        Manager(Context context, Activity owner, RootPostMutes.Session account) {
            this.owner = owner;
            this.account = account;
            list = new ListView(context) {
                @Override protected void onMeasure(int width, int height) {
                    int bound = Math.min(dp(getContext(), 420), getResources().getDisplayMetrics().heightPixels / 2);
                    if (MeasureSpec.getMode(height) != MeasureSpec.UNSPECIFIED) bound = Math.min(bound, MeasureSpec.getSize(height));
                    super.onMeasure(width, MeasureSpec.makeMeasureSpec(bound, MeasureSpec.AT_MOST));
                }
            };
            list.setPaddingRelative(dp(context, 16), 0, dp(context, 16), dp(context, 8));
            list.setItemsCanFocus(true);
            list.setDivider(new ColorDrawable(ScreenColors.DEFAULT.outline));
            list.setDividerHeight(dp(context, 1));
            // The notice and its actions sit under the list, outside its scroll, so one showing never
            // moves the rows. In the list, it pushed the row just tapped out of view, and a screen
            // reader's focus went on to the notice and read it again.
            LinearLayout status = new LinearLayout(context);
            status.setOrientation(LinearLayout.VERTICAL);
            status.setPaddingRelative(dp(context, 16), 0, dp(context, 16), 0);
            feedback = new UndoPanel(context, this::ready, value -> {
                setBusy(value);
                if (!value) refreshRows();
            }, ignored -> refreshRows(), ignored -> controls());
            feedback.setVisibility(View.GONE);
            status.addView(feedback);
            retry = new Button(context);
            retry.setTag("root_mute_retry");
            retry.setText(L10n.t("Retry"));
            ScreenColors.DEFAULT.secondaryAction(retry);
            retry.setVisibility(View.GONE);
            retry.setOnClickListener(ignored -> readAgain());
            LinearLayout.LayoutParams retryPosition = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            retryPosition.gravity = Gravity.END;
            status.addView(retry, retryPosition);
            LinearLayout header = new LinearLayout(context);
            header.setOrientation(LinearLayout.VERTICAL);
            help = paragraph(context, L10n.t("Stored only on this device for this Tumblr account. Tap a row to remove it. Up to 500 posts and blog rules are kept per account."));
            help.setTag("root_mute_help");
            header.addView(help);
            // Says the policy only. Which other accounts have a list, or how many, never shows here.
            limits = paragraph(context, L10n.t("This device keeps muted post lists for eight accounts. When a ninth account mutes a post, the list that's gone longest without a change is deleted."));
            limits.setTag("root_mute_limits");
            header.addView(limits);
            empty = paragraph(context, L10n.t("No muted posts or blog rules. Use a post's menu to add one on this device."));
            header.addView(empty);
            list.addHeaderView(header, null, false);
            // The adapter never calls a row off, even during a save. A list moves its key selection
            // off a row that's off, so after a failed unmute a keyboard's next press only found the
            // row again. Clicks check `busy`, and a screen reader hears the row is off from its info.
            rows = new BaseAdapter() {
                @Override public int getCount() { return roots.size(); }
                @Override public String getItem(int position) { return roots.get(position); }
                @Override public long getItemId(int position) { return position; }
                @Override public View getView(int position, View recycled, ViewGroup parent) {
                    TextView row = recycled instanceof TextView ? (TextView) recycled : new TextView(context);
                    String root = getItem(position);
                    row.setText(rowText(root));
                    row.setContentDescription(rowDescription(root));
                    row.setTextSize(16);
                    row.setTextColor(ScreenColors.DEFAULT.title);
                    ScreenColors.startSide(row);
                    row.setSingleLine(false);
                    row.setMaxLines(Integer.MAX_VALUE);
                    row.setGravity(Gravity.CENTER_VERTICAL);
                    row.setPaddingRelative(dp(context, 16), dp(context, 12), dp(context, 16), dp(context, 12));
                    row.setMinimumHeight(dp(context, 56));
                    row.setEnabled(!busy);
                    row.setAlpha(busy ? .38f : 1f);
                    row.setTag(root);
                    row.setBackground(ScreenColors.DEFAULT.interactive(row, ScreenColors.DEFAULT.card, 8));
                    row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                        @Override public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
                            super.onInitializeAccessibilityNodeInfo(host, info);
                            list.onInitializeAccessibilityNodeInfoForItem(host, position + list.getHeaderViewsCount(), info);
                            info.setClassName(Button.class.getName());
                            info.setEnabled(!busy);
                            info.setClickable(!busy);
                            if (!busy) info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
                        }
                        @Override public boolean performAccessibilityAction(View host, int action, android.os.Bundle arguments) {
                            if (action == AccessibilityNodeInfo.ACTION_CLICK) { unmute(root); return true; }
                            return super.performAccessibilityAction(host, action, arguments);
                        }
                    });
                    return row;
                }
            };
            list.setAdapter(rows);
            // On a short screen the notice takes at most half the room and scrolls past it, and the
            // list gives up the rest, so neither shuts the other out.
            ScrollView statusArea = new ScrollView(context) {
                @Override protected void onMeasure(int width, int height) {
                    if (MeasureSpec.getMode(height) != MeasureSpec.UNSPECIFIED) {
                        height = MeasureSpec.makeMeasureSpec(MeasureSpec.getSize(height) / 2, MeasureSpec.AT_MOST);
                    }
                    super.onMeasure(width, height);
                }
            };
            statusArea.setTag("root_mute_status");
            // Its Undo and Retry take keyboard focus. An empty area never does.
            statusArea.setFocusable(false);
            statusArea.addView(status);
            LinearLayout content = new LinearLayout(context);
            content.setOrientation(LinearLayout.VERTICAL);
            content.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            content.addView(statusArea, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            dialog = new AlertDialog.Builder(context).setTitle(L10n.t("Manage muted posts"))
                    .setView(content).setNegativeButton(L10n.t("Done"), null)
                    .setNeutralButton(L10n.t("Clear muted posts"), null).create();
            dialog.setOnDismissListener(ignored -> { alive = false; feedback.close(); });
            list.setOnItemClickListener((parent, view, position, id) -> {
                if (view != null && view.getTag() instanceof String) unmute((String) view.getTag());
            });
            dialog.show();
            ScreenColors.dialog(dialog);
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(ignored -> {
                if (!ready() || busy || roots.isEmpty()) return;
                setBusy(true);
                feedback.busyMessage(L10n.t("Updating muted posts"));
                RootPostMutes.clear(account, undo -> finished(undo, L10n.t("Muted posts cleared")));
            });
            accountChanged = () -> Utils.runOnMainThreadNowOrLater(() -> {
                if (alive && !RootPostMutes.current(account)) {
                    dialog.dismiss();
                    if (!owner.isFinishing() && !owner.isDestroyed()) Utils.showToastLong(L10n.t("The active account changed. Reopen Manage muted posts to see its list."));
                }
            });
            RootPostMutes.addAccountObserver(accountChanged);
            refreshRows();
            accountChanged.run();
        }

        boolean ready() {
            return alive && dialog.isShowing() && !owner.isFinishing() && !owner.isDestroyed() && RootPostMutes.current(account);
        }

        void unmute(String root) {
            if (!ready() || busy || !roots.contains(root)) return;
            setBusy(true);
            feedback.busyMessage(L10n.t("Updating muted posts"));
            RootPostMutes.remove(account, root, undo -> finished(undo, removedMessage(root)));
        }

        void finished(RootPostMutes.Undo undo, String message) {
            if (!ready()) return;
            setBusy(false);
            refreshRows();
            if (undo == null) feedback.message(L10n.t("Couldn't update muted posts. Try again."));
            else feedback.offer(undo.confirmed ? message : L10n.t("Couldn't update muted posts. Try again."), undo);
        }

        /** One read at a time, on the worker. A reply for a closed window or another account is dropped. */
        void readAgain() {
            if (!ready() || busy || RootPostMutes.capture() != null) return;
            setBusy(true);
            feedback.busyMessage(L10n.t("Reading muted posts"));
            RootPostMutes.retry(account, ignored -> {
                if (!ready()) return;
                setBusy(false);
                feedback.settle();
                refreshRows();
                if (RootPostMutes.capture() != null && feedback.token == null) feedback.hide();
            });
        }

        void refreshRows() {
            if (!ready()) return;
            RootPostMutes.Session current = RootPostMutes.capture();
            if (!RootPostMutes.current(account)) return;
            // A list that couldn't be read says so and offers another try. It never shows as empty.
            boolean unread = current == null;
            if (unread) feedback.message(feedback.token == null
                    ? L10n.t("Couldn't read this account's muted posts. Nothing was changed or deleted.")
                    : L10n.t("Couldn't update muted posts. Try again."));
            retry.setVisibility(unread ? View.VISIBLE : View.GONE);
            help.setVisibility(unread ? View.GONE : View.VISIBLE);
            limits.setVisibility(unread ? View.GONE : View.VISIBLE);
            roots.clear();
            if (!unread) roots.addAll(current.roots);
            Collections.reverse(roots);
            empty.setVisibility(unread || !roots.isEmpty() ? View.GONE : View.VISIBLE);
            rows.notifyDataSetChanged();
            controls();
        }

        void setBusy(boolean value) {
            busy = value;
            // Rows only look off, and the list and buttons stay on, as a view switched off lets go
            // of keyboard focus. Their clicks check `busy`.
            feedback.setBusy(value);
            rows.notifyDataSetChanged();
        }

        void controls() {
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(!roots.isEmpty());
        }
    }

    /** A failed write retains recovery. A refused rebind removes only its root, preserving later edits. */
    private static final class UndoPanel extends LinearLayout {
        final TextView label;
        final SpokenLine line;
        final Button undo;
        final BooleanSupplier alive;
        final Consumer<Boolean> busyChanged;
        final Consumer<UndoPanel> restored, expired;
        final Handler handler = new Handler(Looper.getMainLooper());
        final Runnable expire;
        RootPostMutes.Undo token;
        String rootToUnmute;
        boolean closed, busy;

        UndoPanel(Context context, BooleanSupplier alive, Consumer<Boolean> busyChanged,
                  Consumer<UndoPanel> restored, Consumer<UndoPanel> expired) {
            super(context);
            this.alive = alive; this.busyChanged = busyChanged; this.restored = restored; this.expired = expired;
            setOrientation(VERTICAL);
            label = paragraph(context, "");
            label.setTag("root_mute_notice");
            label.setTextColor(ScreenColors.DEFAULT.title);
            // A polite live region, read once per answer without an announcement, which Android 16
            // deprecates.
            line = new SpokenLine(label, () -> setVisibility(VISIBLE));
            addView(label);
            undo = new Button(context);
            undo.setTag("root_mute_undo");
            undo.setText(L10n.t("Undo"));
            ScreenColors.DEFAULT.secondaryAction(undo);
            LinearLayout.LayoutParams action = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            action.gravity = Gravity.END;
            addView(undo, action);
            undo.setVisibility(GONE);
            // Undo never goes away under someone on it. A screen reader's or keyboard's focus there
            // holds it, and its time starts again once they move on.
            expire = () -> {
                if (onUndo()) { scheduleExpiry(); return; }
                clearUndo();
                expired.accept(this);
            };
            undo.setOnClickListener(ignored -> restore());
        }

        /** Says [message] on the next frame. A second call before then replaces it, so it's read once. */
        void message(String message) {
            if (closed) return;
            line.say(message);
        }

        /** Says [message] if the action is still running after a moment. */
        void busyMessage(String message) {
            if (closed) return;
            line.busy(message);
        }

        /** Drops a busy line that hasn't shown yet. */
        void settle() { line.cancel(); }

        void hide() {
            line.cancel();
            setVisibility(GONE);
        }

        void offer(String message, RootPostMutes.Undo value) {
            offer(message, value, null);
        }

        void offer(String message, RootPostMutes.Undo value, String root) {
            token = value;
            rootToUnmute = root;
            undo.setText(root == null || RootPostMuteStore.validBlogRule(root) ? L10n.t("Undo") : L10n.t("Unmute post"));
            undo.setVisibility(VISIBLE);
            message(message);
            scheduleExpiry();
        }

        /** Undo stays on while busy, so keyboard focus stays on it. Its click checks this. */
        void setBusy(boolean value) { busy = value; }

        void restore() {
            RootPostMutes.Undo chosen = token;
            String chosenRoot = rootToUnmute;
            if (closed || getParent() == null || busy || chosen == null || !alive.getAsBoolean() || !RootPostMutes.current(chosen.account)) return;
            handler.removeCallbacks(expire);
            setBusy(true);
            busyChanged.accept(true);
            Consumer<Boolean> completed = success -> {
                if (closed || getParent() == null || token != chosen || !alive.getAsBoolean()) return;
                setBusy(false);
                busyChanged.accept(false);
                if (success) {
                    clearUndo();
                    message(chosenRoot == null ? L10n.t("Muted posts restored") : removedMessage(chosenRoot));
                    restored.accept(this);
                } else {
                    message(L10n.t("Couldn't restore muted posts. Try again."));
                    scheduleExpiry();
                }
            };
            if (chosenRoot == null) RootPostMutes.undo(chosen, completed);
            else RootPostMutes.remove(chosen.account, chosenRoot, receipt -> completed.accept(receipt != null && receipt.confirmed));
        }

        boolean onUndo() {
            if (undo.getVisibility() != VISIBLE || !undo.isAttachedToWindow()) return false;
            if (undo.isFocused() && !undo.isInTouchMode()) return true;
            return undo.createAccessibilityNodeInfo().isAccessibilityFocused();
        }

        void scheduleExpiry() { handler.removeCallbacks(expire); handler.postDelayed(expire, undoTimeout(getContext())); }
        void clearUndo() { handler.removeCallbacks(expire); token = null; rootToUnmute = null; undo.setVisibility(GONE); }
        void close() { closed = true; line.cancel(); clearUndo(); undo.setEnabled(false); }
    }

    private static TextView paragraph(Context context, String text) {
        TextView view = new TextView(context);
        view.setText(text);
        view.setTextSize(14);
        view.setTextColor(ScreenColors.DEFAULT.summary);
        view.setPaddingRelative(0, dp(context, 8), 0, dp(context, 12));
        return view;
    }

    private static int undoTimeout(Context context) {
        AccessibilityManager accessibility = context.getSystemService(AccessibilityManager.class);
        if (accessibility == null) return 10000;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) return accessibility.getRecommendedTimeoutMillis(10000,
                AccessibilityManager.FLAG_CONTENT_TEXT | AccessibilityManager.FLAG_CONTENT_CONTROLS);
        return accessibility.isTouchExplorationEnabled() ? 60000 : 10000;
    }

    private static int dp(Context context, int value) { return Math.round(value * context.getResources().getDisplayMetrics().density); }
}
