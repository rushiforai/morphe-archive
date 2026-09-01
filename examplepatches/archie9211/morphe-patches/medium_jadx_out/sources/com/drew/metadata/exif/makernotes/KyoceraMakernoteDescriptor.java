package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class KyoceraMakernoteDescriptor extends TagDescriptor<KyoceraMakernoteDirectory> {
    public KyoceraMakernoteDescriptor(KyoceraMakernoteDirectory kyoceraMakernoteDirectory) {
        super(kyoceraMakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? super.getDescription(i) : getByteLengthDescription(1);
    }

    public final String getProprietaryThumbnailDataDescription() {
        return getByteLengthDescription(1);
    }
}
