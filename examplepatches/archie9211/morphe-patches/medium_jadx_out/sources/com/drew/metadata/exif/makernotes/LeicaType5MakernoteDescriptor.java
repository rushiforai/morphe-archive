package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import defpackage.ev6;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class LeicaType5MakernoteDescriptor extends TagDescriptor<LeicaType5MakernoteDirectory> {
    public LeicaType5MakernoteDescriptor(LeicaType5MakernoteDirectory leicaType5MakernoteDirectory) {
        super(leicaType5MakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1037 ? super.getDescription(i) : getExposureModeDescription();
    }

    public final String getExposureModeDescription() {
        byte[] byteArray = ((LeicaType5MakernoteDirectory) this._directory).getByteArray(1037);
        if (byteArray == null || byteArray.length < 4) {
            return null;
        }
        String str = String.format("%d %d %d %d", Byte.valueOf(byteArray[0]), Byte.valueOf(byteArray[1]), Byte.valueOf(byteArray[2]), Byte.valueOf(byteArray[3]));
        return str.equals("0 0 0 0") ? "Program AE" : str.equals("1 0 0 0") ? "Aperture-priority AE" : str.equals("1 1 0 0") ? "Aperture-priority AE (1)" : str.equals("2 0 0 0") ? "Shutter speed priority AE" : str.equals("3 0 0 0") ? "Manual" : ev6.x("Unknown (", str, ")");
    }
}
