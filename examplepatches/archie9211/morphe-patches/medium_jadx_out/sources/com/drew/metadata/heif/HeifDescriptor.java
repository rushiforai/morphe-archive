package com.drew.metadata.heif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifDescriptor extends TagDescriptor<HeifDirectory> {
    public HeifDescriptor(HeifDirectory heifDirectory) {
        super(heifDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return (i == 4 || i == 5) ? getPixelDescription(i) : i != 6 ? super.getDescription(i) : getRotationDescription();
    }

    public final String getPixelDescription(int i) {
        return ((HeifDirectory) this._directory).getString(i) + " pixels";
    }

    public final String getRotationDescription() {
        Integer integer = ((HeifDirectory) this._directory).getInteger(6);
        if (integer == null) {
            return null;
        }
        return (integer.intValue() * 90) + " degrees";
    }
}
