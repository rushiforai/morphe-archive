package ads_mobile_sdk;

import java.util.Collection;
import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class rx1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Collection f9344a;

    /* renamed from: b, reason: collision with root package name */
    public Iterator f9345b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9346c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ c7 f9347d;

    /* renamed from: e, reason: collision with root package name */
    public int f9348e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public rx1(c7 c7Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9347d = c7Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9346c = obj;
        this.f9348e |= Integer.MIN_VALUE;
        return this.f9347d.a((com.google.gson.r) null, (String) null, this);
    }
}
