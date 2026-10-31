package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ t B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public String f89981t;

    /* renamed from: u, reason: collision with root package name */
    public String f89982u;

    /* renamed from: v, reason: collision with root package name */
    public String f89983v;

    /* renamed from: w, reason: collision with root package name */
    public String f89984w;

    /* renamed from: x, reason: collision with root package name */
    public String f89985x;

    /* renamed from: y, reason: collision with root package name */
    public String f89986y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f89987z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(t tVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = tVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return this.B.a(null, null, null, null, null, false, this);
    }
}
