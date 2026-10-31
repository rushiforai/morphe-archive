package ads_mobile_sdk;

import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class pk1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f8297a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f8298b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f8299c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s50.l f8300d;

    /* renamed from: e, reason: collision with root package name */
    public int f8301e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public pk1(s50.l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f8300d = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f8299c = obj;
        this.f8301e |= Integer.MIN_VALUE;
        return this.f8300d.a(null, this);
    }
}
