package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.eX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1693eX {
    public static byte[] A02;
    public final Map<String, Object> A01 = new HashMap();
    public final List<String> A00 = new ArrayList();

    static {
        A07();
    }

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 44);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A07() {
        A02 = new byte[]{-108, -89, -98, -114, -101, -108, -99, -14, 5, -4, -20, -1, -14, -15, -10, -1};
    }

    public static C1693eX A00(C1693eX c1693eX, long j11) {
        return c1693eX.A03(A06(0, 7, 3), j11);
    }

    public static C1693eX A01(C1693eX c1693eX, Uri uri) {
        String strA06 = A06(7, 9, 97);
        if (uri == null) {
            return c1693eX.A02(strA06);
        }
        return c1693eX.A05(strA06, uri.toString());
    }

    private final C1693eX A02(String str) {
        this.A00.add(str);
        this.A01.remove(str);
        return this;
    }

    private final C1693eX A03(String str, long j11) {
        return A04(str, Long.valueOf(j11));
    }

    private C1693eX A04(String str, Object obj) {
        this.A01.put((String) AbstractC1062Ln.A01(str), AbstractC1062Ln.A01(obj));
        this.A00.remove(str);
        return this;
    }

    private final C1693eX A05(String str, String str2) {
        return A04(str, str2);
    }

    public final List<String> A08() {
        return Collections.unmodifiableList(new ArrayList(this.A00));
    }

    public final Map<String, Object> A09() {
        HashMap map = new HashMap(this.A01);
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            Object value = entry.getValue();
            if (value instanceof byte[]) {
                byte[] bArr = (byte[]) value;
                entry.setValue(Arrays.copyOf(bArr, bArr.length));
            }
        }
        return Collections.unmodifiableMap(map);
    }
}
