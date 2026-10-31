package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zt2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f12658a;

    /* renamed from: b, reason: collision with root package name */
    public d f12659b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f12660c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f12661d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f12662e;

    /* renamed from: f, reason: collision with root package name */
    public int f12663f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zt2(lu2 lu2Var, Continuation continuation) {
        super(continuation);
        this.f12662e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12661d = obj;
        this.f12663f |= Integer.MIN_VALUE;
        return this.f12662e.b(false, this);
    }
}
