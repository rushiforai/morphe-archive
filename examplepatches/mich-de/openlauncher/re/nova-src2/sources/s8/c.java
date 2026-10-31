package s8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class c extends ContinuationImpl {
    public Ref.ObjectRef A;
    public /* synthetic */ Object B;
    public final /* synthetic */ h C;
    public int D;

    /* renamed from: t, reason: collision with root package name */
    public h f86717t;

    /* renamed from: u, reason: collision with root package name */
    public x8.k f86718u;

    /* renamed from: v, reason: collision with root package name */
    public Object f86719v;

    /* renamed from: w, reason: collision with root package name */
    public Object f86720w;

    /* renamed from: x, reason: collision with root package name */
    public Ref.ObjectRef f86721x;

    /* renamed from: y, reason: collision with root package name */
    public Ref.ObjectRef f86722y;

    /* renamed from: z, reason: collision with root package name */
    public Ref.ObjectRef f86723z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.C = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.B = obj;
        this.D |= Integer.MIN_VALUE;
        return h.b(this.C, null, null, null, null, this);
    }
}
