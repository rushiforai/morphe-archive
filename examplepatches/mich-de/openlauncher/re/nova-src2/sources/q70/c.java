package q70;

import java.util.Iterator;
import java.util.NoSuchElementException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.sequences.SequenceScope;

/* loaded from: classes.dex */
public final class c extends SequenceScope implements Iterator, Continuation, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public int f83785a;

    /* renamed from: b, reason: collision with root package name */
    public Object f83786b;

    /* renamed from: c, reason: collision with root package name */
    public Iterator f83787c;

    /* renamed from: d, reason: collision with root package name */
    public Continuation f83788d;

    @Override // kotlin.sequences.SequenceScope
    public final void c(Object obj, Continuation frame) {
        this.f83786b = obj;
        this.f83785a = 3;
        this.f83788d = frame;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        Intrinsics.g(frame, "frame");
    }

    @Override // kotlin.sequences.SequenceScope
    public final Object d(Iterator it, RestrictedSuspendLambda restrictedSuspendLambda) {
        if (!it.hasNext()) {
            return Unit.f71706a;
        }
        this.f83787c = it;
        this.f83785a = 2;
        this.f83788d = restrictedSuspendLambda;
        return CoroutineSingletons.f71806a;
    }

    public final RuntimeException e() {
        int i5 = this.f83785a;
        if (i5 == 4) {
            return new NoSuchElementException();
        }
        if (i5 == 5) {
            return new IllegalStateException("Iterator has failed.");
        }
        return new IllegalStateException("Unexpected state of the iterator: " + this.f83785a);
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return EmptyCoroutineContext.f71803a;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        while (true) {
            int i5 = this.f83785a;
            if (i5 != 0) {
                if (i5 != 1) {
                    if (i5 == 2 || i5 == 3) {
                        return true;
                    }
                    if (i5 == 4) {
                        return false;
                    }
                    throw e();
                }
                Iterator it = this.f83787c;
                Intrinsics.d(it);
                if (it.hasNext()) {
                    this.f83785a = 2;
                    return true;
                }
                this.f83787c = null;
            }
            this.f83785a = 5;
            Continuation continuation = this.f83788d;
            Intrinsics.d(continuation);
            this.f83788d = null;
            int i11 = Result.f71687b;
            continuation.resumeWith(Unit.f71706a);
        }
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f83785a;
        if (i5 == 0 || i5 == 1) {
            if (hasNext()) {
                return next();
            }
            throw new NoSuchElementException();
        }
        if (i5 == 2) {
            this.f83785a = 1;
            Iterator it = this.f83787c;
            Intrinsics.d(it);
            return it.next();
        }
        if (i5 != 3) {
            throw e();
        }
        this.f83785a = 0;
        Object obj = this.f83786b;
        this.f83786b = null;
        return obj;
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        ResultKt.b(obj);
        this.f83785a = 4;
    }
}
