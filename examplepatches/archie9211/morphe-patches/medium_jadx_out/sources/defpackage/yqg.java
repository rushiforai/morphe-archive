package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum yqg implements auf {
    b(0),
    AES_128_GCM(1),
    AES_256_GCM(2),
    CHACHA20_POLY1305(3),
    UNRECOGNIZED(-1);

    public final int a;

    yqg(int i) {
        this.a = i;
    }

    public static yqg zza(int i) {
        if (i == 0) {
            return b;
        }
        if (i == 1) {
            return AES_128_GCM;
        }
        if (i == 2) {
            return AES_256_GCM;
        }
        if (i != 3) {
            return null;
        }
        return CHACHA20_POLY1305;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(yqg.class.getName());
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
