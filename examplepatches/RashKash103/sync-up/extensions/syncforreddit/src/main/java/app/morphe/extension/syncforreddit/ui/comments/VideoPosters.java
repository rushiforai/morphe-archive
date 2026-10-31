package app.morphe.extension.syncforreddit.ui.comments;

import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * The still a video is drawn as until it is tapped.
 *
 * <p>A video cannot be drawn in a line of text: the span that draws media there paints a
 * picture onto the text's own canvas, and there is nowhere in that for a player to live. What
 * can be drawn is the frame it starts on, which is what the card showed in miniature, so it is
 * taken here and drawn the size of everything else with a mark on it saying it will play.
 *
 * <p>The frame is written out as a picture, because the span fetches what it draws by address
 * and a picture already in hand is of no use to it. Written once and kept, so scrolling past a
 * video again costs nothing.
 *
 * @noinspection unused
 */
public final class VideoPosters {
    /** Where the stills are kept, under the app's own cache. */
    private static final String KEPT_IN = "sync-up-video-stills";

    /** What a still is written out as. Good enough for something drawn behind a play mark. */
    private static final int QUALITY = 85;

    /** Stills already taken, by the address of the video they came from. */
    private static final Map<String, String> stills =
            Collections.synchronizedMap(new HashMap<String, String>());

    /** Videos already being looked at, so a list redrawing does not ask again. */
    private static final Set<String> asking =
            Collections.synchronizedSet(new HashSet<String>());

    /** Videos that had no still to give, so they are not asked about over and over. */
    private static final Set<String> gaveNothing =
            Collections.synchronizedSet(new HashSet<String>());

    private static final ExecutorService LOOKING = Executors.newFixedThreadPool(2);

    private VideoPosters() {}

    /**
     * @return Where the still for this video is kept, or null where there is not one yet.
     *         Asking is done off to one side; until there is an answer the video is left as
     *         Sync drew it, which is a card that plays when it is tapped.
     */
    public static String stillFor(String link) {
        String kept = stills.get(link);
        if (kept != null) {
            return kept;
        }
        // One taken before the app was last closed is still on disk. Found here rather than
        // taken again, so a video is drawn the first time it is seen rather than standing as a
        // card until it has been looked at once more.
        String found = alreadyTaken(link);
        if (found != null) {
            return found;
        }
        if (!gaveNothing.contains(link)) {
            take(link);
        }
        return null;
    }

    /** @return A still taken on an earlier run, or null where there is not one. */
    private static String alreadyTaken(String link) {
        try {
            File out = new File(where(), Integer.toHexString(link.hashCode()) + ".jpg");
            if (!out.isFile() || out.length() == 0) {
                return null;
            }
            android.graphics.BitmapFactory.Options only =
                    new android.graphics.BitmapFactory.Options();
            only.inJustDecodeBounds = true;
            android.graphics.BitmapFactory.decodeFile(out.getAbsolutePath(), only);
            if (only.outWidth <= 0 || only.outHeight <= 0) {
                //noinspection ResultOfMethodCallIgnored
                out.delete();
                return null;
            }
            String where = "file://" + out.getAbsolutePath();
            InlineCommentMediaPatch.remember(where, only.outWidth, only.outHeight);
            stills.put(link, where);
            return where;
        } catch (Throwable ex) {
            Logger.printDebug(() -> "inline comments: could not read a kept still: " + ex);
            return null;
        }
    }

    private static void take(String link) {
        if (!asking.add(link)) {
            return;
        }
        LOOKING.execute(() -> {
            MediaMetadataRetriever reading = new MediaMetadataRetriever();
            try {
                reading.setDataSource(link, new HashMap<String, String>());
                Bitmap frame = reading.getFrameAtTime(0);
                if (frame == null) {
                    gaveNothing.add(link);
                    Logger.printInfo(() -> "inline comments: no still in " + link);
                    return;
                }
                File out = new File(where(), Integer.toHexString(link.hashCode()) + ".jpg");
                try (FileOutputStream writing = new FileOutputStream(out)) {
                    frame.compress(Bitmap.CompressFormat.JPEG, QUALITY, writing);
                }
                InlineCommentMediaPatch.remember("file://" + out.getAbsolutePath(),
                        frame.getWidth(), frame.getHeight());
                stills.put(link, "file://" + out.getAbsolutePath());
                Logger.printDebug(() -> "inline comments: took a still of " + link + " "
                        + frame.getWidth() + "x" + frame.getHeight());
            } catch (Throwable ex) {
                gaveNothing.add(link);
                Logger.printInfo(() -> "inline comments: could not take a still of "
                        + link + ": " + ex);
            } finally {
                try {
                    reading.release();
                } catch (Throwable ignored) {
                    // Nothing more to do with it.
                }
                asking.remove(link);
            }
        });
    }

    private static File where() {
        File kept = new File(Utils.getContext().getCacheDir(), KEPT_IN);
        if (!kept.isDirectory()) {
            //noinspection ResultOfMethodCallIgnored
            kept.mkdirs();
        }
        return kept;
    }
}
