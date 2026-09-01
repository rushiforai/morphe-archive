package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class lq4 implements s72 {
    public static final lq4 INSTANCE;
    public static final /* synthetic */ lq4[] a;

    static {
        lq4 lq4Var = new lq4("INSTANCE", 0);
        INSTANCE = lq4Var;
        a = new lq4[]{lq4Var};
    }

    public static lq4 valueOf(String str) {
        return (lq4) Enum.valueOf(lq4.class, str);
    }

    public static lq4[] values() {
        return (lq4[]) a.clone();
    }

    @Override // defpackage.s72
    public void accept(rxc rxcVar) {
        rxcVar.request(Long.MAX_VALUE);
    }
}
