package o20;

import java.io.InputStream;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class h extends ContinuationImpl {
    public final /* synthetic */ l A;
    public int B;

    /* renamed from: t, reason: collision with root package name */
    public String f79423t;

    /* renamed from: u, reason: collision with root package name */
    public String f79424u;

    /* renamed from: v, reason: collision with root package name */
    public String f79425v;

    /* renamed from: w, reason: collision with root package name */
    public Integer f79426w;

    /* renamed from: x, reason: collision with root package name */
    public InputStream f79427x;

    /* renamed from: y, reason: collision with root package name */
    public int f79428y;

    /* renamed from: z, reason: collision with root package name */
    public /* synthetic */ Object f79429z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h(l lVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.A = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f79429z = obj;
        this.B |= Integer.MIN_VALUE;
        return this.A.b(null, null, null, null, this);
    }
}
