package qw;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public v f84410t;

    /* renamed from: u, reason: collision with root package name */
    public String f84411u;

    /* renamed from: v, reason: collision with root package name */
    public Object f84412v;

    /* renamed from: w, reason: collision with root package name */
    public c80.a f84413w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f84414x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ v f84415y;

    /* renamed from: z, reason: collision with root package name */
    public int f84416z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(v vVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f84415y = vVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f84414x = obj;
        this.f84416z |= Integer.MIN_VALUE;
        return v.e(this.f84415y, null, null, this);
    }
}
