package s8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x8.n;

/* loaded from: classes.dex */
public final class e extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ h B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public h f86731t;

    /* renamed from: u, reason: collision with root package name */
    public m8.b f86732u;

    /* renamed from: v, reason: collision with root package name */
    public x8.k f86733v;

    /* renamed from: w, reason: collision with root package name */
    public Object f86734w;

    /* renamed from: x, reason: collision with root package name */
    public n f86735x;

    /* renamed from: y, reason: collision with root package name */
    public m8.c f86736y;

    /* renamed from: z, reason: collision with root package name */
    public int f86737z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return this.B.c(null, null, null, null, null, this);
    }
}
