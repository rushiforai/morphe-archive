package io.ktor.utils.io;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66615t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f66616u;

    /* renamed from: v, reason: collision with root package name */
    public int f66617v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f66616u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66615t = obj;
        this.f66617v |= Integer.MIN_VALUE;
        return this.f66616u.a(this);
    }
}
