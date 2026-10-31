package vt;

import com.stripe.android.model.SetupIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public SetupIntent f93090t;

    /* renamed from: u, reason: collision with root package name */
    public p f93091u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f93092v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p f93093w;

    /* renamed from: x, reason: collision with root package name */
    public int f93094x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93093w = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93092v = obj;
        this.f93094x |= Integer.MIN_VALUE;
        return this.f93093w.a(null, null, null, this);
    }
}
