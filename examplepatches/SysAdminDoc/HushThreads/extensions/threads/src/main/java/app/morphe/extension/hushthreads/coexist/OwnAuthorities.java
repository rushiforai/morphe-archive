/*
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c21b570b (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.hushthreads.coexist;

import android.app.Application;

import androidx.annotation.Nullable;

/**
 * Threads' own content provider authorities, as the running app has them.
 *
 * <p>Threads' code spells some of its authorities out, such as
 * {@code content://com.instagram.barcelona.liteprovider.BarcelonaLiteContentProvider} in the tables
 * it reads Meta's family apps from. Change package name moves the copy's providers under its new
 * package, so without this the copy would read the providers of the stock Threads beside it. Every
 * place the code loads one of those names hands it to {@link #name}, which answers the running
 * app's.
 *
 * <p>Threads fills those tables in from static initialisers, which can run while its content
 * providers start and before HushThreads has a context. So the running package comes from the
 * process name, which Android sets before any of the app's code runs. Threads names every process
 * after its package, a colon and a name of its own ({@code com.instagram.barcelona:fbns}). No
 * setting and no log is read here, for the same reason.
 */
@SuppressWarnings("unused")
public final class OwnAuthorities {
    static final String THREADS = "com.instagram.barcelona";
    private static final String CONTENT = "content://";

    /** The running app's package, read off its process name the first time it's needed. */
    @Nullable
    static volatile String runningPackage;

    private OwnAuthorities() {
    }

    /**
     * [threadsName], one of Threads' own authorities or a content:// address on one, as the running
     * app has it: unchanged in Threads itself, under the copy's package in a renamed copy. Any other
     * text comes back as it was.
     */
    public static String name(@Nullable String threadsName) {
        if (threadsName == null) return null;
        try {
            String running = runningPackage();
            if (running == null || THREADS.equals(running)) return threadsName;
            int start = threadsName.startsWith(CONTENT) ? CONTENT.length() : 0;
            if (!threadsName.startsWith(THREADS + ".", start)) return threadsName;
            return threadsName.substring(0, start) + running + threadsName.substring(start + THREADS.length());
        } catch (Throwable failure) {
            // Threads' own name is what every install but a renamed copy uses.
            return threadsName;
        }
    }

    /**
     * Whether [name] is this renamed copy's own package. Threads asks whether a package name is its
     * own by comparing it with its release and debug packages, and a copy under another package
     * would fail that and take itself for Instagram. Change package name asks here first, so a copy
     * passes for its own package and nothing else changes. Threads itself answers false here and
     * keeps its own check.
     */
    public static boolean isRunningCopy(@Nullable String name) {
        if (name == null) return false;
        try {
            String running = runningPackage();
            return running != null && !THREADS.equals(running) && running.equals(name);
        } catch (Throwable failure) {
            // Threads' own check still answers for every install but a renamed copy.
            return false;
        }
    }

    @Nullable
    private static String runningPackage() {
        String known = runningPackage;
        if (known != null) return known;
        known = packageOf(Application.getProcessName());
        runningPackage = known;
        return known;
    }

    /** The package a process of this name belongs to: the name up to its first colon. */
    @Nullable
    static String packageOf(@Nullable String processName) {
        if (processName == null) return null;
        int colon = processName.indexOf(':');
        String name = colon < 0 ? processName : processName.substring(0, colon);
        return name.isEmpty() ? null : name;
    }
}
