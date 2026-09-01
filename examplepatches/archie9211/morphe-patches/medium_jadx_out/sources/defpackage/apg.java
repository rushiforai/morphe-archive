package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum apg implements jnf {
    UNKNOWN_HASH(0),
    SHA1(1),
    SHA384(2),
    SHA256(3),
    SHA512(4),
    SHA224(5),
    UNRECOGNIZED(-1);

    public final int a;

    apg(int i) {
        this.a = i;
    }

    public static apg zzb(int i) {
        if (i == 0) {
            return UNKNOWN_HASH;
        }
        if (i == 1) {
            return SHA1;
        }
        if (i == 2) {
            return SHA384;
        }
        if (i == 3) {
            return SHA256;
        }
        if (i == 4) {
            return SHA512;
        }
        if (i != 5) {
            return null;
        }
        return SHA224;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return Integer.toString(this.a);
    }

    public final int zza() {
        if (this != UNRECOGNIZED) {
            return this.a;
        }
        tnf.a();
        throw null;
    }
}
