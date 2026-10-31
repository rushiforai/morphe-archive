package ads_mobile_sdk;

import b.kc;
import java.util.LinkedHashMap;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class y1 {

    /* renamed from: b, reason: collision with root package name */
    public static final kc f11905b;

    /* renamed from: c, reason: collision with root package name */
    public static final LinkedHashMap f11906c;

    /* renamed from: d, reason: collision with root package name */
    public static final y1 f11907d;

    /* renamed from: e, reason: collision with root package name */
    public static final y1 f11908e;

    /* renamed from: f, reason: collision with root package name */
    public static final y1 f11909f;

    /* renamed from: g, reason: collision with root package name */
    public static final y1 f11910g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ y1[] f11911h;

    /* renamed from: a, reason: collision with root package name */
    public final int f11912a;

    static {
        y1 y1Var = new y1("FORMAT_DEFAULT", 0, 0);
        f11907d = y1Var;
        y1 y1Var2 = new y1("ON_AD_OPENED", 1, 1);
        f11908e = y1Var2;
        y1 y1Var3 = new y1("ON_AD_SHOW", 2, 2);
        f11909f = y1Var3;
        y1 y1Var4 = new y1("THIRD_PARTY_SDK_CALLBACK", 3, 3);
        f11910g = y1Var4;
        y1[] y1VarArr = {y1Var, y1Var2, y1Var3, y1Var4};
        f11911h = y1VarArr;
        EnumEntriesKt.a(y1VarArr);
        f11905b = new kc(0);
        y1[] y1VarArrValues = values();
        int iD0 = b70.k.d0(y1VarArrValues.length);
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        for (y1 y1Var5 : y1VarArrValues) {
            linkedHashMap.put(Integer.valueOf(y1Var5.f11912a), y1Var5);
        }
        f11906c = linkedHashMap;
    }

    public y1(String str, int i5, int i11) {
        this.f11912a = i11;
    }

    public static y1[] values() {
        return (y1[]) f11911h.clone();
    }
}
