package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SonyType6MakernoteDescriptor extends TagDescriptor<SonyType6MakernoteDirectory> {
    public SonyType6MakernoteDescriptor(SonyType6MakernoteDirectory sonyType6MakernoteDirectory) {
        super(sonyType6MakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 8192 ? super.getDescription(i) : getMakernoteThumbVersionDescription();
    }

    public final String getMakernoteThumbVersionDescription() {
        return getVersionBytesDescription(8192, 2);
    }
}
