package ads_mobile_sdk;

import b.hb;
import java.util.LinkedHashMap;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class v1 {

    /* renamed from: b, reason: collision with root package name */
    public static final hb f10541b;

    /* renamed from: c, reason: collision with root package name */
    public static final LinkedHashMap f10542c;

    /* renamed from: d, reason: collision with root package name */
    public static final v1 f10543d;

    /* renamed from: e, reason: collision with root package name */
    public static final v1 f10544e;

    /* renamed from: f, reason: collision with root package name */
    public static final v1 f10545f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ v1[] f10546g;

    /* renamed from: a, reason: collision with root package name */
    public final int f10547a;

    static {
        v1 v1Var = new v1("FORMAT_DEFAULT", 0, 0);
        f10543d = v1Var;
        v1 v1Var2 = new v1("ONE_PIXEL", 1, 1);
        f10544e = v1Var2;
        v1 v1Var3 = new v1("AD_LOAD", 2, 2);
        v1 v1Var4 = new v1("NO_IMPRESSION", 3, 3);
        v1 v1Var5 = new v1("THIRD_PARTY_SDK_CALLBACK", 4, 4);
        f10545f = v1Var5;
        v1[] v1VarArr = {v1Var, v1Var2, v1Var3, v1Var4, v1Var5};
        f10546g = v1VarArr;
        EnumEntriesKt.a(v1VarArr);
        f10541b = new hb(0);
        v1[] v1VarArrValues = values();
        int iD0 = b70.k.d0(v1VarArrValues.length);
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        for (v1 v1Var6 : v1VarArrValues) {
            linkedHashMap.put(Integer.valueOf(v1Var6.f10547a), v1Var6);
        }
        f10542c = linkedHashMap;
    }

    public v1(String str, int i5, int i11) {
        this.f10547a = i11;
    }

    public static v1[] values() {
        return (v1[]) f10546g.clone();
    }
}
