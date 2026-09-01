package defpackage;

import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lsa extends msa implements Serializable {
    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() {
        return ksa.a;
    }

    @Override // defpackage.msa
    public final int a(int i) {
        return msa.b.a(i);
    }

    @Override // defpackage.msa
    public final int b() {
        return msa.b.b();
    }

    @Override // defpackage.msa
    public final int c(int i, int i2) {
        return msa.b.c(0, i2);
    }

    @Override // defpackage.msa
    public final long d() {
        return msa.b.d();
    }

    @Override // defpackage.msa
    public final long e(long j, long j2) {
        throw null;
    }
}
