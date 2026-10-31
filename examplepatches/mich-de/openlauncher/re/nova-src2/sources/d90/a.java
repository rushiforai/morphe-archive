package d90;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;
import m90.l0;
import m90.p;

/* loaded from: classes5.dex */
public abstract class a implements j0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f49074a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f49075b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g f49076c;

    public a(g gVar) {
        this.f49076c = gVar;
        this.f49074a = new p(gVar.f49093c.timeout());
    }

    public final void a() {
        g gVar = this.f49076c;
        int i5 = gVar.f49095e;
        if (i5 == 6) {
            return;
        }
        if (i5 != 5) {
            throw new IllegalStateException("state: " + gVar.f49095e);
        }
        p pVar = this.f49074a;
        l0 l0Var = pVar.f76150e;
        pVar.f76150e = l0.f76140d;
        l0Var.a();
        l0Var.b();
        gVar.f49095e = 6;
    }

    @Override // m90.j0
    public long read(m90.g sink, long j11) throws IOException {
        g gVar = this.f49076c;
        Intrinsics.g(sink, "sink");
        try {
            return gVar.f49093c.read(sink, j11);
        } catch (IOException e3) {
            gVar.f49092b.k();
            a();
            throw e3;
        }
    }

    @Override // m90.j0
    public final l0 timeout() {
        return this.f49074a;
    }
}
