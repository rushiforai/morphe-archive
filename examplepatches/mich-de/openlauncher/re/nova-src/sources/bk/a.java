package bk;

import android.graphics.RectF;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a implements c {

    /* renamed from: a, reason: collision with root package name */
    public final float f17938a;

    public a(float f11) {
        this.f17938a = f11;
    }

    @Override // bk.c
    public final float a(RectF rectF) {
        return this.f17938a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && this.f17938a == ((a) obj).f17938a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Float.valueOf(this.f17938a)});
    }
}
