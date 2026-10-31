package sx;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static final br.a f87811b;

    /* renamed from: c, reason: collision with root package name */
    public static final o f87812c;

    /* renamed from: d, reason: collision with root package name */
    public static final o f87813d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ o[] f87814e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i70.a f87815f;

    /* renamed from: a, reason: collision with root package name */
    public final String f87816a;

    static {
        o oVar = new o("ADMOB", 0, InneractiveMediationNameConsts.ADMOB);
        f87812c = oVar;
        o oVar2 = new o("GAM", 1, "gam");
        f87813d = oVar2;
        o[] oVarArr = {oVar, oVar2};
        f87814e = oVarArr;
        f87815f = EnumEntriesKt.a(oVarArr);
        f87811b = new br.a(26);
    }

    public o(String str, int i5, String str2) {
        this.f87816a = str2;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f87814e.clone();
    }

    public final String a() {
        return this.f87816a;
    }
}
