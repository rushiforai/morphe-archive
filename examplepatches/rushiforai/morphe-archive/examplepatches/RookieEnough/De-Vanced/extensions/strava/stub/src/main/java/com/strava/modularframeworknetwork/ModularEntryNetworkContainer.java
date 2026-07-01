/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframeworknetwork/ModularEntryNetworkContainer.java
 */

package com.strava.modularframeworknetwork;

import com.strava.modularframework.data.ListProperties;
import com.strava.modularframework.data.ModularEntry;
import java.util.List;

public abstract class ModularEntryNetworkContainer {
    public abstract List<ModularEntry> getEntries();

    // Added by patch.
    public abstract List<ModularEntry> getEntries$original();

    public abstract String getPage();

    public abstract ListProperties getProperties();

    // Added by patch.
    public abstract ListProperties getProperties$original();
}

