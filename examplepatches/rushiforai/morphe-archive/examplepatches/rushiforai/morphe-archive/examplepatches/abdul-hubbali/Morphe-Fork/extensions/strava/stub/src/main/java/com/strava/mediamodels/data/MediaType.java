/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/mediamodels/data/MediaType.java
 */

package com.strava.mediamodels.data;

public enum MediaType {
    PHOTO(1),
    VIDEO(2);

    private final int remoteValue;

    private MediaType(int remoteValue) {
        this.remoteValue = remoteValue;
    }

    public int getRemoteValue() {
        return remoteValue;
    }
}

