package lv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w70.i2;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e f75105t;

    /* renamed from: u, reason: collision with root package name */
    public i2 f75106u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f75107v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ e f75108w;

    /* renamed from: x, reason: collision with root package name */
    public int f75109x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75108w = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75107v = obj;
        this.f75109x |= Integer.MIN_VALUE;
        return this.f75108w.b(this);
    }
}
