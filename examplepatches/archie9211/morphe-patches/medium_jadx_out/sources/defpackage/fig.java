package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fig implements hig {
    public static final /* synthetic */ fig[] a;
    public static final fig zza;

    static {
        fig figVar = new fig("INSTANCE", 0);
        zza = figVar;
        a = new fig[]{figVar};
    }

    public static fig[] values() {
        return (fig[]) a.clone();
    }

    @Override // defpackage.hig
    public final /* synthetic */ long zza(byte[] bArr, int i) {
        if (ordinal() != 0) {
            throw null;
        }
        byte b = bArr[i + 7];
        return ((((long) bArr[i + 6]) & 255) << 48) | ((b & 255) << 56) | ((((long) bArr[i + 5]) & 255) << 40) | ((((long) bArr[i + 4]) & 255) << 32) | ((((long) bArr[i + 3]) & 255) << 24) | ((((long) bArr[i + 2]) & 255) << 16) | ((((long) bArr[i + 1]) & 255) << 8) | (((long) bArr[i]) & 255);
    }
}
