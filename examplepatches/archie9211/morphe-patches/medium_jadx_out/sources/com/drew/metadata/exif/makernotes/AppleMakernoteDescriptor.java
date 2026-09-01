package com.drew.metadata.exif.makernotes;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AppleMakernoteDescriptor extends TagDescriptor<AppleMakernoteDirectory> {
    public AppleMakernoteDescriptor(AppleMakernoteDirectory appleMakernoteDirectory) {
        super(appleMakernoteDirectory);
    }

    public final String getAccelerationVectorDescription() {
        Rational[] rationalArray = ((AppleMakernoteDirectory) this._directory).getRationalArray(8);
        if (rationalArray == null || rationalArray.length != 3) {
            return null;
        }
        StringBuilder sb = new StringBuilder(String.format("%.2fg %s, ", Double.valueOf(rationalArray[0].getAbsolute().doubleValue()), rationalArray[0].isPositive() ? "left" : "right"));
        sb.append(String.format("%.2fg %s, ", Double.valueOf(rationalArray[1].getAbsolute().doubleValue()), rationalArray[1].isPositive() ? "down" : "up"));
        sb.append(String.format("%.2fg %s", Double.valueOf(rationalArray[2].getAbsolute().doubleValue()), rationalArray[2].isPositive() ? "forward" : "backward"));
        return sb.toString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 8 ? i != 10 ? super.getDescription(i) : getHdrImageTypeDescription() : getAccelerationVectorDescription();
    }

    public final String getHdrImageTypeDescription() {
        return getIndexedDescription(10, 3, "HDR Image", "Original Image");
    }
}
