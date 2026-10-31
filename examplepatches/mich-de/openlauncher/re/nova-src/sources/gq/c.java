package gq;

import b70.k;
import java.util.Map;
import kotlin.Pair;

/* loaded from: classes4.dex */
public final class c implements e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f57754a;

    /* renamed from: b, reason: collision with root package name */
    public final Map f57755b;

    public c(Float f11, int i5) {
        this.f57754a = i5;
        switch (i5) {
            case 1:
                this.f57755b = k.e0(new Pair("duration", f11));
                break;
            default:
                this.f57755b = k.e0(new Pair("duration", f11));
                break;
        }
    }

    @Override // fr.a
    public final String c() {
        switch (this.f57754a) {
            case 0:
                return "elements.attestation.confirmation.prepare.succeeded";
            default:
                return "elements.attestation.confirmation.request_token.succeeded";
        }
    }

    @Override // gq.e
    public final Map getParams() {
        switch (this.f57754a) {
        }
        return this.f57755b;
    }
}
