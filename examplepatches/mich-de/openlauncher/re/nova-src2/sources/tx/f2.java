package tx;

import android.content.Context;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g2 f89729t;

    /* renamed from: u, reason: collision with root package name */
    public String f89730u;

    /* renamed from: v, reason: collision with root package name */
    public Context f89731v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f89732w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f89733x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ g2 f89734y;

    /* renamed from: z, reason: collision with root package name */
    public int f89735z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f2(g2 g2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89734y = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89733x = obj;
        this.f89735z |= Integer.MIN_VALUE;
        return this.f89734y.c(null, null, false, this);
    }
}
