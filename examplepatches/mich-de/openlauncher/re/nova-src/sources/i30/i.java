package i30;

import android.graphics.RectF;
import android.opengl.Matrix;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.ArrayList;
import javax.microedition.khronos.opengles.GL11;
import javax.microedition.khronos.opengles.GL11Ext;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: p, reason: collision with root package name */
    public static final float[] f61298p = {0.0f, 0.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 0.0f, 0.0f, 1.0f, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, 1.0f, 1.0f, 1.0f, 0.0f};

    /* renamed from: a, reason: collision with root package name */
    public final GL11 f61299a;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f61300b = new float[16];

    /* renamed from: c, reason: collision with root package name */
    public final float[] f61301c = new float[16];

    /* renamed from: d, reason: collision with root package name */
    public final float[] f61302d = new float[4];

    /* renamed from: e, reason: collision with root package name */
    public final float[] f61303e = new float[4];

    /* renamed from: f, reason: collision with root package name */
    public final h f61304f;

    /* renamed from: g, reason: collision with root package name */
    public float f61305g;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f61306h;

    /* renamed from: i, reason: collision with root package name */
    public g f61307i;

    /* renamed from: j, reason: collision with root package name */
    public final RectF f61308j;

    /* renamed from: k, reason: collision with root package name */
    public final RectF f61309k;

    /* renamed from: l, reason: collision with root package name */
    public final float[] f61310l;

    /* renamed from: m, reason: collision with root package name */
    public final b3.x f61311m;
    public final b3.x n;
    public final boolean o;

    public i(GL11 gl11) {
        new ArrayList();
        this.f61306h = new ArrayList();
        this.f61308j = new RectF();
        this.f61309k = new RectF();
        this.f61310l = new float[32];
        this.f61311m = new b3.x(2, false);
        this.n = new b3.x(2, false);
        int i5 = 1;
        this.o = true;
        this.f61299a = gl11;
        this.f61304f = new h(gl11);
        float[] fArr = f61298p;
        FloatBuffer floatBufferAsFloatBuffer = ByteBuffer.allocateDirect(80).order(ByteOrder.nativeOrder()).asFloatBuffer();
        floatBufferAsFloatBuffer.put(fArr, 0, 20).position(0);
        int[] iArr = new int[1];
        synchronized (j.class) {
            while (true) {
                int i11 = i5 - 1;
                if (i5 > 0) {
                    int i12 = j.f61312a;
                    j.f61312a = i12 + 1;
                    iArr[i11] = i12;
                    i5 = i11;
                }
            }
        }
        gl11.glBindBuffer(34962, iArr[0]);
        gl11.glBufferData(34962, floatBufferAsFloatBuffer.capacity() * 4, floatBufferAsFloatBuffer, 35044);
        gl11.glVertexPointer(2, 5126, 0, 0);
        gl11.glTexCoordPointer(2, 5126, 0, 0);
        gl11.glClientActiveTexture(33985);
        gl11.glTexCoordPointer(2, 5126, 0, 0);
        gl11.glClientActiveTexture(33984);
        gl11.glEnableClientState(32888);
    }

    public final boolean a(a aVar) {
        x xVar = (x) aVar;
        xVar.m(this);
        if (!xVar.j()) {
            return false;
        }
        h hVar = this.f61304f;
        GL11 gl11 = hVar.f61292a;
        int i5 = hVar.f61295d;
        if (i5 != 3553) {
            if (i5 != 0) {
                gl11.glDisable(i5);
            }
            hVar.f61295d = 3553;
            gl11.glEnable(3553);
        }
        this.f61299a.glBindTexture(3553, aVar.f61247a);
        return true;
    }

    public final void b(a aVar, int i5, int i11, int i12, int i13) {
        float[] fArr = this.f61300b;
        if (Math.abs(fArr[4]) <= 1.0E-5f && Math.abs(fArr[1]) <= 1.0E-5f) {
            float f11 = fArr[0];
            if (f11 >= -1.0E-5f) {
                float f12 = fArr[5];
                if (f12 <= 1.0E-5f) {
                    float f13 = i5;
                    float f14 = fArr[4];
                    float f15 = i13 + i11;
                    float f16 = (f14 * f15) + (f11 * f13);
                    float f17 = fArr[12];
                    float f18 = (f12 * f15) + (fArr[1] * f13);
                    float f19 = fArr[13];
                    float f21 = fArr[3];
                    float f22 = fArr[7];
                    float f23 = (f15 * f22) + (f13 * f21);
                    float f24 = fArr[15];
                    float f25 = f23 + f24;
                    float f26 = (f16 + f17) / f25;
                    float[] fArr2 = this.f61302d;
                    fArr2[0] = f26;
                    float f27 = (f18 + f19) / f25;
                    fArr2[1] = f27;
                    float f28 = i12 + i5;
                    float f29 = i11;
                    float f31 = (f14 * f29) + (fArr[0] * f28) + f17;
                    float f32 = (f12 * f29) + (fArr[1] * f28) + f19;
                    float f33 = (f22 * f29) + (f21 * f28) + f24;
                    float f34 = f31 / f33;
                    fArr2[2] = f34;
                    float f35 = f32 / f33;
                    fArr2[3] = f35;
                    int i14 = (int) (f26 + 0.5f);
                    int i15 = (int) (f27 + 0.5f);
                    int i16 = ((int) (f34 + 0.5f)) - i14;
                    int i17 = ((int) (f35 + 0.5f)) - i15;
                    if (i16 <= 0 || i17 <= 0) {
                        return;
                    }
                    ((GL11Ext) this.f61299a).glDrawTexiOES(i14, i15, 0, i16, i17);
                    return;
                }
            }
        }
        aVar.getClass();
        i(0.0f, 0.0f, aVar.e() / aVar.d(), aVar.b() / aVar.c());
        j(i5, i11, i12, i13);
    }

    public final void c(float f11, float f12, float f13, float f14, k kVar) {
        int i5 = kVar.f61317b;
        float f15 = this.f61305g;
        h hVar = this.f61304f;
        hVar.b(f15, i5);
        float f16 = kVar.f61316a;
        if (hVar.f61297f != f16) {
            hVar.f61297f = f16;
            hVar.f61292a.glLineWidth(f16);
        }
        float[] fArr = this.f61300b;
        float[] fArr2 = this.f61310l;
        System.arraycopy(fArr, 0, fArr2, 0, 16);
        k(f11, f12);
        Matrix.scaleM(fArr, 0, f13, f14, 1.0f);
        GL11 gl11 = this.f61299a;
        gl11.glLoadMatrixf(fArr, 0);
        gl11.glDrawArrays(2, 6, 4);
        System.arraycopy(fArr2, 0, fArr, 0, 16);
    }

    public final void d(a aVar, int i5, int i11, int i12, int i13, float f11) {
        if (i12 <= 0 || i13 <= 0) {
            return;
        }
        boolean z11 = this.o && (!((x) aVar).f61370k || f11 < 0.95f);
        h hVar = this.f61304f;
        hVar.a(z11);
        if (a(aVar)) {
            hVar.d(f11);
            b(aVar, i5, i11, i12, i13);
        }
    }

    public final void e(a aVar, RectF rectF, RectF rectF2) {
        if (rectF2.width() <= 0.0f || rectF2.height() <= 0.0f) {
            return;
        }
        RectF rectF3 = this.f61308j;
        rectF3.set(rectF);
        RectF rectF4 = this.f61309k;
        rectF4.set(rectF2);
        boolean z11 = this.o && (!((x) aVar).f61370k || this.f61305g < 0.95f);
        h hVar = this.f61304f;
        hVar.a(z11);
        if (a(aVar)) {
            int iE = aVar.e();
            int iB = aVar.b();
            int iD = aVar.d();
            int iC = aVar.c();
            float f11 = iD;
            rectF3.left /= f11;
            float f12 = rectF3.right / f11;
            rectF3.right = f12;
            float f13 = iC;
            rectF3.top /= f13;
            rectF3.bottom /= f13;
            float f14 = iE / f11;
            if (f12 > f14) {
                rectF4.right = (((f14 - rectF3.left) * rectF4.width()) / rectF3.width()) + rectF4.left;
                rectF3.right = f14;
            }
            float f15 = iB / f13;
            if (rectF3.bottom > f15) {
                rectF4.bottom = (((f15 - rectF3.top) * rectF4.height()) / rectF3.height()) + rectF4.top;
                rectF3.bottom = f15;
            }
            i(rectF3.left, rectF3.top, rectF3.right, rectF3.bottom);
            hVar.d(this.f61305g);
            j(rectF4.left, rectF4.top, rectF4.width(), rectF4.height());
        }
    }

    public final void f(float f11, float f12, float f13, float f14, int i5) {
        this.f61304f.b(this.f61305g, i5);
        float[] fArr = this.f61300b;
        float[] fArr2 = this.f61310l;
        System.arraycopy(fArr, 0, fArr2, 0, 16);
        k(f11, f12);
        Matrix.scaleM(fArr, 0, f13, f14, 1.0f);
        GL11 gl11 = this.f61299a;
        gl11.glLoadMatrixf(fArr, 0);
        gl11.glDrawArrays(5, 0, 4);
        System.arraycopy(fArr2, 0, fArr, 0, 16);
    }

    public final void g() {
        ArrayList arrayList = this.f61306h;
        if (arrayList.isEmpty()) {
            throw new IllegalStateException();
        }
        g gVar = (g) arrayList.remove(arrayList.size() - 1);
        float f11 = gVar.f61289a;
        if (f11 >= 0.0f) {
            f30.f.a(f11 >= 0.0f && f11 <= 1.0f);
            this.f61305g = f11;
        }
        float[] fArr = gVar.f61290b;
        if (fArr[0] != Float.NEGATIVE_INFINITY) {
            System.arraycopy(fArr, 0, this.f61300b, 0, 16);
        }
        gVar.f61291c = this.f61307i;
        this.f61307i = gVar;
    }

    public final void h(int i5) {
        g gVar = this.f61307i;
        if (gVar != null) {
            this.f61307i = gVar.f61291c;
        } else {
            gVar = new g();
            gVar.f61290b = new float[16];
        }
        float[] fArr = gVar.f61290b;
        if ((i5 & 1) != 0) {
            gVar.f61289a = this.f61305g;
        } else {
            gVar.f61289a = -1.0f;
        }
        if ((i5 & 2) != 0) {
            System.arraycopy(this.f61300b, 0, fArr, 0, 16);
        } else {
            fArr[0] = Float.NEGATIVE_INFINITY;
        }
        this.f61306h.add(gVar);
    }

    public final void i(float f11, float f12, float f13, float f14) {
        GL11 gl11 = this.f61299a;
        gl11.glMatrixMode(5890);
        float[] fArr = this.f61301c;
        fArr[0] = f13 - f11;
        fArr[5] = f14 - f12;
        fArr[10] = 1.0f;
        fArr[12] = f11;
        fArr[13] = f12;
        fArr[15] = 1.0f;
        gl11.glLoadMatrixf(fArr, 0);
        gl11.glMatrixMode(5888);
    }

    public final void j(float f11, float f12, float f13, float f14) {
        float[] fArr = this.f61300b;
        float[] fArr2 = this.f61310l;
        System.arraycopy(fArr, 0, fArr2, 0, 16);
        k(f11, f12);
        Matrix.scaleM(fArr, 0, f13, f14, 1.0f);
        GL11 gl11 = this.f61299a;
        gl11.glLoadMatrixf(fArr, 0);
        gl11.glDrawArrays(5, 0, 4);
        System.arraycopy(fArr2, 0, fArr, 0, 16);
    }

    public final void k(float f11, float f12) {
        float[] fArr = this.f61300b;
        fArr[12] = (fArr[4] * f12) + (fArr[0] * f11) + fArr[12];
        fArr[13] = (fArr[5] * f12) + (fArr[1] * f11) + fArr[13];
        fArr[14] = (fArr[6] * f12) + (fArr[2] * f11) + fArr[14];
        fArr[15] = (fArr[7] * f12) + (fArr[3] * f11) + fArr[15];
    }
}
