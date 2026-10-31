package c30;

import android.graphics.Bitmap;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final List f19542a;

    /* renamed from: b, reason: collision with root package name */
    public final int f19543b;

    /* renamed from: c, reason: collision with root package name */
    public final e f19544c;

    /* renamed from: d, reason: collision with root package name */
    public final e f19545d;

    /* renamed from: e, reason: collision with root package name */
    public final e f19546e;

    /* renamed from: f, reason: collision with root package name */
    public final e f19547f;

    /* renamed from: g, reason: collision with root package name */
    public final e f19548g;

    /* renamed from: h, reason: collision with root package name */
    public final e f19549h;

    public f(List list) {
        e eVar;
        e eVar2;
        this.f19542a = list;
        Iterator it = list.iterator();
        int iMax = 0;
        while (it.hasNext()) {
            iMax = Math.max(iMax, ((e) it.next()).f19540e);
        }
        this.f19543b = iMax;
        this.f19544c = a(0.5f, 0.3f, 0.7f, 1.0f, 0.35f, 1.0f);
        this.f19548g = a(0.74f, 0.55f, 1.0f, 1.0f, 0.35f, 1.0f);
        this.f19546e = a(0.26f, 0.0f, 0.45f, 1.0f, 0.35f, 1.0f);
        this.f19545d = a(0.5f, 0.3f, 0.7f, 0.3f, 0.0f, 0.4f);
        this.f19549h = a(0.74f, 0.55f, 1.0f, 0.3f, 0.0f, 0.4f);
        this.f19547f = a(0.26f, 0.0f, 0.45f, 0.3f, 0.0f, 0.4f);
        if (this.f19544c == null && (eVar2 = this.f19546e) != null) {
            float[] fArr = {0.0f, 0.0f, 0.5f};
            System.arraycopy(eVar2.a(), 0, fArr, 0, 3);
            this.f19544c = new e(r4.a.a(fArr), 0);
        }
        if (this.f19546e != null || (eVar = this.f19544c) == null) {
            return;
        }
        float[] fArr2 = {0.0f, 0.0f, 0.26f};
        System.arraycopy(eVar.a(), 0, fArr2, 0, 3);
        this.f19546e = new e(r4.a.a(fArr2), 0);
    }

    public static f b(Bitmap bitmap) {
        Bitmap bitmapCreateScaledBitmap;
        if (bitmap == null) {
            throw new IllegalArgumentException("bitmap can not be null");
        }
        if (bitmap.isRecycled()) {
            throw new IllegalArgumentException("bitmap can not be recycled");
        }
        int iMin = Math.min(bitmap.getWidth(), bitmap.getHeight());
        if (iMin <= 100) {
            bitmapCreateScaledBitmap = bitmap;
        } else {
            float f11 = 100.0f / iMin;
            bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap, Math.round(bitmap.getWidth() * f11), Math.round(bitmap.getHeight() * f11), false);
        }
        int width = bitmapCreateScaledBitmap.getWidth();
        int height = bitmapCreateScaledBitmap.getHeight();
        int[] iArr = new int[width * height];
        bitmapCreateScaledBitmap.getPixels(iArr, 0, width, 0, 0, width, height);
        b bVar = new b(new c(iArr));
        if (bitmapCreateScaledBitmap != bitmap) {
            bitmapCreateScaledBitmap.recycle();
        }
        return new f(bVar.f19530d);
    }

    public final e a(float f11, float f12, float f13, float f14, float f15, float f16) {
        e eVar = null;
        float f17 = 0.0f;
        for (e eVar2 : this.f19542a) {
            float f18 = eVar2.a()[1];
            float f19 = eVar2.a()[2];
            if (f18 >= f15 && f18 <= f16 && f19 >= f12 && f19 <= f13 && this.f19544c != eVar2 && this.f19546e != eVar2 && this.f19548g != eVar2 && this.f19545d != eVar2 && this.f19547f != eVar2 && this.f19549h != eVar2) {
                float[] fArr = {1.0f - Math.abs(f18 - f14), 3.0f, 1.0f - Math.abs(f19 - f11), 6.0f, eVar2.f19540e / this.f19543b, 1.0f};
                float f21 = 0.0f;
                float f22 = 0.0f;
                for (int i5 = 0; i5 < 6; i5 += 2) {
                    float f23 = fArr[i5];
                    float f24 = fArr[i5 + 1];
                    f21 += f23 * f24;
                    f22 += f24;
                }
                float f25 = f21 / f22;
                if (eVar == null || f25 > f17) {
                    eVar = eVar2;
                    f17 = f25;
                }
            }
        }
        return eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || f.class != obj.getClass()) {
            return false;
        }
        f fVar = (f) obj;
        e eVar = fVar.f19545d;
        e eVar2 = fVar.f19548g;
        e eVar3 = fVar.f19549h;
        e eVar4 = fVar.f19547f;
        List list = fVar.f19542a;
        List list2 = this.f19542a;
        if (list2 == null ? list != null : !list2.equals(list)) {
            return false;
        }
        e eVar5 = this.f19547f;
        if (eVar5 == null ? eVar4 != null : !eVar5.equals(eVar4)) {
            return false;
        }
        e eVar6 = this.f19546e;
        if (eVar6 == null ? fVar.f19546e != null : !eVar6.equals(fVar.f19546e)) {
            return false;
        }
        e eVar7 = this.f19549h;
        if (eVar7 == null ? eVar3 != null : !eVar7.equals(eVar3)) {
            return false;
        }
        e eVar8 = this.f19548g;
        if (eVar8 == null ? eVar2 != null : !eVar8.equals(eVar2)) {
            return false;
        }
        e eVar9 = this.f19545d;
        if (eVar9 == null ? eVar != null : !eVar9.equals(eVar)) {
            return false;
        }
        e eVar10 = this.f19544c;
        e eVar11 = fVar.f19544c;
        return eVar10 == null ? eVar11 == null : eVar10.equals(eVar11);
    }

    public final int hashCode() {
        List list = this.f19542a;
        int iHashCode = (list != null ? list.hashCode() : 0) * 31;
        e eVar = this.f19544c;
        int iHashCode2 = (iHashCode + (eVar != null ? eVar.hashCode() : 0)) * 31;
        e eVar2 = this.f19545d;
        int iHashCode3 = (iHashCode2 + (eVar2 != null ? eVar2.hashCode() : 0)) * 31;
        e eVar3 = this.f19546e;
        int iHashCode4 = (iHashCode3 + (eVar3 != null ? eVar3.hashCode() : 0)) * 31;
        e eVar4 = this.f19547f;
        int iHashCode5 = (iHashCode4 + (eVar4 != null ? eVar4.hashCode() : 0)) * 31;
        e eVar5 = this.f19548g;
        int iHashCode6 = (iHashCode5 + (eVar5 != null ? eVar5.hashCode() : 0)) * 31;
        e eVar6 = this.f19549h;
        return iHashCode6 + (eVar6 != null ? eVar6.hashCode() : 0);
    }
}
