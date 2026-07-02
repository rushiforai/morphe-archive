/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframework/data/ModularComponent.java
 */

package com.strava.modularframework.data;

import java.util.List;

public abstract class ModularComponent implements Module {
    @Override
    public abstract String getElement();

    @Override
    public abstract String getPage();

    public abstract List<Module> getSubmodules();

    // Added by patch.
    public abstract List<Module> getSubmodules$original();
}

