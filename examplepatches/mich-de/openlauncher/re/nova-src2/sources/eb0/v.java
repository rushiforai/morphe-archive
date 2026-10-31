package eb0;

import java.io.IOException;

/* loaded from: classes5.dex */
public final class v extends m90.o {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f52655b = 0;

    /* renamed from: c, reason: collision with root package name */
    public Object f52656c;

    public /* synthetic */ v(m90.j0 j0Var) {
        super(j0Var);
    }

    @Override // m90.o, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        switch (this.f52655b) {
            case 2:
                ((x80.c) this.f52656c).f95407d.close();
                super.close();
                break;
            default:
                super.close();
                break;
        }
    }

    @Override // m90.o, m90.j0
    public long read(m90.g gVar, long j11) throws Exception {
        switch (this.f52655b) {
            case 0:
                try {
                    return super.read(gVar, j11);
                } catch (IOException e3) {
                    ((w) this.f52656c).f52661f = e3;
                    throw e3;
                }
            case 1:
                try {
                    return super.read(gVar, j11);
                } catch (Exception e11) {
                    this.f52656c = e11;
                    throw e11;
                }
            default:
                return super.read(gVar, j11);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(w wVar, m90.i iVar) {
        super(iVar);
        this.f52656c = wVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(m90.j0 j0Var, x80.c cVar) {
        super(j0Var);
        this.f52656c = cVar;
    }
}
