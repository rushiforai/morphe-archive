package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusRawDevelopmentMakernoteDescriptor extends TagDescriptor<OlympusRawDevelopmentMakernoteDirectory> {
    public OlympusRawDevelopmentMakernoteDescriptor(OlympusRawDevelopmentMakernoteDirectory olympusRawDevelopmentMakernoteDirectory) {
        super(olympusRawDevelopmentMakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 0) {
            return getVersionBytesDescription(0, 4);
        }
        switch (i) {
            case 264:
                return getRawDevColorSpaceDescription();
            case 265:
                return getRawDevEngineDescription();
            case 266:
                return getRawDevNoiseReductionDescription();
            case 267:
                return getRawDevEditStatusDescription();
            case 268:
                return getRawDevSettingsDescription();
            default:
                return super.getDescription(i);
        }
    }

    public final String getRawDevColorSpaceDescription() {
        return getIndexedDescription(264, 0, "sRGB", "Adobe RGB", "Pro Photo RGB");
    }

    public final String getRawDevEditStatusDescription() {
        Integer integer = ((OlympusRawDevelopmentMakernoteDirectory) this._directory).getInteger(267);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? (iIntValue == 6 || iIntValue == 8) ? "Edited (Portrait)" : ho2.G("Unknown (", integer, ")") : "Edited (Landscape)" : "Original";
    }

    public final String getRawDevEngineDescription() {
        return getIndexedDescription(265, 0, "High Speed", "High Function", "Advanced High Speed", "Advanced High Function");
    }

    public final String getRawDevNoiseReductionDescription() {
        Integer integer = ((OlympusRawDevelopmentMakernoteDirectory) this._directory).getInteger(266);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "(none)";
        }
        StringBuilder sb = new StringBuilder();
        int iIntValue = integer.intValue();
        if ((iIntValue & 1) != 0) {
            sb.append("Noise Reduction, ");
        }
        if (((iIntValue >> 1) & 1) != 0) {
            sb.append("Noise Filter, ");
        }
        if (((iIntValue >> 2) & 1) != 0) {
            sb.append("Noise Filter (ISO Boost), ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getRawDevSettingsDescription() {
        Integer integer = ((OlympusRawDevelopmentMakernoteDirectory) this._directory).getInteger(268);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "(none)";
        }
        StringBuilder sb = new StringBuilder();
        int iIntValue = integer.intValue();
        if ((iIntValue & 1) != 0) {
            sb.append("WB Color Temp, ");
        }
        if (((iIntValue >> 1) & 1) != 0) {
            sb.append("WB Gray Point, ");
        }
        if (((iIntValue >> 2) & 1) != 0) {
            sb.append("Saturation, ");
        }
        if (((iIntValue >> 3) & 1) != 0) {
            sb.append("Contrast, ");
        }
        if (((iIntValue >> 4) & 1) != 0) {
            sb.append("Sharpness, ");
        }
        if (((iIntValue >> 5) & 1) != 0) {
            sb.append("Color Space, ");
        }
        if (((iIntValue >> 6) & 1) != 0) {
            sb.append("High Function, ");
        }
        if (((iIntValue >> 7) & 1) != 0) {
            sb.append("Noise Reduction, ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getRawDevVersionDescription() {
        return getVersionBytesDescription(0, 4);
    }
}
