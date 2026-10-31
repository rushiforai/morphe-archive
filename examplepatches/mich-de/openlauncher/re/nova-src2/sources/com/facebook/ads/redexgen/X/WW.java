package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V, K] */
/* loaded from: assets/audience_network/classes.dex */
public class WW<K, V> implements Iterator<Map.Entry<K, Collection<V>>> {
    public static byte[] A03;
    public static String[] A04 = {"qnpirAx6MqcwV1MznVPIu", "AxbEXkXYMtquaeTuLy6iRh1o6DhLbVNq", "aCmE6L9wNUQFF0B1nfGpZ", "vdFPNqWog399btLSF5wwWxtStBk8kybP", "ZTqxpCSf9ZeFXCRQw4WiYCHgxS0jSuW6", "4B", "X1MtfOFW", "lo7xs8ZIRE6Gn4ZbSYrRx7P5Tt9BQWC8"};

    @CheckForNull
    public Collection<V> A00;
    public final Iterator<Map.Entry<K, Collection<V>>> A01;
    public final /* synthetic */ A0 A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 83);
            if (A04[6].length() != 8) {
                throw new RuntimeException();
            }
            A04[0] = "rtYdStCWptzd2rFz40hYv";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A03 = new byte[]{-1, 0, -79, -12, -14, -3, -3, 4, -79, 5, 0, -79, -1, -10, 9, 5, -71, -70, -79, 4, -6, -1, -12, -10, -79, 5, -7, -10, -79, -3, -14, 4, 5, -79, -12, -14, -3, -3, -79, 5, 0, -79, 3, -10, -2, 0, 7, -10, -71, -70};
    }

    static {
        A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WW != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapIterator */
    public WW(final A0 this$1) {
        this.A02 = this$1;
        this.A01 = this.A02.A00.entrySet().iterator();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WW != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapIterator */
    @Override // java.util.Iterator
    /* renamed from: A01, reason: merged with bridge method [inline-methods] */
    public final Map.Entry<K, Collection<V>> next() {
        Map.Entry<K, Collection<V>> next = this.A01.next();
        this.A00 = next.getValue();
        Map.Entry<K, Collection<V>> entry = this.A02.A0A(next);
        return entry;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WW != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapIterator */
    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.A01.hasNext();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WW != com.google.common.collect.AbstractMapBasedMultimap<K, V>$AsMap$AsMapIterator */
    @Override // java.util.Iterator
    public final void remove() {
        AbstractC1335Wu.A0F(this.A00 != null, A00(0, 50, 62));
        this.A01.remove();
        AbstractC06354f.A03(this.A02.A01, this.A00.size());
        this.A00.clear();
        this.A00 = null;
    }
}
