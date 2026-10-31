package en;

import android.util.Log;
import bn.h1;
import bn.i1;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.k0;
import t70.m0;

/* loaded from: classes3.dex */
public final class o implements l {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f52849a;

    /* renamed from: b, reason: collision with root package name */
    public final h1 f52850b;

    /* renamed from: c, reason: collision with root package name */
    public final t5.g f52851c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicReference f52852d;

    public o(CoroutineContext backgroundDispatcher, h1 timeProvider, t5.g sessionConfigsDataStore) {
        Intrinsics.g(backgroundDispatcher, "backgroundDispatcher");
        Intrinsics.g(timeProvider, "timeProvider");
        Intrinsics.g(sessionConfigsDataStore, "sessionConfigsDataStore");
        this.f52849a = backgroundDispatcher;
        this.f52850b = timeProvider;
        this.f52851c = sessionConfigsDataStore;
        this.f52852d = new AtomicReference();
        m0.t(k0.a(backgroundDispatcher), null, null, new m(this, null, 0), 3);
    }

    public final h a() throws Throwable {
        AtomicReference atomicReference = this.f52852d;
        if (atomicReference.get() == null) {
            Object objU = m0.u(EmptyCoroutineContext.f71803a, new m(this, null, 1));
            while (!atomicReference.compareAndSet(null, objU) && atomicReference.get() == null) {
            }
        }
        Object obj = atomicReference.get();
        Intrinsics.f(obj, "get(...)");
        return (h) obj;
    }

    public final boolean b() {
        Long l9 = a().f52835e;
        Integer num = a().f52834d;
        return l9 == null || num == null || ((i1) this.f52850b).a().f18199c - l9.longValue() >= ((long) num.intValue());
    }

    public final Integer c() {
        return a().f52833c;
    }

    public final Double d() {
        return a().f52832b;
    }

    public final Boolean e() {
        return a().f52831a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(h hVar, ContinuationImpl continuationImpl) {
        n nVar;
        if (continuationImpl instanceof n) {
            nVar = (n) continuationImpl;
            int i5 = nVar.f52848v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nVar.f52848v = i5 - Integer.MIN_VALUE;
            } else {
                nVar = new n(this, continuationImpl);
            }
        }
        Object obj = nVar.f52846t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = nVar.f52848v;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                t5.g gVar = this.f52851c;
                androidx.room.c cVar = new androidx.room.c(hVar, null, 24);
                nVar.f52848v = 1;
                if (gVar.a(cVar, nVar) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
        } catch (IOException e3) {
            Log.w("FirebaseSessions", "Failed to update config values: " + e3);
        }
        return Unit.f71706a;
    }
}
