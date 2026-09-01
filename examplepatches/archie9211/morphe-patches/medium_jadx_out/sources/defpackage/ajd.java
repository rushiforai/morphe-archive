package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ajd {
    public static final ajd HideKeyboard;
    public static final ajd ShowKeyboard;
    public static final ajd StartInput;
    public static final ajd StopInput;
    public static final /* synthetic */ ajd[] a;
    public static final /* synthetic */ i04 b;

    static {
        ajd ajdVar = new ajd("StartInput", 0);
        StartInput = ajdVar;
        ajd ajdVar2 = new ajd("StopInput", 1);
        StopInput = ajdVar2;
        ajd ajdVar3 = new ajd("ShowKeyboard", 2);
        ShowKeyboard = ajdVar3;
        ajd ajdVar4 = new ajd("HideKeyboard", 3);
        HideKeyboard = ajdVar4;
        ajd[] ajdVarArr = {ajdVar, ajdVar2, ajdVar3, ajdVar4};
        a = ajdVarArr;
        b = new i04(ajdVarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ajd valueOf(String str) {
        return (ajd) Enum.valueOf(ajd.class, str);
    }

    public static ajd[] values() {
        return (ajd[]) a.clone();
    }
}
