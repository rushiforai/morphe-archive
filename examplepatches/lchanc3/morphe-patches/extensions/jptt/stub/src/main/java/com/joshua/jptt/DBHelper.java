package com.joshua.jptt;

import android.content.Context;

/** Stub of the class already present in the JPTT APK. */
@SuppressWarnings("ALL")
public class DBHelper {

    public static void deleteBoardHistory(Context context, String board, String keyword, String site) {
        throw new UnsupportedOperationException("stub");
    }

    /** {@code searches} true clears the search history, false the board history. */
    public static void clearBoardHistory(Context context, String site, boolean searches) {
        throw new UnsupportedOperationException("stub");
    }
}
