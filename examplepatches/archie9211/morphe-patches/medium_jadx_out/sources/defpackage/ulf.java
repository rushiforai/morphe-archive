package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ulf {
    public static final /* synthetic */ ulf[] a;
    public static final ulf zza;
    public static final ulf zzb;

    static {
        ulf ulfVar = new ulf("IEEE_P1363", 0);
        zza = ulfVar;
        ulf ulfVar2 = new ulf("DER", 1);
        zzb = ulfVar2;
        a = new ulf[]{ulfVar, ulfVar2};
    }

    public static ulf[] values() {
        return (ulf[]) a.clone();
    }
}
