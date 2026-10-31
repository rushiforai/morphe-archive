package com.fyber.inneractive.sdk.player.exoplayer2.trackselection;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final int f30265a;

    /* renamed from: b, reason: collision with root package name */
    public final b[] f30266b;

    /* renamed from: c, reason: collision with root package name */
    public int f30267c;

    public h(b... bVarArr) {
        this.f30266b = bVarArr;
        this.f30265a = bVarArr.length;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || h.class != obj.getClass()) {
            return false;
        }
        return Arrays.equals(this.f30266b, ((h) obj).f30266b);
    }

    public final int hashCode() {
        if (this.f30267c == 0) {
            this.f30267c = Arrays.hashCode(this.f30266b) + 527;
        }
        return this.f30267c;
    }
}
