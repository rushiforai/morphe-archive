package com.drew.metadata.exif.makernotes;

import androidx.compose.material.internal.Yzq.QFTsJPDEnO;
import com.drew.metadata.TagDescriptor;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.data.notification.YMl.DtuT;
import defpackage.ho2;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SanyoMakernoteDescriptor extends TagDescriptor<SanyoMakernoteDirectory> {
    public SanyoMakernoteDescriptor(SanyoMakernoteDirectory sanyoMakernoteDirectory) {
        super(sanyoMakernoteDirectory);
    }

    private String getColorAdjustmentModeDescription() {
        return getIndexedDescription(528, 0, "Off", "On");
    }

    private String getDigitalZoomDescription() {
        return getDecimalRational(516, 3);
    }

    private String getDigitalZoomOnDescription() {
        return getIndexedDescription(539, 0, "Off", "On");
    }

    private String getFlashModeDescription() {
        return getIndexedDescription(549, 0, "Auto", "Force", "Disabled", "Red eye");
    }

    private String getFlickerReduceDescription() {
        return getIndexedDescription(SanyoMakernoteDirectory.TAG_FLICKER_REDUCE, 0, "Off", "On");
    }

    private String getLightSourceSpecialDescription() {
        return getIndexedDescription(SanyoMakernoteDirectory.TAG_LIGHT_SOURCE_SPECIAL, 0, "Off", "On");
    }

    private String getMacroDescription() {
        return getIndexedDescription(514, 0, "Normal", "Macro", "View", "Manual");
    }

    private String getOptimalZoomOnDescription() {
        return getIndexedDescription(537, 0, "Off", "On");
    }

    private String getRecordShutterDescription() {
        return getIndexedDescription(SanyoMakernoteDirectory.TAG_RECORD_SHUTTER_RELEASE, 0, "Record while down", "Press start, press stop");
    }

    private String getResavedDescription() {
        return getIndexedDescription(542, 0, "No", "Yes");
    }

    private String getSelfTimerDescription() {
        return getIndexedDescription(532, 0, "Off", "On");
    }

    private String getSequenceShotIntervalDescription() {
        return getIndexedDescription(SanyoMakernoteDirectory.TAG_SEQUENCE_SHOT_INTERVAL, 0, "5 frames/sec", "10 frames/sec", "15 frames/sec", "20 frames/sec");
    }

    private String getSequentialShotDescription() {
        return getIndexedDescription(SanyoMakernoteDirectory.TAG_SEQUENTIAL_SHOT, 0, "None", "Standard", "Best", "Adjust Exposure");
    }

    private String getVoiceMemoDescription() {
        return getIndexedDescription(534, 0, "Off", "On");
    }

    private String getWideRangeDescription() {
        return getIndexedDescription(527, 0, "Off", "On");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 513) {
            return getSanyoQualityDescription();
        }
        if (i == 514) {
            return getMacroDescription();
        }
        if (i == 516) {
            return getDigitalZoomDescription();
        }
        if (i == 539) {
            return getDigitalZoomOnDescription();
        }
        if (i == 531) {
            return getQuickShotDescription();
        }
        if (i == 532) {
            return getSelfTimerDescription();
        }
        if (i == 548) {
            return getSequenceShotIntervalDescription();
        }
        if (i == 549) {
            return getFlashModeDescription();
        }
        switch (i) {
            case SanyoMakernoteDirectory.TAG_SEQUENTIAL_SHOT /* 526 */:
                return getSequentialShotDescription();
            case 527:
                return getWideRangeDescription();
            case 528:
                return getColorAdjustmentModeDescription();
            default:
                switch (i) {
                    case 534:
                        return getVoiceMemoDescription();
                    case SanyoMakernoteDirectory.TAG_RECORD_SHUTTER_RELEASE /* 535 */:
                        return getRecordShutterDescription();
                    case SanyoMakernoteDirectory.TAG_FLICKER_REDUCE /* 536 */:
                        return getFlickerReduceDescription();
                    case 537:
                        return getOptimalZoomOnDescription();
                    default:
                        switch (i) {
                            case SanyoMakernoteDirectory.TAG_LIGHT_SOURCE_SPECIAL /* 541 */:
                                return getLightSourceSpecialDescription();
                            case 542:
                                return getResavedDescription();
                            case SanyoMakernoteDirectory.TAG_SCENE_SELECT /* 543 */:
                                return getSceneSelectDescription();
                            default:
                                return super.getDescription(i);
                        }
                }
        }
    }

    private String getQuickShotDescription() {
        return getIndexedDescription(531, 0, "Off", Plbho.yKCqIfcitUTNevD);
    }

    private String getSceneSelectDescription() {
        return getIndexedDescription(SanyoMakernoteDirectory.TAG_SCENE_SELECT, 0, "Off", "Sport", "TV", "Night", "User 1", DtuT.KSEZ, "Lamp");
    }

    public final String getSanyoQualityDescription() {
        Integer integer = ((SanyoMakernoteDirectory) this._directory).getInteger(513);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        switch (iIntValue) {
            case 0:
                return "Normal/Very Low";
            case 1:
                return "Normal/Low";
            case 2:
                return "Normal/Medium Low";
            case 3:
                return "Normal/Medium";
            case 4:
                return "Normal/Medium High";
            case 5:
                return "Normal/High";
            case 6:
                return "Normal/Very High";
            case 7:
                return "Normal/Super High";
            default:
                switch (iIntValue) {
                    case 256:
                        return "Fine/Very Low";
                    case 257:
                        return "Fine/Low";
                    case 258:
                        return "Fine/Medium Low";
                    case 259:
                        return "Fine/Medium";
                    case 260:
                        return "Fine/Medium High";
                    case 261:
                        return "Fine/High";
                    case 262:
                        return "Fine/Very High";
                    case 263:
                        return QFTsJPDEnO.KNi;
                    default:
                        switch (iIntValue) {
                            case 512:
                                return "Super Fine/Very Low";
                            case 513:
                                return "Super Fine/Low";
                            case 514:
                                return "Super Fine/Medium Low";
                            case 515:
                                return "Super Fine/Medium";
                            case 516:
                                return "Super Fine/Medium High";
                            case 517:
                                return "Super Fine/High";
                            case 518:
                                return "Super Fine/Very High";
                            case 519:
                                return "Super Fine/Super High";
                            default:
                                return ho2.G("Unknown (", integer, ")");
                        }
                }
        }
    }
}
