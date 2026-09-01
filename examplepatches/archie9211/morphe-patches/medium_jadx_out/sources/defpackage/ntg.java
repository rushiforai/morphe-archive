package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public enum ntg implements auf {
    UNKNOWN_PREFIX(0),
    TINK(1),
    zzc(2),
    RAW(3),
    CRUNCHY(4),
    WITH_ID_REQUIREMENT(5),
    UNRECOGNIZED(-1);

    public final int a;

    ntg(int i) {
        this.a = i;
    }

    public static ntg zza(int i) {
        if (i == 0) {
            return UNKNOWN_PREFIX;
        }
        if (i == 1) {
            return TINK;
        }
        if (i == 2) {
            return zzc;
        }
        if (i == 3) {
            return RAW;
        }
        if (i == 4) {
            return CRUNCHY;
        }
        if (i != 5) {
            return null;
        }
        return WITH_ID_REQUIREMENT;
    }

    @Override // java.lang.Enum
    public final String toString() {
        StringBuilder sb = new StringBuilder("<");
        sb.append(ntg.class.getName());
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
