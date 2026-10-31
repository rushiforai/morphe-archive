package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ia3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4703a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f4704b;

    /* renamed from: c, reason: collision with root package name */
    public Object f4705c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4706d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ti.r f4707e;

    /* renamed from: f, reason: collision with root package name */
    public int f4708f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ia3(ti.r rVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4707e = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4706d = obj;
        this.f4708f |= Integer.MIN_VALUE;
        return ti.r.c(this.f4707e, this);
    }
}
