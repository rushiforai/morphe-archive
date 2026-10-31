package tx;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r f89898t;

    /* renamed from: u, reason: collision with root package name */
    public Context f89899u;

    /* renamed from: v, reason: collision with root package name */
    public String f89900v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f89901w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ r f89902x;

    /* renamed from: y, reason: collision with root package name */
    public int f89903y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n1(r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89902x = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89901w = obj;
        this.f89903y |= Integer.MIN_VALUE;
        return this.f89902x.e(null, null, this);
    }
}
