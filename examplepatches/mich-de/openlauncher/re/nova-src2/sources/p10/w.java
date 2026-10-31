package p10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public y f81947t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f81948u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f81949v;

    /* renamed from: w, reason: collision with root package name */
    public int f81950w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f81949v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f81948u = obj;
        this.f81950w |= Integer.MIN_VALUE;
        return this.f81949v.e(this);
    }
}
