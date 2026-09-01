package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d3g {
    protected transient int zza;

    public abstract void a(c4g c4gVar);

    public final byte[] b() {
        try {
            int iD = d();
            byte[] bArr = new byte[iD];
            c4g c4gVar = new c4g(bArr, iD);
            a(c4gVar);
            c4gVar.a();
            return bArr;
        } catch (IOException e) {
            lg8.p(ev6.x("Serializing ", getClass().getName(), " to a byte array threw an IOException (should never happen)."), e);
            return null;
        }
    }

    public abstract int c(d8g d8gVar);

    public abstract int d();
}
