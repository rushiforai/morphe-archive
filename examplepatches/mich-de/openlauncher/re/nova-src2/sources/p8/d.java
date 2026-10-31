package p8;

import ai.y0;
import androidx.fragment.app.p;
import h6.c1;
import java.io.Closeable;
import java.io.EOFException;
import java.io.Flushable;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.ExceptionsKt;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m90.c0;
import m90.d0;
import m90.m;
import m90.z;
import r70.j;
import r70.k;
import t70.k0;
import t70.m0;

/* loaded from: classes2.dex */
public final class d implements Closeable, Flushable {

    /* renamed from: q, reason: collision with root package name */
    public static final Regex f82433q = new Regex("[a-z0-9_-]{1,120}");

    /* renamed from: a, reason: collision with root package name */
    public final z f82434a;

    /* renamed from: b, reason: collision with root package name */
    public final long f82435b;

    /* renamed from: c, reason: collision with root package name */
    public final z f82436c;

    /* renamed from: d, reason: collision with root package name */
    public final z f82437d;

    /* renamed from: e, reason: collision with root package name */
    public final z f82438e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedHashMap f82439f;

    /* renamed from: g, reason: collision with root package name */
    public final y70.d f82440g;

    /* renamed from: h, reason: collision with root package name */
    public long f82441h;

    /* renamed from: i, reason: collision with root package name */
    public int f82442i;

    /* renamed from: j, reason: collision with root package name */
    public c0 f82443j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f82444k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f82445l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f82446m;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final c f82447p;

    public d(long j11, m mVar, z zVar, t70.c0 c0Var) {
        this.f82434a = zVar;
        this.f82435b = j11;
        if (j11 <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.f82436c = zVar.g("journal");
        this.f82437d = zVar.g("journal.tmp");
        this.f82438e = zVar.g("journal.bkp");
        this.f82439f = new LinkedHashMap(0, 0.75f, true);
        this.f82440g = k0.a(CoroutineContext.Element.DefaultImpls.d(m0.d(), c0Var.f0(1, null)));
        this.f82447p = new c(mVar);
    }

    public static void A(String str) {
        if (!f82433q.f(str)) {
            throw new IllegalArgumentException(c1.m(AbstractJsonLexerKt.STRING, "keys must match regex [a-z0-9_-]{1,120}: \"", str).toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x011b A[Catch: all -> 0x0035, TRY_LEAVE, TryCatch #0 {, blocks: (B:3:0x0001, B:7:0x0011, B:11:0x0018, B:13:0x0020, B:15:0x0030, B:23:0x003e, B:25:0x0056, B:29:0x0073, B:31:0x0083, B:33:0x008a, B:26:0x005c, B:28:0x006c, B:37:0x00aa, B:39:0x00b1, B:42:0x00b6, B:44:0x00c7, B:47:0x00cc, B:52:0x0107, B:54:0x0112, B:58:0x011b, B:48:0x00e4, B:50:0x00f9, B:51:0x0104, B:36:0x009a, B:61:0x0120, B:62:0x0127), top: B:65:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(d dVar, y0 y0Var, boolean z11) {
        synchronized (dVar) {
            a aVar = (a) y0Var.f13475c;
            if (!Intrinsics.b(aVar.f82426g, y0Var)) {
                throw new IllegalStateException("Check failed.");
            }
            if (!z11 || aVar.f82425f) {
                for (int i5 = 0; i5 < 2; i5++) {
                    dVar.f82447p.f((z) aVar.f82423d.get(i5));
                }
            } else {
                for (int i11 = 0; i11 < 2; i11++) {
                    if (((boolean[]) y0Var.f13476d)[i11] && !dVar.f82447p.g((z) aVar.f82423d.get(i11))) {
                        y0Var.h(false);
                        return;
                    }
                }
                for (int i12 = 0; i12 < 2; i12++) {
                    z zVar = (z) aVar.f82423d.get(i12);
                    z zVar2 = (z) aVar.f82422c.get(i12);
                    if (dVar.f82447p.g(zVar)) {
                        dVar.f82447p.b(zVar, zVar2);
                    } else {
                        c cVar = dVar.f82447p;
                        z zVar3 = (z) aVar.f82422c.get(i12);
                        if (!cVar.g(zVar3)) {
                            c9.g.a(cVar.m(zVar3));
                        }
                    }
                    long j11 = aVar.f82421b[i12];
                    Long l9 = (Long) dVar.f82447p.i(zVar2).f59102e;
                    long jLongValue = l9 != null ? l9.longValue() : 0L;
                    aVar.f82421b[i12] = jLongValue;
                    dVar.f82441h = (dVar.f82441h - j11) + jLongValue;
                }
            }
            aVar.f82426g = null;
            if (aVar.f82425f) {
                dVar.s(aVar);
                return;
            }
            dVar.f82442i++;
            c0 c0Var = dVar.f82443j;
            Intrinsics.d(c0Var);
            if (z11 || aVar.f82424e) {
                aVar.f82424e = true;
                c0Var.u("CLEAN");
                c0Var.writeByte(32);
                c0Var.u(aVar.f82420a);
                for (long j12 : aVar.f82421b) {
                    c0Var.writeByte(32);
                    c0Var.E(j12);
                }
                c0Var.writeByte(10);
            } else {
                dVar.f82439f.remove(aVar.f82420a);
                c0Var.u("REMOVE");
                c0Var.writeByte(32);
                c0Var.u(aVar.f82420a);
                c0Var.writeByte(10);
            }
            c0Var.flush();
            if (dVar.f82441h > dVar.f82435b) {
                dVar.e();
            } else if (dVar.f82442i >= 2000) {
            }
        }
    }

    public final synchronized void D() {
        Unit unit;
        try {
            c0 c0Var = this.f82443j;
            if (c0Var != null) {
                c0Var.close();
            }
            c0 c0VarQ = x7.f.q(this.f82447p.m(this.f82437d));
            Throwable th2 = null;
            try {
                c0VarQ.u("libcore.io.DiskLruCache");
                c0VarQ.writeByte(10);
                c0VarQ.u("1");
                c0VarQ.writeByte(10);
                c0VarQ.E(1);
                c0VarQ.writeByte(10);
                c0VarQ.E(2);
                c0VarQ.writeByte(10);
                c0VarQ.writeByte(10);
                for (a aVar : this.f82439f.values()) {
                    if (aVar.f82426g != null) {
                        c0VarQ.u("DIRTY");
                        c0VarQ.writeByte(32);
                        c0VarQ.u(aVar.f82420a);
                        c0VarQ.writeByte(10);
                    } else {
                        c0VarQ.u("CLEAN");
                        c0VarQ.writeByte(32);
                        c0VarQ.u(aVar.f82420a);
                        for (long j11 : aVar.f82421b) {
                            c0VarQ.writeByte(32);
                            c0VarQ.E(j11);
                        }
                        c0VarQ.writeByte(10);
                    }
                }
                unit = Unit.f71706a;
                try {
                    c0VarQ.close();
                } catch (Throwable th3) {
                    th2 = th3;
                }
            } catch (Throwable th4) {
                try {
                    c0VarQ.close();
                } catch (Throwable th5) {
                    ExceptionsKt.a(th4, th5);
                }
                unit = null;
                th2 = th4;
            }
            if (th2 != null) {
                throw th2;
            }
            Intrinsics.d(unit);
            if (this.f82447p.g(this.f82436c)) {
                this.f82447p.b(this.f82436c, this.f82438e);
                this.f82447p.b(this.f82437d, this.f82436c);
                this.f82447p.f(this.f82438e);
            } else {
                this.f82447p.b(this.f82437d, this.f82436c);
            }
            this.f82443j = f();
            this.f82442i = 0;
            this.f82444k = false;
            this.o = false;
        } catch (Throwable th6) {
            throw th6;
        }
    }

    public final synchronized y0 b(String str) {
        if (this.f82446m) {
            throw new IllegalStateException("cache is closed");
        }
        A(str);
        d();
        a aVar = (a) this.f82439f.get(str);
        if ((aVar != null ? aVar.f82426g : null) != null) {
            return null;
        }
        if (aVar != null && aVar.f82427h != 0) {
            return null;
        }
        if (!this.n && !this.o) {
            c0 c0Var = this.f82443j;
            Intrinsics.d(c0Var);
            c0Var.u("DIRTY");
            c0Var.writeByte(32);
            c0Var.u(str);
            c0Var.writeByte(10);
            c0Var.flush();
            if (this.f82444k) {
                return null;
            }
            if (aVar == null) {
                aVar = new a(this, str);
                this.f82439f.put(str, aVar);
            }
            y0 y0Var = new y0(this, aVar);
            aVar.f82426g = y0Var;
            return y0Var;
        }
        e();
        return null;
    }

    public final synchronized b c(String str) {
        b bVarA;
        if (this.f82446m) {
            throw new IllegalStateException("cache is closed");
        }
        A(str);
        d();
        a aVar = (a) this.f82439f.get(str);
        if (aVar != null && (bVarA = aVar.a()) != null) {
            boolean z11 = true;
            this.f82442i++;
            c0 c0Var = this.f82443j;
            Intrinsics.d(c0Var);
            c0Var.u("READ");
            c0Var.writeByte(32);
            c0Var.u(str);
            c0Var.writeByte(10);
            if (this.f82442i < 2000) {
                z11 = false;
            }
            if (z11) {
                e();
            }
            return bVarA;
        }
        return null;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        try {
            if (this.f82445l && !this.f82446m) {
                for (a aVar : (a[]) this.f82439f.values().toArray(new a[0])) {
                    y0 y0Var = aVar.f82426g;
                    if (y0Var != null) {
                        a aVar2 = (a) y0Var.f13475c;
                        if (Intrinsics.b(aVar2.f82426g, y0Var)) {
                            aVar2.f82425f = true;
                        }
                    }
                }
                w();
                k0.c(this.f82440g, null);
                c0 c0Var = this.f82443j;
                Intrinsics.d(c0Var);
                c0Var.close();
                this.f82443j = null;
                this.f82446m = true;
                return;
            }
            this.f82446m = true;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void d() {
        try {
            if (this.f82445l) {
                return;
            }
            this.f82447p.f(this.f82437d);
            if (this.f82447p.g(this.f82438e)) {
                if (this.f82447p.g(this.f82436c)) {
                    this.f82447p.f(this.f82438e);
                } else {
                    this.f82447p.b(this.f82438e, this.f82436c);
                }
            }
            if (this.f82447p.g(this.f82436c)) {
                try {
                    l();
                    h();
                    this.f82445l = true;
                    return;
                } catch (IOException unused) {
                    try {
                        close();
                        zg.a.u(this.f82447p, this.f82434a);
                        this.f82446m = false;
                    } catch (Throwable th2) {
                        this.f82446m = false;
                        throw th2;
                    }
                }
            }
            D();
            this.f82445l = true;
        } catch (Throwable th3) {
            throw th3;
        }
    }

    public final void e() {
        m0.t(this.f82440g, null, null, new iv.b(this, null, 17), 3);
    }

    public final c0 f() {
        c cVar = this.f82447p;
        cVar.getClass();
        z file = this.f82436c;
        Intrinsics.g(file, "file");
        return x7.f.q(new e(cVar.a(file), new p(this, 26)));
    }

    @Override // java.io.Flushable
    public final synchronized void flush() {
        if (this.f82445l) {
            if (this.f82446m) {
                throw new IllegalStateException("cache is closed");
            }
            w();
            c0 c0Var = this.f82443j;
            Intrinsics.d(c0Var);
            c0Var.flush();
        }
    }

    public final void h() {
        Iterator it = this.f82439f.values().iterator();
        long j11 = 0;
        while (it.hasNext()) {
            a aVar = (a) it.next();
            int i5 = 0;
            if (aVar.f82426g == null) {
                while (i5 < 2) {
                    j11 += aVar.f82421b[i5];
                    i5++;
                }
            } else {
                aVar.f82426g = null;
                while (i5 < 2) {
                    z zVar = (z) aVar.f82422c.get(i5);
                    c cVar = this.f82447p;
                    cVar.f(zVar);
                    cVar.f((z) aVar.f82423d.get(i5));
                    i5++;
                }
                it.remove();
            }
        }
        this.f82441h = j11;
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void l() throws Throwable {
        Unit unit;
        d0 d0VarR = x7.f.r(this.f82447p.n(this.f82436c));
        Throwable th2 = null;
        try {
            String strR = d0VarR.r(Long.MAX_VALUE);
            String strR2 = d0VarR.r(Long.MAX_VALUE);
            String strR3 = d0VarR.r(Long.MAX_VALUE);
            String strR4 = d0VarR.r(Long.MAX_VALUE);
            String strR5 = d0VarR.r(Long.MAX_VALUE);
            if (!"libcore.io.DiskLruCache".equals(strR) || !"1".equals(strR2) || !Intrinsics.b(String.valueOf(1), strR3) || !Intrinsics.b(String.valueOf(2), strR4) || strR5.length() > 0) {
                throw new IOException("unexpected journal header: [" + strR + ", " + strR2 + ", " + strR3 + ", " + strR4 + ", " + strR5 + AbstractJsonLexerKt.END_LIST);
            }
            int i5 = 0;
            while (true) {
                try {
                    p(d0VarR.r(Long.MAX_VALUE));
                    i5++;
                } catch (EOFException unused) {
                    this.f82442i = i5 - this.f82439f.size();
                    if (d0VarR.N()) {
                        this.f82443j = f();
                    } else {
                        D();
                    }
                    unit = Unit.f71706a;
                    try {
                        d0VarR.close();
                    } catch (Throwable th3) {
                        th2 = th3;
                    }
                    if (th2 == null) {
                        throw th2;
                    }
                    Intrinsics.d(unit);
                    return;
                }
            }
        } catch (Throwable th4) {
            try {
                d0VarR.close();
            } catch (Throwable th5) {
                ExceptionsKt.a(th4, th5);
            }
            th2 = th4;
            unit = null;
            if (th2 == null) {
            }
        }
    }

    public final void p(String str) throws IOException {
        String strSubstring;
        int iR0 = k.R0(' ', 0, 6, str);
        if (iR0 == -1) {
            throw new IOException("unexpected journal line: ".concat(str));
        }
        int i5 = iR0 + 1;
        int iR02 = k.R0(' ', i5, 4, str);
        LinkedHashMap linkedHashMap = this.f82439f;
        if (iR02 == -1) {
            strSubstring = str.substring(i5);
            Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
            if (iR0 == 6 && j.I0(str, "REMOVE", false)) {
                linkedHashMap.remove(strSubstring);
                return;
            }
        } else {
            strSubstring = str.substring(i5, iR02);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        }
        Object aVar = linkedHashMap.get(strSubstring);
        if (aVar == null) {
            aVar = new a(this, strSubstring);
            linkedHashMap.put(strSubstring, aVar);
        }
        a aVar2 = (a) aVar;
        if (iR02 == -1 || iR0 != 5 || !j.I0(str, "CLEAN", false)) {
            if (iR02 == -1 && iR0 == 5 && j.I0(str, "DIRTY", false)) {
                aVar2.f82426g = new y0(this, aVar2);
                return;
            } else {
                if (iR02 != -1 || iR0 != 4 || !j.I0(str, "READ", false)) {
                    throw new IOException("unexpected journal line: ".concat(str));
                }
                return;
            }
        }
        String strSubstring2 = str.substring(iR02 + 1);
        Intrinsics.f(strSubstring2, "this as java.lang.String).substring(startIndex)");
        List listH1 = k.h1(strSubstring2, new char[]{' '}, 6);
        aVar2.f82424e = true;
        aVar2.f82426g = null;
        if (listH1.size() != 2) {
            throw new IOException("unexpected journal line: " + listH1);
        }
        try {
            int size = listH1.size();
            for (int i11 = 0; i11 < size; i11++) {
                aVar2.f82421b[i11] = Long.parseLong((String) listH1.get(i11));
            }
        } catch (NumberFormatException unused) {
            throw new IOException("unexpected journal line: " + listH1);
        }
    }

    public final void s(a aVar) {
        c0 c0Var;
        int i5 = aVar.f82427h;
        String str = aVar.f82420a;
        if (i5 > 0 && (c0Var = this.f82443j) != null) {
            c0Var.u("DIRTY");
            c0Var.writeByte(32);
            c0Var.u(str);
            c0Var.writeByte(10);
            c0Var.flush();
        }
        if (aVar.f82427h > 0 || aVar.f82426g != null) {
            aVar.f82425f = true;
            return;
        }
        for (int i11 = 0; i11 < 2; i11++) {
            this.f82447p.f((z) aVar.f82422c.get(i11));
            long j11 = this.f82441h;
            long[] jArr = aVar.f82421b;
            this.f82441h = j11 - jArr[i11];
            jArr[i11] = 0;
        }
        this.f82442i++;
        c0 c0Var2 = this.f82443j;
        if (c0Var2 != null) {
            c0Var2.u("REMOVE");
            c0Var2.writeByte(32);
            c0Var2.u(str);
            c0Var2.writeByte(10);
        }
        this.f82439f.remove(str);
        if (this.f82442i >= 2000) {
            e();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0022, code lost:
    
        s(r1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void w() {
        while (this.f82441h > this.f82435b) {
            for (a aVar : this.f82439f.values()) {
                if (!aVar.f82425f) {
                    break;
                }
            }
            return;
        }
        this.n = false;
    }
}
