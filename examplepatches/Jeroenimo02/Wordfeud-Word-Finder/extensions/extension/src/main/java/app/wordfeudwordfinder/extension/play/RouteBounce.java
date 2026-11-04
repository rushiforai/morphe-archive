package app.wordfeudwordfinder.extension.play;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Candidate 2 (spec 8.4): navigates to {@code /} and, {@link #BOUNCE_DELAY_MS} later, back to {@code /game/<id>}
 * via {@code flutter/navigation} {@code pushRouteInformation} (JSONMethodCodec), so the game screen is rebuilt.
 *
 * <p>The Android embedding sends {@code pushRouteInformation} with the key {@code location}; Dart's
 * {@code routeInformationUpdated} (what RouteTap observes, spec 3 item 7) uses {@code uri}. Both keys are sent with
 * the same value, so either reading works; the other key is ignored. Not verified on a device (V4).
 */
public final class RouteBounce implements Refresher.Strategy {
    public static final String NAME = "RouteBounce";
    static final String CHANNEL = "flutter/navigation";
    /** Between "/" and "/game/<id>": long enough for the first route to be processed, short enough not to show. */
    static final long BOUNCE_DELAY_MS = 80;

    private final Refresher.Messenger messenger;

    public RouteBounce(Refresher.Messenger messenger) {
        this.messenger = messenger;
    }

    @Override
    public boolean refresh(long gameId) {
        // one sequence: "/" is always followed by the game
        return messenger.send(CHANNEL, Arrays.asList(push("/"), push("/game/" + gameId)), BOUNCE_DELAY_MS);
    }

    @Override
    public String name() {
        return NAME;
    }

    static byte[] push(String route) {
        Map<String, Object> args = new LinkedHashMap<>();
        args.put("location", route);
        args.put("uri", route);
        args.put("state", null);
        return MessageCodecs.jsonMethodCall("pushRouteInformation", args);
    }
}
