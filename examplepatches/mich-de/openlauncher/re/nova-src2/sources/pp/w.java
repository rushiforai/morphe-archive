package pp;

import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes.dex */
public final class w {

    @NotNull
    public static final v Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f82777a;

    /* renamed from: b, reason: collision with root package name */
    public static final w f82778b;

    /* renamed from: c, reason: collision with root package name */
    public static final w f82779c;

    /* renamed from: d, reason: collision with root package name */
    public static final w f82780d;

    /* renamed from: e, reason: collision with root package name */
    public static final w f82781e;

    /* renamed from: f, reason: collision with root package name */
    public static final w f82782f;

    /* renamed from: g, reason: collision with root package name */
    public static final w f82783g;

    /* renamed from: h, reason: collision with root package name */
    public static final w f82784h;

    /* renamed from: i, reason: collision with root package name */
    public static final w f82785i;

    /* renamed from: j, reason: collision with root package name */
    public static final w f82786j;

    /* renamed from: k, reason: collision with root package name */
    public static final w f82787k;

    /* renamed from: l, reason: collision with root package name */
    public static final w f82788l;

    /* renamed from: m, reason: collision with root package name */
    public static final w f82789m;
    public static final /* synthetic */ w[] n;

    static {
        w wVar = new w("SEARCH", 0);
        f82778b = wVar;
        w wVar2 = new w("ZERO_STATE", 1);
        f82779c = wVar2;
        w wVar3 = new w("ALL_APPS_CONTAINER", 2);
        f82780d = wVar3;
        w wVar4 = new w("WORKSPACE", 3);
        f82781e = wVar4;
        w wVar5 = new w("APP_CARD_SEARCH", 4);
        f82782f = wVar5;
        w wVar6 = new w("APP_CARD_ZERO_STATE", 5);
        f82783g = wVar6;
        w wVar7 = new w("COMPOSITE_CARD_SEARCH", 6);
        f82784h = wVar7;
        w wVar8 = new w("COMPOSITE_CARD_ZERO_STATE", 7);
        f82785i = wVar8;
        w wVar9 = new w("FEED", 8);
        f82786j = wVar9;
        w wVar10 = new w("FEED_SEARCH", 9);
        f82787k = wVar10;
        w wVar11 = new w("SMART_FOLDER", 10);
        f82788l = wVar11;
        w wVar12 = new w("UNKNOWN", 11);
        f82789m = wVar12;
        w[] wVarArr = {wVar, wVar2, wVar3, wVar4, wVar5, wVar6, wVar7, wVar8, wVar9, wVar10, wVar11, wVar12};
        n = wVarArr;
        EnumEntriesKt.a(wVarArr);
        Companion = new v();
        f82777a = LazyKt.b(LazyThreadSafetyMode.f71680b, new h50.q(23));
    }

    public static w valueOf(String str) {
        return (w) Enum.valueOf(w.class, str);
    }

    public static w[] values() {
        return (w[]) n.clone();
    }
}
