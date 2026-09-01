package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bqb {
    public static final bqb BottomBar;
    public static final bqb Fab;
    public static final bqb MainContent;
    public static final bqb Snackbar;
    public static final bqb TopBar;
    public static final /* synthetic */ bqb[] a;
    public static final /* synthetic */ i04 b;

    static {
        bqb bqbVar = new bqb("TopBar", 0);
        TopBar = bqbVar;
        bqb bqbVar2 = new bqb("MainContent", 1);
        MainContent = bqbVar2;
        bqb bqbVar3 = new bqb("Snackbar", 2);
        Snackbar = bqbVar3;
        bqb bqbVar4 = new bqb("Fab", 3);
        Fab = bqbVar4;
        bqb bqbVar5 = new bqb("BottomBar", 4);
        BottomBar = bqbVar5;
        bqb[] bqbVarArr = {bqbVar, bqbVar2, bqbVar3, bqbVar4, bqbVar5};
        a = bqbVarArr;
        b = new i04(bqbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static bqb valueOf(String str) {
        return (bqb) Enum.valueOf(bqb.class, str);
    }

    public static bqb[] values() {
        return (bqb[]) a.clone();
    }
}
