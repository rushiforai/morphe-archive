package tx;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f89919t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89920u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ r f89921v;

    /* renamed from: w, reason: collision with root package name */
    public int f89922w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89921v = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89920u = obj;
        this.f89922w |= Integer.MIN_VALUE;
        return this.f89921v.l(null, this);
    }
}
