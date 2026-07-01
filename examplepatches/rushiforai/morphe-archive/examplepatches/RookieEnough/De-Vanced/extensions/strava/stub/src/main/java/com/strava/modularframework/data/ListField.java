/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframework/data/ListField.java
 */

package com.strava.modularframework.data;

import java.util.List;

public abstract class ListField {
    public abstract Destination getDestination();

    public abstract String getElement();

    public abstract List<ListField> getFields();

    // Added by patch.
    public abstract List<ListField> getFields$original();
}

