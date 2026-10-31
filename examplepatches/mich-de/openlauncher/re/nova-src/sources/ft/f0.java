package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f0 {

    /* renamed from: b, reason: collision with root package name */
    public static final f0 f55942b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ f0[] f55943c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55944d;

    /* renamed from: a, reason: collision with root package name */
    public final String f55945a;

    static {
        f0 f0Var = new f0("AMOUNTS", 0, "amounts");
        f0 f0Var2 = new f0("DESCRIPTOR_CODE", 1, "descriptor_code");
        f0 f0Var3 = new f0("UNKNOWN", 2, "unknown");
        f55942b = f0Var3;
        f0[] f0VarArr = {f0Var, f0Var2, f0Var3};
        f55943c = f0VarArr;
        f55944d = EnumEntriesKt.a(f0VarArr);
    }

    public f0(String str, int i5, String str2) {
        this.f55945a = str2;
    }

    public static f0 valueOf(String str) {
        return (f0) Enum.valueOf(f0.class, str);
    }

    public static f0[] values() {
        return (f0[]) f55943c.clone();
    }
}
