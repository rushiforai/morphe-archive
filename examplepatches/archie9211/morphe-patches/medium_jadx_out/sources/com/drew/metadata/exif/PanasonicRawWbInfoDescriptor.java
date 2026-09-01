package com.drew.metadata.exif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PanasonicRawWbInfoDescriptor extends TagDescriptor<PanasonicRawWbInfoDirectory> {
    public PanasonicRawWbInfoDescriptor(PanasonicRawWbInfoDirectory panasonicRawWbInfoDirectory) {
        super(panasonicRawWbInfoDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return (i == 1 || i == 4 || i == 7 || i == 10 || i == 13 || i == 16 || i == 19) ? getWbTypeDescription(i) : super.getDescription(i);
    }

    public final String getWbTypeDescription(int i) {
        Integer integer = ((PanasonicRawWbInfoDirectory) this._directory).getInteger(i);
        if (integer == null) {
            return null;
        }
        return ExifDescriptorBase.getWhiteBalanceDescription(integer.intValue());
    }
}
