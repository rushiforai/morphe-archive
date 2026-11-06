/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.rootmute;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/** Rebinds a fresh snapshot, preserving any page that arrived while the private write ran. */
final class RootPostLocalTimeline {
    private RootPostLocalTimeline() {}
    private static final int MAX_ITEMS = 4000;

    static boolean contains(HushLocalTimeline host, String root) {
        try {
            List<?> items = host.hushTimelineItems();
            return items != null && items.size() <= MAX_ITEMS && items.stream().anyMatch(item -> root.equals(RootPostMenu.entryOf(item, root)));
        } catch (Throwable unavailable) { return false; }
    }

    static Runnable remove(HushLocalTimeline host, String root, RootPostMutes.Session account) {
        try {
            if (!RootPostMutes.current(account)) return null;
            List<?> before = host.hushTimelineItems();
            if (before == null || before.size() > MAX_ITEMS) return null;
            List<Object> after = new ArrayList<>();
            List<Object> removed = new ArrayList<>();
            for (Object item : before) {
                if (root.equals(RootPostMenu.entryOf(item, root))) removed.add(item); else after.add(item);
            }
            if (removed.isEmpty()) {
                // A newly filtered page may have converged while the private write ran.
                // Confirm that fresh list is stable before accepting the saved mute.
                if (!RootPostMutes.current(account) || !after.equals(host.hushTimelineItems())) return null;
                return () -> { };
            }
            host.hushApplyTimelineItems(after);
            if (!RootPostMutes.current(account) || !after.equals(host.hushTimelineItems())) return null;
            WeakReference<HushLocalTimeline> owner = new WeakReference<>(host);
            List<?> snapshot = new ArrayList<>(before);
            return () -> {
                HushLocalTimeline target = owner.get();
                if (target == null || !RootPostMutes.current(account)) return;
                try {
                    List<?> now = target.hushTimelineItems();
                    if (now == null || now.size() > MAX_ITEMS) return;
                    if (now.equals(after)) { target.hushApplyTimelineItems(new ArrayList<>(snapshot)); return; }
                    // Only restore removed rows. Newly loaded rows and their ordering remain intact.
                    List<Object> merged = new ArrayList<>(now);
                    for (Object row : removed) {
                        if (merged.contains(row)) continue;
                        int original = snapshot.indexOf(row), insertion = merged.size();
                        for (int i = original + 1; i < snapshot.size(); i++) {
                            int next = merged.indexOf(snapshot.get(i));
                            if (next >= 0) { insertion = next; break; }
                        }
                        merged.add(insertion, row);
                    }
                    if (merged.size() <= MAX_ITEMS) target.hushApplyTimelineItems(merged);
                } catch (Throwable unavailable) { /* A detached timeline cannot be rebound. */ }
            };
        } catch (Throwable unavailable) { return null; }
    }
}
