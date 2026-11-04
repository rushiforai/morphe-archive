package app.wordfeudwordfinder.extension.play;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Candidate 4 (spec 8.4): pretends a push message arrived, on the firebase_messaging plugin's method channel
 * {@code plugins.flutter.io/firebase_messaging} (StandardMethodCodec), method {@code Messaging#onMessage}, with a
 * RemoteMessage map as the plugin's Android side builds it ({@code messageId}, {@code sentTime}, {@code data}).
 *
 * <p>The keys inside {@code data} that Wordfeud reacts to are unknown (the probe logs contain no push payload):
 * {@code type=move} and {@code game_id} are a guess. Not verified on a device (V4).
 */
public final class FcmNudge implements Refresher.Strategy {
    public static final String NAME = "FcmNudge";
    static final String CHANNEL = "plugins.flutter.io/firebase_messaging";
    static final String METHOD = "Messaging#onMessage";

    private final Refresher.Messenger messenger;
    private final Clock clock;

    /** Wall clock in ms (own interface so tests can supply a fake clock; the extension needs API 24 or newer). */
    interface Clock {
        long nowMs();
    }

    public FcmNudge(Refresher.Messenger messenger) {
        this(messenger, System::currentTimeMillis);
    }

    FcmNudge(Refresher.Messenger messenger, Clock clock) {
        this.messenger = messenger;
        this.clock = clock;
    }

    @Override
    public boolean refresh(long gameId) {
        long now = clock.nowMs();
        Map<String, Object> data = new LinkedHashMap<>();
        data.put("type", "move");
        data.put("game_id", Long.toString(gameId));
        Map<String, Object> message = new LinkedHashMap<>();
        message.put("messageId", "wfwf-" + now);
        message.put("sentTime", Long.valueOf(now));
        message.put("data", data);
        return messenger.send(CHANNEL, Collections.singletonList(MessageCodecs.standardMethodCall(METHOD, message)), 0);
    }

    @Override
    public String name() {
        return NAME;
    }
}
