package com.drew.metadata.exif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawIFD0Descriptor extends TagDescriptor<PanasonicRawIFD0Directory> {
    public PanasonicRawIFD0Descriptor(PanasonicRawIFD0Directory panasonicRawIFD0Directory) {
        super(panasonicRawIFD0Directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? i != 274 ? super.getDescription(i) : getOrientationDescription(274) : getVersionBytesDescription(1, 2);
    }
}
