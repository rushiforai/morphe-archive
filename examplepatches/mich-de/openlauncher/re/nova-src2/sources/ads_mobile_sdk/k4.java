package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public f5 f5491a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f5492b;

    /* renamed from: c, reason: collision with root package name */
    public th3 f5493c;

    /* renamed from: d, reason: collision with root package name */
    public d f5494d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f5495e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ f5 f5496f;

    /* renamed from: g, reason: collision with root package name */
    public int f5497g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5496f = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5495e = obj;
        this.f5497g |= Integer.MIN_VALUE;
        return this.f5496f.b(this);
    }
}
