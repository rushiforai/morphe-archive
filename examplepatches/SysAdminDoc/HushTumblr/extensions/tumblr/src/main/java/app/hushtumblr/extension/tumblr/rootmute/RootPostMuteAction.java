/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import android.content.Context;
import android.app.Activity;

import java.lang.ref.WeakReference;

import app.hushtumblr.extension.shared.L10n;
/** The patch adds Tumblr's exact Function0 interface to this local-only callback. */
public final class RootPostMuteAction implements Runnable {
    private final String root;
    private final WeakReference<Context> context;
    private final WeakReference<HushLocalTimeline> timeline;
    private final RootPostMutes.Session account;

    RootPostMuteAction(String root, Context context, HushLocalTimeline timeline) {
        this.root = root;
        this.context = new WeakReference<>(context);
        this.timeline = new WeakReference<>(timeline);
        account = RootPostMutes.capture();
    }

    @Override public void run() {
        Context target = context.get();
        HushLocalTimeline host = timeline.get();
        Activity owner = target == null ? null : RootPostMuteUi.activity(target);
        if (owner == null || owner.isFinishing() || owner.isDestroyed() || host == null || !RootPostLocalTimeline.contains(host, root)) return;
        RootPostMutes.mute(account, root, undo -> {
            if (!RootPostMutes.current(account)) return;
            if (undo != null && !undo.confirmed) {
                RootPostMuteUi.changed(target, L10n.t("Couldn't update muted posts. Try again."), undo);
                return;
            }
            Runnable restore = undo == null ? null : RootPostLocalTimeline.remove(host, root, account);
            if (undo != null && restore == null) {
                RootPostMutes.undo(undo, restored -> {
                    if (!RootPostMutes.current(account)) return;
                    RootPostMutes.Session saved = RootPostMutes.capture();
                    if (!restored && saved == null) RootPostMuteUi.changed(target, L10n.t("Couldn't update muted posts. Try again."), undo);
                    else if (!restored && saved.roots.contains(root)) RootPostMuteUi.recoverMute(target, undo, root);
                    else RootPostMuteUi.changed(target, RootPostMuteUi.mutedMessage(root), null);
                });
            } else RootPostMuteUi.changed(target, RootPostMuteUi.mutedMessage(root), undo, restore);
        });
    }

    /** The post root or blog rule this action saves. */
    String entry() { return root; }

    public Object invoke() { run(); return RootPostMenu.unit(); }
}
