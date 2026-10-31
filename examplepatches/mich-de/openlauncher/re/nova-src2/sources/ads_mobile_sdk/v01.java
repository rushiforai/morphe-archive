package ads_mobile_sdk;

import java.util.UUID;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x80.m0;

/* loaded from: classes.dex */
public final class v01 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h11 f10530a;

    /* renamed from: b, reason: collision with root package name */
    public m0 f10531b;

    /* renamed from: c, reason: collision with root package name */
    public UUID f10532c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f10533d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h11 f10534e;

    /* renamed from: f, reason: collision with root package name */
    public int f10535f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v01(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10534e = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10533d = obj;
        this.f10535f |= Integer.MIN_VALUE;
        return this.f10534e.a((m0) null, (UUID) null, this);
    }
}
