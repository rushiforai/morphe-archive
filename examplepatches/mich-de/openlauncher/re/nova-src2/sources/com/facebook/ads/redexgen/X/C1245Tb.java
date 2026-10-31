package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import android.util.Base64;
import android.view.View;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.Tb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1245Tb {
    public static byte[] A0P;
    public static final Runnable A0Q;
    public static final AtomicInteger A0R;
    public static final AtomicInteger A0S;
    public View A02;
    public InterfaceC2761w1 A04;
    public YJ A05;
    public UO A06;
    public C1J A07;
    public C1539c2 A08;
    public Runnable A09;
    public final int A0D;
    public final LA A0E;
    public final C2086kz A0F;
    public final C0958Hi A0G;
    public final InterfaceC2224nG A0H;
    public final C2232nO A0I;
    public final C2758vy A0J;
    public final C0870Dx A0K;
    public final C2B A0L;
    public final AnonymousClass26 A0M;
    public final LinkedList<C1392Ze> A0O = new LinkedList<>();
    public C2417qT A03 = new C2417qT();
    public boolean A0C = true;
    public boolean A0B = false;
    public long A00 = -1;
    public final String A0N = UUID.randomUUID().toString();
    public HashMap<String, Object> A0A = new HashMap<>();
    public long A01 = System.currentTimeMillis();

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0P, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 2);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0F() {
        A0P = new byte[]{37, 63, 39, 59, 59, 39, 57, 13, 34, 40, 62, 35, 37, 40, 5, 34, 56, 41, 62, 42, 45, 47, 41, 5, 0, 54, 1, 20, 11, 22, 16, 13, 10, 3, 34, 13, 10, 13, 23, 12, 1, 0, 76, 67, 65, 23, 67, 77, 95, 96, 101, 83, 100, 113, 110, 115, 117, 104, 111, 102, 82, 117, 96, 115, 117, 100, 101, 41, 38, 36, 114, 38, 40, 58, 34, 39, 28, 47, 44, 34, 39, 28, 48, 55, 34, 49, 55, 9, 27, 27, 13, 28, 27, 55, 1, 6, 2, 13, 11, 28, 13, 12, 86, 67, 67, 86, 84, 95, 82, 83, 96, 97, 121, 66, 90, 55, 35, 34, 62, 9, 61, 51, 47, 9, 37, 51, 34, 117, 118, 99, 116, AbstractJsonLexerKt.TC_INVALID, 114, 115, 81, 101, 118, 122, 114, 83, 118, 99, 118, 40, 62, 57, 57, 46, 37, 63, 28, 29, 5, 62, 38, 88, 89, 80, 72, 93, 99, 90, 78, 83, 81, 99, 79, 72, 93, 78, 72, 99, 81, 79, 72, 95, 64, 115, 92, 73, 94, 74, 115, 88, 69, 65, 69, 66, 75, 95, 65, 85, 70, 74, 66, 84, AbstractJsonLexerKt.TC_INVALID, 99, 122, 123, 72, 123, 120, 118, 115, 72, 100, 99, 118, 101, 99, 115, 106, 70, 10, 2, 19, 6, 3, 6, 19, 6, 56, 20, 14, 29, 2, 56, 5, 30, 19, 2, 20, 81, 80, AbstractJsonLexerKt.TC_INVALID, 93, 74, 87, 72, 87, 74, 71, 110, 95, 75, 77, 91, 90, 22, 25, 27, 77, 25, 23, 5, 30, 31, 48, 18, 5, 24, 7, 24, 5, 8, 35, 20, 2, 4, 28, 20, 21, 89, 86, 84, 2, 86, 88, 74, 34, 35, 14, 33, 34, 62, 40, 11, 56, 33, 33, 62, 46, 63, 40, 40, 35, 27, 36, 40, 58, 101, 106, 104, 62, 106, 100, 60, 61, 21, 38, 63, 63, 32, 48, 33, 54, 54, 61, 5, 58, 54, 36, 123, 116, 118, 32, 116, 122, 4, 5, 61, 10, 7, 30, 14, 57, 14, 10, 15, 67, 76, 78, 24, 76, 71, 75, 76, 78, 24, 76, 71, 75, 76, 78, 24, 76, 66, 80, 23, 22, 46, 25, 20, 13, 29, 47, 10, 17, 12, 12, 29, 22, 80, 95, 93, 11, 95, 84, 88, 95, 93, 11, 95, 81, 67, 102, 112, 118, 122, 123, 113, 74, 118, 125, 116, 123, 123, 112, 121, 113, 103, 118, 67, 119, 118, 106, 73, 103, 123, 42, 37, 39, 113, 37, 46, 37, 39, 113, 37, 43, 57, 4, 18, 3, 53, 22, 4, 18, 65, 67, 54, 4, 4, 18, 3, 4, 95, 80, 82, 4, 80, 91, 80, 82, 4, 80, 94, 27, 13, 28, 42, 9, 27, 13, 94, 92, 43, 7, 6, 14, 1, 15, 64, 79, 77, 27, 79, 68, 79, 77, 27, 79, 65, 80, 70, 87, 116, 66, 87, 64, 75, 98, 77, 71, 97, 81, 76, 84, 80, 70, 96, 76, 78, 83, 66, 64, 87, 11, 4, 6, 80, 4, 15, 3, 69, 66, 79, 80, 70, 10, 24, 77, 91, 74, 105, 95, 74, 93, 86, AbstractJsonLexerKt.TC_INVALID, 80, 90, 124, 76, 81, 73, 77, 91, 125, 81, 83, 78, 95, 93, 74, 22, 25, 27, 77, 25, 18, 30, 74, 76, 75, 91, 23, 5, 70, 91, 95, 87, 65, 70, 83, 95, 66, 109, 95, 65, 37, 56, 60, 56, 63, 54, 34, 9, 18, 9, 28, 17, 42, 43, 51, 8, 16, 50, 53, 43, 50, 45, 32, 33, 43, 1, 50, 33, 42, 48, 108, 99, 97, 55, 99, 104, 100, 99, 97, 55, 99, 104, 100, 99, 97, 55, 99, 109, AbstractJsonLexerKt.TC_INVALID, 30, 1, 13, 31, 58, 13, 9, 12, 17, 60, 7, 59, 0, 7, 31, 64, 79, 77, 27, 79, 65, 83, 6, 20, 19, 7, 24, 20, 6, 46, 18, 3, 20, 16, 5, 20, 21};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 21 out of bounds for length 21
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final void A0s(Map<String, String> map) throws JSONException {
        String strA0A = A0A(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 16, 21);
        if (map.containsKey(strA0A) && C2203mv.A20(this.A0G)) {
            try {
                JSONArray jSONArray = new JSONArray(map.get(strA0A));
                ArrayList arrayList = new ArrayList();
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    JSONArray jSONArray2 = new JSONArray(jSONArray.getString(i5));
                    String string = jSONArray2.getString(0);
                    String string2 = jSONArray2.getString(1);
                    String string3 = jSONArray2.getString(2);
                    String string4 = jSONArray2.getString(3);
                    if (string != null && string2 != null && string3 != null) {
                        YF yf2 = new YF(this.A0E.A37(), Long.parseLong(string), Long.parseLong(string2), Long.parseLong(string3));
                        yf2.A06(Long.parseLong(string4));
                        arrayList.add(yf2);
                    }
                }
                String strA01 = YG.A01(arrayList);
                HashMap map2 = new HashMap();
                map2.put(A0A(190, 6, 37), strA01);
                if (strA01 != null) {
                    this.A0H.ACo(this.A0E.A37(), map2);
                }
            } catch (Exception e3) {
                this.A0G.A08().ABz(A0A(386, 14, 23), 3600, new C2127lg(e3));
            }
        }
        if (map.containsKey(strA0A)) {
            map.remove(strA0A);
        }
        this.A0H.ABy(this.A0E.A37(), new C2618ti(map).A05(this.A08).A03(this.A0G, this.A0E.A32().A0K() != null ? this.A0E.A32().A0K().A06() : null).A07());
    }

    static {
        A0F();
        A0S = new AtomicInteger();
        A0R = new AtomicInteger();
        A0Q = new Runnable() { // from class: com.facebook.ads.redexgen.X.w6
            @Override // java.lang.Runnable
            public final void run() {
            }
        };
    }

    public C1245Tb(C0958Hi c0958Hi, LA la2, InterfaceC2224nG interfaceC2224nG, int i5) {
        this.A0G = c0958Hi;
        this.A0H = interfaceC2224nG;
        this.A0E = la2;
        this.A0D = i5;
        this.A0K = new C0870Dx(this, c0958Hi);
        this.A0F = new C2086kz(this.A0G);
        this.A0I = new C2232nO(la2.A37(), interfaceC2224nG);
        this.A0J = new C2758vy(la2.A1r(), la2.A32().A0I().A09(), i5);
        this.A0M = AnonymousClass21.A00(this.A0G, la2.A1x(), this.A0F, this.A0I, this.A0J, A0J());
        this.A0L = new C2B(this.A0G, this, interfaceC2224nG, this.A0J, this.A0N, la2.A37());
        A0n(A0A(74, 13, 65));
        try {
            this.A0A.put(A0A(Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, 19, 101), Integer.valueOf(la2.A1x().toString().length()));
        } catch (Exception unused) {
        }
    }

    public static AtomicInteger A0C() {
        return A0R;
    }

    private void A0D() {
        try {
            SharedPreferences prefs = this.A0G.getSharedPreferences(A0A(174, 16, 46), 0);
            prefs.edit().putString(A0A(561, 7, 83), new JSONObject(this.A0A).toString()).apply();
        } catch (Exception unused) {
        }
    }

    private void A0E() {
        if (this.A0A != null) {
            A0n(A0A(115, 12, 84));
        }
        A0H(new C1392Ze(A0A(Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 22, 0), new String[]{this.A0N, A0A(1, 6, 11)}));
        String strReplace = Base64.encodeToString(this.A0M.A04.toString().getBytes(), 0).replace(A0A(0, 1, 45), A0A(0, 0, 109));
        String assets = this.A0N;
        A0H(new C1392Ze(A0A(422, 26, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), new String[]{strReplace, assets}));
        if (this.A0A != null) {
            String assets2 = A0A(87, 15, 106);
            A0n(assets2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void A0G() {
        if (this.A0B) {
            while (!this.A0O.isEmpty()) {
                C1392Ze c1392ZePoll = this.A0O.poll();
                if (c1392ZePoll != null) {
                    this.A0K.A0I(String.format(Locale.US, c1392ZePoll.A00, c1392ZePoll.A02));
                    if (c1392ZePoll.A01) {
                        this.A0I.A04(EnumC2231nN.A0L, null);
                        this.A0G.A0F().A6e(c1392ZePoll.A00);
                    }
                }
            }
        }
    }

    private synchronized void A0H(C1392Ze c1392Ze) {
        this.A0O.offer(c1392Ze);
        A0G();
    }

    private boolean A0J() {
        return !A0K();
    }

    private boolean A0K() {
        return C2203mv.A33(this.A0G, C1576cd.A03());
    }

    public final C2232nO A0M() {
        return this.A0I;
    }

    public final C2417qT A0N() {
        return this.A03;
    }

    public final C2758vy A0O() {
        return this.A0J;
    }

    public final InterfaceC2761w1 A0P() {
        return this.A04;
    }

    public final C0870Dx A0Q() {
        return this.A0K;
    }

    public final void A0R() {
        this.A0C = true;
    }

    public final void A0S() {
        this.A0C = false;
    }

    public final void A0T() {
        A0H(new C1392Ze(A0A(280, 27, 79), new String[]{this.A0N}));
    }

    public final void A0U() {
        A0H(new C1392Ze(A0A(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 22, 81), new String[]{this.A0N}));
    }

    public final void A0V() {
        A0H(new C1392Ze(A0A(23, 26, 102), new String[]{this.A0N}));
    }

    public final void A0W() {
        A0H(new C1392Ze(A0A(49, 25, 3), new String[]{this.A0N}));
    }

    public final void A0X() {
        Runnable runnable = this.A09;
        boolean zA0U = this.A0E.A32().A0U();
        C1J c1j = this.A07;
        C0870Dx c0870Dx = this.A0K;
        View view = this.A02;
        Runnable runnable2 = new Runnable() { // from class: com.facebook.ads.redexgen.X.w5
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A0Z();
            }
        };
        if (runnable == null) {
            runnable = A0Q;
        }
        AnonymousClass20.A00(zA0U, c1j, c0870Dx, view, runnable2, runnable);
    }

    public final void A0Y() {
        A0H(new C1392Ze(A0A(EventBridgeChannel.QUEUE_CAPACITY, 37, 60), new String[]{this.A0N}));
    }

    public final void A0Z() {
        A0H(new C1392Ze(A0A(474, 38, 33), new String[]{this.A0N}));
    }

    public final void A0a() {
        if (this.A0A != null) {
            A0n(A0A(632, 15, 115));
        }
        this.A0K.addJavascriptInterface(this.A0L, A0A(7, 16, 78));
        this.A0I.A04(EnumC2231nN.A0O, null);
        String str = this.A0M.A00;
        if (this.A0A != null) {
            String url = A0A(196, 15, 21);
            A0n(url);
        }
        this.A0K.loadUrl(str);
        this.A00 = System.currentTimeMillis();
        JSONObject jSONObject = new JSONObject();
        try {
            String url2 = A0A(578, 3, 69);
            jSONObject.put(url2, str);
            String url3 = A0A(143, 12, 73);
            jSONObject.put(url3, M1.A00());
            String url4 = A0A(568, 10, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
            jSONObject.put(url4, A0S.getAndIncrement());
            String url5 = A0A(102, 13, 53);
            jSONObject.put(url5, A0R);
        } catch (JSONException unused) {
        }
        this.A0G.A0F().A6k(jSONObject.toString());
        A0E();
    }

    public final void A0b() {
        A0H(new C1392Ze(A0A(233, 23, 60), new String[]{this.A0N}));
    }

    public final void A0c() {
        A0H(new C1392Ze(A0A(256, 24, 115), new String[]{this.A0N}));
    }

    public final void A0d() {
        A0H(new C1392Ze(A0A(610, 22, 106), new String[]{this.A0N}));
    }

    public final void A0e(View view, Runnable runnable) {
        this.A02 = view;
        this.A09 = runnable;
    }

    public final void A0f(C2417qT c2417qT) {
        this.A03 = c2417qT;
    }

    public final void A0g(InterfaceC2761w1 interfaceC2761w1) {
        this.A04 = interfaceC2761w1;
    }

    public final void A0h(YJ yj2) {
        this.A05 = yj2;
    }

    public final void A0i(UO uo2) {
        this.A06 = uo2;
    }

    public final void A0j(InterfaceC0869Dw interfaceC0869Dw) {
        this.A0L.A0P(interfaceC0869Dw);
    }

    public final void A0k(C1J c1j) {
        this.A07 = c1j;
    }

    public final void A0l(C1539c2 c1539c2) {
        this.A08 = c1539c2;
    }

    public final void A0m(String str) {
        A0H(new C1392Ze(A0A(359, 27, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), new String[]{this.A0N, str}));
    }

    public final void A0n(String str) {
        if (this.A0A == null) {
            return;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        long nowMs = this.A01;
        HashMap map = new HashMap();
        map.put(A0A(549, 12, 48), Long.valueOf(jCurrentTimeMillis));
        map.put(A0A(155, 19, 62), Long.valueOf(jCurrentTimeMillis - nowMs));
        this.A0A.put(str, map);
        A0D();
    }

    public final void A0o(String str, long j11, long j12) {
        if (this.A0A == null) {
            return;
        }
        HashMap map = new HashMap();
        map.put(A0A(549, 12, 48), Long.valueOf(j11));
        map.put(A0A(155, 19, 62), Long.valueOf(j12));
        this.A0A.put(A0A(211, 3, 27) + str, map);
        A0D();
    }

    public final void A0p(String str, String str2) {
        A0H(new C1392Ze(A0A(329, 30, 105), new String[]{this.A0N, str, str2}));
    }

    public final void A0q(String str, String str2) throws JSONException {
        try {
            this.A0M.A04.put(str, str2);
        } catch (JSONException unused) {
        }
    }

    public final void A0r(String str, JSONObject jSONObject) {
        A0H(new C1392Ze(A0A(581, 29, 70), new String[]{this.A0N, str, jSONObject.toString()}, false));
    }

    public final void A0t(JSONObject jSONObject) {
        String strReplace = Base64.encodeToString(jSONObject.toString().getBytes(), 0).replace(A0A(0, 1, 45), A0A(0, 0, 109));
        String assets = this.A0N;
        A0H(new C1392Ze(A0A(448, 26, 106), new String[]{strReplace, assets}));
    }

    public final boolean A0u() {
        return this.A0L.A0Q();
    }

    public final boolean A0v() {
        return this.A0C;
    }
}
