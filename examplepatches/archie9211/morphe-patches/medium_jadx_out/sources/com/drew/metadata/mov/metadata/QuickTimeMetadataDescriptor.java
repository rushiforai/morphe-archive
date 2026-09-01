package com.drew.metadata.mov.metadata;

import com.drew.metadata.mov.QuickTimeDescriptor;
import com.drew.metadata.mov.QuickTimeDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeMetadataDescriptor extends QuickTimeDescriptor {
    public QuickTimeMetadataDescriptor(QuickTimeDirectory quickTimeDirectory) {
        super(quickTimeDirectory);
    }

    private String getArtworkDescription() {
        return getByteLengthDescription(1282);
    }

    @Override // com.drew.metadata.mov.QuickTimeDescriptor, com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1282 ? i != 1303 ? super.getDescription(i) : getLocationRoleDescription() : getByteLengthDescription(1282);
    }

    public final String getLocationRoleDescription() {
        return getIndexedDescription(QuickTimeMetadataDirectory.TAG_LOCATION_ROLE, 0, "Shooting location", "Real location", "Fictional location");
    }
}
