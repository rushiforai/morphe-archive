package com.drew.metadata.eps;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class EpsDescriptor extends TagDescriptor<EpsDirectory> {
    public EpsDescriptor(EpsDirectory epsDirectory) {
        super(epsDirectory);
    }

    public final String getByteSizeDescription(int i) {
        return ((EpsDirectory) this._directory).getString(i) + " bytes";
    }

    public final String getColorTypeDescription() {
        return getIndexedDescription(30, 1, "Grayscale", "Lab", "RGB", "CMYK");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 28:
            case 29:
                return getPixelDescription(i);
            case 30:
                return getColorTypeDescription();
            case 31:
            default:
                return ((EpsDirectory) this._directory).getString(i);
            case 32:
            case 33:
                return getByteSizeDescription(i);
        }
    }

    public final String getPixelDescription(int i) {
        return ((EpsDirectory) this._directory).getString(i) + " pixels";
    }
}
