package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import com.google.android.gms.analytics.wYI.ivbZv;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PentaxMakernoteDescriptor extends TagDescriptor<PentaxMakernoteDirectory> {
    public PentaxMakernoteDescriptor(PentaxMakernoteDirectory pentaxMakernoteDirectory) {
        super(pentaxMakernoteDirectory);
    }

    public final String getCaptureModeDescription() {
        return getIndexedDescription(1, 0, "Auto", "Night-scene", "Manual", null, "Multiple");
    }

    public final String getColourDescription() {
        return getIndexedDescription(23, 1, "Normal", "Black & White", "Sepia");
    }

    public final String getContrastDescription() {
        return getIndexedDescription(12, 0, "Normal", "Low", "High");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 1) {
            return getCaptureModeDescription();
        }
        if (i == 2) {
            return getQualityLevelDescription();
        }
        if (i == 3) {
            return getFocusModeDescription();
        }
        if (i == 4) {
            return getFlashModeDescription();
        }
        if (i == 7) {
            return getWhiteBalanceDescription();
        }
        if (i == 20) {
            return getIsoSpeedDescription();
        }
        if (i == 23) {
            return getColourDescription();
        }
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

    public final String getDigitalZoomDescription() {
        Float floatObject = ((PentaxMakernoteDirectory) this._directory).getFloatObject(10);
        if (floatObject == null) {
            return null;
        }
        return floatObject.floatValue() == 0.0f ? "Off" : Float.toString(floatObject.floatValue());
    }

    public final String getFlashModeDescription() {
        return getIndexedDescription(4, 1, "Auto", "Flash On", null, "Flash Off", null, "Red-eye Reduction");
    }

    public final String getFocusModeDescription() {
        return getIndexedDescription(3, 2, "Custom", "Auto");
    }

    public final String getIsoSpeedDescription() {
        Integer integer = ((PentaxMakernoteDirectory) this._directory).getInteger(20);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 10 ? iIntValue != 16 ? iIntValue != 100 ? iIntValue != 200 ? ho2.G("Unknown (", integer, ")") : "ISO 200" : "ISO 100" : "ISO 200" : "ISO 100";
    }

    public final String getQualityLevelDescription() {
        return getIndexedDescription(2, 0, "Good", "Better", "Best");
    }

    public final String getSaturationDescription() {
        return getIndexedDescription(13, 0, "Normal", "Low", "High");
    }

    public final String getSharpnessDescription() {
        return getIndexedDescription(11, 0, "Normal", "Soft", "Hard");
    }

    public final String getWhiteBalanceDescription() {
        return getIndexedDescription(7, 0, "Auto", ivbZv.nbEuRP, "Shade", "Tungsten", "Fluorescent", "Manual");
    }
}
