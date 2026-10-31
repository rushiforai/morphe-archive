package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k0 {

    /* renamed from: b, reason: collision with root package name */
    public static final br.c f55955b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ k0[] f55956c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55957d;

    /* renamed from: a, reason: collision with root package name */
    public final String f55958a;

    static {
        k0[] k0VarArr = {new k0("Duplicate", 0, "duplicate"), new k0("Fraudulent", 1, "fraudulent"), new k0("RequestedByCustomer", 2, "requested_by_customer"), new k0("Abandoned", 3, "abandoned"), new k0("FailedInvoice", 4, "failed_invoice"), new k0("VoidInvoice", 5, "void_invoice"), new k0("Automatic", 6, "automatic")};
        f55956c = k0VarArr;
        f55957d = EnumEntriesKt.a(k0VarArr);
        f55955b = new br.c();
    }

    public k0(String str, int i5, String str2) {
        this.f55958a = str2;
    }

    public static k0 valueOf(String str) {
        return (k0) Enum.valueOf(k0.class, str);
    }

    public static k0[] values() {
        return (k0[]) f55956c.clone();
    }
}
