package x80;

import ai.y0;
import com.google.android.gms.internal.measurement.le;

/* loaded from: classes5.dex */
public final class e extends m90.n {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f95456b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ le f95457c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, le leVar, m90.h0 h0Var) {
        super(h0Var);
        this.f95456b = fVar;
        this.f95457c = leVar;
    }

    @Override // m90.n, m90.h0, java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        f fVar = this.f95456b;
        le leVar = this.f95457c;
        synchronized (fVar) {
            if (leVar.f32792a) {
                return;
            }
            leVar.f32792a = true;
            super.close();
            ((y0) this.f95457c.f32793b).g();
        }
    }
}
