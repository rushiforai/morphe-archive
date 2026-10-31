package q0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h2.c f83306t;

    /* renamed from: u, reason: collision with root package name */
    public Object[] f83307u;

    /* renamed from: v, reason: collision with root package name */
    public int f83308v;

    /* renamed from: w, reason: collision with root package name */
    public int f83309w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f83310x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ b f83311y;

    /* renamed from: z, reason: collision with root package name */
    public int f83312z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(b bVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f83311y = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f83310x = obj;
        this.f83312z |= Integer.MIN_VALUE;
        return this.f83311y.a(null, this);
    }
}
