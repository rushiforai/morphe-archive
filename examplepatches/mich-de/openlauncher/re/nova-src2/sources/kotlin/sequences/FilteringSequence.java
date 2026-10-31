package kotlin.sequences;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u00028\u00000\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/sequences/FilteringSequence;", "T", "Lkotlin/sequences/Sequence;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class FilteringSequence<T> implements Sequence<T> {

    /* renamed from: a, reason: collision with root package name */
    public final Sequence f71950a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f71951b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f71952c;

    @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/sequences/FilteringSequence$iterator$1", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlin.sequences.FilteringSequence$iterator$1, reason: invalid class name */
    public final class AnonymousClass1 implements Iterator<Object>, KMappedMarker {

        /* renamed from: a, reason: collision with root package name */
        public final Iterator f71953a;

        /* renamed from: b, reason: collision with root package name */
        public int f71954b = -1;

        /* renamed from: c, reason: collision with root package name */
        public Object f71955c;

        public AnonymousClass1() {
            this.f71953a = FilteringSequence.this.f71950a.iterator();
        }

        public final void a() {
            Object next;
            FilteringSequence filteringSequence;
            do {
                Iterator it = this.f71953a;
                if (!it.hasNext()) {
                    this.f71954b = 0;
                    return;
                } else {
                    next = it.next();
                    filteringSequence = FilteringSequence.this;
                }
            } while (((Boolean) filteringSequence.f71952c.invoke(next)).booleanValue() != filteringSequence.f71951b);
            this.f71955c = next;
            this.f71954b = 1;
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.f71954b == -1) {
                a();
            }
            return this.f71954b == 1;
        }

        @Override // java.util.Iterator
        public final Object next() {
            if (this.f71954b == -1) {
                a();
            }
            if (this.f71954b == 0) {
                throw new NoSuchElementException();
            }
            Object obj = this.f71955c;
            this.f71955c = null;
            this.f71954b = -1;
            return obj;
        }

        @Override // java.util.Iterator
        public final void remove() {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public FilteringSequence(Sequence sequence, boolean z11, Function1 predicate) {
        Intrinsics.g(sequence, "sequence");
        Intrinsics.g(predicate, "predicate");
        this.f71950a = sequence;
        this.f71951b = z11;
        this.f71952c = predicate;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new AnonymousClass1();
    }
}
