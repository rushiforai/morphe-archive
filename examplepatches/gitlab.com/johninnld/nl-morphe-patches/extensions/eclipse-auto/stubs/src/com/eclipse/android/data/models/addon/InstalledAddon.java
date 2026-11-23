package com.eclipse.android.data.models.addon;

/** Kept-name app model for an installed addon. */
public class InstalledAddon {
    public final String getId() { return null; }
    public final EclipseAddonManifest getManifest() { return null; }
    /** True when the addon answers searches with the metadata provider's results instead of its own. */
    public final boolean getMetadataSearch() { return Boolean.parseBoolean(null); }
}
