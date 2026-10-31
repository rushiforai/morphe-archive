package qo;

import ai.e1;
import ai.y0;
import b.c0;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class d implements Closeable {
    public static final Pattern o = Pattern.compile("[a-z0-9_-]{1,64}");

    /* renamed from: p, reason: collision with root package name */
    public static final a f84275p = new a();

    /* renamed from: a, reason: collision with root package name */
    public final File f84276a;

    /* renamed from: b, reason: collision with root package name */
    public final File f84277b;

    /* renamed from: c, reason: collision with root package name */
    public final File f84278c;

    /* renamed from: d, reason: collision with root package name */
    public final File f84279d;

    /* renamed from: i, reason: collision with root package name */
    public BufferedWriter f84284i;

    /* renamed from: k, reason: collision with root package name */
    public int f84286k;

    /* renamed from: h, reason: collision with root package name */
    public long f84283h = 0;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f84285j = new LinkedHashMap(0, 0.75f, true);

    /* renamed from: l, reason: collision with root package name */
    public long f84287l = 0;

    /* renamed from: m, reason: collision with root package name */
    public final ThreadPoolExecutor f84288m = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue());
    public final e1 n = new e1(this, 3);

    /* renamed from: e, reason: collision with root package name */
    public final int f84280e = 2;

    /* renamed from: g, reason: collision with root package name */
    public final int f84282g = 2;

    /* renamed from: f, reason: collision with root package name */
    public final long f84281f = 10485760;

    public d(File file) {
        this.f84276a = file;
        this.f84277b = new File(file, "journal");
        this.f84278c = new File(file, "journal.tmp");
        this.f84279d = new File(file, "journal.bkp");
    }

    public static void A(File file, File file2, boolean z11) throws IOException {
        if (z11) {
            b(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }

    public static void K(String str) {
        if (!o.matcher(str).matches()) {
            throw new IllegalArgumentException(c0.l("keys must match regex [a-z0-9_-]{1,64}: \"", str, "\""));
        }
    }

    public static void a(d dVar, y0 y0Var, boolean z11) {
        synchronized (dVar) {
            c cVar = (c) y0Var.f13475c;
            if (cVar.f84273d != y0Var) {
                throw new IllegalStateException();
            }
            if (z11 && !cVar.f84272c) {
                for (int i5 = 0; i5 < dVar.f84282g; i5++) {
                    if (!((boolean[]) y0Var.f13476d)[i5]) {
                        y0Var.d();
                        throw new IllegalStateException("Newly created entry didn't create value for index " + i5);
                    }
                    if (!cVar.b(i5).exists()) {
                        y0Var.d();
                        return;
                    }
                }
            }
            for (int i11 = 0; i11 < dVar.f84282g; i11++) {
                File fileB = cVar.b(i11);
                if (!z11) {
                    b(fileB);
                } else if (fileB.exists()) {
                    File fileA = cVar.a(i11);
                    fileB.renameTo(fileA);
                    long j11 = cVar.f84271b[i11];
                    long length = fileA.length();
                    cVar.f84271b[i11] = length;
                    dVar.f84283h = (dVar.f84283h - j11) + length;
                }
            }
            dVar.f84286k++;
            cVar.f84273d = null;
            if (cVar.f84272c || z11) {
                cVar.f84272c = true;
                dVar.f84284i.write("CLEAN " + cVar.f84270a + cVar.c() + '\n');
                if (z11) {
                    dVar.f84287l++;
                }
            } else {
                dVar.f84285j.remove(cVar.f84270a);
                dVar.f84284i.write("REMOVE " + cVar.f84270a + '\n');
            }
            dVar.f84284i.flush();
            if (dVar.f84283h > dVar.f84281f || dVar.e()) {
                dVar.f84288m.submit(dVar.n);
            }
        }
    }

    public static void b(File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    public static d f(File file) throws IOException {
        File file2 = new File(file, "journal.bkp");
        if (file2.exists()) {
            File file3 = new File(file, "journal");
            if (file3.exists()) {
                file2.delete();
            } else {
                A(file2, file3, false);
            }
        }
        d dVar = new d(file);
        File file4 = dVar.f84277b;
        if (file4.exists()) {
            try {
                dVar.l();
                dVar.h();
                dVar.f84284i = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file4, true), f.f84294a));
                return dVar;
            } catch (IOException e3) {
                System.out.println("DiskLruCache " + file + " is corrupt: " + e3.getMessage() + ", removing");
                dVar.close();
                f.b(dVar.f84276a);
            }
        }
        file.mkdirs();
        d dVar2 = new d(file);
        dVar2.s();
        return dVar2;
    }

    public final void D() {
        while (this.f84283h > this.f84281f) {
            w((String) ((Map.Entry) this.f84285j.entrySet().iterator().next()).getKey());
        }
    }

    public final y0 c(String str) {
        synchronized (this) {
            try {
                if (this.f84284i == null) {
                    throw new IllegalStateException("cache is closed");
                }
                K(str);
                c cVar = (c) this.f84285j.get(str);
                if (cVar == null) {
                    cVar = new c(this, str);
                    this.f84285j.put(str, cVar);
                } else if (cVar.f84273d != null) {
                    return null;
                }
                y0 y0Var = new y0(this, cVar);
                cVar.f84273d = y0Var;
                this.f84284i.write("DIRTY " + str + '\n');
                this.f84284i.flush();
                return y0Var;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        try {
            if (this.f84284i == null) {
                return;
            }
            Iterator it = new ArrayList(this.f84285j.values()).iterator();
            while (it.hasNext()) {
                y0 y0Var = ((c) it.next()).f84273d;
                if (y0Var != null) {
                    y0Var.d();
                }
            }
            D();
            this.f84284i.close();
            this.f84284i = null;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized p8.f d(String str) {
        InputStream inputStream;
        if (this.f84284i == null) {
            throw new IllegalStateException("cache is closed");
        }
        K(str);
        c cVar = (c) this.f84285j.get(str);
        if (cVar == null) {
            return null;
        }
        if (!cVar.f84272c) {
            return null;
        }
        InputStream[] inputStreamArr = new InputStream[this.f84282g];
        for (int i5 = 0; i5 < this.f84282g; i5++) {
            try {
                inputStreamArr[i5] = new FileInputStream(cVar.a(i5));
            } catch (FileNotFoundException unused) {
                for (int i11 = 0; i11 < this.f84282g && (inputStream = inputStreamArr[i11]) != null; i11++) {
                    f.a(inputStream);
                }
                return null;
            }
        }
        this.f84286k++;
        this.f84284i.append((CharSequence) ("READ " + str + '\n'));
        if (e()) {
            this.f84288m.submit(this.n);
        }
        return new p8.f(inputStreamArr, 1);
    }

    public final boolean e() {
        int i5 = this.f84286k;
        return i5 >= 2000 && i5 >= this.f84285j.size();
    }

    public final void h() throws IOException {
        b(this.f84278c);
        Iterator it = this.f84285j.values().iterator();
        while (it.hasNext()) {
            c cVar = (c) it.next();
            y0 y0Var = cVar.f84273d;
            int i5 = this.f84282g;
            int i11 = 0;
            if (y0Var == null) {
                while (i11 < i5) {
                    this.f84283h += cVar.f84271b[i11];
                    i11++;
                }
            } else {
                cVar.f84273d = null;
                while (i11 < i5) {
                    b(cVar.a(i11));
                    b(cVar.b(i11));
                    i11++;
                }
                it.remove();
            }
        }
    }

    public final void l() throws IOException {
        e eVar = new e(new FileInputStream(this.f84277b), f.f84294a);
        try {
            String strA = eVar.a();
            String strA2 = eVar.a();
            String strA3 = eVar.a();
            String strA4 = eVar.a();
            String strA5 = eVar.a();
            if (!"libcore.io.DiskLruCache".equals(strA) || !"1".equals(strA2) || !Integer.toString(this.f84280e).equals(strA3) || !Integer.toString(this.f84282g).equals(strA4) || !com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(strA5)) {
                throw new IOException("unexpected journal header: [" + strA + ", " + strA2 + ", " + strA4 + ", " + strA5 + "]");
            }
            int i5 = 0;
            while (true) {
                try {
                    p(eVar.a());
                    i5++;
                } catch (EOFException unused) {
                    this.f84286k = i5 - this.f84285j.size();
                    f.a(eVar);
                    return;
                }
            }
        } catch (Throwable th2) {
            f.a(eVar);
            throw th2;
        }
    }

    public final void p(String str) throws IOException {
        String strSubstring;
        int iIndexOf = str.indexOf(32);
        if (iIndexOf == -1) {
            throw new IOException("unexpected journal line: ".concat(str));
        }
        int i5 = iIndexOf + 1;
        int iIndexOf2 = str.indexOf(32, i5);
        LinkedHashMap linkedHashMap = this.f84285j;
        if (iIndexOf2 == -1) {
            strSubstring = str.substring(i5);
            if (iIndexOf == 6 && str.startsWith("REMOVE")) {
                linkedHashMap.remove(strSubstring);
                return;
            }
        } else {
            strSubstring = str.substring(i5, iIndexOf2);
        }
        c cVar = (c) linkedHashMap.get(strSubstring);
        if (cVar == null) {
            cVar = new c(this, strSubstring);
            linkedHashMap.put(strSubstring, cVar);
        }
        if (iIndexOf2 == -1 || iIndexOf != 5 || !str.startsWith("CLEAN")) {
            if (iIndexOf2 == -1 && iIndexOf == 5 && str.startsWith("DIRTY")) {
                cVar.f84273d = new y0(this, cVar);
                return;
            } else {
                if (iIndexOf2 != -1 || iIndexOf != 4 || !str.startsWith("READ")) {
                    throw new IOException("unexpected journal line: ".concat(str));
                }
                return;
            }
        }
        String[] strArrSplit = str.substring(iIndexOf2 + 1).split(" ");
        cVar.f84272c = true;
        cVar.f84273d = null;
        if (strArrSplit.length != cVar.f84274e.f84282g) {
            throw new IOException("unexpected journal line: " + Arrays.toString(strArrSplit));
        }
        for (int i11 = 0; i11 < strArrSplit.length; i11++) {
            try {
                cVar.f84271b[i11] = Long.parseLong(strArrSplit[i11]);
            } catch (NumberFormatException unused) {
                throw new IOException("unexpected journal line: " + Arrays.toString(strArrSplit));
            }
        }
    }

    public final synchronized void s() {
        try {
            BufferedWriter bufferedWriter = this.f84284i;
            if (bufferedWriter != null) {
                bufferedWriter.close();
            }
            BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.f84278c), f.f84294a));
            try {
                bufferedWriter2.write("libcore.io.DiskLruCache");
                bufferedWriter2.write("\n");
                bufferedWriter2.write("1");
                bufferedWriter2.write("\n");
                bufferedWriter2.write(Integer.toString(this.f84280e));
                bufferedWriter2.write("\n");
                bufferedWriter2.write(Integer.toString(this.f84282g));
                bufferedWriter2.write("\n");
                bufferedWriter2.write("\n");
                for (c cVar : this.f84285j.values()) {
                    if (cVar.f84273d != null) {
                        bufferedWriter2.write("DIRTY " + cVar.f84270a + '\n');
                    } else {
                        bufferedWriter2.write("CLEAN " + cVar.f84270a + cVar.c() + '\n');
                    }
                }
                bufferedWriter2.close();
                if (this.f84277b.exists()) {
                    A(this.f84277b, this.f84279d, true);
                }
                A(this.f84278c, this.f84277b, false);
                this.f84279d.delete();
                this.f84284i = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.f84277b, true), f.f84294a));
            } catch (Throwable th2) {
                bufferedWriter2.close();
                throw th2;
            }
        } catch (Throwable th3) {
            throw th3;
        }
    }

    public final synchronized void w(String str) {
        try {
            if (this.f84284i == null) {
                throw new IllegalStateException("cache is closed");
            }
            K(str);
            c cVar = (c) this.f84285j.get(str);
            if (cVar != null && cVar.f84273d == null) {
                for (int i5 = 0; i5 < this.f84282g; i5++) {
                    File fileA = cVar.a(i5);
                    if (fileA.exists() && !fileA.delete()) {
                        throw new IOException("failed to delete " + fileA);
                    }
                    long j11 = this.f84283h;
                    long[] jArr = cVar.f84271b;
                    this.f84283h = j11 - jArr[i5];
                    jArr[i5] = 0;
                }
                this.f84286k++;
                this.f84284i.append((CharSequence) ("REMOVE " + str + '\n'));
                this.f84285j.remove(str);
                if (e()) {
                    this.f84288m.submit(this.n);
                }
            }
        } finally {
        }
    }
}
