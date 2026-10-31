package kotlin.sequences;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u00028\u00000\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/sequences/TakeWhileSequence;", "T", "Lkotlin/sequences/Sequence;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class TakeWhileSequence<T> implements Sequence<T> {

    /* renamed from: a, reason: collision with root package name */
    public final Sequence f71983a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f71984b;

    @Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010(\n\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00028\u00000\u0001¨\u0006\u0002"}, d2 = {"kotlin/sequences/TakeWhileSequence$iterator$1", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* renamed from: kotlin.sequences.TakeWhileSequence$iterator$1, reason: invalid class name */
    public final class AnonymousClass1 implements Iterator<Object>, KMappedMarker {

        /* renamed from: a, reason: collision with root package name */
        public final Iterator f71985a;

        /* renamed from: b, reason: collision with root package name */
        public int f71986b = -1;

        /* renamed from: c, reason: collision with root package name */
        public Object f71987c;

        public AnonymousClass1() {
            this.f71985a = TakeWhileSequence.this.f71983a.iterator();
        }

        public final void a() {
            Iterator it = this.f71985a;
            if (it.hasNext()) {
                Object next = it.next();
                if (((Boolean) TakeWhileSequence.this.f71984b.invoke(next)).booleanValue()) {
                    this.f71986b = 1;
                    this.f71987c = next;
                    return;
                }
            }
            this.f71986b = 0;
        }

        @Override // java.util.Iterator
        public final boolean hasNext() {
            if (this.f71986b == -1) {
                a();
            }
            return this.f71986b == 1;
        }

        @Override // java.util.Iterator
        public final Object next() {
            if (this.f71986b == -1) {
                a();
            }
            if (this.f71986b == 0) {
                throw new NoSuchElementException();
            }
            Object obj = this.f71987c;
            this.f71987c = null;
            this.f71986b = -1;
            return obj;
        }

        @Override // java.util.Iterator
        public final void remove() {
            throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    public TakeWhileSequence(Sequence sequence, Function1 predicate) {
        Intrinsics.g(sequence, "sequence");
        Intrinsics.g(predicate, "predicate");
        this.f71983a = sequence;
        this.f71984b = predicate;
    }

    @Override // kotlin.sequences.Sequence
    public final Iterator iterator() {
        return new AnonymousClass1();
    }
}
