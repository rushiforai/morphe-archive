package ft;

import java.util.Set;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class u0 {

    /* renamed from: b, reason: collision with root package name */
    public static final br.c f56048b;

    /* renamed from: c, reason: collision with root package name */
    public static final u0 f56049c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ u0[] f56050d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i70.a f56051e;

    /* renamed from: a, reason: collision with root package name */
    public final Set f56052a;

    static {
        u0 u0Var = new u0("ApplePay", 0, ab.e0.U("apple_pay"));
        f56049c = u0Var;
        u0[] u0VarArr = {u0Var, new u0("GooglePay", 1, kotlin.collections.c.f1(new String[]{"android_pay", "google"})), new u0("Masterpass", 2, ab.e0.U("masterpass")), new u0("VisaCheckout", 3, ab.e0.U("visa_checkout"))};
        f56050d = u0VarArr;
        f56051e = EnumEntriesKt.a(u0VarArr);
        f56048b = new br.c();
    }

    public u0(String str, int i5, Set set) {
        this.f56052a = set;
    }

    public static u0 valueOf(String str) {
        return (u0) Enum.valueOf(u0.class, str);
    }

    public static u0[] values() {
        return (u0[]) f56050d.clone();
    }
}
