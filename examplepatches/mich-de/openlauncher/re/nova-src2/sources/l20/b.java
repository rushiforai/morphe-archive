package l20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x80.h0;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f74608t;

    /* renamed from: u, reason: collision with root package name */
    public Object f74609u;

    /* renamed from: v, reason: collision with root package name */
    public h0 f74610v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f74611w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ f f74612x;

    /* renamed from: y, reason: collision with root package name */
    public int f74613y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f74612x = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f74611w = obj;
        this.f74613y |= Integer.MIN_VALUE;
        return f.m(this.f74612x, null, null, this);
    }
}
