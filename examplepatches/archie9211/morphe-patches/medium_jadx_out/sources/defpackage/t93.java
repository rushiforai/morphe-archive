package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class t93 {
    public static final t93 STABLE;
    public static final t93 UNSTABLE;
    public static final /* synthetic */ t93[] a;

    public static t93 valueOf(String str) {
        return (t93) Enum.valueOf(t93.class, str);
    }

    public static t93[] values() {
        return (t93[]) a.clone();
    }

    static {
        t93 t93Var = new t93("STABLE", 0);
        STABLE = t93Var;
        t93 t93Var2 = new t93(peNPu.uRPuGywmqOBWw, 1);
        UNSTABLE = t93Var2;
        a = new t93[]{t93Var, t93Var2};
    }
}
