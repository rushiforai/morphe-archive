package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [K] */
/* loaded from: assets/audience_network/classes.dex */
public class WF<K> implements Iterator<K> {
    public static byte[] A03;
    public static String[] A04 = {"Hv9sdafl", "2", "xAGtF", "1bNO3h1oxqIdlXbL1qMzM", "iESu8QW8sFakzmrGnD", "jHiSfJLuUZZF5CznZDUWbRhEPbHo61Wp", "vFfpqU37NJxtMDJp1vduOhmdNHzaOkms", "X"};

    @CheckForNull
    public Map.Entry<K, Collection<V>> A00;
    public final /* synthetic */ C06384i A01;
    public final /* synthetic */ Iterator A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 2);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {108, 109, 34, 97, 99, 110, 110, 113, 34, 118, 109, 34, 108, 103, 122, 118, 42, 43, 34, 113, 107, 108, 97, 103, 34, 118, 106, 103, 34, 110, 99, 113, 118, 34, 97, 99, 110, 110, 34, 118, 109, 34, 112, 103, 111, 109, 116, 103, 42, 43};
        if (A04[4].length() == 3) {
            throw new RuntimeException();
        }
        String[] strArr = A04;
        strArr[0] = "fvjaigYM";
        strArr[1] = "2";
        A03 = bArr;
    }

    static {
        A01();
    }

    public WF(final C06384i this$1, final Iterator val$entryIterator) {
        this.A02 = val$entryIterator;
        this.A01 = this$1;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.A02.hasNext();
    }

    @Override // java.util.Iterator
    @ParametricNullness
    public final K next() {
        this.A00 = (Map.Entry) this.A02.next();
        return this.A00.getKey();
    }

    @Override // java.util.Iterator
    public final void remove() {
        AbstractC1335Wu.A0F(this.A00 != null, A00(0, 50, 0));
        Collection collection = (Collection) this.A00.getValue();
        this.A02.remove();
        AbstractC06354f.A03(this.A01.A00, collection.size());
        collection.clear();
        this.A00 = null;
    }
}
