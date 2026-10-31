package ads_mobile_sdk;

import java.util.LinkedHashMap;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class zb extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ac f12507a;

    /* renamed from: b, reason: collision with root package name */
    public LinkedHashMap f12508b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f12509c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ac f12510d;

    /* renamed from: e, reason: collision with root package name */
    public int f12511e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zb(ac acVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12510d = acVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12509c = obj;
        this.f12511e |= Integer.MIN_VALUE;
        return this.f12510d.d(this);
    }
}
