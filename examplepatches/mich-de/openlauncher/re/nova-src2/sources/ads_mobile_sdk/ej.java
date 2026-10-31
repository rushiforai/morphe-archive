package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ej extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f2868a;

    /* renamed from: b, reason: collision with root package name */
    public d f2869b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f2870c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wj f2871d;

    /* renamed from: e, reason: collision with root package name */
    public int f2872e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ej(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2871d = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2870c = obj;
        this.f2872e |= Integer.MIN_VALUE;
        return wj.a$1(this.f2871d, this);
    }
}
