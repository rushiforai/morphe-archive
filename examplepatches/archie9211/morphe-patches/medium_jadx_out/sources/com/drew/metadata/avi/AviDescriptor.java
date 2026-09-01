package com.drew.metadata.avi;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AviDescriptor extends TagDescriptor<AviDirectory> {
    public AviDescriptor(AviDirectory aviDirectory) {
        super(aviDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return (i == 6 || i == 7) ? getSizeDescription(i) : super.getDescription(i);
    }

    public final String getSizeDescription(int i) {
        return ((AviDirectory) this._directory).getString(i) + " pixels";
    }
}
