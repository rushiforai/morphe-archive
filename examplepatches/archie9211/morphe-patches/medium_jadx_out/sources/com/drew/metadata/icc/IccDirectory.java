package com.drew.metadata.icc;

import com.drew.metadata.Directory;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import defpackage.lv8;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class IccDirectory extends Directory {
    public static final int TAG_APPLE_MULTI_LANGUAGE_PROFILE_NAME = 1685283693;
    public static final int TAG_CMM_FLAGS = 44;
    public static final int TAG_CMM_TYPE = 4;
    public static final int TAG_COLOR_SPACE = 16;
    public static final int TAG_DEVICE_ATTR = 56;
    public static final int TAG_DEVICE_MAKE = 48;
    public static final int TAG_DEVICE_MODEL = 52;
    public static final int TAG_PLATFORM = 40;
    public static final int TAG_PROFILE_BYTE_COUNT = 0;
    public static final int TAG_PROFILE_CLASS = 12;
    public static final int TAG_PROFILE_CONNECTION_SPACE = 20;
    public static final int TAG_PROFILE_CREATOR = 80;
    public static final int TAG_PROFILE_DATETIME = 24;
    public static final int TAG_PROFILE_VERSION = 8;
    public static final int TAG_RENDERING_INTENT = 64;
    public static final int TAG_SIGNATURE = 36;
    public static final int TAG_TAG_A2B0 = 1093812784;
    public static final int TAG_TAG_A2B1 = 1093812785;
    public static final int TAG_TAG_A2B2 = 1093812786;
    public static final int TAG_TAG_B2A0 = 1110589744;
    public static final int TAG_TAG_B2A1 = 1110589745;
    public static final int TAG_TAG_B2A2 = 1110589746;
    public static final int TAG_TAG_COUNT = 128;
    public static final int TAG_TAG_aabg = 1633772135;
    public static final int TAG_TAG_aagg = 1633773415;
    public static final int TAG_TAG_aarg = 1633776231;
    public static final int TAG_TAG_bTRC = 1649693251;
    public static final int TAG_TAG_bXYZ = 1649957210;
    public static final int TAG_TAG_bfd = 1650877472;
    public static final int TAG_TAG_bkpt = 1651208308;
    public static final int TAG_TAG_calt = 1667329140;
    public static final int TAG_TAG_chad = 1667785060;
    public static final int TAG_TAG_chrm = 1667789421;
    public static final int TAG_TAG_cprt = 1668313716;
    public static final int TAG_TAG_crdi = 1668441193;
    public static final int TAG_TAG_desc = 1684370275;
    public static final int TAG_TAG_devs = 1684371059;
    public static final int TAG_TAG_dmdd = 1684890724;
    public static final int TAG_TAG_dmnd = 1684893284;
    public static final int TAG_TAG_gTRC = 1733579331;
    public static final int TAG_TAG_gXYZ = 1733843290;
    public static final int TAG_TAG_gamt = 1734438260;
    public static final int TAG_TAG_kTRC = 1800688195;
    public static final int TAG_TAG_lumi = 1819635049;
    public static final int TAG_TAG_meas = 1835360627;
    public static final int TAG_TAG_mmod = 1835888484;
    public static final int TAG_TAG_ncl2 = 1852009522;
    public static final int TAG_TAG_ncol = 1852010348;
    public static final int TAG_TAG_ndin = 1852074350;
    public static final int TAG_TAG_pre0 = 1886545200;
    public static final int TAG_TAG_pre1 = 1886545201;
    public static final int TAG_TAG_pre2 = 1886545202;
    public static final int TAG_TAG_ps2i = 1886597737;
    public static final int TAG_TAG_ps2s = 1886597747;
    public static final int TAG_TAG_psd0 = 1886610480;
    public static final int TAG_TAG_psd1 = 1886610481;
    public static final int TAG_TAG_psd2 = 1886610482;
    public static final int TAG_TAG_psd3 = 1886610483;
    public static final int TAG_TAG_pseq = 1886610801;
    public static final int TAG_TAG_rTRC = 1918128707;
    public static final int TAG_TAG_rXYZ = 1918392666;
    public static final int TAG_TAG_resp = 1919251312;
    public static final int TAG_TAG_scrd = 1935897188;
    public static final int TAG_TAG_scrn = 1935897198;
    public static final int TAG_TAG_targ = 1952543335;
    public static final int TAG_TAG_tech = 1952801640;
    public static final int TAG_TAG_vcgt = 1986226036;
    public static final int TAG_TAG_view = 1986618743;
    public static final int TAG_TAG_vued = 1987405156;
    public static final int TAG_TAG_wtpt = 2004119668;
    public static final int TAG_XYZ_VALUES = 68;
    private static final HashMap<Integer, String> _tagNameMap;

    public IccDirectory() {
        setDescriptor(new IccDescriptor(this));
    }

    @Override // com.drew.metadata.Directory
    public final String getName() {
        return "ICC Profile";
    }

    @Override // com.drew.metadata.Directory
    public final HashMap<Integer, String> getTagNameMap() {
        return _tagNameMap;
    }

    static {
        HashMap<Integer, String> map = new HashMap<>();
        _tagNameMap = map;
        lv8.x(0, map, "Profile Size", 4, "CMM Type");
        lv8.x(8, map, "Version", 12, "Class");
        lv8.x(16, map, "Color space", 20, "Profile Connection Space");
        lv8.x(24, map, "Profile Date/Time", 36, "Signature");
        lv8.x(40, map, "Primary Platform", 44, "CMM Flags");
        lv8.x(48, map, "Device manufacturer", 52, "Device model");
        lv8.x(56, map, "Device attributes", 64, "Rendering Intent");
        lv8.x(68, map, "XYZ values", 80, "Profile Creator");
        lv8.x(128, map, "Tag Count", TAG_TAG_A2B0, "AToB 0");
        lv8.x(TAG_TAG_A2B1, map, "AToB 1", TAG_TAG_A2B2, "AToB 2");
        lv8.x(TAG_TAG_bXYZ, map, "Blue Colorant", TAG_TAG_bTRC, "Blue TRC");
        lv8.x(TAG_TAG_B2A0, map, "BToA 0", TAG_TAG_B2A1, "BToA 1");
        lv8.x(TAG_TAG_B2A2, map, "BToA 2", TAG_TAG_calt, "Calibration Date/Time");
        lv8.x(TAG_TAG_targ, map, "Char Target", TAG_TAG_chad, "Chromatic Adaptation");
        lv8.x(TAG_TAG_chrm, map, "Chromaticity", TAG_TAG_cprt, "Profile Copyright");
        lv8.x(TAG_TAG_crdi, map, "CrdInfo", TAG_TAG_dmnd, "Device Mfg Description");
        lv8.x(TAG_TAG_dmdd, map, mBTDfueQiGWRV.GdM, TAG_TAG_devs, "Device Settings");
        lv8.x(TAG_TAG_gamt, map, "Gamut", TAG_TAG_kTRC, "Gray TRC");
        lv8.x(TAG_TAG_gXYZ, map, "Green Colorant", TAG_TAG_gTRC, "Green TRC");
        lv8.x(TAG_TAG_lumi, map, "Luminance", TAG_TAG_meas, "Measurement");
        lv8.x(TAG_TAG_bkpt, map, "Media Black Point", TAG_TAG_wtpt, "Media White Point");
        lv8.x(TAG_TAG_ncol, map, "Named Color", TAG_TAG_ncl2, "Named Color 2");
        lv8.x(TAG_TAG_resp, map, "Output Response", TAG_TAG_pre0, "Preview 0");
        lv8.x(TAG_TAG_pre1, map, "Preview 1", TAG_TAG_pre2, "Preview 2");
        lv8.x(TAG_TAG_desc, map, "Profile Description", TAG_TAG_pseq, "Profile Sequence Description");
        lv8.x(TAG_TAG_psd0, map, "Ps2 CRD 0", TAG_TAG_psd1, "Ps2 CRD 1");
        lv8.x(TAG_TAG_psd2, map, "Ps2 CRD 2", TAG_TAG_psd3, "Ps2 CRD 3");
        lv8.x(TAG_TAG_ps2s, map, "Ps2 CSA", TAG_TAG_ps2i, "Ps2 Rendering Intent");
        lv8.x(TAG_TAG_rXYZ, map, "Red Colorant", TAG_TAG_rTRC, "Red TRC");
        lv8.x(TAG_TAG_scrd, map, "Screening Desc", TAG_TAG_scrn, "Screening");
        lv8.x(TAG_TAG_tech, map, "Technology", TAG_TAG_bfd, "Ucrbg");
        lv8.x(TAG_TAG_vued, map, "Viewing Conditions Description", TAG_TAG_view, "Viewing Conditions");
        lv8.x(TAG_TAG_aabg, map, "Blue Parametric TRC", TAG_TAG_aagg, "Green Parametric TRC");
        lv8.x(TAG_TAG_aarg, map, "Red Parametric TRC", TAG_TAG_mmod, "Make And Model");
        lv8.x(TAG_TAG_ndin, map, "Native Display Information", TAG_TAG_vcgt, "Video Card Gamma");
        map.put(Integer.valueOf(TAG_APPLE_MULTI_LANGUAGE_PROFILE_NAME), "Apple Multi-language Profile Name");
    }
}
