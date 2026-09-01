package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.medium.android.core.fragments.KB.JWcjNoweKCnTr;
import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.ho2;
import defpackage.lv8;
import java.text.DecimalFormat;
import java.util.HashMap;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class CanonMakernoteDescriptor extends TagDescriptor<CanonMakernoteDirectory> {
    private static final HashMap<Integer, String> _lensTypeById;

    public CanonMakernoteDescriptor(CanonMakernoteDirectory canonMakernoteDirectory) {
        super(canonMakernoteDirectory);
    }

    private double decodeCanonEv(int i) {
        int i2;
        if (i < 0) {
            i = -i;
            i2 = -1;
        } else {
            i2 = 1;
        }
        int i3 = i & 31;
        int i4 = i - i3;
        if (i3 == 12) {
            i3 = 10;
        } else if (i3 == 20) {
            i3 = 21;
        }
        return ((double) ((i4 + i3) * i2)) / 32.0d;
    }

    public final String getAESettingDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_AE_SETTING, 0, "Normal AE", "Exposure Compensation", "AE Lock", "AE Lock + Exposure Comp.", "No AE");
    }

    public final String getAfPointSelectedDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_AF_POINT_SELECTED, 12288, "None (MF)", "Auto selected", "Right", "Centre", "Left");
    }

    public final String getAfPointUsedDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.FocalLength.TAG_AF_POINT_USED);
        if (integer == null) {
            return null;
        }
        return (integer.intValue() & 7) == 0 ? "Right" : (integer.intValue() & 7) == 1 ? "Centre" : (integer.intValue() & 7) == 2 ? "Left" : ho2.G("Unknown (", integer, ")");
    }

    public final String getColorToneDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_COLOR_TONE);
        if (integer == null) {
            return null;
        }
        return integer.intValue() == 32767 ? "n/a" : integer.toString();
    }

    public final String getContrastDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_CONTRAST);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 65535 ? ho2.G("Unknown (", integer, ")") : "Low" : "High" : "Normal";
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 12:
                return getSerialNumberDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_1 /* 49415 */:
                return getFocusMode1Description();
            case CanonMakernoteDirectory.CameraSettings.TAG_COLOR_TONE /* 49449 */:
                return getColorToneDescription();
            case CanonMakernoteDirectory.CameraSettings.TAG_SRAW_QUALITY /* 49453 */:
                return getSRawQualityDescription();
            case CanonMakernoteDirectory.FocalLength.TAG_WHITE_BALANCE /* 49671 */:
                return getWhiteBalanceDescription();
            case CanonMakernoteDirectory.AFInfo.TAG_AF_POINTS_IN_FOCUS /* 53770 */:
                return getTagAfPointsInFocus();
            default:
                switch (i) {
                    case CanonMakernoteDirectory.CameraSettings.TAG_MACRO_MODE /* 49409 */:
                        return getMacroModeDescription();
                    case CanonMakernoteDirectory.CameraSettings.TAG_SELF_TIMER_DELAY /* 49410 */:
                        return getSelfTimerDelayDescription();
                    case CanonMakernoteDirectory.CameraSettings.TAG_QUALITY /* 49411 */:
                        return getQualityDescription();
                    case CanonMakernoteDirectory.CameraSettings.TAG_FLASH_MODE /* 49412 */:
                        return getFlashModeDescription();
                    case CanonMakernoteDirectory.CameraSettings.TAG_CONTINUOUS_DRIVE_MODE /* 49413 */:
                        return getContinuousDriveModeDescription();
                    default:
                        switch (i) {
                            case CanonMakernoteDirectory.CameraSettings.TAG_RECORD_MODE /* 49417 */:
                                return getRecordModeDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_IMAGE_SIZE /* 49418 */:
                                return getImageSizeDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_EASY_SHOOTING_MODE /* 49419 */:
                                return getEasyShootingModeDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_DIGITAL_ZOOM /* 49420 */:
                                return getDigitalZoomDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_CONTRAST /* 49421 */:
                                return getContrastDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_SATURATION /* 49422 */:
                                return getSaturationDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_SHARPNESS /* 49423 */:
                                return getSharpnessDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_ISO /* 49424 */:
                                return getIsoDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_METERING_MODE /* 49425 */:
                                return getMeteringModeDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_TYPE /* 49426 */:
                                return getFocusTypeDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_AF_POINT_SELECTED /* 49427 */:
                                return getAfPointSelectedDescription();
                            case CanonMakernoteDirectory.CameraSettings.TAG_EXPOSURE_MODE /* 49428 */:
                                return getExposureModeDescription();
                            default:
                                switch (i) {
                                    case CanonMakernoteDirectory.CameraSettings.TAG_LENS_TYPE /* 49430 */:
                                        return getLensTypeDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_LONG_FOCAL_LENGTH /* 49431 */:
                                        return getLongFocalLengthDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_SHORT_FOCAL_LENGTH /* 49432 */:
                                        return getShortFocalLengthDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_FOCAL_UNITS_PER_MM /* 49433 */:
                                        return getFocalUnitsPerMillimetreDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_MAX_APERTURE /* 49434 */:
                                        return getMaxApertureDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_MIN_APERTURE /* 49435 */:
                                        return getMinApertureDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_FLASH_ACTIVITY /* 49436 */:
                                        return getFlashActivityDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_FLASH_DETAILS /* 49437 */:
                                        return getFlashDetailsDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_CONTINUOUS /* 49438 */:
                                        return getFocusContinuousDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_AE_SETTING /* 49439 */:
                                        return getAESettingDescription();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_2 /* 49440 */:
                                        return getFocusMode2Description();
                                    case CanonMakernoteDirectory.CameraSettings.TAG_DISPLAY_APERTURE /* 49441 */:
                                        return getDisplayApertureDescription();
                                    default:
                                        switch (i) {
                                            case CanonMakernoteDirectory.CameraSettings.TAG_SPOT_METERING_MODE /* 49445 */:
                                                return getSpotMeteringModeDescription();
                                            case CanonMakernoteDirectory.CameraSettings.TAG_PHOTO_EFFECT /* 49446 */:
                                                return getPhotoEffectDescription();
                                            case CanonMakernoteDirectory.CameraSettings.TAG_MANUAL_FLASH_OUTPUT /* 49447 */:
                                                return getManualFlashOutputDescription();
                                            default:
                                                switch (i) {
                                                    case CanonMakernoteDirectory.FocalLength.TAG_AF_POINT_USED /* 49678 */:
                                                        return getAfPointUsedDescription();
                                                    case CanonMakernoteDirectory.FocalLength.TAG_FLASH_BIAS /* 49679 */:
                                                        return getFlashBiasDescription();
                                                    default:
                                                        return super.getDescription(i);
                                                }
                                        }
                                }
                        }
                }
        }
    }

    public final String getDigitalZoomDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_DIGITAL_ZOOM, 0, "No digital zoom", "2x", "4x");
    }

    public final String getDisplayApertureDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_DISPLAY_APERTURE);
        if (integer == null) {
            return null;
        }
        return integer.intValue() == 65535 ? integer.toString() : TagDescriptor.getFStopDescription(integer.intValue() / 10.0f);
    }

    public final String getEasyShootingModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_EASY_SHOOTING_MODE, 0, "Full auto", "Manual", "Landscape", "Fast shutter", "Slow shutter", "Night", "B&W", "Sepia", "Portrait", "Sports", "Macro / Closeup", "Pan focus");
    }

    public final String getExposureModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_EXPOSURE_MODE, 0, "Easy shooting", "Program", "Tv-priority", "Av-priority", "Manual", "A-DEP");
    }

    public final String getFlashActivityDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FLASH_ACTIVITY, 0, "Flash did not fire", "Flash fired");
    }

    public final String getFlashBiasDescription() {
        boolean z;
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.FocalLength.TAG_FLASH_BIAS);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() > 61440) {
            integer = Integer.valueOf(ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID - integer.intValue());
            z = true;
        } else {
            z = false;
        }
        return (z ? "-" : "") + Float.toString(integer.intValue() / 32.0f) + " EV";
    }

    public final String getFlashDetailsDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FLASH_DETAILS);
        if (integer == null) {
            return null;
        }
        return ((integer.intValue() >> 14) & 1) != 0 ? "External E-TTL" : ((integer.intValue() >> 13) & 1) != 0 ? "Internal flash" : ((integer.intValue() >> 11) & 1) != 0 ? "FP sync used" : ((integer.intValue() >> 4) & 1) != 0 ? "FP sync enabled" : ho2.G("Unknown (", integer, ")");
    }

    public final String getFocalUnitsPerMillimetreDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FOCAL_UNITS_PER_MM);
        if (integer == null) {
            return null;
        }
        return integer.intValue() != 0 ? Integer.toString(integer.intValue()) : "";
    }

    public final String getFocusContinuousDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_CONTINUOUS, 0, "Single", "Continuous", null, null, null, null, null, null, "Manual");
    }

    public final String getFocusMode1Description() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_1, 0, "One-shot", "AI Servo", "AI Focus", "Manual Focus", "Single", "Continuous", "Manual Focus");
    }

    public final String getFocusMode2Description() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_MODE_2, 0, "Single", "Continuous");
    }

    public final String getFocusTypeDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FOCUS_TYPE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 3 ? iIntValue != 8 ? ho2.G("Unknown (", integer, ")") : "Locked (Pan Mode)" : "Close-up (Macro)" : "Auto" : "Manual";
    }

    public final String getImageSizeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_IMAGE_SIZE, 0, "Large", "Medium", "Small");
    }

    public final String getIsoDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_ISO);
        if (integer == null) {
            return null;
        }
        if ((integer.intValue() & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0) {
            return "" + (integer.intValue() & (-16385));
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Not specified (see ISOSpeedRatings tag)";
        }
        switch (iIntValue) {
            case 15:
                return "Auto";
            case 16:
                return "50";
            case 17:
                return "100";
            case 18:
                return "200";
            case 19:
                return "400";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    public final String getLensTypeDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_LENS_TYPE);
        if (integer == null) {
            return null;
        }
        HashMap<Integer, String> map = _lensTypeById;
        return map.containsKey(integer) ? map.get(integer) : String.format("Unknown (%d)", integer);
    }

    public final String getLongFocalLengthDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_LONG_FOCAL_LENGTH);
        if (integer == null) {
            return null;
        }
        return Integer.toString(integer.intValue()) + " " + getFocalUnitsPerMillimetreDescription();
    }

    public final String getMacroModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_MACRO_MODE, 1, "Macro", "Normal");
    }

    public final String getManualFlashOutputDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_MANUAL_FLASH_OUTPUT);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1280 ? iIntValue != 1282 ? iIntValue != 1284 ? iIntValue != 32767 ? ho2.G("Unknown (", integer, ")") : "n/a" : "Low" : "Medium" : "Full" : "n/a";
    }

    public final String getMaxApertureDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_MAX_APERTURE);
        if (integer == null) {
            return null;
        }
        return integer.intValue() > 512 ? String.format("Unknown (%d)", integer) : TagDescriptor.getFStopDescription(Math.exp((Math.log(2.0d) * decodeCanonEv(integer.intValue())) / 2.0d));
    }

    public final String getMeteringModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_METERING_MODE, 3, "Evaluative", "Partial", "Centre weighted");
    }

    public final String getMinApertureDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_MIN_APERTURE);
        if (integer == null) {
            return null;
        }
        return integer.intValue() > 512 ? String.format("Unknown (%d)", integer) : TagDescriptor.getFStopDescription(Math.exp((Math.log(2.0d) * decodeCanonEv(integer.intValue())) / 2.0d));
    }

    public final String getPhotoEffectDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_PHOTO_EFFECT);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 100) {
            return "My Color Data";
        }
        switch (iIntValue) {
            case 0:
                return "Off";
            case 1:
                return "Vivid";
            case 2:
                return "Neutral";
            case 3:
                return "Smooth";
            case 4:
                return "Sepia";
            case 5:
                return "B&W";
            case 6:
                return "Custom";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    public final String getQualityDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_QUALITY);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != -1 ? iIntValue != 7 ? iIntValue != 130 ? iIntValue != 1131 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 4 ? iIntValue != 5 ? ho2.G("Unknown (", integer, ")") : "Superfine" : "RAW" : "Fine" : "Normal" : "Economy" : "Movie (2)" : "Normal Movie" : "CRAW" : "n/a";
    }

    public final String getRecordModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_RECORD_MODE, 1, "JPEG", "CRW+THM", "AVI+THM", "TIF", "TIF+JPEG", "CR2", "CR2+JPEG", null, "MOV", "MP4");
    }

    public final String getSRawQualityDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_SRAW_QUALITY, 0, "n/a", "sRAW1 (mRAW)", "sRAW2 (sRAW)");
    }

    public final String getSaturationDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SATURATION);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 65535 ? ho2.G("Unknown (", integer, ")") : "Low" : "High" : "Normal";
    }

    public final String getSelfTimerDelayDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SELF_TIMER_DELAY);
        if (integer == null) {
            return null;
        }
        if (integer.intValue() == 0) {
            return "Self timer not used";
        }
        return new DecimalFormat("0.##").format(((double) integer.intValue()) * 0.1d) + " sec";
    }

    public final String getSerialNumberDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(12);
        if (integer == null) {
            return null;
        }
        return String.format("%04X%05d", Integer.valueOf((integer.intValue() >> 8) & 255), Integer.valueOf(integer.intValue() & 255));
    }

    public final String getSharpnessDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SHARPNESS);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 65535 ? ho2.G("Unknown (", integer, ")") : "Low" : "High" : "Normal";
    }

    public final String getShortFocalLengthDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SHORT_FOCAL_LENGTH);
        if (integer == null) {
            return null;
        }
        return Integer.toString(integer.intValue()) + " " + getFocalUnitsPerMillimetreDescription();
    }

    public final String getSpotMeteringModeDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.CameraSettings.TAG_SPOT_METERING_MODE, 0, "Center", "AF Point");
    }

    public final String getTagAfPointsInFocus() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.AFInfo.TAG_AF_POINTS_IN_FOCUS);
        if (integer == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 16; i++) {
            if ((integer.intValue() & (1 << i)) != 0) {
                if (sb.length() != 0) {
                    sb.append(',');
                }
                sb.append(i);
            }
        }
        return sb.length() == 0 ? "None" : sb.toString();
    }

    public final String getWhiteBalanceDescription() {
        return getIndexedDescription(CanonMakernoteDirectory.FocalLength.TAG_WHITE_BALANCE, 0, "Auto", "Sunny", "Cloudy", "Tungsten", "Florescent", "Flash", "Custom");
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _lensTypeById = map;
        lv8.x(1, map, "Canon EF 50mm f/1.8", 2, "Canon EF 28mm f/2.8");
        lv8.x(3, map, "Canon EF 135mm f/2.8 Soft", 4, "Canon EF 35-105mm f/3.5-4.5 or Sigma Lens");
        lv8.x(5, map, "Canon EF 35-70mm f/3.5-4.5", 6, "Canon EF 28-70mm f/3.5-4.5 or Sigma or Tokina Lens");
        lv8.x(7, map, "Canon EF 100-300mm f/5.6L", 8, "Canon EF 100-300mm f/5.6 or Sigma or Tokina Lens");
        lv8.x(9, map, ezwlgQm.FbvmbDZBlqpCFM, 10, "Canon EF 50mm f/2.5 Macro or Sigma Lens");
        lv8.x(11, map, "Canon EF 35mm f/2", 13, "Canon EF 15mm f/2.8 Fisheye");
        lv8.x(14, map, "Canon EF 50-200mm f/3.5-4.5L", 15, "Canon EF 50-200mm f/3.5-4.5");
        lv8.x(16, map, "Canon EF 35-135mm f/3.5-4.5", 17, "Canon EF 35-70mm f/3.5-4.5A");
        lv8.x(18, map, "Canon EF 28-70mm f/3.5-4.5", 20, "Canon EF 100-200mm f/4.5A");
        lv8.x(21, map, "Canon EF 80-200mm f/2.8L", 22, "Canon EF 20-35mm f/2.8L or Tokina Lens");
        lv8.x(23, map, "Canon EF 35-105mm f/3.5-4.5", 24, "Canon EF 35-80mm f/4-5.6 Power Zoom");
        lv8.x(25, map, "Canon EF 35-80mm f/4-5.6 Power Zoom", 26, "Canon EF 100mm f/2.8 Macro or Other Lens");
        lv8.x(27, map, "Canon EF 35-80mm f/4-5.6", 28, "Canon EF 80-200mm f/4.5-5.6 or Tamron Lens");
        lv8.x(29, map, "Canon EF 50mm f/1.8 II", 30, "Canon EF 35-105mm f/4.5-5.6");
        lv8.x(31, map, "Canon EF 75-300mm f/4-5.6 or Tamron Lens", 32, "Canon EF 24mm f/2.8 or Sigma Lens");
        lv8.x(33, map, "Voigtlander or Carl Zeiss Lens", 35, "Canon EF 35-80mm f/4-5.6");
        lv8.x(36, map, "Canon EF 38-76mm f/4.5-5.6", 37, "Canon EF 35-80mm f/4-5.6 or Tamron Lens");
        lv8.x(38, map, "Canon EF 80-200mm f/4.5-5.6", 39, "Canon EF 75-300mm f/4-5.6");
        lv8.x(40, map, "Canon EF 28-80mm f/3.5-5.6", 41, "Canon EF 28-90mm f/4-5.6");
        lv8.x(42, map, "Canon EF 28-200mm f/3.5-5.6 or Tamron Lens", 43, "Canon EF 28-105mm f/4-5.6");
        lv8.x(44, map, "Canon EF 90-300mm f/4.5-5.6", 45, "Canon EF-S 18-55mm f/3.5-5.6 [II]");
        lv8.x(46, map, "Canon EF 28-90mm f/4-5.6", 47, "Zeiss Milvus 35mm f/2 or 50mm f/2");
        lv8.x(48, map, "Canon EF-S 18-55mm f/3.5-5.6 IS", 49, "Canon EF-S 55-250mm f/4-5.6 IS");
        lv8.x(50, map, "Canon EF-S 18-200mm f/3.5-5.6 IS", 51, "Canon EF-S 18-135mm f/3.5-5.6 IS");
        lv8.x(52, map, "Canon EF-S 18-55mm f/3.5-5.6 IS II", 53, "Canon EF-S 18-55mm f/3.5-5.6 III");
        lv8.x(54, map, "Canon EF-S 55-250mm f/4-5.6 IS II", 94, "Canon TS-E 17mm f/4L");
        lv8.x(95, map, "Canon TS-E 24.0mm f/3.5 L II", PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH, "Canon MP-E 65mm f/2.8 1-5x Macro Photo");
        lv8.x(125, map, "Canon TS-E 24mm f/3.5L", ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER, "Canon TS-E 45mm f/2.8");
        String str = mgKMENwrbHf.RuqxswJJywSQxV;
        lv8.x(127, map, "Canon TS-E 90mm f/2.8", 129, str);
        lv8.x(NikonType2MakernoteDirectory.TAG_ADAPTER, map, "Canon EF 50mm f/1.0L", 131, "Canon EF 28-80mm f/2.8-4L or Sigma Lens");
        lv8.x(NikonType2MakernoteDirectory.TAG_LENS, map, "Canon EF 1200mm f/5.6L", NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM, "Canon EF 600mm f/4L IS");
        lv8.x(NikonType2MakernoteDirectory.TAG_FLASH_USED, map, "Canon EF 200mm f/1.8L", 136, str);
        lv8.x(137, map, "Canon EF 85mm f/1.2L or Sigma or Tamron Lens", 138, "Canon EF 28-80mm f/2.8-4L");
        lv8.x(NikonType2MakernoteDirectory.TAG_LENS_STOPS, map, "Canon EF 400mm f/2.8L", 140, "Canon EF 500mm f/4.5L");
        lv8.x(141, map, "Canon EF 500mm f/4.5L", 142, "Canon EF 300mm f/2.8L IS");
        lv8.x(143, map, "Canon EF 500mm f/4L IS or Sigma Lens", 144, "Canon EF 35-135mm f/4-5.6 USM");
        lv8.x(145, map, "Canon EF 100-300mm f/4.5-5.6 USM", 146, "Canon EF 70-210mm f/3.5-4.5 USM");
        lv8.x(147, map, "Canon EF 35-135mm f/4-5.6 USM", 148, "Canon EF 28-80mm f/3.5-5.6 USM");
        lv8.x(149, map, "Canon EF 100mm f/2 USM", 150, "Canon EF 14mm f/2.8L or Sigma Lens");
        lv8.x(151, map, "Canon EF 200mm f/2.8L", 152, "Canon EF 300mm f/4L IS or Sigma Lens");
        lv8.x(153, map, "Canon EF 35-350mm f/3.5-5.6L or Sigma or Tamron Lens", 154, "Canon EF 20mm f/2.8 USM or Zeiss Lens");
        lv8.x(NikonType2MakernoteDirectory.TAG_UNKNOWN_10, map, "Canon EF 85mm f/1.8 USM", NikonType2MakernoteDirectory.TAG_SCENE_ASSIST, "Canon EF 28-105mm f/3.5-4.5 USM or Tamron Lens");
        lv8.x(160, map, "Canon EF 20-35mm f/3.5-4.5 USM or Tamron or Tokina Lens", CanonMakernoteDirectory.TAG_TONE_CURVE_TABLE, "Canon EF 28-70mm f/2.8L or Sigma or Tamron Lens");
        lv8.x(162, map, "Canon EF 200mm f/2.8L", 163, "Canon EF 300mm f/4L");
        lv8.x(164, map, "Canon EF 400mm f/5.6L", NikonType2MakernoteDirectory.TAG_IMAGE_COUNT, "Canon EF 70-200mm f/2.8 L");
        lv8.x(NikonType2MakernoteDirectory.TAG_DELETED_IMAGE_COUNT, map, "Canon EF 70-200mm f/2.8 L + 1.4x", NikonType2MakernoteDirectory.TAG_EXPOSURE_SEQUENCE_NUMBER, "Canon EF 70-200mm f/2.8 L + 2x");
        lv8.x(NikonType2MakernoteDirectory.TAG_FLASH_INFO, map, "Canon EF 28mm f/1.8 USM or Sigma Lens", 169, "Canon EF 17-35mm f/2.8L or Sigma Lens");
        lv8.x(170, map, "Canon EF 200mm f/2.8L II", 171, "Canon EF 300mm f/4L");
        lv8.x(NikonType2MakernoteDirectory.TAG_IMAGE_STABILISATION, map, "Canon EF 400mm f/5.6L or Sigma Lens", NikonType2MakernoteDirectory.TAG_AF_RESPONSE, "Canon EF 180mm Macro f/3.5L or Sigma Lens");
        lv8.x(174, map, "Canon EF 135mm f/2L or Other Lens", NikonType2MakernoteDirectory.TAG_UNKNOWN_30, "Canon EF 400mm f/2.8L");
        lv8.x(176, map, "Canon EF 24-85mm f/3.5-4.5 USM", 177, "Canon EF 300mm f/4L IS");
        lv8.x(178, map, "Canon EF 28-135mm f/3.5-5.6 IS", 179, "Canon EF 24mm f/1.4L");
        lv8.x(180, map, "Canon EF 35mm f/1.4L or Other Lens", NikonType2MakernoteDirectory.TAG_UNKNOWN_48, "Canon EF 100-400mm f/4.5-5.6L IS + 1.4x or Sigma Lens");
        lv8.x(182, map, "Canon EF 100-400mm f/4.5-5.6L IS + 2x or Sigma Lens", NikonType2MakernoteDirectory.TAG_AF_INFO_2, "Canon EF 100-400mm f/4.5-5.6L IS or Sigma Lens");
        lv8.x(NikonType2MakernoteDirectory.TAG_FILE_INFO, map, "Canon EF 400mm f/2.8L + 2x", NikonType2MakernoteDirectory.TAG_AF_TUNE, "Canon EF 600mm f/4L IS");
        lv8.x(186, map, "Canon EF 70-200mm f/4L", NikonType2MakernoteDirectory.TAG_RETOUCH_INFO, "Canon EF 70-200mm f/4L + 1.4x");
        lv8.x(188, map, "Canon EF 70-200mm f/4L + 2x", NikonType2MakernoteDirectory.TAG_PICTURE_CONTROL_2, "Canon EF 70-200mm f/4L + 2.8x");
        lv8.x(190, map, "Canon EF 100mm f/2.8 Macro USM", 191, "Canon EF 400mm f/4 DO IS");
        lv8.x(193, map, "Canon EF 35-80mm f/4-5.6 USM", 194, "Canon EF 80-200mm f/4.5-5.6 USM");
        lv8.x(195, map, "Canon EF 35-105mm f/4.5-5.6 USM", 196, "Canon EF 75-300mm f/4-5.6 USM");
        lv8.x(197, map, "Canon EF 75-300mm f/4-5.6 IS USM", 198, "Canon EF 50mm f/1.4 USM or Zeiss Lens");
        lv8.x(199, map, "Canon EF 28-80mm f/3.5-5.6 USM", 200, "Canon EF 75-300mm f/4-5.6 USM");
        lv8.x(Mp4VideoDirectory.TAG_VENDOR, map, "Canon EF 28-80mm f/3.5-5.6 USM", Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Canon EF 28-80mm f/3.5-5.6 USM IV");
        lv8.x(208, map, "Canon EF 22-55mm f/4-5.6 USM", Mp4VideoDirectory.TAG_DEPTH, "Canon EF 55-200mm f/4.5-5.6");
        lv8.x(Mp4VideoDirectory.TAG_COMPRESSION_TYPE, map, "Canon EF 28-90mm f/4-5.6 USM", Mp4VideoDirectory.TAG_GRAPHICS_MODE, "Canon EF 28-200mm f/3.5-5.6 USM");
        lv8.x(Mp4VideoDirectory.TAG_OPCOLOR, map, "Canon EF 28-105mm f/4-5.6 USM", Mp4VideoDirectory.TAG_COLOR_TABLE, "Canon EF 90-300mm f/4.5-5.6 USM or Tamron Lens");
        lv8.x(Mp4VideoDirectory.TAG_FRAME_RATE, map, "Canon EF-S 18-55mm f/3.5-5.6 USM", 215, "Canon EF 55-200mm f/4.5-5.6 II USM");
        lv8.x(217, map, "Tamron AF 18-270mm f/3.5-6.3 Di II VC PZD", CanonMakernoteDirectory.TAG_SENSOR_INFO_ARRAY, "Canon EF 70-200mm f/2.8L IS");
        lv8.x(225, map, "Canon EF 70-200mm f/2.8L IS + 1.4x", 226, "Canon EF 70-200mm f/2.8L IS + 2x");
        lv8.x(227, map, "Canon EF 70-200mm f/2.8L IS + 2.8x", 228, "Canon EF 28-105mm f/3.5-4.5 USM");
        lv8.x(229, map, "Canon EF 16-35mm f/2.8L", 230, "Canon EF 24-70mm f/2.8L");
        lv8.x(231, map, "Canon EF 17-40mm f/4L", 232, "Canon EF 70-300mm f/4.5-5.6 DO IS USM");
        lv8.x(233, map, "Canon EF 28-300mm f/3.5-5.6L IS", 234, "Canon EF-S 17-85mm f/4-5.6 IS USM or Tokina Lens");
        lv8.x(235, map, "Canon EF-S 10-22mm f/3.5-4.5 USM", 236, "Canon EF-S 60mm f/2.8 Macro USM");
        lv8.x(237, map, "Canon EF 24-105mm f/4L IS", 238, "Canon EF 70-300mm f/4-5.6 IS USM");
        lv8.x(239, map, "Canon EF 85mm f/1.2L II", 240, "Canon EF-S 17-55mm f/2.8 IS USM");
        lv8.x(241, map, "Canon EF 50mm f/1.2L", 242, "Canon EF 70-200mm f/4L IS");
        lv8.x(243, map, "Canon EF 70-200mm f/4L IS + 1.4x", 244, "Canon EF 70-200mm f/4L IS + 2x");
        lv8.x(245, map, "Canon EF 70-200mm f/4L IS + 2.8x", 246, "Canon EF 16-35mm f/2.8L II");
        lv8.x(247, map, "Canon EF 14mm f/2.8L II USM", 248, "Canon EF 200mm f/2L IS or Sigma Lens");
        lv8.x(249, map, "Canon EF 800mm f/5.6L IS", 250, "Canon EF 24mm f/1.4L II or Sigma Lens");
        lv8.x(251, map, "Canon EF 70-200mm f/2.8L IS II USM", 252, "Canon EF 70-200mm f/2.8L IS II USM + 1.4x");
        lv8.x(253, map, "Canon EF 70-200mm f/2.8L IS II USM + 2x", ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE, "Canon EF 100mm f/2.8L Macro IS USM");
        lv8.x(255, map, "Sigma 24-105mm f/4 DG OS HSM | A or Other Sigma Lens", 488, "Canon EF-S 15-85mm f/3.5-5.6 IS USM");
        lv8.x(489, map, "Canon EF 70-300mm f/4-5.6L IS USM", 490, "Canon EF 8-15mm f/4L Fisheye USM");
        lv8.x(491, map, "Canon EF 300mm f/2.8L IS II USM", 492, "Canon EF 400mm f/2.8L IS II USM");
        lv8.x(493, map, "Canon EF 500mm f/4L IS II USM or EF 24-105mm f4L IS USM", 494, "Canon EF 600mm f/4.0L IS II USM");
        lv8.x(495, map, "Canon EF 24-70mm f/2.8L II USM", 496, "Canon EF 200-400mm f/4L IS USM");
        lv8.x(499, map, "Canon EF 200-400mm f/4L IS USM + 1.4x", 502, "Canon EF 28mm f/2.8 IS USM");
        lv8.x(503, map, "Canon EF 24mm f/2.8 IS USM", 504, "Canon EF 24-70mm f/4L IS USM");
        lv8.x(505, map, "Canon EF 35mm f/2 IS USM", 506, "Canon EF 400mm f/4 DO IS II USM");
        lv8.x(507, map, "Canon EF 16-35mm f/4L IS USM", 508, "Canon EF 11-24mm f/4L USM");
        lv8.x(747, map, "Canon EF 100-400mm f/4.5-5.6L IS II USM", 750, "Canon EF 35mm f/1.4L II USM");
        lv8.x(OlympusMakernoteDirectory.TAG_OLYMPUS_IMAGE_WIDTH, map, "Canon EF-S 18-135mm f/3.5-5.6 IS STM", OlympusMakernoteDirectory.TAG_OLYMPUS_IMAGE_HEIGHT, "Canon EF-M 18-55mm f/3.5-5.6 IS STM or Tamron Lens");
        lv8.x(4144, map, "Canon EF 40mm f/2.8 STM", 4145, "Canon EF-M 22mm f/2 STM");
        lv8.x(4146, map, "Canon EF-S 18-55mm f/3.5-5.6 IS STM", 4147, "Canon EF-M 11-22mm f/4-5.6 IS STM");
        lv8.x(4148, map, "Canon EF-S 55-250mm f/4-5.6 IS STM", OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE_VALID, "Canon EF-M 55-200mm f/4.5-6.3 IS STM");
        lv8.x(OlympusMakernoteDirectory.TAG_PREVIEW_IMAGE_START, map, "Canon EF-S 10-18mm f/4.5-5.6 IS STM", OlympusMakernoteDirectory.TAG_AF_RESULT, "Canon EF 24-105mm f/3.5-5.6 IS STM");
        lv8.x(OlympusMakernoteDirectory.TAG_CCD_SCAN_MODE, map, "Canon EF-M 15-45mm f/3.5-6.3 IS STM", OlympusMakernoteDirectory.TAG_NOISE_REDUCTION, "Canon EF-S 24mm f/2.8 STM");
        lv8.x(OlympusMakernoteDirectory.TAG_NEAR_LENS_STEP, map, "Canon EF 50mm f/1.8 STM", 36912, "Canon EF-S 18-135mm f/3.5-5.6 IS USM");
        map.put(65535, "N/A");
    }

    public final String getContinuousDriveModeDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_CONTINUOUS_DRIVE_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            Integer integer2 = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_SELF_TIMER_DELAY);
            if (integer2 != null) {
                return integer2.intValue() == 0 ? "Single shot" : "Single shot with self-timer";
            }
        } else if (iIntValue != 1) {
            return ho2.G("Unknown (", integer, ")");
        }
        return eoLmc.RaNiDXlYhy;
    }

    public final String getFlashModeDescription() {
        Integer integer = ((CanonMakernoteDirectory) this._directory).getInteger(CanonMakernoteDirectory.CameraSettings.TAG_FLASH_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 16) {
            return "External flash";
        }
        switch (iIntValue) {
            case 0:
                return JWcjNoweKCnTr.kGsPIFXsI;
            case 1:
                return "Auto";
            case 2:
                return "On";
            case 3:
                return "Red-eye reduction";
            case 4:
                return "Slow-synchro";
            case 5:
                return "Auto and red-eye reduction";
            case 6:
                return "On and red-eye reduction";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }
}
