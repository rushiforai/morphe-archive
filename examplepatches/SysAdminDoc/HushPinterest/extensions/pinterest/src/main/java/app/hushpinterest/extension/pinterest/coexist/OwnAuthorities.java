/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2cb2182 (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 * Forked there from https://github.com/SysAdminDoc/Hushfacebook at c21b570b (GPL-3.0).
 *
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.hushpinterest.extension.pinterest.coexist;

import android.app.Application;
import android.content.Context;

import androidx.annotation.Nullable;

import app.hushpinterest.extension.pinterest.settings.SettingsStatus;

/**
 * Pinterest's own content provider authorities, as the running app has them.
 *
 * <p>Pinterest's code spells one of its authorities out: {@code com.pinterest.provider}, the
 * FileProvider it shares and saves its own files through. Change package name moves the copy's
 * providers under its new package, so without this a copy would ask Android for the provider of
 * the stock Pinterest beside it, or for none at all. Every place the code loads that name hands it
 * to {@link #name}, which answers the running app's.
 *
 * <p>The running package comes from the process name, which Android sets before any of the app's
 * code runs, so this answers even before HushPinterest has a context. Only the flag patching
 * compiles in for Change package name is read here, never a setting or the log, for the same reason.
 */
@SuppressWarnings("unused")
public final class OwnAuthorities {
    static final String PINTEREST = "com.pinterest";
    private static final String CONTENT = "content://";

    /** The running app's package, read off its process name the first time it's needed. */
    @Nullable
    static volatile String runningPackage;

    /** Whether a test's build has Change package name; null reads the flag patching compiled in. */
    @Nullable
    static volatile Boolean renamedForTests;

    private OwnAuthorities() {
    }

    /**
     * [pinterestName], one of Pinterest's own authorities or a content:// address on one, as the
     * running app has it: unchanged in Pinterest itself, under the copy's package in a renamed copy.
     * Any other text comes back as it was, and so does every name in a build without Change package
     * name, the only patch that places this.
     */
    public static String name(@Nullable String pinterestName) {
        if (pinterestName == null) return null;
        try {
            if (!renamed()) return pinterestName;
            String running = runningPackage();
            if (running == null || PINTEREST.equals(running)) return pinterestName;
            int start = pinterestName.startsWith(CONTENT) ? CONTENT.length() : 0;
            if (!pinterestName.startsWith(PINTEREST + ".", start)) return pinterestName;
            return pinterestName.substring(0, start) + running + pinterestName.substring(start + PINTEREST.length());
        } catch (Throwable failure) {
            // Pinterest's own name is what every install but a renamed copy uses.
            return pinterestName;
        }
    }

    /**
     * Whether [name] is this renamed copy's own package. Pinterest itself answers false here, and so
     * does any other package.
     */
    public static boolean isRunningCopy(@Nullable String name) {
        if (name == null) return false;
        try {
            String running = runningPackage();
            return running != null && !PINTEREST.equals(running) && running.equals(name);
        } catch (Throwable failure) {
            return false;
        }
    }

    /**
     * The package the reCAPTCHA check in Pinterest's sign-in reports for [context]. Pinterest's
     * reCAPTCHA key accepts only Pinterest's own package, so a renamed copy reporting its new one
     * gets every email sign-in refused with "Something went wrong". The copy reports Pinterest's
     * package there; Pinterest itself, and every build without Change package name, report their own.
     */
    public static String reportedPackage(Context context) {
        String own = context.getPackageName();
        try {
            if (renamed() && isRunningCopy(own)) return PINTEREST;
        } catch (Throwable failure) {
            // The real package is what the stock app reports, and it's never wrong to send.
        }
        return own;
    }

    /** Whether this build was patched with Change package name. */
    static boolean renamed() {
        Boolean forced = renamedForTests;
        return forced != null ? forced : SettingsStatus.changePackageName();
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
