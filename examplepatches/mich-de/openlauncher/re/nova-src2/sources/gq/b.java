package gq;

import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;

/* loaded from: classes4.dex */
public final class b implements e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57752a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f57753b;

    public b(Throwable th2, Float f11, int i5) {
        this.f57752a = i5;
        switch (i5) {
            case 1:
                this.f57753b = MapsKt.j0(new Pair("error_message", th2.getMessage()), new Pair("duration", f11));
                break;
            default:
                this.f57753b = MapsKt.j0(new Pair("error_message", th2.getMessage()), new Pair("duration", f11));
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map d() {
        return this.f57753b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [java.lang.Object, java.util.Map] */
    private final Map e() {
        return this.f57753b;
    }

    @Override // fr.a
    public final String c() {
        switch (this.f57752a) {
            case 0:
                return "elements.attestation.confirmation.prepare.failed";
            default:
                return "elements.attestation.confirmation.request_token.failed";
        }
    }

    @Override // gq.e
    public final Map getParams() {
        switch (this.f57752a) {
            case 0:
                return d();
            default:
                return e();
        }
    }
}
