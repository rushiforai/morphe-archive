package tx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public static final o f89913a;

    /* renamed from: b, reason: collision with root package name */
    public static final o f89914b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f89915c;

    /* renamed from: d, reason: collision with root package name */
    public static final o f89916d;

    /* renamed from: e, reason: collision with root package name */
    public static final o f89917e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ o[] f89918f;

    static {
        o oVar = new o("FEATURE_DISABLED", 0);
        f89913a = oVar;
        o oVar2 = new o("NOT_SIGNED_IN", 1);
        f89914b = oVar2;
        o oVar3 = new o("NO_SUBSCRIPTION", 2);
        f89915c = oVar3;
        o oVar4 = new o("NEEDS_CONSENT", 3);
        f89916d = oVar4;
        o oVar5 = new o("FULL_ACCESS", 4);
        f89917e = oVar5;
        o[] oVarArr = {oVar, oVar2, oVar3, oVar4, oVar5};
        f89918f = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f89918f.clone();
    }
}
