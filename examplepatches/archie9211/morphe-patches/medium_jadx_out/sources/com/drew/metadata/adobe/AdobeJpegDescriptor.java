package com.drew.metadata.adobe;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AdobeJpegDescriptor extends TagDescriptor<AdobeJpegDirectory> {
    public AdobeJpegDescriptor(AdobeJpegDirectory adobeJpegDirectory) {
        super(adobeJpegDirectory);
    }

    private String getColorTransformDescription() {
        return getIndexedDescription(3, 0, "Unknown (RGB or CMYK)", "YCbCr", "YCCK");
    }

    private String getDctEncodeVersionDescription() {
        Integer integer = ((AdobeJpegDirectory) this._directory).getInteger(0);
        if (integer == null) {
            return null;
        }
        return integer.intValue() == 100 ? "100" : Integer.toString(integer.intValue());
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 0 ? i != 3 ? super.getDescription(i) : getColorTransformDescription() : getDctEncodeVersionDescription();
    }
}
