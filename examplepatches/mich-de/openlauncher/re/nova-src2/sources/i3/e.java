package i3;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f61234t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f f61235u;

    /* renamed from: v, reason: collision with root package name */
    public int f61236v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f61235u = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f61234t = obj;
        this.f61236v |= Integer.MIN_VALUE;
        return this.f61235u.b(0.0f, this);
    }
}
