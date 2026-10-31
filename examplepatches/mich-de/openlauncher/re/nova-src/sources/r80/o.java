package r80;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public static final o f85697a;

    /* renamed from: b, reason: collision with root package name */
    public static final o f85698b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ o[] f85699c;

    static {
        o oVar = new o("OFF", 0);
        f85697a = oVar;
        o oVar2 = new o("ERROR", 1);
        o oVar3 = new o("WARN", 2);
        f85698b = oVar3;
        o[] oVarArr = {oVar, oVar2, oVar3, new o("DEBUG", 3), new o("TRACE", 4)};
        f85699c = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f85699c.clone();
    }
}
