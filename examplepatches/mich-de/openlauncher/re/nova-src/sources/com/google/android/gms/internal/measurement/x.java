package com.google.android.gms.internal.measurement;

import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class x {

    /* renamed from: b, reason: collision with root package name */
    public static final t f33204b = new t(0);

    /* renamed from: c, reason: collision with root package name */
    public static final x f33205c;

    /* renamed from: a, reason: collision with root package name */
    public final w f33206a;

    static {
        List list = Collections.EMPTY_LIST;
        f33205c = new x(new w());
    }

    public x(w wVar) {
        this.f33206a = wVar;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof x) && ((x) obj).f33206a.equals(this.f33206a);
    }

    public final int hashCode() {
        return ~this.f33206a.hashCode();
    }

    public final String toString() {
        return this.f33206a.toString();
    }
}
