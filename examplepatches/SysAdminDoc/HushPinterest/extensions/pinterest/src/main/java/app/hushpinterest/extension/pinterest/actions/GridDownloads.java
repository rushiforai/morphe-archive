/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Rect;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import java.lang.ref.WeakReference;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import app.hushpinterest.extension.pinterest.settings.FamilyNames;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** One explicit, bounded selection from currently visible native cells. No adapter or network discovery. */
final class GridDownloads {
    private GridDownloads() {}
    private static final AtomicBoolean RUNNING = new AtomicBoolean();

    static ViewGroup grid(View origin) {
        if (origin == null || !origin.isAttachedToWindow()) return null;
        View current = origin;
        for (int depth = 0; current != null && depth < 64; depth++) {
            for (Class<?> type = current.getClass(); type != null; type = type.getSuperclass()) {
                if (type.getName().equals("androidx.recyclerview.widget.RecyclerView") && current instanceof ViewGroup)
                    return (ViewGroup) current;
            }
            ViewParent parent = current.getParent();
            current = parent instanceof View ? (View) parent : null;
        }
        return null;
    }

    /** Native overflow data can omit originView. Match one visible grid by its already bound pin. */
    static ViewGroup grid(View origin, Object pin) {
        ViewGroup direct = grid(origin);
        String id = PinMedia.id(pin);
        if (id != null && direct != null) {
            for (Object visible : snapshot(direct)) if (id.equals(PinMedia.id(visible))) return direct;
            return null;
        }
        Activity activity = Utils.getActivity();
        if (id == null || activity == null || activity.isFinishing() || activity.isDestroyed()) return null;
        ArrayDeque<View> pending = new ArrayDeque<>();
        pending.add(activity.getWindow().getDecorView());
        ViewGroup match = null;
        int examined = 0;
        while (!pending.isEmpty()) {
            if (++examined > 512) return null;
            View view = pending.removeFirst();
            if (!view.isAttachedToWindow() || !view.isShown()) continue;
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                if (grid(group) == group) {
                    for (Object visible : snapshot(group)) if (id.equals(PinMedia.id(visible))) {
                        if (match != null && match != group) return null;
                        match = group;
                        break;
                    }
                }
                if (pending.size() + group.getChildCount() + examined > 512) return null;
                for (int i = 0; i < group.getChildCount(); i++) pending.addLast(group.getChildAt(i));
            }
        }
        return match;
    }

    static List<Object> snapshot(ViewGroup grid) {
        LinkedHashMap<String, Object> pins = new LinkedHashMap<>();
        Rect bounds = new Rect(), visible = new Rect();
        if (grid == null || !grid.isAttachedToWindow() || !grid.isShown() || !grid.getGlobalVisibleRect(bounds)) return new ArrayList<>();
        for (int i = 0; i < grid.getChildCount() && pins.size() < DownloadLedger.LIMIT; i++) {
            View cell = grid.getChildAt(i);
            if (!cell.isAttachedToWindow() || !cell.isShown() || !cell.getGlobalVisibleRect(visible) || !visible.intersect(bounds)) continue;
            Object pin = PinDownloads.cellPin(cell);
            String id = PinMedia.id(pin);
            if (id != null) pins.putIfAbsent(id, pin);
        }
        return new ArrayList<>(pins.values());
    }

    static boolean show(View origin) {
        if (!PinDownloads.active()) return false;
        try {
            Activity activity = Utils.getActivity();
            if (activity == null || activity.isFinishing() || activity.isDestroyed()) return false;
            if (RUNNING.get()) {
                Utils.showToastLong(L10n.t("A pin selection is still being saved."));
                return false;
            }
            List<Object> pins = snapshot(grid(origin));
            if (pins.isEmpty()) {
                Utils.showToastLong(L10n.t("No visible pins are available. Open a pin menu from the grid and try again."));
                return false;
            }
            CharSequence[] labels = new CharSequence[pins.size()];
            for (int i = 0; i < pins.size(); i++) {
                Object title = PinMedia.field(pins.get(i), "title");
                String text = title instanceof String ? ((String) title).replaceAll("[\\p{Cntrl}]", " ").trim() : "";
                if (text.length() > 120) text = text.substring(0, 120);
                labels[i] = (text.isEmpty() ? "" : L10n.isolate(text) + "\n") + L10n.f("Pin %s", L10n.isolate(PinMedia.id(pins.get(i))));
            }
            boolean[] selected = new boolean[pins.size()];
            AlertDialog picker = new AlertDialog.Builder(new ContextThemeWrapper(activity, android.R.style.Theme_Material_Dialog_Alert))
                    .setTitle(L10n.f("Select visible pins (up to %d)", DownloadLedger.LIMIT))
                    .setMultiChoiceItems(labels, selected, (dialog, which, checked) -> {
                        selected[which] = checked;
                        boolean any = false;
                        for (boolean value : selected) any |= value;
                        ((AlertDialog) dialog).getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(any);
                    })
                    .setPositiveButton(L10n.t("Queue selected"), (dialog, which) -> {
                        List<Object> chosen = new ArrayList<>();
                        for (int i = 0; i < pins.size(); i++) if (selected[i]) chosen.add(pins.get(i));
                        if (!chosen.isEmpty() && RUNNING.compareAndSet(false, true)) new Batch(activity, chosen).begin();
                    })
                    .setNegativeButton(L10n.t("Cancel"), null).create();
            picker.show();
            picker.getButton(AlertDialog.BUTTON_POSITIVE).setEnabled(false);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "select visible pins", failure);
            Utils.showToastLong(L10n.t("Couldn't open the pin selection. Try again from the grid."));
            return false;
        }
    }

    private static final class Batch {
        final WeakReference<Activity> activity;
        final Context app;
        final List<Object> pins;
        AlertDialog progress;
        boolean stopped;
        int position, queued, saved, skipped, unsupported, failed, untracked;

        Batch(Activity activity, List<Object> pins) {
            this.activity = new WeakReference<>(activity);
            app = activity.getApplicationContext();
            this.pins = pins;
        }

        void begin() {
            try {
                progress = new AlertDialog.Builder(new ContextThemeWrapper(activity.get(), android.R.style.Theme_Material_Dialog_Alert))
                        .setTitle(L10n.t("Download visible pins"))
                        .setMessage(summary())
                        .setNegativeButton(L10n.t("Stop selection"), (dialog, which) -> stopped = true).create();
                progress.setOnCancelListener(dialog -> stopped = true);
                progress.show();
                next();
            } catch (RuntimeException failure) {
                HookStatus.threw(FamilyNames.DOWNLOAD_PINS, "show batch progress", failure);
                stopped = true;
                next();
            }
        }

        String summary() {
            return L10n.f("Queued: %d\nSaved: %d\nSkipped: %d\nUnsupported: %d\nFailed: %d", queued, saved, skipped, unsupported, failed)
                    + "\n\n" + L10n.t("Stopping keeps downloads already started. Unstarted selections end when Pinterest closes.")
                    + (untracked == 0 ? "" : "\n\n" + L10n.f("History could not be saved for %d results. Check Downloads or your chosen files.", untracked));
        }

        void next() {
            Activity host = activity.get();
            if ((host == null || host.isFinishing() || host.isDestroyed()) && progress != null) {
                progress.dismiss();
                progress = null;
            }
            if (position == pins.size()) {
                RUNNING.set(false);
                if (progress != null && progress.isShowing()) {
                    progress.setMessage(summary());
                    progress.getButton(AlertDialog.BUTTON_NEGATIVE).setText(L10n.t("Close"));
                }
                Utils.showToastLong(summary());
                return;
            }
            Object pin = pins.get(position);
            String id = PinMedia.id(pin);
            if (stopped || host == null || host.isFinishing() || host.isDestroyed()) {
                result(id, PinDownloads.Result.SKIPPED);
            } else PinDownloads.start(pin, host, outcome -> result(id, outcome));
        }

        void result(String id, PinDownloads.Result outcome) {
            switch (outcome) {
                case QUEUED: queued++; break;
                case QUEUED_UNTRACKED: queued++; untracked++; break;
                case SAVED: saved++; break;
                case SKIPPED: skipped++; break;
                case UNSUPPORTED: unsupported++; break;
                default: failed++;
            }
            pins.set(position++, null);
            Runnable advance = () -> {
                if (progress != null && progress.isShowing()) progress.setMessage(summary());
                next();
            };
            if (outcome == PinDownloads.Result.QUEUED || outcome == PinDownloads.Result.QUEUED_UNTRACKED) {
                Utils.runOnMainThread(advance);
            } else {
                boolean scheduled = Utils.runOnBackgroundThread(() -> {
                    boolean recorded = DownloadLedger.recordResult(app, id, DownloadLedger.State.valueOf(outcome.name()));
                    Utils.runOnMainThread(() -> { if (!recorded) untracked++; advance.run(); });
                });
                if (!scheduled) {
                    untracked++;
                    Utils.runOnMainThread(advance);
                }
            }
        }
    }
}
