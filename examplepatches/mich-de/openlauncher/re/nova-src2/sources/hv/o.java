package hv;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static final o f60438b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f60439c;

    /* renamed from: d, reason: collision with root package name */
    public static final o f60440d;

    /* renamed from: e, reason: collision with root package name */
    public static final o f60441e;

    /* renamed from: f, reason: collision with root package name */
    public static final o f60442f;

    /* renamed from: g, reason: collision with root package name */
    public static final o f60443g;

    /* renamed from: h, reason: collision with root package name */
    public static final o f60444h;

    /* renamed from: i, reason: collision with root package name */
    public static final o f60445i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ o[] f60446j;

    /* renamed from: a, reason: collision with root package name */
    public final int f60447a;

    static {
        o oVar = new o("Book", 0, 2);
        f60438b = oVar;
        o oVar2 = new o("Buy", 1, 1);
        f60439c = oVar2;
        o oVar3 = new o(TTContentsEventConstants.ContentsEventName.EVENT_NAME_CHECK_OUT, 2, 3);
        f60440d = oVar3;
        o oVar4 = new o("Donate", 3, 4);
        f60441e = oVar4;
        o oVar5 = new o("Order", 4, 5);
        f60442f = oVar5;
        o oVar6 = new o("Pay", 5, 6);
        f60443g = oVar6;
        o oVar7 = new o("Plain", 6, 8);
        f60444h = oVar7;
        o oVar8 = new o("Subscribe", 7, 7);
        f60445i = oVar8;
        o[] oVarArr = {oVar, oVar2, oVar3, oVar4, oVar5, oVar6, oVar7, oVar8};
        f60446j = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public o(String str, int i5, int i11) {
        this.f60447a = i11;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f60446j.clone();
    }
}
