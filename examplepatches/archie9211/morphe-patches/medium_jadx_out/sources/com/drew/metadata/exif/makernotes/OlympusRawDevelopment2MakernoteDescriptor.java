package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import defpackage.ho2;
import defpackage.lv8;
import java.util.HashMap;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class OlympusRawDevelopment2MakernoteDescriptor extends TagDescriptor<OlympusRawDevelopment2MakernoteDirectory> {
    private static final HashMap<Integer, String> _filters;

    public OlympusRawDevelopment2MakernoteDescriptor(OlympusRawDevelopment2MakernoteDirectory olympusRawDevelopment2MakernoteDirectory) {
        super(olympusRawDevelopment2MakernoteDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 0) {
            return getVersionBytesDescription(0, 4);
        }
        if (i == 256) {
            return getRawDevExposureBiasValueDescription();
        }
        if (i == 289) {
            return getFilterDescription(289);
        }
        if (i == 272) {
            return getRawDevPmBwFilterDescription();
        }
        if (i == 273) {
            return getRawDevPmPictureToneDescription();
        }
        switch (i) {
            case 265:
                return getRawDevColorSpaceDescription();
            case 266:
                return getRawDevNoiseReductionDescription();
            case 267:
                return getRawDevEngineDescription();
            case 268:
                return getRawDevPictureModeDescription();
            default:
                return super.getDescription(i);
        }
    }

    public final String getFilterDescription(int i) {
        int[] intArray = ((OlympusRawDevelopment2MakernoteDirectory) this._directory).getIntArray(i);
        if (intArray == null || intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i2 = 0; i2 < intArray.length; i2++) {
            if (i2 == 0) {
                HashMap<Integer, String> map = _filters;
                sb.append(map.containsKey(Integer.valueOf(intArray[i2])) ? map.get(Integer.valueOf(intArray[i2])) : "[unknown]");
            } else {
                sb.append(intArray[i2]);
                sb.append("; ");
            }
            sb.append("; ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getRawDevArtFilterDescription() {
        return getFilterDescription(289);
    }

    public final String getRawDevColorSpaceDescription() {
        return getIndexedDescription(265, 0, "sRGB", "Adobe RGB", "Pro Photo RGB");
    }

    public final String getRawDevExposureBiasValueDescription() {
        return getIndexedDescription(256, 1, "Color Temperature", "Gray Point");
    }

    public final String getRawDevNoiseReductionDescription() {
        Integer integer = ((OlympusRawDevelopment2MakernoteDirectory) this._directory).getInteger(266);
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
        if (((iIntValue >> 3) & 1) != 0) {
            sb.append("Noise Filter (Auto), ");
        }
        if (sb.length() > 2) {
            sb.delete(sb.length() - 2, sb.length());
        }
        return sb.toString();
    }

    public final String getRawDevPictureModeDescription() {
        Integer integer = ((OlympusRawDevelopment2MakernoteDirectory) this._directory).getInteger(268);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 256 ? iIntValue != 512 ? ho2.G("Unknown (", integer, ")") : "Sepia" : "Monotone" : "Muted" : "Natural" : "Vivid";
    }

    public final String getRawDevPmBwFilterDescription() {
        return getIndexedDescription(272, 0, "Neutral", "Yellow", "Orange", "Red", "Green");
    }

    public final String getRawDevPmPictureToneDescription() {
        return getIndexedDescription(273, 0, "Neutral", "Sepia", "Blue", "Purple", "Green");
    }

    public final String getRawDevVersionDescription() {
        return getVersionBytesDescription(0, 4);
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _filters = map;
        lv8.x(0, map, "Off", 1, "Soft Focus");
        lv8.x(2, map, "Pop Art", 3, "Pale & Light Color");
        lv8.x(4, map, "Light Tone", 5, "Pin Hole");
        lv8.x(6, map, "Grainy Film", 9, "Diorama");
        lv8.x(10, map, "Cross Process", 12, "Fish Eye");
        lv8.x(13, map, "Drawing", 14, "Gentle Sepia");
        lv8.x(15, map, "Pale & Light Color II", 16, "Pop Art II");
        lv8.x(17, map, "Pin Hole II", 18, "Pin Hole III");
        lv8.x(19, map, "Grainy Film II", 20, "Dramatic Tone");
        lv8.x(21, map, "Punk", 22, "Soft Focus 2");
        lv8.x(23, map, "Sparkle", 24, "Watercolor");
        lv8.x(25, map, ziYqbdHrAXvj.rWTMM, 26, "Key Line II");
        lv8.x(27, map, "Miniature", 28, "Reflection");
        lv8.x(29, map, "Fragmented", 31, "Cross Process II");
        lv8.x(32, map, "Dramatic Tone II", 33, "Watercolor I");
        lv8.x(34, map, "Watercolor II", 35, "Diorama II");
        lv8.x(36, map, "Vintage", 37, "Vintage II");
        lv8.x(38, map, "Vintage III", 39, "Partial Color");
        lv8.x(40, map, "Partial Color II", 41, "Partial Color III");
    }

    public final String getRawDevEngineDescription() {
        return getIndexedDescription(267, 0, "High Speed", "High Function", "Advanced High Speed", dpBiLjNeNsiASg.ryJn);
    }
}
