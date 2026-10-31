package pp;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final e f82704a;

    /* renamed from: b, reason: collision with root package name */
    public static final e f82705b;

    /* renamed from: c, reason: collision with root package name */
    public static final e f82706c;

    /* renamed from: d, reason: collision with root package name */
    public static final e f82707d;

    /* renamed from: e, reason: collision with root package name */
    public static final e f82708e;

    /* renamed from: f, reason: collision with root package name */
    public static final e f82709f;

    /* renamed from: g, reason: collision with root package name */
    public static final e f82710g;

    /* renamed from: h, reason: collision with root package name */
    public static final e f82711h;

    /* renamed from: i, reason: collision with root package name */
    public static final e f82712i;

    /* renamed from: j, reason: collision with root package name */
    public static final e f82713j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ e[] f82714k;

    static {
        e eVar = new e("COMPOSITE", 0);
        f82704a = eVar;
        e eVar2 = new e("APP_CARD", 1);
        f82705b = eVar2;
        e eVar3 = new e("CONTACT", 2);
        f82706c = eVar3;
        e eVar4 = new e("MAP", 3);
        f82707d = eVar4;
        e eVar5 = new e("REMINDER", 4);
        f82708e = eVar5;
        e eVar6 = new e("WEATHER", 5);
        f82709f = eVar6;
        e eVar7 = new e("IMAGE_LIBRARY", 6);
        f82710g = eVar7;
        e eVar8 = new e("GAMES", 7);
        f82711h = eVar8;
        e eVar9 = new e("APPSTORE", 8);
        f82712i = eVar9;
        e eVar10 = new e("SEARCH_MORE", 9);
        f82713j = eVar10;
        e[] eVarArr = {eVar, eVar2, eVar3, eVar4, eVar5, eVar6, eVar7, eVar8, eVar9, eVar10};
        f82714k = eVarArr;
        EnumEntriesKt.a(eVarArr);
    }

    public static e valueOf(String str) {
        return (e) Enum.valueOf(e.class, str);
    }

    public static e[] values() {
        return (e[]) f82714k.clone();
    }
}
