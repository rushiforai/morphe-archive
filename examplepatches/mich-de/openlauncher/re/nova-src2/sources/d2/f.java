package d2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f f48871a;

    /* renamed from: b, reason: collision with root package name */
    public static final f f48872b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ f[] f48873c;

    static {
        f fVar = new f("VIEW_APPEAR", 0);
        f48871a = fVar;
        f fVar2 = new f("VIEW_DISAPPEAR", 1);
        f48872b = fVar2;
        f[] fVarArr = {fVar, fVar2};
        f48873c = fVarArr;
        EnumEntriesKt.a(fVarArr);
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f48873c.clone();
    }
}
