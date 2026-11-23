package nl.johninnl.eclipse.auto.app;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.util.ArrayList;
import java.util.List;
import nl.johninnl.eclipse.app.ai5;
import nl.johninnl.eclipse.app.cm7;
import nl.johninnl.eclipse.app.j16;
import nl.johninnl.eclipse.app.j62;
import nl.johninnl.eclipse.app.o36;
import nl.johninnl.eclipse.app.s06;
import nl.johninnl.eclipse.app.u06;
import nl.johninnl.eclipse.app.x45;
import nl.johninnl.eclipse.auto.tree.MediaIds;
import nl.johninnl.eclipse.auto.tree.Node;
import nl.johninnl.eclipse.auto.tree.Paging;
import nl.johninnl.eclipse.auto.tree.TreeModel;

/**
 * The two hooks of the browse upgrade, behind {@code tree/BrowseTree}. {@link #children} answers a
 * browse request the app would otherwise answer itself, or returns null to let the app's own code run;
 * {@link #play} takes the ids this extension issued. Neither ever throws into the app: a failure is
 * null (the app's code runs) or an empty list.
 */
public final class TreeBridge {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Carries one request across the (possibly asynchronous) model answer. */
    private static final class Call implements TreeModel.Sink {
        final cm7 callback;
        final AppBridge app;
        final int pageSize;
        final u06 params;
        boolean synchronous = true;
        x45 immediate;
        PendingResult pending;

        Call(cm7 callback, AppBridge app, int pageSize, u06 params) {
            this.callback = callback;
            this.app = app;
            this.pageSize = pageSize;
            this.params = params;
        }

        @Override public void deliver(TreeModel.Listing listing) {
            x45 result = result(listing);
            if (synchronous) immediate = result;
            else pending.set(result);
        }

        void deliverEmpty() {
            x45 result = x45.c(new ArrayList<s06>(), params);
            if (synchronous) immediate = result;
            else pending.set(result);
        }

        private x45 result(TreeModel.Listing listing) {
            List<Node> page = Paging.cut(listing.nodes, listing.parent, listing.offset, pageSize);
            List<s06> items = new ArrayList<>(page.size());
            for (Node node : page) {
                try {
                    s06 item = TreeItems.build(callback, app, node);
                    if (item != null) items.add(item);
                } catch (Throwable unbuildable) {
                    // One item the app cannot build must not take the rest of the list down with it.
                }
            }
            return x45.c(items, params);
        }
    }

    /**
     * The children of {@code parentId} for a request the app's {@code j16.u} received, or null when
     * the app should answer (any id this extension does not own). The result honours {@code pageSize}.
     */
    public static ai5 children(j16 session, o36 controller, String parentId, int pageSize, u06 params) {
        try {
            if (!MediaIds.handles(parentId)) return null;
            Context context = session.f;
            final TreeRuntime runtime = TreeRuntime.get(context);
            runtime.remember(session);
            final Call call = new Call(session.e, runtime.app, pageSize, params);
            final String parent = parentId;
            Runnable work = new Runnable() {
                @Override public void run() {
                    try {
                        runtime.model.children(parent, call);
                    } catch (Throwable broken) {
                        call.deliverEmpty();
                    }
                }
            };
            if (Looper.myLooper() == Looper.getMainLooper()) {
                call.pending = new PendingResult();
                work.run();
                call.synchronous = false;
                if (call.immediate != null) return j62.n0(call.immediate);
                return call.pending;
            }
            call.pending = new PendingResult();
            call.synchronous = false;
            MAIN.post(work);
            return call.pending;
        } catch (Throwable unavailable) {
            return null;
        }
    }

    /**
     * Takes a media id the app is asked to play when it is one of ours. True means "handled, the
     * app must not look at it"; false leaves every other id to the app.
     */
    public static boolean play(cm7 callback, final String mediaId) {
        if (!MediaIds.isOurs(mediaId)) return false;
        try {
            Context context = callback.a;
            final TreeRuntime runtime = TreeRuntime.get(context);
            Runnable work = new Runnable() {
                @Override public void run() {
                    try {
                        runtime.model.play(mediaId);
                    } catch (Throwable ignored) {
                        // A failed play is a tap that did nothing, never a crash in the media session.
                    }
                }
            };
            if (Looper.myLooper() == Looper.getMainLooper()) work.run();
            else MAIN.post(work);
        } catch (Throwable ignored) {
            // Still handled: the app has no use for an id that starts with our prefix.
        }
        return true;
    }

    private TreeBridge() { }
}
