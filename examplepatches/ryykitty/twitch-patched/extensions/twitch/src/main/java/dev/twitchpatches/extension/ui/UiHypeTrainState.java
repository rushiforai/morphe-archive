package dev.twitchpatches.extension.ui;

import java.util.ArrayList;
import java.util.List;

public final class UiHypeTrainState {
    private Object banner, pill, expansion;
    private int phase;

    public UiHypeTrainState() { }

    void accept(Object event, int kind) {
        if (kind == 0) { banner = pill = expansion = null; phase = 0; }
        else if (kind == 1 || kind == 2) {
            banner = event;
            if (phase != kind) pill = null;
            phase = kind;
        } else if (kind == 3) pill = event;
        else if (kind == 4) expansion = event;
        else throw new IllegalArgumentException("Unknown Hype Train presentation event.");
    }

    List<Object> restore() {
        List<Object> events = new ArrayList<>(3);
        if (banner == null) return events;
        events.add(banner);
        if (pill != null) events.add(pill);
        if (expansion != null) events.add(expansion);
        return events;
    }
}
