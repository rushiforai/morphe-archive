package com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom;

import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;

/**
 * The sheet Sync offers its own actions in, which knows how to carry each of them out.
 *
 * <p>Compile only, and named as the app names it. Only the members used are declared.
 */
public class ActionsBottomSheetFragment {
    /**
     * Carries out one action. The sheet itself is only there to be dismissed afterwards, so a
     * caller that is not a sheet passes nothing.
     */
    public static void w4(FragmentActivity activity, FragmentManager manager, String subreddit,
                          int action, ActionsBottomSheetFragment sheet) {
        throw new UnsupportedOperationException("Stub");
    }
}
