package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c23 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public e23 f1640a;

    /* renamed from: b, reason: collision with root package name */
    public y13 f1641b;

    /* renamed from: c, reason: collision with root package name */
    public d f1642c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1643d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ e23 f1644e;

    /* renamed from: f, reason: collision with root package name */
    public int f1645f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c23(e23 e23Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1644e = e23Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1643d = obj;
        this.f1645f |= Integer.MIN_VALUE;
        return e23.a(this.f1644e, null, this);
    }
}
