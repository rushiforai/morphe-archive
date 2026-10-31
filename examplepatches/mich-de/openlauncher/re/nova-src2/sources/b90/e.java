package b90;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import okhttp3.internal.http2.ConnectionShutdownException;
import okhttp3.internal.http2.StreamResetException;
import x80.h0;
import x80.k0;
import x80.l0;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final j f17664a;

    /* renamed from: b, reason: collision with root package name */
    public final f f17665b;

    /* renamed from: c, reason: collision with root package name */
    public final c90.d f17666c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f17667d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f17668e;

    /* renamed from: f, reason: collision with root package name */
    public final m f17669f;

    public e(j jVar, f finder, c90.d dVar) {
        Intrinsics.g(finder, "finder");
        this.f17664a = jVar;
        this.f17665b = finder;
        this.f17666c = dVar;
        this.f17669f = dVar.e();
    }

    public final IOException a(boolean z11, boolean z12, IOException iOException) {
        if (iOException != null) {
            d(iOException);
        }
        return this.f17664a.g(this, z12, z11, iOException);
    }

    public final c b(h0 request, boolean z11) {
        Intrinsics.g(request, "request");
        this.f17667d = z11;
        k0 k0Var = request.f95512d;
        Intrinsics.d(k0Var);
        long jContentLength = k0Var.contentLength();
        return new c(this, this.f17666c.f(request, jContentLength), jContentLength);
    }

    public final l0 c(boolean z11) throws IOException {
        try {
            l0 l0VarG = this.f17666c.g(z11);
            if (l0VarG == null) {
                return l0VarG;
            }
            l0VarG.f95534m = this;
            return l0VarG;
        } catch (IOException e3) {
            d(e3);
            throw e3;
        }
    }

    public final void d(IOException iOException) {
        this.f17668e = true;
        this.f17665b.c(iOException);
        m mVarE = this.f17666c.e();
        j jVar = this.f17664a;
        synchronized (mVarE) {
            try {
                if (!(iOException instanceof StreamResetException)) {
                    if (!(mVarE.f17708g != null) || (iOException instanceof ConnectionShutdownException)) {
                        mVarE.f17711j = true;
                        if (mVarE.f17714m == 0) {
                            m.d(jVar.f17684a, mVarE.f17703b, iOException);
                            mVarE.f17713l++;
                        }
                    }
                } else if (((StreamResetException) iOException).f80491a == 8) {
                    int i5 = mVarE.n + 1;
                    mVarE.n = i5;
                    if (i5 > 1) {
                        mVarE.f17711j = true;
                        mVarE.f17713l++;
                    }
                } else if (((StreamResetException) iOException).f80491a != 9 || !jVar.n) {
                    mVarE.f17711j = true;
                    mVarE.f17713l++;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
