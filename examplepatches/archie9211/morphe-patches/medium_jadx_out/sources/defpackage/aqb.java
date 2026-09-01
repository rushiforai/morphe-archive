package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aqb {
    public static final aqb BottomBar;
    public static final aqb Fab;
    public static final aqb MainContent;
    public static final aqb Snackbar;
    public static final aqb TopBar;
    public static final /* synthetic */ aqb[] a;
    public static final /* synthetic */ i04 b;

    static {
        aqb aqbVar = new aqb("TopBar", 0);
        TopBar = aqbVar;
        aqb aqbVar2 = new aqb("MainContent", 1);
        MainContent = aqbVar2;
        aqb aqbVar3 = new aqb("Snackbar", 2);
        Snackbar = aqbVar3;
        aqb aqbVar4 = new aqb("Fab", 3);
        Fab = aqbVar4;
        aqb aqbVar5 = new aqb("BottomBar", 4);
        BottomBar = aqbVar5;
        aqb[] aqbVarArr = {aqbVar, aqbVar2, aqbVar3, aqbVar4, aqbVar5};
        a = aqbVarArr;
        b = new i04(aqbVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static aqb valueOf(String str) {
        return (aqb) Enum.valueOf(aqb.class, str);
    }

    public static aqb[] values() {
        return (aqb[]) a.clone();
    }
}
