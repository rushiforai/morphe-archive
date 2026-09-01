package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xrf {
    protected transient int zza;

    public abstract int a(suf sufVar);

    public final rsf b() {
        try {
            int iA = ((ytf) this).a(null);
            rsf rsfVar = hsf.b;
            byte[] bArr = new byte[iA];
            boolean z = htf.b;
            ftf ftfVar = new ftf(bArr, iA);
            ((ytf) this).k(ftfVar);
            ftfVar.p();
            return new rsf(bArr);
        } catch (IOException e) {
            lg8.p(ev6.x("Serializing ", getClass().getName(), " to a ByteString threw an IOException (should never happen)."), e);
            return null;
        }
    }

    public final byte[] c() {
        try {
            int iA = ((ytf) this).a(null);
            byte[] bArr = new byte[iA];
            boolean z = htf.b;
            ftf ftfVar = new ftf(bArr, iA);
            ((ytf) this).k(ftfVar);
            ftfVar.p();
            return bArr;
        } catch (IOException e) {
            lg8.p(ev6.x("Serializing ", getClass().getName(), " to a byte array threw an IOException (should never happen)."), e);
            return null;
        }
    }
}
