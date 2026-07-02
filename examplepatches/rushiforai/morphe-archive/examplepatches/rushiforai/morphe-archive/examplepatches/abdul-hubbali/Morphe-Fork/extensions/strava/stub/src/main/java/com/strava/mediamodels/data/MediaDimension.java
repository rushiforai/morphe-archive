/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/mediamodels/data/MediaDimension.java
 */

package com.strava.mediamodels.data;

import java.io.Serializable;

public final class MediaDimension implements Comparable<MediaDimension>, Serializable {
    private final int height;
    private final int width;

    public MediaDimension(int width, int height) {
        this.width = width;
        this.height = height;
    }

    public int getHeight() {
        return height;
    }

    public float getHeightScale() {
        if (width <= 0 || height <= 0) {
            return 1f;
        }
        return height / width;
    }

    public int getWidth() {
        return width;
    }

    public float getWidthScale() {
        if (width <= 0 || height <= 0) {
            return 1f;
        }
        return width / height;
    }

    public boolean isLandscape() {
        return width > 0 && width >= height;
    }

    @Override
    public int compareTo(MediaDimension other) {
        return 0;
    }
}

