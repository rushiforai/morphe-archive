package bt;

import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import java.util.LinkedHashMap;
import kotlin.enums.EnumEntriesKt;
import kw.i2;
import ou.n0;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final b f18444a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f18445b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f18446c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ d[] f18447d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i70.a f18448e;

    static {
        b bVar = new b();
        f18444a = bVar;
        c cVar = new c();
        f18445b = cVar;
        a aVar = new a();
        f18446c = aVar;
        d[] dVarArr = {bVar, cVar, aVar};
        f18447d = dVarArr;
        f18448e = EnumEntriesKt.a(dVarArr);
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f18447d.clone();
    }

    public abstract n0 a(PaymentSheet$BillingDetailsCollectionConfiguration paymentSheet$BillingDetailsCollectionConfiguration);

    public abstract i2 b(LinkedHashMap linkedHashMap);
}
