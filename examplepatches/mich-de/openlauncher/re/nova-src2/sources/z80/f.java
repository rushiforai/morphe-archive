package z80;

import ai.y0;
import e90.o;
import g90.m;
import h6.c1;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.Flushable;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Logger;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import m90.c0;
import m90.d0;
import m90.l0;
import m90.w;
import m90.y;
import r70.j;
import r70.k;
import v2.k0;

/* loaded from: classes5.dex */
public final class f implements Closeable, Flushable {

    /* renamed from: s, reason: collision with root package name */
    public static final Regex f98325s = new Regex("[a-z0-9_-]{1,120}");

    /* renamed from: t, reason: collision with root package name */
    public static final String f98326t = "CLEAN";

    /* renamed from: u, reason: collision with root package name */
    public static final String f98327u = "DIRTY";

    /* renamed from: v, reason: collision with root package name */
    public static final String f98328v = "REMOVE";

    /* renamed from: w, reason: collision with root package name */
    public static final String f98329w = "READ";

    /* renamed from: a, reason: collision with root package name */
    public final File f98330a;

    /* renamed from: b, reason: collision with root package name */
    public final long f98331b;

    /* renamed from: c, reason: collision with root package name */
    public final File f98332c;

    /* renamed from: d, reason: collision with root package name */
    public final File f98333d;

    /* renamed from: e, reason: collision with root package name */
    public final File f98334e;

    /* renamed from: f, reason: collision with root package name */
    public long f98335f;

    /* renamed from: g, reason: collision with root package name */
    public c0 f98336g;

    /* renamed from: h, reason: collision with root package name */
    public final LinkedHashMap f98337h;

    /* renamed from: i, reason: collision with root package name */
    public int f98338i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f98339j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f98340k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f98341l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f98342m;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public long f98343p;

    /* renamed from: q, reason: collision with root package name */
    public final a90.c f98344q;

    /* renamed from: r, reason: collision with root package name */
    public final o f98345r;

    public f(File directory, long j11, a90.e taskRunner) {
        Intrinsics.g(directory, "directory");
        Intrinsics.g(taskRunner, "taskRunner");
        this.f98330a = directory;
        this.f98331b = j11;
        this.f98337h = new LinkedHashMap(0, 0.75f, true);
        this.f98344q = taskRunner.e();
        this.f98345r = new o(this, b.c0.q(new StringBuilder(), y80.c.f96859g, " Cache"));
        if (j11 <= 0) {
            throw new IllegalArgumentException("maxSize <= 0");
        }
        this.f98332c = new File(directory, "journal");
        this.f98333d = new File(directory, "journal.tmp");
        this.f98334e = new File(directory, "journal.bkp");
    }

    public static void K(String str) {
        if (!f98325s.f(str)) {
            throw new IllegalArgumentException(c1.m(AbstractJsonLexerKt.STRING, "keys must match regex [a-z0-9_-]{1,120}: \"", str).toString());
        }
    }

    public final void A(d dVar) throws IOException {
        c0 c0Var;
        String str = dVar.f98311a;
        if (!this.f98340k) {
            if (dVar.f98318h > 0 && (c0Var = this.f98336g) != null) {
                c0Var.u(f98327u);
                c0Var.writeByte(32);
                c0Var.u(str);
                c0Var.writeByte(10);
                c0Var.flush();
            }
            if (dVar.f98318h > 0 || dVar.f98317g != null) {
                dVar.f98316f = true;
                return;
            }
        }
        y0 y0Var = dVar.f98317g;
        if (y0Var != null) {
            y0Var.k();
        }
        for (int i5 = 0; i5 < 2; i5++) {
            File file = (File) dVar.f98313c.get(i5);
            Intrinsics.g(file, "file");
            if (!file.delete() && file.exists()) {
                throw new IOException(c1.q(file, "failed to delete "));
            }
            long j11 = this.f98335f;
            long[] jArr = dVar.f98312b;
            this.f98335f = j11 - jArr[i5];
            jArr[i5] = 0;
        }
        this.f98338i++;
        c0 c0Var2 = this.f98336g;
        if (c0Var2 != null) {
            c0Var2.u(f98328v);
            c0Var2.writeByte(32);
            c0Var2.u(str);
            c0Var2.writeByte(10);
        }
        this.f98337h.remove(str);
        if (f()) {
            this.f98344q.c(this.f98345r, 0L);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0022, code lost:
    
        A(r1);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void D() throws IOException {
        while (this.f98335f > this.f98331b) {
            for (d dVar : this.f98337h.values()) {
                if (!dVar.f98316f) {
                    break;
                }
            }
            return;
        }
        this.n = false;
    }

    public final synchronized void a() {
        if (this.f98342m) {
            throw new IllegalStateException("cache is closed");
        }
    }

    public final synchronized void b(y0 y0Var, boolean z11) {
        d dVar = (d) y0Var.f13475c;
        if (!Intrinsics.b(dVar.f98317g, y0Var)) {
            throw new IllegalStateException("Check failed.");
        }
        if (z11 && !dVar.f98315e) {
            for (int i5 = 0; i5 < 2; i5++) {
                boolean[] zArr = (boolean[]) y0Var.f13476d;
                Intrinsics.d(zArr);
                if (!zArr[i5]) {
                    y0Var.d();
                    throw new IllegalStateException("Newly created entry didn't create value for index " + i5);
                }
                File file = (File) dVar.f98314d.get(i5);
                Intrinsics.g(file, "file");
                if (!file.exists()) {
                    y0Var.d();
                    return;
                }
            }
        }
        for (int i11 = 0; i11 < 2; i11++) {
            File file2 = (File) dVar.f98314d.get(i11);
            if (!z11 || dVar.f98316f) {
                Intrinsics.g(file2, "file");
                if (!file2.delete() && file2.exists()) {
                    throw new IOException("failed to delete " + file2);
                }
            } else {
                f90.a aVar = f90.a.f54357a;
                if (aVar.c(file2)) {
                    File file3 = (File) dVar.f98313c.get(i11);
                    aVar.d(file2, file3);
                    long j11 = dVar.f98312b[i11];
                    long length = file3.length();
                    dVar.f98312b[i11] = length;
                    this.f98335f = (this.f98335f - j11) + length;
                }
            }
        }
        dVar.f98317g = null;
        if (dVar.f98316f) {
            A(dVar);
            return;
        }
        this.f98338i++;
        c0 c0Var = this.f98336g;
        Intrinsics.d(c0Var);
        if (dVar.f98315e || z11) {
            dVar.f98315e = true;
            c0Var.u(f98326t);
            c0Var.writeByte(32);
            c0Var.u(dVar.f98311a);
            for (long j12 : dVar.f98312b) {
                c0Var.writeByte(32);
                c0Var.E(j12);
            }
            c0Var.writeByte(10);
            if (z11) {
                long j13 = this.f98343p;
                this.f98343p = 1 + j13;
                dVar.f98319i = j13;
            }
        } else {
            this.f98337h.remove(dVar.f98311a);
            c0Var.u(f98328v);
            c0Var.writeByte(32);
            c0Var.u(dVar.f98311a);
            c0Var.writeByte(10);
        }
        c0Var.flush();
        if (this.f98335f > this.f98331b || f()) {
            this.f98344q.c(this.f98345r, 0L);
        }
    }

    public final synchronized y0 c(long j11, String key) {
        Intrinsics.g(key, "key");
        e();
        a();
        K(key);
        d dVar = (d) this.f98337h.get(key);
        if (j11 != -1 && (dVar == null || dVar.f98319i != j11)) {
            return null;
        }
        if ((dVar != null ? dVar.f98317g : null) != null) {
            return null;
        }
        if (dVar != null && dVar.f98318h != 0) {
            return null;
        }
        if (!this.n && !this.o) {
            c0 c0Var = this.f98336g;
            Intrinsics.d(c0Var);
            c0Var.u(f98327u);
            c0Var.writeByte(32);
            c0Var.u(key);
            c0Var.writeByte(10);
            c0Var.flush();
            if (this.f98339j) {
                return null;
            }
            if (dVar == null) {
                dVar = new d(this, key);
                this.f98337h.put(key, dVar);
            }
            y0 y0Var = new y0(this, dVar);
            dVar.f98317g = y0Var;
            return y0Var;
        }
        this.f98344q.c(this.f98345r, 0L);
        return null;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        try {
            if (this.f98341l && !this.f98342m) {
                Collection collectionValues = this.f98337h.values();
                Intrinsics.f(collectionValues, "lruEntries.values");
                for (d dVar : (d[]) collectionValues.toArray(new d[0])) {
                    y0 y0Var = dVar.f98317g;
                    if (y0Var != null) {
                        y0Var.k();
                    }
                }
                D();
                c0 c0Var = this.f98336g;
                Intrinsics.d(c0Var);
                c0Var.close();
                this.f98336g = null;
                this.f98342m = true;
                return;
            }
            this.f98342m = true;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized e d(String key) {
        Intrinsics.g(key, "key");
        e();
        a();
        K(key);
        d dVar = (d) this.f98337h.get(key);
        if (dVar == null) {
            return null;
        }
        e eVarA = dVar.a();
        if (eVarA == null) {
            return null;
        }
        this.f98338i++;
        c0 c0Var = this.f98336g;
        Intrinsics.d(c0Var);
        c0Var.u(f98329w);
        c0Var.writeByte(32);
        c0Var.u(key);
        c0Var.writeByte(10);
        if (f()) {
            this.f98344q.c(this.f98345r, 0L);
        }
        return eVarA;
    }

    public final synchronized void e() {
        y yVarT;
        boolean z11;
        try {
            byte[] bArr = y80.c.f96853a;
            if (this.f98341l) {
                return;
            }
            f90.a aVar = f90.a.f54357a;
            if (aVar.c(this.f98334e)) {
                if (aVar.c(this.f98332c)) {
                    aVar.a(this.f98334e);
                } else {
                    aVar.d(this.f98334e, this.f98332c);
                }
            }
            File file = this.f98334e;
            Intrinsics.g(file, "file");
            aVar.getClass();
            Intrinsics.g(file, "file");
            try {
                yVarT = x7.f.T(file);
            } catch (FileNotFoundException unused) {
                file.getParentFile().mkdirs();
                yVarT = x7.f.T(file);
            }
            try {
                try {
                    aVar.a(file);
                    yVarT.close();
                    z11 = true;
                } catch (IOException unused2) {
                    Unit unit = Unit.f71706a;
                    yVarT.close();
                    aVar.a(file);
                    z11 = false;
                }
                this.f98340k = z11;
                File file2 = this.f98332c;
                Intrinsics.g(file2, "file");
                if (file2.exists()) {
                    try {
                        p();
                        l();
                        this.f98341l = true;
                        return;
                    } catch (IOException e3) {
                        m mVar = m.f57276a;
                        m mVar2 = m.f57276a;
                        String str = "DiskLruCache " + this.f98330a + " is corrupt: " + e3.getMessage() + ", removing";
                        mVar2.getClass();
                        m.i(5, str, e3);
                        try {
                            close();
                            f90.a.f54357a.b(this.f98330a);
                            this.f98342m = false;
                        } catch (Throwable th2) {
                            this.f98342m = false;
                            throw th2;
                        }
                    }
                }
                w();
                this.f98341l = true;
            } finally {
            }
        } catch (Throwable th3) {
            throw th3;
        }
    }

    public final boolean f() {
        int i5 = this.f98338i;
        return i5 >= 2000 && i5 >= this.f98337h.size();
    }

    @Override // java.io.Flushable
    public final synchronized void flush() {
        if (this.f98341l) {
            a();
            D();
            c0 c0Var = this.f98336g;
            Intrinsics.d(c0Var);
            c0Var.flush();
        }
    }

    public final c0 h() {
        y yVar;
        File file = this.f98332c;
        Intrinsics.g(file, "file");
        try {
            Logger logger = w.f76170a;
            yVar = new y(new FileOutputStream(file, true), new l0());
        } catch (FileNotFoundException unused) {
            file.getParentFile().mkdirs();
            Logger logger2 = w.f76170a;
            yVar = new y(new FileOutputStream(file, true), new l0());
        }
        return x7.f.q(new p8.e(yVar, new k0(this, 4)));
    }

    public final void l() throws IOException {
        File file = this.f98333d;
        f90.a aVar = f90.a.f54357a;
        aVar.a(file);
        Iterator it = this.f98337h.values().iterator();
        while (it.hasNext()) {
            Object next = it.next();
            Intrinsics.f(next, "i.next()");
            d dVar = (d) next;
            int i5 = 0;
            if (dVar.f98317g == null) {
                while (i5 < 2) {
                    this.f98335f += dVar.f98312b[i5];
                    i5++;
                }
            } else {
                dVar.f98317g = null;
                while (i5 < 2) {
                    aVar.a((File) dVar.f98313c.get(i5));
                    aVar.a((File) dVar.f98314d.get(i5));
                    i5++;
                }
                it.remove();
            }
        }
    }

    public final void p() {
        File file = this.f98332c;
        Intrinsics.g(file, "file");
        d0 d0VarR = x7.f.r(x7.f.U(file));
        try {
            String strR = d0VarR.r(Long.MAX_VALUE);
            String strR2 = d0VarR.r(Long.MAX_VALUE);
            String strR3 = d0VarR.r(Long.MAX_VALUE);
            String strR4 = d0VarR.r(Long.MAX_VALUE);
            String strR5 = d0VarR.r(Long.MAX_VALUE);
            if (!"libcore.io.DiskLruCache".equals(strR) || !"1".equals(strR2) || !Intrinsics.b(String.valueOf(201105), strR3) || !Intrinsics.b(String.valueOf(2), strR4) || strR5.length() > 0) {
                throw new IOException("unexpected journal header: [" + strR + ", " + strR2 + ", " + strR4 + ", " + strR5 + AbstractJsonLexerKt.END_LIST);
            }
            int i5 = 0;
            while (true) {
                try {
                    s(d0VarR.r(Long.MAX_VALUE));
                    i5++;
                } catch (EOFException unused) {
                    this.f98338i = i5 - this.f98337h.size();
                    if (d0VarR.N()) {
                        this.f98336g = h();
                    } else {
                        w();
                    }
                    Unit unit = Unit.f71706a;
                    d0VarR.close();
                    return;
                }
            }
        } finally {
        }
    }

    public final void s(String str) throws IOException {
        String strSubstring;
        int iR0 = k.R0(' ', 0, 6, str);
        if (iR0 == -1) {
            throw new IOException("unexpected journal line: ".concat(str));
        }
        int i5 = iR0 + 1;
        int iR02 = k.R0(' ', i5, 4, str);
        LinkedHashMap linkedHashMap = this.f98337h;
        if (iR02 == -1) {
            strSubstring = str.substring(i5);
            Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
            String str2 = f98328v;
            if (iR0 == str2.length() && j.I0(str, str2, false)) {
                linkedHashMap.remove(strSubstring);
                return;
            }
        } else {
            strSubstring = str.substring(i5, iR02);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        }
        d dVar = (d) linkedHashMap.get(strSubstring);
        if (dVar == null) {
            dVar = new d(this, strSubstring);
            linkedHashMap.put(strSubstring, dVar);
        }
        if (iR02 != -1) {
            String str3 = f98326t;
            if (iR0 == str3.length() && j.I0(str, str3, false)) {
                String strSubstring2 = str.substring(iR02 + 1);
                Intrinsics.f(strSubstring2, "this as java.lang.String).substring(startIndex)");
                List listH1 = k.h1(strSubstring2, new char[]{' '}, 6);
                dVar.f98315e = true;
                dVar.f98317g = null;
                int size = listH1.size();
                dVar.f98320j.getClass();
                if (size != 2) {
                    throw new IOException("unexpected journal line: " + listH1);
                }
                try {
                    int size2 = listH1.size();
                    for (int i11 = 0; i11 < size2; i11++) {
                        dVar.f98312b[i11] = Long.parseLong((String) listH1.get(i11));
                    }
                    return;
                } catch (NumberFormatException unused) {
                    throw new IOException("unexpected journal line: " + listH1);
                }
            }
        }
        if (iR02 == -1) {
            String str4 = f98327u;
            if (iR0 == str4.length() && j.I0(str, str4, false)) {
                dVar.f98317g = new y0(this, dVar);
                return;
            }
        }
        if (iR02 == -1) {
            String str5 = f98329w;
            if (iR0 == str5.length() && j.I0(str, str5, false)) {
                return;
            }
        }
        throw new IOException("unexpected journal line: ".concat(str));
    }

    public final synchronized void w() {
        y yVarT;
        try {
            c0 c0Var = this.f98336g;
            if (c0Var != null) {
                c0Var.close();
            }
            File file = this.f98333d;
            Intrinsics.g(file, "file");
            try {
                yVarT = x7.f.T(file);
            } catch (FileNotFoundException unused) {
                file.getParentFile().mkdirs();
                yVarT = x7.f.T(file);
            }
            c0 c0VarQ = x7.f.q(yVarT);
            try {
                c0VarQ.u("libcore.io.DiskLruCache");
                c0VarQ.writeByte(10);
                c0VarQ.u("1");
                c0VarQ.writeByte(10);
                c0VarQ.E(201105);
                c0VarQ.writeByte(10);
                c0VarQ.E(2);
                c0VarQ.writeByte(10);
                c0VarQ.writeByte(10);
                Iterator it = this.f98337h.values().iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    d dVar = (d) it.next();
                    if (dVar.f98317g != null) {
                        c0VarQ.u(f98327u);
                        c0VarQ.writeByte(32);
                        c0VarQ.u(dVar.f98311a);
                        c0VarQ.writeByte(10);
                    } else {
                        c0VarQ.u(f98326t);
                        c0VarQ.writeByte(32);
                        c0VarQ.u(dVar.f98311a);
                        for (long j11 : dVar.f98312b) {
                            c0VarQ.writeByte(32);
                            c0VarQ.E(j11);
                        }
                        c0VarQ.writeByte(10);
                    }
                }
                Unit unit = Unit.f71706a;
                c0VarQ.close();
                f90.a aVar = f90.a.f54357a;
                if (aVar.c(this.f98332c)) {
                    aVar.d(this.f98332c, this.f98334e);
                }
                aVar.d(this.f98333d, this.f98332c);
                aVar.a(this.f98334e);
                this.f98336g = h();
                this.f98339j = false;
                this.o = false;
            } finally {
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }
}
