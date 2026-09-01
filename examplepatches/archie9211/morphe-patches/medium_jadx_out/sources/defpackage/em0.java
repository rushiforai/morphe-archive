package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class em0 {
    public static final em0 DROP_OLDEST;
    public static final em0 IGNORE_NEWEST;
    public static final /* synthetic */ em0[] a;

    public static em0 valueOf(String str) {
        return (em0) Enum.valueOf(em0.class, str);
    }

    public static em0[] values() {
        return (em0[]) a.clone();
    }

    static {
        em0 em0Var = new em0(ezwlgQm.fSlnZeZvwzeQG, 0);
        DROP_OLDEST = em0Var;
        em0 em0Var2 = new em0("IGNORE_NEWEST", 1);
        IGNORE_NEWEST = em0Var2;
        a = new em0[]{em0Var, em0Var2};
    }
}
