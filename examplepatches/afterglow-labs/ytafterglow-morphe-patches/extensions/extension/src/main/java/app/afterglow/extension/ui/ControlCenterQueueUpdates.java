package app.afterglow.extension.ui;

import android.view.View;
import android.widget.TextView;
import java.util.function.BooleanSupplier;
import app.afterglow.extension.downloads.DownloadManager;

/** Keeps progress text live without replacing focused controls or postponing updates forever. */
final class ControlCenterQueueUpdates implements DownloadManager.Listener, View.OnAttachStateChangeListener, Runnable {
    private final View anchor;
    private final DownloadManager downloads;
    private final ControlCenterQueueState rendered;
    private final TextView status;
    private final BooleanSupplier alive;
    private final Runnable rebuild;
    private boolean pending, rebuilding;

    ControlCenterQueueUpdates(View anchor, DownloadManager downloads, ControlCenterQueueState rendered,
                              TextView status, BooleanSupplier alive, Runnable rebuild) {
        this.anchor = anchor;
        this.downloads = downloads;
        this.rendered = rendered;
        this.status = status;
        this.alive = alive;
        this.rebuild = rebuild;
        anchor.addOnAttachStateChangeListener(this);
    }

    static ControlCenterQueueState snapshot(DownloadManager downloads) {
        return downloads == null ? null : new ControlCenterQueueState(downloads.isLoaded(), downloads.snapshot(),
                downloads.library().snapshot(), downloads.recoveryMessage(), downloads.library().recoveryMessage());
    }

    @Override public void onDownloadsChanged() {
        if (!pending && !rebuilding && anchor.isAttachedToWindow()) {
            pending = true;
            anchor.postDelayed(this, 250);
        }
    }

    @Override public void run() {
        pending = false;
        if (!anchor.isAttachedToWindow() || !alive.getAsBoolean()) return;
        ControlCenterQueueState current = snapshot(downloads);
        if (!rendered.sameControls(current)) {
            rebuilding = true;
            rebuild.run();
        } else if (status != null) {
            String value = current.status();
            if (!value.contentEquals(status.getText())) status.setText(value);
        }
    }

    @Override public void onViewAttachedToWindow(View view) {
        downloads.addListener(this);
        // Catch a load/state change between constructing the screen and attachment.
        onDownloadsChanged();
    }

    @Override public void onViewDetachedFromWindow(View view) {
        anchor.removeCallbacks(this);
        pending = false;
        downloads.removeListener(this);
    }
}
