package app.spicetify.extension.spotify.theme;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/** Spotify's color resources for each theme role, with the stock alpha of translucent ones. */
public final class ThemeRoleMap {
    /** A Spotify color resource and the alpha of its stock value. */
    public static final class Target {
        public final String name;
        public final int alpha;

        Target(String name, int alpha) {
            this.name = name;
            this.alpha = alpha;
        }
    }

    private ThemeRoleMap() {}

    /** The theme patch replaces this with the table for the patched Spotify version. */
    static String encoded() {
        return "";
    }

    public static Map<String, List<Target>> load() {
        return parse(encoded());
    }

    /** Parses {@code role:name,name@AA|role:...}. */
    static Map<String, List<Target>> parse(String encoded) {
        Map<String, List<Target>> roles = new LinkedHashMap<>();
        for (String group : encoded.split("\\|")) {
            int colon = group.indexOf(':');
            if (colon <= 0) continue;
            List<Target> targets = new ArrayList<>();
            for (String item : group.substring(colon + 1).split(",")) {
                if (item.isEmpty()) continue;
                int at = item.indexOf('@');
                targets.add(at < 0 ? new Target(item, 0xFF)
                        : new Target(item.substring(0, at), Integer.parseInt(item.substring(at + 1), 16)));
            }
            roles.put(group.substring(0, colon), Collections.unmodifiableList(targets));
        }
        return Collections.unmodifiableMap(roles);
    }

    /** One overlay value per mapped color: its role color, keeping the color's stock alpha. */
    static Map<String, Integer> overlayValues(Map<String, List<Target>> roleMap, Map<String, Integer> roleColors) {
        Map<String, Integer> values = new LinkedHashMap<>();
        for (Map.Entry<String, Integer> role : roleColors.entrySet()) {
            List<Target> targets = roleMap.get(role.getKey());
            if (targets == null) continue;
            int color = role.getValue();
            for (Target target : targets) {
                int alpha = (target.alpha * (color >>> 24) + 127) / 255;
                values.put(target.name, (alpha << 24) | (color & 0xFFFFFF));
            }
        }
        return values;
    }
}
