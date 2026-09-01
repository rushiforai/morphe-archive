package com.drew.metadata.exif.makernotes;

import androidx.work.impl.yX.VrhD;
import com.drew.metadata.TagDescriptor;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.iptc.IptcDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import com.medium.android.explore.ui.vAWg.OphtYB;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SonyType1MakernoteDescriptor extends TagDescriptor<SonyType1MakernoteDirectory> {
    public SonyType1MakernoteDescriptor(SonyType1MakernoteDirectory sonyType1MakernoteDirectory) {
        super(sonyType1MakernoteDirectory);
    }

    public final String getAFIlluminatorDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_AF_ILLUMINATOR);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 65535 ? ho2.G("Unknown (", integer, ")") : "n/a" : "Auto" : "Off";
    }

    public final String getAFModeDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_AF_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 4 ? iIntValue != 6 ? iIntValue != 65535 ? iIntValue != 14 ? iIntValue != 15 ? ho2.G("Unknown (", integer, ")") : "Face Detected" : "Manual Focus" : "n/a" : "Touch" : "Flexible Spot" : "Spot" : "Center" : "Multi" : "Default";
    }

    public final String getAFPointSelectedDescription() {
        return getIndexedDescription(SonyType1MakernoteDirectory.TAG_AF_POINT_SELECTED, 0, "Auto", "Center", "Top", "Upper-right", "Right", "Lower-right", "Bottom", "Lower-left", "Left", "Upper-left\t  \t", "Far Right", "Far Left", "Upper-middle", "Near Right", "Lower-middle", "Near Left", "Upper Far Right", "Lower Far Right", "Lower Far Left", "Upper Far Left");
    }

    public final String getAntiBlurDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_ANTI_BLUR);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 65535 ? String.format("Unknown (%d)", integer) : "N/A" : "On (Shooting)" : "On (Continuous)" : "Off";
    }

    public final String getAutoPortraitFramedDescription() {
        return getIndexedDescription(SonyType1MakernoteDirectory.TAG_AUTO_PORTRAIT_FRAMED, 0, "No", "Yes");
    }

    public final String getColorTemperatureDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_COLOR_TEMPERATURE);
        if (integer == null) {
            return null;
        }
        return integer.intValue() == 0 ? "Auto" : String.format("%d K", Integer.valueOf(((integer.intValue() & (-16777216)) >> 24) | ((integer.intValue() & 16711680) >> 8)));
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        switch (i) {
            case 258:
                return getImageQualityDescription();
            case 260:
                return getFlashExposureCompensationDescription();
            case 261:
                return getTeleconverterDescription();
            case 277:
                return getWhiteBalanceDescription();
            case SonyType1MakernoteDirectory.TAG_HIGH_ISO_NOISE_REDUCTION /* 8201 */:
                return getHighIsoNoiseReductionDescription();
            case SonyType1MakernoteDirectory.TAG_PICTURE_EFFECT /* 8206 */:
                return getPictureEffectDescription();
            case SonyType1MakernoteDirectory.TAG_SOFT_SKIN_EFFECT /* 8207 */:
                return getSoftSkinEffectDescription();
            case 8209:
                return getVignettingCorrectionDescription();
            case 8210:
                return getLateralChromaticAberrationDescription();
            case SonyType1MakernoteDirectory.TAG_DISTORTION_CORRECTION /* 8211 */:
                return getDistortionCorrectionDescription();
            case SonyType1MakernoteDirectory.TAG_AUTO_PORTRAIT_FRAMED /* 8214 */:
                return getAutoPortraitFramedDescription();
            case SonyType1MakernoteDirectory.TAG_FOCUS_MODE /* 8219 */:
                return getFocusModeDescription();
            case SonyType1MakernoteDirectory.TAG_AF_POINT_SELECTED /* 8222 */:
                return getAFPointSelectedDescription();
            case SonyType1MakernoteDirectory.TAG_SONY_MODEL_ID /* 45057 */:
                return getSonyModelIdDescription();
            case SonyType1MakernoteDirectory.TAG_COLOR_TEMPERATURE /* 45089 */:
                return getColorTemperatureDescription();
            case SonyType1MakernoteDirectory.TAG_SCENE_MODE /* 45091 */:
                return getSceneModeDescription();
            case SonyType1MakernoteDirectory.TAG_ZONE_MATCHING /* 45092 */:
                return getZoneMatchingDescription();
            case SonyType1MakernoteDirectory.TAG_DYNAMIC_RANGE_OPTIMISER /* 45093 */:
                return getDynamicRangeOptimizerDescription();
            case SonyType1MakernoteDirectory.TAG_IMAGE_STABILISATION /* 45094 */:
                return getImageStabilizationDescription();
            case SonyType1MakernoteDirectory.TAG_COLOR_MODE /* 45097 */:
                return getColorModeDescription();
            case SonyType1MakernoteDirectory.TAG_MACRO /* 45120 */:
                return getMacroDescription();
            case SonyType1MakernoteDirectory.TAG_EXPOSURE_MODE /* 45121 */:
                return getExposureModeDescription();
            case SonyType1MakernoteDirectory.TAG_AF_MODE /* 45123 */:
                return getAFModeDescription();
            case SonyType1MakernoteDirectory.TAG_AF_ILLUMINATOR /* 45124 */:
                return getAFIlluminatorDescription();
            case SonyType1MakernoteDirectory.TAG_JPEG_QUALITY /* 45127 */:
                return getJpegQualityDescription();
            case SonyType1MakernoteDirectory.TAG_FLASH_LEVEL /* 45128 */:
                return getFlashLevelDescription();
            case SonyType1MakernoteDirectory.TAG_RELEASE_MODE /* 45129 */:
                return getReleaseModeDescription();
            case SonyType1MakernoteDirectory.TAG_SEQUENCE_NUMBER /* 45130 */:
                return getSequenceNumberDescription();
            case SonyType1MakernoteDirectory.TAG_ANTI_BLUR /* 45131 */:
                return getAntiBlurDescription();
            case SonyType1MakernoteDirectory.TAG_LONG_EXPOSURE_NOISE_REDUCTION_OR_FOCUS_MODE /* 45134 */:
                return getLongExposureNoiseReductionDescription();
            default:
                return super.getDescription(i);
        }
    }

    public final String getDynamicRangeOptimizerDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_DYNAMIC_RANGE_OPTIMISER);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Off";
        }
        if (iIntValue == 1) {
            return "Standard";
        }
        if (iIntValue == 2) {
            return "Advanced Auto";
        }
        if (iIntValue == 3) {
            return "Auto";
        }
        switch (iIntValue) {
            case 8:
                return "Advanced LV1";
            case 9:
                return "Advanced LV2";
            case 10:
                return "Advanced LV3";
            case 11:
                return "Advanced LV4";
            case 12:
                return "Advanced LV5";
            default:
                switch (iIntValue) {
                    case 16:
                        return "LV1";
                    case 17:
                        return "LV2";
                    case 18:
                        return "LV3";
                    case 19:
                        return "LV4";
                    case 20:
                        return "LV5";
                    default:
                        return String.format("Unknown (%d)", integer);
                }
        }
    }

    public final String getExposureModeDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_EXPOSURE_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 29) {
            return "Underwater";
        }
        if (iIntValue == 65535) {
            return "N/A";
        }
        switch (iIntValue) {
            case 0:
                return "Program";
            case 1:
                return "Portrait";
            case 2:
                return "Beach";
            case 3:
                return "Sports";
            case 4:
                return "Snow";
            case 5:
                return "Landscape";
            case 6:
                return "Auto";
            case 7:
                return "Aperture Priority";
            case 8:
                return "Shutter Priority";
            case 9:
                return "Night Scene / Twilight";
            case 10:
                return "Hi-Speed Shutter";
            case 11:
                return "Twilight Portrait";
            case 12:
                return "Soft Snap/Portrait";
            case 13:
                return "Fireworks";
            case 14:
                return "Smile Shutter";
            case 15:
                return "Manual";
            default:
                switch (iIntValue) {
                    case 18:
                        return "High Sensitivity";
                    case 19:
                        return "Macro";
                    case 20:
                        return "Advanced Sports Shooting";
                    default:
                        switch (iIntValue) {
                            case 33:
                                return "Food";
                            case 34:
                                return "Panorama";
                            case 35:
                                return "Handheld Night Shot";
                            case 36:
                                return "Anti Motion Blur";
                            case 37:
                                return "Pet";
                            case 38:
                                return "Backlight Correction HDR";
                            case 39:
                                return "Superior Auto";
                            case 40:
                                return "Background Defocus";
                            case 41:
                                return "Soft Skin";
                            case 42:
                                return "3D Image";
                            default:
                                return String.format("Unknown (%d)", integer);
                        }
                }
        }
    }

    public final String getFlashExposureCompensationDescription() {
        return getFormattedInt(260, "%d EV");
    }

    public final String getFlashLevelDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_FLASH_LEVEL);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == -32768) {
            return "Low";
        }
        if (iIntValue == 128) {
            return "n/a";
        }
        if (iIntValue == 32767) {
            return "High";
        }
        switch (iIntValue) {
            case -3:
                return "-3/3";
            case -2:
                return "-2/3";
            case -1:
                return "-1/3";
            case 0:
                return "Normal";
            case 1:
                return "+1/3";
            case 2:
                return "+2/3";
            case 3:
                return "+3/3";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    public final String getFocusModeDescription() {
        return getIndexedDescription(SonyType1MakernoteDirectory.TAG_FOCUS_MODE, 0, "Manual", null, "AF-A", "AF-C", "AF-S", null, "DMF", "AF-D");
    }

    public final String getHighIsoNoiseReductionDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_HIGH_ISO_NOISE_REDUCTION);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 256 ? iIntValue != 65535 ? String.format("Unknown (%d)", integer) : "N/A" : "Auto" : "High" : "Normal" : "On" : "Off";
    }

    public final String getImageQualityDescription() {
        return getIndexedDescription(258, 0, "RAW", "Super Fine", "Fine", "Standard", "Economy", "Extra Fine", "RAW + JPEG", "Compressed RAW", "Compressed RAW + JPEG");
    }

    public final String getImageStabilizationDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_IMAGE_STABILISATION);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? "N/A" : "On" : "Off";
    }

    public final String getJpegQualityDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_JPEG_QUALITY);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 65535 ? String.format("Unknown (%d)", integer) : "N/A" : "Extra Fine" : "Fine" : "Normal";
    }

    public final String getLateralChromaticAberrationDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(8210);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != -1 ? iIntValue != 0 ? iIntValue != 2 ? String.format("Unknown (%d)", integer) : "Auto" : "Off" : "N/A";
    }

    public final String getLongExposureNoiseReductionDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_LONG_EXPOSURE_NOISE_REDUCTION_OR_FOCUS_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 65535 ? String.format("Unknown (%d)", integer) : "N/A" : "On" : "Off";
    }

    public final String getMacroDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_MACRO);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 2 ? iIntValue != 65535 ? String.format("Unknown (%d)", integer) : "N/A" : "Magnifying Glass/Super Macro" : "On" : "Off";
    }

    public final String getReleaseModeDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_RELEASE_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 2 ? iIntValue != 65535 ? iIntValue != 5 ? iIntValue != 6 ? ho2.G("Unknown (", integer, ")") : "White Balance Bracketing" : "Exposure Bracketing" : "n/a" : "Continuous" : "Normal";
    }

    public final String getSequenceNumberDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_SEQUENCE_NUMBER);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 65535 ? integer.toString() : "n/a" : "Single";
    }

    public final String getSoftSkinEffectDescription() {
        return getIndexedDescription(SonyType1MakernoteDirectory.TAG_SOFT_SKIN_EFFECT, 0, "Off", "Low", "Mid", "High");
    }

    public final String getSonyModelIdDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_SONY_MODEL_ID);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 269) {
            return "DSLR-A850";
        }
        if (iIntValue == 270) {
            return "DSLR-A850 (APS-C mode)";
        }
        if (iIntValue == 302) {
            return "ILCE - 3000 / ILCE - 3500";
        }
        if (iIntValue == 303) {
            return "SLT - A58";
        }
        if (iIntValue == 346) {
            return "ILCE-QX1";
        }
        if (iIntValue == 347) {
            return "ILCE-7RM2";
        }
        switch (iIntValue) {
            case 2:
                return "DSC-R1";
            case 278:
                return "NEX-5";
            case 279:
                return "NEX-3";
            case 280:
                return "SLT-A33";
            case 281:
                return "SLT-A55V";
            case 282:
                return "DSLR-A560";
            case 283:
                return "DSLR-A580";
            case 284:
                return "NEX-C3";
            case 285:
                return "SLT-A35";
            case 286:
                return "SLT-A65V";
            case OlympusImageProcessingMakernoteDirectory.TagWbGLevel /* 287 */:
                return "SLT-A77V";
            case 288:
                return "NEX-5N";
            case 289:
                return "NEX-7";
            case OlympusRawInfoMakernoteDirectory.TagWbRbLevelsFineWeather /* 290 */:
                return "NEX-VG20E";
            case 291:
                return "SLT-A37";
            case OlympusRawInfoMakernoteDirectory.TagWbRbLevelsEveningSunlight /* 292 */:
                return "SLT-A57";
            case 293:
                return "NEX-F3";
            case 294:
                return "SLT-A99V";
            case 295:
                return "NEX-6";
            case 296:
                return "NEX-5R";
            case ExifDirectoryBase.TAG_PAGE_NUMBER /* 297 */:
                return "DSC-RX100";
            case 298:
                return "DSC-RX1";
            case 299:
                return "NEX - VG900";
            case 300:
                return "NEX - VG30E";
            case 344:
                return "DSC-RX1RM2";
            case 350:
                return "ILCE-7SM2";
            case 360:
                return "ILCE-6500";
            case 362:
                return "ILCE-7RM3";
            case 363:
                return "ILCE-7M3";
            case 364:
                return "DSC-RX0";
            case 365:
                return "DSC-RX10M4";
            case 366:
                return "DSC-RX100M6";
            case 367:
                return "DSC-HX99";
            case 369:
                return "DSC-RX100M5A";
            case 371:
                return "ILCE-6400";
            case 372:
                return "DSC-RX0M2";
            case 374:
                return "DSC-RX100M7";
            case 375:
                return "ILCE-7RM4";
            case IptcDirectory.TAG_ARM_IDENTIFIER /* 376 */:
                return "ILCE-9M2";
            case IptcDirectory.TAG_ARM_VERSION /* 378 */:
                return "ILCE-6600";
            case 379:
                return "ILCE-6100";
            case 380:
                return "ZV-1";
            case 381:
                return "ILCE-7C";
            case 383:
                return "ILCE-7SM3";
            default:
                switch (iIntValue) {
                    case 256:
                        return "DSLR-A100";
                    case 257:
                        return "DSLR-A900";
                    case 258:
                        return "DSLR-A700";
                    case 259:
                        return "DSLR-A200";
                    case 260:
                        return "DSLR-A350";
                    case 261:
                        return "DSLR-A300";
                    case 262:
                        return "DSLR-A900 (APS-C mode)";
                    case 263:
                        return "DSLR-A380/A390";
                    case 264:
                        return "DSLR-A330";
                    case 265:
                        return "DSLR-A230";
                    case 266:
                        return "DSLR-A290";
                    default:
                        switch (iIntValue) {
                            case 273:
                                return "DSLR-A550";
                            case 274:
                                return "DSLR-A500";
                            case 275:
                                return "DSLR-A450";
                            default:
                                switch (iIntValue) {
                                    case 305:
                                        return "NEX - 3N";
                                    case 306:
                                        return "ILCE-7";
                                    case OlympusRawInfoMakernoteDirectory.TagWbRbLevelsWhiteFluorescent /* 307 */:
                                        return "NEX-5T";
                                    case 308:
                                        return "DSC-RX100M2";
                                    case 309:
                                        return "DSC-RX10";
                                    case 310:
                                        return "DSC-RX1R";
                                    case 311:
                                        return "ILCE-7R";
                                    case 312:
                                        return "ILCE-6000";
                                    case 313:
                                        return "ILCE-5000";
                                    default:
                                        switch (iIntValue) {
                                            case ExifDirectoryBase.TAG_PREDICTOR /* 317 */:
                                                return "DSC-RX100M3";
                                            case ExifDirectoryBase.TAG_WHITE_POINT /* 318 */:
                                                return "ILCE-7S";
                                            case ExifDirectoryBase.TAG_PRIMARY_CHROMATICITIES /* 319 */:
                                                return "ILCA-77M2";
                                            default:
                                                switch (iIntValue) {
                                                    case ExifDirectoryBase.TAG_SAMPLE_FORMAT /* 339 */:
                                                        return "ILCE-5100";
                                                    case 340:
                                                        return "ILCE-7M2";
                                                    case 341:
                                                        return "DSC-RX100M4";
                                                    case ExifDirectoryBase.TAG_TRANSFER_RANGE /* 342 */:
                                                        return "DSC-RX10M2";
                                                    default:
                                                        switch (iIntValue) {
                                                            case 353:
                                                                return "ILCA-68";
                                                            case 354:
                                                                return "ILCA-99M2";
                                                            case 355:
                                                                return "DSC-RX10M3";
                                                            case IptcDirectory.TAG_UNIQUE_OBJECT_NAME /* 356 */:
                                                                return "DSC-RX100M5";
                                                            case 357:
                                                                return "ILCE-6300";
                                                            case 358:
                                                                return "ILCE-9";
                                                            default:
                                                                return ho2.G("Unknown (", integer, ")");
                                                        }
                                                }
                                        }
                                }
                        }
                }
        }
    }

    public final String getTeleconverterDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(261);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 72 ? iIntValue != 80 ? iIntValue != 96 ? iIntValue != 136 ? iIntValue != 144 ? iIntValue != 160 ? ho2.G("Unknown (", integer, ")") : "Minolta AF 1.4x APO" : "Minolta AF 1.4x APO II" : "Minolta/Sony AF 1.4x APO (D)" : "Minolta AF 2x APO" : "Minolta AF 2x APO II" : "Minolta/Sony AF 2x APO (D)" : "None";
    }

    public final String getVignettingCorrectionDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(8209);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != -1 ? iIntValue != 0 ? iIntValue != 2 ? String.format("Unknown (%d)", integer) : "Auto" : "Off" : "N/A";
    }

    public final String getWhiteBalanceDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(277);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 16 ? iIntValue != 32 ? iIntValue != 48 ? iIntValue != 64 ? iIntValue != 80 ? iIntValue != 96 ? iIntValue != 112 ? ho2.G("Unknown (", integer, ")") : "Custom" : "Fluorescent" : "Flash" : "Tungsten" : "Shade" : "Cloudy" : "Daylight" : "Color Temperature/Color Filter" : "Auto";
    }

    public final String getZoneMatchingDescription() {
        return getIndexedDescription(SonyType1MakernoteDirectory.TAG_ZONE_MATCHING, 0, "ISO Setting Used", "High Key", "Low Key");
    }

    public final String getColorModeDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_COLOR_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        switch (iIntValue) {
            case 0:
                return "Standard";
            case 1:
                return "Vivid";
            case 2:
                return "Portrait";
            case 3:
                return "Landscape";
            case 4:
                return "Sunset";
            case 5:
                return "Night Portrait";
            case 6:
                return "Black & White";
            case 7:
                return "Adobe RGB";
            default:
                switch (iIntValue) {
                    case 12:
                        break;
                    case 13:
                        return "Clear";
                    case 14:
                        return "Deep";
                    case 15:
                        return "Light";
                    case 16:
                        return "Autumn";
                    case 17:
                        return "Sepia";
                    default:
                        switch (iIntValue) {
                            case 100:
                                break;
                            case 101:
                                return "Clear";
                            case 102:
                                return "Deep";
                            case 103:
                                return "Light";
                            case 104:
                                return "Night View";
                            case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                                return "Autumn Leaves";
                            default:
                                return String.format("Unknown (%d)", integer);
                        }
                        break;
                }
                return MaAxRJinch.zSCk;
        }
    }

    public final String getDistortionCorrectionDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_DISTORTION_CORRECTION);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != -1 ? iIntValue != 0 ? iIntValue != 2 ? String.format("Unknown (%d)", integer) : "Auto" : OphtYB.TSuvLlVEJQQmhIW : "N/A";
    }

    public final String getPictureEffectDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_PICTURE_EFFECT);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 13) {
            return "High Contrast Monochrome";
        }
        if (iIntValue == 80) {
            return "Rich-tone Monochrome";
        }
        if (iIntValue == 97) {
            return "Water Color";
        }
        if (iIntValue == 98) {
            return "Water Color 2";
        }
        switch (iIntValue) {
            case 0:
                return "Off";
            case 1:
                return KLTXZbnQvj.zlDRNz;
            case 2:
                return "Pop Color";
            case 3:
                return "Posterization";
            case 4:
                return "Posterization B/W";
            case 5:
                return "Retro Photo";
            case 6:
                return "Soft High Key";
            case 7:
                return "Partial Color (red)";
            case 8:
                return "Partial Color (green)";
            case 9:
                return "Partial Color (blue)";
            case 10:
                return "Partial Color (yellow)";
            default:
                switch (iIntValue) {
                    case 16:
                        return "Toy Camera (normal)";
                    case 17:
                        return "Toy Camera (cool)";
                    case 18:
                        return "Toy Camera (warm)";
                    case 19:
                        return "Toy Camera (green)";
                    case 20:
                        return "Toy Camera (magenta)";
                    default:
                        switch (iIntValue) {
                            case 32:
                                return "Soft Focus (low)";
                            case 33:
                                return "Soft Focus";
                            case 34:
                                return "Soft Focus (high)";
                            default:
                                switch (iIntValue) {
                                    case 48:
                                        return "Miniature (auto)";
                                    case 49:
                                        return "Miniature (top)";
                                    case 50:
                                        return "Miniature (middle horizontal)";
                                    case 51:
                                        return "Miniature (bottom)";
                                    case 52:
                                        return "Miniature (left)";
                                    case 53:
                                        return "Miniature (middle vertical)";
                                    case 54:
                                        return "Miniature (right)";
                                    default:
                                        switch (iIntValue) {
                                            case 64:
                                                return "HDR Painting (low)";
                                            case 65:
                                                return "HDR Painting";
                                            case 66:
                                                return "HDR Painting (high)";
                                            default:
                                                switch (iIntValue) {
                                                    case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                                                        return "Illustration (low)";
                                                    case 113:
                                                        return "Illustration";
                                                    case 114:
                                                        return "Illustration (high)";
                                                    default:
                                                        return String.format("Unknown (%d)", integer);
                                                }
                                        }
                                }
                        }
                }
        }
    }

    public final String getSceneModeDescription() {
        Integer integer = ((SonyType1MakernoteDirectory) this._directory).getInteger(SonyType1MakernoteDirectory.TAG_SCENE_MODE);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        switch (iIntValue) {
            case 0:
                return "Standard";
            case 1:
                return "Portrait";
            case 2:
                return "Text";
            case 3:
                return "Night Scene";
            case 4:
                return "Sunset";
            case 5:
                return VrhD.FlaNUxKhzgcCJzW;
            case 6:
                return "Landscape";
            case 7:
                return "Night Portrait";
            case 8:
                return "Macro";
            case 9:
                return "Super Macro";
            default:
                switch (iIntValue) {
                    case 16:
                        return "Auto";
                    case 17:
                        return "Night View/Portrait";
                    case 18:
                        return "Sweep Panorama";
                    case 19:
                        return "Handheld Night Shot";
                    case 20:
                        return "Anti Motion Blur";
                    case 21:
                        return "Cont. Priority AE";
                    case 22:
                        return "Auto+";
                    case 23:
                        return "3D Sweep Panorama";
                    case 24:
                        return "Superior Auto";
                    case 25:
                        return "High Sensitivity";
                    case 26:
                        return "Fireworks";
                    case 27:
                        return "Food";
                    case 28:
                        return "Pet";
                    default:
                        return ho2.G("Unknown (", integer, ")");
                }
        }
    }
}
