package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.amplitude.core.Configuration;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public final class H8 implements InterfaceC2176mU {
    public static byte[] A03;
    public static final String A04;
    public final C0957Hh A00;
    public final InterfaceC2189mh<C2221nD> A01;
    public final InterfaceC2189mh<C2221nD> A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 70);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{102, 100, 43, 34, 100, 48, 61, 52, 33, 126, 100, 24, 61, 28, 47, 60, 55, 45, 10, 45, 54, 43, 56, 62, 60, 11, 60, 58, 54, 43, 61, 29, 56, 45, 56, 59, 56, 42, 60, 105, 72, 65, 72, 89, 72, 73, 13, 72, 91, 72, 67, 89, 23, 13, 15, 66, 101, 109, 104, 97, 96, 36, 112, 107, 36, 103, 104, 97, 101, 118, 36, 97, 114, 97, 106, 112, 119, 36, 119, 112, 107, 118, 101, 99, 97, 97, 70, 78, 75, 66, 67, 7, 83, 72, 7, 67, 66, 84, 66, 85, 78, 70, 75, 78, 93, 66, 7, 70, 73, 7, 66, 81, 66, 73, 83, 7, 65, 85, 72, 74, 7, 67, 70, 83, 70, 69, 70, 84, 66, 7, 107, 76, 68, 65, 72, 73, 13, 89, 66, 13, 64, 66, 91, 72, 13, 72, 91, 72, 67, 89, 94, 13, 75, 95, 66, 64, 13, 68, 67, 0, 75, 65, 68, 74, 69, 89, 13, 94, 89, 66, 95, 76, 74, 72, 13, 79, 76, 78, 70, 13, 89, 66, 13, 72, 91, 72, 67, 89, 94, 13, 73, 76, 89, 76, 79, 76, 94, 72, 118, 81, 89, 92, 85, 84, 16, 68, 95, 16, 64, 81, 66, 67, 85, 16, 81, 94, 16, 85, 70, 85, 94, 68, 16, 86, 66, 95, 93, 16, 89, 94, 29, 86, 92, 89, 87, 88, 68, 16, 67, 68, 95, 66, 81, 87, 85, 123, 92, 84, 81, 88, 89, 29, 73, 82, 29, 79, 88, 92, 89, 29, 73, 85, 88, 29, 83, 72, 80, 95, 88, 79, 29, 82, 91, 29, 88, 75, 88, 83, 73, 78, 29, 91, 79, 82, 80, 29, 89, 92, 73, 92, 95, 92, 78, 88, 12, 43, 35, 38, 47, 46, 106, 62, 37, 106, 57, 47, 56, 35, 43, 38, 35, 48, 47, 106, 43, 46, 106, 47, 60, 47, 36, 62, 105, 78, 70, 76, 73, 71, 72, 84, 13, 97, 68, 101, 86, 69, 78, 84, 115, 84, 79, 82, 65, 71, 69, 114, 69, 67, 79, 82, 68, 100, 65, 84, 65, 66, 65, 83, 69, 56, 15, 9, 5, 24, 14, 74, 14, 11, 30, 11, 8, 11, 25, 15, 74, 12, 11, 3, 6, 31, 24, 15, 74, 5, 9, 9, 31, 24, 24, 15, 14, 74, 29, 2, 15, 4, 74, 24, 15, 11, 14, 3, 4, 13, 74, 15, 28, 15, 4, 30, 25, 68, 61, 40, 40, 57, 49, 44, 40, 28, 25, 12, 25, 47, 34, 95, 72, 78, 66, 95, 73, 114, 73, 76, 89, 76, 79, 76, 94, 72, 65, 87, 65, 65, 91, 93, 92, 109, 91, 86, 46, 56, 46, 46, 52, 50, 51, 2, 41, 52, 48, 56, 100, 121, 125, 117, 49, 42, 46, 32, 43, 88, 85, 92, 73, 12, 23, 18, 23, 22, 14, 23};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 19 out of bounds for length 16
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00f0 A[Catch: mq -> 0x0136, TryCatch #3 {mq -> 0x0136, blocks: (B:33:0x00e4, B:35:0x00f0, B:36:0x00ff, B:22:0x0088, B:24:0x008e, B:26:0x009a, B:27:0x00da, B:39:0x0108, B:40:0x010c, B:42:0x0112, B:43:0x0122, B:44:0x0126, B:46:0x012c), top: B:61:0x00e4 }] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0147  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A0B(int i5, Set<String> set, Set<String> set2) throws JSONException {
        String strA00 = A00(TTAdConstant.IMAGE_URL_CODE, 7, 26);
        int i11 = 0;
        int[] iArr = new int[30];
        byte[] bArr = new byte[Configuration.FLUSH_INTERVAL_MILLIS];
        LinkedList linkedList = new LinkedList();
        try {
            linkedList.add(this.A02.A75(bArr, iArr));
            List<JSONObject> listA01 = A01(new LinkedList(), bArr, iArr);
            while (((InterfaceC2188mg) linkedList.getLast()).ADF()) {
                Arrays.fill(iArr, 0);
                linkedList.add(this.A02.A75(bArr, iArr));
                listA01 = A01(listA01, bArr, iArr);
            }
            Iterator<JSONObject> it = listA01.iterator();
            while (it.hasNext()) {
                JSONObject next = it.next();
                try {
                    String string = next.getString(A00(423, 2, 0));
                    try {
                        if (set.contains(string)) {
                            int i12 = next.getInt(strA00) + 1;
                            if (i12 < i5) {
                                try {
                                    next.put(strA00, i12);
                                    this.A01.ALa(A09(next));
                                } catch (C2198mq e3) {
                                    e = e3;
                                    if (this.A00.A05().AB6()) {
                                    }
                                    A05(AbstractC2126lf.A2L, e);
                                    return i11;
                                } catch (JSONException e11) {
                                    e = e11;
                                    try {
                                        if (this.A00.A05().AB6()) {
                                        }
                                        A05(AbstractC2126lf.A2P, e);
                                    } catch (C2198mq e12) {
                                        e = e12;
                                        if (this.A00.A05().AB6()) {
                                            Log.e(A04, A00(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 68, 107), e);
                                        }
                                        A05(AbstractC2126lf.A2L, e);
                                        return i11;
                                    }
                                }
                            } else {
                                i11++;
                            }
                            it.remove();
                        } else {
                            try {
                                if (set2.contains(string)) {
                                    if (this.A00.A05().AB6()) {
                                        String str = A00(39, 16, 107) + string + A00(0, 11, 2) + next.optString(A00(471, 4, 106), A00(475, 7, 63));
                                    }
                                    it.remove();
                                }
                            } catch (JSONException e13) {
                                e = e13;
                                if (this.A00.A05().AB6()) {
                                    Log.e(A04, A00(198, 47, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), e);
                                }
                                A05(AbstractC2126lf.A2P, e);
                            }
                        }
                    } catch (C2198mq e14) {
                        e = e14;
                    } catch (JSONException e15) {
                        e = e15;
                    }
                } catch (JSONException e16) {
                    e = e16;
                }
            }
            Iterator<JSONObject> it2 = listA01.iterator();
            while (it2.hasNext()) {
                this.A02.ALa(A09(it2.next()));
            }
            Iterator it3 = linkedList.iterator();
            while (it3.hasNext()) {
                ((InterfaceC2188mg) it3.next()).A6O();
            }
        } catch (C2198mq e17) {
            e = e17;
        }
        return i11;
    }

    static {
        A03();
        A04 = H8.class.getSimpleName();
    }

    public H8(C0957Hh c0957Hh) throws IOException {
        this.A00 = c0957Hh;
        this.A01 = new H5(C2186me.A00(A00(11, 28, 31), c0957Hh), new HA(this));
        this.A02 = new H5(C2186me.A00(A00(Sdk.SDKError.Reason.MRAID_UNRECOGNIZED_COMMAND_VALUE, 37, 102), c0957Hh), new H9(this));
    }

    private List<JSONObject> A01(List<JSONObject> list, byte[] bArr, int[] iArr) {
        int i5 = 0;
        for (int i11 : iArr) {
            if (i11 == 0) {
                break;
            }
            try {
                list.add(A02(bArr, i5, i11));
            } catch (JSONException jsone) {
                if (this.A00.A05().AB6()) {
                    Log.e(A04, A00(85, 45, 97), jsone);
                }
                int start = AbstractC2126lf.A2P;
                A05(start, jsone);
            }
            i5 += i11;
        }
        return list;
    }

    public static JSONObject A02(byte[] bArr, int i5, int i11) throws JSONException {
        return new JSONObject(new String(Arrays.copyOfRange(bArr, i5, i5 + i11)));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A04(int i5, String str) {
        C2127lg c2127lg = new C2127lg(str);
        c2127lg.A05(1);
        this.A00.A08().AC0(A00(425, 15, 107), i5, c2127lg);
    }

    private void A05(int i5, Throwable th2) {
        this.A00.A08().ABz(A00(425, 15, 107), i5, new C2127lg(th2));
    }

    public static byte[] A07(C2095lA c2095lA, String str, C2221nD c2221nD) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(A00(423, 2, 0), str);
            jSONObject.put(A00(466, 5, 3), c2221nD.A08());
            jSONObject.put(A00(471, 4, 106), c2221nD.A06().toString());
            jSONObject.put(A00(462, 4, 86), C2416qS.A03(c2221nD.A04()));
            jSONObject.put(A00(450, 12, 27), C2416qS.A03(c2221nD.A03()));
            jSONObject.put(A00(440, 10, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), c2221nD.A07());
            jSONObject.put(A00(419, 4, 62), new JSONObject(c2221nD.A09()));
            jSONObject.put(A00(TTAdConstant.IMAGE_URL_CODE, 7, 26), 0);
        } catch (JSONException e3) {
            if (c2095lA.A05().AB6()) {
                Log.e(A04, A00(294, 28, 12), e3);
            }
        }
        return jSONObject.toString().getBytes();
    }

    public static byte[] A09(JSONObject jSONObject) {
        return jSONObject.toString().getBytes();
    }

    public final int A0A() {
        try {
            return this.A01.A9V();
        } catch (C2198mq e3) {
            if (this.A00.A05().AB6()) {
                Log.e(A04, A00(245, 49, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), e3);
                return 0;
            }
            return 0;
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:17:0x0053 */
    /* JADX WARN: Incorrect condition in loop: B:21:0x006d */
    /* JADX WARN: Incorrect condition in loop: B:8:0x002c */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final List<JSONObject> A0C(int i5) {
        int totalFetched = 0;
        if (i5 == -1) {
            totalFetched = 1;
            i5 = 30;
        }
        int[] eventSizes = new int[i5];
        byte[] bArr = new byte[i5 * 1000];
        List<JSONObject> linkedList = new LinkedList<>();
        LinkedList linkedList2 = new LinkedList();
        try {
            InterfaceC2188mg interfaceC2188mgA75 = this.A01.A75(bArr, eventSizes);
            linkedList2.add(interfaceC2188mgA75);
            int iA76 = interfaceC2188mgA75.A76();
            linkedList = A01(linkedList, bArr, eventSizes);
            while (noLimit && (iA76 < i5 || totalFetched != 0)) {
                if (totalFetched != 0) {
                    Arrays.fill(eventSizes, 0);
                } else {
                    eventSizes = new int[i5 - iA76];
                }
                interfaceC2188mgA75 = this.A01.A75(bArr, eventSizes);
                linkedList2.add(interfaceC2188mgA75);
                linkedList = A01(linkedList, bArr, eventSizes);
            }
            Iterator<JSONObject> it = linkedList.iterator();
            while (noLimit) {
                this.A02.ALa(A09(it.next()));
            }
            Iterator it2 = linkedList2.iterator();
            while (noLimit) {
                ((InterfaceC2188mg) it2.next()).A6O();
            }
        } catch (C2198mq e3) {
            boolean noLimit = this.A00.A05().AB6();
            if (noLimit) {
                Log.e(A04, A00(359, 53, 44), e3);
            }
            A05(AbstractC2126lf.A2M, e3);
        }
        return linkedList;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2176mU
    public final void A5a() {
        try {
            this.A01.clear();
            this.A02.clear();
        } catch (C2198mq e3) {
            if (this.A00.A05().AB6()) {
                Log.e(A04, A00(55, 30, 66), e3);
            }
            A05(AbstractC2126lf.A2J, e3);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mR != com.facebook.ads.internal.eventstorage.AdEventStorageCallback<java.lang.String> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC2176mU
    public final void AMQ(C2221nD c2221nD, AbstractC2173mR<String> abstractC2173mR) {
        new C2179mX(c2221nD, abstractC2173mR, this.A01, this.A00).A06(ExecutorC2431qh.A07);
    }
}
