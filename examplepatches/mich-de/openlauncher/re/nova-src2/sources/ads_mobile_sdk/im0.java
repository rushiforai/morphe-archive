package ads_mobile_sdk;

import io.sentry.hints.i;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class im0 {

    /* renamed from: b, reason: collision with root package name */
    public static final i f4865b;

    /* renamed from: c, reason: collision with root package name */
    public static final im0 f4866c;

    /* renamed from: d, reason: collision with root package name */
    public static final im0 f4867d;

    /* renamed from: e, reason: collision with root package name */
    public static final im0 f4868e;

    /* renamed from: f, reason: collision with root package name */
    public static final im0 f4869f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ im0[] f4870g;

    /* renamed from: a, reason: collision with root package name */
    public final int f4871a;

    static {
        im0 im0Var = new im0("INVALID", 0, 0);
        f4866c = im0Var;
        im0 im0Var2 = new im0("HAS_WATERFALL", 1, 1);
        f4867d = im0Var2;
        im0 im0Var3 = new im0("WATERFALL_FILL", 2, 2);
        f4868e = im0Var3;
        im0 im0Var4 = new im0("AD_SHOW", 3, 3);
        f4869f = im0Var4;
        im0[] im0VarArr = {im0Var, im0Var2, im0Var3, im0Var4};
        f4870g = im0VarArr;
        EnumEntriesKt.a(im0VarArr);
        f4865b = new i(26);
    }

    public im0(String str, int i5, int i11) {
        this.f4871a = i11;
    }

    public static im0[] values() {
        return (im0[]) f4870g.clone();
    }
}
