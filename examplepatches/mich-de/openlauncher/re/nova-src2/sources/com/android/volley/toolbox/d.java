package com.android.volley.toolbox;

import android.os.SystemClock;
import android.text.TextUtils;
import b.c0;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import jb.q;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: c, reason: collision with root package name */
    public final io.sentry.internal.debugmeta.c f21399c;

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f21397a = new LinkedHashMap(16, 0.75f, true);

    /* renamed from: b, reason: collision with root package name */
    public long f21398b = 0;

    /* renamed from: d, reason: collision with root package name */
    public final int f21400d = 5242880;

    public d(io.sentry.internal.debugmeta.c cVar) {
        this.f21399c = cVar;
    }

    public static String c(String str) {
        int length = str.length() / 2;
        StringBuilder sbQ = a2.c.q(String.valueOf(str.substring(0, length).hashCode()));
        sbQ.append(String.valueOf(str.substring(length).hashCode()));
        return sbQ.toString();
    }

    public static int h(c cVar) throws IOException {
        int i5 = cVar.read();
        if (i5 != -1) {
            return i5;
        }
        throw new EOFException();
    }

    public static int i(c cVar) {
        return (h(cVar) << 24) | h(cVar) | (h(cVar) << 8) | (h(cVar) << 16);
    }

    public static long j(c cVar) {
        return (h(cVar) & 255) | ((h(cVar) & 255) << 8) | ((h(cVar) & 255) << 16) | ((h(cVar) & 255) << 24) | ((h(cVar) & 255) << 32) | ((h(cVar) & 255) << 40) | ((h(cVar) & 255) << 48) | ((255 & h(cVar)) << 56);
    }

    public static String k(c cVar) {
        return new String(l(cVar, j(cVar)), "UTF-8");
    }

    public static byte[] l(c cVar, long j11) throws IOException {
        long j12 = cVar.f21395b - cVar.f21396c;
        if (j11 >= 0 && j11 <= j12) {
            int i5 = (int) j11;
            if (i5 == j11) {
                byte[] bArr = new byte[i5];
                new DataInputStream(cVar).readFully(bArr);
                return bArr;
            }
        }
        StringBuilder sbU = c0.u(j11, "streamToBytes length=", ", maxLength=");
        sbU.append(j12);
        throw new IOException(sbU.toString());
    }

    public static void m(BufferedOutputStream bufferedOutputStream, int i5) {
        bufferedOutputStream.write(i5 & 255);
        bufferedOutputStream.write((i5 >> 8) & 255);
        bufferedOutputStream.write((i5 >> 16) & 255);
        bufferedOutputStream.write((i5 >> 24) & 255);
    }

    public static void n(BufferedOutputStream bufferedOutputStream, long j11) {
        bufferedOutputStream.write((byte) j11);
        bufferedOutputStream.write((byte) (j11 >>> 8));
        bufferedOutputStream.write((byte) (j11 >>> 16));
        bufferedOutputStream.write((byte) (j11 >>> 24));
        bufferedOutputStream.write((byte) (j11 >>> 32));
        bufferedOutputStream.write((byte) (j11 >>> 40));
        bufferedOutputStream.write((byte) (j11 >>> 48));
        bufferedOutputStream.write((byte) (j11 >>> 56));
    }

    public static void o(BufferedOutputStream bufferedOutputStream, String str) {
        byte[] bytes = str.getBytes("UTF-8");
        n(bufferedOutputStream, bytes.length);
        bufferedOutputStream.write(bytes, 0, bytes.length);
    }

    public final synchronized jb.a a(String str) {
        b bVar = (b) this.f21397a.get(str);
        if (bVar == null) {
            return null;
        }
        File fileB = b(str);
        try {
            c cVar = new c(new BufferedInputStream(new FileInputStream(fileB)), fileB.length());
            try {
                b bVarA = b.a(cVar);
                if (TextUtils.equals(str, bVarA.f21387b)) {
                    return bVar.b(l(cVar, cVar.f21395b - cVar.f21396c));
                }
                q.a("%s: key=%s, found=%s", fileB.getAbsolutePath(), str, bVarA.f21387b);
                b bVar2 = (b) this.f21397a.remove(str);
                if (bVar2 != null) {
                    this.f21398b -= bVar2.f21386a;
                }
                return null;
            } finally {
                cVar.close();
            }
        } catch (IOException e3) {
            q.a("%s: %s", fileB.getAbsolutePath(), e3.toString());
            synchronized (this) {
                boolean zDelete = b(str).delete();
                b bVar3 = (b) this.f21397a.remove(str);
                if (bVar3 != null) {
                    this.f21398b -= bVar3.f21386a;
                }
                if (!zDelete) {
                    q.a("Could not delete cache entry for key=%s, filename=%s", str, c(str));
                }
                return null;
            }
        }
    }

    public final File b(String str) {
        return new File(this.f21399c.u(), c(str));
    }

    public final synchronized void d() {
        long length;
        c cVar;
        File fileU = this.f21399c.u();
        if (!fileU.exists()) {
            if (!fileU.mkdirs()) {
                q.b("Unable to create cache dir %s", fileU.getAbsolutePath());
            }
            return;
        }
        File[] fileArrListFiles = fileU.listFiles();
        if (fileArrListFiles == null) {
            return;
        }
        for (File file : fileArrListFiles) {
            try {
                length = file.length();
                cVar = new c(new BufferedInputStream(new FileInputStream(file)), length);
            } catch (IOException unused) {
                file.delete();
            }
            try {
                b bVarA = b.a(cVar);
                bVarA.f21386a = length;
                g(bVarA.f21387b, bVarA);
                cVar.close();
            } catch (Throwable th2) {
                cVar.close();
                throw th2;
            }
        }
    }

    public final void e() {
        long j11 = this.f21398b;
        int i5 = this.f21400d;
        if (j11 < i5) {
            return;
        }
        int i11 = 0;
        if (q.f69424a) {
            q.c("Pruning old cache entries.", new Object[0]);
        }
        long j12 = this.f21398b;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        Iterator it = this.f21397a.entrySet().iterator();
        while (it.hasNext()) {
            b bVar = (b) ((Map.Entry) it.next()).getValue();
            if (b(bVar.f21387b).delete()) {
                this.f21398b -= bVar.f21386a;
            } else {
                String str = bVar.f21387b;
                q.a("Could not delete cache entry for key=%s, filename=%s", str, c(str));
            }
            it.remove();
            i11++;
            if (this.f21398b < i5 * 0.9f) {
                break;
            }
        }
        if (q.f69424a) {
            q.c("pruned %d files, %d bytes, %d ms", Integer.valueOf(i11), Long.valueOf(this.f21398b - j12), Long.valueOf(SystemClock.elapsedRealtime() - jElapsedRealtime));
        }
    }

    public final synchronized void f(String str, jb.a aVar) {
        BufferedOutputStream bufferedOutputStream;
        b bVar;
        long j11 = this.f21398b;
        byte[] bArr = aVar.f69369a;
        long length = j11 + bArr.length;
        int i5 = this.f21400d;
        if (length <= i5 || bArr.length <= i5 * 0.9f) {
            File fileB = b(str);
            try {
                bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(fileB));
                bVar = new b(str, aVar);
            } catch (IOException unused) {
                if (!fileB.delete()) {
                    q.a("Could not clean up file %s", fileB.getAbsolutePath());
                }
                if (!this.f21399c.u().exists()) {
                    q.a("Re-initializing cache after external clearing.", new Object[0]);
                    this.f21397a.clear();
                    this.f21398b = 0L;
                    d();
                }
            }
            if (!bVar.c(bufferedOutputStream)) {
                bufferedOutputStream.close();
                q.a("Failed to write header for %s", fileB.getAbsolutePath());
                throw new IOException();
            }
            bufferedOutputStream.write(aVar.f69369a);
            bufferedOutputStream.close();
            bVar.f21386a = fileB.length();
            g(str, bVar);
            e();
        }
    }

    public final void g(String str, b bVar) {
        LinkedHashMap linkedHashMap = this.f21397a;
        if (linkedHashMap.containsKey(str)) {
            this.f21398b = (bVar.f21386a - ((b) linkedHashMap.get(str)).f21386a) + this.f21398b;
        } else {
            this.f21398b += bVar.f21386a;
        }
        linkedHashMap.put(str, bVar);
    }
}
