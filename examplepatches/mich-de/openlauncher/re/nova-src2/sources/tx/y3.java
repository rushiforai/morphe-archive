package tx;

import android.content.Intent;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class y3 extends ContinuationImpl {
    public /* synthetic */ Object A;
    public int B;

    /* renamed from: t, reason: collision with root package name */
    public a4 f90071t;

    /* renamed from: u, reason: collision with root package name */
    public b4 f90072u;

    /* renamed from: v, reason: collision with root package name */
    public j.c f90073v;

    /* renamed from: w, reason: collision with root package name */
    public Intent f90074w;

    /* renamed from: x, reason: collision with root package name */
    public Object f90075x;

    /* renamed from: y, reason: collision with root package name */
    public int f90076y;

    /* renamed from: z, reason: collision with root package name */
    public long f90077z;

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.B |= Integer.MIN_VALUE;
        Object objB = a4.b(null, null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
