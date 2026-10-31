package com.facebook.ads.redexgen.X;

import android.content.pm.PackageInfo;
import android.text.TextUtils;
import android.util.Base64OutputStream;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.zip.DeflaterOutputStream;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public final class HD implements InterfaceC2164mI {
    public static PackageInfo A02;
    public static boolean A03;
    public static byte[] A04;
    public static String[] A05 = {"rjWu3o3XUIKJimpXtRLH", "N3hUjd9gC1zTrolrzHWDwio6K0KaeF7v", "V8BOZxTrBek9nlJry76rEN1tEiA1lgnf", "2kaCuDD1e44XjFqxj97oS3bW7Y4jUXps", "VcJxC1jbHxk7XwGyeCWvHwY9E4qRcx1x", "dO6RHNbAuKw0kDbwpnJR", "8jPNINbp0cYAxxIn", "ugIdyp1aSJPFHYCiUHctz2XPYC5YD6Ud"};
    public static final EnumC1643di[] A06;
    public final C2076kp A00;
    public final C2095lA A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A05[6].length() == 9) {
                throw new RuntimeException();
            }
            String[] strArr = A05;
            strArr[1] = "AJGqtkftO03LFXDJsHlFXR4ujVWNfKsn";
            strArr[7] = "0weTThgY8dzMPuXGgH30KJvXs1017h9U";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 73);
            i13++;
        }
    }

    public static void A02() {
        A04 = new byte[]{40, 13, 21, 23, 23, 17, 7, 7, 29, 22, 29, 24, 29, 0, 13, 11, 17, 26, 21, 22, 24, 17, 16, 41, 38, 41, 36, 39, 47, 45, 60, 60, 51, 33, 37, 34, 51, 63, 40, 39, 51, 58, 41, 62, 63, 37, 35, 34, 98, 112, 107, 98, 112, 85, 71, 93, 80, 78, 91, 91, 93, 70, 77, 90, 91, 70, 64, 65, 80, 70, 75, 47, 36, 41, 41, 40, 63, 50, 57, 34, 38, 40, 35, 50, 40, 53, 57, 63, 44, 62, 85, 94, 83, 83, 82, 69, 72, 67, 88, 92, 82, 89, 72, 67, 68, 72, 90, 68, 106, 125, 102, 108, 100, 109, 63, 61, 63, 52, 57, 79, 77, 92, 92, 73, 72, 83, 69, 72, 95, 21, 23, 4, 4, 31, 19, 4, 68, 68, 83, 88, 70, 81, 70, 78, 75, 70, 69, 78, 75, 78, 83, 94, 88, 84, 83, 70, 83, 82, 84, 92, 89, 76, 89, 71, 72, 74, 87, 91, 93, 75, 75, 81, 86, 95, 71, 87, 72, 76, 81, 87, 86, 75, 111, 106, AbstractJsonLexerKt.TC_INVALID, 106, 116, 123, 121, 100, 104, 110, 120, 120, 98, 101, 108, 116, 100, 123, AbstractJsonLexerKt.TC_INVALID, 98, 100, 101, 120, 116, 104, 100, 126, 101, AbstractJsonLexerKt.TC_INVALID, 121, 114, 28, 25, 12, 25, 7, 8, 10, 23, 27, 29, 11, 11, 17, 22, 31, 7, 23, 8, 12, 17, 23, 22, 11, 7, 11, 12, 25, 12, 29, 15, 14, 5, 24, 2, 31, 18, 48, 35, 56, 56, 51, 58, 41, 53, 57, 36, 51, 41, 51, 32, 51, 56, 34, 37, 30, 13, 22, 22, 29, 20, 7, 20, 23, 31, 31, 29, 28, 81, 118, 126, 123, 114, 115, 55, 99, 120, 55, 117, 98, 126, 123, 115, 55, 98, 100, 114, 101, 55, 99, 120, 124, 114, 121, 53, 60, 46, 34, 56, 37, 50, 45, 49, 60, 36, 56, 47, 48, 61, 63, 56, 37, 40, 51, 47, 45, 47, 36, 41, 51, 56, 63, 51, 33, 63, 47, 34, 57, 53, 41, 51, 52, 37, 35, 78, 73, 84, 83, 70, 75, 75, 66, 85, 108, 111, 99, 97, 108, 101, 5, 9, 3, 13, 75, 67, 66, 79, 71, 82, 79, 73, 72, 89, 85, 67, 84, 80, 79, 69, 67, 65, 74, 91, 88, 64, 93, 68, 80, 91, 86, 95, 74, 18, 30, 8, 17, 8, 14, 2, 8, 14, 24, 15, 2, 20, 25, 96, 125, 125, 102, 119, 118, 96, 96, 109, 113, 126, 123, 119, 124, 102, 109, 97, 118, 121, 109, 100, 119, 96, 97, 123, 125, 124, 62, 62, 51, 47, 35, 34, 42, 37, 43, 51, 56, 63, 51, 33, 63, 126, 126, 115, 105, 116, 120, 126, 109, AbstractJsonLexerKt.TC_INVALID, 52, 52, 57, 47, 53, 57, 32, 52, 41, 43, 57, 53, 35, 52, 48, 47, 37, 35, 29, 29, 16, 28, 10, 29, 25, 6, 12, 10, 16, 28, 11, 4, 16, 25, 10, 29, 28, 6, 0, 1, 65, 71, 85, 76, 85, 81, 76, 82, 67, 67, 76, 90, 93, 64, 71, 82, 95, 95, 86, 87, 37, 35, 49, 40, 49, 53, 40, 54, 39, 39, 40, 33, 50, 37, 36, 62, 56, 57, 71, 87, 70, 81, 81, 90, 75, 92, 81, 93, 83, 92, 64, 75, 91, 74, 93, 93, 86, 71, 79, 81, 92, 76, 80, 8, 31, 16, 4, 24, 26, 11, 26, 25, 18, 23, 18, 15, 2, 66, 85, 90, 78, 92, 80, 95, 80, 86, 84, 85, 78, 82, 80, 82, 89, 84, 0, 22, 0, 0, 26, 28, 29, 12, 7, 26, 30, 22, 30, 5, 2, 31, 18, 98, 100, 114, 101, 104, 118, 112, 114, 121, 99, 35, 52, 57, 37, 52, 39, 52, 56, 38, 73, 82, 75, 75};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public final String A05(InterfaceC2162mG interfaceC2162mG) {
        C2160mE.A08(this.A01, true, null);
        ByteArrayOutputStream byteArrayOutputStream = null;
        Base64OutputStream base64OutputStream = null;
        DeflaterOutputStream deflaterOutputStream = null;
        try {
            try {
                byteArrayOutputStream = new ByteArrayOutputStream();
                base64OutputStream = new Base64OutputStream(byteArrayOutputStream, 0);
                deflaterOutputStream = new DeflaterOutputStream(base64OutputStream);
                Map mapA06 = A06();
                if (TextUtils.isEmpty(AbstractC2063kb.A00().A03())) {
                    AbstractC2063kb.A07(this.A01);
                }
                mapA06.put(A01(Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE, 4, 48), AbstractC2063kb.A00().A03());
                mapA06.put(A01(610, 10, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), AbstractC2168mM.A06(new C2137lq(this.A01), this.A01, false));
                if (C2203mv.A21(this.A01)) {
                    mapA06.put(A01(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 10, 69), C1715eu.A01(this.A01).A0K());
                }
                Iterator it = mapA06.entrySet().iterator();
                while (it.hasNext()) {
                    if (!interfaceC2162mG.A3W((String) ((Map.Entry) it.next()).getKey())) {
                        it.remove();
                    }
                }
                deflaterOutputStream.write(new JSONObject(mapA06).toString().getBytes());
                deflaterOutputStream.close();
                String strReplaceAll = byteArrayOutputStream.toString().replaceAll(A01(0, 1, 107), A01(0, 0, 37));
                try {
                    deflaterOutputStream.close();
                    base64OutputStream.close();
                    byteArrayOutputStream.close();
                } catch (IOException unused) {
                }
                return strReplaceAll;
            } catch (IOException e3) {
                throw new RuntimeException(A01(280, 26, 94), e3);
            }
        } catch (Throwable th2) {
            if (deflaterOutputStream != null) {
                try {
                    deflaterOutputStream.close();
                } catch (IOException unused2) {
                    throw th2;
                }
            }
            if (base64OutputStream != null) {
                base64OutputStream.close();
            }
            if (byteArrayOutputStream != null) {
                byteArrayOutputStream.close();
            }
            throw th2;
        }
    }

    public final /* synthetic */ Map A06() {
        return AbstractC2161mF.A00(this);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2164mI
    public final Map<String, String> A8Z(InterfaceC2151m5 interfaceC2151m5) throws Exception {
        String strA98;
        Map<String, String> mapA02;
        String strA8i;
        String strA7j = interfaceC2151m5 != null ? interfaceC2151m5.A7j() : null;
        String packageName = strA7j != null ? strA7j : this.A01.getPackageName();
        C2160mE.A08(this.A01, ProcessUtils.isRemoteRenderingProcess() ? true : C2203mv.A0l(this.A01), strA7j);
        C2136lp.A0B(this.A01);
        C2136lp.A08(this.A01);
        HashMap map = new HashMap();
        C2157mB.A03(this.A01, map, strA7j);
        map.put(A01(355, 6, 105), Locale.getDefault().toString());
        float f11 = AbstractC2385px.A02;
        int i5 = this.A01.getResources().getDisplayMetrics().widthPixels;
        int i11 = this.A01.getResources().getDisplayMetrics().heightPixels;
        map.put(A01(242, 7, 2), String.valueOf(f11));
        map.put(A01(550, 12, 81), String.valueOf((int) (i5 / f11)));
        map.put(A01(537, 13, 93), String.valueOf((int) (i11 / f11)));
        map.put(A01(57, 14, 70), AbstractC2063kb.A03());
        map.put(A01(337, 9, 47), AbstractC2063kb.A00().A02().name());
        map.put(A01(323, 14, 37), String.valueOf(AbstractC2063kb.A00().A01()));
        C2137lq c2137lq = new C2137lq(this.A01, strA7j);
        map.put(A01(108, 6, 97), AbstractC2168mM.A03(this.A01, c2137lq));
        map.put(A01(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 7, 31), c2137lq.A08());
        map.put(A01(361, 4, 1), c2137lq.A09());
        map.put(A01(TTAdConstant.DOWNLOAD_URL_CODE, 6, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), String.valueOf(C2160mE.A00(this.A01).A00));
        map.put(A01(346, 9, 78), c2137lq.A0B());
        map.put(A01(TTAdConstant.STYLE_SIZE_RADIO_9_16, 14, 18), EnumC2355pT.A01());
        map.put(A01(382, 12, 70), String.valueOf(AbstractC2414qQ.A00(this.A01).A00));
        map.put(A01(593, 12, 26), C2416qS.A03(this.A01.A09().A01()));
        C2160mE.A06(this.A01, packageName, map);
        String strA03 = AbstractC2382pu.A03(this.A01, packageName);
        if (strA03 != null) {
            map.put(A01(48, 5, 106), strA03);
        }
        String strA01 = A01(605, 5, 2);
        if (interfaceC2151m5 == null || interfaceC2151m5.ABS() == null) {
            String strValueOf = String.valueOf(C2386py.A05(this.A01));
            String[] strArr = A05;
            if (strArr[4].charAt(13) != strArr[3].charAt(13)) {
                A05[6] = "Zb8WUk4PegG";
                map.put(strA01, strValueOf);
            } else {
                String[] strArr2 = A05;
                strArr2[1] = "oLHhXlB62bCaMkySGHCUgkWekrcOpgKL";
                strArr2[7] = "0PWUKw3A3hgP3SH06Hl8sj4daQuXon2g";
                map.put(strA01, strValueOf);
            }
        } else {
            map.put(strA01, String.valueOf(interfaceC2151m5.ABS()));
        }
        if (interfaceC2151m5 == null || interfaceC2151m5.A99() == null) {
            InterfaceC2100lF interfaceC2100lFA05 = this.A01.A05();
            String[] strArr3 = A05;
            if (strArr3[0].length() == strArr3[5].length()) {
                A05[6] = "E";
                strA98 = interfaceC2100lFA05.A98();
            }
            throw new RuntimeException();
        }
        strA98 = interfaceC2151m5.A99();
        if (strA98 != null) {
            map.put(A01(365, 17, 79), strA98);
        }
        map.put(A01(2, 21, 29), String.valueOf(c2137lq.A0C()));
        if (c2137lq.A03() != -1) {
            map.put(A01(29, 19, 37), String.valueOf(c2137lq.A03()));
        }
        map.put(A01(620, 9, 60), C2152m6.A05(this.A01, packageName));
        map.put(A01(23, 6, 33), AbstractC2392q4.A01(C2136lp.A02()));
        if (AbstractC2201mt.A05(this.A01) && (strA8i = this.A01.A05().A8i()) != null) {
            map.put(A01(53, 4, 93), strA8i);
        }
        InterfaceC2100lF interfaceC2100lFA052 = this.A01.A05();
        if (A05[2].charAt(4) != '1') {
            A05[2] = "Wn31NZtM2oeCISpfWM8NBUgIFylswktz";
            String strA9F = interfaceC2100lFA052.A9F();
            if (!TextUtils.isEmpty(strA9F)) {
                map.put(A01(394, 14, 20), strA9F);
            }
            C2109lO c2109lOA8L = null;
            if (interfaceC2151m5 != null) {
                C2095lA c2095lA = this.A01;
                if (A05[2].charAt(4) == '1') {
                    throw new RuntimeException();
                }
                A05[2] = "UkbZyMMn6UWteLCB6DOs48k1ItwI1bgo";
                c2109lOA8L = interfaceC2151m5.A8N(c2095lA);
            }
            if (c2109lOA8L == null) {
                c2109lOA8L = this.A01.A07().A8L();
            }
            String strA012 = A01(Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE, 29, 17);
            String strA013 = A01(182, 31, 98);
            String strA014 = A01(159, 23, 81);
            if (c2109lOA8L != null) {
                map.put(strA014, c2109lOA8L.A08());
                map.put(strA013, String.valueOf(c2109lOA8L.A05()));
                map.put(strA012, String.valueOf(c2109lOA8L.A06()));
            } else if (A05[6].length() != 9) {
                A05[2] = "g3pWjJ2zM3bUV7lxKGYwiP6FmOHB7jmG";
                String strA015 = A01(629, 4, 110);
                map.put(strA014, strA015);
                map.put(strA013, strA015);
                map.put(strA012, strA015);
            }
            map.put(A01(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 10, 69), C1715eu.A01(this.A01).A0K());
            String strA032 = this.A00.A03(this.A01);
            if (strA032 != null && !TextUtils.isEmpty(strA032)) {
                map.put(A01(71, 19, 36), strA032);
            }
            if (AbstractC2206my.A0K(this.A01)) {
                map.put(A01(90, 18, 94), C2416qS.A07(C2416qS.A00()));
            }
            map.put(A01(306, 13, 52), String.valueOf(this.A01.A04().AAQ()));
            map.put(A01(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 23, 78), String.valueOf(IO.A00(this.A01)));
            map.put(A01(267, 13, 17), String.valueOf(C2120lZ.A0H(this.A01)));
            StringBuilder sb2 = new StringBuilder();
            EnumC1643di[] enumC1643diArr = A06;
            int i12 = 0;
            while (true) {
                if (i12 >= enumC1643diArr.length) {
                    map.put(A01(249, 18, 63), sb2.toString());
                    PackageInfo packageInfoA00 = A00(this.A01);
                    map.put(A01(499, 20, 90), String.valueOf(packageInfoA00 != null));
                    if (packageInfoA00 != null) {
                        String strValueOf2 = String.valueOf(packageInfoA00.versionCode);
                        String[] strArr4 = A05;
                        if (strArr4[0].length() != strArr4[5].length()) {
                            throw new RuntimeException();
                        }
                        A05[2] = "SeIr9qpL8kjQBn7PkeftHMsbW6mQwwUT";
                        map.put(A01(519, 18, 62), strValueOf2);
                    }
                    A03(interfaceC2151m5, map);
                    if (C2203mv.A0x(this.A01) && (mapA02 = AbstractC2155m9.A02(this.A01.A02())) != null) {
                        String strA016 = A01(576, 17, 88);
                        if (A05[2].charAt(4) != '1') {
                            String[] strArr5 = A05;
                            strArr5[1] = "t1OpcWxl3twlXN6hcH32QL1LEyfC5G5E";
                            strArr5[7] = "T3ndYdKUgfLx0OtI3HozzaxA8UrNJzfx";
                            map.put(strA016, AbstractC2392q4.A01(mapA02));
                        } else {
                            map.put(strA016, AbstractC2392q4.A01(mapA02));
                        }
                    }
                    return map;
                }
                int iA03 = enumC1643diArr[i12].A03() + 4000;
                if (A05[2].charAt(4) == '1') {
                    break;
                }
                String[] strArr6 = A05;
                strArr6[4] = "OyzqediniT4WaaMJtrcq3vkVjRUgBtN4";
                strArr6[3] = "c7fMeQjWbpZqZJFnOkDqqT2mFjLLt7Z5";
                sb2.append(iA03);
                if (i12 != enumC1643diArr.length - 1) {
                    sb2.append(A01(1, 1, 104));
                }
                i12++;
            }
        }
        throw new RuntimeException();
    }

    static {
        A02();
        A03 = false;
        A06 = new EnumC1643di[]{EnumC1643di.A1S, EnumC1643di.A14, EnumC1643di.A1T, EnumC1643di.A1e, EnumC1643di.A1N, EnumC1643di.A19, EnumC1643di.A0x, EnumC1643di.A1c, EnumC1643di.A1P, EnumC1643di.A34, EnumC1643di.A35, EnumC1643di.A36};
    }

    public HD(C2095lA c2095lA, boolean z11, C2076kp c2076kp) throws Exception {
        this.A01 = c2095lA;
        this.A00 = c2076kp;
        C2160mE.A08(c2095lA, z11, null);
    }

    public static synchronized PackageInfo A00(C2095lA c2095lA) {
        if (!A03) {
            A02 = AbstractC2397q9.A00(c2095lA);
            A03 = true;
        }
        return A02;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00e3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A03(InterfaceC2151m5 interfaceC2151m5, Map<String, String> map) {
        String[] strArr;
        String strA01;
        if (interfaceC2151m5 != null && interfaceC2151m5.ABO()) {
            map.put(A01(459, 18, 47), Boolean.TRUE.toString());
            if (interfaceC2151m5.A7y() != null) {
                map.put(A01(TTAdConstant.VIDEO_URL_CODE, 21, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), interfaceC2151m5.A7y());
            }
        }
        if (AbstractC2206my.A0F(this.A01)) {
            String strA03 = AbstractC2153m7.A03(this.A01.A02());
            if (strA03 != null) {
                String[] strArr2 = A05;
                if (strArr2[4].charAt(13) != strArr2[3].charAt(13)) {
                    String[] strArr3 = A05;
                    strArr3[4] = "nMAZfFxVFGZl3aophdQR19PiPIOzBlCQ";
                    strArr3[3] = "anlPQAe7IyslUJVuQWSDFk7bdlGE3zec";
                    String remoteRenderingSdkVersion = A01(477, 22, 6);
                    map.put(remoteRenderingSdkVersion, strA03);
                }
            }
            String strA02 = AbstractC2153m7.A02(this.A01.A02());
            String[] strArr4 = A05;
            if (strArr4[4].charAt(13) == strArr4[3].charAt(13)) {
                throw new RuntimeException();
            }
            A05[2] = "GNPAuRma4t7RjFMsFXmIoJg8EaFACVo3";
            if (strA03 != null) {
                String remoteRenderingSdkVersion2 = A01(450, 9, 101);
                map.put(remoteRenderingSdkVersion2, strA02);
            }
            if (AbstractC2206my.A0K(this.A01)) {
                String strA012 = AbstractC2153m7.A01(this.A01.A02());
                if (strA03 != null) {
                    String remoteRenderingSdkVersion3 = A01(435, 15, 37);
                    map.put(remoteRenderingSdkVersion3, strA012);
                }
            }
            C2095lA c2095lA = this.A01;
            strArr = A05;
            if (strArr[1].charAt(17) == strArr[7].charAt(17)) {
            }
        } else {
            C2095lA c2095lA2 = this.A01;
            strArr = A05;
            if (strArr[1].charAt(17) == strArr[7].charAt(17)) {
                A05[6] = "7SFNCCJJaBvzY70DbmGNzcELyF";
                if (C2203mv.A0w(c2095lA2) && (strA01 = AbstractC2155m9.A01(this.A01.A02())) != null) {
                    String cache = A01(114, 5, 53);
                    map.put(cache, strA01);
                    return;
                }
                return;
            }
        }
        throw new RuntimeException();
    }

    public final String A04() {
        return A05(C2163mH.A00());
    }
}
