/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/mediamodels/data/RemoteMediaContent.java
 */

package com.strava.mediamodels.data;

import java.util.SortedMap;

public interface RemoteMediaContent extends MediaContent {
    MediaDimension getLargestSize();

    String getLargestUrl();

    SortedMap<Integer, MediaDimension> getSizes();

    String getSmallestUrl();

    RemoteMediaStatus getStatus();

    SortedMap<Integer, String> getUrls();
}

