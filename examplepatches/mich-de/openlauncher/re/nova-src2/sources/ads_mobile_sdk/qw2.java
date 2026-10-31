package ads_mobile_sdk;

import b.hb;
import com.fyber.inneractive.sdk.external.NativeAdContent;
import java.util.LinkedHashMap;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class qw2 {

    /* renamed from: b, reason: collision with root package name */
    public static final hb f8857b;

    /* renamed from: c, reason: collision with root package name */
    public static final LinkedHashMap f8858c;

    /* renamed from: d, reason: collision with root package name */
    public static final qw2 f8859d;

    /* renamed from: e, reason: collision with root package name */
    public static final qw2 f8860e;

    /* renamed from: f, reason: collision with root package name */
    public static final qw2 f8861f;

    /* renamed from: g, reason: collision with root package name */
    public static final qw2 f8862g;

    /* renamed from: h, reason: collision with root package name */
    public static final qw2 f8863h;

    /* renamed from: i, reason: collision with root package name */
    public static final qw2 f8864i;

    /* renamed from: j, reason: collision with root package name */
    public static final qw2 f8865j;

    /* renamed from: k, reason: collision with root package name */
    public static final qw2 f8866k;

    /* renamed from: l, reason: collision with root package name */
    public static final qw2 f8867l;

    /* renamed from: m, reason: collision with root package name */
    public static final /* synthetic */ qw2[] f8868m;
    public static final /* synthetic */ i70.a n;

    /* renamed from: a, reason: collision with root package name */
    public final String f8869a;

    static {
        qw2 qw2Var = new qw2(0, "UNKNOWN", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        f8859d = qw2Var;
        qw2 qw2Var2 = new qw2(1, "APP_OPEN", "app_open_ad");
        f8860e = qw2Var2;
        qw2 qw2Var3 = new qw2(2, "BANNER", "banner");
        f8861f = qw2Var3;
        qw2 qw2Var4 = new qw2(3, NativeAdContent.ViewTag.AD_ICON, "icon");
        f8862g = qw2Var4;
        qw2 qw2Var5 = new qw2(4, "INTERSTITIAL", "interstitial");
        f8863h = qw2Var5;
        qw2 qw2Var6 = new qw2(5, "NATIVE", "native");
        f8864i = qw2Var6;
        qw2 qw2Var7 = new qw2(6, "REWARDED", "rewarded");
        f8865j = qw2Var7;
        qw2 qw2Var8 = new qw2(7, "REWARDED_INTERSTITIAL", "rewarded_interstitial");
        f8866k = qw2Var8;
        qw2 qw2Var9 = new qw2(8, "SWIPEABLE_INTERSTITIAL", "swipeable_interstitial");
        f8867l = qw2Var9;
        qw2[] qw2VarArr = {qw2Var, qw2Var2, qw2Var3, qw2Var4, qw2Var5, qw2Var6, qw2Var7, qw2Var8, qw2Var9};
        f8868m = qw2VarArr;
        i70.a aVarA = EnumEntriesKt.a(qw2VarArr);
        n = aVarA;
        f8857b = new hb(28);
        int iD0 = b70.k.d0(b70.c.u0(aVarA, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0 < 16 ? 16 : iD0);
        b70.a aVar = new b70.a(aVarA);
        while (aVar.hasNext()) {
            Object next = aVar.next();
            linkedHashMap.put(((qw2) next).f8869a, next);
        }
        f8858c = linkedHashMap;
    }

    public qw2(int i5, String str, String str2) {
        this.f8869a = str2;
    }

    public static qw2[] values() {
        return (qw2[]) f8868m.clone();
    }
}
