package j10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final i f68617a;

    /* renamed from: b, reason: collision with root package name */
    public static final i f68618b;

    /* renamed from: c, reason: collision with root package name */
    public static final i f68619c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i[] f68620d;

    static {
        i iVar = new i("UNKNOWN", 0);
        f68617a = iVar;
        i iVar2 = new i("KOREA", 1);
        f68618b = iVar2;
        i iVar3 = new i("NOT_KOREA", 2);
        f68619c = iVar3;
        i[] iVarArr = {iVar, iVar2, iVar3};
        f68620d = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f68620d.clone();
    }
}
