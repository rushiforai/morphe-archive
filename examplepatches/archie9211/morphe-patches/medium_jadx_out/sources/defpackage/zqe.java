package defpackage;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PorterDuff;
import android.graphics.Shader;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zqe {
    public static final Matrix p = new Matrix();
    public final Path a;
    public final Path b;
    public final Matrix c;
    public Paint d;
    public Paint e;
    public PathMeasure f;
    public final wqe g;
    public float h;
    public float i;
    public float j;
    public float k;
    public int l;
    public String m;
    public Boolean n;
    public final y70 o;

    public zqe(zqe zqeVar) {
        this.c = new Matrix();
        this.h = 0.0f;
        this.i = 0.0f;
        this.j = 0.0f;
        this.k = 0.0f;
        this.l = 255;
        this.m = null;
        this.n = null;
        y70 y70Var = new y70(0);
        this.o = y70Var;
        this.g = new wqe(zqeVar.g, y70Var);
        this.a = new Path(zqeVar.a);
        this.b = new Path(zqeVar.b);
        this.h = zqeVar.h;
        this.i = zqeVar.i;
        this.j = zqeVar.j;
        this.k = zqeVar.k;
        this.l = zqeVar.l;
        this.m = zqeVar.m;
        String str = zqeVar.m;
        if (str != null) {
            y70Var.put(str, this);
        }
        this.n = zqeVar.n;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(wqe wqeVar, Matrix matrix, Canvas canvas, int i, int i2) {
        int i3;
        float f;
        int i4;
        float f2;
        Matrix matrix2 = wqeVar.a;
        ArrayList arrayList = wqeVar.b;
        matrix2.set(matrix);
        Matrix matrix3 = wqeVar.a;
        matrix3.preConcat(wqeVar.j);
        canvas.save();
        char c = 0;
        int i5 = 0;
        while (i5 < arrayList.size()) {
            xqe xqeVar = (xqe) arrayList.get(i5);
            if (xqeVar instanceof wqe) {
                a((wqe) xqeVar, matrix3, canvas, i, i2);
            } else if (xqeVar instanceof yqe) {
                yqe yqeVar = (yqe) xqeVar;
                float f3 = i / this.j;
                float f4 = i2 / this.k;
                float fMin = Math.min(f3, f4);
                Matrix matrix4 = this.c;
                matrix4.set(matrix3);
                matrix4.postScale(f3, f4);
                float[] fArr = {0.0f, 1.0f, 1.0f, 0.0f};
                matrix3.mapVectors(fArr);
                float fHypot = (float) Math.hypot(fArr[c], fArr[1]);
                boolean z = c;
                i3 = i5;
                float fHypot2 = (float) Math.hypot(fArr[2], fArr[3]);
                float f5 = (fArr[z ? 1 : 0] * fArr[3]) - (fArr[1] * fArr[2]);
                float fMax = Math.max(fHypot, fHypot2);
                float fAbs = fMax > 0.0f ? Math.abs(f5) / fMax : 0.0f;
                if (fAbs != 0.0f) {
                    Path path = this.a;
                    path.reset();
                    i69[] i69VarArr = yqeVar.a;
                    if (i69VarArr != null) {
                        wo7.r(i69VarArr, path);
                    }
                    Path path2 = this.b;
                    path2.reset();
                    if (yqeVar instanceof uqe) {
                        path2.setFillType(yqeVar.c == 0 ? Path.FillType.WINDING : Path.FillType.EVEN_ODD);
                        path2.addPath(path, matrix4);
                        canvas.clipPath(path2);
                    } else {
                        vqe vqeVar = (vqe) yqeVar;
                        float f6 = vqeVar.i;
                        if (f6 != 0.0f || vqeVar.j != 1.0f) {
                            float f7 = vqeVar.k;
                            float f8 = (f6 + f7) % 1.0f;
                            float f9 = (vqeVar.j + f7) % 1.0f;
                            PathMeasure pathMeasure = this.f;
                            PathMeasure pathMeasure2 = pathMeasure;
                            if (pathMeasure == null) {
                                PathMeasure pathMeasure3 = new PathMeasure();
                                this.f = pathMeasure3;
                                pathMeasure2 = pathMeasure3;
                            }
                            pathMeasure2.setPath(path, z);
                            float length = this.f.getLength();
                            float f10 = f8 * length;
                            float f11 = f9 * length;
                            path.reset();
                            PathMeasure pathMeasure4 = this.f;
                            if (f10 > f11) {
                                pathMeasure4.getSegment(f10, length, path, true);
                                f = 0.0f;
                                this.f.getSegment(0.0f, f11, path, true);
                            } else {
                                f = 0.0f;
                                pathMeasure4.getSegment(f10, f11, path, true);
                            }
                            path.rLineTo(f, f);
                        }
                        path2.addPath(path, matrix4);
                        xp xpVar = vqeVar.f;
                        if (((Shader) xpVar.c) == null && xpVar.b == 0) {
                            f2 = 255.0f;
                            i4 = 16777215;
                        } else {
                            if (this.e == null) {
                                i4 = 16777215;
                                Paint paint = new Paint(1);
                                this.e = paint;
                                paint.setStyle(Paint.Style.FILL);
                            } else {
                                i4 = 16777215;
                            }
                            Paint paint2 = this.e;
                            Shader shader = (Shader) xpVar.c;
                            if (shader != null) {
                                shader.setLocalMatrix(matrix4);
                                paint2.setShader(shader);
                                paint2.setAlpha(Math.round(vqeVar.h * 255.0f));
                                f2 = 255.0f;
                            } else {
                                paint2.setShader(null);
                                paint2.setAlpha(255);
                                int i6 = xpVar.b;
                                float f12 = vqeVar.h;
                                PorterDuff.Mode mode = cre.j;
                                f2 = 255.0f;
                                paint2.setColor((i6 & i4) | (((int) (Color.alpha(i6) * f12)) << 24));
                            }
                            paint2.setColorFilter(null);
                            path2.setFillType(vqeVar.c == 0 ? Path.FillType.WINDING : Path.FillType.EVEN_ODD);
                            canvas.drawPath(path2, paint2);
                        }
                        xp xpVar2 = vqeVar.d;
                        if (((Shader) xpVar2.c) != null || xpVar2.b != 0) {
                            if (this.d == null) {
                                Paint paint3 = new Paint(1);
                                this.d = paint3;
                                paint3.setStyle(Paint.Style.STROKE);
                            }
                            Paint paint4 = this.d;
                            Paint.Join join = vqeVar.m;
                            if (join != null) {
                                paint4.setStrokeJoin(join);
                            }
                            Paint.Cap cap = vqeVar.l;
                            if (cap != null) {
                                paint4.setStrokeCap(cap);
                            }
                            paint4.setStrokeMiter(vqeVar.n);
                            Shader shader2 = (Shader) xpVar2.c;
                            if (shader2 != null) {
                                shader2.setLocalMatrix(matrix4);
                                paint4.setShader(shader2);
                                paint4.setAlpha(Math.round(vqeVar.g * f2));
                            } else {
                                paint4.setShader(null);
                                paint4.setAlpha(255);
                                int i7 = xpVar2.b;
                                float f13 = vqeVar.g;
                                PorterDuff.Mode mode2 = cre.j;
                                paint4.setColor((i7 & i4) | (((int) (Color.alpha(i7) * f13)) << 24));
                            }
                            paint4.setColorFilter(null);
                            paint4.setStrokeWidth(vqeVar.e * fMin * fAbs);
                            canvas.drawPath(path2, paint4);
                        }
                    }
                }
                i5 = i3 + 1;
                c = 0;
            }
            i3 = i5;
            i5 = i3 + 1;
            c = 0;
        }
        canvas.restore();
    }

    public float getAlpha() {
        return getRootAlpha() / 255.0f;
    }

    public int getRootAlpha() {
        return this.l;
    }

    public void setAlpha(float f) {
        setRootAlpha((int) (f * 255.0f));
    }

    public void setRootAlpha(int i) {
        this.l = i;
    }

    public zqe() {
        this.c = new Matrix();
        this.h = 0.0f;
        this.i = 0.0f;
        this.j = 0.0f;
        this.k = 0.0f;
        this.l = 255;
        this.m = null;
        this.n = null;
        this.o = new y70(0);
        this.g = new wqe();
        this.a = new Path();
        this.b = new Path();
    }
}
