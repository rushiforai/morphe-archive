package m3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public static final i f75902a;

    /* renamed from: b, reason: collision with root package name */
    public static final i f75903b;

    /* renamed from: c, reason: collision with root package name */
    public static final i f75904c;

    /* renamed from: d, reason: collision with root package name */
    public static final i f75905d;

    /* renamed from: e, reason: collision with root package name */
    public static final i f75906e;

    /* renamed from: f, reason: collision with root package name */
    public static final i f75907f;

    /* renamed from: g, reason: collision with root package name */
    public static final i f75908g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ i[] f75909h;

    static {
        i iVar = new i("Paragraph", 0);
        f75902a = iVar;
        i iVar2 = new i("Span", 1);
        f75903b = iVar2;
        i iVar3 = new i("VerbatimTts", 2);
        f75904c = iVar3;
        i iVar4 = new i("Url", 3);
        f75905d = iVar4;
        i iVar5 = new i("Link", 4);
        f75906e = iVar5;
        i iVar6 = new i("Clickable", 5);
        f75907f = iVar6;
        i iVar7 = new i("String", 6);
        f75908g = iVar7;
        i[] iVarArr = {iVar, iVar2, iVar3, iVar4, iVar5, iVar6, iVar7};
        f75909h = iVarArr;
        EnumEntriesKt.a(iVarArr);
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f75909h.clone();
    }
}
