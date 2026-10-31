package pp;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final o7.a f82688a;

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f82689b;

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f82690c;

    /* renamed from: d, reason: collision with root package name */
    public static final b0 f82691d;

    /* renamed from: e, reason: collision with root package name */
    public static final b0 f82692e;

    /* renamed from: f, reason: collision with root package name */
    public static final b0 f82693f;

    /* renamed from: g, reason: collision with root package name */
    public static final b0 f82694g;

    /* renamed from: h, reason: collision with root package name */
    public static final b0 f82695h;

    /* renamed from: i, reason: collision with root package name */
    public static final b0 f82696i;

    /* renamed from: j, reason: collision with root package name */
    public static final b0 f82697j;

    /* renamed from: k, reason: collision with root package name */
    public static final b0 f82698k;

    /* renamed from: l, reason: collision with root package name */
    public static final b0 f82699l;

    /* renamed from: m, reason: collision with root package name */
    public static final b0 f82700m;
    public static final /* synthetic */ b0[] n;

    static {
        b0 b0Var = new b0("APP", 0);
        f82689b = b0Var;
        b0 b0Var2 = new b0("LINK_SHORTCUT_INFO", 1);
        f82690c = b0Var2;
        b0 b0Var3 = new b0("LINK", 2);
        f82691d = b0Var3;
        b0 b0Var4 = new b0("CONTACT", 3);
        f82692e = b0Var4;
        b0 b0Var5 = new b0("CONTACT_ACTION_DIAL", 4);
        b0 b0Var6 = new b0("CONTACT_ACTION_SMS", 5);
        b0 b0Var7 = new b0("CONTACT_ACTION_EMAIL", 6);
        b0 b0Var8 = new b0("CONTACT_ACTION_WHATSAPP", 7);
        b0 b0Var9 = new b0("MICRO_UNIT_CONVERSION", 8);
        f82693f = b0Var9;
        b0 b0Var10 = new b0("MICRO_CALCULATOR", 9);
        f82694g = b0Var10;
        b0 b0Var11 = new b0("MICRO_LINK", 10);
        f82695h = b0Var11;
        b0 b0Var12 = new b0("MICRO_OTHER", 11);
        f82696i = b0Var12;
        b0 b0Var13 = new b0("SEARCH_MORE", 12);
        f82697j = b0Var13;
        b0 b0Var14 = new b0("SEARCH_MORE_AUTOCOMPLETE", 13);
        f82698k = b0Var14;
        b0 b0Var15 = new b0("CARD", 14);
        f82699l = b0Var15;
        b0 b0Var16 = new b0(NativeAdContent.ViewTag.OTHER, 15);
        f82700m = b0Var16;
        b0[] b0VarArr = {b0Var, b0Var2, b0Var3, b0Var4, b0Var5, b0Var6, b0Var7, b0Var8, b0Var9, b0Var10, b0Var11, b0Var12, b0Var13, b0Var14, b0Var15, b0Var16};
        n = b0VarArr;
        EnumEntriesKt.a(b0VarArr);
        f82688a = new o7.a(1);
    }

    public static final EnumMap a(String value) {
        f82688a.getClass();
        Intrinsics.g(value, "value");
        EnumMap enumMap = new EnumMap(b0.class);
        if (value.length() > 0) {
            Iterator it = r70.k.h1(value, new char[]{' '}, 6).iterator();
            while (it.hasNext()) {
                try {
                    List listH1 = r70.k.h1((String) it.next(), new char[]{'='}, 6);
                    enumMap.put((EnumMap) valueOf((String) listH1.get(0)), (b0) Integer.valueOf(Integer.parseInt((String) listH1.get(1))));
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
            }
        }
        return enumMap;
    }

    public static final String b(Map map) {
        f82688a.getClass();
        Intrinsics.g(map, "map");
        return b70.g.f1(map.entrySet(), " ", null, null, 0, new nq.a(22), 30);
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) n.clone();
    }
}
