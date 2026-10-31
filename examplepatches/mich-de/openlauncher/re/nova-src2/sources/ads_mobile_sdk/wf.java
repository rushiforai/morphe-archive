package ads_mobile_sdk;

import java.util.Iterator;
import java.util.Map;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class wf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ag f11250a;

    /* renamed from: b, reason: collision with root package name */
    public Map f11251b;

    /* renamed from: c, reason: collision with root package name */
    public Iterator f11252c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f11253d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ag f11254e;

    /* renamed from: f, reason: collision with root package name */
    public int f11255f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wf(ag agVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11254e = agVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11253d = obj;
        this.f11255f |= Integer.MIN_VALUE;
        return ag.b(this.f11254e, this);
    }
}
