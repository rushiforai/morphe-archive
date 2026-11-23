package nl.johninnl.eclipse.auto.screens;

import androidx.car.app.CarContext;
import androidx.car.app.model.Template;
import nl.johninnl.eclipse.auto.ui.Pages;

/**
 * The host's now-playing template. Transport controls, artwork, progress and the session's
 * custom actions come from the registered session; nothing is re-implemented. Until a token has
 * been registered a loading or failure message is shown instead, so the template is never sent to
 * a host that has no session for it.
 */
public final class PlayerScreen extends BaseScreen {
    public static final String MARKER = "eclipse-player";

    public PlayerScreen(CarContext context, Host host) {
        super(context, host);
        setMarker(MARKER);
    }

    @Override public Template onGetTemplate() {
        return Pages.player(host.env(), host.playerReady(), host.playerError(), this::upNext, this::reconnect);
    }

    private void upNext() {
        if (onTop()) host.showQueue();
    }

    private void reconnect() {
        if (onTop()) host.reconnect();
    }
}
