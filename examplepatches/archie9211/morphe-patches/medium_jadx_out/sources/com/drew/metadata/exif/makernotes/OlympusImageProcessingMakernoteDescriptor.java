package com.drew.metadata.exif.makernotes;

import com.drew.imaging.avi.hzjl.bPUi;
import com.drew.metadata.TagDescriptor;
import defpackage.ev6;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class OlympusImageProcessingMakernoteDescriptor extends TagDescriptor<OlympusImageProcessingMakernoteDirectory> {
    public OlympusImageProcessingMakernoteDescriptor(OlympusImageProcessingMakernoteDirectory olympusImageProcessingMakernoteDirectory) {
        super(olympusImageProcessingMakernoteDirectory);
    }

    public final String getColorMatrixDescription() {
        int[] intArray = ((OlympusImageProcessingMakernoteDirectory) this._directory).getIntArray(512);
        if (intArray == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < intArray.length; i++) {
            if (i != 0) {
                sb.append(" ");
            }
            sb.append((int) ((short) intArray[i]));
        }
        return sb.toString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 0) {
            return getVersionBytesDescription(0, 4);
        }
        if (i == 512) {
            return getColorMatrixDescription();
        }
        if (i == 4124) {
            return getMultipleExposureModeDescription();
        }
        if (i == 4370) {
            return getAspectRatioDescription();
        }
        if (i == 6400) {
            return getKeystoneCompensationDescription();
        }
        if (i == 6401) {
            return getKeystoneDirectionDescription();
        }
        switch (i) {
            case 4112:
                return getNoiseReduction2Description();
            case 4113:
                return getDistortionCorrection2Description();
            case 4114:
                return getShadingCompensation2Description();
            default:
                return super.getDescription(i);
        }
    }

    public final String getDistortionCorrection2Description() {
        return getIndexedDescription(4113, 0, "Off", "On");
    }

    public final String getImageProcessingVersionDescription() {
        return getVersionBytesDescription(0, 4);
    }

    public final String getKeystoneCompensationDescription() {
        byte[] byteArray = ((OlympusImageProcessingMakernoteDirectory) this._directory).getByteArray(OlympusImageProcessingMakernoteDirectory.TagKeystoneCompensation);
        if (byteArray == null || byteArray.length < 2) {
            return null;
        }
        String str = String.format("%d %d", Byte.valueOf(byteArray[0]), Byte.valueOf(byteArray[1]));
        return str.equals("0 0") ? "Off" : str.equals("0 1") ? "On" : ev6.x("Unknown (", str, ")");
    }

    public final String getKeystoneDirectionDescription() {
        return getIndexedDescription(OlympusImageProcessingMakernoteDirectory.TagKeystoneDirection, 0, "Vertical", "Horizontal");
    }

    public final String getMultipleExposureModeDescription() {
        int[] intArray = ((OlympusImageProcessingMakernoteDirectory) this._directory).getIntArray(4124);
        if (intArray == null) {
            Integer integer = ((OlympusImageProcessingMakernoteDirectory) this._directory).getInteger(4124);
            if (integer == null) {
                return null;
            }
            intArray = new int[]{integer.intValue()};
        }
        if (intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        short s = (short) intArray[0];
        if (s == 0) {
            sb.append("Off");
        } else if (s == 2) {
            sb.append("On (2 frames)");
        } else if (s != 3) {
            sb.append("Unknown (");
            sb.append((int) ((short) intArray[0]));
            sb.append(")");
        } else {
            sb.append("On (3 frames)");
        }
        if (intArray.length > 1) {
            sb.append("; ");
            sb.append((int) ((short) intArray[1]));
        }
        return sb.toString();
    }

    public final String getNoiseReduction2Description() {
        Integer integer = ((OlympusImageProcessingMakernoteDirectory) this._directory).getInteger(4112);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "(none)";
        }
        StringBuilder sb = new StringBuilder();
        short sShortValue = integer.shortValue();
        if ((sShortValue & 1) != 0) {
            sb.append("Noise Reduction, ");
        }
        if (((sShortValue >> 1) & 1) != 0) {
            sb.append("Noise Filter, ");
        }
        if (((sShortValue >> 2) & 1) != 0) {
            sb.append("Noise Filter (ISO Boost), ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getShadingCompensation2Description() {
        return getIndexedDescription(4114, 0, "Off", "On");
    }

    public final String getAspectRatioDescription() {
        byte[] byteArray = ((OlympusImageProcessingMakernoteDirectory) this._directory).getByteArray(OlympusImageProcessingMakernoteDirectory.TagAspectRatio);
        if (byteArray == null || byteArray.length < 2) {
            return null;
        }
        String str = String.format(bPUi.IuuNW, Byte.valueOf(byteArray[0]), Byte.valueOf(byteArray[1]));
        return str.equals("1 1") ? "4:3" : str.equals("1 4") ? "1:1" : str.equals("2 1") ? "3:2 (RAW)" : str.equals("2 2") ? "3:2" : str.equals("3 1") ? "16:9 (RAW)" : str.equals("3 3") ? "16:9" : str.equals("4 1") ? "1:1 (RAW)" : str.equals("4 4") ? "6:6" : str.equals("5 5") ? "5:4" : str.equals("6 6") ? "7:6" : str.equals("7 7") ? "6:5" : str.equals("8 8") ? "7:5" : str.equals("9 1") ? "3:4 (RAW)" : str.equals("9 9") ? "3:4" : ev6.x("Unknown (", str, ")");
    }
}
