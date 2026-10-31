package q20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import x80.h0;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ p B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public p f83498t;

    /* renamed from: u, reason: collision with root package name */
    public g f83499u;

    /* renamed from: v, reason: collision with root package name */
    public i20.d f83500v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.LongRef f83501w;

    /* renamed from: x, reason: collision with root package name */
    public List f83502x;

    /* renamed from: y, reason: collision with root package name */
    public Ref.ObjectRef f83503y;

    /* renamed from: z, reason: collision with root package name */
    public h0 f83504z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return this.B.t(null, this);
    }
}
