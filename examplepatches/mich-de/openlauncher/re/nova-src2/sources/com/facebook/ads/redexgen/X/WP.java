package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import javax.annotation.CheckForNull;

/* loaded from: assets/audience_network/classes.dex */
public abstract class WP<T> implements Iterator<T> {
    public static String[] A05 = {"FZ9hK9E418XHHGwnL", "c6", "GBTpjSQBPchyHHEfcP5AiKMdMW", "Cse0xbaG4EUtFytROe6Pp4WD0", "wGwranj", "y1", "ggjoCPGGtGKjIoYpFlVbsxi8H8qXC7ty", "p1XSS7oB5tfod9lOm"};

    @CheckForNull
    public K A00 = null;

    @CheckForNull
    public Collection<V> A01 = null;
    public Iterator<V> A02 = AbstractC1304Vn.A02();
    public final Iterator<Map.Entry<K, Collection<V>>> A03;
    public final /* synthetic */ AbstractC06354f A04;

    public abstract T A00(@ParametricNullness K key, @ParametricNullness V value);

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WP != com.google.common.collect.AbstractMapBasedMultimap<K, V>$Itr<T> */
    public WP(final AbstractC06354f this$0) {
        this.A04 = this$0;
        this.A03 = this$0.A01.entrySet().iterator();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WP != com.google.common.collect.AbstractMapBasedMultimap<K, V>$Itr<T> */
    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.A03.hasNext() || this.A02.hasNext();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WP != com.google.common.collect.AbstractMapBasedMultimap<K, V>$Itr<T> */
    /* JADX WARN: Type inference failed for: r0v13, types: [K, java.lang.Object] */
    @Override // java.util.Iterator
    @ParametricNullness
    public final T next() {
        if (!this.A02.hasNext()) {
            Map.Entry entry = (Map.Entry) this.A03.next();
            this.A00 = entry.getKey();
            this.A01 = (Collection) entry.getValue();
            this.A02 = this.A01.iterator();
        }
        T tA00 = A00(Ve.A01(this.A00), this.A02.next());
        String[] strArr = A05;
        if (strArr[7].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A05;
        strArr2[3] = "y6ObQrsTNoHI93vNJE9NtiPdr";
        strArr2[2] = "zLyrsYjwcLqrX0l3t5G08NIiCW";
        return tA00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WP != com.google.common.collect.AbstractMapBasedMultimap<K, V>$Itr<T> */
    @Override // java.util.Iterator
    public final void remove() {
        this.A02.remove();
        if (((Collection) Objects.requireNonNull(this.A01)).isEmpty()) {
            this.A03.remove();
        }
        AbstractC06354f.A01(this.A04);
    }
}
