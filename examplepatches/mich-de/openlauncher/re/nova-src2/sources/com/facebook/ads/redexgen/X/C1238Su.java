package com.facebook.ads.redexgen.X;

import android.os.SystemClock;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.Su, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1238Su {
    public static byte[] A06;
    public static String[] A07 = {"pSdLAabVJhqo7QB", "504ZY1AuKgNOiNBWtmEDc4VNIn9M1Am", "5Zl8ARr", "3vpm0W2HV", "koFPP", "dusBklPSZ06TUnBE7Ond9ns", "pdB1RHpxrB8GMHOKLZJpUDiRkcqMNya4", "7Flzf08JBPT5P838Pw8mNc"};
    public static final C1238Su A08;

    @Nullable
    public AbstractC1345Xg A01;

    @Nullable
    public Boolean A02;
    public volatile Map<String, Set<InterfaceC1231Sn>> A04 = new HashMap();
    public final C1237St A03 = new C1237St(this);
    public int A00 = 0;
    public volatile long A05 = -1;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A06, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 70);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        byte[] bArr = {50, 42, 57, 38, -13, 41, 38, 59, -10, 41, -13, 38, 59, -10, -13, 41, 42, 40, 52, 41, 42, 55};
        String[] strArr = A07;
        if (strArr[7].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        A07[5] = "AysKoXJUbI28ptcFU7Ec0EF";
        A06 = bArr;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private void A0C(boolean z11, C1341Xc c1341Xc, EnumC1346Xh enumC1346Xh, String str, InterfaceC1231Sn interfaceC1231Sn) {
        if (A0I(z11, c1341Xc) && A0G(str, c1341Xc)) {
            boolean z12 = true;
            synchronized (this) {
                if (this.A00 < c1341Xc.A07) {
                    Set<InterfaceC1231Sn> setA06 = this.A04.get(str);
                    if (setA06 == null) {
                        setA06 = A06();
                        this.A04.put(str, setA06);
                    }
                    if (setA06.contains(interfaceC1231Sn)) {
                        z12 = false;
                    } else if (((z11 && c1341Xc.A0T) || (!z11 && c1341Xc.A0R)) && setA06.size() < c1341Xc.A06) {
                        setA06.add(interfaceC1231Sn);
                        this.A00++;
                        z12 = false;
                    }
                }
                if (!z12) {
                    try {
                        try {
                            this.A05 = SystemClock.elapsedRealtime();
                            interfaceC1231Sn.reset();
                            A03().A09(enumC1346Xh, interfaceC1231Sn.hashCode());
                            return;
                        } catch (IllegalStateException unused) {
                            A0B(str, interfaceC1231Sn);
                        }
                    } finally {
                        this.A05 = -1L;
                    }
                }
            }
        }
        try {
            if (!c1341Xc.A0Y || (!z11 && !c1341Xc.A0X)) {
                interfaceC1231Sn.stop();
            }
        } finally {
            A03().A08(enumC1346Xh, interfaceC1231Sn.hashCode());
            interfaceC1231Sn.AIp();
            A03().A07(enumC1346Xh, interfaceC1231Sn.hashCode());
        }
    }

    static {
        A08();
        A08 = new C1238Su();
    }

    private InterfaceC1231Sn A01(boolean z11, C1341Xc c1341Xc, EnumC1346Xh enumC1346Xh, String str) throws Exception {
        if (A0I(z11, c1341Xc) && A0G(str, c1341Xc)) {
            synchronized (this) {
                Set<InterfaceC1231Sn> set = this.A04.get(str);
                if (set != null && !set.isEmpty()) {
                    this.A00--;
                    Iterator<InterfaceC1231Sn> it = set.iterator();
                    InterfaceC1231Sn ret = it.next();
                    it.remove();
                    A03().A0A(z11, str, enumC1346Xh, ret.hashCode());
                    return ret;
                }
            }
        }
        try {
            C1347Xi c1347XiA05 = A03().A05(z11, str, enumC1346Xh);
            InterfaceC1231Sn interfaceC1231SnA03 = this.A03.A03(z11, str);
            A03().A06(c1347XiA05, interfaceC1231SnA03.hashCode());
            return interfaceC1231SnA03;
        } catch (Exception e3) {
            throw new C1348Xj(str, e3);
        }
    }

    public static C1238Su A02() {
        return A08;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public AbstractC1345Xg A03() {
        if (this.A01 != null) {
            return this.A01;
        }
        return A8.A02;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Set<InterfaceC1231Sn> A06() {
        if (this.A02 != null && this.A02.booleanValue()) {
            return new CopyOnWriteArraySet();
        }
        return new HashSet();
    }

    private void A09(AbstractC1345Xg abstractC1345Xg) {
        if (this.A01 == null) {
            this.A01 = abstractC1345Xg;
        }
    }

    private void A0A(C1341Xc c1341Xc) {
        if (this.A02 == null) {
            synchronized (this) {
                if (this.A02 == null) {
                    this.A02 = Boolean.valueOf(c1341Xc.A0Z);
                    if (this.A02.booleanValue()) {
                        this.A04 = new ConcurrentHashMap();
                    }
                }
            }
        }
    }

    private void A0B(String str, InterfaceC1231Sn interfaceC1231Sn) {
        Set<InterfaceC1231Sn> set = this.A04.get(str);
        if (set != null && set.remove(interfaceC1231Sn)) {
            this.A00--;
        }
    }

    public static boolean A0E(String str) {
        return str.equals(A05(0, 22, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
    }

    public static boolean A0G(String str, C1341Xc c1341Xc) {
        if (!A0E(str)) {
            return true;
        }
        boolean z11 = c1341Xc.A0D;
        if (A07[5].length() != 23) {
            throw new RuntimeException();
        }
        A07[5] = "nwAzwGEiO0ZIWdxLaYMsKGp";
        if (z11) {
            return false;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0I(boolean z11, C1341Xc c1341Xc) {
        if (c1341Xc.A0F && this.A05 != -1) {
            long jElapsedRealtime = SystemClock.elapsedRealtime();
            long j11 = this.A05;
            String[] strArr = A07;
            if (strArr[3].length() == strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A07;
            strArr2[3] = "0y00mGdSc";
            strArr2[1] = "YbKfGYgoQHCL7FNckkRcEOTrXyIiST7";
            if (jElapsedRealtime - j11 > 5000) {
                return false;
            }
        }
        return A0J(z11, c1341Xc);
    }

    public static boolean A0J(boolean z11, C1341Xc c1341Xc) {
        return (z11 && c1341Xc.A0T) || (!z11 && c1341Xc.A0R);
    }

    public final InterfaceC1231Sn A0K(boolean z11, C1341Xc c1341Xc, AbstractC1345Xg abstractC1345Xg, EnumC1346Xh enumC1346Xh, String str) throws C1348Xj {
        A09(abstractC1345Xg);
        A0A(c1341Xc);
        if (c1341Xc.A0O) {
            return this.A03.A02(z11, c1341Xc, enumC1346Xh, str);
        }
        return A01(z11, c1341Xc, enumC1346Xh, str);
    }

    public final void A0L(boolean z11, C1341Xc c1341Xc, AbstractC1345Xg abstractC1345Xg, EnumC1346Xh enumC1346Xh, String str, InterfaceC1231Sn interfaceC1231Sn) throws Throwable {
        A09(abstractC1345Xg);
        if (c1341Xc.A0O) {
            this.A03.A0A(z11, c1341Xc, enumC1346Xh, str, interfaceC1231Sn);
        } else {
            A0C(z11, c1341Xc, enumC1346Xh, str, interfaceC1231Sn);
        }
    }
}
