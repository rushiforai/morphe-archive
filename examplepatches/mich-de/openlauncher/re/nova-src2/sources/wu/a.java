package wu;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f94678a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f94679b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f94680c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f94681d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f94682e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f94683f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f94684g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f94685h;

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ a[] f94686i;

    static {
        a aVar = new a("Buy", 0);
        f94678a = aVar;
        a aVar2 = new a("Book", 1);
        f94679b = aVar2;
        a aVar3 = new a(TTContentsEventConstants.ContentsEventName.EVENT_NAME_CHECK_OUT, 2);
        f94680c = aVar3;
        a aVar4 = new a("Donate", 3);
        f94681d = aVar4;
        a aVar5 = new a("Order", 4);
        f94682e = aVar5;
        a aVar6 = new a("Pay", 5);
        f94683f = aVar6;
        a aVar7 = new a("Subscribe", 6);
        f94684g = aVar7;
        a aVar8 = new a("Plain", 7);
        f94685h = aVar8;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8};
        f94686i = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f94686i.clone();
    }
}
