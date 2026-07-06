/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframework/data/ListProperties.java
 */

package com.strava.modularframework.data;

public abstract class ListProperties {
    public abstract ListField getField(String key);

    // Added by patch.
    public abstract ListField getField$original(String key);
}

