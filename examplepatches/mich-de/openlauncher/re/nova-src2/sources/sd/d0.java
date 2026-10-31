package sd;

import android.util.SparseArray;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static final d0 f87139a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ d0[] f87140b;

    /* JADX INFO: Fake field, exist only in values array */
    d0 EF0;

    static {
        d0 d0Var = new d0("NOT_SET", 0);
        d0 d0Var2 = new d0("EVENT_OVERRIDE", 1);
        f87139a = d0Var2;
        f87140b = new d0[]{d0Var, d0Var2};
        SparseArray sparseArray = new SparseArray();
        sparseArray.put(0, d0Var);
        sparseArray.put(5, d0Var2);
    }

    public static d0 valueOf(String str) {
        return (d0) Enum.valueOf(d0.class, str);
    }

    public static d0[] values() {
        return (d0[]) f87140b.clone();
    }
}
