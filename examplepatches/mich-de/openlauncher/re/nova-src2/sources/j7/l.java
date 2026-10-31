package j7;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import java.util.ArrayList;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: p, reason: collision with root package name */
    public static final Matrix f69112p = new Matrix();

    /* renamed from: a, reason: collision with root package name */
    public final Path f69113a;

    /* renamed from: b, reason: collision with root package name */
    public final Path f69114b;

    /* renamed from: c, reason: collision with root package name */
    public final Matrix f69115c;

    /* renamed from: d, reason: collision with root package name */
    public Paint f69116d;

    /* renamed from: e, reason: collision with root package name */
    public Paint f69117e;

    /* renamed from: f, reason: collision with root package name */
    public PathMeasure f69118f;

    /* renamed from: g, reason: collision with root package name */
    public final i f69119g;

    /* renamed from: h, reason: collision with root package name */
    public float f69120h;

    /* renamed from: i, reason: collision with root package name */
    public float f69121i;

    /* renamed from: j, reason: collision with root package name */
    public float f69122j;

    /* renamed from: k, reason: collision with root package name */
    public float f69123k;

    /* renamed from: l, reason: collision with root package name */
    public int f69124l;

    /* renamed from: m, reason: collision with root package name */
    public String f69125m;
    public Boolean n;
    public final z.e o;

    public l() {
        this.f69115c = new Matrix();
        this.f69120h = 0.0f;
        this.f69121i = 0.0f;
        this.f69122j = 0.0f;
        this.f69123k = 0.0f;
        this.f69124l = 255;
        this.f69125m = null;
        this.n = null;
        this.o = new z.e(0);
        this.f69119g = new i();
        this.f69113a = new Path();
        this.f69114b = new Path();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(i iVar, Matrix matrix, Canvas canvas, int i5, int i11) {
        int i12;
        float f11;
        int i13;
        float f12;
        Matrix matrix2 = iVar.f69098a;
        ArrayList arrayList = iVar.f69099b;
        matrix2.set(matrix);
        Matrix matrix3 = iVar.f69098a;
        matrix3.preConcat(iVar.f69107j);
        canvas.save();
        char c11 = 0;
        int i14 = 0;
        while (i14 < arrayList.size()) {
            j jVar = (j) arrayList.get(i14);
            if (jVar instanceof i) {
                a((i) jVar, matrix3, canvas, i5, i11);
            } else if (jVar instanceof k) {
                k kVar = (k) jVar;
                float f13 = i5 / this.f69122j;
                float f14 = i11 / this.f69123k;
                float fMin = Math.min(f13, f14);
                Matrix matrix4 = this.f69115c;
                matrix4.set(matrix3);
                matrix4.postScale(f13, f14);
                float[] fArr = {0.0f, 1.0f, 1.0f, 0.0f};
                matrix3.mapVectors(fArr);
                float fHypot = (float) Math.hypot(fArr[c11], fArr[1]);
                boolean z11 = c11;
                i12 = i14;
                float fHypot2 = (float) Math.hypot(fArr[2], fArr[3]);
                float f15 = (fArr[z11 ? 1 : 0] * fArr[3]) - (fArr[1] * fArr[2]);
                float fMax = Math.max(fHypot, fHypot2);
                float fAbs = fMax > 0.0f ? Math.abs(f15) / fMax : 0.0f;
                if (fAbs != 0.0f) {
                    Path path = this.f69113a;
                    path.reset();
                    r4.b[] bVarArr = kVar.f69109a;
                    if (bVarArr != null) {
                        r4.b.b(bVarArr, path);
                    }
                    Path path2 = this.f69114b;
                    path2.reset();
                    if (kVar instanceof g) {
                        path2.setFillType(kVar.f69111c == 0 ? Path.FillType.WINDING : Path.FillType.EVEN_ODD);
                        path2.addPath(path, matrix4);
                        canvas.clipPath(path2);
                    } else {
                        h hVar = (h) kVar;
                        float f16 = hVar.f69093i;
                        if (f16 != 0.0f || hVar.f69094j != 1.0f) {
                            float f17 = hVar.f69095k;
                            float f18 = (f16 + f17) % 1.0f;
                            float f19 = (hVar.f69094j + f17) % 1.0f;
                            if (this.f69118f == null) {
                                this.f69118f = new PathMeasure();
                            }
                            this.f69118f.setPath(path, z11);
                            float length = this.f69118f.getLength();
                            float f21 = f18 * length;
                            float f22 = f19 * length;
                            path.reset();
                            if (f21 > f22) {
                                this.f69118f.getSegment(f21, length, path, true);
                                f11 = 0.0f;
                                this.f69118f.getSegment(0.0f, f22, path, true);
                            } else {
                                f11 = 0.0f;
                                this.f69118f.getSegment(f21, f22, path, true);
                            }
                            path.rLineTo(f11, f11);
                        }
                        path2.addPath(path, matrix4);
                        c30.c cVar = hVar.f69090f;
                        if (((Shader) cVar.f19533c) == null && cVar.f19532b == 0) {
                            f12 = 255.0f;
                            i13 = 16777215;
                        } else {
                            if (this.f69117e == null) {
                                i13 = 16777215;
                                Paint paint = new Paint(1);
                                this.f69117e = paint;
                                paint.setStyle(Paint.Style.FILL);
                            } else {
                                i13 = 16777215;
                            }
                            Paint paint2 = this.f69117e;
                            Shader shader = (Shader) cVar.f19533c;
                            if (shader != null) {
                                shader.setLocalMatrix(matrix4);
                                paint2.setShader(shader);
                                paint2.setAlpha(Math.round(hVar.f69092h * 255.0f));
                                f12 = 255.0f;
                            } else {
                                paint2.setShader(null);
                                paint2.setAlpha(255);
                                int i15 = cVar.f19532b;
                                float f23 = hVar.f69092h;
                                PorterDuff.Mode mode = o.f69139j;
                                f12 = 255.0f;
                                paint2.setColor((i15 & i13) | (((int) (Color.alpha(i15) * f23)) << 24));
                            }
                            paint2.setColorFilter(null);
                            path2.setFillType(hVar.f69111c == 0 ? Path.FillType.WINDING : Path.FillType.EVEN_ODD);
                            canvas.drawPath(path2, paint2);
                        }
                        c30.c cVar2 = hVar.f69088d;
                        if (((Shader) cVar2.f19533c) != null || cVar2.f19532b != 0) {
                            if (this.f69116d == null) {
                                Paint paint3 = new Paint(1);
                                this.f69116d = paint3;
                                paint3.setStyle(Paint.Style.STROKE);
                            }
                            Paint paint4 = this.f69116d;
                            Paint.Join join = hVar.f69097m;
                            if (join != null) {
                                paint4.setStrokeJoin(join);
                            }
                            Paint.Cap cap = hVar.f69096l;
                            if (cap != null) {
                                paint4.setStrokeCap(cap);
                            }
                            paint4.setStrokeMiter(hVar.n);
                            Shader shader2 = (Shader) cVar2.f19533c;
                            if (shader2 != null) {
                                shader2.setLocalMatrix(matrix4);
                                paint4.setShader(shader2);
                                paint4.setAlpha(Math.round(hVar.f69091g * f12));
                            } else {
                                paint4.setShader(null);
                                paint4.setAlpha(255);
                                int i16 = cVar2.f19532b;
                                float f24 = hVar.f69091g;
                                PorterDuff.Mode mode2 = o.f69139j;
                                paint4.setColor((i16 & i13) | (((int) (Color.alpha(i16) * f24)) << 24));
                            }
                            paint4.setColorFilter(null);
                            paint4.setStrokeWidth(hVar.f69089e * fMin * fAbs);
                            canvas.drawPath(path2, paint4);
                        }
                    }
                }
                i14 = i12 + 1;
                c11 = 0;
            }
            i12 = i14;
            i14 = i12 + 1;
            c11 = 0;
        }
        canvas.restore();
    }

    public float getAlpha() {
        return getRootAlpha() / 255.0f;
    }

    public int getRootAlpha() {
        return this.f69124l;
    }

    public void setAlpha(float f11) {
        setRootAlpha((int) (f11 * 255.0f));
    }

    public void setRootAlpha(int i5) {
        this.f69124l = i5;
    }

    public l(l lVar) {
        this.f69115c = new Matrix();
        this.f69120h = 0.0f;
        this.f69121i = 0.0f;
        this.f69122j = 0.0f;
        this.f69123k = 0.0f;
        this.f69124l = 255;
        this.f69125m = null;
        this.n = null;
        z.e eVar = new z.e(0);
        this.o = eVar;
        this.f69119g = new i(lVar.f69119g, eVar);
        this.f69113a = new Path(lVar.f69113a);
        this.f69114b = new Path(lVar.f69114b);
        this.f69120h = lVar.f69120h;
        this.f69121i = lVar.f69121i;
        this.f69122j = lVar.f69122j;
        this.f69123k = lVar.f69123k;
        this.f69124l = lVar.f69124l;
        this.f69125m = lVar.f69125m;
        String str = lVar.f69125m;
        if (str != null) {
            eVar.put(str, this);
        }
        this.n = lVar.n;
    }
}
