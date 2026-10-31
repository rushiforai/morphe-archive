package ads_mobile_sdk;

import android.os.Bundle;
import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class f03 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public i03 f3120a;

    /* renamed from: b, reason: collision with root package name */
    public Object f3121b;

    /* renamed from: c, reason: collision with root package name */
    public d f3122c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3123d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ i03 f3124e;

    /* renamed from: f, reason: collision with root package name */
    public int f3125f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f03(i03 i03Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3124e = i03Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3123d = obj;
        this.f3125f |= Integer.MIN_VALUE;
        return this.f3124e.a((Bundle) null, (Bundle) null, (mi.a) null, (String) null, (String) null, this);
    }
}
