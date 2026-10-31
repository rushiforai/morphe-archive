package bk;

import android.graphics.RectF;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class h implements c {

    /* renamed from: a, reason: collision with root package name */
    public final float f18001a;

    public h(float f11) {
        this.f18001a = f11;
    }

    @Override // bk.c
    public final float a(RectF rectF) {
        return Math.min(rectF.width(), rectF.height()) * this.f18001a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof h) && this.f18001a == ((h) obj).f18001a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Float.valueOf(this.f18001a)});
    }
}
