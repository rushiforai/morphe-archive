package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class au2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public lu2 f1096a;

    /* renamed from: b, reason: collision with root package name */
    public Function1 f1097b;

    /* renamed from: c, reason: collision with root package name */
    public d f1098c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1099d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ lu2 f1100e;

    /* renamed from: f, reason: collision with root package name */
    public int f1101f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public au2(lu2 lu2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1100e = lu2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1099d = obj;
        this.f1101f |= Integer.MIN_VALUE;
        return this.f1100e.a((gb) null, (ContinuationImpl) this);
    }
}
