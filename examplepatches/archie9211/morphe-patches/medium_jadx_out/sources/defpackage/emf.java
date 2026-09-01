package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class emf {
    protected transient int zzb;

    public abstract void a(h30 h30Var);

    public abstract int b();

    public final omf c() {
        try {
            int iB = b();
            omf omfVar = pmf.b;
            byte[] bArr = new byte[iB];
            h30 h30Var = new h30(bArr, iB);
            a(h30Var);
            int i = iB - h30Var.c;
            if (i > 0) {
                throw new IllegalStateException("Did not write as much data as expected.");
            }
            if (i >= 0) {
                return new omf(bArr);
            }
            throw new IllegalStateException("Wrote more data than expected.");
        } catch (IOException e) {
            String name = getClass().getName();
            lg8.p(y30.s(new StringBuilder(name.length() + 72), "Serializing ", name, " to a ByteString threw an IOException (should never happen)."), e);
            return null;
        }
    }

    public final byte[] d() {
        try {
            int iB = b();
            byte[] bArr = new byte[iB];
            h30 h30Var = new h30(bArr, iB);
            a(h30Var);
            int i = iB - h30Var.c;
            if (i > 0) {
                throw new IllegalStateException("Did not write as much data as expected.");
            }
            if (i >= 0) {
                return bArr;
            }
            throw new IllegalStateException("Wrote more data than expected.");
        } catch (IOException e) {
            String name = getClass().getName();
            lg8.p(y30.s(new StringBuilder(name.length() + 72), "Serializing ", name, " to a byte array threw an IOException (should never happen)."), e);
            return null;
        }
    }

    public abstract int e(vof vofVar);
}
