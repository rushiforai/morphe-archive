package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import xk.r2;
import xk.v0;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class lu {

    /* renamed from: b, reason: collision with root package name */
    public static final b.i8 f6951b;

    /* renamed from: c, reason: collision with root package name */
    public static final lu f6952c;

    /* renamed from: d, reason: collision with root package name */
    public static final lu f6953d;

    /* renamed from: e, reason: collision with root package name */
    public static final lu f6954e;

    /* renamed from: f, reason: collision with root package name */
    public static final lu f6955f;

    /* renamed from: g, reason: collision with root package name */
    public static final lu f6956g;

    /* renamed from: h, reason: collision with root package name */
    public static final lu f6957h;

    /* renamed from: i, reason: collision with root package name */
    public static final lu f6958i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ lu[] f6959j;

    /* renamed from: a, reason: collision with root package name */
    public final r2 f6960a;

    static {
        r2 r2VarT = v0.t(10, 9);
        Intrinsics.f(r2VarT, "of(...)");
        lu luVar = new lu("TOP_LEFT", 0, r2VarT);
        f6952c = luVar;
        r2 r2VarT2 = v0.t(10, 14);
        Intrinsics.f(r2VarT2, "of(...)");
        lu luVar2 = new lu("TOP_CENTER", 1, r2VarT2);
        f6953d = luVar2;
        r2 r2VarT3 = v0.t(10, 11);
        Intrinsics.f(r2VarT3, "of(...)");
        lu luVar3 = new lu("TOP_RIGHT", 2, r2VarT3);
        f6954e = luVar3;
        r2 r2VarS = v0.s(13);
        Intrinsics.f(r2VarS, "of(...)");
        lu luVar4 = new lu("CENTER", 3, r2VarS);
        f6955f = luVar4;
        r2 r2VarT4 = v0.t(12, 9);
        Intrinsics.f(r2VarT4, "of(...)");
        lu luVar5 = new lu("BOTTOM_LEFT", 4, r2VarT4);
        f6956g = luVar5;
        r2 r2VarT5 = v0.t(12, 14);
        Intrinsics.f(r2VarT5, "of(...)");
        lu luVar6 = new lu("BOTTOM_CENTER", 5, r2VarT5);
        f6957h = luVar6;
        r2 r2VarT6 = v0.t(12, 11);
        Intrinsics.f(r2VarT6, "of(...)");
        lu luVar7 = new lu("BOTTOM_RIGHT", 6, r2VarT6);
        f6958i = luVar7;
        lu[] luVarArr = {luVar, luVar2, luVar3, luVar4, luVar5, luVar6, luVar7};
        f6959j = luVarArr;
        EnumEntriesKt.a(luVarArr);
        f6951b = new b.i8(6);
    }

    public lu(String str, int i5, r2 r2Var) {
        this.f6960a = r2Var;
    }

    public static lu[] values() {
        return (lu[]) f6959j.clone();
    }
}
