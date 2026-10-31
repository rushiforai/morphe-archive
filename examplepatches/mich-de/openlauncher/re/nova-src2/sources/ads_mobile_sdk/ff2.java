package ads_mobile_sdk;

import b.f0;
import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ff2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public hf2 f3335a;

    /* renamed from: b, reason: collision with root package name */
    public Object f3336b;

    /* renamed from: c, reason: collision with root package name */
    public f0 f3337c;

    /* renamed from: d, reason: collision with root package name */
    public d f3338d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f3339e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ hf2 f3340f;

    /* renamed from: g, reason: collision with root package name */
    public int f3341g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ff2(hf2 hf2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3340f = hf2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3339e = obj;
        this.f3341g |= Integer.MIN_VALUE;
        return hf2.a(this.f3340f, null, null, this);
    }
}
