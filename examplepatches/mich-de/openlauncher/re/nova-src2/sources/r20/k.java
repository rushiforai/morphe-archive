package r20;

import java.util.List;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import x80.g0;
import x80.v;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {
    public Ref.ObjectRef A;
    public Object B;
    public v C;
    public g0 D;
    public /* synthetic */ Object E;
    public final /* synthetic */ l F;
    public int G;

    /* renamed from: t, reason: collision with root package name */
    public l f85378t;

    /* renamed from: u, reason: collision with root package name */
    public b f85379u;

    /* renamed from: v, reason: collision with root package name */
    public c f85380v;

    /* renamed from: w, reason: collision with root package name */
    public i20.d f85381w;

    /* renamed from: x, reason: collision with root package name */
    public Map f85382x;

    /* renamed from: y, reason: collision with root package name */
    public Ref.LongRef f85383y;

    /* renamed from: z, reason: collision with root package name */
    public List f85384z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.F = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.E = obj;
        this.G |= Integer.MIN_VALUE;
        return this.F.o(null, null, null, null, this);
    }
}
