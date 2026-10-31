package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class gv1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public iv1 f4091a;

    /* renamed from: b, reason: collision with root package name */
    public zu1 f4092b;

    /* renamed from: c, reason: collision with root package name */
    public d f4093c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4094d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ iv1 f4095e;

    /* renamed from: f, reason: collision with root package name */
    public int f4096f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gv1(iv1 iv1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4095e = iv1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4094d = obj;
        this.f4096f |= Integer.MIN_VALUE;
        return this.f4095e.a(null, this, false);
    }
}
