package defpackage;

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

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kg3 implements Closeable {
    public static final Pattern o = Pattern.compile("[a-z0-9_-]{1,64}");
    public static final xf3 p = new xf3();
    public final File a;
    public final File b;
    public final File c;
    public final File d;
    public final int g;
    public BufferedWriter i;
    public int k;
    public long h = 0;
    public final LinkedHashMap j = new LinkedHashMap(0, 0.75f, true);
    public long l = 0;
    public final ThreadPoolExecutor m = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue());
    public final wf3 n = new wf3(0, this);
    public final int e = 1;
    public final long f = 5242880;

    public kg3(File file, int i) {
        this.a = file;
        this.b = new File(file, "journal");
        this.c = new File(file, "journal.tmp");
        this.d = new File(file, "journal.bkp");
        this.g = i;
    }

    public static kg3 I(File file, int i) throws IOException {
        if (i <= 0) {
            ay0.e("valueCount <= 0");
            return null;
        }
        File file2 = new File(file, "journal.bkp");
        if (file2.exists()) {
            File file3 = new File(file, "journal");
            if (file3.exists()) {
                file2.delete();
            } else {
                U(file2, file3, false);
            }
        }
        kg3 kg3Var = new kg3(file, i);
        File file4 = kg3Var.b;
        if (file4.exists()) {
            try {
                kg3Var.N();
                kg3Var.L();
                kg3Var.i = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file4, true), zoe.a));
                return kg3Var;
            } catch (IOException e) {
                System.out.println("DiskLruCache " + file + " is corrupt: " + e.getMessage() + ", removing");
                kg3Var.close();
                zoe.b(kg3Var.a);
            }
        }
        file.mkdirs();
        kg3 kg3Var2 = new kg3(file, i);
        kg3Var2.R();
        return kg3Var2;
    }

    public static void U(File file, File file2, boolean z) throws IOException {
        if (z) {
            m(file2);
        }
        if (!file.renameTo(file2)) {
            throw new IOException();
        }
    }

    public static void j0(String str) {
        if (o.matcher(str).matches()) {
            return;
        }
        ay0.e(ev6.x("keys must match regex [a-z0-9_-]{1,64}: \"", str, "\""));
    }

    public static void m(File file) throws IOException {
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    public final synchronized eg3 B(String str) {
        InputStream inputStream;
        if (this.i == null) {
            throw new IllegalStateException("cache is closed");
        }
        j0(str);
        bg3 bg3Var = (bg3) this.j.get(str);
        if (bg3Var == null) {
            return null;
        }
        if (!bg3Var.c) {
            return null;
        }
        InputStream[] inputStreamArr = new InputStream[this.g];
        for (int i = 0; i < this.g; i++) {
            try {
                inputStreamArr[i] = new FileInputStream(bg3Var.a(i));
            } catch (FileNotFoundException unused) {
                for (int i2 = 0; i2 < this.g && (inputStream = inputStreamArr[i2]) != null; i2++) {
                    zoe.a(inputStream);
                }
                return null;
            }
        }
        this.k++;
        this.i.append((CharSequence) ("READ " + str + '\n'));
        if (D()) {
            this.m.submit(this.n);
        }
        return new eg3(inputStreamArr);
    }

    public final boolean D() {
        int i = this.k;
        return i >= 2000 && i >= this.j.size();
    }

    public final void L() throws IOException {
        m(this.c);
        Iterator it2 = this.j.values().iterator();
        while (it2.hasNext()) {
            bg3 bg3Var = (bg3) it2.next();
            zf3 zf3Var = bg3Var.d;
            int i = this.g;
            int i2 = 0;
            if (zf3Var == null) {
                while (i2 < i) {
                    this.h += bg3Var.b[i2];
                    i2++;
                }
            } else {
                bg3Var.d = null;
                while (i2 < i) {
                    m(bg3Var.a(i2));
                    m(bg3Var.b(i2));
                    i2++;
                }
                it2.remove();
            }
        }
    }

    public final void N() {
        duc ducVar = new duc(new FileInputStream(this.b), zoe.a);
        try {
            String strF = ducVar.f();
            String strF2 = ducVar.f();
            String strF3 = ducVar.f();
            String strF4 = ducVar.f();
            String strF5 = ducVar.f();
            if (!"libcore.io.DiskLruCache".equals(strF) || !"1".equals(strF2) || !Integer.toString(this.e).equals(strF3) || !Integer.toString(this.g).equals(strF4) || !"".equals(strF5)) {
                throw new IOException("unexpected journal header: [" + strF + ", " + strF2 + ", " + strF4 + ", " + strF5 + "]");
            }
            int i = 0;
            while (true) {
                try {
                    Q(ducVar.f());
                    i++;
                } catch (EOFException unused) {
                    this.k = i - this.j.size();
                    zoe.a(ducVar);
                    return;
                }
            }
        } catch (Throwable th) {
            zoe.a(ducVar);
            throw th;
        }
    }

    public final void Q(String str) throws IOException {
        String strSubstring;
        int iIndexOf = str.indexOf(32);
        if (iIndexOf == -1) {
            ik4.g("unexpected journal line: ".concat(str));
            return;
        }
        int i = iIndexOf + 1;
        int iIndexOf2 = str.indexOf(32, i);
        LinkedHashMap linkedHashMap = this.j;
        if (iIndexOf2 == -1) {
            strSubstring = str.substring(i);
            if (iIndexOf == 6 && str.startsWith("REMOVE")) {
                linkedHashMap.remove(strSubstring);
                return;
            }
        } else {
            strSubstring = str.substring(i, iIndexOf2);
        }
        bg3 bg3Var = (bg3) linkedHashMap.get(strSubstring);
        if (bg3Var == null) {
            bg3Var = new bg3(this, strSubstring);
            linkedHashMap.put(strSubstring, bg3Var);
        }
        if (iIndexOf2 == -1 || iIndexOf != 5 || !str.startsWith("CLEAN")) {
            if (iIndexOf2 == -1 && iIndexOf == 5 && str.startsWith("DIRTY")) {
                bg3Var.d = new zf3(this, bg3Var);
                return;
            } else {
                if (iIndexOf2 == -1 && iIndexOf == 4 && str.startsWith("READ")) {
                    return;
                }
                ik4.g("unexpected journal line: ".concat(str));
                return;
            }
        }
        String[] strArrSplit = str.substring(iIndexOf2 + 1).split(" ");
        bg3Var.c = true;
        bg3Var.d = null;
        if (strArrSplit.length != bg3Var.e.g) {
            ik4.l("unexpected journal line: ", Arrays.toString(strArrSplit));
            return;
        }
        for (int i2 = 0; i2 < strArrSplit.length; i2++) {
            try {
                bg3Var.b[i2] = Long.parseLong(strArrSplit[i2]);
            } catch (NumberFormatException unused) {
                ik4.l("unexpected journal line: ", Arrays.toString(strArrSplit));
                return;
            }
        }
    }

    public final synchronized void R() {
        try {
            BufferedWriter bufferedWriter = this.i;
            if (bufferedWriter != null) {
                bufferedWriter.close();
            }
            BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.c), zoe.a));
            try {
                bufferedWriter2.write("libcore.io.DiskLruCache");
                bufferedWriter2.write("\n");
                bufferedWriter2.write("1");
                bufferedWriter2.write("\n");
                bufferedWriter2.write(Integer.toString(this.e));
                bufferedWriter2.write("\n");
                bufferedWriter2.write(Integer.toString(this.g));
                bufferedWriter2.write("\n");
                bufferedWriter2.write("\n");
                for (bg3 bg3Var : this.j.values()) {
                    if (bg3Var.d != null) {
                        bufferedWriter2.write("DIRTY " + bg3Var.a + '\n');
                    } else {
                        bufferedWriter2.write("CLEAN " + bg3Var.a + bg3Var.c() + '\n');
                    }
                }
                bufferedWriter2.close();
                if (this.b.exists()) {
                    U(this.b, this.d, true);
                }
                U(this.c, this.b, false);
                this.d.delete();
                this.i = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.b, true), zoe.a));
            } catch (Throwable th) {
                bufferedWriter2.close();
                throw th;
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized boolean T(String str) {
        try {
            if (this.i == null) {
                throw new IllegalStateException("cache is closed");
            }
            j0(str);
            bg3 bg3Var = (bg3) this.j.get(str);
            if (bg3Var != null && bg3Var.d == null) {
                for (int i = 0; i < this.g; i++) {
                    File fileA = bg3Var.a(i);
                    if (fileA.exists() && !fileA.delete()) {
                        throw new IOException("failed to delete " + fileA);
                    }
                    long j = this.h;
                    long[] jArr = bg3Var.b;
                    this.h = j - jArr[i];
                    jArr[i] = 0;
                }
                this.k++;
                this.i.append((CharSequence) ("REMOVE " + str + '\n'));
                this.j.remove(str);
                if (D()) {
                    this.m.submit(this.n);
                }
                return true;
            }
            return false;
        } finally {
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        try {
            if (this.i == null) {
                return;
            }
            Iterator it2 = new ArrayList(this.j.values()).iterator();
            while (it2.hasNext()) {
                zf3 zf3Var = ((bg3) it2.next()).d;
                if (zf3Var != null) {
                    zf3Var.a();
                }
            }
            g0();
            this.i.close();
            this.i = null;
        } catch (Throwable th) {
            throw th;
        }
    }

    public final synchronized void f(zf3 zf3Var, boolean z) {
        bg3 bg3Var = (bg3) zf3Var.d;
        if (bg3Var.d != zf3Var) {
            throw new IllegalStateException();
        }
        if (z && !bg3Var.c) {
            for (int i = 0; i < this.g; i++) {
                if (!((boolean[]) zf3Var.b)[i]) {
                    zf3Var.a();
                    throw new IllegalStateException("Newly created entry didn't create value for index " + i);
                }
                if (!bg3Var.b(i).exists()) {
                    zf3Var.a();
                    return;
                }
            }
        }
        for (int i2 = 0; i2 < this.g; i2++) {
            File fileB = bg3Var.b(i2);
            if (!z) {
                m(fileB);
            } else if (fileB.exists()) {
                File fileA = bg3Var.a(i2);
                fileB.renameTo(fileA);
                long j = bg3Var.b[i2];
                long length = fileA.length();
                bg3Var.b[i2] = length;
                this.h = (this.h - j) + length;
            }
        }
        this.k++;
        bg3Var.d = null;
        if (bg3Var.c || z) {
            bg3Var.c = true;
            this.i.write("CLEAN " + bg3Var.a + bg3Var.c() + '\n');
            if (z) {
                this.l++;
            }
        } else {
            this.j.remove(bg3Var.a);
            this.i.write("REMOVE " + bg3Var.a + '\n');
        }
        this.i.flush();
        if (this.h > this.f || D()) {
            this.m.submit(this.n);
        }
    }

    public final void g0() {
        while (this.h > this.f) {
            T((String) ((Map.Entry) this.j.entrySet().iterator().next()).getKey());
        }
    }

    public final zf3 p(String str) {
        synchronized (this) {
            try {
                if (this.i == null) {
                    throw new IllegalStateException("cache is closed");
                }
                j0(str);
                bg3 bg3Var = (bg3) this.j.get(str);
                if (bg3Var == null) {
                    bg3Var = new bg3(this, str);
                    this.j.put(str, bg3Var);
                } else if (bg3Var.d != null) {
                    return null;
                }
                zf3 zf3Var = new zf3(this, bg3Var);
                bg3Var.d = zf3Var;
                this.i.write("DIRTY " + str + '\n');
                this.i.flush();
                return zf3Var;
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
