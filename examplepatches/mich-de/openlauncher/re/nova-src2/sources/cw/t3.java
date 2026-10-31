package cw;

import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public final class t3 {

    @NotNull
    public static final s3 Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f48309a;

    /* renamed from: b, reason: collision with root package name */
    public static final t3 f48310b;

    /* renamed from: c, reason: collision with root package name */
    public static final t3 f48311c;

    /* renamed from: d, reason: collision with root package name */
    public static final t3 f48312d;

    /* renamed from: e, reason: collision with root package name */
    public static final t3 f48313e;

    /* renamed from: f, reason: collision with root package name */
    public static final t3 f48314f;

    /* renamed from: g, reason: collision with root package name */
    public static final t3 f48315g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ t3[] f48316h;

    static {
        t3 t3Var = new t3("Name", 0);
        f48310b = t3Var;
        t3 t3Var2 = new t3("Email", 1);
        f48311c = t3Var2;
        t3 t3Var3 = new t3("Phone", 2);
        f48312d = t3Var3;
        t3 t3Var4 = new t3("BillingAddress", 3);
        f48313e = t3Var4;
        t3 t3Var5 = new t3("BillingAddressWithoutCountry", 4);
        t3 t3Var6 = new t3("SepaMandate", 5);
        f48314f = t3Var6;
        t3 t3Var7 = new t3("Unknown", 6);
        f48315g = t3Var7;
        t3[] t3VarArr = {t3Var, t3Var2, t3Var3, t3Var4, t3Var5, t3Var6, t3Var7};
        f48316h = t3VarArr;
        EnumEntriesKt.a(t3VarArr);
        Companion = new s3();
        f48309a = LazyKt.b(LazyThreadSafetyMode.f71680b, new r3(0));
    }

    public static t3 valueOf(String str) {
        return (t3) Enum.valueOf(t3.class, str);
    }

    public static t3[] values() {
        return (t3[]) f48316h.clone();
    }
}
