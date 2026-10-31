package x80;

import java.io.Closeable;
import java.io.EOFException;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class m0 implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f95553a;

    /* renamed from: b, reason: collision with root package name */
    public final f0 f95554b;

    /* renamed from: c, reason: collision with root package name */
    public final String f95555c;

    /* renamed from: d, reason: collision with root package name */
    public final int f95556d;

    /* renamed from: e, reason: collision with root package name */
    public final t f95557e;

    /* renamed from: f, reason: collision with root package name */
    public final u f95558f;

    /* renamed from: g, reason: collision with root package name */
    public final p0 f95559g;

    /* renamed from: h, reason: collision with root package name */
    public final m0 f95560h;

    /* renamed from: i, reason: collision with root package name */
    public final m0 f95561i;

    /* renamed from: j, reason: collision with root package name */
    public final m0 f95562j;

    /* renamed from: k, reason: collision with root package name */
    public final long f95563k;

    /* renamed from: l, reason: collision with root package name */
    public final long f95564l;

    /* renamed from: m, reason: collision with root package name */
    public final b90.e f95565m;
    public g n;

    public m0(h0 request, f0 protocol, String message, int i5, t tVar, u uVar, p0 p0Var, m0 m0Var, m0 m0Var2, m0 m0Var3, long j11, long j12, b90.e eVar) {
        Intrinsics.g(request, "request");
        Intrinsics.g(protocol, "protocol");
        Intrinsics.g(message, "message");
        this.f95553a = request;
        this.f95554b = protocol;
        this.f95555c = message;
        this.f95556d = i5;
        this.f95557e = tVar;
        this.f95558f = uVar;
        this.f95559g = p0Var;
        this.f95560h = m0Var;
        this.f95561i = m0Var2;
        this.f95562j = m0Var3;
        this.f95563k = j11;
        this.f95564l = j12;
        this.f95565m = eVar;
    }

    public final g a() {
        g gVar = this.n;
        if (gVar != null) {
            return gVar;
        }
        g gVar2 = g.n;
        g gVarO = w20.h.o(this.f95558f);
        this.n = gVarO;
        return gVarO;
    }

    public final String b(String str, String str2) {
        String strB = this.f95558f.b(str);
        return strB == null ? str2 : strB;
    }

    public final boolean c() {
        int i5 = this.f95556d;
        return 200 <= i5 && i5 < 300;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        p0 p0Var = this.f95559g;
        if (p0Var == null) {
            throw new IllegalStateException("response is not eligible for a body and must not be closed");
        }
        p0Var.close();
    }

    public final l0 d() {
        l0 l0Var = new l0();
        l0Var.f95522a = this.f95553a;
        l0Var.f95523b = this.f95554b;
        l0Var.f95524c = this.f95556d;
        l0Var.f95525d = this.f95555c;
        l0Var.f95526e = this.f95557e;
        l0Var.f95527f = this.f95558f.d();
        l0Var.f95528g = this.f95559g;
        l0Var.f95529h = this.f95560h;
        l0Var.f95530i = this.f95561i;
        l0Var.f95531j = this.f95562j;
        l0Var.f95532k = this.f95563k;
        l0Var.f95533l = this.f95564l;
        l0Var.f95534m = this.f95565m;
        return l0Var;
    }

    public final c90.g e(long j11) throws EOFException {
        p0 p0Var = this.f95559g;
        Intrinsics.d(p0Var);
        m90.d0 d0VarPeek = p0Var.source().peek();
        m90.g gVar = new m90.g();
        d0VarPeek.j(j11);
        long jMin = Math.min(j11, d0VarPeek.f76105b.f76126b);
        while (jMin > 0) {
            long j12 = d0VarPeek.read(gVar, jMin);
            if (j12 == -1) {
                throw new EOFException();
            }
            jMin -= j12;
        }
        o0 o0Var = p0.Companion;
        a0 a0VarContentType = p0Var.contentType();
        long j13 = gVar.f76126b;
        o0Var.getClass();
        return o0.b(gVar, a0VarContentType, j13);
    }

    public final String toString() {
        return "Response{protocol=" + this.f95554b + ", code=" + this.f95556d + ", message=" + this.f95555c + ", url=" + this.f95553a.f95509a + AbstractJsonLexerKt.END_OBJ;
    }
}
