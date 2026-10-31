package com.fyber.inneractive.sdk.player.cache;

import com.fyber.inneractive.sdk.util.IAlog;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/* loaded from: classes.dex */
public final class g implements Closeable {

    /* renamed from: p, reason: collision with root package name */
    public static final Pattern f28850p = Pattern.compile("[a-z0-9_-]{1,120}");

    /* renamed from: q, reason: collision with root package name */
    public static final b f28851q = new b();

    /* renamed from: a, reason: collision with root package name */
    public final File f28852a;

    /* renamed from: b, reason: collision with root package name */
    public final File f28853b;

    /* renamed from: c, reason: collision with root package name */
    public final File f28854c;

    /* renamed from: d, reason: collision with root package name */
    public final File f28855d;

    /* renamed from: f, reason: collision with root package name */
    public final long f28857f;

    /* renamed from: i, reason: collision with root package name */
    public BufferedWriter f28860i;

    /* renamed from: k, reason: collision with root package name */
    public int f28862k;

    /* renamed from: l, reason: collision with root package name */
    public f f28863l;

    /* renamed from: h, reason: collision with root package name */
    public long f28859h = 0;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f28861j = new LinkedHashMap(0, 0.75f, true);

    /* renamed from: m, reason: collision with root package name */
    public long f28864m = 0;
    public final ThreadPoolExecutor n = new ThreadPoolExecutor(0, 1, 60, TimeUnit.SECONDS, new LinkedBlockingQueue());
    public final a o = new a(this);

    /* renamed from: e, reason: collision with root package name */
    public final int f28856e = 0;

    /* renamed from: g, reason: collision with root package name */
    public final int f28858g = 1;

    public g(File file, long j11) {
        this.f28852a = file;
        this.f28853b = new File(file, "journal");
        this.f28854c = new File(file, "journal.tmp");
        this.f28855d = new File(file, "journal.bkp");
        this.f28857f = j11;
    }

    public static void a(g gVar, d dVar, boolean z11) {
        int i5;
        synchronized (gVar) {
            e eVar = dVar.f28841a;
            if (eVar.f28848d != dVar) {
                throw new IllegalStateException();
            }
            if (z11 && !eVar.f28847c) {
                for (int i11 = 0; i11 < gVar.f28858g; i11++) {
                    if (!dVar.f28842b[i11]) {
                        a(dVar.f28844d, dVar, false);
                        throw new IllegalStateException("Newly created entry didn't create value for index " + i11);
                    }
                    if (!eVar.b(i11).exists()) {
                        a(dVar.f28844d, dVar, false);
                        return;
                    }
                }
            }
            for (int i12 = 0; i12 < gVar.f28858g; i12++) {
                File fileB = eVar.b(i12);
                if (!z11) {
                    a(fileB);
                } else if (fileB.exists()) {
                    File fileA = eVar.a(i12);
                    fileB.renameTo(fileA);
                    long j11 = eVar.f28846b[i12];
                    long length = fileA.length();
                    eVar.f28846b[i12] = length;
                    gVar.f28859h = (gVar.f28859h - j11) + length;
                }
            }
            gVar.f28862k++;
            eVar.f28848d = null;
            if (eVar.f28847c || z11) {
                eVar.f28847c = true;
                BufferedWriter bufferedWriter = gVar.f28860i;
                StringBuilder sb2 = new StringBuilder("CLEAN ");
                sb2.append(eVar.f28845a);
                StringBuilder sb3 = new StringBuilder();
                for (long j12 : eVar.f28846b) {
                    sb3.append(' ');
                    sb3.append(j12);
                }
                sb2.append(sb3.toString());
                sb2.append('\n');
                bufferedWriter.write(sb2.toString());
                if (z11) {
                    gVar.f28864m++;
                }
            } else {
                gVar.f28861j.remove(eVar.f28845a);
                gVar.f28860i.write("REMOVE " + eVar.f28845a + '\n');
            }
            gVar.f28860i.flush();
            if (gVar.f28859h > gVar.f28857f || ((i5 = gVar.f28862k) >= 2000 && i5 >= gVar.f28861j.size())) {
                gVar.n.submit(gVar.o);
            }
        }
    }

    public final void b() {
        FileInputStream fileInputStream = new FileInputStream(this.f28853b);
        Charset charset = l.f28872a;
        k kVar = new k(fileInputStream);
        try {
            String strA = kVar.a();
            String strA2 = kVar.a();
            String strA3 = kVar.a();
            String strA4 = kVar.a();
            String strA5 = kVar.a();
            if (!"libcore.io.DiskLruCache".equals(strA) || !"1".equals(strA2) || !Integer.toString(this.f28856e).equals(strA3) || !Integer.toString(this.f28858g).equals(strA4) || !com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b.equals(strA5)) {
                throw new IOException("unexpected journal header: [" + strA + ", " + strA2 + ", " + strA4 + ", " + strA5 + "]");
            }
            int i5 = 0;
            while (true) {
                try {
                    b(kVar.a());
                    i5++;
                } catch (EOFException unused) {
                    this.f28862k = i5 - this.f28861j.size();
                    if (kVar.f28871e == -1) {
                        c();
                    } else {
                        this.f28860i = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.f28853b, true), l.f28872a));
                    }
                    try {
                        kVar.close();
                        return;
                    } catch (RuntimeException e3) {
                        throw e3;
                    } catch (Exception unused2) {
                        return;
                    }
                }
            }
        } catch (Throwable th2) {
            try {
                kVar.close();
            } catch (RuntimeException e11) {
                throw e11;
            } catch (Exception unused3) {
            }
            throw th2;
        }
    }

    public final synchronized void c() {
        try {
            BufferedWriter bufferedWriter = this.f28860i;
            if (bufferedWriter != null) {
                bufferedWriter.close();
            }
            BufferedWriter bufferedWriter2 = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.f28854c), l.f28872a));
            try {
                bufferedWriter2.write("libcore.io.DiskLruCache");
                bufferedWriter2.write("\n");
                bufferedWriter2.write("1");
                bufferedWriter2.write("\n");
                bufferedWriter2.write(Integer.toString(this.f28856e));
                bufferedWriter2.write("\n");
                bufferedWriter2.write(Integer.toString(this.f28858g));
                bufferedWriter2.write("\n");
                bufferedWriter2.write("\n");
                for (e eVar : this.f28861j.values()) {
                    if (eVar.f28848d != null) {
                        bufferedWriter2.write("DIRTY " + eVar.f28845a + '\n');
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("CLEAN ");
                        sb2.append(eVar.f28845a);
                        StringBuilder sb3 = new StringBuilder();
                        for (long j11 : eVar.f28846b) {
                            sb3.append(' ');
                            sb3.append(j11);
                        }
                        sb2.append(sb3.toString());
                        sb2.append('\n');
                        bufferedWriter2.write(sb2.toString());
                    }
                }
                bufferedWriter2.close();
                if (this.f28853b.exists()) {
                    File file = this.f28853b;
                    File file2 = this.f28855d;
                    a(file2);
                    if (!file.renameTo(file2)) {
                        throw new IOException();
                    }
                }
                if (!this.f28854c.renameTo(this.f28853b)) {
                    throw new IOException();
                }
                this.f28855d.delete();
                this.f28860i = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(this.f28853b, true), l.f28872a));
            } catch (Throwable th2) {
                bufferedWriter2.close();
                throw th2;
            }
        } catch (Throwable th3) {
            throw th3;
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final synchronized void close() {
        try {
            if (this.f28860i == null) {
                return;
            }
            Iterator it = new ArrayList(this.f28861j.values()).iterator();
            while (it.hasNext()) {
                d dVar = ((e) it.next()).f28848d;
                if (dVar != null) {
                    a(dVar.f28844d, dVar, false);
                }
            }
            d();
            this.f28860i.close();
            this.f28860i = null;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void d() {
        while (this.f28859h > this.f28857f) {
            String str = (String) ((Map.Entry) this.f28861j.entrySet().iterator().next()).getKey();
            f fVar = this.f28863l;
            if (fVar == null) {
                c(str);
            } else if (fVar.a(str)) {
                c(str);
            } else {
                boolean zC = false;
                for (String str2 : this.f28861j.keySet()) {
                    if (this.f28863l.a(str2)) {
                        zC |= c(str2);
                    }
                }
                if (!zC) {
                    return;
                }
            }
        }
    }

    public final void b(String str) throws IOException {
        String strSubstring;
        int iIndexOf = str.indexOf(32);
        if (iIndexOf != -1) {
            int i5 = iIndexOf + 1;
            int iIndexOf2 = str.indexOf(32, i5);
            if (iIndexOf2 == -1) {
                strSubstring = str.substring(i5);
                if (iIndexOf == 6 && str.startsWith("REMOVE")) {
                    this.f28861j.remove(strSubstring);
                    return;
                }
            } else {
                strSubstring = str.substring(i5, iIndexOf2);
            }
            e eVar = (e) this.f28861j.get(strSubstring);
            if (eVar == null) {
                eVar = new e(this, strSubstring);
                this.f28861j.put(strSubstring, eVar);
            }
            if (iIndexOf2 != -1 && iIndexOf == 5 && str.startsWith("CLEAN")) {
                String[] strArrSplit = str.substring(iIndexOf2 + 1).split(" ");
                eVar.f28847c = true;
                eVar.f28848d = null;
                if (strArrSplit.length == eVar.f28849e.f28858g) {
                    for (int i11 = 0; i11 < strArrSplit.length; i11++) {
                        try {
                            eVar.f28846b[i11] = Long.parseLong(strArrSplit[i11]);
                        } catch (NumberFormatException unused) {
                            throw new IOException("unexpected journal line: " + Arrays.toString(strArrSplit));
                        }
                    }
                    return;
                }
                throw new IOException("unexpected journal line: " + Arrays.toString(strArrSplit));
            }
            if (iIndexOf2 == -1 && iIndexOf == 5 && str.startsWith("DIRTY")) {
                eVar.f28848d = new d(this, eVar);
                return;
            } else {
                if (iIndexOf2 != -1 || iIndexOf != 4 || !str.startsWith("READ")) {
                    throw new IOException("unexpected journal line: ".concat(str));
                }
                return;
            }
        }
        throw new IOException("unexpected journal line: ".concat(str));
    }

    public final synchronized boolean c(String str) {
        try {
            IAlog.e("DiskLruCache remove %s", str);
            if (this.f28860i != null) {
                if (f28850p.matcher(str).matches()) {
                    e eVar = (e) this.f28861j.get(str);
                    if (eVar != null && eVar.f28848d == null) {
                        for (int i5 = 0; i5 < this.f28858g; i5++) {
                            File fileA = eVar.a(i5);
                            if (fileA.exists() && !fileA.delete()) {
                                throw new IOException("failed to delete " + fileA);
                            }
                            long j11 = this.f28859h;
                            long[] jArr = eVar.f28846b;
                            this.f28859h = j11 - jArr[i5];
                            jArr[i5] = 0;
                        }
                        this.f28862k++;
                        this.f28860i.append((CharSequence) ("REMOVE " + str + '\n'));
                        this.f28861j.remove(str);
                        int i11 = this.f28862k;
                        if (i11 >= 2000 && i11 >= this.f28861j.size()) {
                            this.n.submit(this.o);
                        }
                        return true;
                    }
                    return false;
                }
                throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,120}: \"" + str + "\"");
            }
            throw new IllegalStateException("cache is closed");
        } finally {
        }
    }

    public static g a(File file, long j11) throws IOException {
        if (j11 > 0) {
            File file2 = new File(file, "journal.bkp");
            if (file2.exists()) {
                File file3 = new File(file, "journal");
                if (file3.exists()) {
                    file2.delete();
                } else if (!file2.renameTo(file3)) {
                    throw new IOException();
                }
            }
            g gVar = new g(file, j11);
            if (gVar.f28853b.exists()) {
                try {
                    gVar.b();
                    gVar.a();
                    return gVar;
                } catch (IOException e3) {
                    System.out.println("DiskLruCache " + file + " is corrupt: " + e3.getMessage() + ", removing");
                    IAlog.e("DiskLruCache delete cache", new Object[0]);
                    gVar.close();
                    l.a(gVar.f28852a);
                }
            }
            file.mkdirs();
            g gVar2 = new g(file, j11);
            gVar2.c();
            return gVar2;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    public final void a() throws IOException {
        a(this.f28854c);
        Iterator it = this.f28861j.values().iterator();
        while (it.hasNext()) {
            e eVar = (e) it.next();
            int i5 = 0;
            if (eVar.f28848d == null) {
                while (i5 < this.f28858g) {
                    this.f28859h += eVar.f28846b[i5];
                    i5++;
                }
            } else {
                eVar.f28848d = null;
                while (i5 < this.f28858g) {
                    a(eVar.a(i5));
                    a(eVar.b(i5));
                    i5++;
                }
                it.remove();
            }
        }
    }

    public static void a(File file) throws IOException {
        IAlog.e("DiskLruCache deleteIfExists - %s", file);
        if (file.exists() && !file.delete()) {
            throw new IOException();
        }
    }

    public final d a(String str) {
        synchronized (this) {
            try {
                if (this.f28860i != null) {
                    if (f28850p.matcher(str).matches()) {
                        e eVar = (e) this.f28861j.get(str);
                        if (eVar == null) {
                            eVar = new e(this, str);
                            this.f28861j.put(str, eVar);
                        } else if (eVar.f28848d != null) {
                            return null;
                        }
                        d dVar = new d(this, eVar);
                        eVar.f28848d = dVar;
                        this.f28860i.write("DIRTY " + str + '\n');
                        this.f28860i.flush();
                        return dVar;
                    }
                    throw new IllegalArgumentException("keys must match regex [a-z0-9_-]{1,120}: \"" + str + "\"");
                }
                throw new IllegalStateException("cache is closed");
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
