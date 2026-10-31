package mo;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public static final o f76594a;

    /* renamed from: b, reason: collision with root package name */
    public static final o f76595b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f76596c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ o[] f76597d;

    static {
        o oVar = new o("LOADED", 0);
        f76594a = oVar;
        o oVar2 = new o("REFRESHING", 1);
        f76595b = oVar2;
        o oVar3 = new o("EMPTY", 2);
        f76596c = oVar3;
        o[] oVarArr = {oVar, oVar2, oVar3};
        f76597d = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f76597d.clone();
    }
}
