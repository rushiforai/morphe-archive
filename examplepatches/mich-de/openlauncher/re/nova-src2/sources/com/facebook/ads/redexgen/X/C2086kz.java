package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.kz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2086kz {
    public static InterfaceC1612dD A0A;
    public static List<String> A0B;
    public static byte[] A0C;
    public static String[] A0D = {"8gkZjHnxCvZyg7TzwjjGeSdvls9L7Gam", "fcbSC3ja3K2jNylkxCBC51G6bXitMdQ0", "2foOCT", "ocB0m3", "KfMQJM794wt5IuG", "feDb68pnVWWOEqV45c", "KnEa0S3Tnigt4irEXno07XBXpnYxFsFq", "aK1UKkDbG3zR1xh0x3umKxUvmkPLseuR"};
    public static final String A0E;
    public static final Map<String, C1618dJ> A0F;
    public static final Map<String, C2088l1> A0G;
    public long A00;
    public C2232nO A01;
    public final C2087l0 A03;
    public final C2095lA A04;
    public final boolean A08;
    public final boolean A09;
    public final Map<String, Bitmap> A07 = Collections.synchronizedMap(new HashMap());
    public final Handler A02 = new Handler(Looper.getMainLooper());
    public final List<Callable<Boolean>> A05 = new ArrayList();
    public final List<Callable<Boolean>> A06 = new ArrayList();

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 10);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static AtomicBoolean A0D(ArrayList<Callable<Boolean>> arrayList) {
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        Iterator<Callable<Boolean>> it = arrayList.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            String[] strArr = A0D;
            if (strArr[3].length() != strArr[2].length()) {
                throw new RuntimeException();
            }
            A0D[5] = b.f42142b;
            if (!zHasNext) {
                AtomicBoolean atomicBoolean = new AtomicBoolean(true);
                try {
                    Iterator it2 = arrayList2.iterator();
                    while (it2.hasNext()) {
                        Boolean bool = (Boolean) ((Future) it2.next()).get();
                        atomicBoolean.set(atomicBoolean.get() && bool != null && bool.booleanValue());
                    }
                } catch (InterruptedException | ExecutionException e3) {
                    Log.e(A0E, A08(86, 42, 61), e3);
                    atomicBoolean.set(false);
                }
                return atomicBoolean;
            }
            arrayList2.add(ExecutorC2431qh.A02().submit(it.next()));
        }
    }

    public static void A0F() {
        A0C = new byte[]{124, 125, 125, 125, -81, -82, -128, AbstractJsonLexerKt.TC_INVALID, 109, 107, -104, -105, 110, -104, 103, 103, 84, -126, 80, 126, 77, 86, 126, 81, -119, -89, -87, -82, -85, 102, -71, -70, -89, -72, -70, -85, -86, 116, -113, -83, -81, -76, -75, -70, -77, 108, -81, -69, -71, -68, -72, -79, -64, -79, AbstractJsonLexerKt.TC_INVALID, -99, -97, -92, -91, -86, -93, 92, -94, -99, -91, -88, -95, -96, 100, -126, -124, -119, -118, -113, -120, 65, -108, -107, -126, -109, -107, -122, -123, 79, 79, 79, -116, -65, -86, -84, -73, -69, -80, -74, -75, 103, -66, -81, -80, -77, -84, 103, -84, -65, -84, -86, -68, -69, -80, -75, -82, 103, -86, -88, -86, -81, -84, 103, -85, -74, -66, -75, -77, -74, -88, -85, -70, 117, -79, -81, -79, -74, -77, -111, -67, -69, -66, -70, -77, -62, -73, -67, -68, -106, -67, -67, -71, 120, 118, 120, 125, 122, 91, 118, 126, -127, -118, -121, 122, 93, -124, -124, -128, -120, -101, -120, -122, -104, -105, -120, -24, -21, -35, -32, -27, -24, -38, -35, -40, -19, -30, -26, -34, -40, -26, -20, -96, -107, -100, -92};
    }

    static {
        A0F();
        A0E = C2086kz.class.getSimpleName();
        A0F = Collections.synchronizedMap(new HashMap());
        A0G = Collections.synchronizedMap(new HashMap());
    }

    public C2086kz(C2095lA c2095lA) {
        this.A04 = c2095lA;
        this.A03 = C2087l0.A06(c2095lA.A02());
        this.A08 = C2203mv.A2t(c2095lA);
        this.A09 = C2203mv.A32(c2095lA, C1576cd.A03());
    }

    public static synchronized InterfaceC1612dD A03(C0957Hh c0957Hh) {
        if (A0A == null) {
            A0A = AbstractC1613dE.A00(c0957Hh, new C1619dK().A00(C2203mv.A04(c0957Hh)).A02(c0957Hh.A05().AB6()).A01(-1).A03(C2203mv.A0o(c0957Hh)).A04(C2203mv.A31(c0957Hh)).A05(), A05(c0957Hh));
        }
        return A0A;
    }

    public static C1618dJ A04(C2095lA c2095lA, String str) {
        C1618dJ c1618dJ = A0F.get(str);
        if (C2089l2.A06(c2095lA) && c1618dJ != null) {
            C1618dJ storedCacheData = new C1618dJ(c1618dJ);
            return storedCacheData;
        }
        C1618dJ storedCacheData2 = new C1618dJ(str);
        return storedCacheData2;
    }

    public static C0962Hm A05(C0957Hh c0957Hh) {
        return new C0962Hm(c0957Hh);
    }

    public static synchronized List<String> A09(C2095lA c2095lA) {
        if (A0B == null) {
            A0B = new ArrayList();
            A0J(A0B, c2095lA);
        }
        return A0B;
    }

    public static void A0H(C2095lA c2095lA, String str) {
        C2088l1 c2088l1;
        if (C2089l2.A06(c2095lA) && !TextUtils.isEmpty(str) && (c2088l1 = A0G.get(str)) != null) {
            c2088l1.A00 = A08(186, 4, 35);
            C0957Hh c0957HhA02 = c2095lA.A02();
            C1562cP c1562cPA06 = C1562cP.A06(c0957HhA02);
            String strA09 = C1562cP.A09(c0957HhA02, AbstractC2351pP.A00(str));
            if (strA09 == null) {
                strA09 = str;
            }
            C2089l2.A04(c2095lA, c2088l1, c1562cPA06.A0J(strA09));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0I(EnumC2231nN enumC2231nN) {
        if (this.A01 == null) {
            return;
        }
        HashMap map = new HashMap();
        map.put(A08(174, 12, 111), C2416qS.A05(this.A00));
        this.A01.A04(enumC2231nN, map);
    }

    public static void A0J(List<String> cacheDirs, C2095lA c2095lA) {
        A0K(cacheDirs, NI.A01(c2095lA));
        A0K(cacheDirs, C2087l0.A07(c2095lA));
    }

    public static void A0K(List<String> list, File file) {
        String path;
        if (file == null || (path = file.getPath()) == null) {
            return;
        }
        String[] strArr = A0D;
        String str = strArr[3];
        String path2 = strArr[2];
        if (str.length() != path2.length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0D;
        strArr2[3] = "Vghlgc";
        strArr2[2] = "qwUey9";
        String path3 = A08(0, 0, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        if (path != path3) {
            String path4 = path.toLowerCase(Locale.getDefault());
            list.add(path4);
        }
    }

    public final float A0M(String str) {
        return this.A03.A0E(str);
    }

    public final Bitmap A0N(String str) {
        return this.A07.get(str);
    }

    public final Bitmap A0O(String str, int i5, int i11) {
        if (this.A08) {
            C1618dJ c1618dJA04 = A04(this.A04, str);
            c1618dJA04.A03 = A08(186, 4, 35);
            c1618dJA04.A01 = i11;
            c1618dJA04.A00 = i5;
            return A03(this.A04.A02()).AJw(c1618dJA04, true).A00();
        }
        return this.A03.A0G(this.A04, str, i5, i11, A08(170, 4, 114));
    }

    public final File A0P(String str) {
        C1618dJ c1618dJA04 = A04(this.A04, str);
        c1618dJA04.A03 = A08(186, 4, 35);
        return A03(this.A04.A02()).AJx(c1618dJA04);
    }

    public final File A0Q(String str) {
        if (this.A08) {
            return A0P(str);
        }
        return this.A03.A0H(str);
    }

    public final String A0R(String str) {
        if (this.A08) {
            return A0S(str);
        }
        return this.A03.A0I(str);
    }

    public final String A0S(String str) {
        C1618dJ c1618dJA04 = A04(this.A04, str);
        c1618dJA04.A03 = A08(186, 4, 35);
        String strAJz = A03(this.A04.A02()).AJz(c1618dJA04);
        return strAJz != null ? strAJz : str;
    }

    public final String A0T(String str) {
        if (this.A09) {
            A0H(this.A04, str);
            return str;
        }
        return A0S(str);
    }

    public final void A0U() {
        AbstractC2273o5.A05(A08(128, 19, 68), A08(38, 16, 66), A08(0, 8, 64));
    }

    public final void A0V() {
        AbstractC2273o5.A05(A08(147, 16, 11), A08(54, 14, 50), A08(16, 8, 19));
    }

    public final void A0W() {
        this.A07.clear();
    }

    public final void A0X(InterfaceC2078kr interfaceC2078kr, C2079ks c2079ks) {
        AbstractC2273o5.A05(A08(163, 7, 25), A08(68, 18, 23), A08(8, 8, 44));
        this.A00 = System.currentTimeMillis();
        C2089l2.A02(this.A04, c2079ks, C2089l2.A07, A08(24, 14, 60), -1L);
        ExecutorC2431qh.A03().execute(new C0963Hn(this, new ArrayList(this.A05), c2079ks, interfaceC2078kr, new ArrayList(this.A06)));
        this.A05.clear();
        this.A06.clear();
    }

    public final void A0Y(C2082kv c2082kv) {
        this.A05.add(new CallableC2083kw(this, c2082kv));
    }

    public final void A0Z(C2082kv c2082kv) {
        c2082kv.A05 = true;
        this.A06.add(new CallableC2083kw(this, c2082kv));
    }

    public final void A0a(C2082kv c2082kv) {
        c2082kv.A05 = true;
        if (this.A09) {
            this.A06.add(new CallableC2081ku(this, c2082kv));
        } else {
            this.A06.add(new CallableC2083kw(this, c2082kv));
        }
    }

    public final void A0b(C2082kv c2082kv) {
        if (this.A09) {
            this.A05.add(new CallableC2081ku(this, c2082kv));
        } else {
            this.A05.add(new CallableC2083kw(this, c2082kv));
        }
    }

    public final void A0c(C2084kx c2084kx) {
        CallableC2085ky callableC2085ky = new CallableC2085ky(this, c2084kx);
        if (!c2084kx.A03) {
            this.A05.add(callableC2085ky);
        } else {
            this.A06.add(callableC2085ky);
        }
    }

    public final void A0d(C2084kx c2084kx) {
        c2084kx.A03 = true;
        A0c(c2084kx);
    }

    public final void A0e(C2232nO c2232nO) {
        this.A01 = c2232nO;
    }
}
