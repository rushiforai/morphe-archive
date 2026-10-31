package qx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static final o7.a f84562b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f84563c;

    /* renamed from: d, reason: collision with root package name */
    public static final o f84564d;

    /* renamed from: e, reason: collision with root package name */
    public static final o f84565e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ o[] f84566f;

    /* renamed from: a, reason: collision with root package name */
    public final s0 f84567a;

    static {
        o oVar = new o("NONE", 0, null);
        f84563c = oVar;
        o oVar2 = new o("SMALL", 1, s0.f84601a);
        f84564d = oVar2;
        o oVar3 = new o("MEDIUM", 2, s0.f84602b);
        f84565e = oVar3;
        o[] oVarArr = {oVar, oVar2, oVar3};
        f84566f = oVarArr;
        EnumEntriesKt.a(oVarArr);
        f84562b = new o7.a(5);
    }

    public o(String str, int i5, s0 s0Var) {
        this.f84567a = s0Var;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f84566f.clone();
    }
}
