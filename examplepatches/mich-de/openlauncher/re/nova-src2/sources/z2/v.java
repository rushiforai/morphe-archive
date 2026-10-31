package z2;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public static final v f98157a;

    /* renamed from: b, reason: collision with root package name */
    public static final v f98158b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ v[] f98159c;

    static {
        v vVar = new v("Width", 0);
        f98157a = vVar;
        v vVar2 = new v("Height", 1);
        f98158b = vVar2;
        v[] vVarArr = {vVar, vVar2};
        f98159c = vVarArr;
        EnumEntriesKt.a(vVarArr);
    }

    public static v valueOf(String str) {
        return (v) Enum.valueOf(v.class, str);
    }

    public static v[] values() {
        return (v[]) f98159c.clone();
    }
}
