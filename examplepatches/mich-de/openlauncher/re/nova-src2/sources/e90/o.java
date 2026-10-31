package e90;

import java.io.Closeable;
import java.io.IOException;

/* loaded from: classes5.dex */
public final class o extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f52340e = 0;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Closeable f52341f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(z80.f fVar, String str) {
        super(str, true);
        this.f52341f = fVar;
    }

    @Override // a90.a
    public final long a() throws IOException {
        switch (this.f52340e) {
            case 0:
                q qVar = (q) this.f52341f;
                qVar.getClass();
                try {
                    qVar.f52366w.f(2, 0, false);
                    return -1L;
                } catch (IOException e3) {
                    qVar.a(2, 2, e3);
                    return -1L;
                }
            default:
                z80.f fVar = (z80.f) this.f52341f;
                synchronized (fVar) {
                    if (!fVar.f98341l || fVar.f98342m) {
                        return -1L;
                    }
                    try {
                        fVar.D();
                    } catch (IOException unused) {
                        fVar.n = true;
                    }
                    try {
                        if (fVar.f()) {
                            fVar.w();
                            fVar.f98338i = 0;
                        }
                    } catch (IOException unused2) {
                        fVar.o = true;
                        fVar.f98336g = x7.f.q(new m90.f());
                    }
                    return -1L;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(String str, q qVar) {
        super(str, true);
        this.f52341f = qVar;
    }
}
