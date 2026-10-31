package ads_mobile_sdk;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class k extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public l f5454a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f5455b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5456c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ l f5457d;

    /* renamed from: e, reason: collision with root package name */
    public int f5458e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5457d = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5456c = obj;
        this.f5458e |= Integer.MIN_VALUE;
        return this.f5457d.a(null, this);
    }
}
