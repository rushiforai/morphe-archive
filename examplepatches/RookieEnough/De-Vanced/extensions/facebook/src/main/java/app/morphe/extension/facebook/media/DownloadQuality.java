/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook.media;

public enum DownloadQuality {
    HIGHEST("Highest available", 0),
    P1080("1080p", 1080),
    P720("720p", 720),
    P640("640p", 640),
    P540("540p", 540),
    P480("480p", 480),
    P360("360p", 360),
    P270("270p", 270),
    P240("240p", 240);

    private final String displayName;
    private final int targetQualityEdge;

    DownloadQuality(String displayName, int targetQualityEdge) {
        this.displayName = displayName;
        this.targetQualityEdge = targetQualityEdge;
    }

    public String displayName() {
        return displayName;
    }

    public int targetQualityEdge() {
        return targetQualityEdge;
    }

    public static DownloadQuality fromPreference(String value) {
        if (value != null) {
            if ("MAXIMUM".equals(value) ||
                    "FACEBOOK_DEFAULT".equals(value)) {
                return HIGHEST;
            }
            try {
                return valueOf(value);
            } catch (IllegalArgumentException ignored) {
            }
        }
        return HIGHEST;
    }
}
