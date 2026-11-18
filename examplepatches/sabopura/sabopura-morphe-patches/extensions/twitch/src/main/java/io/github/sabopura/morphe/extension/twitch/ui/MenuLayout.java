package io.github.sabopura.morphe.extension.twitch.ui;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** The player menu's section order and which sections are hidden, stored as {@code "speed,-ads,..."}. */
final class MenuLayout {
    static final String KEY = "player_menu_layout";
    static final String ADS = "ads", DANMAKU = "danmaku", SPEED = "speed", SLEEP = "sleep",
            CONTROLS = "controls", CHAT = "chat", CHANNEL = "channel";
    private static final List<String> DEFAULT_ORDER = Arrays.asList(ADS, DANMAKU, SPEED, SLEEP, CONTROLS, CHAT, CHANNEL);

    final List<String> order = new ArrayList<>();
    final Set<String> hidden = new HashSet<>();

    /** Unknown names are dropped and sections added by later versions join the end, visible. */
    static MenuLayout parse(String stored) {
        MenuLayout layout = new MenuLayout();
        for (String part : (stored == null ? "" : stored).split(",")) {
            boolean off = part.startsWith("-");
            String name = off ? part.substring(1) : part;
            if (!DEFAULT_ORDER.contains(name) || layout.order.contains(name)) continue;
            layout.order.add(name);
            if (off) layout.hidden.add(name);
        }
        for (String name : DEFAULT_ORDER) if (!layout.order.contains(name)) layout.order.add(name);
        return layout;
    }

    String serialize() {
        StringBuilder out = new StringBuilder();
        for (String name : order) {
            if (out.length() > 0) out.append(',');
            if (hidden.contains(name)) out.append('-');
            out.append(name);
        }
        return out.toString();
    }
}
