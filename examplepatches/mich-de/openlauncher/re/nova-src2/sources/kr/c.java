package kr;

import a80.m;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends gs.g implements bw.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72131a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f72132b;

    public c(int i5) {
        this.f72131a = i5;
        switch (i5) {
            case 2:
                this.f72132b = m.n("implementation", "google_pay");
                break;
            default:
                this.f72132b = m.n("implementation", "google_pay");
                break;
        }
    }

    @Override // gs.g
    public final Map a() {
        switch (this.f72131a) {
        }
        return this.f72132b;
    }

    @Override // fr.a
    public final String c() {
        switch (this.f72131a) {
            case 0:
                return "cs_disallowed_card_brand";
            case 1:
                return "cs_cardscan_api_check_succeeded";
            case 2:
                return "cs_cardscan_scan_started";
            default:
                return "cs_load_failed";
        }
    }

    public c(ft.b cardBrand) {
        this.f72131a = 0;
        Intrinsics.g(cardBrand, "cardBrand");
        this.f72132b = m.n("brand", cardBrand.f55897a);
    }

    public c(Throwable th2) {
        this.f72131a = 3;
        this.f72132b = m.n("error_message", th2.getMessage());
    }
}
