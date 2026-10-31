package mu;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f76815a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f76816b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b[] f76817c;

    static {
        b bVar = new b("Full", 0);
        f76815a = bVar;
        b bVar2 = new b("Lite", 1);
        f76816b = bVar2;
        b[] bVarArr = {bVar, bVar2};
        f76817c = bVarArr;
        EnumEntriesKt.a(bVarArr);
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f76817c.clone();
    }
}
