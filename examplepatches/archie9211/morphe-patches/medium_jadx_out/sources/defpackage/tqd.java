package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tqd {
    public static final tqd GRANTED;
    public static final tqd NOT_GRANTED;
    public static final tqd PENDING;
    public static final /* synthetic */ tqd[] a;

    static {
        tqd tqdVar = new tqd("GRANTED", 0);
        GRANTED = tqdVar;
        tqd tqdVar2 = new tqd("NOT_GRANTED", 1);
        NOT_GRANTED = tqdVar2;
        tqd tqdVar3 = new tqd("PENDING", 2);
        PENDING = tqdVar3;
        a = new tqd[]{tqdVar, tqdVar2, tqdVar3};
    }

    public static tqd valueOf(String str) {
        return (tqd) Enum.valueOf(tqd.class, str);
    }

    public static tqd[] values() {
        return (tqd[]) a.clone();
    }
}
