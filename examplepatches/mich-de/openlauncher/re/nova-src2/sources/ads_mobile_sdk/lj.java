package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f6241a;

    /* renamed from: b, reason: collision with root package name */
    public String f6242b;

    /* renamed from: c, reason: collision with root package name */
    public String f6243c;

    /* renamed from: d, reason: collision with root package name */
    public d f6244d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f6245e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ wj f6246f;

    /* renamed from: g, reason: collision with root package name */
    public int f6247g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6246f = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6245e = obj;
        this.f6247g |= Integer.MIN_VALUE;
        return this.f6246f.c(null, null, this);
    }
}
