package vf;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: d, reason: collision with root package name */
    public static final ve.e f92633d = new ve.e(2, -9223372036854775807L);

    /* renamed from: e, reason: collision with root package name */
    public static final ve.e f92634e = new ve.e(3, -9223372036854775807L);

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f92635a;

    /* renamed from: b, reason: collision with root package name */
    public z f92636b;

    /* renamed from: c, reason: collision with root package name */
    public IOException f92637c;

    public b0(String str) {
        String strConcat = "ExoPlayer:Loader:".concat(str);
        int i5 = wf.v.f94376a;
        this.f92635a = Executors.newSingleThreadExecutor(new wf.u(strConcat));
    }

    public final boolean a() {
        return this.f92636b != null;
    }
}
