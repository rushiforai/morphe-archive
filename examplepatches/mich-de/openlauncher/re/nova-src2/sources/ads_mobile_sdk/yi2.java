package ads_mobile_sdk;

import java.util.Iterator;
import java.util.List;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yi2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Iterator f12030a;

    /* renamed from: b, reason: collision with root package name */
    public int f12031b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f12032c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fl2 f12033d;

    /* renamed from: e, reason: collision with root package name */
    public int f12034e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yi2(fl2 fl2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12033d = fl2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12032c = obj;
        this.f12034e |= Integer.MIN_VALUE;
        return this.f12033d.a((List) null, this);
    }
}
