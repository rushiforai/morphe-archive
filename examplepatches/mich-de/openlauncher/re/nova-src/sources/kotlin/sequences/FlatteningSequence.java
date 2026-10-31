package kotlin.sequences;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u0002*\u0004\b\u0002\u0010\u00032\b\u0012\u0004\u0012\u00028\u00020\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/sequences/FlatteningSequence;", "T", "R", "E", "Lkotlin/sequences/Sequence;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class FlatteningSequence<T, R, E> implements Sequence<E> {

    /* renamed from: a, reason: collision with root package name */
    public final Sequence f71957a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f71958b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f71959c;

    @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/sequences/FlatteningSequence$iterator$1", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlin.sequences.FlatteningSequence$iterator$1, reason: invalid class name */
    public final class AnonymousClass1 implements Iterator<Object>, KMappedMarker {

        /* renamed from: a, reason: collision with root package name */
        public final Iterator f71960a;

        /* renamed from: b, reason: collision with root package name */
        public Iterator f71961b;

        /* renamed from: c, reason: collision with root package name */
        public int f71962c;

        public AnonymousClass1() {
            this.f71960a = FlatteningSequence.this.f71957a.iterator();
        }

        public final boolean a() {
            Iterator it;
            Iterator it2 = this.f71961b;
            if (it2 != null && it2.hasNext()) {
                this.f71962c = 1;
                return true;
            }
            do {
                Iterator it3 = this.f71960a;
                if (!it3.hasNext()) {
                    this.f71962c = 2;
                    this.f71961b = null;
                    return false;
                }
                Object next = it3.next();
                FlatteningSequence flatteningSequence = FlatteningSequence.this;
                it = (Iterator) flatteningSequence.f71959c.invoke(flatteningSequence.f71958b.invoke(next));
            } while (!it.hasNext());
            this.f71961b = it;
            this.f71962c = 1;
            return true;
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            int i5 = this.f71962c;
            if (i5 == 1) {
                return true;
            }
            if (i5 == 2) {
                return false;
            }
            return a();
        }

        @Override // java.util.Iterator
        public final Object next() {
            int i5 = this.f71962c;
            if (i5 == 2) {
                throw new NoSuchElementException();
            }
            if (i5 == 0 && !a()) {
                throw new NoSuchElementException();
            }
            this.f71962c = 0;
            Iterator it = this.f71961b;
            Intrinsics.d(it);
            return it.next();
        }

        @Override // java.util.Iterator
        public final void remove() {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public FlatteningSequence(Sequence sequence, Function1 transformer, Function1 function1) {
        Intrinsics.g(transformer, "transformer");
        this.f71957a = sequence;
        this.f71958b = transformer;
        this.f71959c = function1;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new AnonymousClass1();
    }
}
