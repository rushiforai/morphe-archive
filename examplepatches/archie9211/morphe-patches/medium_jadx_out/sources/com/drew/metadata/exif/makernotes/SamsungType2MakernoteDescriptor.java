package com.drew.metadata.exif.makernotes;

import com.drew.metadata.TagDescriptor;
import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SamsungType2MakernoteDescriptor extends TagDescriptor<SamsungType2MakernoteDirectory> {
    public SamsungType2MakernoteDescriptor(SamsungType2MakernoteDirectory samsungType2MakernoteDirectory) {
        super(samsungType2MakernoteDirectory);
    }

    public final String getCameraTemperatureDescription() {
        return getFormattedInt(67, "%d C");
    }

    public final String getColorSpaceDescription() {
        return getIndexedDescription(SamsungType2MakernoteDirectory.TagColorSpace, 0, "sRGB", "Adobe RGB");
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        if (i == 1) {
            return getVersionBytesDescription(1, 2);
        }
        if (i == 2) {
            return getDeviceTypeDescription();
        }
        if (i == 3) {
            return getSamsungModelIdDescription();
        }
        if (i == 64) {
            return getRawDataByteOrderDescription();
        }
        if (i == 65) {
            return getWhiteBalanceSetupDescription();
        }
        if (i == 67) {
            return getCameraTemperatureDescription();
        }
        if (i == 80) {
            return getRawDataCFAPatternDescription();
        }
        if (i == 256) {
            return getFaceDetectDescription();
        }
        if (i == 288) {
            return getFaceRecognitionDescription();
        }
        if (i == 40963) {
            return getLensTypeDescription();
        }
        switch (i) {
            case SamsungType2MakernoteDirectory.TagColorSpace /* 40977 */:
                return getColorSpaceDescription();
            case SamsungType2MakernoteDirectory.TagSmartRange /* 40978 */:
                return getSmartRangeDescription();
            default:
                return super.getDescription(i);
        }
    }

    public final String getDeviceTypeDescription() {
        Integer integer = ((SamsungType2MakernoteDirectory) this._directory).getInteger(2);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 4096 ? iIntValue != 8192 ? iIntValue != 12288 ? iIntValue != 73728 ? iIntValue != 3145728 ? String.format("Unknown (%d)", integer) : "SMX Video Camera" : "Cell Phone" : "HXM Video Camera" : "High-end NX Camera" : "Compact Digital Camera";
    }

    public final String getFaceDetectDescription() {
        return getIndexedDescription(256, 0, "Off", "On");
    }

    public final String getFaceRecognitionDescription() {
        return getIndexedDescription(288, 0, "Off", "On");
    }

    public final String getLensTypeDescription() {
        return getIndexedDescription(40963, 0, "Built-in or Manual Lens", "Samsung NX 30mm F2 Pancake", "Samsung NX 18-55mm F3.5-5.6 OIS", "Samsung NX 50-200mm F4-5.6 ED OIS", "Samsung NX 20-50mm F3.5-5.6 ED", "Samsung NX 20mm F2.8 Pancake", "Samsung NX 18-200mm F3.5-6.3 ED OIS", "Samsung NX 60mm F2.8 Macro ED OIS SSA", "Samsung NX 16mm F2.4 Pancake", "Samsung NX 85mm F1.4 ED SSA", "Samsung NX 45mm F1.8", "Samsung NX 45mm F1.8 2D/3D", "Samsung NX 12-24mm F4-5.6 ED", "Samsung NX 16-50mm F2-2.8 S ED OIS", "Samsung NX 10mm F3.5 Fisheye", "Samsung NX 16-50mm F3.5-5.6 Power Zoom ED OIS", null, null, null, null, "Samsung NX 50-150mm F2.8 S ED OIS", "Samsung NX 300mm F2.8 ED OIS");
    }

    public final String getMakernoteVersionDescription() {
        return getVersionBytesDescription(1, 2);
    }

    public final String getRawDataByteOrderDescription() {
        return getIndexedDescription(64, 0, "Little-endian (Intel)", "Big-endian (Motorola)");
    }

    public final String getRawDataCFAPatternDescription() {
        Integer integer = ((SamsungType2MakernoteDirectory) this._directory).getInteger(80);
        if (integer == null) {
            return null;
        }
        int iIntValue = integer.intValue();
        return iIntValue != 0 ? iIntValue != 1 ? iIntValue != 65535 ? String.format("Unknown (%d)", integer) : "Roll" : "Swap" : "Unchanged";
    }

    public final String getSmartRangeDescription() {
        return getIndexedDescription(SamsungType2MakernoteDirectory.TagSmartRange, 0, "Off", "On");
    }

    public final String getWhiteBalanceSetupDescription() {
        return getIndexedDescription(65, 0, "Auto", "Manual");
    }

    public final String getSamsungModelIdDescription() {
        Integer integer = ((SamsungType2MakernoteDirectory) this._directory).getInteger(3);
        if (integer == null) {
            return null;
        }
        switch (integer.intValue()) {
            case 16781340:
                return "NX10";
            case 16781862:
                return "HMX-S15BP";
            case 16781875:
                return "HMX-Q10";
            case 16781876:
                return "HMX-H304";
            case 16782092:
                return "NX100";
            case 16782119:
                return "NX11";
            case 24121422:
                return "ES70, ES71 / VLUU ES70, ES71 / SL600";
            case 24121426:
                return "ES73 / VLUU ES73 / SL605";
            case 24122112:
                return "ES28 / VLUU ES28";
            case 24122115:
                return "ES74,ES75,ES78 / VLUU ES75,ES78";
            case 33558598:
                return "PL150 / VLUU PL150 / TL210 / PL151";
            case 33559313:
                return "PL120,PL121 / VLUU PL120,PL121";
            case 33559317:
                return "PL170,PL171 / VLUUPL170,PL171";
            case 33559326:
                return "PL210, PL211 / VLUU PL210, PL211";
            case 40899351:
                return "PL20,PL21 / VLUU PL20,PL21";
            case 44040219:
                return "WP10 / VLUU WP10 / AQ100";
            case 50331648:
                return "Various Models (0x3000000)";
            case 60817432:
                return "Various Models (0x3a00018)";
            case 67112991:
                return "ST1000 / ST1100 / VLUU ST1000 / CL65";
            case 67112994:
                return "ST550 / VLUU ST550 / TL225";
            case 67112997:
                return "Various Models (0x4001025)";
            case 67113022:
                return OphtYB.sGWQZKO;
            case 67113025:
                return "VLUU ST5000, ST5000, TL240";
            case 67113027:
                return "ST70 / VLUU ST70 / ST71";
            case 67113738:
                return "Various Models (0x400130a)";
            case 67113742:
                return "ST90,ST91 / VLUU ST90,ST91";
            case 67113747:
                return "VLUU ST95, ST95";
            case 77594645:
                return "VLUU ST60";
            case 77599579:
                return "ST30, ST65 / VLUU ST65 / ST67";
            case 83886080:
                return "Various Models (0x5000000)";
            case 83890232:
                return "Various Models (0x5001038)";
            case 83890234:
                return "WB650 / VLUU WB650 / WB660";
            case 83890236:
                return "WB600 / VLUU WB600 / WB610";
            case 83891006:
                return "WB150 / WB150F / WB152 / WB152F / WB151";
            case 94371855:
                return "WB5000 / HZ25W";
            case 100667446:
                return "EX1";
            case 117445404:
                return "VLUU SH100, SH100";
            case 655519746:
                return "SMX - C20N";
            default:
                return String.format("Unknown (%d)", integer);
        }
    }
}
