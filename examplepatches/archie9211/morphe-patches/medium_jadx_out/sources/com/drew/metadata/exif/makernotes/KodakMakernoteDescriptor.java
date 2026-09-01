package com.drew.metadata.exif.makernotes;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class KodakMakernoteDescriptor extends TagDescriptor<KodakMakernoteDirectory> {
    public KodakMakernoteDescriptor(KodakMakernoteDirectory kodakMakernoteDirectory) {
        super(kodakMakernoteDirectory);
    }

    public final String getBurstModeDescription() {
        return getIndexedDescription(10, 0, "Off", "On");
    }

    public final String getColorModeDescription() {
        Integer integer = ((KodakMakernoteDirectory) this._directory).getInteger(102);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 4 ? iIntValue != 32 ? iIntValue != 64 ? iIntValue != 256 ? iIntValue != 512 ? iIntValue != 8192 ? iIntValue != 16384 ? ho2.G("Unknown (", integer, ")") : "Sepia" : "B&W" : "Neutral Color" : "Saturated Color" : "Neutral Color" : "Saturated Color" : "B&W Red Filter" : "B&W Yellow Filter" : "Sepia" : "B&W";
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 9 ? i != 10 ? i != 27 ? i != 56 ? i != 64 ? i != 102 ? i != 107 ? i != 92 ? i != 93 ? super.getDescription(i) : getFlashFiredDescription() : getFlashModeDescription() : getSharpnessDescription() : getColorModeDescription() : getWhiteBalanceDescription() : getFocusModeDescription() : getShutterModeDescription() : getBurstModeDescription() : getQualityDescription();
    }

    public final String getFlashFiredDescription() {
        return getIndexedDescription(93, 0, "No", "Yes");
    }

    public final String getFlashModeDescription() {
        Integer integer = ((KodakMakernoteDirectory) this._directory).getInteger(92);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 16 ? iIntValue != 32 ? iIntValue != 64 ? ho2.G("Unknown (", integer, ")") : "Red Eye" : "Off" : "Fill Flash" : "Red Eye" : "Off" : "Fill Flash" : "Auto";
    }

    public final String getFocusModeDescription() {
        return getIndexedDescription(56, 0, "Normal", null, "Macro");
    }

    public final String getQualityDescription() {
        return getIndexedDescription(9, 1, "Fine", "Normal");
    }

    public final String getSharpnessDescription() {
        return getIndexedDescription(107, 0, "Normal");
    }

    public final String getShutterModeDescription() {
        Integer integer = ((KodakMakernoteDirectory) this._directory).getInteger(27);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 8 ? iIntValue != 32 ? ho2.G("Unknown (", integer, ")") : "Manual" : "Aperture Priority" : "Auto";
    }

    public final String getWhiteBalanceDescription() {
        return getIndexedDescription(64, 0, "Auto", "Flash", PdtluglzAX.AdWeKCxmBFUmQ, "Daylight");
    }
}
