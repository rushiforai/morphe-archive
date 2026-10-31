package eb0;

import b.u4;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class y implements d {

    /* renamed from: a, reason: collision with root package name */
    public final o0 f52667a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f52668b;

    /* renamed from: c, reason: collision with root package name */
    public final Object[] f52669c;

    /* renamed from: d, reason: collision with root package name */
    public final x80.h f52670d;

    /* renamed from: e, reason: collision with root package name */
    public final m f52671e;

    /* renamed from: f, reason: collision with root package name */
    public volatile boolean f52672f;

    /* renamed from: g, reason: collision with root package name */
    public b90.j f52673g;

    /* renamed from: h, reason: collision with root package name */
    public Throwable f52674h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f52675i;

    public y(o0 o0Var, Object obj, Object[] objArr, x80.h hVar, m mVar) {
        this.f52667a = o0Var;
        this.f52668b = obj;
        this.f52669c = objArr;
        this.f52670d = hVar;
        this.f52671e = mVar;
    }

    @Override // eb0.d
    public final synchronized x80.h0 S() {
        try {
        } catch (IOException e3) {
            throw new RuntimeException("Unable to create request.", e3);
        }
        return ((b90.j) c()).f17685b;
    }

    public final b90.j a() {
        x80.w wVarB;
        o0 o0Var = this.f52667a;
        w0[] w0VarArr = o0Var.f52627k;
        Object[] objArr = this.f52669c;
        int length = objArr.length;
        if (length != w0VarArr.length) {
            throw new IllegalArgumentException(b.c0.o(u4.j(length, "Argument count (", ") doesn't match expected count ("), w0VarArr.length, ")"));
        }
        m0 m0Var = new m0(o0Var.f52620d, o0Var.f52619c, o0Var.f52621e, o0Var.f52622f, o0Var.f52623g, o0Var.f52624h, o0Var.f52625i, o0Var.f52626j);
        if (o0Var.f52628l) {
            length--;
        }
        ArrayList arrayList = new ArrayList(length);
        for (int i5 = 0; i5 < length; i5++) {
            arrayList.add(objArr[i5]);
            w0VarArr[i5].a(m0Var, objArr[i5]);
        }
        x80.v vVar = m0Var.f52582d;
        if (vVar != null) {
            wVarB = vVar.b();
        } else {
            String link = m0Var.f52581c;
            x80.w wVar = m0Var.f52580b;
            wVar.getClass();
            Intrinsics.g(link, "link");
            x80.v vVarH = wVar.h(link);
            wVarB = vVarH != null ? vVarH.b() : null;
            if (wVarB == null) {
                throw new IllegalArgumentException("Malformed URL. Base: " + wVar + ", Relative: " + m0Var.f52581c);
            }
        }
        x80.k0 l0Var = m0Var.f52589k;
        if (l0Var == null) {
            of.f fVar = m0Var.f52588j;
            if (fVar != null) {
                l0Var = fVar.c();
            } else {
                vk.j jVar = m0Var.f52587i;
                if (jVar != null) {
                    ArrayList arrayList2 = (ArrayList) jVar.f92819d;
                    if (arrayList2.isEmpty()) {
                        throw new IllegalStateException("Multipart body must have at least one part.");
                    }
                    l0Var = new x80.c0((m90.j) jVar.f92817b, (x80.a0) jVar.f92818c, y80.c.v(arrayList2));
                } else if (m0Var.f52586h) {
                    l0Var = x80.k0.create((x80.a0) null, new byte[0]);
                }
            }
        }
        x80.a0 a0Var = m0Var.f52585g;
        o2.h hVar = m0Var.f52584f;
        if (a0Var != null) {
            if (l0Var != null) {
                l0Var = new l0(l0Var, a0Var);
            } else {
                hVar.a("Content-Type", a0Var.f95398a);
            }
        }
        x80.g0 g0Var = m0Var.f52583e;
        g0Var.getClass();
        g0Var.f95504a = wVarB;
        g0Var.f(hVar.f());
        g0Var.g(l0Var, m0Var.f52579a);
        g0Var.j(s.class, new s(o0Var.f52617a, this.f52668b, o0Var.f52618b, arrayList));
        return ((x80.e0) this.f52670d).c(g0Var.b());
    }

    public final x80.i c() throws IOException {
        b90.j jVar = this.f52673g;
        if (jVar != null) {
            return jVar;
        }
        Throwable th2 = this.f52674h;
        if (th2 != null) {
            if (th2 instanceof IOException) {
                throw ((IOException) th2);
            }
            if (th2 instanceof RuntimeException) {
                throw ((RuntimeException) th2);
            }
            throw ((Error) th2);
        }
        try {
            b90.j jVarA = a();
            this.f52673g = jVarA;
            return jVarA;
        } catch (IOException | Error | RuntimeException e3) {
            w0.s(e3);
            this.f52674h = e3;
            throw e3;
        }
    }

    @Override // eb0.d
    public final void cancel() {
        b90.j jVar;
        this.f52672f = true;
        synchronized (this) {
            jVar = this.f52673g;
        }
        if (jVar != null) {
            jVar.cancel();
        }
    }

    @Override // eb0.d
    /* renamed from: clone */
    public final d m293clone() {
        return new y(this.f52667a, this.f52668b, this.f52669c, this.f52670d, this.f52671e);
    }

    public final p0 d(x80.m0 m0Var) throws IOException {
        x80.p0 p0Var = m0Var.f95559g;
        x80.l0 l0VarD = m0Var.d();
        l0VarD.f95528g = new x(p0Var.contentType(), p0Var.contentLength());
        x80.m0 m0VarA = l0VarD.a();
        int i5 = m0VarA.f95556d;
        if (i5 < 200 || i5 >= 300) {
            try {
                m90.g gVar = new m90.g();
                p0Var.source().O(gVar);
                x80.p0 p0VarCreate = x80.p0.create(p0Var.contentType(), p0Var.contentLength(), gVar);
                Objects.requireNonNull(p0VarCreate, "body == null");
                if (m0VarA.c()) {
                    throw new IllegalArgumentException("rawResponse should not be successful response");
                }
                return new p0(m0VarA, null, p0VarCreate);
            } finally {
                p0Var.close();
            }
        }
        if (i5 == 204 || i5 == 205) {
            p0Var.close();
            if (m0VarA.c()) {
                return new p0(m0VarA, null, null);
            }
            throw new IllegalArgumentException("rawResponse must be successful response");
        }
        w wVar = new w(p0Var);
        try {
            Object objConvert = this.f52671e.convert(wVar);
            if (m0VarA.c()) {
                return new p0(m0VarA, objConvert, null);
            }
            throw new IllegalArgumentException("rawResponse must be successful response");
        } catch (RuntimeException e3) {
            IOException iOException = wVar.f52661f;
            if (iOException == null) {
                throw e3;
            }
            throw iOException;
        }
    }

    @Override // eb0.d
    public final boolean p() {
        boolean z11 = true;
        if (this.f52672f) {
            return true;
        }
        synchronized (this) {
            try {
                b90.j jVar = this.f52673g;
                if (jVar == null || !jVar.n) {
                    z11 = false;
                }
            } finally {
            }
        }
        return z11;
    }

    @Override // eb0.d
    public final void s(g gVar) {
        b90.j jVar;
        Throwable th2;
        synchronized (this) {
            try {
                if (this.f52675i) {
                    throw new IllegalStateException("Already executed.");
                }
                this.f52675i = true;
                jVar = this.f52673g;
                th2 = this.f52674h;
                if (jVar == null && th2 == null) {
                    try {
                        b90.j jVarA = a();
                        this.f52673g = jVarA;
                        jVar = jVarA;
                    } catch (Throwable th3) {
                        th2 = th3;
                        w0.s(th2);
                        this.f52674h = th2;
                    }
                }
            } catch (Throwable th4) {
                throw th4;
            }
        }
        if (th2 != null) {
            gVar.e(this, th2);
            return;
        }
        if (this.f52672f) {
            jVar.cancel();
        }
        io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c();
        cVar.f67328b = this;
        cVar.f67327a = gVar;
        jVar.b(cVar);
    }

    /* renamed from: clone, reason: collision with other method in class */
    public final Object m294clone() {
        return new y(this.f52667a, this.f52668b, this.f52669c, this.f52670d, this.f52671e);
    }
}
