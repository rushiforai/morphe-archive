/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.shared.settings.preference;

import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Looper;

import androidx.annotation.Nullable;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.ref.WeakReference;
import java.time.Instant;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticRedactor;

/**
 * Keeps the Java crash that ends the app for the diagnostic report's [LATEST JAVA CRASH] section.
 *
 * <p>Android keeps no stack trace for a Java crash: its exit record says CRASH and nothing more, so
 * a report sent after "Facebook keeps stopping" (#94) couldn't say what stopped it. The pause
 * module's uncaught-exception handler hands each crash here before passing it on. The trace and
 * the last diagnostic events go through the redactor and stay in Facebook's own files, so every
 * report exported after it carries them, until the next crash replaces them or the diagnostic log
 * is cleared.
 *
 * <p>The handler sits in front of Facebook's own, so it also sees an exception one of Facebook's
 * swallows. When the handlers after it return, the process lives on, and an exception off the main
 * thread put the report back as it was ({@link #survived}), so it can't push out a crash from an
 * earlier start. One swallowed on the main thread stays: that thread is gone, and Facebook freezes.
 */
public final class JavaCrashReport {
    /** How much of the diagnostic event log goes in after the trace. */
    static final int RECENT_EVENTS_MAX_CHARS = 12_000;

    /** The exception kept last, weakly: a handler Facebook put on top of ours can hand it back. */
    private static volatile WeakReference<Throwable> lastSaved = new WeakReference<>(null);

    private JavaCrashReport() {
    }

    /**
     * Keeps [throwable] as the latest Java crash, unless it's the one kept last. Answers what the
     * report held before, "" for nothing, for {@link #survived}, or null when nothing was written.
     * Never throws.
     */
    @Nullable
    public static String save(@Nullable Thread thread, @Nullable Throwable throwable) {
        try {
            Context context = Utils.getContext();
            if (context == null || throwable == null || lastSaved.get() == throwable) return null;
            lastSaved = new WeakReference<>(throwable);
            String before = LogBufferManager.readCrashReport(context);
            LogBufferManager.persistCrashReport(context, build(context, thread, throwable));
            return before;
        } catch (Throwable ignored) {
            // Crash-time code must never get in the way of the handlers after this one.
            return null;
        }
    }

    /**
     * The handlers after ours returned for [thread]'s exception, so the process lives on. Off the
     * main thread, the report goes back to [before], what {@link #save} answered. Never throws.
     */
    public static void survived(@Nullable Thread thread, @Nullable String before) {
        try {
            Context context = Utils.getContext();
            if (context == null || before == null || thread == null || thread == Looper.getMainLooper().getThread()) return;
            LogBufferManager.persistCrashReport(context, before);
        } catch (Throwable ignored) {
            // The exception's report stays; nothing else is lost.
        }
    }

    static String build(Context context, @Nullable Thread thread, Throwable throwable) {
        StringBuilder report = new StringBuilder();
        report.append("schema: 1\n")
                .append("complete: true\n")
                .append("timestamp_utc: ").append(Instant.ofEpochMilli(System.currentTimeMillis())).append('\n')
                .append("package: ").append(context.getPackageName()).append('\n')
                .append("app_version: ").append(Utils.getAppVersionName()).append('\n')
                .append("morphe_version: ").append(Utils.getPatchesReleaseVersion()).append('\n')
                .append("android_api: ").append(Build.VERSION.SDK_INT).append('\n')
                .append("process: ").append(Application.getProcessName()).append('\n')
                .append("thread: ").append(thread == null ? "unknown" : thread.getName()).append('\n')
                .append("exception: ").append(throwable.getClass().getName()).append('\n')
                .append("\n[STACK TRACE]\n").append(stackTrace(throwable));
        String recent = LogBufferManager.snapshotForCrash(RECENT_EVENTS_MAX_CHARS);
        if (!recent.isEmpty()) report.append("\n[RECENT EVENTS]\n").append(recent).append('\n');
        // Messages and log lines can carry addresses and ids: a download names what it couldn't reach.
        return DiagnosticRedactor.redact(report.toString());
    }

    /** The whole trace, causes and suppressed ones included, as Java prints it. */
    private static String stackTrace(Throwable throwable) {
        StringWriter text = new StringWriter();
        try (PrintWriter writer = new PrintWriter(text)) {
            throwable.printStackTrace(writer);
        }
        return text.toString();
    }

    /** Forgets the exception kept last, as in a new process. Called by the pause module's reset. */
    public static void resetForTests() {
        lastSaved = new WeakReference<>(null);
    }
}
