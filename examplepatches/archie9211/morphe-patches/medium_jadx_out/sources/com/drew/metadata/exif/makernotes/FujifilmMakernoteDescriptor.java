package com.drew.metadata.exif.makernotes;

import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.lang.Rational;
import com.drew.metadata.TagDescriptor;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.ho2;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class FujifilmMakernoteDescriptor extends TagDescriptor<FujifilmMakernoteDirectory> {
    public FujifilmMakernoteDescriptor(FujifilmMakernoteDirectory fujifilmMakernoteDirectory) {
        super(fujifilmMakernoteDirectory);
    }

    public final String getAutoBracketingDescription() {
        return getIndexedDescription(FujifilmMakernoteDirectory.TAG_AUTO_BRACKETING, 0, "Off", "On", "No Flash & Flash");
    }

    public final String getAutoExposureWarningDescription() {
        return getIndexedDescription(FujifilmMakernoteDirectory.TAG_AUTO_EXPOSURE_WARNING, 0, "AE Good", "Over Exposed");
    }

    public final String getBlurWarningDescription() {
        return getIndexedDescription(FujifilmMakernoteDirectory.TAG_BLUR_WARNING, 0, "No Blur Warning", "Blur warning");
    }

    public final String getColorSaturationDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4099);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Normal";
        }
        if (iIntValue == 128) {
            return "Medium High";
        }
        if (iIntValue == 256) {
            return "High";
        }
        if (iIntValue == 384) {
            return "Medium Low";
        }
        if (iIntValue == 512) {
            return "Low";
        }
        if (iIntValue == 32768) {
            return "Film Simulation";
        }
        switch (iIntValue) {
            case 768:
                return "None (B&W)";
            case 769:
                return "B&W Green Filter";
            case 770:
                return "B&W Yellow Filter";
            case 771:
                return "B&W Blue Filter";
            case 772:
                return "B&W Sepia";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    public final String getContrastDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4102);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 256 ? iIntValue != 768 ? ho2.G("Unknown (", integer, ")") : "Low" : "High" : "Normal";
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 0) {
            return getVersionBytesDescription(0, 2);
        }
        if (i == 4102) {
            return getContrastDescription();
        }
        if (i == 4107) {
            return getNoiseReductionDescription();
        }
        if (i == 4110) {
            return getHighIsoNoiseReductionDescription();
        }
        if (i == 4352) {
            return getAutoBracketingDescription();
        }
        if (i == 4624) {
            return getFinePixColorDescription();
        }
        if (i == 4112) {
            return getFlashModeDescription();
        }
        if (i == 4113) {
            return getFlashExposureValueDescription();
        }
        if (i == 4128) {
            return getMacroDescription();
        }
        if (i == 4129) {
            return getFocusModeDescription();
        }
        if (i == 4144) {
            return getSlowSyncDescription();
        }
        if (i == 4145) {
            return getPictureModeDescription();
        }
        if (i == 4147) {
            return getExrAutoDescription();
        }
        if (i == 4148) {
            return getExrModeDescription();
        }
        switch (i) {
            case 4097:
                return getSharpnessDescription();
            case 4098:
                return getWhiteBalanceDescription();
            case 4099:
                return getColorSaturationDescription();
            case 4100:
                return getToneDescription();
            default:
                switch (i) {
                    case FujifilmMakernoteDirectory.TAG_BLUR_WARNING /* 4864 */:
                        return getBlurWarningDescription();
                    case FujifilmMakernoteDirectory.TAG_FOCUS_WARNING /* 4865 */:
                        return getFocusWarningDescription();
                    case FujifilmMakernoteDirectory.TAG_AUTO_EXPOSURE_WARNING /* 4866 */:
                        return getAutoExposureWarningDescription();
                    default:
                        switch (i) {
                            case FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE /* 5120 */:
                                return getDynamicRangeDescription();
                            case FujifilmMakernoteDirectory.TAG_FILM_MODE /* 5121 */:
                                return getFilmModeDescription();
                            case FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE_SETTING /* 5122 */:
                                return getDynamicRangeSettingDescription();
                            default:
                                return super.getDescription(i);
                        }
                }
        }
    }

    public final String getDynamicRangeDescription() {
        return getIndexedDescription(FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE, 1, "Standard", null, "Wide");
    }

    public final String getExrAutoDescription() {
        return getIndexedDescription(4147, 0, "Auto", "Manual");
    }

    public final String getExrModeDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4148);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 256 ? iIntValue != 512 ? iIntValue != 768 ? ho2.G("Unknown (", integer, ")") : "DR (Dynamic Range Priority)" : "SN (Signal to Noise Priority)" : "HR (High Resolution)";
    }

    public final String getFilmModeDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(FujifilmMakernoteDirectory.TAG_FILM_MODE);
        if (integer == null) {
            return null;
        }
        switch (integer.intValue()) {
            case 0:
                return "F0/Standard (Provia) ";
            case 256:
                return "F1/Studio Portrait";
            case 272:
                return "F1a/Studio Portrait Enhanced Saturation";
            case 288:
                return "F1b/Studio Portrait Smooth Skin Tone (Astia)";
            case 304:
                return "F1c/Studio Portrait Increased Sharpness";
            case 512:
                return "F2/Fujichrome (Velvia)";
            case 768:
                return "F3/Studio Portrait Ex";
            case 1024:
                return "F4/Velvia";
            case 1280:
                return "Pro Neg. Std";
            case 1281:
                return "Pro Neg. Hi";
            case 1536:
                return "Classic Chrome";
            case 1792:
                return "Eterna";
            case RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH /* 2048 */:
                return "Classic Negative";
            case OlympusCameraSettingsMakernoteDirectory.TagManometerPressure /* 2304 */:
                return "Bleach Bypass";
            case 2560:
                return "Nostalgic Neg";
            default:
                return ho2.G("Unknown (", integer, ")");
        }
    }

    public final String getFinePixColorDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(FujifilmMakernoteDirectory.TAG_FINE_PIX_COLOR);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 16 ? iIntValue != 48 ? ho2.G("Unknown (", integer, ")") : "B&W" : "Chrome" : "Standard";
    }

    public final String getFlashExposureValueDescription() {
        Rational rational = ((FujifilmMakernoteDirectory) this._directory).getRational(4113);
        if (rational == null) {
            return null;
        }
        return rational.toSimpleString(false) + " EV (Apex)";
    }

    public final String getFocusModeDescription() {
        return getIndexedDescription(4129, 0, "Auto Focus", "Manual Focus");
    }

    public final String getFocusWarningDescription() {
        return getIndexedDescription(FujifilmMakernoteDirectory.TAG_FOCUS_WARNING, 0, "Good Focus", "Out Of Focus");
    }

    public final String getHighIsoNoiseReductionDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4110);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 256 ? iIntValue != 512 ? ho2.G("Unknown (", integer, ")") : "Weak" : "Strong" : "Normal";
    }

    public final String getMacroDescription() {
        return getIndexedDescription(4128, 0, "Off", "On");
    }

    public final String getMakernoteVersionDescription() {
        return getVersionBytesDescription(0, 2);
    }

    public final String getNoiseReductionDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4107);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 64 ? iIntValue != 128 ? iIntValue != 256 ? ho2.G("Unknown (", integer, ")") : "N/A" : "Normal" : "Low";
    }

    public final String getSharpnessDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4097);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 1 ? iIntValue != 2 ? iIntValue != 3 ? iIntValue != 4 ? iIntValue != 5 ? iIntValue != 130 ? iIntValue != 132 ? iIntValue != 32768 ? iIntValue != 65535 ? ho2.G("Unknown (", integer, ")") : "N/A" : "Film Simulation" : "Medium Hard" : "Medium Soft" : "Hardest" : "Hard" : "Normal" : "Soft" : "Softest";
    }

    public final String getSlowSyncDescription() {
        return getIndexedDescription(4144, 0, "Off", "On");
    }

    public final String getToneDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4100);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 128 ? iIntValue != 256 ? iIntValue != 384 ? iIntValue != 512 ? iIntValue != 768 ? iIntValue != 32768 ? ho2.G("Unknown (", integer, ")") : "Film Simulation" : "None (B&W)" : "Low" : "Medium Low" : "High" : "Medium High" : "Normal";
    }

    public final String getWhiteBalanceDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4098);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 0) {
            return "Auto";
        }
        if (iIntValue == 256) {
            return "Daylight";
        }
        if (iIntValue == 512) {
            return "Cloudy";
        }
        if (iIntValue == 1024) {
            return "Incandescence";
        }
        if (iIntValue == 1280) {
            return "Flash";
        }
        if (iIntValue == 4080) {
            return "Kelvin";
        }
        switch (iIntValue) {
            case 768:
                return "Daylight Fluorescent";
            case 769:
                return "Day White Fluorescent";
            case 770:
                return "White Fluorescent";
            case 771:
                return "Warm White Fluorescent";
            case 772:
                return "Living Room Warm White Fluorescent";
            default:
                switch (iIntValue) {
                    case 3840:
                        return "Custom White Balance";
                    case OlympusMakernoteDirectory.TAG_DATA_DUMP_2 /* 3841 */:
                        return "Custom White Balance 2";
                    case 3842:
                        return "Custom White Balance 3";
                    case 3843:
                        return "Custom White Balance 4";
                    case 3844:
                        return "Custom White Balance 5";
                    default:
                        return ho2.G("Unknown (", integer, ")");
                }
        }
    }

    public final String getDynamicRangeSettingDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(FujifilmMakernoteDirectory.TAG_DYNAMIC_RANGE_SETTING);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 256 ? iIntValue != 32768 ? iIntValue != 512 ? iIntValue != 513 ? ho2.G("Unknown (", integer, ")") : "Wide 2 (400%)" : "Wide 1 (230%)" : "Film Simulation" : uuLAxLN.dLpKqAfCpo : "Manual" : "Auto (100-400%)";
    }

    public final String getFlashModeDescription() {
        return getIndexedDescription(4112, 0, "Auto", "On", gYpYQDQkhfs.dYThMjulucNRnd, "Red-eye Reduction", "External");
    }

    public final String getPictureModeDescription() {
        Integer integer = ((FujifilmMakernoteDirectory) this._directory).getInteger(4145);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        if (iIntValue == 27) {
            return "Dog Face Detection";
        }
        if (iIntValue == 28) {
            return "Cat Face Detection";
        }
        if (iIntValue == 256) {
            return "Aperture priority AE";
        }
        if (iIntValue == 512) {
            return ezwlgQm.BfuqteJOYbWq;
        }
        if (iIntValue == 768) {
            return "Manual exposure";
        }
        switch (iIntValue) {
            case 0:
                return "Auto";
            case 1:
                return "Portrait scene";
            case 2:
                return "Landscape scene";
            case 3:
                return "Macro";
            case 4:
                return "Sports scene";
            case 5:
                return "Night scene";
            case 6:
                return "Program AE";
            case 7:
                return "Natural Light";
            case 8:
                return "Anti-blur";
            case 9:
                return "Beach & Snow";
            case 10:
                return "Sunset";
            case 11:
                return "Museum";
            case 12:
                return "Party";
            case 13:
                return "Flower";
            case 14:
                return "Text";
            case 15:
                return "Natural Light & Flash";
            case 16:
                return "Beach";
            case 17:
                return kSWQKWZ.swWVjXZKUKFsyF;
            case 18:
                return "Fireworks";
            case 19:
                return "Underwater";
            case 20:
                return "Portrait with Skin Correction";
            default:
                switch (iIntValue) {
                    case 22:
                        return "Panorama";
                    case 23:
                        return "Night (Tripod)";
                    case 24:
                        return "Pro Low-light";
                    case 25:
                        return "Pro Focus";
                    default:
                        return ho2.G("Unknown (", integer, ")");
                }
        }
    }
}
