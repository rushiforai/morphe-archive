package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class x {

    /* renamed from: b, reason: collision with root package name */
    public static final x f56068b;

    /* renamed from: c, reason: collision with root package name */
    public static final x f56069c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ x[] f56070d;

    /* renamed from: a, reason: collision with root package name */
    public final String f56071a;

    static {
        x xVar = new x("USER_ACTION", 0, "user_action");
        f56068b = xVar;
        x xVar2 = new x("CUSTOMER_OBJECT", 1, "customer_object");
        f56069c = xVar2;
        x[] xVarArr = {xVar, xVar2};
        f56070d = xVarArr;
        EnumEntriesKt.a(xVarArr);
    }

    public x(String str, int i5, String str2) {
        this.f56071a = str2;
    }

    public static x valueOf(String str) {
        return (x) Enum.valueOf(x.class, str);
    }

    public static x[] values() {
        return (x[]) f56070d.clone();
    }
}
