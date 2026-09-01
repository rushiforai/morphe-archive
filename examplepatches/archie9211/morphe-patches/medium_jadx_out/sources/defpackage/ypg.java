package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum ypg implements auf {
    UNKNOWN_CURVE(0),
    NIST_P256(2),
    NIST_P384(3),
    NIST_P521(4),
    CURVE25519(5),
    UNRECOGNIZED(-1);

    public final int a;

    ypg(int i) {
        this.a = i;
    }

    public static ypg zza(int i) {
        if (i == 0) {
            return UNKNOWN_CURVE;
        }
        if (i == 2) {
            return NIST_P256;
        }
        if (i == 3) {
            return NIST_P384;
        }
        if (i == 4) {
            return NIST_P521;
        }
        if (i != 5) {
            return null;
        }
        return CURVE25519;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(ypg.class.getName());
        sb.append('@');
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        if (this != UNRECOGNIZED) {
            sb.append(" number=");
            sb.append(zza());
        }
        sb.append(" name=");
        sb.append(name());
        sb.append('>');
        return sb.toString();
    }

    public final int zza() {
        if (this != UNRECOGNIZED) {
            return this.a;
        }
        ztf.c();
        throw null;
    }
}
