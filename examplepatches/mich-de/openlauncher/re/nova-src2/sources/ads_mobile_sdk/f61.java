package ads_mobile_sdk;

import cl.v;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class f61 {

    /* renamed from: a, reason: collision with root package name */
    public final b.w4 f3205a;

    /* renamed from: b, reason: collision with root package name */
    public final b.w4 f3206b;

    /* renamed from: c, reason: collision with root package name */
    public final ExecutorService f3207c;

    /* renamed from: d, reason: collision with root package name */
    public final b.w4 f3208d;

    /* renamed from: e, reason: collision with root package name */
    public v f3209e = null;

    public f61(b.w4 w4Var, b.w4 w4Var2, ExecutorService executorService, b.w4 w4Var3) {
        this.f3205a = w4Var;
        this.f3206b = w4Var2;
        this.f3207c = executorService;
        this.f3208d = w4Var3;
    }

    public final synchronized ListenableFuture a() {
        v vVar;
        vVar = this.f3209e;
        vVar.getClass();
        return vVar;
    }
}
