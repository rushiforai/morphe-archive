package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SigmaMakernoteDescriptor extends TagDescriptor<SigmaMakernoteDirectory> {
    public SigmaMakernoteDescriptor(SigmaMakernoteDirectory sigmaMakernoteDirectory) {
        super(sigmaMakernoteDirectory);
    }

    private String getExposureModeDescription() {
        String string = ((SigmaMakernoteDirectory) this._directory).getString(8);
        if (string == null || string.length() == 0) {
            return null;
        }
        char cCharAt = string.charAt(0);
        return cCharAt != 'A' ? cCharAt != 'M' ? cCharAt != 'P' ? cCharAt != 'S' ? string : "Shutter Speed Priority AE" : "Program AE" : "Manual" : "Aperture Priority AE";
    }

    private String getMeteringModeDescription() {
        String string = ((SigmaMakernoteDirectory) this._directory).getString(9);
        if (string == null || string.length() == 0) {
            return null;
        }
        char cCharAt = string.charAt(0);
        return cCharAt != '8' ? cCharAt != 'A' ? cCharAt != 'C' ? string : "Center Weighted Average" : "Average" : "Multi Segment";
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 8 ? i != 9 ? super.getDescription(i) : getMeteringModeDescription() : getExposureModeDescription();
    }
}
