package com.sj010.gboardclipboard.extension;

import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;

/**
 * Runtime helper for clipboard history synchronization.
 *
 * Resolves empty clipboard history issues on Samsung One UI and Vivo OriginOS/FuntouchOS
 * devices caused by OEM suppression of background OnPrimaryClipChangedListener broadcasts.
 *
 * When Gboard gains input focus in the foreground (onStartInputView), this helper
 * ensures the ClipboardManager is initialized and triggers clipboard synchronization,
 * allowing Gboard to capture the primary clip and persist it to SQLite history.
 */
public final class GboardClipboardSyncRuntime {

    private static final String TAG = "GboardClipboard";

    /**
     * Delay before the backfill runs. Gboard performs its own capture asynchronously, so the
     * backfill waits for that write to land and skips the clip if already stored.
     */
    static final long BACKFILL_DELAY_MS = 1500L;

    private static volatile Field clipboardManagerField;
    private static volatile Field contextField;
    private static volatile Method syncMethod;
    private static volatile ScheduledExecutorService backfillExecutor;

    private GboardClipboardSyncRuntime() {
    }

    /**
     * Synchronizes clipboard contents when input starts.
     *
     * @param handler the Gboard ClipboardDataHandler instance (Lfmg)
     */
    public static void syncOnStartInputView(Object handler) {
        if (handler == null) {
            return;
        }
        try {
            Context context = ensureClipboardManager(handler);
            ensureScreenshotObserver(handler);
            triggerCapture(handler);
            logDiagnostics(handler, context);
            scheduleBackfill(context);
        } catch (Throwable t) {
            Log.w(TAG, "Failed to sync clipboard onStartInputView", t);
        }
    }

    /**
     * Triggers Gboard's own capture path so that Gboard writes the row into its history database.
     *
     * @param handler the Gboard ClipboardDataHandler instance (Lfmg)
     * @return {@code true} when the listener path was used, {@code false} when the reflective
     *     fallback was used.
     */
    private static boolean triggerCapture(Object handler) {
        if (handler instanceof ClipboardManager.OnPrimaryClipChangedListener) {
            ((ClipboardManager.OnPrimaryClipChangedListener) handler).onPrimaryClipChanged();
            return true;
        }

        try {
            Method sync = resolveSyncMethod(handler);
            if (sync != null) {
                sync.invoke(handler);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to trigger reflective clipboard sync", throwable);
        }
        return false;
    }

    /**
     * Schedules the backfill of clips that were copied under a different keyboard.
     *
     * @param context the context of the keyboard process, may be {@code null}.
     */
    static void scheduleBackfill(final Context context) {
        if (context == null) {
            return;
        }
        try {
            ScheduledExecutorService executor = getBackfillExecutor();
            if (executor == null) {
                return;
            }
            executor.schedule(new Runnable() {
                @Override
                public void run() {
                    try {
                        GboardClipboardBackfill.backfillPrimaryClip(context);
                    } catch (Throwable throwable) {
                        Log.w(TAG, "Clipboard backfill failed", throwable);
                    }
                }
            }, BACKFILL_DELAY_MS, TimeUnit.MILLISECONDS);
        } catch (Throwable throwable) {
            Log.w(TAG, "Failed to schedule clipboard backfill", throwable);
        }
    }

    private static ScheduledExecutorService getBackfillExecutor() {
        if (backfillExecutor == null) {
            synchronized (GboardClipboardSyncRuntime.class) {
                if (backfillExecutor == null) {
                    backfillExecutor = Executors.newSingleThreadScheduledExecutor(
                            new ThreadFactory() {
                                @Override
                                public Thread newThread(Runnable runnable) {
                                    Thread thread = new Thread(runnable, "GboardClipboardBackfill");
                                    thread.setDaemon(true);
                                    return thread;
                                }
                            });
                }
            }
        }
        return backfillExecutor;
    }

    /**
     * Logs the state of the clipboard sync without leaking the clipboard payload.
     */
    private static void logDiagnostics(Object handler, Context context) {
        try {
            boolean listener = handler instanceof ClipboardManager.OnPrimaryClipChangedListener;
            ClipboardManager clipboardManager = resolveClipboardManager(handler);
            StringBuilder builder = new StringBuilder();
            builder.append("clipboard sync: listener=").append(listener);
            builder.append(" clipboardManager=").append(clipboardManager != null);
            builder.append(" context=").append(context != null);
            if (clipboardManager != null) {
                builder.append(" primaryClipPresent=").append(hasPrimaryClip(clipboardManager));
                builder.append(" clipTimestamp=").append(primaryClipTimestamp(clipboardManager));
            }
            Log.i(TAG, builder.toString());
        } catch (Throwable throwable) {
            Log.d(TAG, "Failed to collect clipboard diagnostics", throwable);
        }
    }

    private static boolean hasPrimaryClip(ClipboardManager clipboardManager) {
        try {
            return clipboardManager.getPrimaryClipDescription() != null;
        } catch (Throwable throwable) {
            return false;
        }
    }

    private static long primaryClipTimestamp(ClipboardManager clipboardManager) {
        try {
            ClipDescription description = clipboardManager.getPrimaryClipDescription();
            return description == null ? 0L : description.getTimestamp();
        } catch (Throwable throwable) {
            return 0L;
        }
    }

    private static void ensureScreenshotObserver(Object handler) {
        try {
            Method qMethod = handler.getClass().getDeclaredMethod("q", boolean.class);
            qMethod.setAccessible(true);
            qMethod.invoke(handler, Boolean.TRUE);
        } catch (Throwable ignored) {
        }
    }

    private static Context ensureClipboardManager(Object handler) {
        try {
            Context context = resolveContext(handler);
            Field cmField = resolveClipboardManagerField(handler);
            if (cmField != null && cmField.get(handler) == null && context != null) {
                ClipboardManager cm =
                        (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null) {
                    cmField.set(handler, cm);
                }
            }
            return context;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Context resolveContext(Object handler) {
        try {
            Context cached = readContextField(contextField, handler);
            if (cached != null) {
                return cached;
            }
            for (Field field : handler.getClass().getDeclaredFields()) {
                if (!Context.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                field.setAccessible(true);
                Context candidate = readContextField(field, handler);
                if (candidate != null) {
                    contextField = field;
                    return candidate;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static Context readContextField(Field field, Object handler) {
        if (field == null) {
            return null;
        }
        try {
            Object value = field.get(handler);
            return value instanceof Context ? (Context) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static ClipboardManager resolveClipboardManager(Object handler) {
        try {
            Field cmField = resolveClipboardManagerField(handler);
            if (cmField == null) {
                return null;
            }
            Object value = cmField.get(handler);
            return value instanceof ClipboardManager ? (ClipboardManager) value : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Field resolveClipboardManagerField(Object handler) {
        if (clipboardManagerField == null) {
            for (Field field : handler.getClass().getDeclaredFields()) {
                if (ClipboardManager.class.isAssignableFrom(field.getType())) {
                    field.setAccessible(true);
                    clipboardManagerField = field;
                    break;
                }
            }
        }
        return clipboardManagerField;
    }

    private static Method resolveSyncMethod(Object handler) {
        if (syncMethod == null) {
            try {
                Method m = handler.getClass().getDeclaredMethod("f");
                m.setAccessible(true);
                syncMethod = m;
            } catch (Throwable ignored) {
            }
        }
        return syncMethod;
    }
}
