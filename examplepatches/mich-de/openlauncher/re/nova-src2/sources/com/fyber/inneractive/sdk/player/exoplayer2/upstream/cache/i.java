package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import android.util.SparseArray;
import com.fyber.inneractive.sdk.player.exoplayer2.util.p;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.c f30319c;

    /* renamed from: f, reason: collision with root package name */
    public boolean f30322f;

    /* renamed from: g, reason: collision with root package name */
    public p f30323g;

    /* renamed from: d, reason: collision with root package name */
    public final Cipher f30320d = null;

    /* renamed from: e, reason: collision with root package name */
    public final SecretKeySpec f30321e = null;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f30317a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final SparseArray f30318b = new SparseArray();

    public i(File file) {
        this.f30319c = new com.fyber.inneractive.sdk.player.exoplayer2.util.c(new File(file, "cached_content_index.exi"));
    }

    public final void a() {
        LinkedList linkedList = new LinkedList();
        for (h hVar : this.f30317a.values()) {
            if (hVar.f30315c.isEmpty()) {
                linkedList.add(hVar.f30314b);
            }
        }
        Iterator it = linkedList.iterator();
        while (it.hasNext()) {
            h hVar2 = (h) this.f30317a.remove((String) it.next());
            if (hVar2 != null) {
                if (!hVar2.f30315c.isEmpty()) {
                    throw new IllegalStateException();
                }
                this.f30318b.remove(hVar2.f30313a);
                this.f30322f = true;
            }
        }
    }

    public final void b() throws Throwable {
        DataOutputStream dataOutputStream;
        IOException e3;
        Throwable th2;
        if (!this.f30322f) {
            return;
        }
        DataOutputStream dataOutputStream2 = null;
        try {
            com.fyber.inneractive.sdk.player.exoplayer2.util.b bVarB = this.f30319c.b();
            p pVar = this.f30323g;
            if (pVar == null) {
                this.f30323g = new p(bVarB);
            } else {
                pVar.a(bVarB);
            }
            dataOutputStream = new DataOutputStream(this.f30323g);
            try {
                dataOutputStream.writeInt(1);
                dataOutputStream.writeInt(this.f30320d != null ? 1 : 0);
                if (this.f30320d != null) {
                    byte[] bArr = new byte[16];
                    new Random().nextBytes(bArr);
                    dataOutputStream.write(bArr);
                    try {
                        this.f30320d.init(1, this.f30321e, new IvParameterSpec(bArr));
                        dataOutputStream.flush();
                        dataOutputStream2 = new DataOutputStream(new CipherOutputStream(this.f30323g, this.f30320d));
                    } catch (InvalidAlgorithmParameterException e11) {
                        e = e11;
                        throw new IllegalStateException(e);
                    } catch (InvalidKeyException e12) {
                        e = e12;
                        throw new IllegalStateException(e);
                    }
                } else {
                    dataOutputStream2 = dataOutputStream;
                }
                dataOutputStream2.writeInt(this.f30317a.size());
                int i5 = 0;
                for (h hVar : this.f30317a.values()) {
                    dataOutputStream2.writeInt(hVar.f30313a);
                    dataOutputStream2.writeUTF(hVar.f30314b);
                    dataOutputStream2.writeLong(hVar.f30316d);
                    int iHashCode = (hVar.f30314b.hashCode() + (hVar.f30313a * 31)) * 31;
                    long j11 = hVar.f30316d;
                    i5 += iHashCode + ((int) (j11 ^ (j11 >>> 32)));
                }
                dataOutputStream2.writeInt(i5);
                com.fyber.inneractive.sdk.player.exoplayer2.util.c cVar = this.f30319c;
                cVar.getClass();
                dataOutputStream2.close();
                cVar.f30430b.delete();
                int i11 = z.f30489a;
                this.f30322f = false;
            } catch (IOException e13) {
                e3 = e13;
                try {
                    throw new a(e3);
                } catch (Throwable th3) {
                    DataOutputStream dataOutputStream3 = dataOutputStream;
                    th = th3;
                    dataOutputStream2 = dataOutputStream3;
                    Throwable th4 = th;
                    dataOutputStream = dataOutputStream2;
                    th2 = th4;
                    z.a(dataOutputStream);
                    throw th2;
                }
            } catch (Throwable th5) {
                th2 = th5;
                z.a(dataOutputStream);
                throw th2;
            }
        } catch (IOException e14) {
            dataOutputStream = dataOutputStream2;
            e3 = e14;
        } catch (Throwable th6) {
            th = th6;
            Throwable th42 = th;
            dataOutputStream = dataOutputStream2;
            th2 = th42;
            z.a(dataOutputStream);
            throw th2;
        }
    }

    public final h a(String str, long j11) {
        SparseArray sparseArray = this.f30318b;
        int size = sparseArray.size();
        int i5 = 0;
        int iKeyAt = size == 0 ? 0 : sparseArray.keyAt(size - 1) + 1;
        if (iKeyAt < 0) {
            while (i5 < size && i5 == sparseArray.keyAt(i5)) {
                i5++;
            }
            iKeyAt = i5;
        }
        h hVar = new h(iKeyAt, str, j11);
        this.f30317a.put(str, hVar);
        this.f30318b.put(iKeyAt, str);
        this.f30322f = true;
        return hVar;
    }
}
