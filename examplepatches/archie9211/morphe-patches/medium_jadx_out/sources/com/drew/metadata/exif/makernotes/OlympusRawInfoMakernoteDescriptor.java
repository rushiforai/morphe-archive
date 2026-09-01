package com.drew.metadata.exif.makernotes;

import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class OlympusRawInfoMakernoteDescriptor extends TagDescriptor<OlympusRawInfoMakernoteDirectory> {
    public OlympusRawInfoMakernoteDescriptor(OlympusRawInfoMakernoteDirectory olympusRawInfoMakernoteDirectory) {
        super(olympusRawInfoMakernoteDirectory);
    }

    public final String getColorMatrix2Description() {
        int[] intArray = ((OlympusRawInfoMakernoteDirectory) this._directory).getIntArray(512);
        if (intArray == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < intArray.length; i++) {
            sb.append((int) ((short) intArray[i]));
            if (i < intArray.length - 1) {
                sb.append(" ");
            }
        }
        if (sb.length() == 0) {
            return null;
        }
        return sb.toString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 0 ? i != 512 ? i != 1537 ? i != 4096 ? super.getDescription(i) : getOlympusLightSourceDescription() : getYCbCrCoefficientsDescription() : getColorMatrix2Description() : getVersionBytesDescription(0, 4);
    }

    public final String getOlympusLightSourceDescription() {
        Integer integer = ((OlympusRawInfoMakernoteDirectory) this._directory).getInteger(4096);
        if (integer == null) {
            return null;
        }
        short sShortValue = integer.shortValue();
        if (sShortValue == 0) {
            return "Unknown";
        }
        if (sShortValue == 20) {
            return "Tungsten (Incandescent)";
        }
        if (sShortValue == 22) {
            return "Evening Sunlight";
        }
        if (sShortValue == 256) {
            return "One Touch White Balance";
        }
        if (sShortValue == 512) {
            return "Custom 1-4";
        }
        switch (sShortValue) {
            case 16:
                return "Shade";
            case 17:
                return "Cloudy";
            case 18:
                return "Fine Weather";
            default:
                switch (sShortValue) {
                    case 33:
                        return "Daylight Fluorescent";
                    case 34:
                        return "Day White Fluorescent";
                    case 35:
                        return "Cool White Fluorescent";
                    case 36:
                        return "White Fluorescent";
                    default:
                        return ho2.G("Unknown (", integer, ")");
                }
        }
    }

    public final String getYCbCrCoefficientsDescription() {
        int[] intArray = ((OlympusRawInfoMakernoteDirectory) this._directory).getIntArray(1537);
        if (intArray == null) {
            return null;
        }
        int length = intArray.length / 2;
        Rational[] rationalArr = new Rational[length];
        for (int i = 0; i < intArray.length / 2; i++) {
            int i2 = i * 2;
            rationalArr[i] = new Rational((short) intArray[i2], (short) intArray[i2 + 1]);
        }
        StringBuilder sb = new StringBuilder();
        for (int i3 = 0; i3 < length; i3++) {
            sb.append(rationalArr[i3].doubleValue());
            if (i3 < length - 1) {
                sb.append(" ");
            }
        }
        if (sb.length() == 0) {
            return null;
        }
        return sb.toString();
    }
}
