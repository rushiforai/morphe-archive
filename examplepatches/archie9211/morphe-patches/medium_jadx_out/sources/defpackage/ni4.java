package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ni4 {
    public static final ni4 MatchedContacts;
    public static final ni4 RequestingPermission;
    public static final ni4 UploadingContacts;
    public static final /* synthetic */ ni4[] a;
    public static final /* synthetic */ i04 b;

    static {
        ni4 ni4Var = new ni4("RequestingPermission", 0);
        RequestingPermission = ni4Var;
        ni4 ni4Var2 = new ni4("UploadingContacts", 1);
        UploadingContacts = ni4Var2;
        ni4 ni4Var3 = new ni4("MatchedContacts", 2);
        MatchedContacts = ni4Var3;
        ni4[] ni4VarArr = {ni4Var, ni4Var2, ni4Var3};
        a = ni4VarArr;
        b = new i04(ni4VarArr);
    }

    public static g04 getEntries() {
        return b;
    }

    public static ni4 valueOf(String str) {
        return (ni4) Enum.valueOf(ni4.class, str);
    }

    public static ni4[] values() {
        return (ni4[]) a.clone();
    }
}
