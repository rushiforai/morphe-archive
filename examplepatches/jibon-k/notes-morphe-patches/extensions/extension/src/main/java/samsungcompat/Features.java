package samsungcompat;

import android.view.KeyEvent;

/**
 * Which optional patches were applied, and their options. Each method returns the "not patched" value;
 * the feature patches replace the method bodies at patch time.
 */
public final class Features {
    private Features() {}

    /** "Folder sync" patch: show the sync entries in the Backup and sync dialog. */
    public static boolean syncEnabled() {
        return false;
    }

    /** "Pen button actions" patch: key code of the upper (first) pen button. */
    public static int penKeyUpper() {
        return KeyEvent.KEYCODE_PAGE_UP;
    }

    /** "Pen button actions" patch: key code of the lower (second) pen button. */
    public static int penKeyLower() {
        return KeyEvent.KEYCODE_PAGE_DOWN;
    }

    /**
     * "Pen button actions" patch: only keys from an input device whose name contains this; empty = any
     * device, "@stylus" = any device with a stylus source. Learned buttons override it.
     */
    public static String penDeviceName() {
        return "";
    }
}
