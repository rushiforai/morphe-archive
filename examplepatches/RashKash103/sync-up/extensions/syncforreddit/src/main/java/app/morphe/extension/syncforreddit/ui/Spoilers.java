package app.morphe.extension.syncforreddit.ui;

import android.view.View;

import androidx.annotation.Nullable;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;

/**
 * Opens a spoiler where it sits, rather than through the rewriting Sync answers a tap with.
 *
 * <p>Sync reveals one by taking the markers out of the body it holds for the post and writing
 * that back to its own store. That only runs for one kind of post, and the body it reads has
 * already had the markers taken out of it by the time it gets there, so the tap ends at
 * "Missing post information" instead. It is not a null to be filled in: the post is there, and
 * neither the kind nor the markers are what the span was built from.
 *
 * <p>A spoiler is hidden by being painted in the colour it sits on, and the span says of itself
 * that it changes nothing but how it is drawn. So a tap is answered by remembering the span and
 * asking the view to draw again, and the painting is skipped for one that has been tapped. The
 * words are already there; nothing is fetched, stored, or rewritten.
 *
 * <p>Held weakly and by identity: a span belongs to the text it was built for, and keeping one
 * alive would keep that text and the post behind it alive with it. What this costs is that a
 * spoiler closes again when the text is built afresh, which is the same as Sync's own behaviour
 * wherever its rewriting did not take.
 *
 * @noinspection unused
 */
public final class Spoilers {
    /**
     * The spans tapped so far. A set over a weak map, so nothing here holds a span up; the spans
     * do not answer equals, so this is identity, which is what is wanted.
     */
    private static final Set<Object> tapped =
            Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private Spoilers() {}

    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /**
     * @return Whether this spoiler has been opened, and so is to be drawn as ordinary words.
     */
    public static boolean revealed(@Nullable Object spoiler) {
        return spoiler != null && tapped.contains(spoiler);
    }

    /**
     * @return Whether the tap was answered here, which is what decides whether Sync's own reveal
     *         is left to run. Answering false where the patch is not included leaves the app
     *         exactly as it was.
     */
    public static boolean reveal(@Nullable Object spoiler, @Nullable View in) {
        if (!isPatchIncluded() || spoiler == null) {
            return false;
        }

        tapped.add(spoiler);
        if (in != null) {
            // The span is an UpdateAppearance, so what it changes is the painting and nothing
            // about where the words sit. Drawing again is the whole of it.
            in.invalidate();
        }
        Logger.printDebug(() -> "Opened a spoiler");
        return true;
    }
}
