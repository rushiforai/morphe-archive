package c3;

import android.view.Choreographer;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class h1 implements Choreographer.FrameCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.m f19310a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f19311b;

    public h1(t70.m mVar, i1 i1Var, Function1 function1) {
        this.f19310a = mVar;
        this.f19311b = function1;
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j11) {
        Object objA;
        Function1 function1 = this.f19311b;
        try {
            int i5 = Result.f71687b;
            objA = function1.invoke(Long.valueOf(j11));
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        this.f19310a.resumeWith(objA);
    }
}
