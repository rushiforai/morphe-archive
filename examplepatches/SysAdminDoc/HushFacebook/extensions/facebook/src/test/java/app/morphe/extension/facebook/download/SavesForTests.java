/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import android.content.Context;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * A running save for a test outside this package, driven step by step the way a save's worker
 * drives it: bytes arrive, the tracks are joined, the file goes into the gallery, and it ends.
 */
public final class SavesForTests {
    private SavesForTests() {
    }

    private static final Map<Integer, SaveControl.Save> STARTED = new ConcurrentHashMap<>();

    /** Starts watching a save, as a tap does, and answers its number. */
    public static int begin(Context context, boolean video) {
        SaveControl.Save save = SaveControl.begin(context, video);
        STARTED.put(save.id, save);
        return save.id;
    }

    public static void transferred(int id, long done, long total) {
        STARTED.get(id).transferred(done, total);
    }

    public static void joining(int id) {
        STARTED.get(id).joining();
    }

    public static void saving(int id) {
        STARTED.get(id).saving();
    }

    public static boolean publishing(int id) {
        return STARTED.get(id).publishing();
    }

    /** Whether the save saw a cancel, as its worker would at its next check. */
    public static boolean cancelled(int id) {
        return STARTED.get(id).cancelled();
    }

    /** The save is over, as its worker ends it. */
    public static void end(int id) {
        SaveControl.Save save = STARTED.remove(id);
        if (save != null) save.end();
    }

    /** Ends every save a test started and left running. */
    public static void endAll() {
        for (Integer id : STARTED.keySet()) end(id);
    }
}
