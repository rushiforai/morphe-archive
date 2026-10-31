package gq;

import b70.h;
import java.util.Map;

/* loaded from: classes4.dex */
public final class d implements e {

    /* renamed from: a, reason: collision with root package name */
    public static final d f57756a = new d();

    @Override // fr.a
    public final String c() {
        return "elements.attestation.confirmation.request_token";
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof d);
    }

    @Override // gq.e
    public final Map getParams() {
        return h.f17594a;
    }

    public final int hashCode() {
        return -1668146451;
    }

    public final String toString() {
        return "RequestToken";
    }
}
