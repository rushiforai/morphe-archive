package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.sync.SyncModifiableBundle;
import com.vungle.ads.internal.protos.Sdk;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

/* renamed from: com.facebook.ads.redexgen.X.4o, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06444o implements AH, InterfaceC1397Zj {
    public static byte[] A0A;
    public static String[] A0B = {"5Oiv1GLvIq7zEHzIHOTPzi3kaYzi9CKu", "OYJ8Vha7o3AKqeq5fQgjy4YAYzCEKBrH", "4fHxCa0vWIAizdOtLSYViH6HX8wZM136", "7SeobKfCaIBp1RCtBr0PVzHsRPnznuT1", "fOxTiSwrZex6", "3vZIMeafrjOpHP1eiyT8MHuy7IIJRNdQ", "XI5vdZH0G6FndxBvW8fNBqRq2FpLqBJ1", "pJZH6qXQIaEu24ksEJ9XliOUqsc1pAkZ"};
    public final C2095lA A00;
    public final InterfaceC2112lR A01;
    public final InterfaceC1529bs A02;
    public final InterfaceC1395Zh A03;
    public final ZO A04;
    public final ZI A05;
    public final String A06;
    public final Map<EnumC1407Zt, AK> A09 = new HashMap();
    public final Map<EnumC1407Zt, AbstractC06494t> A08 = new HashMap();
    public final List<InterfaceC1364Yb> A07 = new ArrayList();

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 17);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 13
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A04() throws Throwable {
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        HashMap map3 = new HashMap();
        HashMap map4 = new HashMap();
        synchronized (this) {
            for (AK ak2 : this.A09.values()) {
                if (ak2.ABM()) {
                    map.put(ak2, YV.A04);
                } else {
                    map.put(ak2, YV.A03);
                }
            }
            new AtomicReference();
            new AtomicReference();
            Iterator<AbstractC06494t> it = this.A08.values().iterator();
            while (it.hasNext()) {
                it.next();
                InterfaceC1421a7 interfaceC1421a7 = null;
                if (interfaceC1421a7.ABM()) {
                    throw new NullPointerException(A01(349, 20, 91));
                }
            }
            Iterator<InterfaceC1364Yb> it2 = this.A07.iterator();
            if (it2.hasNext()) {
                it2.next();
                throw new NullPointerException(A01(424, 22, 50));
            }
        }
        CountDownLatch countDownLatch = new CountDownLatch(1);
        AtomicReference atomicReference = new AtomicReference();
        AtomicReference atomicReference2 = new AtomicReference();
        JSONObject jSONObjectA03 = A03(map, map2, map3, map4);
        String.format(Locale.US, A01(188, 33, 55), this.A06, jSONObjectA03.toString(2));
        this.A02.AIB(this.A06, (A01(327, 8, 88) + URLEncoder.encode(jSONObjectA03.toString())).getBytes(), new AF(this, atomicReference, atomicReference2, countDownLatch));
        while (countDownLatch.getCount() > 0) {
            try {
                countDownLatch.await();
            } catch (InterruptedException unused) {
            }
        }
        synchronized (this) {
            if (atomicReference2.get() != null) {
                throw ((Throwable) atomicReference2.get());
            }
            Set<Yk> setA02 = A02((JSONObject) atomicReference.get());
            HashMap map5 = new HashMap();
            HashMap map6 = new HashMap();
            Iterator<Yk> it3 = setA02.iterator();
            while (it3.hasNext()) {
                it3.next().A4e(map5, map6);
            }
            this.A03.A7B(A00((JSONObject) atomicReference.get()));
            Iterator<InterfaceC1364Yb> it4 = this.A07.iterator();
            if (it4.hasNext()) {
                it4.next();
                throw new NullPointerException(A01(TTAdConstant.MATE_IS_NULL_CODE, 23, 80));
            }
        }
    }

    public static void A05() {
        A0A = new byte[]{101, -82, -72, 101, -73, -86, -72, -71, -73, -82, -88, -71, -86, -87, 115, 101, -104, -80, -82, -75, -75, -82, -77, -84, 101, -72, -66, -77, -88, -48, -1, -1, -81, -8, -3, -81, -15, -16, -14, -6, -10, 1, -2, 4, -3, -13, -67, -54, -24, -11, -11, -10, -5, -89, -22, -7, -20, -24, -5, -20, -89, -6, -20, -7, -3, -20, -7, -89, -23, -4, -11, -21, -13, -20, -89, -2, -16, -5, -17, -89, -11, -10, -11, -76, -6, -20, -7, -3, -20, -7, -89, -10, -2, -11, -20, -21, -89, -23, -4, -11, -21, -13, -20, -89, -48, -53, -85, -56, -37, -56, -121, -41, -39, -42, -54, -52, -38, -38, -48, -43, -50, -121, -42, -41, -37, -48, -42, -43, -121, -49, -12, -4, -25, -14, -17, -22, -90, -8, -21, -20, -8, -21, -7, -18, -90, -6, -17, -13, -21, -64, -90, -85, -22, -79, -56, -38, -125, -42, -56, -43, -39, -56, -43, -112, -46, -38, -47, -56, -57, -125, -59, -40, -47, -57, -49, -56, -125, -58, -43, -56, -60, -41, -56, -57, -99, -125, -120, -42, -101, -63, -74, -85, -80, -70, -73, -74, -79, -62, -87, -68, -79, -73, -74, 104, -70, -83, -71, -67, -83, -69, -68, 104, -68, -73, 104, 109, -69, -126, 82, 109, -69, -88, -50, -61, -72, -67, -57, -60, -61, -66, -49, -74, -55, -66, -60, -61, 117, -57, -70, -56, -59, -60, -61, -56, -70, -113, 95, 122, -56, 114, -104, -115, -126, -121, -111, -114, -115, -120, -103, -128, -109, -120, -114, -115, 63, -111, -108, -115, 63, -123, -128, -120, -117, -124, -125, 90, 63, -123, -114, -111, -126, -120, -115, -122, 63, -120, -115, 63, 68, -125, 63, -110, -124, -126, -114, -115, -125, -110, -103, -84, -91, -101, -93, -100, -86, -107, -95, -96, -90, -105, -86, -90, -122, -125, -106, -125, -89, -86, -81, -88, -90, -77, -79, -77, -86, -81, -75, -39, -54, -30, -43, -40, -54, -51, -90, -45, -58, -57, -45, -58, -44, -55, -40, -53, -41, -37, -53, -39, -38, -34, -47, -35, -31, -43, -34, -47, -33, -65, -27, -38, -49, -83, -38, -48, -66, -47, -33, -47, -32, -60, -73, -59, -62, -63, -64, -59, -73, -19, -33, -20, -16, -33, -20, -55, -15, -24, -33, -34, -68, -17, -24, -34, -26, -33, -67, -20, -33, -37, -18, -33, -34, -44, -38, -49, -60, -55, -45, -48, -49, -54, -37, -62, -43, -54, -48, -49, -89, -54, -49, -54, -44, -55, -58, -59, -74, -68, -79, -90, -85, -75, -78, -79, -84, -67, -92, -73, -84, -78, -79, -106, -73, -92, -75, -73, -88, -89, -53, -72, -55, -66, -68, -53, -74, -55, -68, -67, -55, -68, -54, -65, -74, -54};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private synchronized void A08(Throwable th2) {
        Iterator<InterfaceC1364Yb> it = this.A07.iterator();
        if (it.hasNext()) {
            it.next();
            new HashMap();
            new HashMap();
            throw new NullPointerException(A01(TTAdConstant.MATE_IS_NULL_CODE, 23, 80));
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.AH
    public final synchronized InterfaceC1421a7 A63(EnumC1407Zt enumC1407Zt) {
        if (enumC1407Zt.A03() != EnumC1401Zn.A03) {
            throw new IllegalArgumentException(A01(47, 59, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
        }
        if (this.A09.containsKey(enumC1407Zt)) {
            return this.A09.get(enumC1407Zt);
        }
        AK ak2 = new AK(enumC1407Zt);
        this.A09.put(enumC1407Zt, ak2);
        Iterator<InterfaceC1364Yb> it = this.A07.iterator();
        if (it.hasNext()) {
            it.next();
            throw new NullPointerException(A01(377, 24, 105));
        }
        String.format(Locale.US, A01(153, 35, 82), enumC1407Zt);
        return ak2;
    }

    static {
        A05();
    }

    public C06444o(C2095lA c2095lA, InterfaceC2112lR interfaceC2112lR, InterfaceC1529bs interfaceC1529bs, String str, ZI zi2, ZO zo, InterfaceC1398Zk interfaceC1398Zk) {
        this.A00 = c2095lA;
        this.A01 = interfaceC2112lR;
        this.A02 = interfaceC1529bs;
        this.A06 = str;
        this.A05 = zi2;
        this.A04 = zo;
        this.A03 = interfaceC1398Zk.A5n(this);
    }

    public static int A00(JSONObject jSONObject) throws JSONException {
        int time = jSONObject.getJSONObject(A01(335, 7, 80)).getInt(A01(446, 16, 70));
        if (time > 0) {
            return time;
        }
        throw new JSONException(String.format(Locale.US, A01(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 24, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), Integer.valueOf(time)));
    }

    private Set<Yk> A02(JSONObject jSONObject) throws JSONException {
        HashSet hashSet = new HashSet();
        JSONObject jSONObject2 = jSONObject.getJSONObject(A01(369, 8, 65));
        JSONObject jSONObject3 = jSONObject.getJSONObject(A01(298, 7, 38));
        for (final AK ak2 : this.A09.values()) {
            switch (C1374Ym.A01[YU.A00(jSONObject2.getString(ak2.A8r().A04())).ordinal()]) {
                case 1:
                    final JSONObject data = jSONObject3.getJSONObject(ak2.A8r().A04()).getJSONObject(A01(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 4, 17));
                    final JSONObject responseObject = jSONObject3.getJSONObject(ak2.A8r().A04()).optJSONObject(A01(Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE, 11, 48));
                    hashSet.add(new AD(ak2, data, responseObject) { // from class: com.facebook.ads.redexgen.X.4r
                        public final JSONObject A00;
                        public final JSONObject A01;

                        {
                            YU yu2 = YU.A03;
                            this.A00 = data;
                            this.A01 = responseObject;
                        }

                        @Override // com.facebook.ads.redexgen.X.AD, com.facebook.ads.redexgen.X.Yk
                        public final void A4e(Map<InterfaceC1421a7, YU> map, Map<SyncModifiableBundle, EnumC1390Zc> map2) {
                            super.A00.A03(this.A00, this.A01);
                            super.A4e(map, map2);
                        }
                    });
                    break;
                case 2:
                    hashSet.add(new AD(ak2) { // from class: com.facebook.ads.redexgen.X.4q
                        {
                            YU yu2 = YU.A04;
                        }
                    });
                    break;
                default:
                    throw new AssertionError();
            }
        }
        Iterator<AbstractC06494t> it = this.A08.values().iterator();
        while (it.hasNext()) {
            it.next();
            final AbstractC06494t abstractC06494t = null;
            switch (C1374Ym.A00[EnumC1390Zc.A00(jSONObject2.getString(abstractC06494t.A8r().A04())).ordinal()]) {
                case 1:
                    hashSet.add(new AE(abstractC06494t) { // from class: com.facebook.ads.redexgen.X.4s
                        {
                            EnumC1390Zc enumC1390Zc = EnumC1390Zc.A04;
                        }
                    });
                    break;
                case 2:
                    hashSet.add(new AE(abstractC06494t) { // from class: com.facebook.ads.redexgen.X.4p
                        public static byte[] A00;

                        static {
                            A01();
                        }

                        public static String A00(int i5, int i11, int i12) {
                            byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
                            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 52);
                            }
                            return new String(bArrCopyOfRange);
                        }

                        public static void A01() {
                            A00 = new byte[]{19, 5, 20, 50, 5, 17, 21, 9, 18, 5, 19, 51, 25, 14, 3};
                        }

                        {
                            EnumC1390Zc enumC1390Zc = EnumC1390Zc.A05;
                        }

                        @Override // com.facebook.ads.redexgen.X.AE, com.facebook.ads.redexgen.X.Yk
                        public final void A4e(Map<InterfaceC1421a7, YU> map, Map<SyncModifiableBundle, EnumC1390Zc> map2) {
                            throw new NullPointerException(A00(0, 15, 84));
                        }
                    });
                    break;
                default:
                    throw new AssertionError();
            }
        }
        return hashSet;
    }

    private JSONObject A03(Map<InterfaceC1421a7, YV> map, Map<SyncModifiableBundle, EnumC1391Zd> map2, Map<SyncModifiableBundle, JSONObject> clientBundleData, Map<SyncModifiableBundle, JSONObject> clientBundleFingerprint) throws JSONException {
        String strA01;
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry<InterfaceC1421a7, YV> entry : map.entrySet()) {
            jSONObject.put(entry.getKey().A8r().A04(), entry.getValue().A03());
        }
        for (Map.Entry<SyncModifiableBundle, EnumC1391Zd> entry2 : map2.entrySet()) {
            entry2.getKey();
            InterfaceC1421a7 interfaceC1421a7 = null;
            jSONObject.put(interfaceC1421a7.A8r().A04(), entry2.getValue().A03());
        }
        JSONObject jSONObject2 = new JSONObject();
        Iterator<Map.Entry<InterfaceC1421a7, YV>> it = map.entrySet().iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            strA01 = A01(Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE, 11, 48);
            if (!zHasNext) {
                break;
            }
            Map.Entry<InterfaceC1421a7, YV> next = it.next();
            if (next.getValue() == YV.A04) {
                JSONObject bundles = new JSONObject();
                InterfaceC1421a7 key = next.getKey();
                jSONObject2.put(key.A8r().A04(), bundles);
                if (next.getKey().A8r().A05()) {
                    JSONObject request = key.A8j();
                    bundles.put(strA01, request);
                } else {
                    bundles.put(strA01, JSONObject.NULL);
                }
                jSONObject2.put(key.A8r().A04(), bundles);
            }
        }
        for (Map.Entry<SyncModifiableBundle, EnumC1391Zd> entry3 : map2.entrySet()) {
            JSONObject updateData = new JSONObject();
            InterfaceC1421a7 key2 = entry3.getKey();
            JSONObject request2 = clientBundleFingerprint.get(entry3.getKey());
            updateData.put(strA01, request2);
            if (entry3.getValue() == EnumC1391Zd.A05) {
                String strA012 = A01(Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE, 4, 17);
                JSONObject request3 = clientBundleData.get(key2);
                updateData.put(strA012, request3);
                jSONObject2.put(key2.A8r().A04(), updateData);
            } else {
                String strA04 = key2.A8r().A04();
                String[] strArr = A0B;
                if (strArr[1].charAt(20) == strArr[6].charAt(20)) {
                    throw new RuntimeException();
                }
                A0B[5] = "j6hI8A69HBwx3QyEu85lNgwu8aXeWQ7U";
                jSONObject2.put(strA04, updateData);
            }
        }
        JSONObject bundleData = new JSONObject();
        for (Map.Entry<String, String> entry4 : this.A05.A8a().entrySet()) {
            if (entry4.getValue() != null) {
                bundleData.put(entry4.getKey(), entry4.getValue());
            }
        }
        JSONObject jSONObject3 = new JSONObject();
        jSONObject3.put(A01(342, 7, 85), jSONObject);
        jSONObject3.put(A01(298, 7, 38), jSONObject2);
        jSONObject3.put(A01(Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE, 7, 33), bundleData);
        return jSONObject3;
    }

    public static void A06(String str, AtomicReference<JSONObject> atomicReference, AtomicReference<Throwable> atomicReference2) {
        String.format(Locale.US, A01(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 28, 68), str);
        try {
            atomicReference.set((JSONObject) new JSONTokener(str).nextValue());
        } catch (ClassCastException | JSONException e3) {
            atomicReference2.set(e3);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AH, com.facebook.ads.redexgen.X.InterfaceC2101lG
    public final void A7D() {
        this.A03.A7C();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1397Zj
    public final void AK6() {
        if (this.A01.ABP()) {
            String str = A01(106, 23, 86) + this.A01.A8L().A07() + A01(0, 29, 52);
            A08(new YX());
            return;
        }
        try {
            if (!C2203mv.A27(this.A00) || this.A00.A04().ABC()) {
                A04();
                return;
            }
            throw new IllegalStateException(A01(29, 18, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        } catch (Throwable th2) {
            String.format(Locale.US, A01(249, 49, 14), Integer.valueOf(this.A04.A01()));
            A08(th2);
            this.A03.A7B(this.A04.A01());
        }
    }
}
