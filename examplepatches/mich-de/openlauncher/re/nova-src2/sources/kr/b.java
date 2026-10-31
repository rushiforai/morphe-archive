package kr;

import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b extends gs.g implements bw.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72129a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Object f72130b;

    public b(Throwable th2) {
        this.f72130b = MapsKt.j0(new Pair("implementation", "google_pay"), new Pair("error_message", th2 != null ? th2.getClass().getSimpleName() : null));
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map d() {
        return this.f72130b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map e() {
        return this.f72130b;
    }

    @Override // gs.g
    public final Map a() {
        switch (this.f72129a) {
            case 0:
                return d();
            default:
                return e();
        }
    }

    @Override // fr.a
    public final String c() {
        switch (this.f72129a) {
            case 0:
                return "cs_cbc_selected";
            default:
                return "cs_cardscan_api_check_failed";
        }
    }

    public b(a aVar, ft.b selectedBrand) {
        Intrinsics.g(selectedBrand, "selectedBrand");
        this.f72130b = MapsKt.j0(new Pair("cbc_event_source", aVar.f72128a), new Pair("selected_card_brand", selectedBrand.f55897a));
    }
}
