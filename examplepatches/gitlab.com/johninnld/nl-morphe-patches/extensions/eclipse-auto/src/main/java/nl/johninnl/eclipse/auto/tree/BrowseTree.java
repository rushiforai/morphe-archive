package nl.johninnl.eclipse.auto.tree;

import java.util.List;
import nl.johninnl.eclipse.app.ai5;
import nl.johninnl.eclipse.app.cm7;
import nl.johninnl.eclipse.app.j16;
import nl.johninnl.eclipse.app.o36;
import nl.johninnl.eclipse.app.u06;
import nl.johninnl.eclipse.app.x45;
import nl.johninnl.eclipse.auto.app.TreeBridge;

/**
 * The entry points the browse upgrade patch calls from the app. They are only the hook
 * signatures (the one place in {@code tree} that names app types): the work is in {@link TreeModel}
 * (plain data) and {@link TreeBridge} (the app's item and future types).
 */
public final class BrowseTree {
    /**
     * Called first thing in the app's children method. A non-null result is returned to the caller
     * as is; null lets the app answer. The page size is honoured: the list never exceeds it. The page
     * size is also remembered for {@link #page}, which cuts the lists the app answers itself.
     */
    public static ai5 children(j16 session, o36 controller, String parentId, int pageSize, u06 params) {
        PageLimit.set(pageSize);
        return TreeBridge.children(session, controller, parentId, pageSize, params);
    }

    /**
     * Replaces the app's own "wrap this child list in a library result" call at the one place the
     * app answers every node it owns. A list that fits the page size is wrapped exactly as before; a
     * longer one is cut to its first page instead of failing the app's page-size check afterwards.
     */
    public static x45 page(List list, u06 params) {
        List shown = list;
        try {
            shown = PageLimit.limit(list, PageLimit.current());
        } catch (Throwable ignored) {
            // Anything odd about the list: hand it on untouched, as the app would have.
        }
        return x45.c(shown, params);
    }

    /** Called first thing in the app's play-by-media-id method; true means the id was ours and is handled. */
    public static boolean play(cm7 callback, String mediaId) {
        return TreeBridge.play(callback, mediaId);
    }

    private BrowseTree() { }
}
