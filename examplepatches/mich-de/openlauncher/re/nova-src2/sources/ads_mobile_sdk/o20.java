package ads_mobile_sdk;

import java.util.UUID;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class o20 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w20 f7736a;

    /* renamed from: b, reason: collision with root package name */
    public a21 f7737b;

    /* renamed from: c, reason: collision with root package name */
    public UUID f7738c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f7739d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ w20 f7740e;

    /* renamed from: f, reason: collision with root package name */
    public int f7741f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o20(w20 w20Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7740e = w20Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7739d = obj;
        this.f7741f |= Integer.MIN_VALUE;
        return this.f7740e.a((a21) null, (UUID) null, this);
    }
}
