package uo;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public static final o f91491a;

    /* renamed from: b, reason: collision with root package name */
    public static final o f91492b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ o[] f91493c;

    /* JADX INFO: Fake field, exist only in values array */
    o EF0;

    static {
        o oVar = new o("UNSIGNED", 0);
        o oVar2 = new o("SIGNED", 1);
        f91491a = oVar2;
        o oVar3 = new o("VERIFIED", 2);
        f91492b = oVar3;
        f91493c = new o[]{oVar, oVar2, oVar3};
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f91493c.clone();
    }
}
