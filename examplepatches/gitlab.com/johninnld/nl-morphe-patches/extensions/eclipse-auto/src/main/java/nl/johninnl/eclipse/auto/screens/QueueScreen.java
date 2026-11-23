package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.model.Template;
import nl.johninnl.eclipse.auto.data.Playback;
import nl.johninnl.eclipse.auto.data.QueueView;
import nl.johninnl.eclipse.auto.ui.Pages;

/**
 * Up Next: Now playing, the songs the driver queued, then the rest of the context. Jumps never
 * discard queued songs; Clear removes only what the driver queued. The app's queue signals refresh
 * this screen when anything changes the queue.
 */
public final class QueueScreen extends BaseScreen implements Pages.QueueActions {
    public QueueScreen(CarContext context, Host host) {
        super(context, host);
    }

    @Override public Template onGetTemplate() {
        return Pages.queue(host.env(), QueueView.of(host.app().queue()), this);
    }

    @Override public void jumpToUpNext(int index) {
        if (!onTop()) return;
        Playback.jumpToUpNext(host.app(), index);
        invalidate();
    }

    @Override public void jumpToContext(QueueView.Row row) {
        if (!onTop()) return;
        Playback.jumpToContext(host.app(), row.track, row.index);
        invalidate();
    }

    @Override public void clear() {
        if (!onTop()) return;
        host.app().clearUpNext();
        invalidate();
    }
}
