package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ef1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public of1 f2857a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f2858b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f2859c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f2860d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ of1 f2861e;

    /* renamed from: f, reason: collision with root package name */
    public int f2862f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ef1(of1 of1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f2861e = of1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f2860d = obj;
        this.f2862f |= Integer.MIN_VALUE;
        return this.f2861e.b(this);
    }
}
