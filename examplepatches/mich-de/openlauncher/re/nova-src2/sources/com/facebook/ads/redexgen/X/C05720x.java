package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;

/* JADX INFO: Add missing generic type declarations: [E] */
/* JADX WARN: Unexpected interfaces in signature: [kotlin.jvm.internal.markers.KMappedMarker] */
@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0x, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C05720x<E> implements Iterator<E> {
    public static byte[] A02;
    public int A00;
    public final /* synthetic */ AbstractC05490a<E> A01;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A02 = new byte[]{48, 15, 26, 13, 30, 11, 22, 16, 17, 95, 22, 12, 95, 17, 16, 11, 95, 12, 10, 15, 15, 16, 13, 11, 26, 27, 95, 25, 16, 13, 95, 13, 26, 30, 27, 82, 16, 17, 19, 6, 95, 28, 16, 19, 19, 26, 28, 11, 22, 16, 17};
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException(A02(0, 51, 10));
    }

    public C05720x(AbstractC05490a abstractC05490a) {
        this.A01 = abstractC05490a;
    }

    public final int A04() {
        return this.A00;
    }

    public final void A05(int i5) {
        this.A00 = i5;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.A00 < this.A01.size();
    }

    @Override // java.util.Iterator
    public final E next() {
        if (hasNext()) {
            AbstractC05490a<E> abstractC05490a = this.A01;
            int i5 = this.A00;
            this.A00 = i5 + 1;
            return abstractC05490a.get(i5);
        }
        throw new NoSuchElementException();
    }
}
