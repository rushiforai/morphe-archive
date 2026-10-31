package ads_mobile_sdk;

import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class wj2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f11305a;

    /* renamed from: b, reason: collision with root package name */
    public Object f11306b;

    /* renamed from: c, reason: collision with root package name */
    public Object f11307c;

    /* renamed from: d, reason: collision with root package name */
    public Object f11308d;

    /* renamed from: e, reason: collision with root package name */
    public int f11309e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f11310f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ fl2 f11311g;

    /* renamed from: h, reason: collision with root package name */
    public int f11312h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wj2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11311g = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11310f = obj;
        this.f11312h |= Integer.MIN_VALUE;
        return this.f11311g.c((List) null, this);
    }
}
