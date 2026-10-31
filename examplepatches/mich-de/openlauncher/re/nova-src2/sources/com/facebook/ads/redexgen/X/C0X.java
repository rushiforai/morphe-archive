package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0X, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C0X extends AbstractC05650q {
    public static byte[] A00;

    static {
        A03();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{55, AbstractJsonLexerKt.TC_INVALID, 99, 98, 120, 53, 68, 95, 70, 70, 10, 73, 75, 68, 68, 69, 94, 10, 72, 79, 10, 73, 75, 89, 94, 10, 94, 69, 10, 68, 69, 68, 7, 68, 95, 70, 70, 10, 94, 83, 90, 79, 10, 65, 69, 94, 70, 67, 68, 4, 73, 69, 70, 70, 79, 73, 94, 67, 69, 68, 89, 4, 103, 75, 90, 22, 97, 10, 69, 76, 10, 65, 69, 94, 70, 67, 68, 4, 73, 69, 70, 70, 79, 73, 94, 67, 69, 68, 89, 4, 103, 75, 90, 89, 97, 94, 117, 117, 103, 75, 90, 89, 97, 94, 4, 79, 71, 90, 94, 83, 103, 75, 90, 6, 10, 124, 10, 69, 76, 10, 65, 69, 94, 70, 67, 68, 4, 73, 69, 70, 70, 79, 73, 94, 67, 69, 68, 89, 4, 103, 75, 90, 89, 97, 94, 117, 117, 103, 75, 90, 89, 97, 94, 4, 79, 71, 90, 94, 83, 103, 75, 90, 20, 116, 101, 109, 118, 119};
    }

    public static final <K, V> HashMap<K, V> A01(AnonymousClass27<? extends K, ? extends V>... anonymousClass27Arr) {
        C1h.A09(anonymousClass27Arr, A00(163, 5, 83));
        HashMap $this$hashMapOf_u24lambda_u241 = new HashMap(AbstractC05650q.A05(anonymousClass27Arr.length));
        A04($this$hashMapOf_u24lambda_u241, anonymousClass27Arr);
        return $this$hashMapOf_u24lambda_u241;
    }

    public static final <K, V> Map<K, V> A02() {
        C05670s c05670s = C05670s.A02;
        C1h.A07(c05670s, A00(6, 157, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        return c05670s;
    }

    public static final <K, V> void A04(Map<? super K, ? super V> map, AnonymousClass27<? extends K, ? extends V>[] anonymousClass27Arr) {
        C1h.A09(map, A00(0, 6, 92));
        C1h.A09(anonymousClass27Arr, A00(163, 5, 83));
        for (AnonymousClass27<? extends K, ? extends V> anonymousClass27 : anonymousClass27Arr) {
            map.put(anonymousClass27.A02(), anonymousClass27.A03());
        }
    }
}
