package kotlin.sequences;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u00028\u00000\u00022\b\u0012\u0004\u0012\u00028\u00000\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/sequences/DropSequence;", "T", "Lkotlin/sequences/Sequence;", "Lkotlin/sequences/DropTakeSequence;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class DropSequence<T> implements Sequence<T>, DropTakeSequence<T> {

    /* renamed from: a, reason: collision with root package name */
    public final Sequence f71946a;

    /* renamed from: b, reason: collision with root package name */
    public final int f71947b;

    @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/sequences/DropSequence$iterator$1", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlin.sequences.DropSequence$iterator$1, reason: invalid class name */
    public final class AnonymousClass1 implements Iterator<Object>, KMappedMarker {

        /* renamed from: a, reason: collision with root package name */
        public final Iterator f71948a;

        /* renamed from: b, reason: collision with root package name */
        public int f71949b;

        public AnonymousClass1(DropSequence dropSequence) {
            this.f71948a = dropSequence.f71946a.iterator();
            this.f71949b = dropSequence.f71947b;
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            Iterator it;
            while (true) {
                int i5 = this.f71949b;
                it = this.f71948a;
                if (i5 <= 0 || !it.hasNext()) {
                    break;
                }
                it.next();
                this.f71949b--;
            }
            return it.hasNext();
        }

        @Override // java.util.Iterator
        public final Object next() {
            Iterator it;
            while (true) {
                int i5 = this.f71949b;
                it = this.f71948a;
                if (i5 <= 0 || !it.hasNext()) {
                    break;
                }
                it.next();
                this.f71949b--;
            }
            return it.next();
        }

        @Override // java.util.Iterator
        public final void remove() {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public DropSequence(Sequence sequence, int i5) {
        Intrinsics.g(sequence, "sequence");
        this.f71946a = sequence;
        this.f71947b = i5;
        if (i5 >= 0) {
            return;
        }
        throw new IllegalArgumentException(("count must be non-negative, but was " + i5 + '.').toString());
    }

    @Override // kotlin.sequences.DropTakeSequence
    public final Sequence a(int i5) {
        int i11 = this.f71947b + i5;
        return i11 < 0 ? new DropSequence(this, i5) : new DropSequence(this.f71946a, i11);
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new AnonymousClass1(this);
    }

    @Override // kotlin.sequences.DropTakeSequence
    public final Sequence take() {
        int i5 = this.f71947b;
        int i11 = i5 + 4;
        return i11 < 0 ? new TakeSequence(this) : new SubSequence(this.f71946a, i5, i11);
    }
}
