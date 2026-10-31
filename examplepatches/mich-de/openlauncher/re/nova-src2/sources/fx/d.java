package fx;

import android.app.Activity;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f56157t;

    /* renamed from: u, reason: collision with root package name */
    public Activity f56158u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56159v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ e f56160w;

    /* renamed from: x, reason: collision with root package name */
    public int f56161x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(e eVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56160w = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56159v = obj;
        this.f56161x |= Integer.MIN_VALUE;
        return this.f56160w.a(null, null, this);
    }
}
