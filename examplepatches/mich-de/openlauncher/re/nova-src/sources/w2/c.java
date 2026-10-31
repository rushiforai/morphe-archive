package w2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f93646a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f93647b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ c[] f93648c;

    static {
        c cVar = new c("Lsq2", 0);
        f93646a = cVar;
        c cVar2 = new c("Impulse", 1);
        f93647b = cVar2;
        c[] cVarArr = {cVar, cVar2};
        f93648c = cVarArr;
        EnumEntriesKt.a(cVarArr);
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f93648c.clone();
    }
}
