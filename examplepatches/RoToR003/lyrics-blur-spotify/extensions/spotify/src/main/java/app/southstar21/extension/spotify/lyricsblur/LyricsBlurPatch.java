package app.southstar21.extension.spotify.lyricsblur;

import android.annotation.SuppressLint;
import android.animation.ValueAnimator;
import android.content.Context;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.os.Build;
import android.util.Log;
import android.view.View;

import java.util.WeakHashMap;

/**
 * Lyrics blur for Spotify: blurs every lyric line except the one being sung.
 * <p>
 * Spotify 9.2.4.2644 draws lyrics with Jetpack Compose. The patch calls
 * {@link #shouldBlur(boolean, boolean)} from the lyric line composable and feeds the answer to
 * Spotify's own animated blur modifier, which fades the blur in and out and skips it below
 * Android 12 by itself. This class therefore never touches Compose types.
 * <p>
 * {@link #setViewBlur(View, boolean)} is the same idea for a View based lyrics list; the
 * Compose patch doesn't use it.
 */
@SuppressLint("NewApi")
@SuppressWarnings("unused")
public final class LyricsBlurPatch {
    private static final String TAG = "LyricsBlur";

    private static final float VIEW_BLUR_RADIUS_PX = 12f;
    private static final long VIEW_ANIM_MS = 200L;

    private static int lastCombo = -1;
    private static int calls;

    // Debug log without adb: rewritten to Download/lyricsblur-debug.log via MediaStore (API 29+).
    // Read it with any file manager / Files app. Only used when the Debug logging option is on.
    // One file, rewritten (truncated) on every write; the buffer is capped small and trimmed at
    // line boundaries, so the file is always short enough to open or share.
    private static final String DEBUG_FILE = "lyricsblur-debug.log";
    private static final String DEBUG_PREFS = "lyricsblur_debug";
    private static final String KEY_URI = "debug_file_uri";
    private static final int DEBUG_BUFFER_MAX = 6000;
    private static final StringBuilder debugBuffer = new StringBuilder();
    private static android.net.Uri debugUri; // cached for this process
    private static boolean debugCleanupDone;
    private static int toastsShown;
    private static final int TOAST_LIMIT = 12;
    private static final java.util.HashSet<String> seenMarkers = new java.util.HashSet<>();

    private LyricsBlurPatch() {
    }

    // The methods below are overwritten by the patch with the chosen option values.

    /** Only blur while the lyrics are time synced (else a plain text lyrics page would be all blurred). */
    public static boolean requireSynced() {
        return true;
    }

    /** Logs the (active, synced) values the hook sees whenever they change, to check it in logcat. */
    public static boolean debugLogging() {
        return false;
    }

    /**
     * Called for every composed lyric line.
     *
     * @param active this line is the one being sung
     * @param synced the lyrics are time synced
     * @return whether this line is blurred
     */
    public static boolean shouldBlur(boolean active, boolean synced) {
        try {
            if (debugLogging()) {
                calls++;
                int combo = (active ? 2 : 0) | (synced ? 1 : 0);
                if (calls == 1) {
                    debugWrite("hook alive sdk=" + Build.VERSION.SDK_INT
                            + " requireSynced=" + requireSynced()
                            + " isSupported=" + isSupported());
                    debugToast("LB: hook alive sdk=" + Build.VERSION.SDK_INT
                            + (isSupported() ? "" : " UNSUPPORTED(<12)"));
                }
                if (combo != lastCombo) {
                    lastCombo = combo;
                    String line = "line hook: active=" + active + " synced=" + synced + " calls=" + calls;
                    Log.d(TAG, line);
                    debugWrite(line);
                    debugToast("LB: active=" + active + " synced=" + synced);
                }
            }
            if (!isSupported()) return false;
            if (requireSynced() && !synced) return false;
            return !active;
        } catch (Throwable t) {
            // Never take the app down over a cosmetic patch.
            Log.e(TAG, "shouldBlur failed", t);
            if (debugLogging()) {
                debugToast("LB: error " + t);
            }
            return false;
        }
    }

    /** Blur needs Android 12. */
    public static boolean isSupported() {
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.S;
    }

    /**
     * Shows a short toast when hook events occur — the only debug channel that needs nothing at
     * all (no adb, no file manager). Capped at {@link #TOAST_LIMIT} per process; debug-only.
     * Posted to the main looper: composables may run off the UI thread, and Toast requires one.
     */
    private static void debugToast(String line) {
        try {
            if (toastsShown >= TOAST_LIMIT) return;
            toastsShown++;
            postToast(line, android.widget.Toast.LENGTH_SHORT);
        } catch (Throwable ignored) {
            // Never take the app down over a debug toast.
        }
    }

    private static void postToast(final String line, final int duration) {
        try {
            new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    try {
                        Context ctx = (Context) Class.forName("android.app.ActivityThread")
                                .getMethod("currentApplication").invoke(null);
                        if (ctx == null) return;
                        android.widget.Toast.makeText(ctx, line, duration).show();
                    } catch (Throwable ignored) {
                        // Never take the app down over a debug toast.
                    }
                }
            });
        } catch (Throwable ignored) {
            // Never take the app down over a debug toast.
        }
    }

    /**
     * Debug anchor tracker from the main-line composable (p.ksh0.a): logs the (p1, p2) booleans
     * at the blur insertion point, but only when the combination changes (or on the first call),
     * so the log file stays small even on steady recomposition. Raw booleans, no semantics
     * claimed; every line carries the total call count (@#). No-op when Debug logging is off;
     * never throws.
     */
    public static void anchor(boolean p1, boolean p2) {
        try {
            if (!debugLogging()) return;
            anchorCalls++;
            int combo = (p1 ? 2 : 0) | (p2 ? 1 : 0);
            if (anchorCalls == 1 || combo != lastAnchorCombo) {
                lastAnchorCombo = combo;
                String line = "anchor p1=" + p1 + " p2=" + p2 + " @#" + anchorCalls;
                Log.d(TAG, line);
                debugWrite(line);
            }
        } catch (Throwable t) {
            Log.e(TAG, "anchor failed", t);
        }
    }

    private static int anchorCalls;
    private static int lastAnchorCombo = -1;

    /**
     * Debug anchor tracker for the translate-mode line wrapper (p.ksh0.b): same idea as
     * {@link #anchor(boolean, boolean)} for its blur insertion point. Logs the two Z
     * parameters (p5, p6) on change only. No-op when Debug logging is off; never throws.
     */
    public static void anchorB(boolean p5, boolean p6) {
        try {
            if (!debugLogging()) return;
            anchorBCalls++;
            int combo = (p5 ? 2 : 0) | (p6 ? 1 : 0);
            if (anchorBCalls == 1 || combo != lastAnchorBCombo) {
                lastAnchorBCombo = combo;
                String line = "bAnchor p5=" + p5 + " p6=" + p6 + " @#" + anchorBCalls;
                Log.d(TAG, line);
                debugWrite(line);
            }
        } catch (Throwable t) {
            Log.e(TAG, "anchorB failed", t);
        }
    }

    private static int anchorBCalls;
    private static int lastAnchorBCombo = -1;

    /**
     * Debug entry tracker from the patch: logs the (p1, p2) booleans seen at method entry, but
     * only on change (or first call), so steady-state recomposition doesn't bloat the file.
     * Lines carry the total call count (@#). No-op when Debug logging is off; never throws.
     */
    public static void entry(boolean active, boolean synced) {
        try {
            if (!debugLogging()) return;
            entryCalls++;
            int combo = (active ? 2 : 0) | (synced ? 1 : 0);
            if (entryCalls == 1 || combo != lastEntryCombo) {
                lastEntryCombo = combo;
                String line = "entry @#" + entryCalls + " p1=" + active + " p2=" + synced;
                Log.d(TAG, line);
                debugWrite(line);
            }
        } catch (Throwable t) {
            Log.e(TAG, "entry failed", t);
        }
    }

    private static int entryCalls;
    private static int lastEntryCombo = -1;

    /**
     * Debug marker from the patch itself: fires once per {@code name} per process; logcat + file +
     * toast. Used to bisect where control flow reaches in the target method. No-op when Debug
     * logging is off; never throws.
     */
    public static void marker(String name) {
        try {
            if (!debugLogging()) return;
            synchronized (seenMarkers) {
                if (seenMarkers.contains(name)) return;
                seenMarkers.add(name);
            }
            Log.d(TAG, name);
            debugWrite(name);
            postToast(name, android.widget.Toast.LENGTH_LONG);
        } catch (Throwable t) {
            Log.e(TAG, "marker failed", t);
        }
    }

    /**
     * Appends a line to the debug buffer and rewrites Download/lyricsblur-debug.log. Needs no
     * permissions on API 29+ (MediaStore). Silent no-op below that; logcat still works.
     * <p>
     * Exactly one file must exist, always: earlier builds could insert a fresh copy per write on
     * devices where the Downloads query returns no rows, piling up duplicates. This version finds
     * the file in three steps and never inserts blindly:
     * <ol>
     * <li>URI cached in memory for this process;</li>
     * <li>URI persisted in app SharedPreferences (survives process restarts and works even when
     * the Downloads query returns zero rows);</li>
     * <li>one-time-per-process MediaStore scan: keeps the newest matching row, deletes every
     * stale duplicate older builds created, and reuses the kept row.</li>
     * </ol>
     * A new file is inserted (with RELATIVE_PATH and the IS_PENDING flow) only when no usable
     * row/URI exists at all.
     */
    private static void debugWrite(String line) {
        try {
            debugBuffer.append(line).append('\n');
            if (debugBuffer.length() > DEBUG_BUFFER_MAX) {
                int cut = debugBuffer.indexOf("\n",
                        debugBuffer.length() - DEBUG_BUFFER_MAX);
                debugBuffer.delete(0, cut < 0 ? debugBuffer.length() - DEBUG_BUFFER_MAX : cut + 1);
            }
            if (Build.VERSION.SDK_INT < 29) return;
            Context ctx = (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (ctx == null) return;
            android.content.ContentResolver cr = ctx.getContentResolver();
            android.net.Uri uri = debugUri;

            if (uri == null) {
                try {
                    String saved = ctx.getSharedPreferences(DEBUG_PREFS, Context.MODE_PRIVATE)
                            .getString(KEY_URI, null);
                    if (saved != null) uri = android.net.Uri.parse(saved);
                } catch (Throwable ignored) {
                }
            }
            if (uri != null && !writable(cr, uri)) uri = null;
            if (uri == null && !debugCleanupDone) {
                debugCleanupDone = true;
                uri = dedupeDownloads(cr); // keep newest, delete the rest
            }
            if (uri == null) uri = createDownloadFile(cr);
            if (uri == null) return;
            debugUri = uri;
            try {
                ctx.getSharedPreferences(DEBUG_PREFS, Context.MODE_PRIVATE)
                        .edit().putString(KEY_URI, uri.toString()).apply();
            } catch (Throwable ignored) {
            }
            byte[] payload = debugBuffer.toString().getBytes("UTF-8");
            java.io.OutputStream out = cr.openOutputStream(uri, "rwt");
            if (out != null) {
                try {
                    out.write(payload);
                } finally {
                    out.close();
                }
            }
        } catch (Throwable t) {
            Log.e(TAG, "debugWrite failed", t);
        }
    }

    /** true when an "rwt" stream can be opened on the uri (i.e. it still exists and is ours). */
    private static boolean writable(android.content.ContentResolver cr, android.net.Uri uri) {
        java.io.OutputStream out = null;
        try {
            out = cr.openOutputStream(uri, "rwt");
            return out != null;
        } catch (Throwable t) {
            return false;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /**
     * One-time scan of the Downloads collection for stale lyricsblur-debug*.log rows created by
     * older builds. Keeps the newest row, deletes the rest. Returns the kept uri, or null when
     * nothing matching is visible (then the caller inserts one new file).
     */
    private static android.net.Uri dedupeDownloads(android.content.ContentResolver cr) {
        android.database.Cursor c = null;
        try {
            c = cr.query(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI,
                    new String[]{android.provider.MediaStore.Downloads._ID},
                    android.provider.MediaStore.Downloads.DISPLAY_NAME + " LIKE ?",
                    new String[]{"lyricsblur-debug%"},
                    android.provider.MediaStore.Downloads._ID + " ASC");
            if (c == null || !c.moveToFirst()) return null;
            long bestId = -1;
            java.util.ArrayList<Long> ids = new java.util.ArrayList<>();
            do {
                ids.add(c.getLong(0));
            } while (c.moveToNext());
            for (long id : ids) bestId = Math.max(bestId, id);
            for (long id : ids) {
                if (id == bestId) continue;
                try {
                    cr.delete(android.content.ContentUris.withAppendedId(
                            android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, id),
                            null, null);
                } catch (Throwable ignored) {
                }
            }
            return android.content.ContentUris.withAppendedId(
                    android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, bestId);
        } catch (Throwable t) {
            Log.e(TAG, "dedupeDownloads failed", t);
            return null;
        } finally {
            if (c != null) {
                try {
                    c.close();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    /** Inserts exactly one new Downloads file (RELATIVE_PATH + IS_PENDING flow). */
    private static android.net.Uri createDownloadFile(android.content.ContentResolver cr) {
        android.net.Uri uri = null;
        try {
            android.content.ContentValues values = new android.content.ContentValues();
            values.put(android.provider.MediaStore.Downloads.DISPLAY_NAME, DEBUG_FILE);
            values.put(android.provider.MediaStore.Downloads.MIME_TYPE, "text/plain");
            values.put(android.provider.MediaStore.Downloads.RELATIVE_PATH,
                    android.os.Environment.DIRECTORY_DOWNLOADS + "/");
            values.put(android.provider.MediaStore.Downloads.IS_PENDING, 1);
            uri = cr.insert(android.provider.MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
            if (uri == null) return null;
            android.content.ContentValues done = new android.content.ContentValues();
            done.put(android.provider.MediaStore.Downloads.IS_PENDING, 0);
            cr.update(uri, done, null, null);
            return uri;
        } catch (Throwable t) {
            Log.e(TAG, "createDownloadFile failed", t);
            if (uri != null) {
                try {
                    cr.delete(uri, null, null);
                } catch (Throwable ignored) {
                }
            }
            return null;
        }
    }

    // region View based lyrics (not used by the Compose patch)

    private static final WeakHashMap<View, ViewBlur> viewStates = new WeakHashMap<>();

    private static final class ViewBlur {
        ValueAnimator animator;
        float radius;
    }

    /** Smoothly blurs ({@code blur}) or sharpens a view. Does nothing below Android 12. Call on the UI thread. */
    public static void setViewBlur(final View view, final boolean blur) {
        if (view == null || !isSupported()) return;
        try {
            ViewBlur state = viewStates.get(view);
            if (state == null) {
                state = new ViewBlur();
                viewStates.put(view, state);
            }
            if (state.animator != null) state.animator.cancel();

            final ViewBlur s = state;
            final float to = blur ? VIEW_BLUR_RADIUS_PX : 0f;
            if (s.radius == to) {
                applyRadius(view, to);
                return;
            }
            ValueAnimator animator = ValueAnimator.ofFloat(s.radius, to);
            animator.setDuration(VIEW_ANIM_MS);
            animator.addUpdateListener(a -> {
                s.radius = (Float) a.getAnimatedValue();
                applyRadius(view, s.radius);
            });
            s.animator = animator;
            animator.start();
        } catch (Throwable t) {
            Log.e(TAG, "setViewBlur failed", t);
        }
    }

    private static void applyRadius(View view, float radius) {
        if (radius <= 0.5f) {
            view.setRenderEffect(null);
        } else {
            view.setRenderEffect(RenderEffect.createBlurEffect(radius, radius, Shader.TileMode.CLAMP));
        }
    }

    // endregion
}
