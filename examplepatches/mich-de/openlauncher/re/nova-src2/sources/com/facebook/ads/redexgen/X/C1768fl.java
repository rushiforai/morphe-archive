package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.text.TextUtils;
import com.facebook.ads.AdError;
import com.facebook.ads.CacheFlag;
import com.facebook.ads.RewardData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1768fl {
    public static byte[] A05;
    public static String[] A06 = {"jJreqFAWfQsm2UlBXjWleQZy51A8w9r3", "B5vxrqY9e1pfFDILbPSJEQZe5Zep9JAF", "7hwRhDIA2xM98ucsNVPICP0872", "8yYdfjKxcW1uK5E8nS4F9bT", "cwoTvwLLOWGZrFwonmn2qn9xu", "wuc4L", "VoE60CbUCih", "1JGxuEjawtyxaKItdz1AQ1lnM"};
    public C2086kz A00;
    public EnumC2622tm A01 = EnumC2622tm.A06;
    public ArrayList<C1245Tb> A02 = new ArrayList<>();
    public final AbstractC1734fD A03;
    public final InterfaceC1767fk A04;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 96);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A05 = new byte[]{-97, -39, -27, -34, -35, -81, -44, -38, -53, -40, -44, -57, -46, -122, -85, -40, -40, -43, -40, -122, -104, -106, -106, -100, -122, -35, -49, -38, -50, -43, -37, -38, -122, -57, -122, -36, -57, -46, -49, -54, -122, -89, -54, -81, -44, -52, -43, -108, 31, 34, 29, 34, 31, 50, 31, 29, 32, 51, 44, 34, 42, 35, -45, -30, -37, -59, -54, -61, -53, -48, -63, -46, -61, -44, -61, -49, -43, -42, -37, -44, -36, -31, -40, -41, -76, -41, -73, -44, -25, -44, -75, -24, -31, -41, -33, -40, -38, -33, -27, -42, -29, -28, -27, -38, -27, -38, -46, -35, 15, 8, 3, 11, 15, -1, -29, -2};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 11 out of bounds for length 11
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A0J(C0958Hi c0958Hi, EnumSet<CacheFlag> enumSet) {
        if (A0E() == EnumC2295oR.A05) {
            C1048Kz c1048Kz = (C1048Kz) this.A03;
            LA laA2y = c1048Kz.A2y();
            if (A0C(c0958Hi, laA2y) || laA2y == null) {
                return;
            }
            this.A04.AIm();
            A0A(c0958Hi, enumSet, c1048Kz, laA2y, 0, this.A04);
            return;
        }
        if (A0C(c0958Hi, (LA) this.A03)) {
            return;
        }
        this.A04.AIm();
        if (A0E() == EnumC2295oR.A0D) {
            A08(c0958Hi, (C07167i) this.A03);
        } else {
            A09(c0958Hi, enumSet, (C07167i) this.A03, -1, this.A04);
        }
    }

    static {
        A06();
    }

    public C1768fl(C0958Hi c0958Hi, C1782fz c1782fz, InterfaceC1767fk interfaceC1767fk, String str) {
        JSONObject dataObject = c1782fz.A03();
        this.A03 = A01(c0958Hi, c1782fz, str, dataObject);
        this.A04 = interfaceC1767fk;
    }

    private AdError A00(C0958Hi c0958Hi, LA la2) {
        if (la2 == null || la2.A39().isEmpty()) {
            c0958Hi.A08().ABz(A04(62, 3, 18), AbstractC2126lf.A0Z, new C2127lg(A04(5, 43, 6)));
            return AdError.internalError(2006);
        }
        return null;
    }

    public static AbstractC1734fD A01(C0958Hi c0958Hi, C1782fz c1782fz, String str, JSONObject jSONObject) {
        AbstractC1734fD abstractC1734fDA00 = null;
        if (jSONObject.has(A04(65, 12, 2))) {
            try {
                abstractC1734fDA00 = C1048Kz.A01(jSONObject, c0958Hi, true);
                abstractC1734fDA00.A27(true);
                abstractC1734fDA00.A23(A04(96, 12, 17));
            } catch (JSONException unused) {
            }
        }
        if (abstractC1734fDA00 == null) {
            abstractC1734fDA00 = C07167i.A00(jSONObject, c0958Hi);
        }
        abstractC1734fDA00.A22(str);
        C2146lz c2146lzA01 = c1782fz.A01();
        if (c2146lzA01 != null) {
            abstractC1734fDA00.A1y(c2146lzA01.A06());
        }
        return abstractC1734fDA00;
    }

    private C2086kz A03(C0958Hi c0958Hi) {
        return this.A00 != null ? this.A00 : new C2086kz(c0958Hi);
    }

    private void A08(C0958Hi c0958Hi, C07167i c07167i) {
        C1758fb playableData = c07167i.A32().A0I().A07();
        A0B(playableData != null ? playableData.A0I() : EnumC2622tm.A06);
        KY ky2 = new KY(this);
        C2086kz c2086kz = new C2086kz(c0958Hi);
        boolean z11 = C2203mv.A2H(c0958Hi) && C2051kP.A0A(c07167i.A1x());
        if (z11) {
            C2051kP unifiedAssetsLoader = new C2051kP(c2086kz, c07167i.A1x(), c07167i.A1c(), c07167i.A1r(), z11, new KX(this));
            c2086kz.A0e(new C2232nO(c07167i.A37(), c0958Hi.A0A()));
            unifiedAssetsLoader.A0B();
            return;
        }
        AbstractC1779fw.A02(c0958Hi, c07167i, true, ky2);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0096  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A09(C0958Hi c0958Hi, EnumSet<CacheFlag> enumSet, LA la2, int i5, InterfaceC1767fk interfaceC1767fk) {
        Iterator<C2278oA> it;
        boolean isDSL = la2.A2Q();
        C2086kz c2086kzA03 = A03(c0958Hi);
        c2086kzA03.A0e(new C2232nO(la2.A37(), c0958Hi.A0A()));
        boolean z11 = C2203mv.A2H(c0958Hi) && C2051kP.A0A(la2.A1x());
        if (A06[3].length() == 32) {
            throw new RuntimeException();
        }
        A06[5] = "QkQhg";
        if (z11) {
            new C2051kP(c2086kzA03, la2.A1x(), la2.A1c(), la2.A1r(), z11, new C1039Ko(this, c0958Hi, isDSL, la2, interfaceC1767fk)).A0B();
            return;
        }
        String strA04 = A04(96, 12, 17);
        String[] strArr = A06;
        if (strArr[1].charAt(24) != strArr[0].charAt(24)) {
            String[] strArr2 = A06;
            strArr2[1] = "jVhVjw8PHVLop7GyU0UYPYiA56KfUjA6";
            strArr2[0] = "lzrrt2iICm45JkiVqVLOf6p257fg56KP";
            if (isDSL) {
                C2082kv c2082kv = new C2082kv(la2.A1Y(), la2.A1r(), strA04);
                c2082kv.A04 = true;
                c2082kv.A03 = A04(0, 5, 17);
                c2086kzA03.A0Y(c2082kv);
            }
        } else {
            String[] strArr3 = A06;
            strArr3[7] = "mMtIDEEqjJJ695eeXDndb9bWh";
            strArr3[4] = "Ebj8lqyUqzLrB8iZ5jF9tO70n";
            if (isDSL) {
            }
        }
        c2086kzA03.A0d(new C2084kx(la2.A35().A01(), C2329p0.A04, C2329p0.A04, la2.A1r(), A04(96, 12, 17)));
        boolean isUnifiedAssetsLoaderEnabled = enumSet.contains(CacheFlag.VIDEO);
        int i11 = 0;
        boolean zA33 = C2203mv.A33(c0958Hi, C1576cd.A03());
        for (C1735fE c1735fE : la2.A39()) {
            String strA08 = c1735fE.A0I().A08();
            if (strA08 != null) {
                C2084kx c2084kx = new C2084kx(strA08, AbstractC1775fs.A00(c1735fE.A0I()), AbstractC1775fs.A01(c1735fE.A0I()), la2.A1r(), A04(96, 12, 17));
                if (i11 == 0) {
                    c2086kzA03.A0c(c2084kx);
                } else {
                    c2086kzA03.A0d(c2084kx);
                }
            }
            Iterator<String> it2 = c1735fE.A0L().A03().iterator();
            while (it2.hasNext()) {
                c2086kzA03.A0d(new C2084kx(it2.next(), -1, -1, la2.A1r(), A04(96, 12, 17)));
            }
            if (isUnifiedAssetsLoaderEnabled && !TextUtils.isEmpty(c1735fE.A0I().A09())) {
                C2082kv c2082kv2 = new C2082kv(c1735fE.A0I().A09(), la2.A1r(), A04(96, 12, 17), c1735fE.A0I().A06());
                c2082kv2.A04 = false;
                if (i11 == 0) {
                    if (isDSL && !zA33) {
                        c2086kzA03.A0Y(c2082kv2);
                    } else {
                        c2086kzA03.A0b(c2082kv2);
                    }
                } else if (isDSL && !zA33) {
                    c2086kzA03.A0Z(c2082kv2);
                } else {
                    c2086kzA03.A0a(c2082kv2);
                }
            }
            i11++;
        }
        Iterator<C1952io> it3 = la2.A1w().iterator();
        while (it3.hasNext()) {
            c2086kzA03.A0d(new C2084kx(it3.next().A02(), -1, -1, la2.A1r(), A04(96, 12, 17)));
        }
        List<C2278oA> listA1v = la2.A1v();
        if (A06[5].length() != 5) {
            it = listA1v.iterator();
        } else {
            String[] strArr4 = A06;
            strArr4[1] = "1nyfEMUepOevYMJugZMvnGL65TcEtQKO";
            strArr4[0] = "8oN0yixDNSHwX0PkZXBy1Qxe5JRM3g8f";
            it = listA1v.iterator();
        }
        while (it.hasNext()) {
            c2086kzA03.A0d(new C2084kx(it.next().A02(), -1, -1, la2.A1r(), A04(96, 12, 17)));
        }
        if (la2.A2D() && !TextUtils.isEmpty(la2.A1d())) {
            c2086kzA03.A0d(new C2084kx(la2.A1d(), C0922Fy.A0A, C0922Fy.A0A, la2.A1r(), A04(96, 12, 17)));
        }
        AbstractC1774fr.A00(la2, c2086kzA03, strA04);
        c2086kzA03.A0X(new C1032Kh(this, c0958Hi, isDSL, la2, interfaceC1767fk), new C2079ks(la2.A1r(), strA04, i5));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0A(C0958Hi c0958Hi, EnumSet<CacheFlag> enumSet, C1048Kz c1048Kz, LA la2, int i5, InterfaceC1767fk interfaceC1767fk) {
        A09(c0958Hi, enumSet, la2, i5, new C1043Ks(this, c0958Hi, la2, c1048Kz, i5, interfaceC1767fk, enumSet));
    }

    private void A0B(EnumC2622tm enumC2622tm) {
        this.A01 = enumC2622tm;
    }

    private boolean A0C(C0958Hi c0958Hi, LA la2) {
        AdError adErrorA00 = A00(c0958Hi, la2);
        if (adErrorA00 != null) {
            InterfaceC1767fk interfaceC1767fk = this.A04;
            String[] strArr = A06;
            if (strArr[1].charAt(24) != strArr[0].charAt(24)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A06;
            strArr2[1] = "Dm6wm58uJ8qXwjtNx8Vtzbsb5Jkw9mit";
            strArr2[0] = "fLwuuFNg4tiwPdo6hP9t6x3v5l5Hcavg";
            interfaceC1767fk.ADk(adErrorA00);
            return true;
        }
        return false;
    }

    public final AbstractC1734fD A0D() {
        return this.A03;
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x00a8, code lost:
    
        if (r3 != false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00b4, code lost:
    
        if (r3 != false) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00b9, code lost:
    
        return com.facebook.ads.redexgen.X.EnumC2295oR.A0D;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final EnumC2295oR A0E() {
        if (this.A03.A2L()) {
            return EnumC2295oR.A05;
        }
        LA la2 = (LA) this.A03;
        String[] strArr = A06;
        if (strArr[6].length() != strArr[2].length()) {
            A06[3] = "f4kXngrP8CD5dz";
            if (la2.A2Q()) {
                return EnumC2295oR.A07;
            }
            if (la2.A39().size() > 1) {
                EnumC2295oR enumC2295oR = EnumC2295oR.A0B;
                String[] strArr2 = A06;
                if (strArr2[7].length() == strArr2[4].length()) {
                    A06[3] = "ny";
                    return enumC2295oR;
                }
            } else {
                if (la2.A32().A0I().A07() != null) {
                    boolean zA2Z = la2.A2Z();
                    String[] strArr3 = A06;
                    if (strArr3[6].length() == strArr3[2].length()) {
                        throw new RuntimeException();
                    }
                    A06[3] = "JH";
                    if (!zA2Z) {
                        boolean zA2m = la2.A2m();
                        if (A06[3].length() != 32) {
                            String[] strArr4 = A06;
                            strArr4[1] = "93R6MUXHMTxUt8WfLt1oZ3ea5zubl3sl";
                            strArr4[0] = "9xXPI1nVQC4CSUB4soKlPH985bh9DAt9";
                        } else {
                            A06[3] = "ySAy4b6nQ";
                        }
                    }
                    return EnumC2295oR.A0F;
                }
                if (A0L(la2)) {
                    return EnumC2295oR.A0E;
                }
                return EnumC2295oR.A0C;
            }
        }
        throw new RuntimeException();
    }

    public final EnumC2622tm A0F() {
        return this.A01;
    }

    public final String A0G() {
        if (this.A03.A2L()) {
            return ((C1048Kz) this.A03).A32();
        }
        return ((LA) this.A03).A37();
    }

    public final void A0H() {
        this.A04.ALr();
    }

    public final void A0I(Intent intent, RewardData rewardData, String str) {
        String stringExtra;
        String stringExtra2;
        this.A03.A20(rewardData);
        this.A03.A24(str);
        EnumC2295oR enumC2295oRA0E = A0E();
        EnumC2295oR enumC2295oR = EnumC2295oR.A0B;
        String strA04 = A04(108, 8, 58);
        if (enumC2295oRA0E == enumC2295oR && this.A03.A2k() && (stringExtra2 = intent.getStringExtra(strA04)) != null) {
            AbstractC2011jl.A02(stringExtra2, (LA) this.A03);
            return;
        }
        if (A0D().A2L()) {
            if (this.A03.A2l() && (stringExtra = intent.getStringExtra(strA04)) != null) {
                AbstractC2012jm.A02(stringExtra, (C1048Kz) this.A03);
                return;
            }
            intent.putExtra(A04(77, 19, 19), this.A03);
        }
        intent.putExtra(A04(48, 14, 94), this.A03);
    }

    public final boolean A0K() {
        return this.A03.A2B();
    }

    public final boolean A0L(LA la2) {
        return !TextUtils.isEmpty(la2.A32().A0I().A09());
    }
}
