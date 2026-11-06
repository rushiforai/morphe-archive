package app.morphe.extension.applemusic;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

/**
 * Focus hand-off for the Now Playing sheet. The sheet is a BottomSheet whose container is
 * `focusable=false`/`importantForAccessibility=no`, so the D-pad keeps the focus on the content
 * list behind it. The BottomSheetBehavior callback runs on expansion/collapse; this helper moves
 * the focus to the play/pause control on expansion and back to the mini player on collapse.
 *
 * The app re-enables the focusable `player_controls` container at runtime, so every round
 * disables it again before moving the focus.
 */
public final class TvFocusCompat {
    private static final String TAG = "TvFocusCompat";
    private static final int STATE_EXPANDED = 3;
    private static final int STATE_COLLAPSED = 4;
    private static final long[] DELAYS_MS = {0L, 300L, 600L, 900L, 1200L};
    /** After this delay the sheet animation is over and the focus is restored. */
    private static final long RESTORE_DELAY_MS = 600L;

    private TvFocusCompat() {
    }

    public static void onSheetState(View sheetRoot, int state) {
        if (sheetRoot == null) {
            return;
        }
        if (state == STATE_EXPANDED) {
            schedule(sheetRoot, true);
        } else if (state == STATE_COLLAPSED) {
            schedule(sheetRoot, false);
        }
    }

    private static void schedule(final View sheetRoot, final boolean expanded) {
        for (final long delay : DELAYS_MS) {
            sheetRoot.postDelayed(new Runnable() {
                @Override
                public void run() {
                    unfocusControlsContainer(sheetRoot);
                    if (expanded) {
                        focusControl(sheetRoot);
                    } else if (delay >= RESTORE_DELAY_MS) {
                        focusMiniPlayer(sheetRoot);
                    }
                }
            }, delay);
        }
    }

    private static void unfocusControlsContainer(View sheetRoot) {
        try {
            View container = find(sheetRoot.getRootView(), "player_controls");
            if (container != null) {
                container.setFocusable(false);
                container.setFocusableInTouchMode(false);
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "unfocusControlsContainer failed", throwable);
        }
    }

    private static void focusControl(View sheetRoot) {
        try {
            View target = find(sheetRoot, "play_pause");
            if (target == null) {
                Log.d(TAG, "no play_pause");
                return;
            }
            boolean focused = target.requestFocus();
            Log.d(TAG, "expand focus play_pause " + focused + " shown=" + target.isShown()
                    + " focusable=" + target.isFocusable() + " hasFocus=" + target.hasFocus());
        } catch (Throwable throwable) {
            Log.w(TAG, "focusControl failed", throwable);
        }
    }

    private static void focusMiniPlayer(View sheetRoot) {
        try {
            View pill = find(sheetRoot.getRootView(), "mini_player_content");
            if (pill != null && pill.isShown() && pill.requestFocus()) {
                Log.d(TAG, "collapse focus -> mini player");
                return;
            }
            View list = findContentList(sheetRoot.getRootView());
            if (list != null && list.requestFocus()) {
                Log.d(TAG, "collapse focus -> content list");
            } else {
                Log.d(TAG, "collapse focus -> none");
            }
        } catch (Throwable throwable) {
            Log.w(TAG, "focusMiniPlayer failed", throwable);
        }
    }

    private static View findContentList(View root) {
        if (!(root instanceof ViewGroup)) {
            return null;
        }
        ViewGroup group = (ViewGroup) root;
        for (int index = 0; index < group.getChildCount(); index++) {
            View child = group.getChildAt(index);
            if (child.getClass().getName().endsWith("EpoxyRecyclerView") && child.isShown()) {
                return child;
            }
            View nested = findContentList(child);
            if (nested != null) {
                return nested;
            }
        }
        return null;
    }

    private static View find(View root, String name) {
        Context context = root.getContext();
        int id = context.getResources().getIdentifier(name, "id", context.getPackageName());
        return id == 0 ? null : root.findViewById(id);
    }
}

