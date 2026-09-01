package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ine {
    public static final ine FOLLOW;
    public static final ine MUTE;
    public static final /* synthetic */ ine[] a;
    public static final /* synthetic */ i04 b;

    static {
        ine ineVar = new ine("FOLLOW", 0);
        FOLLOW = ineVar;
        ine ineVar2 = new ine("MUTE", 1);
        MUTE = ineVar2;
        ine[] ineVarArr = {ineVar, ineVar2};
        a = ineVarArr;
        b = new i04(ineVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ine valueOf(String str) {
        return (ine) Enum.valueOf(ine.class, str);
    }

    public static ine[] values() {
        return (ine[]) a.clone();
    }
}
