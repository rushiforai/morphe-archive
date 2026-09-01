package com.drew.metadata.exif.makernotes;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import defpackage.ev6;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusFocusInfoMakernoteDescriptor extends TagDescriptor<OlympusFocusInfoMakernoteDirectory> {
    public OlympusFocusInfoMakernoteDescriptor(OlympusFocusInfoMakernoteDirectory olympusFocusInfoMakernoteDirectory) {
        super(olympusFocusInfoMakernoteDirectory);
    }

    public final String getAfPointDescription() {
        Integer integer = ((OlympusFocusInfoMakernoteDirectory) this._directory).getInteger(OlympusFocusInfoMakernoteDirectory.TagAfPoint);
        if (integer == null) {
            return null;
        }
        return integer.toString();
    }

    public final String getAutoFocusDescription() {
        return getIndexedDescription(521, 0, "Off", "On");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 0 ? i != 521 ? i != 773 ? i != 776 ? i != 4609 ? i != 5376 ? i != 5632 ? i != 4612 ? i != 4613 ? i != 4617 ? i != 4618 ? super.getDescription(i) : getMacroLedDescription() : getManualFlashDescription() : getExternalFlashZoomDescription() : getExternalFlashBounceDescription() : getImageStabilizationDescription() : getSensorTemperatureDescription() : getExternalFlashDescription() : getAfPointDescription() : getFocusDistanceDescription() : getAutoFocusDescription() : getVersionBytesDescription(0, 4);
    }

    public final String getExternalFlashBounceDescription() {
        return getIndexedDescription(OlympusFocusInfoMakernoteDirectory.TagExternalFlashBounce, 0, "Bounce or Off", "Direct");
    }

    public final String getExternalFlashDescription() {
        int[] intArray = ((OlympusFocusInfoMakernoteDirectory) this._directory).getIntArray(4609);
        if (intArray == null || intArray.length < 2) {
            return null;
        }
        String str = String.format("%d %d", Short.valueOf((short) intArray[0]), Short.valueOf((short) intArray[1]));
        return str.equals("0 0") ? "Off" : str.equals("1 0") ? "On" : ev6.x("Unknown (", str, ")");
    }

    public final String getExternalFlashZoomDescription() {
        int[] intArray = ((OlympusFocusInfoMakernoteDirectory) this._directory).getIntArray(OlympusFocusInfoMakernoteDirectory.TagExternalFlashZoom);
        if (intArray == null) {
            Integer integer = ((OlympusFocusInfoMakernoteDirectory) this._directory).getInteger(OlympusFocusInfoMakernoteDirectory.TagExternalFlashZoom);
            if (integer == null) {
                return null;
            }
            intArray = new int[]{integer.intValue()};
        }
        if (intArray.length == 0) {
            return null;
        }
        String str = String.format("%d", Short.valueOf((short) intArray[0]));
        if (intArray.length > 1) {
            str = str + " " + String.format("%d", Short.valueOf((short) intArray[1]));
        }
        return str.equals("0") ? "Off" : str.equals("1") ? "On" : str.equals("0 0") ? "Off" : str.equals("1 0") ? "On" : ev6.x("Unknown (", str, ")");
    }

    public final String getFocusDistanceDescription() {
        Rational rational = ((OlympusFocusInfoMakernoteDirectory) this._directory).getRational(773);
        if (rational == null || rational.getNumerator() == 4294967295L || rational.getNumerator() == 0) {
            return "inf";
        }
        return (rational.getNumerator() / 1000.0d) + " m";
    }

    public final String getFocusInfoVersionDescription() {
        return getVersionBytesDescription(0, 4);
    }

    public final String getImageStabilizationDescription() {
        byte[] byteArray = ((OlympusFocusInfoMakernoteDirectory) this._directory).getByteArray(OlympusFocusInfoMakernoteDirectory.TagImageStabilization);
        if (byteArray == null) {
            return null;
        }
        if ((byteArray[0] | byteArray[1] | byteArray[2] | byteArray[3]) == 0) {
            return "Off";
        }
        return "On, ".concat((byteArray[43] & 1) > 0 ? "Mode 1" : "Mode 2");
    }

    public final String getMacroLedDescription() {
        return getIndexedDescription(OlympusFocusInfoMakernoteDirectory.TagMacroLed, 0, "Off", "On");
    }

    public final String getManualFlashDescription() {
        int[] intArray = ((OlympusFocusInfoMakernoteDirectory) this._directory).getIntArray(OlympusFocusInfoMakernoteDirectory.TagManualFlash);
        if (intArray == null) {
            return null;
        }
        return ((short) intArray[0]) == 0 ? "Off" : ((short) intArray[1]) == 1 ? "Full" : ho2.H(new StringBuilder("On (1/"), (short) intArray[1], " strength)");
    }

    public final String getSensorTemperatureDescription() {
        return ((OlympusFocusInfoMakernoteDirectory) this._directory).getString(OlympusFocusInfoMakernoteDirectory.TagSensorTemperature);
    }
}
