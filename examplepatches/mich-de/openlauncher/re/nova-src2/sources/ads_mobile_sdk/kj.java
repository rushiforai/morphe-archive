package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class kj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f5748a;

    /* renamed from: b, reason: collision with root package name */
    public String f5749b;

    /* renamed from: c, reason: collision with root package name */
    public String f5750c;

    /* renamed from: d, reason: collision with root package name */
    public d f5751d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f5752e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ wj f5753f;

    /* renamed from: g, reason: collision with root package name */
    public int f5754g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public kj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5753f = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5752e = obj;
        this.f5754g |= Integer.MIN_VALUE;
        return this.f5753f.b(null, null, this);
    }
}
