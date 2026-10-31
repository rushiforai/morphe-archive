package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import org.chromium.net.CronetEngine;

/* loaded from: classes.dex */
public final class v20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w20 f10548a;

    /* renamed from: b, reason: collision with root package name */
    public CronetEngine.Builder f10549b;

    /* renamed from: c, reason: collision with root package name */
    public Long f10550c;

    /* renamed from: d, reason: collision with root package name */
    public CronetEngine.Builder f10551d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10552e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ w20 f10553f;

    /* renamed from: g, reason: collision with root package name */
    public int f10554g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v20(w20 w20Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10553f = w20Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10552e = obj;
        this.f10554g |= Integer.MIN_VALUE;
        return w20.a(this.f10553f, (CronetEngine.Builder) null, (Long) null, this);
    }
}
