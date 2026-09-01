package com.drew.metadata.exif.makernotes;

import com.drew.lang.ByteArrayReader;
import com.drew.lang.Charsets;
import com.drew.metadata.Age;
import com.drew.metadata.Face;
import com.drew.metadata.TagDescriptor;
import com.google.android.gms.analytics.wYI.ivbZv;
import defpackage.ho2;
import java.io.IOException;
import java.text.DecimalFormat;
import sprig.b.VPIE.dpBiLjNeNsiASg;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class PanasonicMakernoteDescriptor extends TagDescriptor<PanasonicMakernoteDirectory> {
    private static final String[] _sceneModes = {"Normal", "Portrait", "Scenery", "Sports", "Night Portrait", "Program", "Aperture Priority", "Shutter Priority", "Macro", "Spot", "Manual", "Movie Preview", "Panning", "Simple", "Color Effects", "Self Portrait", "Economy", "Fireworks", "Party", "Snow", "Night Scenery", "Food", "Baby", "Soft Skin", "Candlelight", "Starry Night", "High Sensitivity", "Panorama Assist", "Underwater", "Beach", "Aerial Photo", "Sunset", "Pet", "Intelligent ISO", "Clipboard", "High Speed Continuous Shooting", "Intelligent Auto", null, "Multi-aspect", null, "Transform", "Flash Burst", "Pin Hole", "Film Grain", "My Color", "Photo Frame", null, null, null, null, "HDR"};

    public PanasonicMakernoteDescriptor(PanasonicMakernoteDirectory panasonicMakernoteDirectory) {
        super(panasonicMakernoteDirectory);
    }

    private String buildFacesDescription(Face[] faceArr) {
        if (faceArr == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (i < faceArr.length) {
            sb.append("Face ");
            int i2 = i + 1;
            sb.append(i2);
            sb.append(": ");
            sb.append(faceArr[i].toString());
            sb.append("\n");
            i = i2;
        }
        if (sb.length() > 0) {
            return sb.substring(0, sb.length() - 1);
        }
        return null;
    }

    private String getTransformDescription(int i) {
        byte[] byteArray = ((PanasonicMakernoteDirectory) this._directory).getByteArray(i);
        if (byteArray == null) {
            return null;
        }
        ByteArrayReader byteArrayReader = new ByteArrayReader(byteArray, 0);
        try {
            int uInt16 = byteArrayReader.getUInt16(0);
            int uInt162 = byteArrayReader.getUInt16(2);
            if (uInt16 == -1 && uInt162 == 1) {
                return "Slim Low";
            }
            if (uInt16 == -3 && uInt162 == 2) {
                return "Slim High";
            }
            if (uInt16 == 0 && uInt162 == 0) {
                return "Off";
            }
            if (uInt16 == 1 && uInt162 == 1) {
                return "Stretch Low";
            }
            if (uInt16 == 3 && uInt162 == 2) {
                return "Stretch High";
            }
            return "Unknown (" + uInt16 + " " + uInt162 + ")";
        } catch (IOException unused) {
            return null;
        }
    }

    private static String trim(String str) {
        if (str == null) {
            return null;
        }
        return str.trim();
    }

    public final String getAccelerometerXDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(141);
        if (integer == null) {
            return null;
        }
        return String.valueOf((int) integer.shortValue());
    }

    public final String getAccelerometerYDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(142);
        if (integer == null) {
            return null;
        }
        return String.valueOf((int) integer.shortValue());
    }

    public final String getAccelerometerZDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(140);
        if (integer == null) {
            return null;
        }
        return String.valueOf((int) integer.shortValue());
    }

    public final String getAdvancedSceneModeDescription() {
        return getIndexedDescription(61, 1, "Normal", "Outdoor/Illuminations/Flower/HDR Art", "Indoor/Architecture/Objects/HDR B&W", "Creative", "Auto", null, "Expressive", "Retro", "Pure", "Elegant", null, "Monochrome", "Dynamic Art", "Silhouette");
    }

    public final String getAfAssistLampDescription() {
        return getIndexedDescription(49, 1, "Fired", "Enabled but not used", "Disabled but required", "Disabled and not required");
    }

    public final String getAudioDescription() {
        return getIndexedDescription(32, 1, "Off", "On");
    }

    public final String getBabyAge1Description() {
        Age age = ((PanasonicMakernoteDirectory) this._directory).getAge(PanasonicMakernoteDirectory.TAG_BABY_AGE_1);
        if (age == null) {
            return null;
        }
        return age.toFriendlyString();
    }

    public final String getBabyAgeDescription() {
        Age age = ((PanasonicMakernoteDirectory) this._directory).getAge(51);
        if (age == null) {
            return null;
        }
        return age.toFriendlyString();
    }

    public final String getBabyNameDescription() {
        return trim(getStringFromBytes(102, Charsets.UTF_8));
    }

    public final String getBurstModeDescription() {
        return getIndexedDescription(42, 0, "Off", null, "On", "Indefinite", "Unlimited");
    }

    public final String getCameraOrientationDescription() {
        return getIndexedDescription(143, 0, "Normal", "Rotate CW", "Rotate 180", "Rotate CCW", "Tilt Upwards", "Tile Downwards");
    }

    public final String getCityDescription() {
        return trim(getStringFromBytes(109, Charsets.UTF_8));
    }

    public final String getClearRetouchDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, 0, "Off", "On");
    }

    public final String getColorEffectDescription() {
        return getIndexedDescription(40, 1, "Off", "Warm", "Cool", "Black & White", "Sepia");
    }

    public final String getColorModeDescription() {
        return getIndexedDescription(50, 0, "Normal", "Natural", "Vivid");
    }

    public final String getContrastDescription() {
        return getIndexedDescription(57, 0, "Normal");
    }

    public final String getContrastModeDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(44);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 6 ? iIntValue != 7 ? iIntValue != 256 ? iIntValue != 272 ? iIntValue != 288 ? ho2.G("Unknown (", integer, ")") : "High" : "Normal" : "Low" : "Medium High" : "Medium Low" : "High" : "Low" : "Normal";
    }

    public final String getConversionLensDescription() {
        return getIndexedDescription(53, 1, "Off", "Wide", "Telephoto", "Macro");
    }

    public final String getCountryDescription() {
        return trim(getStringFromBytes(PanasonicMakernoteDirectory.TAG_COUNTRY, Charsets.UTF_8));
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 1:
                return getQualityModeDescription();
            case 2:
                return getVersionBytesDescription(2, 2);
            case 3:
                return getWhiteBalanceDescription();
            case 7:
                return getFocusModeDescription();
            case 15:
                return getAfAreaModeDescription();
            case 26:
                return getImageStabilizationDescription();
            case 28:
                return getMacroModeDescription();
            case 31:
                return getRecordModeDescription();
            case 32:
                return getAudioDescription();
            case 33:
                return getByteLengthDescription(33);
            case 37:
                return get7BitStringFromBytes(37);
            case 38:
                return getExifVersionDescription();
            case 40:
                return getColorEffectDescription();
            case 41:
                return getUptimeDescription();
            case 42:
                return getBurstModeDescription();
            case 44:
                return getContrastModeDescription();
            case 45:
                return getNoiseReductionDescription();
            case 46:
                return getSelfTimerDescription();
            case 48:
                return getRotationDescription();
            case 49:
                return getAfAssistLampDescription();
            case 50:
                return getColorModeDescription();
            case 51:
                return getBabyAgeDescription();
            case 52:
                return getOpticalZoomModeDescription();
            case 53:
                return getConversionLensDescription();
            case 57:
                return getContrastDescription();
            case 58:
                return getWorldTimeLocationDescription();
            case 59:
                return getTextStampDescription();
            case 61:
                return getAdvancedSceneModeDescription();
            case 62:
                return getTextStamp1Description();
            case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                return getBracketSettingsDescription();
            case 72:
                return getFlashCurtainDescription();
            case 73:
                return getLongExposureNoiseReductionDescription();
            case 78:
                return getDetectedFacesDescription();
            case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                return getTransformDescription(89);
            case 93:
                return getIntelligentExposureDescription();
            case 96:
                return getLensFirmwareVersionDescription();
            case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                return getRecognizedFacesDescription();
            case 98:
                return getFlashWarningDescription();
            case 101:
                return getTitleDescription();
            case 102:
                return getBabyNameDescription();
            case 103:
                return getLocationDescription();
            case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                return getCountryDescription();
            case 107:
                return getStateDescription();
            case 109:
                return getCityDescription();
            case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                return getLandmarkDescription();
            case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                return getIntelligentResolutionDescription();
            case PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE /* 121 */:
                return getIntelligentDRangeDescription();
            case PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH /* 124 */:
                return getClearRetouchDescription();
            case 137:
                return getPhotoStyleDescription();
            case 138:
                return getShadingCompensationDescription();
            case 140:
                return getAccelerometerZDescription();
            case 141:
                return getAccelerometerXDescription();
            case 142:
                return getAccelerometerYDescription();
            case 143:
                return getCameraOrientationDescription();
            case 144:
                return getRollAngleDescription();
            case 145:
                return getPitchAngleDescription();
            case 147:
                return getSweepPanoramaDirectionDescription();
            case 150:
                return getTimerRecordingDescription();
            case 158:
                return getHDRDescription();
            case 159:
                return getShutterTypeDescription();
            case 171:
                return getTouchAeDescription();
            case 32768:
                return getMakernoteVersionDescription();
            case PanasonicMakernoteDirectory.TAG_SCENE_MODE /* 32769 */:
                return getSceneModeDescription();
            case PanasonicMakernoteDirectory.TAG_FLASH_FIRED /* 32775 */:
                return getFlashFiredDescription();
            case PanasonicMakernoteDirectory.TAG_TEXT_STAMP_2 /* 32776 */:
                return getTextStamp2Description();
            case PanasonicMakernoteDirectory.TAG_TEXT_STAMP_3 /* 32777 */:
                return getTextStamp3Description();
            case PanasonicMakernoteDirectory.TAG_BABY_AGE_1 /* 32784 */:
                return getBabyAge1Description();
            case PanasonicMakernoteDirectory.TAG_TRANSFORM_1 /* 32786 */:
                return getTransformDescription(PanasonicMakernoteDirectory.TAG_TRANSFORM_1);
            default:
                return super.getDescription(i);
        }
    }

    public final String getDetectedFacesDescription() {
        return buildFacesDescription(((PanasonicMakernoteDirectory) this._directory).getDetectedFaces());
    }

    public final String getExifVersionDescription() {
        return getVersionBytesDescription(38, 2);
    }

    public final String getFlashCurtainDescription() {
        return getIndexedDescription(72, 0, "n/a", "1st", "2nd");
    }

    public final String getFlashFiredDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_FLASH_FIRED, 1, "Off", "On");
    }

    public final String getFlashWarningDescription() {
        return getIndexedDescription(98, 0, "No", "Yes (Flash required but disabled)");
    }

    public final String getFocusModeDescription() {
        return getIndexedDescription(7, 1, "Auto", "Manual", null, "Auto, Focus Button", "Auto, Continuous");
    }

    public final String getHDRDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(158);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 100 ? iIntValue != 200 ? iIntValue != 300 ? iIntValue != 32868 ? iIntValue != 32968 ? iIntValue != 33068 ? String.format("Unknown (%d)", integer) : "3 EV (Auto)" : "2 EV (Auto)" : "1 EV (Auto)" : "3 EV" : "2 EV" : "1 EV" : "Off";
    }

    public final String getImageStabilizationDescription() {
        return getIndexedDescription(26, 2, "On, Mode 1", "Off", "On, Mode 2");
    }

    public final String getIntelligentDRangeDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE, 0, "Off", "Low", "Standard", "High");
    }

    public final String getIntelligentExposureDescription() {
        return getIndexedDescription(93, 0, "Off", "Low", "Standard", "High");
    }

    public final String getIntelligentResolutionDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 0, "Off", null, "Auto", "On");
    }

    public final String getInternalSerialNumberDescription() {
        return get7BitStringFromBytes(37);
    }

    public final String getLandmarkDescription() {
        return trim(getStringFromBytes(PanasonicMakernoteDirectory.TAG_LANDMARK, Charsets.UTF_8));
    }

    public final String getLensFirmwareVersionDescription() {
        byte[] byteArray = ((PanasonicMakernoteDirectory) this._directory).getByteArray(96);
        if (byteArray == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < byteArray.length; i++) {
            sb.append((int) byteArray[i]);
            if (i < byteArray.length - 1) {
                sb.append(".");
            }
        }
        return sb.toString();
    }

    public final String getLocationDescription() {
        return trim(getStringFromBytes(103, Charsets.UTF_8));
    }

    public final String getLongExposureNoiseReductionDescription() {
        return getIndexedDescription(73, 1, "Off", "On");
    }

    public final String getMacroModeDescription() {
        return getIndexedDescription(28, 1, "Off", "On");
    }

    public final String getMakernoteVersionDescription() {
        return getVersionBytesDescription(32768, 2);
    }

    public final String getNoiseReductionDescription() {
        return getIndexedDescription(45, 0, "Standard (0)", "Low (-1)", "High (+1)", "Lowest (-2)", "Highest (+2)");
    }

    public final String getOpticalZoomModeDescription() {
        return getIndexedDescription(52, 1, "Standard", "Extended");
    }

    public final String getPhotoStyleDescription() {
        return getIndexedDescription(137, 0, "Auto", "Standard or Custom", "Vivid", "Natural", "Monochrome", "Scenery", "Portrait");
    }

    public final String getPitchAngleDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(145);
        if (integer == null) {
            return null;
        }
        return new DecimalFormat("0.#").format(((double) (-integer.shortValue())) / 10.0d);
    }

    public final String getQualityModeDescription() {
        return getIndexedDescription(1, 2, "High", "Normal", null, null, "Very High", "Raw", null, "Motion Picture");
    }

    public final String getRecognizedFacesDescription() {
        return buildFacesDescription(((PanasonicMakernoteDirectory) this._directory).getRecognizedFaces());
    }

    public final String getRecordModeDescription() {
        return getIndexedDescription(31, 1, _sceneModes);
    }

    public final String getRollAngleDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(144);
        if (integer == null) {
            return null;
        }
        return new DecimalFormat("0.#").format(((double) integer.shortValue()) / 10.0d);
    }

    public final String getRotationDescription() {
        Integer integer = ((PanasonicMakernoteDirectory) this._directory).getInteger(48);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 1 ? iIntValue != 3 ? iIntValue != 6 ? iIntValue != 8 ? ho2.G("Unknown (", integer, ")") : "Rotate 270 CW" : "Rotate 90 CW" : "Rotate 180" : "Horizontal";
    }

    public final String getSceneModeDescription() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_SCENE_MODE, 1, _sceneModes);
    }

    public final String getSelfTimerDescription() {
        return getIndexedDescription(46, 1, "Off", "10 s", "2 s");
    }

    public final String getShadingCompensationDescription() {
        return getIndexedDescription(138, 0, "Off", "On");
    }

    public final String getShutterTypeDescription() {
        return getIndexedDescription(159, 0, "Mechanical", "Electronic", "Hybrid");
    }

    public final String getStateDescription() {
        return trim(getStringFromBytes(107, Charsets.UTF_8));
    }

    public final String getSweepPanoramaDirectionDescription() {
        return getIndexedDescription(147, 0, "Off", "Left to Right", "Right to Left", "Top to Bottom", "Bottom to Top");
    }

    public final String getTextStamp1Description() {
        return getIndexedDescription(62, 1, "Off", "On");
    }

    public final String getTextStamp2Description() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_TEXT_STAMP_2, 1, "Off", "On");
    }

    public final String getTextStamp3Description() {
        return getIndexedDescription(PanasonicMakernoteDirectory.TAG_TEXT_STAMP_3, 1, "Off", "On");
    }

    public final String getTextStampDescription() {
        return getIndexedDescription(59, 1, "Off", "On");
    }

    public final String getTimerRecordingDescription() {
        return getIndexedDescription(150, 0, "Off", "Time Lapse", "Stop-motion Animation");
    }

    public final String getTitleDescription() {
        return trim(getStringFromBytes(101, Charsets.UTF_8));
    }

    public final String getTouchAeDescription() {
        return getIndexedDescription(171, 0, "Off", "On");
    }

    public final String getTransform1Description() {
        return getTransformDescription(PanasonicMakernoteDirectory.TAG_TRANSFORM_1);
    }

    public final String getUnknownDataDumpDescription() {
        return getByteLengthDescription(33);
    }

    public final String getUptimeDescription() {
        if (((PanasonicMakernoteDirectory) this._directory).getInteger(41) == null) {
            return null;
        }
        return (r2.intValue() / 100.0f) + " s";
    }

    public final String getVersionDescription() {
        return getVersionBytesDescription(2, 2);
    }

    public final String getWhiteBalanceDescription() {
        return getIndexedDescription(3, 1, "Auto", "Daylight", "Cloudy", "Incandescent", "Manual", null, null, "Flash", null, "Black & White", "Manual", "Shade");
    }

    public final String getWorldTimeLocationDescription() {
        return getIndexedDescription(58, 1, "Home", "Destination");
    }

    public final String getAfAreaModeDescription() {
        int[] intArray = ((PanasonicMakernoteDirectory) this._directory).getIntArray(15);
        if (intArray == null || intArray.length < 2) {
            return null;
        }
        int i = intArray[0];
        if (i == 0) {
            int i2 = intArray[1];
            if (i2 == 1) {
                return "Spot Mode On";
            }
            if (i2 == 16) {
                return "Spot Mode Off";
            }
            StringBuilder sb = new StringBuilder("Unknown (");
            sb.append(intArray[0]);
            sb.append(" ");
            return ho2.H(sb, intArray[1], ")");
        }
        if (i == 1) {
            int i3 = intArray[1];
            if (i3 == 0) {
                return "Spot Focusing";
            }
            if (i3 == 1) {
                return "5-area";
            }
            StringBuilder sb2 = new StringBuilder("Unknown (");
            sb2.append(intArray[0]);
            sb2.append(" ");
            return ho2.H(sb2, intArray[1], ")");
        }
        if (i == 16) {
            int i4 = intArray[1];
            if (i4 == 0) {
                return "1-area";
            }
            if (i4 == 16) {
                return "1-area (high speed)";
            }
            StringBuilder sb3 = new StringBuilder("Unknown (");
            sb3.append(intArray[0]);
            sb3.append(" ");
            return ho2.H(sb3, intArray[1], ")");
        }
        if (i != 32) {
            if (i == 64) {
                return "Face Detect";
            }
            StringBuilder sb4 = new StringBuilder("Unknown (");
            sb4.append(intArray[0]);
            sb4.append(" ");
            return ho2.H(sb4, intArray[1], ")");
        }
        int i5 = intArray[1];
        if (i5 == 0) {
            return ivbZv.BzpgUxGfDmcJPKb;
        }
        if (i5 == 1) {
            return "3-area (left)";
        }
        if (i5 == 2) {
            return gYpYQDQkhfs.JAtipJDcIVn;
        }
        if (i5 == 3) {
            return "3-area (right)";
        }
        StringBuilder sb5 = new StringBuilder("Unknown (");
        sb5.append(intArray[0]);
        sb5.append(" ");
        return ho2.H(sb5, intArray[1], ")");
    }

    public final String getBracketSettingsDescription() {
        return getIndexedDescription(69, 0, "No Bracket", dpBiLjNeNsiASg.GrKyqH, "3 Images, Sequence -/0/+", "5 Images, Sequence 0/-/+", "5 Images, Sequence -/0/+", "7 Images, Sequence 0/-/+", "7 Images, Sequence -/0/+");
    }

    public final String getTransformDescription() {
        return getTransformDescription(89);
    }
}
