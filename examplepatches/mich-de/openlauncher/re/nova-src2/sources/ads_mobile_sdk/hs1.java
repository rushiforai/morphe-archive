package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hs1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public js1 f4508a;

    /* renamed from: b, reason: collision with root package name */
    public qo3 f4509b;

    /* renamed from: c, reason: collision with root package name */
    public d f4510c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4511d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ js1 f4512e;

    /* renamed from: f, reason: collision with root package name */
    public int f4513f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hs1(js1 js1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4512e = js1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4511d = obj;
        this.f4513f |= Integer.MIN_VALUE;
        return js1.a(this.f4512e, null, this);
    }
}
