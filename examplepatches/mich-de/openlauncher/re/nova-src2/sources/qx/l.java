package qx;

import java.util.Locale;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class l {

    /* renamed from: e, reason: collision with root package name */
    public static final o2.f f84543e;

    /* renamed from: f, reason: collision with root package name */
    public static final l f84544f;

    /* renamed from: g, reason: collision with root package name */
    public static final l f84545g;

    /* renamed from: h, reason: collision with root package name */
    public static final l f84546h;

    /* renamed from: i, reason: collision with root package name */
    public static final l f84547i;

    /* renamed from: j, reason: collision with root package name */
    public static final l f84548j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ l[] f84549k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ i70.a f84550l;

    /* renamed from: a, reason: collision with root package name */
    public final String f84551a;

    /* renamed from: b, reason: collision with root package name */
    public final String f84552b;

    /* renamed from: c, reason: collision with root package name */
    public final String f84553c;

    /* renamed from: d, reason: collision with root package name */
    public final String f84554d;

    static {
        l lVar = new l(0, "LEFT_SWIPE_CARD", "left_swipe_ad_size", "admob_left_swipe_ad_unit_id", "admob_left_swipe_banner_ad_unit_id", "left_swipe_ad_format");
        f84544f = lVar;
        l lVar2 = new l(1, "APP_DRAWER", "app_drawer_ad_size", "admob_drawer_ad_unit_id", "admob_drawer_banner_ad_unit_id", "app_drawer_inline_ad_format");
        f84545g = lVar2;
        l lVar3 = new l(2, "SETTINGS", "settings_ad_size", "admob_settings_ad_unit_id", "admob_settings_banner_ad_unit_id", "settings_ad_format");
        f84546h = lVar3;
        l lVar4 = new l(3, "DRAWER_SEARCH", "drawer_search_ad_size", "admob_drawer_ad_unit_id", "admob_drawer_banner_ad_unit_id", "drawer_search_ad_format");
        f84547i = lVar4;
        l lVar5 = new l(4, "APP_DRAWER_INLINE", "app_drawer_ad_size", "admob_drawer_ad_unit_id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f84548j = lVar5;
        l[] lVarArr = {lVar, lVar2, lVar3, lVar4, lVar5};
        f84549k = lVarArr;
        f84550l = EnumEntriesKt.a(lVarArr);
        f84543e = new o2.f(5);
    }

    public l(int i5, String str, String str2, String str3, String str4, String str5) {
        this.f84551a = str2;
        this.f84552b = str3;
        this.f84553c = str4;
        this.f84554d = str5;
    }

    public static String g() {
        zy.c cVar = zy.c.f98823a;
        return zy.c.h("admob_icon_ad_unit_id");
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f84549k.clone();
    }

    public final i a() {
        if (this == f84548j) {
            return h.b() == 3 ? i.f84512d : i.f84511c;
        }
        String str = this.f84554d;
        if (str.length() > 0) {
            zy.c cVar = zy.c.f98823a;
            String strH = zy.c.h(str);
            if (!r70.k.U0(strH)) {
                i.f84509a.getClass();
                String lowerCase = strH.toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                int iHashCode = lowerCase.hashCode();
                if (iHashCode != -1052618729) {
                    if (iHashCode != -737591020) {
                        if (iHashCode == 3226745 && lowerCase.equals("icon")) {
                            return i.f84512d;
                        }
                    } else if (lowerCase.equals("icon_row")) {
                        return i.f84513e;
                    }
                } else if (lowerCase.equals("native")) {
                    return i.f84511c;
                }
                return i.f84510b;
            }
        }
        return i.f84511c;
    }

    public final o b() {
        if (h.b() >= 1 && h.f84501a.contains(this)) {
            return o.f84565e;
        }
        o7.a aVar = o.f84562b;
        zy.c cVar = zy.c.f98823a;
        String strH = zy.c.h(this.f84551a);
        aVar.getClass();
        String lowerCase = strH.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase.equals("small") ? o.f84564d : lowerCase.equals("medium") ? o.f84565e : o.f84563c;
    }

    public final String c() {
        zy.c cVar = zy.c.f98823a;
        return zy.c.h(this.f84552b);
    }

    public final String d() {
        String str = this.f84553c;
        if (str.length() <= 0) {
            str = null;
        }
        if (str == null) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        zy.c cVar = zy.c.f98823a;
        return zy.c.h(str);
    }

    public final boolean h() {
        int i5;
        if (this != f84548j) {
            o oVarB = b();
            boolean zB = mx.h1.b();
            boolean zD = fy.a.d();
            if (oVarB != o.f84563c && !zB && !zD) {
                return true;
            }
        } else if (f84545g.h()) {
            if (h.b() < 2) {
                i5 = 0;
            } else {
                i5 = 5;
                int iG = zy.c.g("app_drawer_inline_ad_interval", 5);
                if (iG > 0) {
                    i5 = iG;
                }
            }
            if (i5 > 0) {
                return true;
            }
        }
        return false;
    }
}
