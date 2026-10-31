package bg;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public static final d f17880a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ d[] f17881b;

    static {
        d dVar = new d("UNSPECIFIED", 0);
        d dVar2 = new d("CHILD", 1);
        f17880a = dVar2;
        d[] dVarArr = {dVar, dVar2, new d("TEEN", 2)};
        f17881b = dVarArr;
        EnumEntriesKt.a(dVarArr);
    }

    public static d[] values() {
        return (d[]) f17881b.clone();
    }
}
