package ads_mobile_sdk;

import c80.d;
import java.util.UUID;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class n20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public com.google.gson.r f7399a;

    /* renamed from: b, reason: collision with root package name */
    public d f7400b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7401c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w20 f7402d;

    /* renamed from: e, reason: collision with root package name */
    public int f7403e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n20(w20 w20Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7402d = w20Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7401c = obj;
        this.f7403e |= Integer.MIN_VALUE;
        return this.f7402d.a((String) null, (UUID) null, (com.google.gson.r) null, this);
    }
}
