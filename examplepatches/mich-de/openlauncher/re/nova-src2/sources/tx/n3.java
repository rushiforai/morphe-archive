package tx;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n3 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f89909t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89910u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p3 f89911v;

    /* renamed from: w, reason: collision with root package name */
    public int f89912w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n3(p3 p3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89911v = p3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89910u = obj;
        this.f89912w |= Integer.MIN_VALUE;
        return this.f89911v.c(this);
    }
}
