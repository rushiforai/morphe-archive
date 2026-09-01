package com.drew.metadata.exif.makernotes;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import com.google.android.gms.analytics.wYI.ivbZv;
import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import defpackage.ev6;
import defpackage.ho2;
import defpackage.km4;
import defpackage.lv8;
import java.text.DecimalFormat;
import java.util.HashMap;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class OlympusCameraSettingsMakernoteDescriptor extends TagDescriptor<OlympusCameraSettingsMakernoteDirectory> {
    private static final HashMap<Integer, String> _filters;
    private static final HashMap<Integer, String> _toneLevelType;

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _toneLevelType = map;
        HashMap<Integer, String> map2 = new HashMap<>();
        _filters = map2;
        map2.put(0, "Off");
        map2.put(1, "Soft Focus");
        lv8.x(2, map2, "Pop Art", 3, "Pale & Light Color");
        lv8.x(4, map2, "Light Tone", 5, "Pin Hole");
        lv8.x(6, map2, "Grainy Film", 9, "Diorama");
        lv8.x(10, map2, "Cross Process", 12, "Fish Eye");
        lv8.x(13, map2, "Drawing", 14, "Gentle Sepia");
        lv8.x(15, map2, "Pale & Light Color II", 16, "Pop Art II");
        lv8.x(17, map2, "Pin Hole II", 18, "Pin Hole III");
        lv8.x(19, map2, "Grainy Film II", 20, "Dramatic Tone");
        lv8.x(21, map2, "Punk", 22, "Soft Focus 2");
        lv8.x(23, map2, "Sparkle", 24, "Watercolor");
        lv8.x(25, map2, "Key Line", 26, "Key Line II");
        lv8.x(27, map2, "Miniature", 28, "Reflection");
        lv8.x(29, map2, "Fragmented", 31, "Cross Process II");
        lv8.x(32, map2, "Dramatic Tone II", 33, "Watercolor I");
        lv8.x(34, map2, "Watercolor II", 35, "Diorama II");
        lv8.x(36, map2, "Vintage", 37, "Vintage II");
        lv8.x(38, map2, "Vintage III", 39, "Partial Color");
        lv8.x(40, map2, "Partial Color II", 41, "Partial Color III");
        map.put(0, "0");
        map.put(-31999, "Highlights ");
        lv8.x(-31998, map, "Shadows ", -31997, "Midtones ");
    }

    public OlympusCameraSettingsMakernoteDescriptor(OlympusCameraSettingsMakernoteDirectory olympusCameraSettingsMakernoteDirectory) {
        super(olympusCameraSettingsMakernoteDirectory);
    }

    private String getFiltersDescription(int i) {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(i);
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
            }
            sb.append("; ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    private String getValueMinMaxDescription(int i) {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(i);
        if (intArray == null || intArray.length < 3) {
            return null;
        }
        return String.format("%d (min %d, max %d)", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]), Integer.valueOf(intArray[2]));
    }

    public final String getAeLockDescription() {
        return getIndexedDescription(513, 0, "Off", "On");
    }

    public final String getAfAreasDescription() {
        Object object = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getObject(772);
        if (object == null || !(object instanceof long[])) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (long j : (long[]) object) {
            if (j != 0) {
                if (sb.length() != 0) {
                    sb.append(", ");
                }
                if (j == 913916549) {
                    sb.append("Left ");
                } else if (j == 2038007173) {
                    sb.append("Center ");
                } else if (j == 3178875269L) {
                    sb.append("Right ");
                }
                sb.append(String.format("(%d/255,%d/255)-(%d/255,%d/255)", Long.valueOf((j >> 24) & 255), Long.valueOf((j >> 16) & 255), Long.valueOf((j >> 8) & 255), Long.valueOf(j & 255)));
            }
        }
        if (sb.length() == 0) {
            return null;
        }
        return sb.toString();
    }

    public final String getAfFineTuneDescription() {
        return getIndexedDescription(774, 0, "Off", "On");
    }

    public final String getAfPointSelectedDescription() {
        Rational[] rationalArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getRationalArray(773);
        if (rationalArray == null) {
            return "n/a";
        }
        if (rationalArray.length < 4) {
            return null;
        }
        int i = (rationalArray.length == 5 && ((long) rationalArray[0].doubleValue()) == 0) ? 1 : 0;
        int iDoubleValue = (int) (rationalArray[i].doubleValue() * 100.0d);
        int iDoubleValue2 = (int) (rationalArray[i + 1].doubleValue() * 100.0d);
        int iDoubleValue3 = (int) (rationalArray[i + 2].doubleValue() * 100.0d);
        int iDoubleValue4 = (int) (rationalArray[i + 3].doubleValue() * 100.0d);
        return ((iDoubleValue + iDoubleValue2) + iDoubleValue3) + iDoubleValue4 == 0 ? "n/a" : String.format("(%d%%,%d%%) (%d%%,%d%%)", Integer.valueOf(iDoubleValue), Integer.valueOf(iDoubleValue2), Integer.valueOf(iDoubleValue3), Integer.valueOf(iDoubleValue4));
    }

    public final String getAfSearchDescription() {
        return getIndexedDescription(771, 0, "Not Ready", "Ready");
    }

    public final String getArtFilterDescription() {
        return getFiltersDescription(OlympusCameraSettingsMakernoteDirectory.TagArtFilter);
    }

    public final String getArtFilterEffectDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagArtFilterEffect);
        if (intArray == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < intArray.length; i++) {
            if (i == 0) {
                HashMap<Integer, String> map = _filters;
                sb.append(map.containsKey(Integer.valueOf(intArray[i])) ? map.get(Integer.valueOf(intArray[i])) : "[unknown]");
                sb.append("; ");
            } else if (i == 3) {
                sb.append("Partial Color ");
                sb.append(intArray[i]);
                sb.append("; ");
            } else if (i == 4) {
                switch (intArray[i]) {
                    case 0:
                        sb.append("No Effect");
                        break;
                    case PanasonicMakernoteDirectory.TAG_BABY_AGE_1 /* 32784 */:
                        sb.append("Star Light");
                        break;
                    case 32800:
                        sb.append("Pin Hole");
                        break;
                    case 32816:
                        sb.append("Frame");
                        break;
                    case 32832:
                        sb.append("Soft Focus");
                        break;
                    case 32848:
                        sb.append("White Edge");
                        break;
                    case 32864:
                        sb.append("B&W");
                        break;
                    default:
                        sb.append("Unknown (");
                        sb.append(intArray[i]);
                        sb.append(")");
                        break;
                }
                sb.append("; ");
            } else if (i == 6) {
                int i2 = intArray[i];
                if (i2 == 0) {
                    sb.append("No Color Filter");
                } else if (i2 == 1) {
                    sb.append("Yellow Color Filter");
                } else if (i2 == 2) {
                    sb.append("Orange Color Filter");
                } else if (i2 == 3) {
                    sb.append("Red Color Filter");
                } else if (i2 != 4) {
                    sb.append("Unknown (");
                    sb.append(intArray[i]);
                    sb.append(")");
                } else {
                    sb.append("Green Color Filter");
                }
                sb.append("; ");
            } else {
                sb.append(intArray[i]);
                sb.append("; ");
            }
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getCameraSettingsVersionDescription() {
        return getVersionBytesDescription(0, 4);
    }

    public final String getColorCreatorEffectDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagColorCreatorEffect);
        if (intArray == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < intArray.length; i++) {
            if (i == 0) {
                sb.append("Color ");
                sb.append(intArray[i]);
                sb.append("; ");
            } else if (i == 3) {
                sb.append("Strength ");
                sb.append(intArray[i]);
                sb.append("; ");
            } else {
                sb.append(intArray[i]);
                sb.append("; ");
            }
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getColorSpaceDescription() {
        return getIndexedDescription(1287, 0, "sRGB", "Adobe RGB", "Pro Photo RGB");
    }

    public final String getContrastSettingDescription() {
        return getValueMinMaxDescription(1285);
    }

    public final String getCustomSaturationDescription() {
        return getValueMinMaxDescription(1283);
    }

    public final String getDateTimeUTCDescription() {
        Object object = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getObject(OlympusCameraSettingsMakernoteDirectory.TagDateTimeUtc);
        if (object == null) {
            return null;
        }
        return object.toString();
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i != 0) {
            if (i == 1280) {
                return getWhiteBalance2Description();
            }
            if (i == 1281) {
                return getWhiteBalanceTemperatureDescription();
            }
            if (i == 1312) {
                return getPictureModeDescription();
            }
            if (i == 1313) {
                return getValueMinMaxDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeSaturation);
            }
            if (i == 1536) {
                return getDriveModeDescription();
            }
            if (i == 1537) {
                return getPanoramaModeDescription();
            }
            switch (i) {
                case 0:
                    break;
                case 256:
                    return getPreviewImageValidDescription();
                case 768:
                    return getMacroModeDescription();
                case 769:
                    return getFocusModeDescription();
                case 770:
                    return getFocusProcessDescription();
                case 771:
                    return getAfSearchDescription();
                case 772:
                    return getAfAreasDescription();
                case 773:
                    return getAfPointSelectedDescription();
                case 774:
                    return getAfFineTuneDescription();
                case 1024:
                    return getFlashModeDescription();
                case 1295:
                    return getGradationDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagArtFilter /* 1321 */:
                    return getFiltersDescription(OlympusCameraSettingsMakernoteDirectory.TagArtFilter);
                case OlympusCameraSettingsMakernoteDirectory.TagColorCreatorEffect /* 1330 */:
                    return getColorCreatorEffectDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagImageQuality2 /* 1539 */:
                    return getImageQuality2Description();
                case OlympusCameraSettingsMakernoteDirectory.TagImageStabilization /* 1540 */:
                    return getImageStabilizationDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagStackedImage /* 2052 */:
                    return getStackedImageDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagManometerPressure /* 2304 */:
                    return getManometerPressureDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagManometerReading /* 2305 */:
                    return getManometerReadingDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagExtendedWBDetect /* 2306 */:
                    return getExtendedWBDetectDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagRollAngle /* 2307 */:
                    return getRollAngleDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagPitchAngle /* 2308 */:
                    return getPitchAngleDescription();
                case OlympusCameraSettingsMakernoteDirectory.TagDateTimeUtc /* 2312 */:
                    return getDateTimeUTCDescription();
                default:
                    switch (i) {
                        case 512:
                            return getExposureModeDescription();
                        case 513:
                            return getAeLockDescription();
                        case 514:
                            return getMeteringModeDescription();
                        case 515:
                            return getRationalOrDoubleString(515);
                        case 516:
                            return getNdFilterDescription();
                        default:
                            switch (i) {
                                case 1027:
                                    return getFlashRemoteControlDescription();
                                case 1028:
                                    return getFlashControlModeDescription();
                                case 1029:
                                    return getFlashIntensityDescription();
                                case 1030:
                                    return getManualFlashStrengthDescription();
                                default:
                                    switch (i) {
                                        case 1283:
                                            return getValueMinMaxDescription(1283);
                                        case 1284:
                                            return getModifiedSaturationDescription();
                                        case 1285:
                                            return getValueMinMaxDescription(1285);
                                        case 1286:
                                            return getValueMinMaxDescription(1286);
                                        case 1287:
                                            return getColorSpaceDescription();
                                        default:
                                            switch (i) {
                                                case 1289:
                                                    return getSceneModeDescription();
                                                case 1290:
                                                    return getNoiseReductionDescription();
                                                case 1291:
                                                    return getDistortionCorrectionDescription();
                                                case 1292:
                                                    return getShadingCompensationDescription();
                                                default:
                                                    switch (i) {
                                                        case OlympusCameraSettingsMakernoteDirectory.TagPictureModeContrast /* 1315 */:
                                                            return getValueMinMaxDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeContrast);
                                                        case OlympusCameraSettingsMakernoteDirectory.TagPictureModeSharpness /* 1316 */:
                                                            return getValueMinMaxDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeSharpness);
                                                        case OlympusCameraSettingsMakernoteDirectory.TagPictureModeBWFilter /* 1317 */:
                                                            return getPictureModeBWFilterDescription();
                                                        case OlympusCameraSettingsMakernoteDirectory.TagPictureModeTone /* 1318 */:
                                                            return getPictureModeToneDescription();
                                                        case OlympusCameraSettingsMakernoteDirectory.TagNoiseFilter /* 1319 */:
                                                            return getNoiseFilterDescription();
                                                        default:
                                                            switch (i) {
                                                                case OlympusCameraSettingsMakernoteDirectory.TagMagicFilter /* 1324 */:
                                                                    return getFiltersDescription(OlympusCameraSettingsMakernoteDirectory.TagMagicFilter);
                                                                case OlympusCameraSettingsMakernoteDirectory.TagPictureModeEffect /* 1325 */:
                                                                    return getPictureModeEffectDescription();
                                                                case OlympusCameraSettingsMakernoteDirectory.TagToneLevel /* 1326 */:
                                                                    return getToneLevelDescription();
                                                                case OlympusCameraSettingsMakernoteDirectory.TagArtFilterEffect /* 1327 */:
                                                                    return getArtFilterEffectDescription();
                                                                default:
                                                                    return super.getDescription(i);
                                                            }
                                                    }
                                            }
                                    }
                            }
                    }
            }
        }
        return getVersionBytesDescription(0, 4);
    }

    public final String getDistortionCorrectionDescription() {
        return getIndexedDescription(1291, 0, "Off", "On");
    }

    public final String getExposureModeDescription() {
        return getIndexedDescription(512, 1, "Manual", "Program", "Aperture-priority AE", "Shutter speed priority", "Program-shift");
    }

    public final String getExposureShiftDescription() {
        return getRationalOrDoubleString(515);
    }

    public final String getExtendedWBDetectDescription() {
        return getIndexedDescription(OlympusCameraSettingsMakernoteDirectory.TagExtendedWBDetect, 0, "Off", "On");
    }

    public final String getFlashIntensityDescription() {
        Rational[] rationalArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getRationalArray(1029);
        if (rationalArray == null || rationalArray.length == 0) {
            return null;
        }
        if (rationalArray.length == 3) {
            if (rationalArray[0].getDenominator() == 0 && rationalArray[1].getDenominator() == 0 && rationalArray[2].getDenominator() == 0) {
                return "n/a";
            }
        } else if (rationalArray.length == 4 && rationalArray[0].getDenominator() == 0 && rationalArray[1].getDenominator() == 0 && rationalArray[2].getDenominator() == 0 && rationalArray[3].getDenominator() == 0) {
            return "n/a (x4)";
        }
        StringBuilder sb = new StringBuilder();
        for (Rational rational : rationalArray) {
            sb.append(rational);
            sb.append(", ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getFocusModeDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(769);
        if (intArray == null) {
            Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(769);
            if (integer == null) {
                return null;
            }
            intArray = new int[]{integer.intValue()};
        }
        if (intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = intArray[0];
        if (i == 0) {
            sb.append("Single AF");
        } else if (i == 1) {
            sb.append("Sequential shooting AF");
        } else if (i == 2) {
            sb.append("Continuous AF");
        } else if (i == 3) {
            sb.append("Multi AF");
        } else if (i == 4) {
            sb.append("Face detect");
        } else if (i != 10) {
            sb.append("Unknown (" + intArray[0] + ")");
        } else {
            sb.append("MF");
        }
        if (intArray.length > 1) {
            sb.append("; ");
            int i2 = intArray[1];
            if (i2 == 0) {
                sb.append("(none)");
            } else {
                if ((i2 & 1) > 0) {
                    sb.append("S-AF, ");
                }
                if (((i2 >> 2) & 1) > 0) {
                    sb.append("C-AF, ");
                }
                if (((i2 >> 4) & 1) > 0) {
                    sb.append("MF, ");
                }
                if (((i2 >> 5) & 1) > 0) {
                    sb.append("Face detect, ");
                }
                if (((i2 >> 6) & 1) > 0) {
                    sb.append("Imager AF, ");
                }
                if (((i2 >> 7) & 1) > 0) {
                    sb.append("Live View Magnification Frame, ");
                }
                if (((i2 >> 8) & 1) > 0) {
                    sb.append("AF sensor, ");
                }
                sb.setLength(sb.length() - 2);
            }
        }
        return sb.toString();
    }

    public final String getFocusProcessDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(770);
        if (intArray == null) {
            Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(770);
            if (integer == null) {
                return null;
            }
            intArray = new int[]{integer.intValue()};
        }
        if (intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = intArray[0];
        if (i == 0) {
            sb.append("AF not used");
        } else if (i != 1) {
            sb.append("Unknown (" + intArray[0] + ")");
        } else {
            sb.append("AF used");
        }
        if (intArray.length > 1) {
            sb.append("; " + intArray[1]);
        }
        return sb.toString();
    }

    public final String getGradationDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(1295);
        if (intArray == null || intArray.length < 3) {
            return null;
        }
        String str = String.format("%d %d %d", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]), Integer.valueOf(intArray[2]));
        String strX = str.equals("0 0 0") ? "n/a" : str.equals("-1 -1 1") ? "Low Key" : str.equals("0 -1 1") ? "Normal" : str.equals("1 -1 1") ? "High Key" : ev6.x("Unknown (", str, ")");
        if (intArray.length > 3) {
            int i = intArray[3];
            if (i == 0) {
                return strX.concat("; User-Selected");
            }
            if (i == 1) {
                return strX.concat("; Auto-Override");
            }
        }
        return strX;
    }

    public final String getImageQuality2Description() {
        return getIndexedDescription(OlympusCameraSettingsMakernoteDirectory.TagImageQuality2, 1, "SQ", "HQ", "SHQ", "RAW", "SQ (5)");
    }

    public final String getImageStabilizationDescription() {
        return getIndexedDescription(OlympusCameraSettingsMakernoteDirectory.TagImageStabilization, 0, "Off", "On, Mode 1", "On, Mode 2", "On, Mode 3", "On, Mode 4");
    }

    public final String getMacroModeDescription() {
        return getIndexedDescription(768, 0, "Off", "On", "Super Macro");
    }

    public final String getMagicFilterDescription() {
        return getFiltersDescription(OlympusCameraSettingsMakernoteDirectory.TagMagicFilter);
    }

    public final String getManometerPressureDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(OlympusCameraSettingsMakernoteDirectory.TagManometerPressure);
        if (integer == null) {
            return null;
        }
        return km4.y(new DecimalFormat("#.##").format(((double) integer.intValue()) / 10.0d), " kPa");
    }

    public final String getManometerReadingDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagManometerReading);
        if (intArray == null || intArray.length < 2) {
            return null;
        }
        DecimalFormat decimalFormat = new DecimalFormat("#.##");
        return decimalFormat.format(((double) intArray[0]) / 10.0d) + " m, " + decimalFormat.format(((double) intArray[1]) / 10.0d) + " ft";
    }

    public final String getManualFlashStrengthDescription() {
        Rational[] rationalArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getRationalArray(1030);
        if (rationalArray == null || rationalArray.length == 0) {
            return "n/a";
        }
        if (rationalArray.length == 3) {
            if (rationalArray[0].getDenominator() == 0 && rationalArray[1].getDenominator() == 0 && rationalArray[2].getDenominator() == 0) {
                return "n/a";
            }
        } else if (rationalArray.length == 4 && rationalArray[0].getDenominator() == 0 && rationalArray[1].getDenominator() == 0 && rationalArray[2].getDenominator() == 0 && rationalArray[3].getDenominator() == 0) {
            return "n/a (x4)";
        }
        StringBuilder sb = new StringBuilder();
        for (Rational rational : rationalArray) {
            sb.append(rational);
            sb.append(", ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getMeteringModeDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(514);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 2 ? iIntValue != 3 ? iIntValue != 5 ? iIntValue != 261 ? iIntValue != 515 ? iIntValue != 1027 ? ho2.G("Unknown (", integer, ")") : "Spot+Shadow control" : "Spot+Highlight control" : "Pattern+AF" : "ESP" : "Spot" : "Center-weighted average";
    }

    public final String getModifiedSaturationDescription() {
        return getIndexedDescription(1284, 0, "Off", "CM1 (Red Enhance)", "CM2 (Green Enhance)", "CM3 (Blue Enhance)", "CM4 (Skin Tones)");
    }

    public final String getNdFilterDescription() {
        return getIndexedDescription(516, 0, "Off", "On");
    }

    public final String getNoiseFilterDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagNoiseFilter);
        if (intArray == null) {
            return null;
        }
        String str = String.format("%d %d %d", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]), Integer.valueOf(intArray[2]));
        return str.equals("0 0 0") ? "n/a" : str.equals("-2 -2 1") ? "Off" : str.equals("-1 -2 1") ? "Low" : str.equals("0 -2 1") ? "Standard" : str.equals("1 -2 1") ? "High" : ev6.x("Unknown (", str, ")");
    }

    public final String getNoiseReductionDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1290);
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
            sb.append("Auto, ");
        }
        return sb.length() != 0 ? sb.substring(0, sb.length() - 2) : "(none)";
    }

    public final String getPanoramaModeDescription() {
        int i;
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(1537);
        if (intArray == null) {
            return null;
        }
        if (intArray.length == 0 || (i = intArray[0]) == 0) {
            return "Off";
        }
        return String.format("%s, Shot %d", i != 1 ? i != 2 ? i != 3 ? i != 4 ? ho2.H(new StringBuilder("Unknown ("), intArray[0], ")") : "Top to Bottom" : "Bottom to Top" : "Right to Left" : "Left to Right", Integer.valueOf(intArray[1]));
    }

    public final String getPictureModeBWFilterDescription() {
        return getIndexedDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeBWFilter, 0, "n/a", "Neutral", "Yellow", "Orange", "Red", "Green");
    }

    public final String getPictureModeContrastDescription() {
        return getValueMinMaxDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeContrast);
    }

    public final String getPictureModeDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(1312);
        if (intArray == null) {
            Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1290);
            if (integer == null) {
                return null;
            }
            intArray = new int[]{integer.intValue()};
        }
        if (intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = intArray[0];
        if (i == 1) {
            sb.append("Vivid");
        } else if (i == 2) {
            sb.append("Natural");
        } else if (i == 3) {
            sb.append("Muted");
        } else if (i == 4) {
            sb.append("Portrait");
        } else if (i == 5) {
            sb.append("i-Enhance");
        } else if (i == 256) {
            sb.append("Monotone");
        } else if (i != 512) {
            sb.append("Unknown (");
            sb.append(intArray[0]);
            sb.append(")");
        } else {
            sb.append("Sepia");
        }
        if (intArray.length > 1) {
            sb.append("; ");
            sb.append(intArray[1]);
        }
        return sb.toString();
    }

    public final String getPictureModeEffectDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagPictureModeEffect);
        if (intArray == null) {
            return null;
        }
        String str = String.format("%d %d %d", Integer.valueOf(intArray[0]), Integer.valueOf(intArray[1]), Integer.valueOf(intArray[2]));
        return str.equals("0 0 0") ? "n/a" : str.equals("-1 -1 1") ? "Low" : str.equals("0 -1 1") ? "Standard" : str.equals("1 -1 1") ? "High" : ev6.x("Unknown (", str, ")");
    }

    public final String getPictureModeSaturationDescription() {
        return getValueMinMaxDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeSaturation);
    }

    public final String getPictureModeSharpnessDescription() {
        return getValueMinMaxDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeSharpness);
    }

    public final String getPictureModeToneDescription() {
        return getIndexedDescription(OlympusCameraSettingsMakernoteDirectory.TagPictureModeTone, 0, "n/a", "Neutral", "Sepia", "Blue", "Purple", "Green");
    }

    public final String getPitchAngleDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagPitchAngle);
        if (intArray == null || intArray.length < 2) {
            return null;
        }
        int i = intArray[0];
        return String.format("%s %d", i != 0 ? Double.toString(((double) i) / 10.0d) : "n/a", Integer.valueOf(intArray[1]));
    }

    public final String getPreviewImageValidDescription() {
        return getIndexedDescription(256, 0, "No", "Yes");
    }

    public final String getRollAngleDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagRollAngle);
        if (intArray == null || intArray.length < 2) {
            return null;
        }
        int i = intArray[0];
        return String.format("%s %d", i != 0 ? Double.toString(((double) (-i)) / 10.0d) : "n/a", Integer.valueOf(intArray[1]));
    }

    public final String getShadingCompensationDescription() {
        return getIndexedDescription(1292, 0, "Off", "On");
    }

    public final String getSharpnessSettingDescription() {
        return getValueMinMaxDescription(1286);
    }

    public final String getStackedImageDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagStackedImage);
        if (intArray == null || intArray.length < 2) {
            return null;
        }
        int i = intArray[0];
        int i2 = intArray[1];
        return (i == 0 && i2 == 0) ? "No" : (i == 9 && i2 == 8) ? "Focus-stacked (8 images)" : String.format("Unknown (%d %d)", Integer.valueOf(i), Integer.valueOf(i2));
    }

    public final String getToneLevelDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(OlympusCameraSettingsMakernoteDirectory.TagToneLevel);
        if (intArray == null || intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < intArray.length; i++) {
            if (i == 0 || i == 4 || i == 8 || i == 12 || i == 16 || i == 20 || i == 24) {
                sb.append(_toneLevelType.get(Integer.valueOf(intArray[i])));
                sb.append("; ");
            } else {
                sb.append(intArray[i]);
                sb.append("; ");
            }
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getWhiteBalance2Description() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1280);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Auto";
        }
        if (iIntValue == 1) {
            return "Auto (Keep Warm Color Off)";
        }
        if (iIntValue == 48) {
            return "3600K (Tungsten light-like)";
        }
        if (iIntValue == 67) {
            return "Underwater";
        }
        switch (iIntValue) {
            case 16:
                return "7500K (Fine Weather with Shade)";
            case 17:
                return "6000K (Cloudy)";
            case 18:
                return "5300K (Fine Weather)";
            default:
                switch (iIntValue) {
                    case 20:
                        return "3000K (Tungsten light)";
                    case 21:
                        return "3600K (Tungsten light-like)";
                    case 22:
                        return "Auto Setup";
                    case 23:
                        return "5500K (Flash)";
                    default:
                        switch (iIntValue) {
                            case 33:
                                return "6600K (Daylight fluorescent)";
                            case 34:
                                return "4500K (Neutral white fluorescent)";
                            case 35:
                                return "4000K (Cool white fluorescent)";
                            case 36:
                                return "White Fluorescent";
                            default:
                                switch (iIntValue) {
                                    case 256:
                                        return "One Touch WB 1";
                                    case 257:
                                        return "One Touch WB 2";
                                    case 258:
                                        return "One Touch WB 3";
                                    case 259:
                                        return "One Touch WB 4";
                                    default:
                                        switch (iIntValue) {
                                            case 512:
                                                return "Custom WB 1";
                                            case 513:
                                                return "Custom WB 2";
                                            case 514:
                                                return "Custom WB 3";
                                            case 515:
                                                return "Custom WB 4";
                                            default:
                                                return ho2.G("Unknown (", integer, ")");
                                        }
                                }
                        }
                }
        }
    }

    public final String getWhiteBalanceTemperatureDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1281);
        if (integer == null) {
            return null;
        }
        return integer.intValue() == 0 ? "Auto" : integer.toString();
    }

    public final String getDriveModeDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(1536);
        if (intArray == null) {
            return null;
        }
        if (intArray.length == 0 || intArray[0] == 0) {
            return "Single Shot";
        }
        StringBuilder sb = new StringBuilder();
        int i = intArray[0];
        if (i == 5 && intArray.length >= 3) {
            int i2 = intArray[2];
            if ((i2 & 1) > 0) {
                sb.append("AE");
            }
            if (((i2 >> 1) & 1) > 0) {
                sb.append("WB");
            }
            if (((i2 >> 2) & 1) > 0) {
                sb.append("FL");
            }
            if (((i2 >> 3) & 1) > 0) {
                sb.append("MF");
            }
            if (((i2 >> 6) & 1) > 0) {
                sb.append("Focus");
            }
            sb.append(" Bracketing");
        } else if (i == 1) {
            sb.append("Continuous Shooting");
        } else if (i == 2) {
            sb.append("Exposure Bracketing");
        } else if (i == 3) {
            sb.append("White Balance Bracketing");
        } else if (i != 4) {
            sb.append(fiHTiFJ.CNfnRYhKTbYRiH);
            sb.append(intArray[0]);
            sb.append(")");
        } else {
            sb.append("Exposure+WB Bracketing");
        }
        sb.append(", Shot ");
        sb.append(intArray[1]);
        return sb.toString();
    }

    public final String getFlashControlModeDescription() {
        int[] intArray = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getIntArray(1028);
        if (intArray == null || intArray.length == 0) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = intArray[0];
        if (i == 0) {
            sb.append("Off");
        } else if (i == 3) {
            sb.append("TTL");
        } else if (i == 4) {
            sb.append("Auto");
        } else if (i != 5) {
            sb.append("Unknown (");
            sb.append(intArray[0]);
            sb.append(")");
        } else {
            sb.append(ivbZv.HpKFhWjjYTqXt);
        }
        for (int i2 = 1; i2 < intArray.length; i2++) {
            sb.append("; ");
            sb.append(intArray[i2]);
        }
        return sb.toString();
    }

    public final String getFlashModeDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1024);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "Off";
        }
        StringBuilder sb = new StringBuilder();
        int iIntValue = integer.intValue();
        if ((iIntValue & 1) != 0) {
            sb.append("On, ");
        }
        if (((iIntValue >> 1) & 1) != 0) {
            sb.append(ZVsviyDAr.auUdiROVtmhSD);
        }
        if (((iIntValue >> 2) & 1) != 0) {
            sb.append("Red-eye, ");
        }
        if (((iIntValue >> 3) & 1) != 0) {
            sb.append("Slow-sync, ");
        }
        if (((iIntValue >> 4) & 1) != 0) {
            sb.append("Forced On, ");
        }
        if (((iIntValue >> 5) & 1) != 0) {
            sb.append("2nd Curtain, ");
        }
        return sb.substring(0, sb.length() - 2);
    }

    public final String getFlashRemoteControlDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1027);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Off";
        }
        if (iIntValue == 1) {
            return "Channel 1, Low";
        }
        if (iIntValue == 2) {
            return "Channel 2, Low";
        }
        if (iIntValue == 3) {
            return "Channel 3, Low";
        }
        if (iIntValue == 4) {
            return "Channel 4, Low";
        }
        switch (iIntValue) {
            case 9:
                return "Channel 1, Mid";
            case 10:
                return "Channel 2, Mid";
            case 11:
                return "Channel 3, Mid";
            case 12:
                return "Channel 4, Mid";
            default:
                switch (iIntValue) {
                    case 17:
                        return "Channel 1, High";
                    case 18:
                        return "Channel 2, High";
                    case 19:
                        return PdtluglzAX.PpEeeVVqLJwG;
                    case 20:
                        return "Channel 4, High";
                    default:
                        return ho2.G("Unknown (", integer, ")");
                }
        }
    }

    public final String getSceneModeDescription() {
        Integer integer = ((OlympusCameraSettingsMakernoteDirectory) this._directory).getInteger(1289);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Standard";
        }
        if (iIntValue == 54) {
            return "Face Portrait";
        }
        if (iIntValue == 57) {
            return "Bulb";
        }
        if (iIntValue == 142) {
            return "Hand-held Starlight";
        }
        if (iIntValue == 154) {
            return "HDR";
        }
        if (iIntValue == 59) {
            return "Smile Shot";
        }
        if (iIntValue == 60) {
            return ziYqbdHrAXvj.lJGCzhrZTBM;
        }
        switch (iIntValue) {
            case 6:
                return "Auto";
            case 7:
                return "Sport";
            case 8:
                return "Portrait";
            case 9:
                return "Landscape+Portrait";
            case 10:
                return "Landscape";
            case 11:
                return "Night Scene";
            case 12:
                return "Self Portrait";
            case 13:
                return "Panorama";
            case 14:
                return "2 in 1";
            case 15:
                return "Movie";
            case 16:
                return "Landscape+Portrait";
            case 17:
                return "Night+Portrait";
            case 18:
                return "Indoor";
            case 19:
                return "Fireworks";
            case 20:
                return "Sunset";
            case 21:
                return "Beauty Skin";
            case 22:
                return "Macro";
            case 23:
                return "Super Macro";
            case 24:
                return "Food";
            case 25:
                return "Documents";
            case 26:
                return "Museum";
            case 27:
                return "Shoot & Select";
            case 28:
                return "Beach & Snow";
            case 29:
                return "Self Portrait+Timer";
            case 30:
                return "Candle";
            case 31:
                return "Available Light";
            case 32:
                return "Behind Glass";
            case 33:
                return "My Mode";
            case 34:
                return "Pet";
            case 35:
                return "Underwater Wide1";
            case 36:
                return "Underwater Macro";
            case 37:
                return "Shoot & Select1";
            case 38:
                return "Shoot & Select2";
            case 39:
                return "High Key";
            case 40:
                return "Digital Image Stabilization";
            case 41:
                return "Auction";
            case 42:
                return "Beach";
            case 43:
                return "Snow";
            case 44:
                return "Underwater Wide2";
            case 45:
                return "Low Key";
            case 46:
                return "Children";
            case 47:
                return "Vivid";
            case 48:
                return "Nature Macro";
            case 49:
                return "Underwater Snapshot";
            case 50:
                return "Shooting Guide";
            default:
                switch (iIntValue) {
                    case 63:
                        return "Slow Shutter";
                    case 64:
                        return "Bird Watching";
                    case 65:
                        return "Multiple Exposure";
                    case 66:
                        return "e-Portrait";
                    case 67:
                        return "Soft Background Shot";
                    default:
                        return ho2.G("Unknown (", integer, ")");
                }
        }
    }
}
