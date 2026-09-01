package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class NikonPictureControl1Descriptor extends TagDescriptor<NikonPictureControl1Directory> {
    public NikonPictureControl1Descriptor(NikonPictureControl1Directory nikonPictureControl1Directory) {
        super(nikonPictureControl1Directory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 48 ? i != 55 ? i != 56 ? super.getDescription(i) : getToningEffectDescription() : getFilterEffectDescription() : getPictureControlAdjustDescription();
    }

    public final String getFilterEffectDescription() {
        Integer integer = ((NikonPictureControl1Directory) this._directory).getInteger(55);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 255) {
            return "N/A";
        }
        switch (iIntValue) {
            case 128:
                return "Off";
            case 129:
                return "Yellow";
            case NikonType2MakernoteDirectory.TAG_ADAPTER /* 130 */:
                return "Orange";
            case 131:
                return "Red";
            case NikonType2MakernoteDirectory.TAG_LENS /* 132 */:
                return "Green";
            default:
                return super.getDescription(55);
        }
    }

    public final String getPictureControlAdjustDescription() {
        return getIndexedDescription(48, 0, "Default Settings", "Quick Adjust", "Full Control");
    }

    public final String getToningEffectDescription() {
        Integer integer = ((NikonPictureControl1Directory) this._directory).getInteger(56);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 255) {
            return "N/A";
        }
        switch (iIntValue) {
            case 128:
                return "B&W";
            case 129:
                return "Sepia";
            case NikonType2MakernoteDirectory.TAG_ADAPTER /* 130 */:
                return "Cyanotype";
            case 131:
                return "Red";
            case NikonType2MakernoteDirectory.TAG_LENS /* 132 */:
                return "Yellow";
            case NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE /* 133 */:
                return "Green";
            case NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM /* 134 */:
                return "Blue-green";
            case NikonType2MakernoteDirectory.TAG_FLASH_USED /* 135 */:
                return "Blue";
            case 136:
                return "Purple-blue";
            case 137:
                return "Red-purple";
            default:
                return super.getDescription(56);
        }
    }
}
