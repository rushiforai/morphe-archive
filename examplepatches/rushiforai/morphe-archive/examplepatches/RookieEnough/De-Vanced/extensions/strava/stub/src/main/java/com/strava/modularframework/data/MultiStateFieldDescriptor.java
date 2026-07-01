/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframework/data/MultiStateFieldDescriptor.java
 */

package com.strava.modularframework.data;

import java.util.Map;

public abstract class MultiStateFieldDescriptor {
    public abstract Map<String, GenericModuleField> getStateMap();

    // Added by patch.
    public abstract Map<String, GenericModuleField> getStateMap$original();
}

