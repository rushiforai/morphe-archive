package nl.johninnl.eclipse.auto.app;

import android.os.Bundle;
import com.eclipse.android.data.models.Song;
import nl.johninnl.eclipse.app.cm7;
import nl.johninnl.eclipse.app.n16;
import nl.johninnl.eclipse.app.p16;
import nl.johninnl.eclipse.app.s06;
import nl.johninnl.eclipse.auto.tree.Node;

/**
 * Turns a plain {@link Node} into the app's own media item. Folders and songs come from the app's
 * item builders ({@code cm7.b}, {@code cm7.h}), so artwork, content style and flags are exactly what
 * the shipped tree produces. A node that carries a group title, or is a station, is rebuilt once
 * from its own metadata with the extras and flags added; every other item is returned untouched.
 */
final class TreeItems {
    /** The media item for {@code node}, or null when it cannot be shown (a song the app cannot build). */
    static s06 build(cm7 callback, AppBridge app, Node node) {
        s06 base;
        if (node.kind == Node.Kind.SONG) {
            Song song = app.songOf(node.track);
            if (song == null) return null;
            base = callback.h(song, node.id);
        } else {
            base = callback.b(node.id, node.mediaType, node.title, node.subtitle, node.artUrl);
        }
        if (base == null || !node.needsRebuild()) return base;
        return rebuild(base, node);
    }

    /** The same item with the node's extras merged into its own and, for a station, playable instead of browsable. */
    static s06 rebuild(s06 base, Node node) {
        n16 builder = base.d.a();
        Bundle extras = new Bundle();
        if (base.d.J != null) extras.putAll(base.d.J);
        extras.putAll(node.extras());
        builder.I = extras;
        if (node.kind == Node.Kind.STATION) {
            builder.r = Boolean.FALSE;
            builder.s = Boolean.TRUE;
            builder.H = Integer.valueOf(Node.TYPE_MUSIC);
        }
        return new s06(base.a, base.e, base.b, base.c, new p16(builder), base.f);
    }

    private TreeItems() { }
}
