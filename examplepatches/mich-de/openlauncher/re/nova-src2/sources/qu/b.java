package qu;

import a80.m;
import com.google.android.gms.internal.measurement.k2;
import gs.g;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b extends g {

    /* renamed from: a, reason: collision with root package name */
    public final String f84324a;

    public b(String country) {
        Intrinsics.g(country, "country");
        this.f84324a = country;
    }

    @Override // gs.g
    public final Map a() {
        return k2.o("address_data_blob", m.n("address_country_code", this.f84324a));
    }

    @Override // fr.a
    public final String c() {
        return "mc_address_show";
    }
}
