package j7;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.util.AttributeSet;
import java.util.ArrayList;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes2.dex */
public final class i extends j {

    /* renamed from: a, reason: collision with root package name */
    public final Matrix f69098a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f69099b;

    /* renamed from: c, reason: collision with root package name */
    public float f69100c;

    /* renamed from: d, reason: collision with root package name */
    public float f69101d;

    /* renamed from: e, reason: collision with root package name */
    public float f69102e;

    /* renamed from: f, reason: collision with root package name */
    public float f69103f;

    /* renamed from: g, reason: collision with root package name */
    public float f69104g;

    /* renamed from: h, reason: collision with root package name */
    public float f69105h;

    /* renamed from: i, reason: collision with root package name */
    public float f69106i;

    /* renamed from: j, reason: collision with root package name */
    public final Matrix f69107j;

    /* renamed from: k, reason: collision with root package name */
    public String f69108k;

    public i() {
        this.f69098a = new Matrix();
        this.f69099b = new ArrayList();
        this.f69100c = 0.0f;
        this.f69101d = 0.0f;
        this.f69102e = 0.0f;
        this.f69103f = 1.0f;
        this.f69104g = 1.0f;
        this.f69105h = 0.0f;
        this.f69106i = 0.0f;
        this.f69107j = new Matrix();
        this.f69108k = null;
    }

    @Override // j7.j
    public final boolean a() {
        int i5 = 0;
        while (true) {
            ArrayList arrayList = this.f69099b;
            if (i5 >= arrayList.size()) {
                return false;
            }
            if (((j) arrayList.get(i5)).a()) {
                return true;
            }
            i5++;
        }
    }

    @Override // j7.j
    public final boolean b(int[] iArr) {
        int i5 = 0;
        boolean zB = false;
        while (true) {
            ArrayList arrayList = this.f69099b;
            if (i5 >= arrayList.size()) {
                return zB;
            }
            zB |= ((j) arrayList.get(i5)).b(iArr);
            i5++;
        }
    }

    public final void c(Resources resources, XmlPullParser xmlPullParser, AttributeSet attributeSet, Resources.Theme theme) {
        TypedArray typedArrayK = fg.a.K(resources, theme, attributeSet, a.f69069b);
        float f11 = this.f69100c;
        if (fg.a.B(xmlPullParser, "rotation")) {
            f11 = typedArrayK.getFloat(5, f11);
        }
        this.f69100c = f11;
        this.f69101d = typedArrayK.getFloat(1, this.f69101d);
        this.f69102e = typedArrayK.getFloat(2, this.f69102e);
        float f12 = this.f69103f;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "scaleX") != null) {
            f12 = typedArrayK.getFloat(3, f12);
        }
        this.f69103f = f12;
        float f13 = this.f69104g;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "scaleY") != null) {
            f13 = typedArrayK.getFloat(4, f13);
        }
        this.f69104g = f13;
        float f14 = this.f69105h;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "translateX") != null) {
            f14 = typedArrayK.getFloat(6, f14);
        }
        this.f69105h = f14;
        float f15 = this.f69106i;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "translateY") != null) {
            f15 = typedArrayK.getFloat(7, f15);
        }
        this.f69106i = f15;
        String string = typedArrayK.getString(0);
        if (string != null) {
            this.f69108k = string;
        }
        d();
        typedArrayK.recycle();
    }

    public final void d() {
        Matrix matrix = this.f69107j;
        matrix.reset();
        matrix.postTranslate(-this.f69101d, -this.f69102e);
        matrix.postScale(this.f69103f, this.f69104g);
        matrix.postRotate(this.f69100c, 0.0f, 0.0f);
        matrix.postTranslate(this.f69105h + this.f69101d, this.f69106i + this.f69102e);
    }

    public String getGroupName() {
        return this.f69108k;
    }

    public Matrix getLocalMatrix() {
        return this.f69107j;
    }

    public float getPivotX() {
        return this.f69101d;
    }

    public float getPivotY() {
        return this.f69102e;
    }

    public float getRotation() {
        return this.f69100c;
    }

    public float getScaleX() {
        return this.f69103f;
    }

    public float getScaleY() {
        return this.f69104g;
    }

    public float getTranslateX() {
        return this.f69105h;
    }

    public float getTranslateY() {
        return this.f69106i;
    }

    public void setPivotX(float f11) {
        if (f11 != this.f69101d) {
            this.f69101d = f11;
            d();
        }
    }

    public void setPivotY(float f11) {
        if (f11 != this.f69102e) {
            this.f69102e = f11;
            d();
        }
    }

    public void setRotation(float f11) {
        if (f11 != this.f69100c) {
            this.f69100c = f11;
            d();
        }
    }

    public void setScaleX(float f11) {
        if (f11 != this.f69103f) {
            this.f69103f = f11;
            d();
        }
    }

    public void setScaleY(float f11) {
        if (f11 != this.f69104g) {
            this.f69104g = f11;
            d();
        }
    }

    public void setTranslateX(float f11) {
        if (f11 != this.f69105h) {
            this.f69105h = f11;
            d();
        }
    }

    public void setTranslateY(float f11) {
        if (f11 != this.f69106i) {
            this.f69106i = f11;
            d();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public i(i iVar, z.e eVar) {
        g gVar;
        this.f69098a = new Matrix();
        this.f69099b = new ArrayList();
        this.f69100c = 0.0f;
        this.f69101d = 0.0f;
        this.f69102e = 0.0f;
        this.f69103f = 1.0f;
        this.f69104g = 1.0f;
        this.f69105h = 0.0f;
        this.f69106i = 0.0f;
        Matrix matrix = new Matrix();
        this.f69107j = matrix;
        this.f69108k = null;
        this.f69100c = iVar.f69100c;
        this.f69101d = iVar.f69101d;
        this.f69102e = iVar.f69102e;
        this.f69103f = iVar.f69103f;
        this.f69104g = iVar.f69104g;
        this.f69105h = iVar.f69105h;
        this.f69106i = iVar.f69106i;
        String str = iVar.f69108k;
        this.f69108k = str;
        if (str != null) {
            eVar.put(str, this);
        }
        matrix.set(iVar.f69107j);
        ArrayList arrayList = iVar.f69099b;
        for (int i5 = 0; i5 < arrayList.size(); i5++) {
            Object obj = arrayList.get(i5);
            if (obj instanceof i) {
                this.f69099b.add(new i((i) obj, eVar));
            } else {
                if (obj instanceof h) {
                    h hVar = (h) obj;
                    h hVar2 = new h(hVar);
                    hVar2.f69089e = 0.0f;
                    hVar2.f69091g = 1.0f;
                    hVar2.f69092h = 1.0f;
                    hVar2.f69093i = 0.0f;
                    hVar2.f69094j = 1.0f;
                    hVar2.f69095k = 0.0f;
                    hVar2.f69096l = Paint.Cap.BUTT;
                    hVar2.f69097m = Paint.Join.MITER;
                    hVar2.n = 4.0f;
                    hVar2.f69088d = hVar.f69088d;
                    hVar2.f69089e = hVar.f69089e;
                    hVar2.f69091g = hVar.f69091g;
                    hVar2.f69090f = hVar.f69090f;
                    hVar2.f69111c = hVar.f69111c;
                    hVar2.f69092h = hVar.f69092h;
                    hVar2.f69093i = hVar.f69093i;
                    hVar2.f69094j = hVar.f69094j;
                    hVar2.f69095k = hVar.f69095k;
                    hVar2.f69096l = hVar.f69096l;
                    hVar2.f69097m = hVar.f69097m;
                    hVar2.n = hVar.n;
                    gVar = hVar2;
                } else if (obj instanceof g) {
                    gVar = new g((g) obj);
                } else {
                    throw new IllegalStateException("Unknown object in the tree!");
                }
                this.f69099b.add(gVar);
                Object obj2 = gVar.f69110b;
                if (obj2 != null) {
                    eVar.put(obj2, gVar);
                }
            }
        }
    }
}
