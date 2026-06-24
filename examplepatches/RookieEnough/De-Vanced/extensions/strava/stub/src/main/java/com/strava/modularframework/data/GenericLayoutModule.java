/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/6b06b9d1328b971a06d10b4247f4c10f050e4f61/extensions/strava/stub/src/main/java/com/strava/modularframework/data/GenericLayoutModule.java
 */

package com.strava.modularframework.data;

import java.io.Serializable;

public abstract class GenericLayoutModule implements Serializable, Module {
    public abstract Destination getDestination();

    @Override
    public abstract String getElement();

    public abstract GenericModuleField getField(String key);

    // Added by patch.
    public abstract GenericModuleField getField$original(String key);

    public abstract GenericModuleField[] getFields();

    // Added by patch.
    public abstract GenericModuleField[] getFields$original();

    @Override
    public abstract String getPage();

    public abstract GenericLayoutModule[] getSubmodules();

    // Added by patch.
    public abstract GenericLayoutModule[] getSubmodules$original();
}

