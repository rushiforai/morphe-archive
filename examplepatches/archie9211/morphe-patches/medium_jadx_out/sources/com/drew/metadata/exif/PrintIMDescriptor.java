package com.drew.metadata.exif;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class PrintIMDescriptor extends TagDescriptor<PrintIMDirectory> {
    public PrintIMDescriptor(PrintIMDirectory printIMDirectory) {
        super(printIMDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 0) {
            return super.getDescription(i);
        }
        Integer integer = ((PrintIMDirectory) this._directory).getInteger(i);
        if (integer == null) {
            return null;
        }
        return String.format("0x%08x", integer);
    }
}
