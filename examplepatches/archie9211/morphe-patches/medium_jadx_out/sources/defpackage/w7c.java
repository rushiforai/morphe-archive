package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w7c {
    public static final w7c Expanded;
    public static final w7c Hidden;
    public static final w7c PartiallyExpanded;
    public static final /* synthetic */ w7c[] a;
    public static final /* synthetic */ i04 b;

    static {
        w7c w7cVar = new w7c("Hidden", 0);
        Hidden = w7cVar;
        w7c w7cVar2 = new w7c("Expanded", 1);
        Expanded = w7cVar2;
        w7c w7cVar3 = new w7c("PartiallyExpanded", 2);
        PartiallyExpanded = w7cVar3;
        w7c[] w7cVarArr = {w7cVar, w7cVar2, w7cVar3};
        a = w7cVarArr;
        b = new i04(w7cVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static w7c valueOf(String str) {
        return (w7c) Enum.valueOf(w7c.class, str);
    }

    public static w7c[] values() {
        return (w7c[]) a.clone();
    }
}
