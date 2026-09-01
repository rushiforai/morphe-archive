package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zw7 {
    public static final zw7 NOT_A_MEMBER;
    public static final zw7 PREMIUM;
    public static final zw7 REGULAR;
    public static final /* synthetic */ zw7[] f;
    public static final /* synthetic */ i04 g;
    public final yw7 a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    static {
        zw7 zw7Var = new zw7("NOT_A_MEMBER", 0, yw7.LIMITED, false, false, false, false);
        NOT_A_MEMBER = zw7Var;
        yw7 yw7Var = yw7.UNLIMITED;
        zw7 zw7Var2 = new zw7("REGULAR", 1, yw7Var, true, true, false, false);
        REGULAR = zw7Var2;
        zw7 zw7Var3 = new zw7("PREMIUM", 2, yw7Var, true, true, true, true);
        PREMIUM = zw7Var3;
        zw7[] zw7VarArr = {zw7Var, zw7Var2, zw7Var3};
        f = zw7VarArr;
        g = new i04(zw7VarArr);
    }

    public zw7(String str, int i, yw7 yw7Var, boolean z, boolean z2, boolean z3, boolean z4) {
        this.a = yw7Var;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = z4;
    }

    public static g04 getEntries() {
        return g;
    }

    public static zw7 valueOf(String str) {
        return (zw7) Enum.valueOf(zw7.class, str);
    }

    public static zw7[] values() {
        return (zw7[]) f.clone();
    }

    public final boolean getAudioReadingEnabled() {
        return this.c;
    }

    public final boolean getCustomizeAppIcon() {
        return this.e;
    }

    public final boolean getMemberFriendLinksEnabled() {
        return this.d;
    }

    public final boolean getOfflineReadingEnabled() {
        return this.b;
    }

    public final yw7 getReadingAccess() {
        return this.a;
    }

    public final boolean isMember() {
        return d46.R(REGULAR, PREMIUM).contains(this);
    }
}
