package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CasioType2MakernoteDescriptor extends TagDescriptor<CasioType2MakernoteDirectory> {
    public CasioType2MakernoteDescriptor(CasioType2MakernoteDirectory casioType2MakernoteDirectory) {
        super(casioType2MakernoteDirectory);
    }

    public final String getCasioPreviewThumbnailDescription() {
        byte[] byteArray = ((CasioType2MakernoteDirectory) this._directory).getByteArray(8192);
        if (byteArray == null) {
            return null;
        }
        return ho2.H(new StringBuilder("<"), byteArray.length, " bytes of image data>");
    }

    public final String getCcdIsoSensitivityDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_CCD_ISO_SENSITIVITY, 0, "Off", "On");
    }

    public final String getColourModeDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_COLOUR_MODE, 0, "Off");
    }

    public final String getContrastDescription() {
        return getIndexedDescription(32, 0, "-1", "Normal", "+1");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 2) {
            return getThumbnailDimensionsDescription();
        }
        if (i == 3) {
            return getThumbnailSizeDescription();
        }
        if (i == 4) {
            return getThumbnailOffsetDescription();
        }
        if (i == 8) {
            return getQualityModeDescription();
        }
        if (i == 9) {
            return getImageSizeDescription();
        }
        if (i == 13) {
            return getFocusMode1Description();
        }
        if (i == 20) {
            return getIsoSensitivityDescription();
        }
        if (i == 25) {
            return getWhiteBalance1Description();
        }
        if (i == 29) {
            return getFocalLengthDescription();
        }
        if (i == 8192) {
            return getCasioPreviewThumbnailDescription();
        }
        if (i == 8226) {
            return getObjectDistanceDescription();
        }
        if (i == 8244) {
            return getFlashDistanceDescription();
        }
        if (i == 12294) {
            return getTimeZoneDescription();
        }
        if (i == 8209) {
            return getWhiteBalanceBiasDescription();
        }
        if (i == 8210) {
            return getWhiteBalance2Description();
        }
        switch (i) {
            case 31:
                return getSaturationDescription();
            case 32:
                return getContrastDescription();
            case 33:
                return getSharpnessDescription();
            default:
                switch (i) {
                    case 12288:
                        return getRecordModeDescription();
                    case CasioType2MakernoteDirectory.TAG_SELF_TIMER /* 12289 */:
                        return getSelfTimerDescription();
                    case CasioType2MakernoteDirectory.TAG_QUALITY /* 12290 */:
                        return getQualityDescription();
                    case CasioType2MakernoteDirectory.TAG_FOCUS_MODE_2 /* 12291 */:
                        return getFocusMode2Description();
                    default:
                        switch (i) {
                            case CasioType2MakernoteDirectory.TAG_CCD_ISO_SENSITIVITY /* 12308 */:
                                return getCcdIsoSensitivityDescription();
                            case CasioType2MakernoteDirectory.TAG_COLOUR_MODE /* 12309 */:
                                return getColourModeDescription();
                            case CasioType2MakernoteDirectory.TAG_ENHANCEMENT /* 12310 */:
                                return getEnhancementDescription();
                            case CasioType2MakernoteDirectory.TAG_FILTER /* 12311 */:
                                return getFilterDescription();
                            default:
                                return super.getDescription(i);
                        }
                }
        }
    }

    public final String getEnhancementDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_ENHANCEMENT, 0, "Off");
    }

    public final String getFilterDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_FILTER, 0, "Off");
    }

    public final String getFlashDistanceDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_FLASH_DISTANCE, 0, "Off");
    }

    public final String getFocalLengthDescription() {
        Double doubleObject = ((CasioType2MakernoteDirectory) this._directory).getDoubleObject(29);
        if (doubleObject == null) {
            return null;
        }
        return TagDescriptor.getFocalLengthDescription(doubleObject.doubleValue() / 10.0d);
    }

    public final String getFocusMode1Description() {
        return getIndexedDescription(13, 0, "Normal", "Macro");
    }

    public final String getFocusMode2Description() {
        Integer integer = ((CasioType2MakernoteDirectory) this._directory).getInteger(CasioType2MakernoteDirectory.TAG_FOCUS_MODE_2);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 1 ? iIntValue != 6 ? ho2.G("Unknown (", integer, ")") : "Multi-Area Focus" : "Fixation";
    }

    public final String getImageSizeDescription() {
        Integer integer = ((CasioType2MakernoteDirectory) this._directory).getInteger(9);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "640 x 480 pixels";
        }
        if (iIntValue == 36) {
            return "3008 x 2008 pixels";
        }
        if (iIntValue == 4) {
            return "1600 x 1200 pixels";
        }
        if (iIntValue == 5) {
            return "2048 x 1536 pixels";
        }
        switch (iIntValue) {
            case 20:
                return "2288 x 1712 pixels";
            case 21:
                return "2592 x 1944 pixels";
            case 22:
                return "2304 x 1728 pixels";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    public final String getIsoSensitivityDescription() {
        Integer integer = ((CasioType2MakernoteDirectory) this._directory).getInteger(20);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 3 ? iIntValue != 4 ? iIntValue != 6 ? iIntValue != 9 ? ho2.G("Unknown (", integer, ")") : "200" : "100" : "64" : "50";
    }

    public final String getObjectDistanceDescription() {
        Integer integer = ((CasioType2MakernoteDirectory) this._directory).getInteger(8226);
        if (integer == null) {
            return null;
        }
        return Integer.toString(integer.intValue()) + " mm";
    }

    public final String getQualityDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_QUALITY, 3, "Fine");
    }

    public final String getQualityModeDescription() {
        return getIndexedDescription(8, 1, "Fine", "Super Fine");
    }

    public final String getRecordModeDescription() {
        return getIndexedDescription(12288, 2, "Normal");
    }

    public final String getSaturationDescription() {
        return getIndexedDescription(31, 0, "-1", "Normal", "+1");
    }

    public final String getSelfTimerDescription() {
        return getIndexedDescription(CasioType2MakernoteDirectory.TAG_SELF_TIMER, 1, "Off");
    }

    public final String getSharpnessDescription() {
        return getIndexedDescription(33, 0, "-1", "Normal", "+1");
    }

    public final String getThumbnailDimensionsDescription() {
        int[] intArray = ((CasioType2MakernoteDirectory) this._directory).getIntArray(2);
        if (intArray == null || intArray.length != 2) {
            return ((CasioType2MakernoteDirectory) this._directory).getString(2);
        }
        StringBuilder sb = new StringBuilder();
        sb.append(intArray[0]);
        sb.append(" x ");
        return ho2.H(sb, intArray[1], " pixels");
    }

    public final String getThumbnailOffsetDescription() {
        return ((CasioType2MakernoteDirectory) this._directory).getString(4);
    }

    public final String getThumbnailSizeDescription() {
        Integer integer = ((CasioType2MakernoteDirectory) this._directory).getInteger(3);
        if (integer == null) {
            return null;
        }
        return Integer.toString(integer.intValue()) + " bytes";
    }

    public final String getTimeZoneDescription() {
        return ((CasioType2MakernoteDirectory) this._directory).getString(CasioType2MakernoteDirectory.TAG_TIME_ZONE);
    }

    public final String getWhiteBalance1Description() {
        return getIndexedDescription(25, 0, "Auto", "Daylight", "Shade", "Tungsten", "Florescent", "Manual");
    }

    public final String getWhiteBalance2Description() {
        Integer integer = ((CasioType2MakernoteDirectory) this._directory).getInteger(8210);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? (iIntValue == 4 || iIntValue == 12) ? "Flash" : ho2.G("Unknown (", integer, ")") : "Auto" : "Manual";
    }

    public final String getWhiteBalanceBiasDescription() {
        return ((CasioType2MakernoteDirectory) this._directory).getString(8209);
    }
}
