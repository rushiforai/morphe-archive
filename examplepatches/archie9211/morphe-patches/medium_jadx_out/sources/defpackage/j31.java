package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class j31 {
    public static final j31 DISABLED;
    public static final j31 ENABLED;
    public static final j31 READ_ONLY;
    public static final j31 WRITE_ONLY;
    public static final /* synthetic */ j31[] c;
    public static final /* synthetic */ i04 d;
    public final boolean a;
    public final boolean b;

    public j31(String str, int i, boolean z, boolean z2) {
        this.a = z;
        this.b = z2;
    }

    public static g04 getEntries() {
        return d;
    }

    public static j31 valueOf(String str) {
        return (j31) Enum.valueOf(j31.class, str);
    }

    public static j31[] values() {
        return (j31[]) c.clone();
    }

    public final boolean getReadEnabled() {
        return this.a;
    }

    public final boolean getWriteEnabled() {
        return this.b;
    }

    static {
        j31 j31Var = new j31("ENABLED", 0, true, true);
        ENABLED = j31Var;
        j31 j31Var2 = new j31("READ_ONLY", 1, true, false);
        READ_ONLY = j31Var2;
        j31 j31Var3 = new j31(ziYqbdHrAXvj.RLpibfqjLTZ, 2, false, true);
        WRITE_ONLY = j31Var3;
        j31 j31Var4 = new j31("DISABLED", 3, false, false);
        DISABLED = j31Var4;
        j31[] j31VarArr = {j31Var, j31Var2, j31Var3, j31Var4};
        c = j31VarArr;
        d = new i04(j31VarArr);
    }
}
