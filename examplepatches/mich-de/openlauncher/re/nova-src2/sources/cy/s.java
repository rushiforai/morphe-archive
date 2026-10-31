package cy;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Context f48528t;

    /* renamed from: u, reason: collision with root package name */
    public Object f48529u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f48530v;

    /* renamed from: w, reason: collision with root package name */
    public int f48531w;

    public s(ContinuationImpl continuationImpl) {
        super(continuationImpl);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48530v = obj;
        this.f48531w |= Integer.MIN_VALUE;
        return d0.t(this);
    }
}
