/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b646 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Modified for HushGram (Instagram), 2026.
 */
package app.morphe.extension.hushthreads.download;

import android.content.Context;

import java.util.ArrayList;
import java.util.List;
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

    public static int beginCarousel(Context context, int pages) {
        SaveControl.Save save = SaveControl.begin(context, false, pages);
        STARTED.put(save.id, save);
        return save.id;
    }

    public static void page(int id, int page, boolean video) {
        STARTED.get(id).page(page, video);
    }

    public static void finishCarousel(int id, int saved, int failed, int skipped, int lower, boolean cancelled) {
        SaveControl.batchFinished(new MediaSave.BatchResult(saved, failed, skipped, lower, cancelled));
        end(id);
    }

    public static void resetCarouselOutcome() {
        SaveControl.batchFinished(null);
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

    /** A job whose process ended before its terminal result, with no network or media identity. */
    public static void interrupt(Context context) throws Exception {
        SaveLeftovers.sweepOnce(context);
        SaveLeftovers.beginJob(context);
        SaveLeftovers.forgetSweepForTests();
        SaveLeftovers.showInterrupted(context);
        app.morphe.extension.shared.Utils.awaitBackgroundTasksForTests();
    }

    public static void resetInterruption() {
        SaveLeftovers.forgetSweepForTests();
    }

    /** Whether a post's menu offers Save for a post with one photo, read through a stand-in for the patch's bridges. */
    public static boolean menuOffersSave() {
        PostSave.Reader bridges = PostSave.reader;
        PostSave.reader = PostSaveTest.FAKE;
        try {
            PostSaveTest.Post post = new PostSaveTest.Post("3001_7");
            post.pictures = renditions("https://scontent.cdninstagram.com/v/photo.jpg");
            return PostSave.canSave(post);
        } finally {
            PostSave.reader = bridges;
        }
    }

    /** The single files a caller hands a save, as addresses alone. A null address is left out. */
    public static List<MediaSave.Rendition> renditions(String... urls) {
        List<MediaSave.Rendition> renditions = new ArrayList<>();
        for (String url : urls) {
            if (url != null) renditions.add(MediaSave.Rendition.of(url));
        }
        return renditions;
    }
}
