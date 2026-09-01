package com.drew.metadata.exif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawWbInfo2Descriptor extends TagDescriptor<PanasonicRawWbInfo2Directory> {
    public PanasonicRawWbInfo2Descriptor(PanasonicRawWbInfo2Directory panasonicRawWbInfo2Directory) {
        super(panasonicRawWbInfo2Directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return (i == 1 || i == 5 || i == 9 || i == 13 || i == 17 || i == 21 || i == 25) ? getWbTypeDescription(i) : super.getDescription(i);
    }

    public final String getWbTypeDescription(int i) {
        Integer integer = ((PanasonicRawWbInfo2Directory) this._directory).getInteger(i);
        if (integer == null) {
            return null;
        }
        return ExifDescriptorBase.getWhiteBalanceDescription(integer.intValue());
    }
}
