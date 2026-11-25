package app.voidhack.extension.applemusic.lyrics;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;

import java.lang.reflect.Method;
import java.util.LinkedList;

/**
 * Android runtime hooks wired by {@code LyricsScrollSyncPatch}.
 */
public final class LyricsScrollSync {
    private static final String TAG = "AppleMusicLrclib";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final LyricsScrollSyncPolicy POLICY = new LyricsScrollSyncPolicy(
            new LyricsScrollSyncPolicy.Scheduler() {
                @Override
                public void postDelayed(Runnable task, long delayMs) {
                    if (delayMs <= 0L) {
                        MAIN.post(task);
                    } else {
                        MAIN.postDelayed(task, delayMs);
                    }
                }

                @Override
                public void cancel(Runnable task) {
                    MAIN.removeCallbacks(task);
                }
            },
            SystemClock::uptimeMillis
    );

    private static volatile Method songPtrGet;
    private static volatile Method songGetSections;
    private static volatile Method sectionVecSize;
    private static volatile Method sectionVecGet;
    private static volatile Method sectionPtrGet;
    private static volatile Method sectionGetLines;
    private static volatile Method lineVecSize;
    private static volatile Method lineVecGet;
    private static volatile Method linePtrGet;
    private static volatile Method lineGetBegin;
    private static volatile Method lineGetEnd;

    private LyricsScrollSync() {}

    public static boolean shouldHandleTapTargetCancel(
            Object fragment, View tapTarget, MotionEvent event, boolean wasDispatched) {
        if (event == null) return false;
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_CANCEL) return true;
        return tapTarget != null && !tapTarget.isClickable() && wasDispatched;
    }

    public static boolean handleTapTargetCancel(
            Object fragment,
            View tapTarget,
            View recyclerView,
            LinkedList<?> pendingEvents,
            GestureDetector gestureDetector,
            MotionEvent event,
            boolean wasDispatched) {
        try {
            if (pendingEvents != null) {
                for (Object item : pendingEvents) {
                    if (item instanceof MotionEvent pending) {
                        pending.recycle();
                    }
                }
                pendingEvents.clear();
            }
            if (event != null && (gestureDetector != null || (wasDispatched && recyclerView != null))) {
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                try {
                    if (gestureDetector != null) {
                        gestureDetector.onTouchEvent(cancel);
                    }
                    if (wasDispatched && recyclerView != null) {
                        if (tapTarget != null) {
                            int[] tapLoc = new int[2];
                            int[] rvLoc = new int[2];
                            tapTarget.getLocationOnScreen(tapLoc);
                            recyclerView.getLocationOnScreen(rvLoc);
                            cancel.offsetLocation(0.0f, tapLoc[1] - rvLoc[1]);
                        }
                        recyclerView.dispatchTouchEvent(cancel);
                    }
                } finally {
                    cancel.recycle();
                }
            }
            if (fragment instanceof LyricsScrollHost host) {
                POLICY.onTapTargetCanceled(host);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed handling lyrics tap-target cancel", t);
        }
        return tapTarget != null && tapTarget.isClickable();
    }

    public static void onTapTargetTouchBefore(Object fragment, View tapTarget, MotionEvent event) {
        if (!(fragment instanceof LyricsScrollHost host) || event == null) return;
        try {
            POLICY.onTapTargetTouchBefore(host, event.getActionMasked());
        } catch (Throwable t) {
            Log.w(TAG, "onTapTargetTouchBefore failed", t);
        }
    }

    public static void onTapTargetTouchAfter(Object fragment, View tapTarget, MotionEvent event) {
        if (!(fragment instanceof LyricsScrollHost host) || event == null) return;
        try {
            POLICY.onTapTargetTouchAfter(host, event.getActionMasked());
        } catch (Throwable t) {
            Log.w(TAG, "onTapTargetTouchAfter failed", t);
        }
    }

    public static void onRecyclerTouchBefore(Object fragment, MotionEvent event) {
        if (!(fragment instanceof LyricsScrollHost host) || event == null) return;
        try {
            POLICY.onRecyclerTouchBefore(host, event.getActionMasked());
        } catch (Throwable t) {
            Log.w(TAG, "onRecyclerTouchBefore failed", t);
        }
    }

    public static void onRecyclerTouchAfter(Object fragment, MotionEvent event) {
        if (!(fragment instanceof LyricsScrollHost host) || event == null) return;
        try {
            POLICY.onRecyclerTouchAfter(host, event.getActionMasked());
        } catch (Throwable t) {
            Log.w(TAG, "onRecyclerTouchAfter failed", t);
        }
    }

    public static void onScrollStateChanged(Object fragment, int scrollState) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onScrollStateChanged(host, scrollState);
        } catch (Throwable t) {
            Log.w(TAG, "onScrollStateChanged failed", t);
        }
    }

    public static void beforeActiveLineUpdate(Object fragment, int firstLine, int lastLine) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.beforeActiveLineUpdate(host, firstLine, lastLine);
        } catch (Throwable t) {
            Log.w(TAG, "beforeActiveLineUpdate failed", t);
        }
    }

    public static void afterActiveLineUpdate(Object fragment, int firstLine, int lastLine) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.afterActiveLineUpdate(host, firstLine, lastLine);
        } catch (Throwable t) {
            Log.w(TAG, "afterActiveLineUpdate failed", t);
        }
    }

    public static void onUserSeekLine(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onUserSeekLine(host);
        } catch (Throwable t) {
            Log.w(TAG, "onUserSeekLine failed", t);
        }
    }

    public static void onShareLaunching(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onShareLaunching(host);
        } catch (Throwable t) {
            Log.w(TAG, "onShareLaunching failed", t);
        }
    }

    public static void onShareLockCleared(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onShareLockCleared(host);
        } catch (Throwable t) {
            Log.w(TAG, "onShareLockCleared failed", t);
        }
    }

    public static void onWindowFocusChanged(Object fragment, boolean hasFocus) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onWindowFocusChanged(host, hasFocus);
        } catch (Throwable t) {
            Log.w(TAG, "onWindowFocusChanged failed", t);
        }
    }

    public static void onBecameVisible(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onBecameVisible(host);
        } catch (Throwable t) {
            Log.w(TAG, "onBecameVisible failed", t);
        }
    }

    public static void onBecameHidden(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onBecameHidden(host);
        } catch (Throwable t) {
            Log.w(TAG, "onBecameHidden failed", t);
        }
    }

    public static void onDestroyView(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onDestroyView(host);
        } catch (Throwable t) {
            Log.w(TAG, "onDestroyView failed", t);
        }
    }

    public static void onPlaybackStateChanged(Object fragment) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onPlaybackStateChanged(host);
        } catch (Throwable t) {
            Log.w(TAG, "onPlaybackStateChanged failed", t);
        }
    }

    public static void onLyricsRendered(Object fragment, Object songInfoPtr) {
        if (!(fragment instanceof LyricsScrollHost host)) return;
        try {
            POLICY.onLyricsRendered(host, songInfoPtr != null);
        } catch (Throwable t) {
            Log.w(TAG, "onLyricsRendered failed", t);
        }
    }

    public static boolean isViewAlignedNearTop(View recyclerView, View child, int adapterPos, int topOffset) {
        if (recyclerView == null || child == null) return false;
        int expectedTop = recyclerView.getPaddingTop() + topOffset;
        int tolerance = Math.max(48, recyclerView.getHeight() / 8);
        int childTop = child.getTop();
        if (Math.abs(childTop - expectedTop) <= tolerance) {
            return true;
        }
        if (childTop < expectedTop && !recyclerView.canScrollVertically(-1)) {
            return true;
        }
        return childTop > expectedTop && !recyclerView.canScrollVertically(1);
    }

    /**
     * Resolves the 0-based lyric line index matching {@code positionMs} from a {@code SongInfoPtr}.
     * Prefers an active line containing {@code positionMs}, else the next upcoming line, else the last line.
     */
    public static int findLineIndexForTime(Object songInfoPtr, long positionMs) {
        if (songInfoPtr == null || positionMs < 0L) return -1;
        try {
            Method getSong = songPtrGet;
            if (getSong == null) {
                getSong = songInfoPtr.getClass().getMethod("get");
                songPtrGet = getSong;
            }
            Object song = getSong.invoke(songInfoPtr);
            if (song == null) return -1;

            Method getSections = songGetSections;
            if (getSections == null) {
                getSections = song.getClass().getMethod("getSections");
                songGetSections = getSections;
            }
            Object sections = getSections.invoke(song);
            if (sections == null) return -1;

            Method secSizeM = sectionVecSize;
            Method secGetM = sectionVecGet;
            if (secSizeM == null || secGetM == null) {
                secSizeM = sections.getClass().getMethod("size");
                secGetM = sections.getClass().getMethod("get", long.class);
                sectionVecSize = secSizeM;
                sectionVecGet = secGetM;
            }

            long secCount = ((Number) secSizeM.invoke(sections)).longValue();
            int flatIndex = 0;
            int lastStarted = -1;
            int firstUpcoming = -1;

            for (long s = 0; s < secCount; s++) {
                Object secPtr = secGetM.invoke(sections, s);
                if (secPtr == null) continue;
                Method spGet = sectionPtrGet;
                if (spGet == null) {
                    spGet = secPtr.getClass().getMethod("get");
                    sectionPtrGet = spGet;
                }
                Object sec = spGet.invoke(secPtr);
                if (sec == null) continue;
                Method sLines = sectionGetLines;
                if (sLines == null) {
                    sLines = sec.getClass().getMethod("getLines");
                    sectionGetLines = sLines;
                }
                Object lines = sLines.invoke(sec);
                if (lines == null) continue;

                Method lSizeM = lineVecSize;
                Method lGetM = lineVecGet;
                if (lSizeM == null || lGetM == null) {
                    lSizeM = lines.getClass().getMethod("size");
                    lGetM = lines.getClass().getMethod("get", long.class);
                    lineVecSize = lSizeM;
                    lineVecGet = lGetM;
                }
                long lineCount = ((Number) lSizeM.invoke(lines)).longValue();
                for (long l = 0; l < lineCount; l++) {
                    Object linePtr = lGetM.invoke(lines, l);
                    if (linePtr != null) {
                        Method lpGet = linePtrGet;
                        if (lpGet == null) {
                            lpGet = linePtr.getClass().getMethod("get");
                            linePtrGet = lpGet;
                        }
                        Object line = lpGet.invoke(linePtr);
                        if (line != null) {
                            Method beginM = lineGetBegin;
                            Method endM = lineGetEnd;
                            if (beginM == null || endM == null) {
                                beginM = line.getClass().getMethod("getBegin");
                                endM = line.getClass().getMethod("getEnd");
                                lineGetBegin = beginM;
                                lineGetEnd = endM;
                            }
                            long begin = ((Number) beginM.invoke(line)).longValue();
                            long end = ((Number) endM.invoke(line)).longValue();
                            if (positionMs >= begin && (end <= begin || positionMs < end)) {
                                return flatIndex;
                            }
                            if (positionMs < begin && firstUpcoming < 0) {
                                firstUpcoming = flatIndex;
                            }
                            if (positionMs >= begin) {
                                lastStarted = flatIndex;
                            }
                        }
                    }
                    flatIndex++;
                }
            }
            if (firstUpcoming >= 0) return firstUpcoming;
            if (lastStarted >= 0) return lastStarted;
            return flatIndex > 0 ? 0 : -1;
        } catch (Throwable t) {
            Log.w(TAG, "Failed resolving lyric line for playback time", t);
            return -1;
        }
    }
}
