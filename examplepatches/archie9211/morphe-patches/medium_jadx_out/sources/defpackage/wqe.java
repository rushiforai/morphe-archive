package defpackage;

import android.graphics.Matrix;
import android.graphics.Paint;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wqe extends xqe {
    public final Matrix a;
    public final ArrayList b;
    public float c;
    public float d;
    public float e;
    public float f;
    public float g;
    public float h;
    public float i;
    public final Matrix j;
    public String k;

    public wqe(wqe wqeVar, y70 y70Var) {
        yqe uqeVar;
        this.a = new Matrix();
        this.b = new ArrayList();
        this.c = 0.0f;
        this.d = 0.0f;
        this.e = 0.0f;
        this.f = 1.0f;
        this.g = 1.0f;
        this.h = 0.0f;
        this.i = 0.0f;
        Matrix matrix = new Matrix();
        this.j = matrix;
        this.k = null;
        this.c = wqeVar.c;
        this.d = wqeVar.d;
        this.e = wqeVar.e;
        this.f = wqeVar.f;
        this.g = wqeVar.g;
        this.h = wqeVar.h;
        this.i = wqeVar.i;
        String str = wqeVar.k;
        this.k = str;
        if (str != null) {
            y70Var.put(str, this);
        }
        matrix.set(wqeVar.j);
        ArrayList arrayList = wqeVar.b;
        for (int i = 0; i < arrayList.size(); i++) {
            Object obj = arrayList.get(i);
            if (obj instanceof wqe) {
                this.b.add(new wqe((wqe) obj, y70Var));
            } else {
                if (obj instanceof vqe) {
                    vqe vqeVar = (vqe) obj;
                    vqe vqeVar2 = new vqe(vqeVar);
                    vqeVar2.e = 0.0f;
                    vqeVar2.g = 1.0f;
                    vqeVar2.h = 1.0f;
                    vqeVar2.i = 0.0f;
                    vqeVar2.j = 1.0f;
                    vqeVar2.k = 0.0f;
                    vqeVar2.l = Paint.Cap.BUTT;
                    vqeVar2.m = Paint.Join.MITER;
                    vqeVar2.n = 4.0f;
                    vqeVar2.d = vqeVar.d;
                    vqeVar2.e = vqeVar.e;
                    vqeVar2.g = vqeVar.g;
                    vqeVar2.f = vqeVar.f;
                    vqeVar2.c = vqeVar.c;
                    vqeVar2.h = vqeVar.h;
                    vqeVar2.i = vqeVar.i;
                    vqeVar2.j = vqeVar.j;
                    vqeVar2.k = vqeVar.k;
                    vqeVar2.l = vqeVar.l;
                    vqeVar2.m = vqeVar.m;
                    vqeVar2.n = vqeVar.n;
                    uqeVar = vqeVar2;
                } else {
                    if (!(obj instanceof uqe)) {
                        ygf.f("Unknown object in the tree!");
                        throw null;
                    }
                    uqeVar = new uqe((uqe) obj);
                }
                this.b.add(uqeVar);
                Object obj2 = uqeVar.b;
                if (obj2 != null) {
                    y70Var.put(obj2, uqeVar);
                }
            }
        }
    }

    @Override // defpackage.xqe
    public final boolean a() {
        int i = 0;
        while (true) {
            ArrayList arrayList = this.b;
            if (i >= arrayList.size()) {
                return false;
            }
            if (((xqe) arrayList.get(i)).a()) {
                return true;
            }
            i++;
        }
    }

    @Override // defpackage.xqe
    public final boolean b(int[] iArr) {
        int i = 0;
        boolean zB = false;
        while (true) {
            ArrayList arrayList = this.b;
            if (i >= arrayList.size()) {
                return zB;
            }
            zB |= ((xqe) arrayList.get(i)).b(iArr);
            i++;
        }
    }

    public final void c() {
        Matrix matrix = this.j;
        matrix.reset();
        matrix.postTranslate(-this.d, -this.e);
        matrix.postScale(this.f, this.g);
        matrix.postRotate(this.c, 0.0f, 0.0f);
        matrix.postTranslate(this.h + this.d, this.i + this.e);
    }

    public String getGroupName() {
        return this.k;
    }

    public Matrix getLocalMatrix() {
        return this.j;
    }

    public float getPivotX() {
        return this.d;
    }

    public float getPivotY() {
        return this.e;
    }

    public float getRotation() {
        return this.c;
    }

    public float getScaleX() {
        return this.f;
    }

    public float getScaleY() {
        return this.g;
    }

    public float getTranslateX() {
        return this.h;
    }

    public float getTranslateY() {
        return this.i;
    }

    public void setPivotX(float f) {
        if (f != this.d) {
            this.d = f;
            c();
        }
    }

    public void setPivotY(float f) {
        if (f != this.e) {
            this.e = f;
            c();
        }
    }

    public void setRotation(float f) {
        if (f != this.c) {
            this.c = f;
            c();
        }
    }

    public void setScaleX(float f) {
        if (f != this.f) {
            this.f = f;
            c();
        }
    }

    public void setScaleY(float f) {
        if (f != this.g) {
            this.g = f;
            c();
        }
    }

    public void setTranslateX(float f) {
        if (f != this.h) {
            this.h = f;
            c();
        }
    }

    public void setTranslateY(float f) {
        if (f != this.i) {
            this.i = f;
            c();
        }
    }

    public wqe() {
        this.a = new Matrix();
        this.b = new ArrayList();
        this.c = 0.0f;
        this.d = 0.0f;
        this.e = 0.0f;
        this.f = 1.0f;
        this.g = 1.0f;
        this.h = 0.0f;
        this.i = 0.0f;
        this.j = new Matrix();
        this.k = null;
    }
}
