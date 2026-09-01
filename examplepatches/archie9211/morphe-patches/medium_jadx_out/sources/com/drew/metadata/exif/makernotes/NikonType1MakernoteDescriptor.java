package com.drew.metadata.exif.makernotes;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class NikonType1MakernoteDescriptor extends TagDescriptor<NikonType1MakernoteDirectory> {
    public NikonType1MakernoteDescriptor(NikonType1MakernoteDirectory nikonType1MakernoteDirectory) {
        super(nikonType1MakernoteDirectory);
    }

    public final String getCcdSensitivityDescription() {
        return getIndexedDescription(6, 0, "ISO80", null, "ISO160", null, "ISO320", "ISO100");
    }

    public final String getColorModeDescription() {
        return getIndexedDescription(4, 1, "Color", "Monochrome");
    }

    public final String getConverterDescription() {
        return getIndexedDescription(11, 0, "None", "Fisheye converter");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 3:
                return getQualityDescription();
            case 4:
                return getColorModeDescription();
            case 5:
                return getImageAdjustmentDescription();
            case 6:
                return getCcdSensitivityDescription();
            case 7:
                return getWhiteBalanceDescription();
            case 8:
                return getFocusDescription();
            case 9:
            default:
                return super.getDescription(i);
            case 10:
                return getDigitalZoomDescription();
            case 11:
                return getConverterDescription();
        }
    }

    public final String getDigitalZoomDescription() {
        Rational rational = ((NikonType1MakernoteDirectory) this._directory).getRational(10);
        if (rational == null) {
            return null;
        }
        if (rational.getNumerator() == 0) {
            return "No digital zoom";
        }
        return rational.toSimpleString(true) + "x digital zoom";
    }

    public final String getFocusDescription() {
        Rational rational = ((NikonType1MakernoteDirectory) this._directory).getRational(8);
        if (rational == null) {
            return null;
        }
        return (rational.getNumerator() == 1 && rational.getDenominator() == 0) ? "Infinite" : rational.toSimpleString(true);
    }

    public final String getImageAdjustmentDescription() {
        return getIndexedDescription(5, 0, "Normal", "Bright +", "Bright -", "Contrast +", "Contrast -");
    }

    public final String getQualityDescription() {
        return getIndexedDescription(3, 1, "VGA Basic", "VGA Normal", "VGA Fine", "SXGA Basic", "SXGA Normal", "SXGA Fine");
    }

    public final String getWhiteBalanceDescription() {
        return getIndexedDescription(7, 0, "Auto", "Preset", "Daylight", "Incandescence", "Florescence", "Cloudy", "SpeedLight");
    }
}
