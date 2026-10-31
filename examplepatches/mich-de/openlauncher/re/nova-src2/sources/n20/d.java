package n20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import x80.h0;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {
    public Ref.IntRef A;
    public h0 B;
    public /* synthetic */ Object C;
    public final /* synthetic */ e D;
    public int E;

    /* renamed from: t, reason: collision with root package name */
    public e f77728t;

    /* renamed from: u, reason: collision with root package name */
    public b f77729u;

    /* renamed from: v, reason: collision with root package name */
    public i20.d f77730v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.LongRef f77731w;

    /* renamed from: x, reason: collision with root package name */
    public List f77732x;

    /* renamed from: y, reason: collision with root package name */
    public List f77733y;

    /* renamed from: z, reason: collision with root package name */
    public Ref.ObjectRef f77734z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.D = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.C = obj;
        this.E |= Integer.MIN_VALUE;
        return e.l(this.D, null, null, this);
    }
}
