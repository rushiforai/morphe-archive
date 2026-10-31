package es;

import com.stripe.android.link.LinkConfiguration;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public LinkConfiguration f52926t;

    /* renamed from: u, reason: collision with root package name */
    public fs.h0 f52927u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f52928v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.link.f0 f52929w;

    /* renamed from: x, reason: collision with root package name */
    public int f52930x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(com.stripe.android.link.f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f52929w = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f52928v = obj;
        this.f52930x |= Integer.MIN_VALUE;
        Object objA = this.f52929w.a(null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
