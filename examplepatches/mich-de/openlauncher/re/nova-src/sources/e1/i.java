package e1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final i f51308a;

    /* renamed from: b, reason: collision with root package name */
    public static final i f51309b;

    /* renamed from: c, reason: collision with root package name */
    public static final i f51310c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i[] f51311d;

    static {
        i iVar = new i("CROSSED", 0);
        f51308a = iVar;
        i iVar2 = new i("NOT_CROSSED", 1);
        f51309b = iVar2;
        i iVar3 = new i("COLLAPSED", 2);
        f51310c = iVar3;
        i[] iVarArr = {iVar, iVar2, iVar3};
        f51311d = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f51311d.clone();
    }
}
