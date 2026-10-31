package x80;

import ai.y0;
import com.google.android.gms.internal.measurement.le;
import java.io.Closeable;
import java.io.File;
import java.io.Flushable;
import java.io.IOException;
import java.util.Collection;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* loaded from: classes5.dex */
public final class f implements Closeable, Flushable {

    /* renamed from: a, reason: collision with root package name */
    public final z80.f f95482a;

    public f(File directory, long j11) {
        Intrinsics.g(directory, "directory");
        this.f95482a = new z80.f(directory, j11, a90.e.f524i);
    }

    public static void h(m0 cached, m0 m0Var) {
        y0 y0VarC;
        Intrinsics.g(cached, "cached");
        d dVar = new d(m0Var);
        p0 p0Var = cached.f95559g;
        Intrinsics.e(p0Var, "null cannot be cast to non-null type okhttp3.Cache.CacheResponseBody");
        z80.e eVar = ((c) p0Var).f95407d;
        try {
            y0VarC = eVar.f98324d.c(eVar.f98322b, eVar.f98321a);
            if (y0VarC == null) {
                return;
            }
            try {
                dVar.c(y0VarC);
                y0VarC.g();
            } catch (IOException unused) {
                if (y0VarC != null) {
                    try {
                        y0VarC.d();
                    } catch (IOException unused2) {
                    }
                }
            }
        } catch (IOException unused3) {
            y0VarC = null;
        }
    }

    public final void a() {
        z80.f fVar = this.f95482a;
        synchronized (fVar) {
            try {
                fVar.e();
                Collection collectionValues = fVar.f98337h.values();
                Intrinsics.f(collectionValues, "lruEntries.values");
                for (z80.d entry : (z80.d[]) collectionValues.toArray(new z80.d[0])) {
                    Intrinsics.f(entry, "entry");
                    fVar.A(entry);
                }
                fVar.n = false;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final m0 b(h0 request) throws IOException {
        Intrinsics.g(request, "request");
        w wVar = request.f95509a;
        try {
            z80.e eVarD = this.f95482a.d(p6.j.q(wVar));
            if (eVarD != null) {
                try {
                    d dVar = new d((m90.j0) eVarD.f98323c.get(0));
                    u uVar = dVar.f95423b;
                    String str = dVar.f95424c;
                    w url = dVar.f95422a;
                    u uVar2 = dVar.f95428g;
                    String strB = uVar2.b("Content-Type");
                    String strB2 = uVar2.b("Content-Length");
                    g0 g0Var = new g0();
                    Intrinsics.g(url, "url");
                    g0Var.f95504a = url;
                    g0Var.g(null, str);
                    g0Var.f(uVar);
                    h0 h0VarB = g0Var.b();
                    l0 l0Var = new l0();
                    l0Var.f95522a = h0VarB;
                    f0 protocol = dVar.f95425d;
                    Intrinsics.g(protocol, "protocol");
                    l0Var.f95523b = protocol;
                    l0Var.f95524c = dVar.f95426e;
                    String message = dVar.f95427f;
                    Intrinsics.g(message, "message");
                    l0Var.f95525d = message;
                    l0Var.c(uVar2);
                    l0Var.f95528g = new c(eVarD, strB, strB2);
                    l0Var.f95526e = dVar.f95429h;
                    l0Var.f95532k = dVar.f95430i;
                    l0Var.f95533l = dVar.f95431j;
                    m0 m0VarA = l0Var.a();
                    if (url.equals(wVar) && str.equals(request.f95510b)) {
                        Set<String> setE = p6.j.E(m0VarA.f95558f);
                        if (!(setE instanceof Collection) || !setE.isEmpty()) {
                            for (String str2 : setE) {
                                if (!Intrinsics.b(uVar.f(str2), request.f95511c.f(str2))) {
                                }
                            }
                        }
                        return m0VarA;
                    }
                    p0 p0Var = m0VarA.f95559g;
                    if (p0Var != null) {
                        y80.c.c(p0Var);
                        return null;
                    }
                } catch (IOException unused) {
                    y80.c.c(eVarD);
                }
            }
        } catch (IOException unused2) {
        }
        return null;
    }

    public final le c(m0 m0Var) {
        y0 y0VarC;
        h0 h0Var = m0Var.f95553a;
        String method = h0Var.f95510b;
        Intrinsics.g(method, "method");
        if (method.equals("POST") || method.equals("PATCH") || method.equals("PUT") || method.equals("DELETE") || method.equals("MOVE")) {
            try {
                d(h0Var);
            } catch (IOException unused) {
            }
            return null;
        }
        if (method.equals("GET") && !p6.j.E(m0Var.f95558f).contains("*")) {
            d dVar = new d(m0Var);
            try {
                z80.f fVar = this.f95482a;
                String strQ = p6.j.q(h0Var.f95509a);
                Regex regex = z80.f.f98325s;
                y0VarC = fVar.c(-1L, strQ);
                if (y0VarC != null) {
                    try {
                        dVar.c(y0VarC);
                        le leVar = new le();
                        leVar.f32796e = this;
                        leVar.f32793b = y0VarC;
                        m90.h0 h0VarN = y0VarC.N(1);
                        leVar.f32794c = h0VarN;
                        leVar.f32795d = new e(this, leVar, h0VarN);
                        return leVar;
                    } catch (IOException unused2) {
                        if (y0VarC != null) {
                            try {
                                y0VarC.d();
                            } catch (IOException unused3) {
                            }
                        }
                        return null;
                    }
                }
            } catch (IOException unused4) {
                y0VarC = null;
            }
        }
        return null;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f95482a.close();
    }

    public final void d(h0 request) {
        Intrinsics.g(request, "request");
        z80.f fVar = this.f95482a;
        String key = p6.j.q(request.f95509a);
        synchronized (fVar) {
            Intrinsics.g(key, "key");
            fVar.e();
            fVar.a();
            z80.f.K(key);
            z80.d dVar = (z80.d) fVar.f98337h.get(key);
            if (dVar == null) {
                return;
            }
            fVar.A(dVar);
            if (fVar.f98335f <= fVar.f98331b) {
                fVar.n = false;
            }
        }
    }

    public final synchronized void e() {
    }

    public final synchronized void f(ab.c0 c0Var) {
    }

    @Override // java.io.Flushable
    public final void flush() {
        this.f95482a.flush();
    }
}
