package ads_mobile_sdk;

import c80.d;
import java.util.UUID;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u01 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public com.google.gson.r f10162a;

    /* renamed from: b, reason: collision with root package name */
    public d f10163b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10164c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ h11 f10165d;

    /* renamed from: e, reason: collision with root package name */
    public int f10166e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u01(h11 h11Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10165d = h11Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10164c = obj;
        this.f10166e |= Integer.MIN_VALUE;
        return this.f10165d.a((String) null, (UUID) null, (com.google.gson.r) null, this);
    }
}
