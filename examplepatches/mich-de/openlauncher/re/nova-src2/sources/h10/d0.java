package h10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: c, reason: collision with root package name */
    public static final d0 f58860c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ d0[] f58861d;

    /* renamed from: a, reason: collision with root package name */
    public final int f58862a;

    /* renamed from: b, reason: collision with root package name */
    public final int f58863b;

    static {
        d0 d0Var = new d0("SMALL", 0, 12, 2131428870);
        f58860c = d0Var;
        d0[] d0VarArr = {d0Var, new d0("MEDIUM", 1, 14, 2131428346), new d0("LARGE", 2, 16, 2131428260)};
        f58861d = d0VarArr;
        EnumEntriesKt.a(d0VarArr);
    }

    public d0(String str, int i5, int i11, int i12) {
        this.f58862a = i11;
        this.f58863b = i12;
    }

    public static d0 valueOf(String str) {
        return (d0) Enum.valueOf(d0.class, str);
    }

    public static d0[] values() {
        return (d0[]) f58861d.clone();
    }
}
