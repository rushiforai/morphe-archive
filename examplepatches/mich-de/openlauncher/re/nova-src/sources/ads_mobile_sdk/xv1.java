package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class xv1 {

    /* renamed from: b, reason: collision with root package name */
    public static final xv1 f11858b;

    /* renamed from: c, reason: collision with root package name */
    public static final xv1 f11859c;

    /* renamed from: d, reason: collision with root package name */
    public static final xv1 f11860d;

    /* renamed from: e, reason: collision with root package name */
    public static final xv1 f11861e;

    /* renamed from: f, reason: collision with root package name */
    public static final xv1 f11862f;

    /* renamed from: g, reason: collision with root package name */
    public static final xv1 f11863g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ xv1[] f11864h;

    /* renamed from: a, reason: collision with root package name */
    public final int f11865a;

    static {
        xv1 xv1Var = new xv1("SCROLL_VIEW_TYPE_NONE", 0, 0);
        f11858b = xv1Var;
        xv1 xv1Var2 = new xv1("SCROLL_VIEW_TYPE_SCROLL_VIEW", 1, 1);
        f11859c = xv1Var2;
        xv1 xv1Var3 = new xv1("SCROLL_VIEW_TYPE_ABS_LIST_VIEW", 2, 2);
        f11860d = xv1Var3;
        xv1 xv1Var4 = new xv1("SCROLL_VIEW_TYPE_HORIZONTAL_SCROLL_VIEW", 3, 3);
        f11861e = xv1Var4;
        xv1 xv1Var5 = new xv1("SCROLL_VIEW_TYPE_SCROLLING_VIEW", 4, 4);
        f11862f = xv1Var5;
        xv1 xv1Var6 = new xv1("SCROLL_VIEW_TYPE_BY_KEYWORD", 5, 5);
        f11863g = xv1Var6;
        xv1[] xv1VarArr = {xv1Var, xv1Var2, xv1Var3, xv1Var4, xv1Var5, xv1Var6};
        f11864h = xv1VarArr;
        EnumEntriesKt.a(xv1VarArr);
    }

    public xv1(String str, int i5, int i11) {
        this.f11865a = i11;
    }

    public static xv1[] values() {
        return (xv1[]) f11864h.clone();
    }
}
