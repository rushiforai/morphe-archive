package app.morphe.extension.shared.patches;

import android.media.MediaFormat;

public class ExynosVideoFix {
    public static void setInteger(MediaFormat format, String key, int value) {
        if (format == null || key == null) {
            return;
        }

        try {
            if ("max-width".equals(key)) {
                if (format.containsKey("width")) {
                    int width = format.getInteger("width");
                    if (value < width) {
                        value = width;
                    }
                }
            } else if ("max-height".equals(key)) {
                if (format.containsKey("height")) {
                    int height = format.getInteger("height");
                    if (value < height) {
                        value = height;
                    }
                }
            } else if ("width".equals(key)) {
                if (format.containsKey("max-width")) {
                    int maxWidth = format.getInteger("max-width");
                    if (maxWidth < value) {
                        format.setInteger("max-width", value);
                    }
                }
            } else if ("height".equals(key)) {
                if (format.containsKey("max-height")) {
                    int maxHeight = format.getInteger("max-height");
                    if (maxHeight < value) {
                        format.setInteger("max-height", value);
                    }
                }
            }
        } catch (Throwable ignored) {}

        format.setInteger(key, value);
    }
}
