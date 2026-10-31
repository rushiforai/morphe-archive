package cs;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f47807t;

    /* renamed from: u, reason: collision with root package name */
    public String f47808u;

    /* renamed from: v, reason: collision with root package name */
    public u f47809v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f47810w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f47811x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ p f47812y;

    /* renamed from: z, reason: collision with root package name */
    public int f47813z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f47812y = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f47811x = obj;
        this.f47813z |= Integer.MIN_VALUE;
        return this.f47812y.a(null, null, null, this);
    }
}
