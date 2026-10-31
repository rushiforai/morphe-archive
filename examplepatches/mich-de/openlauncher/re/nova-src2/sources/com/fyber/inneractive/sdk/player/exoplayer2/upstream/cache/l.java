package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import android.os.ConditionVariable;
import android.util.Log;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.BufferedInputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.regex.Pattern;
import javax.crypto.CipherInputStream;
import javax.crypto.spec.IvParameterSpec;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final File f30328a;

    /* renamed from: b, reason: collision with root package name */
    public final j f30329b;

    /* renamed from: d, reason: collision with root package name */
    public final i f30331d;

    /* renamed from: f, reason: collision with root package name */
    public a f30333f;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f30330c = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public final HashMap f30332e = new HashMap();

    public l(File file, j jVar) {
        this.f30328a = file;
        this.f30329b = jVar;
        this.f30331d = new i(file);
        ConditionVariable conditionVariable = new ConditionVariable();
        new k(this, conditionVariable).start();
        conditionVariable.block();
    }

    public final synchronized m a(String str, long j11) {
        String str2;
        m mVarA;
        try {
            a aVar = this.f30333f;
            if (aVar != null) {
                throw aVar;
            }
            h hVar = (h) this.f30331d.f30317a.get(str);
            if (hVar == null) {
                str2 = str;
                mVarA = new m(str2, j11, -1L, -9223372036854775807L, null);
            } else {
                str2 = str;
                while (true) {
                    mVarA = hVar.a(j11);
                    if (!mVarA.f30310d || mVarA.f30311e.length() == mVarA.f30309c) {
                        break;
                    }
                    a();
                }
            }
            if (!mVarA.f30310d) {
                if (this.f30330c.containsKey(str2)) {
                    return null;
                }
                this.f30330c.put(str2, mVarA);
                return mVarA;
            }
            h hVar2 = (h) this.f30331d.f30317a.get(str2);
            if (!hVar2.f30315c.remove(mVarA)) {
                throw new IllegalStateException();
            }
            int i5 = hVar2.f30313a;
            if (!mVarA.f30310d) {
                throw new IllegalStateException();
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            File parentFile = mVarA.f30311e.getParentFile();
            long j12 = mVarA.f30308b;
            Pattern pattern = m.f30334g;
            File file = new File(parentFile, i5 + "." + j12 + "." + jCurrentTimeMillis + ".v3.exo");
            m mVar = new m(mVarA.f30307a, mVarA.f30308b, mVarA.f30309c, jCurrentTimeMillis, file);
            if (!mVarA.f30311e.renameTo(file)) {
                throw new a("Renaming of " + mVarA.f30311e + " to " + file + " failed.");
            }
            hVar2.f30315c.add(mVar);
            ArrayList arrayList = (ArrayList) this.f30332e.get(mVarA.f30307a);
            if (arrayList != null) {
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    j jVar = (j) arrayList.get(size);
                    jVar.f30324a.remove(mVarA);
                    jVar.f30325b -= mVarA.f30309c;
                    jVar.f30324a.add(mVar);
                    jVar.f30325b += mVar.f30309c;
                    jVar.a(this, 0L);
                }
            }
            j jVar2 = this.f30329b;
            jVar2.f30324a.remove(mVarA);
            jVar2.f30325b -= mVarA.f30309c;
            jVar2.f30324a.add(mVar);
            jVar2.f30325b += mVar.f30309c;
            jVar2.a(this, 0L);
            return mVar;
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void b(m mVar) {
        if (mVar != this.f30330c.remove(mVar.f30307a)) {
            throw new IllegalStateException();
        }
        notifyAll();
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x00d1  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00fa  */
    /* JADX WARN: Removed duplicated region for block: B:91:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void a(l lVar) throws Throwable {
        DataInputStream dataInputStream;
        DataInputStream dataInputStream2;
        File[] fileArrListFiles;
        BufferedInputStream bufferedInputStream;
        if (!lVar.f30328a.exists()) {
            lVar.f30328a.mkdirs();
            return;
        }
        i iVar = lVar.f30331d;
        if (!iVar.f30322f) {
            DataInputStream dataInputStream3 = null;
            try {
                try {
                    bufferedInputStream = new BufferedInputStream(iVar.f30319c.a());
                    dataInputStream = new DataInputStream(bufferedInputStream);
                    try {
                    } catch (FileNotFoundException unused) {
                        if (dataInputStream != null) {
                            z.a(dataInputStream);
                        }
                        com.fyber.inneractive.sdk.player.exoplayer2.util.c cVar = iVar.f30319c;
                        cVar.f30429a.delete();
                        cVar.f30430b.delete();
                        iVar.f30317a.clear();
                        iVar.f30318b.clear();
                        fileArrListFiles = lVar.f30328a.listFiles();
                        if (fileArrListFiles == null) {
                        }
                    } catch (IOException e3) {
                        e = e3;
                        Log.e("CachedContentIndex", "Error reading cache content index file.", e);
                        if (dataInputStream != null) {
                            z.a(dataInputStream);
                        }
                        com.fyber.inneractive.sdk.player.exoplayer2.util.c cVar2 = iVar.f30319c;
                        cVar2.f30429a.delete();
                        cVar2.f30430b.delete();
                        iVar.f30317a.clear();
                        iVar.f30318b.clear();
                        fileArrListFiles = lVar.f30328a.listFiles();
                        if (fileArrListFiles == null) {
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (dataInputStream2 != null) {
                        z.a(dataInputStream2);
                    }
                    throw th;
                }
            } catch (FileNotFoundException unused2) {
                dataInputStream = null;
            } catch (IOException e11) {
                e = e11;
                dataInputStream = null;
            } catch (Throwable th3) {
                th = th3;
            }
            if (dataInputStream.readInt() == 1) {
                if ((dataInputStream.readInt() & 1) != 0) {
                    if (iVar.f30320d != null) {
                        byte[] bArr = new byte[16];
                        dataInputStream.readFully(bArr);
                        try {
                            iVar.f30320d.init(2, iVar.f30321e, new IvParameterSpec(bArr));
                            dataInputStream = new DataInputStream(new CipherInputStream(bufferedInputStream, iVar.f30320d));
                        } catch (InvalidAlgorithmParameterException e12) {
                            e = e12;
                            throw new IllegalStateException(e);
                        } catch (InvalidKeyException e13) {
                            e = e13;
                            throw new IllegalStateException(e);
                        }
                    }
                } else if (iVar.f30320d != null) {
                    iVar.f30322f = true;
                }
                try {
                    int i5 = dataInputStream.readInt();
                    int i11 = 0;
                    for (int i12 = 0; i12 < i5; i12++) {
                        int i13 = dataInputStream.readInt();
                        String utf = dataInputStream.readUTF();
                        h hVar = new h(i13, utf, dataInputStream.readLong());
                        iVar.f30317a.put(utf, hVar);
                        iVar.f30318b.put(i13, utf);
                        int iHashCode = utf.hashCode();
                        long j11 = hVar.f30316d;
                        i11 += ((iHashCode + (i13 * 31)) * 31) + ((int) (j11 ^ (j11 >>> 32)));
                    }
                    if (dataInputStream.readInt() == i11) {
                        z.a(dataInputStream);
                        fileArrListFiles = lVar.f30328a.listFiles();
                        if (fileArrListFiles == null) {
                            return;
                        }
                        for (File file : fileArrListFiles) {
                            if (!file.getName().equals("cached_content_index.exi")) {
                                m mVarA = file.length() > 0 ? m.a(file, lVar.f30331d) : null;
                                if (mVarA != null) {
                                    lVar.a(mVarA);
                                } else {
                                    file.delete();
                                }
                            }
                        }
                        lVar.f30331d.a();
                        lVar.f30331d.b();
                        return;
                    }
                    z.a(dataInputStream);
                    com.fyber.inneractive.sdk.player.exoplayer2.util.c cVar22 = iVar.f30319c;
                    cVar22.f30429a.delete();
                    cVar22.f30430b.delete();
                    iVar.f30317a.clear();
                    iVar.f30318b.clear();
                    fileArrListFiles = lVar.f30328a.listFiles();
                    if (fileArrListFiles == null) {
                    }
                } catch (Throwable th4) {
                    th = th4;
                    dataInputStream3 = dataInputStream;
                    dataInputStream2 = dataInputStream3;
                    if (dataInputStream2 != null) {
                    }
                    throw th;
                }
            }
            z.a(dataInputStream);
            com.fyber.inneractive.sdk.player.exoplayer2.util.c cVar222 = iVar.f30319c;
            cVar222.f30429a.delete();
            cVar222.f30430b.delete();
            iVar.f30317a.clear();
            iVar.f30318b.clear();
            fileArrListFiles = lVar.f30328a.listFiles();
            if (fileArrListFiles == null) {
            }
        } else {
            throw new IllegalStateException();
        }
    }

    public final void a(m mVar) {
        i iVar = this.f30331d;
        String str = mVar.f30307a;
        h hVarA = (h) iVar.f30317a.get(str);
        if (hVarA == null) {
            hVarA = iVar.a(str, -1L);
        }
        hVarA.f30315c.add(mVar);
        ArrayList arrayList = (ArrayList) this.f30332e.get(mVar.f30307a);
        if (arrayList != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                j jVar = (j) arrayList.get(size);
                jVar.f30324a.add(mVar);
                jVar.f30325b += mVar.f30309c;
                jVar.a(this, 0L);
            }
        }
        j jVar2 = this.f30329b;
        jVar2.f30324a.add(mVar);
        jVar2.f30325b += mVar.f30309c;
        jVar2.a(this, 0L);
    }

    public final void a(g gVar, boolean z11) throws Throwable {
        h hVar = (h) this.f30331d.f30317a.get(gVar.f30307a);
        if (hVar == null || !hVar.f30315c.remove(gVar)) {
            return;
        }
        gVar.f30311e.delete();
        if (z11 && hVar.f30315c.isEmpty()) {
            i iVar = this.f30331d;
            h hVar2 = (h) iVar.f30317a.remove(hVar.f30314b);
            if (hVar2 != null) {
                if (hVar2.f30315c.isEmpty()) {
                    iVar.f30318b.remove(hVar2.f30313a);
                    iVar.f30322f = true;
                } else {
                    throw new IllegalStateException();
                }
            }
            this.f30331d.b();
        }
        ArrayList arrayList = (ArrayList) this.f30332e.get(gVar.f30307a);
        if (arrayList != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                j jVar = (j) arrayList.get(size);
                jVar.f30324a.remove(gVar);
                jVar.f30325b -= gVar.f30309c;
            }
        }
        j jVar2 = this.f30329b;
        jVar2.f30324a.remove(gVar);
        jVar2.f30325b -= gVar.f30309c;
    }

    public final void a() throws Throwable {
        LinkedList linkedList = new LinkedList();
        Iterator it = this.f30331d.f30317a.values().iterator();
        while (it.hasNext()) {
            Iterator it2 = ((h) it.next()).f30315c.iterator();
            while (it2.hasNext()) {
                g gVar = (g) it2.next();
                if (gVar.f30311e.length() != gVar.f30309c) {
                    linkedList.add(gVar);
                }
            }
        }
        Iterator it3 = linkedList.iterator();
        while (it3.hasNext()) {
            a((g) it3.next(), false);
        }
        this.f30331d.a();
        this.f30331d.b();
    }

    public final synchronized long a(String str) {
        h hVar;
        hVar = (h) this.f30331d.f30317a.get(str);
        return hVar == null ? -1L : hVar.f30316d;
    }
}
