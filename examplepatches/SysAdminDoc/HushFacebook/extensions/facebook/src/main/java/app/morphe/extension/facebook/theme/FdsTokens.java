/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.theme;

import java.util.HashMap;
import java.util.Map;

/**
 * Reads the FDS token tables {@link MaterialYouTheme} declares. Apart from it, so AMOLED's light
 * mode can read them without starting Material You, which binds the wallpaper palette as it starts.
 */
final class FdsTokens {

    private FdsTokens() {}

    /** A token table: six hex digits are an opaque colour, eight a colour with its alpha first. */
    static Map<String, int[]> parse(String table) {
        Map<String, int[]> tokens = new HashMap<>();
        for (String entry : table.split(";")) {
            int equals = entry.indexOf('=');
            String[] hex = entry.substring(equals + 1).split(",");
            int[] values = new int[hex.length];
            for (int i = 0; i < hex.length; i++) {
                int rgb = Integer.parseUnsignedInt(hex[i], 16);
                values[i] = hex[i].length() == 8 ? rgb : 0xFF000000 | rgb;
            }
            if (tokens.put(entry.substring(0, equals), values) != null) {
                throw new IllegalStateException("token listed twice: " + entry);
            }
        }
        return tokens;
    }
}
