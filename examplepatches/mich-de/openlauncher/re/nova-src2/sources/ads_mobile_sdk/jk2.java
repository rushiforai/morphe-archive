package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import ni.a0;
import ui.o;

/* loaded from: classes2.dex */
public final class jk2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public fl2 f5275a;

    /* renamed from: b, reason: collision with root package name */
    public String f5276b;

    /* renamed from: c, reason: collision with root package name */
    public a0 f5277c;

    /* renamed from: d, reason: collision with root package name */
    public o f5278d;

    /* renamed from: e, reason: collision with root package name */
    public ni.z f5279e;

    /* renamed from: f, reason: collision with root package name */
    public d f5280f;

    /* renamed from: g, reason: collision with root package name */
    public fl2 f5281g;

    /* renamed from: h, reason: collision with root package name */
    public String f5282h;

    /* renamed from: i, reason: collision with root package name */
    public /* synthetic */ Object f5283i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ fl2 f5284j;

    /* renamed from: k, reason: collision with root package name */
    public int f5285k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jk2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5284j = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5283i = obj;
        this.f5285k |= Integer.MIN_VALUE;
        return fl2.a((ni.z) null, (a0) null, this.f5284j, (o) null, (String) null, this);
    }
}
