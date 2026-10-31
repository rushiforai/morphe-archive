package ads_mobile_sdk;

import java.io.Closeable;
import java.util.ArrayList;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class jj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f5260a;

    /* renamed from: b, reason: collision with root package name */
    public Object f5261b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f5262c;

    /* renamed from: d, reason: collision with root package name */
    public cc2 f5263d;

    /* renamed from: e, reason: collision with root package name */
    public ArrayList f5264e;

    /* renamed from: f, reason: collision with root package name */
    public fl2 f5265f;

    /* renamed from: g, reason: collision with root package name */
    public /* synthetic */ Object f5266g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ fl2 f5267h;

    /* renamed from: i, reason: collision with root package name */
    public int f5268i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5267h = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5266g = obj;
        this.f5268i |= Integer.MIN_VALUE;
        return this.f5267h.r(this);
    }
}
