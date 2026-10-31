package qu;

import b70.k;
import gs.g;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a extends g {

    /* renamed from: a, reason: collision with root package name */
    public final String f84321a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f84322b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f84323c;

    public a(String country, boolean z11, Integer num) {
        Intrinsics.g(country, "country");
        this.f84321a = country;
        this.f84322b = z11;
        this.f84323c = num;
    }

    @Override // gs.g
    public final Map a() {
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("address_country_code", this.f84321a), new Pair("auto_complete_result_selected", Boolean.valueOf(this.f84322b)));
        linkedHashMapK0.put("edit_distance", Integer.valueOf(this.f84323c.intValue()));
        return k.e0(new Pair("address_data_blob", linkedHashMapK0));
    }

    @Override // fr.a
    public final String c() {
        return "mc_address_completed";
    }
}
