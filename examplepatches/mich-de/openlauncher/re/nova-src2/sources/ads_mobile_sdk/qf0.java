package ads_mobile_sdk;

import android.app.Activity;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class qf0 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8619a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f8620b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f8621c;

    /* renamed from: d, reason: collision with root package name */
    public Activity f8622d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f8623e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ rf0 f8624f;

    /* renamed from: g, reason: collision with root package name */
    public int f8625g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qf0(rf0 rf0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8624f = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8623e = obj;
        this.f8625g |= Integer.MIN_VALUE;
        return rf0.b(this.f8624f, this);
    }
}
