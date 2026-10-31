package lv;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f75102t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e f75103u;

    /* renamed from: v, reason: collision with root package name */
    public int f75104v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75103u = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75102t = obj;
        this.f75104v |= Integer.MIN_VALUE;
        return this.f75103u.a(this);
    }
}
