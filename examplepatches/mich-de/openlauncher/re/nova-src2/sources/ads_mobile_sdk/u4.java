package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u4 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f10196a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f10197b;

    /* renamed from: c, reason: collision with root package name */
    public Object f10198c;

    /* renamed from: d, reason: collision with root package name */
    public Object f10199d;

    /* renamed from: e, reason: collision with root package name */
    public /* synthetic */ Object f10200e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ f5 f10201f;

    /* renamed from: g, reason: collision with root package name */
    public int f10202g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u4(f5 f5Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10201f = f5Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10200e = obj;
        this.f10202g |= Integer.MIN_VALUE;
        return this.f10201f.f(this);
    }
}
