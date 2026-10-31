package as;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public static final v f15644a;

    /* renamed from: b, reason: collision with root package name */
    public static final v f15645b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ v[] f15646c;

    static {
        v vVar = new v("Min", 0);
        f15644a = vVar;
        v vVar2 = new v("Full", 1);
        f15645b = vVar2;
        v[] vVarArr = {vVar, vVar2};
        f15646c = vVarArr;
        EnumEntriesKt.a(vVarArr);
    }

    public static v valueOf(String str) {
        return (v) Enum.valueOf(v.class, str);
    }

    public static v[] values() {
        return (v[]) f15646c.clone();
    }
}
