package v6;

import android.adservices.measurement.MeasurementManager;
import android.net.Uri;
import android.view.InputEvent;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.k0;
import t70.m;
import u00.p;

/* loaded from: classes2.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public final MeasurementManager f92121a;

    public c(MeasurementManager mMeasurementManager) {
        Intrinsics.g(mMeasurementManager, "mMeasurementManager");
        this.f92121a = mMeasurementManager;
    }

    public static Object b(c cVar, a aVar, Continuation<? super Unit> continuation) {
        new m(1, IntrinsicsKt.b(continuation)).t();
        MeasurementManager measurementManager = cVar.f92121a;
        throw null;
    }

    public static Object d(c cVar, Continuation<? super Integer> continuation) {
        m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        cVar.f92121a.getMeasurementApiStatus(new f5.c(0), new w4.e(mVar));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static Object g(c cVar, Uri uri, InputEvent inputEvent, Continuation<? super Unit> continuation) {
        m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        cVar.f92121a.registerSource(uri, inputEvent, new f5.c(0), new w4.e(mVar));
        Object objS = mVar.s();
        return objS == CoroutineSingletons.f71806a ? objS : Unit.f71706a;
    }

    public static Object h(c cVar, d dVar, Continuation<? super Unit> continuation) {
        Object objD = k0.d(new p(cVar, null, 3), continuation);
        return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
    }

    public static Object j(c cVar, Uri uri, Continuation<? super Unit> continuation) {
        m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        cVar.f92121a.registerTrigger(uri, new f5.c(0), new w4.e(mVar));
        Object objS = mVar.s();
        return objS == CoroutineSingletons.f71806a ? objS : Unit.f71706a;
    }

    public static Object l(c cVar, e eVar, Continuation<? super Unit> continuation) {
        new m(1, IntrinsicsKt.b(continuation)).t();
        MeasurementManager measurementManager = cVar.f92121a;
        throw null;
    }

    public static Object n(c cVar, f fVar, Continuation<? super Unit> continuation) {
        new m(1, IntrinsicsKt.b(continuation)).t();
        MeasurementManager measurementManager = cVar.f92121a;
        throw null;
    }

    @Nullable
    public Object a(@NotNull a aVar, @NotNull Continuation<? super Unit> continuation) {
        return b(this, aVar, continuation);
    }

    @Nullable
    public Object c(@NotNull Continuation<? super Integer> continuation) {
        return d(this, continuation);
    }

    @Nullable
    public Object e(@NotNull Uri uri, @Nullable InputEvent inputEvent, @NotNull Continuation<? super Unit> continuation) {
        return g(this, uri, inputEvent, continuation);
    }

    @Nullable
    public Object f(@NotNull d dVar, @NotNull Continuation<? super Unit> continuation) {
        return h(this, dVar, continuation);
    }

    @Nullable
    public Object i(@NotNull Uri uri, @NotNull Continuation<? super Unit> continuation) {
        return j(this, uri, continuation);
    }

    @Nullable
    public Object k(@NotNull e eVar, @NotNull Continuation<? super Unit> continuation) {
        return l(this, eVar, continuation);
    }

    @Nullable
    public Object m(@NotNull f fVar, @NotNull Continuation<? super Unit> continuation) {
        return n(this, fVar, continuation);
    }
}
