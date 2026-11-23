package nl.johninnl.eclipse.auto.app;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import nl.johninnl.eclipse.app.c16;
import nl.johninnl.eclipse.app.f16;
import nl.johninnl.eclipse.app.j16;
import nl.johninnl.eclipse.app.m46;
import nl.johninnl.eclipse.app.o36;
import nl.johninnl.eclipse.auto.data.Catalog;
import nl.johninnl.eclipse.auto.data.CatalogFactory;
import nl.johninnl.eclipse.auto.data.HomeBuilder;
import nl.johninnl.eclipse.auto.data.LibraryStore;
import nl.johninnl.eclipse.auto.data.RadioStore;
import nl.johninnl.eclipse.auto.tree.TreeModel;

/**
 * Everything the classic browse tree keeps for the life of the app process: the bridge to the app,
 * the same catalogue and stores the car screens use, the tree model, and the session the last
 * browse request came from (the one children-changed is delivered through).
 */
final class TreeRuntime {
    private static TreeRuntime instance;

    final AppBridge app;
    final TreeModel model;
    private volatile WeakReference<j16> session = new WeakReference<>(null);

    private TreeRuntime(Context context) {
        app = new AppBridge(context);
        LibraryStore library = new LibraryStore(app);
        HomeBuilder builder = new HomeBuilder(app, library, new RadioStore(app));
        final TreeModel[] holder = new TreeModel[1];
        // The feed thread lives as long as the process: the browse tree has no screen to end it.
        Catalog catalog = CatalogFactory.create(context, app, CatalogFactory.newExecutor(), new Runnable() {
            @Override public void run() {
                TreeModel current = holder[0];
                if (current != null) current.catalogChanged();
            }
        });
        final Handler main = new Handler(Looper.getMainLooper());
        holder[0] = model = new TreeModel(app, catalog, builder, new TreeModel.Scheduler() {
            @Override public void postDelayed(Runnable task, long delayMs) { main.postDelayed(task, delayMs); }
        }, new TreeModel.Notifier() {
            @Override public void childrenChanged(String parentId, int itemCount) { notifyChildren(parentId, itemCount); }
        });
        Signals.setTreeListener(new Runnable() {
            @Override public void run() { holder[0].queueChanged(); }
        });
    }

    static synchronized TreeRuntime get(Context context) {
        if (instance == null) instance = new TreeRuntime(context.getApplicationContext() != null ? context.getApplicationContext() : context);
        return instance;
    }

    /** Remember the session a browse request came from: children-changed goes out through it. */
    void remember(j16 current) {
        WeakReference<j16> known = session;
        if (known.get() != current) session = new WeakReference<>(current);
    }

    /**
     * Tell every subscribed controller that {@code parentId}'s children changed: the Media3
     * controllers the session lists, then the legacy browsers (what Android Auto's classic media
     * browser is). The session's own task checks each controller's subscription, so a controller that
     * is not looking at this parent hears nothing. Nothing here may fail into the app.
     */
    private void notifyChildren(String parentId, int itemCount) {
        try {
            j16 current = session.get();
            if (current == null) return;
            m46 task = new f16(current, parentId, itemCount, null);
            List<?> media3 = current.g.e.Y();
            c16 legacyService = current.h();
            List<?> legacy = legacyService == null ? Collections.emptyList() : legacyService.A.Y();
            java.util.IdentityHashMap<Object, Boolean> seen = new java.util.IdentityHashMap<>();
            for (Object controller : media3) if (seen.put(controller, Boolean.TRUE) == null) current.f((o36) controller, task);
            for (Object controller : legacy) if (seen.put(controller, Boolean.TRUE) == null) current.f((o36) controller, task);
        } catch (Throwable ignored) {
            // A failed announcement only means a controller refreshes when it next asks.
        }
    }
}
