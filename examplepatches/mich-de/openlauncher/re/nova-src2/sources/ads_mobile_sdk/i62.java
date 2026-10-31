package ads_mobile_sdk;

import android.view.ViewGroup;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class i62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w62 f4640a;

    /* renamed from: b, reason: collision with root package name */
    public ViewGroup f4641b;

    /* renamed from: c, reason: collision with root package name */
    public xr0 f4642c;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f4643e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ w62 f4644f;

    /* renamed from: g, reason: collision with root package name */
    public int f4645g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4644f = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4643e = obj;
        this.f4645g |= Integer.MIN_VALUE;
        return w62.a(this.f4644f, null, null, this);
    }
}
