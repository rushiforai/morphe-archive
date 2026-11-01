/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.timeline;

import androidx.annotation.Nullable;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;

/**
 * The posts someone opened by themselves, from a link or a notification. The switches clear a feed,
 * so a post asked for by name gets past them: with it filtered out, Tumblr's page for that one post
 * stays empty and never loads.
 *
 * Each ask lets its post through once. A page is read once, so the post's own page uses the ask up,
 * and the same post turning up in a feed later is the switches' to judge. A refresh asks again.
 */
public final class DirectPosts {
    /** A query can fail without an answer, so only this many unanswered asks are kept. */
    private static final int MOST = 8;

    private static final Set<String> ASKED = new LinkedHashSet<>();

    /** Whether anything is waiting, so each item of each feed page doesn't take the lock. */
    private static volatile boolean any;

    private DirectPosts() {}

    /** Injected right before Tumblr's query for one post, on the id it asks for. */
    public static void opening(@Nullable String id) {
        try {
            if (id == null || id.isEmpty() || !Utils.settingsReady()) return;
            synchronized (ASKED) {
                ASKED.add(id);
                if (ASKED.size() > MOST) {
                    Iterator<String> oldest = ASKED.iterator();
                    oldest.next();
                    oldest.remove();
                }
                any = true;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_REBLOGS, "post opened by itself", failure);
        }
    }

    /** Whether [item] is a post just asked for, using that ask up. */
    static boolean answers(Object item) {
        if (!any) return false;
        TimelineFilter.Model model = TimelineFilter.modelFor(item, FamilyNames.HIDE_REBLOGS);
        if (model == null) return false;
        try {
            Object payload = model.data.invoke(item);
            Object id = payload == null ? null : model.id.invoke(payload);
            synchronized (ASKED) {
                boolean asked = id instanceof String && ASKED.remove(id);
                any = !ASKED.isEmpty();
                return asked;
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.HIDE_REBLOGS, "post opened by itself", failure);
            return false;
        }
    }

    /** Forgets every ask, as a fresh start of the app would. */
    static void resetForTests() {
        synchronized (ASKED) {
            ASKED.clear();
            any = false;
        }
    }
}
