package ads_mobile_sdk;

import java.io.Closeable;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class l32 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f6048a;

    /* renamed from: b, reason: collision with root package name */
    public Object f6049b;

    /* renamed from: c, reason: collision with root package name */
    public Closeable f6050c;

    /* renamed from: d, reason: collision with root package name */
    public ti.p f6051d;

    /* renamed from: e, reason: collision with root package name */
    public th3 f6052e;

    /* renamed from: f, reason: collision with root package name */
    public th3 f6053f;

    /* renamed from: g, reason: collision with root package name */
    public b.h2 f6054g;

    /* renamed from: h, reason: collision with root package name */
    public long f6055h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f6056i;

    /* renamed from: j, reason: collision with root package name */
    public /* synthetic */ Object f6057j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ p32 f6058k;

    /* renamed from: l, reason: collision with root package name */
    public int f6059l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l32(p32 p32Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6058k = p32Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6057j = obj;
        this.f6059l |= Integer.MIN_VALUE;
        return p32.b(this.f6058k, this);
    }
}
