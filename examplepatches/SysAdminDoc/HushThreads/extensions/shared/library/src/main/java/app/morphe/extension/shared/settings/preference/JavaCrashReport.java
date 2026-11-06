/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 19c67094 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for HushGram (Instagram), 2026.
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
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.DiagnosticRedactor;

/**
 * Keeps the Java crash that ends a start for the diagnostic report's [LATEST JAVA CRASH] section.
 *
 * <p>Android keeps no stack trace for a Java crash: its exit record says CRASH and nothing more, so
 * a report sent after safe mode turned on couldn't say what crashed. The pause module's
 * uncaught-exception handler hands a crash here before passing it on, when it comes inside the
 * start's first minute (the crashes safe mode counts) or while Debug logging is on. The trace, the
 * patches' switches and the last diagnostic events go through the redactor and stay in Threads'
 * own files, so every report exported after it carries them, until the next crash replaces them or
 * the diagnostic log is cleared.
 *
 * <p>The handler can sit in front of Threads' own, so it also sees an exception one of Threads'
 * handlers swallows. When the handlers after it return, the process lives on, and an exception off
 * the main thread puts the report back as it was ({@link #survived}). A Clear or a newer crash that
 * replaced it in the meantime gets that earlier report in its place, for Undo or for the newer one
 * being swallowed in turn. One swallowed on the main thread stays, since that thread is gone and
 * Threads freezes.
 */
public final class JavaCrashReport {
    /** How much of the diagnostic event log goes in after the trace. */
    static final int RECENT_EVENTS_MAX_CHARS = 12_000;

    /** The exception kept last, weakly: a handler Threads put on top of ours can hand it back. */
    private static volatile WeakReference<Throwable> lastSaved = new WeakReference<>(null);

    /**
     * Saves whose handlers haven't returned yet, guarded by {@link LogBufferManager#CLEAR_UNDO_LOCK}.
     * Two threads can be inside the handlers at once. When one of them lives on, a save made over its
     * report gives back what its report gave back, not the swallowed exception.
     */
    private static final List<Saved> OPEN = new ArrayList<>();

    /** One save, for {@link #survived}: what the report gives back if it lives on, and what it wrote. */
    public static final class Saved {
        /** Changed under the lock when the save it was read from lives on. */
        String before;
        final String written;
        final WeakReference<Throwable> throwable;

        Saved(String before, String written, Throwable throwable) {
            this.before = before;
            this.written = written;
            this.throwable = new WeakReference<>(throwable);
        }
    }

    private JavaCrashReport() {
    }

    /**
     * Keeps [throwable] as the latest Java crash, unless it's the one kept last. Answers the save,
     * for {@link #survived}, or null when nothing was written. Never throws.
     */
    @Nullable
    public static Saved save(@Nullable Thread thread, @Nullable Throwable throwable) {
        try {
            Context context = Utils.getContext();
            if (context == null || throwable == null || lastSaved.get() == throwable) return null;
            lastSaved = new WeakReference<>(throwable);
            String report = build(context, thread, throwable);
            synchronized (LogBufferManager.CLEAR_UNDO_LOCK) {
                String before = LogBufferManager.readCrashReport(context);
                LogBufferManager.persistCrashReport(context, report);
                // Read back rather than kept as built: a report past the ceiling is stored cut.
                Saved saved = new Saved(before, LogBufferManager.readCrashReport(context), throwable);
                OPEN.add(saved);
                return saved;
            }
        } catch (Throwable ignored) {
            // Crash-time code must never get in the way of the handlers after this one.
            return null;
        }
    }

    /**
     * The handlers after ours returned for [thread]'s exception, so the process lives on. Off the
     * main thread, the report goes back to what it held before [saved], while it still holds what
     * [saved] wrote. A Clear that took the report along gets the same, so its Undo doesn't bring the
     * swallowed exception back, and so does a save another thread made over it. Never throws.
     */
    public static void survived(@Nullable Thread thread, @Nullable Saved saved) {
        try {
            if (saved == null) return;
            synchronized (LogBufferManager.CLEAR_UNDO_LOCK) {
                OPEN.remove(saved);
                // The same exception handed in again later is a new crash to keep.
                if (lastSaved.get() == saved.throwable.get()) lastSaved = new WeakReference<>(null);
                Context context = Utils.getContext();
                if (context == null || thread == null || thread == Looper.getMainLooper().getThread()) return;
                String back = saved.before;
                for (Saved open : OPEN) {
                    if (open.before.equals(saved.written)) open.before = back;
                }
                if (LogBufferManager.readCrashReport(context).equals(saved.written)) {
                    LogBufferManager.persistCrashReport(context, back);
                } else {
                    LogBufferManager.replaceClearedCrash(saved.written, back);
                }
            }
        } catch (Throwable ignored) {
            // The exception's report stays; nothing else is lost.
        }
    }

    static String build(Context context, @Nullable Thread thread, Throwable throwable) {
        long versionCode = Utils.getAppVersionCode();
        StringBuilder report = new StringBuilder();
        report.append("timestamp_utc: ").append(LogBufferManager.utcOf(System.currentTimeMillis())).append('\n')
                .append("package: ").append(context.getPackageName()).append('\n')
                .append("app_version: ").append(Utils.getAppVersionName()).append('\n')
                .append("morphe_version: ").append(Utils.getPatchesReleaseVersion()).append('\n')
                .append("android_api: ").append(Build.VERSION.SDK_INT).append('\n')
                .append("abi: ").append(LogBufferManager.abiLine()).append('\n')
                .append("process: ").append(Application.getProcessName()).append('\n')
                .append("thread: ").append(thread == null ? "unknown" : thread.getName()).append('\n')
                .append("exception: ").append(throwable.getClass().getName()).append('\n')
                .append("\n[STACK TRACE]\n").append(stackTrace(throwable));
        // Which switches were on is the first thing a crash report is read for after the trace. A
        // section that can't be read leaves the trace kept without it.
        try {
            report.append(LogBufferManager.patchSectionsText());
        } catch (Throwable unread) {
            report.append("\n[REPORT SECTIONS]\ncould not be read: ").append(unread).append('\n');
        }
        String recent = LogBufferManager.snapshotForCrash(RECENT_EVENTS_MAX_CHARS);
        if (!recent.isEmpty()) report.append("\n[RECENT EVENTS]\n").append(recent).append('\n');
        // Messages and log lines can carry addresses and ids: a download names what it couldn't
        // reach. The version code is a numeric package fact and the patch build a literal the
        // patcher embeds; prose redaction would mistake the digit runs in either for content ids.
        return "schema: 1\ncomplete: true\n"
                + "app_version_code: " + (versionCode < 0 ? "unknown" : Long.toString(versionCode)) + '\n'
                + "patch_build: " + Utils.getPatchesBuildIdentity() + '\n'
                + DiagnosticRedactor.redact(report.toString());
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
        synchronized (LogBufferManager.CLEAR_UNDO_LOCK) {
            OPEN.clear();
        }
    }
}
