/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * Adapted from https://github.com/crimera/piko (GPL-3.0).
 * See META-INF/PROTEUS-NOTICE.txt for GPLv3 §7(b) terms.
 */

package app.template.extension.extension;

/**
 * Built-in like-animation values exposed by Instagram's metadata enum.
 *
 * <p>The list mirrors piko's animation array. Instagram only accepts values
 * that exist in the enum of the installed build; {@link InstagramLikeAnimation}
 * filters the list at runtime and falls back to the default heart.</p>
 */
public final class InstagramLikeAnimations {
    public static final String DEFAULT = "DEFAULT";
    public static final String RANDOM = "RANDOM";

    private static final String[] VALUES = {
            DEFAULT,
            RANDOM,
            "ANYWAY_LIKE_ACTIVATION",
            "RINGS_LIKE_ADRIAN",
            "RINGS_LIKE_AKI_KOCHI",
            "RINGS_LIKE_BRIAN",
            "RINGS_LIKE_BRICKLEY",
            "RINGS_LIKE_COLE",
            "RINGS_LIKE_DJAG",
            "RINGS_LIKE_DOLLY",
            "RINGS_LIKE_ELYSE",
            "RINGS_LIKE_FILM",
            "RINGS_LIKE_FUTURA",
            "RINGS_LIKE_GABRIEL",
            "RINGS_LIKE_GOLLORIA",
            "RINGS_LIKE_HOMESTEAD",
            "RINGS_LIKE_KIDS",
            "RINGS_LIKE_LAUFEY",
            "RINGS_LIKE_LINDA",
            "RINGS_LIKE_MIMLES",
            "RINGS_LIKE_NIGEL",
            "RINGS_LIKE_NINA",
            "RINGS_LIKE_OLIVIA",
            "RINGS_LIKE_SEB",
            "RINGS_LIKE_TWINS",
            "RINGS_LIKE_TYSHAWN",
            "RINGS_LIKE_ZARNA",
    };

    private InstagramLikeAnimations() {
    }

    public static String[] values() {
        return VALUES.clone();
    }

    public static boolean isDefaultOrRandom(String value) {
        return value == null || DEFAULT.equals(value) || RANDOM.equals(value);
    }

    public static String label(String value) {
        if (value == null || DEFAULT.equals(value)) {
            return "Default heart";
        }
        if (RANDOM.equals(value)) {
            return "Random each session";
        }
        String[] words = value.toLowerCase(java.util.Locale.US).split("_");
        StringBuilder label = new StringBuilder();
        for (String word : words) {
            if (word.isEmpty()) {
                continue;
            }
            if (label.length() > 0) {
                label.append(' ');
            }
            label.append(Character.toUpperCase(word.charAt(0))).append(word.substring(1));
        }
        return label.toString();
    }
}
