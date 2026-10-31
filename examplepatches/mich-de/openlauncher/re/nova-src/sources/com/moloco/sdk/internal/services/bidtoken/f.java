package com.moloco.sdk.internal.services.bidtoken;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37696b = 0;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f37697a;

    public f(boolean z11) {
        this.f37697a = z11;
    }

    public final boolean a() {
        return this.f37697a;
    }

    public final boolean b() {
        return this.f37697a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && this.f37697a == ((f) obj).f37697a;
    }

    public int hashCode() {
        return Boolean.hashCode(this.f37697a);
    }

    @NotNull
    public String toString() {
        return a2.c.p(new StringBuilder("BidTokenConfig(dbtEnabled="), this.f37697a, ')');
    }

    @NotNull
    public final f a(boolean z11) {
        return new f(z11);
    }

    public static /* synthetic */ f a(f fVar, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = fVar.f37697a;
        }
        return fVar.a(z11);
    }
}
