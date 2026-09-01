package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CasioType1MakernoteDescriptor extends TagDescriptor<CasioType1MakernoteDirectory> {
    public CasioType1MakernoteDescriptor(CasioType1MakernoteDirectory casioType1MakernoteDirectory) {
        super(casioType1MakernoteDirectory);
    }

    public final String getCcdSensitivityDescription() {
        Integer integer = ((CasioType1MakernoteDirectory) this._directory).getInteger(20);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 64 ? iIntValue != 80 ? iIntValue != 100 ? iIntValue != 125 ? iIntValue != 244 ? iIntValue != 250 ? ho2.G("Unknown (", integer, ")") : "+2.0" : "+3.0" : "+1.0" : "High" : "Normal (ISO 80 equivalent)" : "Normal";
    }

    public final String getContrastDescription() {
        return getIndexedDescription(12, 0, "Normal", "Low", "High");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 20) {
            return getCcdSensitivityDescription();
        }
        switch (i) {
            case 1:
                return getRecordingModeDescription();
            case 2:
                return getQualityDescription();
            case 3:
                return getFocusingModeDescription();
            case 4:
                return getFlashModeDescription();
            case 5:
                return getFlashIntensityDescription();
            case 6:
                return getObjectDistanceDescription();
            case 7:
                return getWhiteBalanceDescription();
            default:
                switch (i) {
                    case 10:
                        return getDigitalZoomDescription();
                    case 11:
                        return getSharpnessDescription();
                    case 12:
                        return getContrastDescription();
                    case 13:
                        return getSaturationDescription();
                    default:
                        return super.getDescription(i);
                }
        }
    }

    public final String getDigitalZoomDescription() {
        Integer integer = ((CasioType1MakernoteDirectory) this._directory).getInteger(10);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 65536 ? (iIntValue == 65537 || iIntValue == 131072) ? "2x digital zoom" : iIntValue != 262144 ? ho2.G("Unknown (", integer, ")") : "4x digital zoom" : "No digital zoom";
    }

    public final String getFlashIntensityDescription() {
        Integer integer = ((CasioType1MakernoteDirectory) this._directory).getInteger(5);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 11 ? iIntValue != 13 ? iIntValue != 15 ? ho2.G("Unknown (", integer, ")") : "Strong" : "Normal" : "Weak";
    }

    public final String getFlashModeDescription() {
        return getIndexedDescription(4, 1, "Auto", "On", "Off", "Red eye reduction");
    }

    public final String getFocusingModeDescription() {
        return getIndexedDescription(3, 2, "Macro", "Auto focus", "Manual focus", "Infinity");
    }

    public final String getObjectDistanceDescription() {
        if (((CasioType1MakernoteDirectory) this._directory).getInteger(6) == null) {
            return null;
        }
        return TagDescriptor.getFocalLengthDescription(r2.intValue());
    }

    public final String getQualityDescription() {
        return getIndexedDescription(2, 1, "Economy", "Normal", "Fine");
    }

    public final String getRecordingModeDescription() {
        return getIndexedDescription(1, 1, "Single shutter", "Panorama", "Night scene", "Portrait", "Landscape");
    }

    public final String getSaturationDescription() {
        return getIndexedDescription(13, 0, "Normal", "Low", "High");
    }

    public final String getSharpnessDescription() {
        return getIndexedDescription(11, 0, "Normal", "Soft", "Hard");
    }

    public final String getWhiteBalanceDescription() {
        Integer integer = ((CasioType1MakernoteDirectory) this._directory).getInteger(7);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 4 ? iIntValue != 5 ? iIntValue != 129 ? ho2.G("Unknown (", integer, ")") : "Manual" : "Shade" : "Florescent" : "Daylight" : "Tungsten" : "Auto";
    }
}
