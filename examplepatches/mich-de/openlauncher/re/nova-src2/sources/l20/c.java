package l20;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import x80.h0;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {
    public /* synthetic */ Object A;
    public final /* synthetic */ f B;
    public int C;

    /* renamed from: t, reason: collision with root package name */
    public Object f74614t;

    /* renamed from: u, reason: collision with root package name */
    public Object f74615u;

    /* renamed from: v, reason: collision with root package name */
    public List f74616v;

    /* renamed from: w, reason: collision with root package name */
    public Ref.IntRef f74617w;

    /* renamed from: x, reason: collision with root package name */
    public List f74618x;

    /* renamed from: y, reason: collision with root package name */
    public Ref.ObjectRef f74619y;

    /* renamed from: z, reason: collision with root package name */
    public h0 f74620z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.B = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.A = obj;
        this.C |= Integer.MIN_VALUE;
        return f.n(this.B, null, this);
    }
}
