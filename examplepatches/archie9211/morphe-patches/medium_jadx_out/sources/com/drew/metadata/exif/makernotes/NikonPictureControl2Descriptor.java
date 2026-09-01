package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class NikonPictureControl2Descriptor extends TagDescriptor<NikonPictureControl2Directory> {
    public NikonPictureControl2Descriptor(NikonPictureControl2Directory nikonPictureControl2Directory) {
        super(nikonPictureControl2Directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 48 ? i != 63 ? i != 64 ? super.getDescription(i) : getToningEffectDescription() : getFilterEffectDescription() : getPictureControlAdjustDescription();
    }

    public final String getFilterEffectDescription() {
        byte[] byteArray = ((NikonPictureControl2Directory) this._directory).getByteArray(63);
        if (byteArray == null) {
            return null;
        }
        byte b = byteArray[0];
        if (b == -1) {
            return "N/A";
        }
        switch (b) {
            case -128:
                return "Off";
            case -127:
                return "Yellow";
            case -126:
                return "Orange";
            case -125:
                return "Red";
            case -124:
                return "Green";
            default:
                return super.getDescription(63);
        }
    }

    public final String getPictureControlAdjustDescription() {
        return getIndexedDescription(48, 0, "Default Settings", "Quick Adjust", "Full Control");
    }

    public final String getToningEffectDescription() {
        byte[] byteArray = ((NikonPictureControl2Directory) this._directory).getByteArray(64);
        if (byteArray == null) {
            return null;
        }
        byte b = byteArray[0];
        if (b == -1) {
            return OphtYB.axSe;
        }
        switch (b) {
            case -128:
                return "B&W";
            case -127:
                return "Sepia";
            case -126:
                return "Cyanotype";
            case -125:
                return "Red";
            case -124:
                return "Yellow";
            case -123:
                return "Green";
            case -122:
                return "Blue-green";
            case -121:
                return "Blue";
            case -120:
                return "Purple-blue";
            case -119:
                return "Red-purple";
            default:
                return super.getDescription(64);
        }
    }
}
