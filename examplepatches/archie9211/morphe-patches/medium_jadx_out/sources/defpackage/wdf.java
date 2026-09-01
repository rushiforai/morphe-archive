package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wdf {
    public static final wdf LATEST;
    public static final wdf RECOMMENDED;
    public static final /* synthetic */ wdf[] a;
    public static final /* synthetic */ i04 b;

    static {
        wdf wdfVar = new wdf("RECOMMENDED", 0);
        RECOMMENDED = wdfVar;
        wdf wdfVar2 = new wdf("LATEST", 1);
        LATEST = wdfVar2;
        wdf[] wdfVarArr = {wdfVar, wdfVar2};
        a = wdfVarArr;
        b = new i04(wdfVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static wdf valueOf(String str) {
        return (wdf) Enum.valueOf(wdf.class, str);
    }

    public static wdf[] values() {
        return (wdf[]) a.clone();
    }
}
