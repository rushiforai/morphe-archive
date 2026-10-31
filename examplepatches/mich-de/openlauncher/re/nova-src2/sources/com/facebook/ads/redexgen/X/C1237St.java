package com.facebook.ads.redexgen.X;

import android.media.MediaCodec;
import android.os.SystemClock;
import android.util.Log;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

/* renamed from: com.facebook.ads.redexgen.X.St, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1237St {
    public static byte[] A03;
    public static String[] A04 = {"GkcL9EPdEqn0A7PhJoI9bsH6AxvNOL5u", "KxLGmNj9tBxVzMOmsgtqIqkFwkedOK4g", "B55E1oGbrrzu1K7f7VrmSaJJuupeT3cI", "sJPWMepLD2r1nI", "wtcLGgQj4FXEjs2QwwDmyBbbBNjJkZ", "WeZkHqAtZ530WLIFPfcgOozgAqJ", "33UI6N3aU6fupkPFkce4mnEh7TXGWjHZ", "TngqUuh2ENkAcZsSEqObL56HjOXg0tNH"};
    public boolean A00 = false;
    public final ConcurrentLinkedQueue<C1235Sr> A01 = new ConcurrentLinkedQueue<>();
    public final /* synthetic */ C1238Su A02;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 99);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A03 = new byte[]{-15, 36, 15, 17, 28, 32, 21, 27, 26, -52, 35, 20, 17, 26, -52, 32, 30, 37, 21, 26, 19, -52, 32, 27, -52, 21, 26, 31, 32, 13, 26, 32, 21, 13, 32, 17, -52, -47, 31, -26, -52, -47, 31, 38, 62, 61, 66, 58, 28, 72, 61, 62, 60, 41, 72, 72, 69, 40, 73, 77, 66, 70, 66, 83, 62, 61, 56, 69, 69, 66, 69, 0, 74, 59, 60, 63, 56, 0, 69, 56, 63, 56, 52, 70, 56, 0, 54, 66, 55, 56, 54, 0, 57, 69, 66, 64, 0, 70, 56, 71, 0, 57, 60, 65, 52, 63, 63, 76, 13, -13, -8, 70, 32, 45, 45, 42, 45, -24, 50, 35, 36, 39, 32, -24, 45, 32, 39, 32, 28, 46, 32, -24, 30, 42, 31, 32, 30, -24, 33, 45, 42, 40, -24, 46, 32, 47, -11, -37, -32, 46, 18, 37, 28, 29, 25, 14, 38, 18, 31, -33, -37, 14, 35, -34, -37, 32, 31, 16, -37, -15, 14, 35, -34, 17, -6, 18, 17, 22, 14, -16, 28, 17, 18, 16, -18, 17, 14, 29, 33, 18, 31};
    }

    static {
        A05();
    }

    public C1237St(C1238Su c1238Su) {
        this.A02 = c1238Su;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public InterfaceC1231Sn A02(boolean z11, C1341Xc c1341Xc, EnumC1346Xh enumC1346Xh, String str) throws Exception {
        Set<InterfaceC1231Sn> set;
        if (this.A02.A0I(z11, c1341Xc) && C1238Su.A0G(str, c1341Xc)) {
            synchronized (this.A02.A04) {
                set = this.A02.A04.get(str);
            }
            if (set != null) {
                synchronized (set) {
                    if (!set.isEmpty()) {
                        C1238Su c1238Su = this.A02;
                        c1238Su.A00--;
                        Iterator<InterfaceC1231Sn> it = set.iterator();
                        InterfaceC1231Sn ret = it.next();
                        it.remove();
                        this.A02.A03().A0A(z11, str, enumC1346Xh, ret.hashCode());
                        return ret;
                    }
                }
            }
        }
        try {
            C1347Xi c1347XiA05 = this.A02.A03().A05(z11, str, enumC1346Xh);
            InterfaceC1231Sn interfaceC1231SnA03 = A03(z11, str);
            this.A02.A03().A06(c1347XiA05, interfaceC1231SnA03.hashCode());
            return interfaceC1231SnA03;
        } catch (Exception e3) {
            throw new C1348Xj(str, e3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public InterfaceC1231Sn A03(boolean z11, String str) throws Exception {
        String strA04 = A04(PerAppFeatureCatalog.MAX_TOOLS, 41, 74);
        if (z11 && C1238Su.A0E(str)) {
            try {
                return (InterfaceC1231Sn) Class.forName(strA04).getConstructor(new Class[0]).newInstance(new Object[0]);
            } catch (Exception e3) {
                String str2 = String.format(A04(0, 43, 73), strA04, e3.getMessage());
                if (A04[7].charAt(0) != 'T') {
                    throw new RuntimeException();
                }
                A04[1] = "88UhswHBE5yWXNxnehnu2gljXz9gtbeq";
                Log.w(A04(43, 23, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), str2);
            }
        }
        return new S5(MediaCodec.createByCodecName(str));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: A07, reason: merged with bridge method [inline-methods] */
    public void A0B(EnumC1346Xh enumC1346Xh) {
        String strA04;
        String str;
        C1238Su c1238Su;
        Set<InterfaceC1231Sn> set;
        Iterator<C1235Sr> it = this.A01.iterator();
        while (it.hasNext()) {
            C1235Sr next = it.next();
            try {
                try {
                    if (!next.A05) {
                        A08(next.A01, enumC1346Xh, Boolean.valueOf(next.A04), next.A00);
                    } else {
                        try {
                            try {
                                this.A02.A05 = SystemClock.elapsedRealtime();
                                next.A00.reset();
                                c1238Su = this.A02;
                            } catch (Throwable th2) {
                                this.A02.A05 = -1L;
                                throw th2;
                            }
                        } catch (IllegalStateException unused) {
                            A09(next.A02, next.A00);
                            c1238Su = this.A02;
                        }
                        c1238Su.A05 = -1L;
                        if (next.A03) {
                            synchronized (this.A02.A04) {
                                set = this.A02.A04.get(next.A02);
                            }
                            if (set != null) {
                                synchronized (set) {
                                    set.add(next.A00);
                                    this.A02.A00++;
                                }
                            }
                        }
                    }
                } catch (Exception e3) {
                    Log.w(A04(43, 23, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), String.format(A04(112, 38, 88), e3.getMessage()));
                    try {
                        synchronized (this.A01) {
                            this.A01.remove(next);
                        }
                    } catch (Exception e11) {
                        strA04 = A04(43, 23, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                        str = String.format(A04(66, 46, 112), e11.getMessage());
                        Log.w(strA04, str);
                    }
                }
                try {
                    synchronized (this.A01) {
                        this.A01.remove(next);
                    }
                } catch (Exception e12) {
                    strA04 = A04(43, 23, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                    str = String.format(A04(66, 46, 112), e12.getMessage());
                    Log.w(strA04, str);
                }
            } catch (Throwable th3) {
                try {
                } catch (Exception e13) {
                    Log.w(A04(43, 23, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), String.format(A04(66, 46, 112), e13.getMessage()));
                }
                synchronized (this.A01) {
                    this.A01.remove(next);
                    throw th3;
                }
            }
        }
    }

    private void A08(C1341Xc c1341Xc, EnumC1346Xh enumC1346Xh, Boolean bool, InterfaceC1231Sn interfaceC1231Sn) {
        try {
            if (!c1341Xc.A0Y || (!bool.booleanValue() && !c1341Xc.A0X)) {
                interfaceC1231Sn.stop();
            }
        } finally {
            this.A02.A03().A08(enumC1346Xh, interfaceC1231Sn.hashCode());
            interfaceC1231Sn.AIp();
            this.A02.A03().A07(enumC1346Xh, interfaceC1231Sn.hashCode());
        }
    }

    private void A09(String str, InterfaceC1231Sn interfaceC1231Sn) {
        Set<InterfaceC1231Sn> set;
        synchronized (this.A02.A04) {
            set = this.A02.A04.get(str);
        }
        if (set != null) {
            synchronized (set) {
                if (set.remove(interfaceC1231Sn)) {
                    C1238Su c1238Su = this.A02;
                    c1238Su.A00--;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:120:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x0110  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A0A(boolean z11, C1341Xc c1341Xc, final EnumC1346Xh enumC1346Xh, String str, InterfaceC1231Sn interfaceC1231Sn) throws Throwable {
        boolean z12 = false;
        if (this.A02.A0I(z11, c1341Xc) && C1238Su.A0G(str, c1341Xc)) {
            if (c1341Xc.A0P && !this.A00) {
                this.A00 = true;
                Executors.newSingleThreadScheduledExecutor().scheduleAtFixedRate(new Runnable() { // from class: com.facebook.ads.redexgen.X.Ss
                    @Override // java.lang.Runnable
                    public final void run() {
                        this.A00.A0B(enumC1346Xh);
                    }
                }, 5L, Math.max(1000, c1341Xc.A08), TimeUnit.MILLISECONDS);
            }
            boolean z13 = true;
            Set<InterfaceC1231Sn> setA06 = null;
            if (this.A02.A00 < c1341Xc.A07) {
                synchronized (this.A02.A04) {
                    setA06 = this.A02.A04.get(str);
                    if (setA06 == null) {
                        setA06 = this.A02.A06();
                        this.A02.A04.put(str, setA06);
                    }
                }
                synchronized (setA06) {
                    if (setA06.contains(interfaceC1231Sn)) {
                        z13 = false;
                    } else if (((z11 && c1341Xc.A0T) || (!z11 && c1341Xc.A0R)) && setA06.size() < c1341Xc.A06) {
                        z12 = true;
                        z13 = false;
                    }
                }
            }
            if (!z13) {
                long j11 = -1;
                try {
                    try {
                        try {
                            if (!c1341Xc.A0P) {
                                try {
                                    this.A02.A05 = SystemClock.elapsedRealtime();
                                    interfaceC1231Sn.reset();
                                    if (z12 && setA06 != null) {
                                        synchronized (setA06) {
                                            setA06.add(interfaceC1231Sn);
                                            this.A02.A00++;
                                        }
                                    }
                                    if (!c1341Xc.A0P) {
                                        return;
                                    }
                                    this.A02.A05 = -1L;
                                    return;
                                } catch (Throwable th2) {
                                    th = th2;
                                    if (!c1341Xc.A0P) {
                                        this.A02.A05 = j11;
                                    }
                                    throw th;
                                }
                            }
                            try {
                                C1235Sr c1235Sr = new C1235Sr(interfaceC1231Sn, c1341Xc, str, z11, z12, true);
                                synchronized (this.A01) {
                                    try {
                                        this.A01.add(c1235Sr);
                                    } catch (Throwable th3) {
                                        th = th3;
                                        while (true) {
                                            try {
                                                throw th;
                                            } catch (Throwable th4) {
                                                th = th4;
                                            }
                                        }
                                    }
                                }
                                if (!c1341Xc.A0P) {
                                }
                            } catch (IllegalStateException unused) {
                                j11 = -1;
                                A09(str, interfaceC1231Sn);
                                if (!c1341Xc.A0P) {
                                    this.A02.A05 = j11;
                                }
                                if (c1341Xc.A0P) {
                                }
                            } catch (Throwable th5) {
                                th = th5;
                                j11 = -1;
                                if (!c1341Xc.A0P) {
                                }
                                throw th;
                            }
                        } catch (Throwable th6) {
                            th = th6;
                        }
                    } catch (IllegalStateException unused2) {
                    }
                } catch (Throwable th7) {
                    th = th7;
                }
            }
        }
        if (c1341Xc.A0P) {
            A08(c1341Xc, enumC1346Xh, Boolean.valueOf(z11), interfaceC1231Sn);
            return;
        }
        C1235Sr c1235Sr2 = new C1235Sr(interfaceC1231Sn, c1341Xc, str, z11, false, false);
        synchronized (this.A01) {
            this.A01.add(c1235Sr2);
        }
    }
}
