package cy;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final i f48489a;

    /* renamed from: b, reason: collision with root package name */
    public static final i f48490b;

    /* renamed from: c, reason: collision with root package name */
    public static final i f48491c;

    /* renamed from: d, reason: collision with root package name */
    public static final i f48492d;

    /* renamed from: e, reason: collision with root package name */
    public static final i f48493e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i[] f48494f;

    static {
        i iVar = new i("ACTIVE", 0);
        f48489a = iVar;
        i iVar2 = new i("ACTIVE_UNTIL_EXPIRY", 1);
        f48490b = iVar2;
        i iVar3 = new i("PENDING", 2);
        f48491c = iVar3;
        i iVar4 = new i("ON_HOLD", 3);
        i iVar5 = new i("EXPIRED", 4);
        f48492d = iVar5;
        i iVar6 = new i("UNKNOWN", 5);
        f48493e = iVar6;
        i[] iVarArr = {iVar, iVar2, iVar3, iVar4, iVar5, iVar6};
        f48494f = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f48494f.clone();
    }
}
