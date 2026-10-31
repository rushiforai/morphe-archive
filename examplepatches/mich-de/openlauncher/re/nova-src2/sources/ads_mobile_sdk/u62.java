package ads_mobile_sdk;

import android.view.View;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public w62 f10212a;

    /* renamed from: b, reason: collision with root package name */
    public View f10213b;

    /* renamed from: c, reason: collision with root package name */
    public c80.a f10214c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f10215d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ w62 f10216e;

    /* renamed from: f, reason: collision with root package name */
    public int f10217f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10216e = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10215d = obj;
        this.f10217f |= Integer.MIN_VALUE;
        return w62.a(this.f10216e, (View) null, this);
    }
}
