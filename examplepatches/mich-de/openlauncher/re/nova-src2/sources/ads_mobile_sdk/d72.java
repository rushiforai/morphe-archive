package ads_mobile_sdk;

import android.view.View;
import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class d72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f2200a;

    /* renamed from: b, reason: collision with root package name */
    public View f2201b;

    /* renamed from: c, reason: collision with root package name */
    public xr0 f2202c;

    /* renamed from: e, reason: collision with root package name */
    public d f2203e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f2204f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ m72 f2205g;

    /* renamed from: h, reason: collision with root package name */
    public int f2206h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d72(m72 m72Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2205g = m72Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2204f = obj;
        this.f2206h |= Integer.MIN_VALUE;
        return m72.a(this.f2205g, (View) null, (xr0) null, this);
    }
}
