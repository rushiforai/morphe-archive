package bk;

import android.graphics.RectF;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b implements c {

    /* renamed from: a, reason: collision with root package name */
    public final c f17939a;

    /* renamed from: b, reason: collision with root package name */
    public final float f17940b;

    public b(float f11, c cVar) {
        while (cVar instanceof b) {
            cVar = ((b) cVar).f17939a;
            f11 += ((b) cVar).f17940b;
        }
        this.f17939a = cVar;
        this.f17940b = f11;
    }

    @Override // bk.c
    public final float a(RectF rectF) {
        return Math.max(0.0f, this.f17939a.a(rectF) + this.f17940b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f17939a.equals(bVar.f17939a) && this.f17940b == bVar.f17940b;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f17939a, Float.valueOf(this.f17940b)});
    }
}
