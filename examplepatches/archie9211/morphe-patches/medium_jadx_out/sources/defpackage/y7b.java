package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y7b {
    public static final y7b Faded;
    public static final y7b NotReposted;
    public static final y7b Reposted;
    public static final /* synthetic */ y7b[] a;
    public static final /* synthetic */ i04 b;

    static {
        y7b y7bVar = new y7b("Reposted", 0);
        Reposted = y7bVar;
        y7b y7bVar2 = new y7b("NotReposted", 1);
        NotReposted = y7bVar2;
        y7b y7bVar3 = new y7b("Faded", 2);
        Faded = y7bVar3;
        y7b[] y7bVarArr = {y7bVar, y7bVar2, y7bVar3};
        a = y7bVarArr;
        b = new i04(y7bVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static y7b valueOf(String str) {
        return (y7b) Enum.valueOf(y7b.class, str);
    }

    public static y7b[] values() {
        return (y7b[]) a.clone();
    }
}
