package j20;

import java.util.List;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import x80.h0;

/* loaded from: classes4.dex */
public final class g extends ContinuationImpl {
    public final /* synthetic */ h A;
    public int B;

    /* renamed from: t, reason: collision with root package name */
    public h f68752t;

    /* renamed from: u, reason: collision with root package name */
    public a f68753u;

    /* renamed from: v, reason: collision with root package name */
    public i20.d f68754v;

    /* renamed from: w, reason: collision with root package name */
    public List f68755w;

    /* renamed from: x, reason: collision with root package name */
    public Ref.ObjectRef f68756x;

    /* renamed from: y, reason: collision with root package name */
    public h0 f68757y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f68758z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.A = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68758z = obj;
        this.B |= Integer.MIN_VALUE;
        Object objO = this.A.o(null, this);
        return objO == CoroutineSingletons.f71806a ? objO : new Result(objO);
    }
}
