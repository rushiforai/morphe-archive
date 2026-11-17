/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.content.Context;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/** Lets a test outside this package hand ListBackground page color ids and a picture without Telegram. */
public final class ListBackgroundForTests {
    private ListBackgroundForTests() {}

    /** Ids 1 to 3 for the page colors. */
    public static void useIds() {
        ListBackground.ids = new int[]{1, 2, 3};
    }

    /** Some bytes where the picture behind the lists is kept, which is all the switch looks for. */
    public static void keepPicture(Context context) {
        File file = SavedPicture.file(context, SavedPicture.LIST_BACKGROUND);
        File folder = file.getParentFile();
        if (folder == null || !folder.mkdirs() && !folder.isDirectory()) throw new AssertionError("no folder for " + file);
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(new byte[]{1, 2, 3});
        } catch (IOException failure) {
            throw new AssertionError(failure);
        }
    }

    /** Removes the picture, forgets the ids and takes the markers off. */
    public static void forget(Context context) {
        SavedPicture.remove(context, SavedPicture.LIST_BACKGROUND);
        ListBackground.ids = null;
        ListBackground.refreshing();
    }
}
