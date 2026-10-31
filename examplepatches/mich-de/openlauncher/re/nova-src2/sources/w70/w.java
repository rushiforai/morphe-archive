package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class w extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f94052t;

    /* renamed from: u, reason: collision with root package name */
    public int f94053u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ x f94054v;

    /* renamed from: w, reason: collision with root package name */
    public Object f94055w;

    /* renamed from: x, reason: collision with root package name */
    public n f94056x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(x xVar, Continuation continuation) {
        super(continuation);
        this.f94054v = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f94052t = obj;
        this.f94053u |= Integer.MIN_VALUE;
        return this.f94054v.collect(null, this);
    }
}
