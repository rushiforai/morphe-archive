package gx;

import android.app.Activity;
import java.util.Iterator;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class g0 extends ContinuationImpl {
    public Iterator A;
    public dx.f B;
    public e C;
    public long D;
    public long E;
    public /* synthetic */ Object F;
    public final /* synthetic */ i0 G;
    public int H;

    /* renamed from: t, reason: collision with root package name */
    public i0 f58069t;

    /* renamed from: u, reason: collision with root package name */
    public String f58070u;

    /* renamed from: v, reason: collision with root package name */
    public dx.j0 f58071v;

    /* renamed from: w, reason: collision with root package name */
    public Activity f58072w;

    /* renamed from: x, reason: collision with root package name */
    public String f58073x;

    /* renamed from: y, reason: collision with root package name */
    public String f58074y;

    /* renamed from: z, reason: collision with root package name */
    public Ref.ObjectRef f58075z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(i0 i0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.G = i0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.F = obj;
        this.H |= Integer.MIN_VALUE;
        Object objA = this.G.a(null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
