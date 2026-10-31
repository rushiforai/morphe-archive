package m8;

import android.graphics.Bitmap;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import x8.q;

/* loaded from: classes.dex */
public final class h extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public k f76060t;

    /* renamed from: u, reason: collision with root package name */
    public q f76061u;

    /* renamed from: v, reason: collision with root package name */
    public x8.k f76062v;

    /* renamed from: w, reason: collision with root package name */
    public c f76063w;

    /* renamed from: x, reason: collision with root package name */
    public Bitmap f76064x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f76065y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ k f76066z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(k kVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76066z = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76065y = obj;
        this.A |= Integer.MIN_VALUE;
        return k.a(this.f76066z, null, 0, this);
    }
}
