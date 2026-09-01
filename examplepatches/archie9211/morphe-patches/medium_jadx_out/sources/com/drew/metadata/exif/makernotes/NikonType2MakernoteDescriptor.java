package com.drew.metadata.exif.makernotes;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import defpackage.ho2;
import java.nio.ByteBuffer;
import java.text.DecimalFormat;
import scalapb.options.hI.AEVqIoD;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class NikonType2MakernoteDescriptor extends TagDescriptor<NikonType2MakernoteDirectory> {
    public NikonType2MakernoteDescriptor(NikonType2MakernoteDirectory nikonType2MakernoteDirectory) {
        super(nikonType2MakernoteDirectory);
    }

    private double getDistanceInMeters(int i) {
        if (i < 0) {
            i += 256;
        }
        return Math.pow(10.0d, i / 40.0f) * 0.01d;
    }

    private String getEVDescription(int i) {
        int[] intArray = ((NikonType2MakernoteDirectory) this._directory).getIntArray(i);
        if (intArray == null || intArray.length < 2 || intArray.length < 3 || intArray[2] == 0) {
            return null;
        }
        return new DecimalFormat("0.##").format(((double) (intArray[0] * intArray[1])) / ((double) intArray[2])) + " EV";
    }

    public final String getActiveDLightingDescription() {
        Integer integer = ((NikonType2MakernoteDirectory) this._directory).getInteger(34);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 3 ? iIntValue != 5 ? iIntValue != 7 ? iIntValue != 65535 ? ho2.G("Unknown (", integer, ")") : "Auto" : "Extra High" : "High" : "Normal" : "Light" : "Off";
    }

    public final String getAutoFlashCompensationDescription() {
        return getEVDescription(18);
    }

    public final String getAutoFocusPositionDescription() {
        int[] intArray = ((NikonType2MakernoteDirectory) this._directory).getIntArray(136);
        if (intArray == null) {
            return null;
        }
        if (intArray.length == 4 && intArray[0] == 0 && intArray[2] == 0 && intArray[3] == 0) {
            int i = intArray[1];
            return i != 0 ? i != 1 ? i != 2 ? i != 3 ? i != 4 ? ho2.H(new StringBuilder("Unknown ("), intArray[1], ")") : "Right" : "Left" : "Bottom" : "Top" : "Centre";
        }
        return "Unknown (" + ((NikonType2MakernoteDirectory) this._directory).getString(136) + ")";
    }

    public final String getColorModeDescription() {
        String string = ((NikonType2MakernoteDirectory) this._directory).getString(141);
        if (string == null) {
            return null;
        }
        return string.startsWith("MODE1") ? "Mode I (sRGB)" : string;
    }

    public final String getColorSpaceDescription() {
        return getIndexedDescription(30, 1, "sRGB", "Adobe RGB");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 1) {
            return getVersionBytesDescription(1, 2);
        }
        if (i == 2) {
            return getIsoSettingDescription();
        }
        if (i == 13) {
            return getEVDescription(13);
        }
        if (i == 14) {
            return getEVDescription(14);
        }
        if (i == 18) {
            return getEVDescription(18);
        }
        if (i == 28) {
            return getEVDescription(28);
        }
        if (i == 30) {
            return getColorSpaceDescription();
        }
        if (i == 34) {
            return getActiveDLightingDescription();
        }
        if (i == 42) {
            return getVignetteControlDescription();
        }
        if (i == 139) {
            return getEVDescription(NikonType2MakernoteDirectory.TAG_LENS_STOPS);
        }
        if (i == 141) {
            return getColorModeDescription();
        }
        if (i == 177) {
            return getHighISONoiseReductionDescription();
        }
        if (i == 182) {
            return getPowerUpTimeDescription();
        }
        if (i == 23) {
            return getEVDescription(23);
        }
        if (i == 24) {
            return getEVDescription(24);
        }
        if (i == 131) {
            return getLensTypeDescription();
        }
        if (i == 132) {
            return getLensSpecificationDescription(NikonType2MakernoteDirectory.TAG_LENS);
        }
        if (i == 146) {
            return getHueAdjustmentDescription();
        }
        if (i == 147) {
            return getNEFCompressionDescription();
        }
        switch (i) {
            case NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM /* 134 */:
                return getDigitalZoomDescription();
            case NikonType2MakernoteDirectory.TAG_FLASH_USED /* 135 */:
                return getFlashUsedDescription();
            case 136:
                return getAutoFocusPositionDescription();
            case 137:
                return getShootingModeDescription();
            default:
                return super.getDescription(i);
        }
    }

    public final String getDigitalZoomDescription() {
        Rational rational = ((NikonType2MakernoteDirectory) this._directory).getRational(NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM);
        if (rational == null) {
            return null;
        }
        if (((int) rational.doubleValue()) == 1) {
            return "No digital zoom";
        }
        return rational.toSimpleString(true) + "x digital zoom";
    }

    public final String getExposureDifferenceDescription() {
        return getEVDescription(14);
    }

    public final String getExposureTuningDescription() {
        return getEVDescription(28);
    }

    public final String getFirmwareVersionDescription() {
        return getVersionBytesDescription(1, 2);
    }

    public final String getFlashBracketCompensationDescription() {
        return getEVDescription(24);
    }

    public final String getFlashExposureCompensationDescription() {
        return getEVDescription(23);
    }

    public final String getFlashUsedDescription() {
        return getIndexedDescription(NikonType2MakernoteDirectory.TAG_FLASH_USED, 0, "Flash Not Used", "Manual Flash", null, "Flash Not Ready", null, null, null, "External Flash", "Fired, Commander Mode", "Fired, TTL Mode");
    }

    public final String getHighISONoiseReductionDescription() {
        return getIndexedDescription(177, 0, "Off", "Minimal", "Low", null, "Normal", null, "High");
    }

    public final String getHueAdjustmentDescription() {
        return getFormattedString(146, "%s degrees");
    }

    public final String getLensDescription() {
        return getLensSpecificationDescription(NikonType2MakernoteDirectory.TAG_LENS);
    }

    public final String getLensFocusDistance() {
        int[] decryptedIntArray = ((NikonType2MakernoteDirectory) this._directory).getDecryptedIntArray(152);
        if (decryptedIntArray == null || decryptedIntArray.length < 11) {
            return null;
        }
        return String.format("%.2fm", Double.valueOf(getDistanceInMeters(decryptedIntArray[10])));
    }

    public final String getLensStopsDescription() {
        return getEVDescription(NikonType2MakernoteDirectory.TAG_LENS_STOPS);
    }

    public final String getLensTypeDescription() {
        return getBitFlagDescription(131, new String[]{"AF", "MF"}, "D", "G", "VR");
    }

    public final String getNEFCompressionDescription() {
        return getIndexedDescription(147, 1, "Lossy (Type 1)", null, "Uncompressed", null, null, null, "Lossless", "Lossy (Type 2)");
    }

    public final String getPowerUpTimeDescription() {
        byte[] byteArray = ((NikonType2MakernoteDirectory) this._directory).getByteArray(182);
        if (byteArray == null) {
            return null;
        }
        return String.format("%04d:%02d:%02d %02d:%02d:%02d", Short.valueOf(ByteBuffer.wrap(new byte[]{byteArray[0], byteArray[1]}).getShort()), Byte.valueOf(byteArray[2]), Byte.valueOf(byteArray[3]), Byte.valueOf(byteArray[4]), Byte.valueOf(byteArray[5]), Byte.valueOf(byteArray[6]));
    }

    public final String getProgramShiftDescription() {
        return getEVDescription(13);
    }

    public final String getShootingModeDescription() {
        return getBitFlagDescription(137, new String[]{"Single Frame", "Continuous"}, "Delay", null, "PC Control", "Exposure Bracketing", "Auto ISO", "White-Balance Bracketing", "IR Control");
    }

    public final String getVignetteControlDescription() {
        Integer integer = ((NikonType2MakernoteDirectory) this._directory).getInteger(42);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 3 ? iIntValue != 5 ? ho2.G("Unknown (", integer, ")") : "High" : "Normal" : "Low" : "Off";
    }

    public final String getIsoSettingDescription() {
        int[] intArray = ((NikonType2MakernoteDirectory) this._directory).getIntArray(2);
        if (intArray == null) {
            return null;
        }
        if (intArray[0] == 0 && intArray[1] != 0) {
            return AEVqIoD.vwpBwbAmCqd + intArray[1];
        }
        return "Unknown (" + ((NikonType2MakernoteDirectory) this._directory).getString(2) + ")";
    }
}
