package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rnd {
    public static final rnd AUTH_ERROR;
    public static final rnd BAD_CONFIG;
    public static final rnd OK;
    public static final /* synthetic */ rnd[] a;

    static {
        rnd rndVar = new rnd("OK", 0);
        OK = rndVar;
        rnd rndVar2 = new rnd("BAD_CONFIG", 1);
        BAD_CONFIG = rndVar2;
        rnd rndVar3 = new rnd("AUTH_ERROR", 2);
        AUTH_ERROR = rndVar3;
        a = new rnd[]{rndVar, rndVar2, rndVar3};
    }

    public static rnd valueOf(String str) {
        return (rnd) Enum.valueOf(rnd.class, str);
    }

    public static rnd[] values() {
        return (rnd[]) a.clone();
    }
}
