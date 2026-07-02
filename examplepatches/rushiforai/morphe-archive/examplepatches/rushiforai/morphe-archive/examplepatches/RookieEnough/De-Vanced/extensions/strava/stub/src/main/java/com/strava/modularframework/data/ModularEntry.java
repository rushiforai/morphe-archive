/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframework/data/ModularEntry.java
 */

package com.strava.modularframework.data;

import java.util.List;

public interface ModularEntry {
    List<ModularEntry> getChildrenEntries();

    // Added by patch.
    List<ModularEntry> getChildrenEntries$original();

    Destination getDestination();

    String getElement();

    List<Module> getModules();

    // Added by patch.
    List<Module> getModules$original();

    String getPage();
}

