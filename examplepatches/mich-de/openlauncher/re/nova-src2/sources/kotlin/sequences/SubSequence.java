package kotlin.sequences;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMappedMarker;
import q70.a;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u00028\u00000\u00022\b\u0012\u0004\u0012\u00028\u00000\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/sequences/SubSequence;", "T", "Lkotlin/sequences/Sequence;", "Lkotlin/sequences/DropTakeSequence;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class SubSequence<T> implements Sequence<T>, DropTakeSequence<T> {

    /* renamed from: a, reason: collision with root package name */
    public final Sequence f71974a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71975b;

    /* renamed from: c, reason: collision with root package name */
    public final int f71976c;

    @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/sequences/SubSequence$iterator$1", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlin.sequences.SubSequence$iterator$1, reason: invalid class name */
    public final class AnonymousClass1 implements Iterator<Object>, KMappedMarker {

        /* renamed from: a, reason: collision with root package name */
        public final Iterator f71977a;

        /* renamed from: b, reason: collision with root package name */
        public int f71978b;

        public AnonymousClass1() {
            this.f71977a = SubSequence.this.f71974a.iterator();
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            SubSequence subSequence;
            Iterator it;
            while (true) {
                int i5 = this.f71978b;
                subSequence = SubSequence.this;
                int i11 = subSequence.f71975b;
                it = this.f71977a;
                if (i5 >= i11 || !it.hasNext()) {
                    break;
                }
                it.next();
                this.f71978b++;
            }
            return this.f71978b < subSequence.f71976c && it.hasNext();
        }

        @Override // java.util.Iterator
        public final Object next() {
            SubSequence subSequence;
            Iterator it;
            while (true) {
                int i5 = this.f71978b;
                subSequence = SubSequence.this;
                int i11 = subSequence.f71975b;
                it = this.f71977a;
                if (i5 >= i11 || !it.hasNext()) {
                    break;
                }
                it.next();
                this.f71978b++;
            }
            int i12 = this.f71978b;
            if (i12 >= subSequence.f71976c) {
                throw new NoSuchElementException();
            }
            this.f71978b = i12 + 1;
            return it.next();
        }

        @Override // java.util.Iterator
        public final void remove() {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public SubSequence(Sequence sequence, int i5, int i11) {
        Intrinsics.g(sequence, "sequence");
        this.f71974a = sequence;
        this.f71975b = i5;
        this.f71976c = i11;
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "startIndex should be non-negative, but is ").toString());
        }
        if (i11 < 0) {
            throw new IllegalArgumentException(c0.h(i11, "endIndex should be non-negative, but is ").toString());
        }
        if (i11 < i5) {
            throw new IllegalArgumentException(c0.g(i11, i5, "endIndex should be not less than startIndex, but was ", " < ").toString());
        }
    }

    @Override // kotlin.sequences.DropTakeSequence
    public final Sequence a(int i5) {
        int i11 = this.f71976c;
        int i12 = this.f71975b;
        return i5 >= i11 - i12 ? a.f83782a : new SubSequence(this.f71974a, i12 + i5, i11);
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new AnonymousClass1();
    }

    @Override // kotlin.sequences.DropTakeSequence
    public final Sequence take() {
        int i5 = this.f71976c;
        int i11 = this.f71975b;
        if (4 >= i5 - i11) {
            return this;
        }
        return new SubSequence(this.f71974a, i11, i11 + 4);
    }
}
