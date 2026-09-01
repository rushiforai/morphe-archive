package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class d68 {
    public static final d68 MUTABLE;
    public static final d68 READ_ONLY;
    public static final /* synthetic */ d68[] a;

    public static d68 valueOf(String str) {
        return (d68) Enum.valueOf(d68.class, str);
    }

    public static d68[] values() {
        return (d68[]) a.clone();
    }

    static {
        d68 d68Var = new d68("READ_ONLY", 0);
        READ_ONLY = d68Var;
        d68 d68Var2 = new d68(ezwlgQm.JlBvHXOsjX, 1);
        MUTABLE = d68Var2;
        a = new d68[]{d68Var, d68Var2};
    }
}
