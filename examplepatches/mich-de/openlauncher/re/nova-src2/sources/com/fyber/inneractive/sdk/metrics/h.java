package com.fyber.inneractive.sdk.metrics;

import java.util.UUID;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final String f28557a = UUID.randomUUID().toString();

    /* renamed from: b, reason: collision with root package name */
    public final String f28558b;

    public h(String str) {
        this.f28558b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || h.class != obj.getClass()) {
            return false;
        }
        return this.f28557a.equals(((h) obj).f28557a);
    }

    public final int hashCode() {
        return this.f28557a.hashCode();
    }
}
