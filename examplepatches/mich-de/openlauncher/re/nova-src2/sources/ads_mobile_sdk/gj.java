package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f3855a;

    /* renamed from: b, reason: collision with root package name */
    public d f3856b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f3857c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wj f3858d;

    /* renamed from: e, reason: collision with root package name */
    public int f3859e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3858d = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3857c = obj;
        this.f3859e |= Integer.MIN_VALUE;
        return this.f3858d.a(this);
    }
}
