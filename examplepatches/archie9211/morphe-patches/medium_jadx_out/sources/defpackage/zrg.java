package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum zrg implements auf {
    UNKNOWN_KEYMATERIAL(0),
    SYMMETRIC(1),
    ASYMMETRIC_PRIVATE(2),
    ASYMMETRIC_PUBLIC(3),
    REMOTE(4),
    UNRECOGNIZED(-1);

    public final int a;

    zrg(int i) {
        this.a = i;
    }

    public static zrg zza(int i) {
        if (i == 0) {
            return UNKNOWN_KEYMATERIAL;
        }
        if (i == 1) {
            return SYMMETRIC;
        }
        if (i == 2) {
            return ASYMMETRIC_PRIVATE;
        }
        if (i == 3) {
            return ASYMMETRIC_PUBLIC;
        }
        if (i != 4) {
            return null;
        }
        return REMOTE;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(zrg.class.getName());
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
