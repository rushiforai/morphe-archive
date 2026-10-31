package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class f42 {

    /* renamed from: a, reason: collision with root package name */
    public static final f42 f3155a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ f42[] f3156b;

    static {
        f42 f42Var = new f42("PENDING", 0);
        f42 f42Var2 = new f42("READY_TO_PING", 1);
        f3155a = f42Var2;
        f42[] f42VarArr = {f42Var, f42Var2};
        f3156b = f42VarArr;
        EnumEntriesKt.a(f42VarArr);
    }

    public static f42[] values() {
        return (f42[]) f3156b.clone();
    }
}
