package com.amplitude;

import android.graphics.Picture;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class E1 {

    /* renamed from: a, reason: collision with root package name */
    public final Picture f20221a;

    /* renamed from: b, reason: collision with root package name */
    public final long f20222b;

    public E1(Picture picture, long j11) {
        Intrinsics.g(picture, "picture");
        this.f20221a = picture;
        this.f20222b = j11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof E1)) {
            return false;
        }
        E1 e12 = (E1) obj;
        return Intrinsics.b(this.f20221a, e12.f20221a) && h2.b.b(this.f20222b, e12.f20222b);
    }

    public final int hashCode() {
        return Long.hashCode(this.f20222b) + (this.f20221a.hashCode() * 31);
    }

    public final String toString() {
        return "PictureData(picture=" + this.f20221a + ", offset=" + h2.b.i(this.f20222b) + ")";
    }
}
