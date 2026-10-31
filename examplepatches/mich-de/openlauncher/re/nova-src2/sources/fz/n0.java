package fz;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n0 extends r {

    /* renamed from: d, reason: collision with root package name */
    public final String f56311d;

    /* renamed from: e, reason: collision with root package name */
    public final Matrix f56312e = new Matrix();

    /* renamed from: f, reason: collision with root package name */
    public final Path f56313f = new Path();

    public n0(String str) {
        this.f56311d = str;
    }

    @Override // fz.r
    public final void a(Path path, float f11, float f12, float f13) {
        Matrix matrix = this.f56312e;
        matrix.reset();
        float f14 = (f13 * 2.0f) / 100;
        matrix.postScale(f14, f14);
        Path path2 = this.f56313f;
        path2.rewind();
        e().transform(matrix, path2);
        path2.offset(f11, f12);
        path.addPath(path2);
    }

    @Override // fz.r
    public final String b() {
        return this.f56311d;
    }

    @Override // fz.r
    public final Animator c(View view, Rect rect, Rect rect2, float f11, boolean z11, boolean z12) {
        float f12;
        ValueAnimator valueAnimatorOfFloat;
        Path path = new Path();
        int i5 = rect.left;
        int i11 = rect.top;
        int iWidth = rect.width();
        int iHeight = rect.height();
        int i12 = rect2.left;
        int i13 = rect2.top;
        int iWidth2 = rect2.width();
        int iHeight2 = rect2.height();
        Path pathE = e();
        Path path2 = new Path();
        float f13 = 1;
        float f14 = f13 + 20.0f;
        Path.Direction direction = Path.Direction.CCW;
        path2.addRect(20.0f, 20.0f, f14, f14, direction);
        Path.Op op2 = Path.Op.DIFFERENCE;
        path2.op(pathE, op2);
        if (path2.isEmpty()) {
            path2.rewind();
            float f15 = f13 + 17.0f;
            path2.addRect(17.0f, 17.0f, f15, f15, direction);
            path2.op(pathE, op2);
            f12 = path2.isEmpty() ? 1.5f : 1.6f;
        } else {
            f12 = 1.75f;
        }
        m0 m0Var = new m0(this, iWidth, iWidth2, iHeight, iHeight2, i5, i12, i11, i13, f12, pathE, path, f11);
        float[] fArr = {0.0f, 1.0f};
        if (z11) {
            // fill-array-data instruction
            fArr[0] = 1.0f;
            fArr[1] = 0.0f;
            valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr);
        } else {
            valueAnimatorOfFloat = ValueAnimator.ofFloat(fArr);
        }
        valueAnimatorOfFloat.addListener(new o(view, 1));
        valueAnimatorOfFloat.addUpdateListener(new j(1, path, m0Var, view));
        return valueAnimatorOfFloat;
    }

    @Override // fz.r
    public final void d(Canvas canvas, float f11, float f12, float f13, Paint paint) {
        Matrix matrix = this.f56312e;
        matrix.reset();
        float f14 = (f13 * 2.0f) / 100;
        matrix.postScale(f14, f14);
        Path path = this.f56313f;
        path.rewind();
        e().transform(matrix, path);
        path.offset(f11, f12);
        canvas.drawPath(path, paint);
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x004e  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00ad A[Catch: NumberFormatException -> 0x00c0, LOOP:3: B:28:0x0077->B:47:0x00ad, LOOP_END, TryCatch #1 {NumberFormatException -> 0x00c0, blocks: (B:25:0x0060, B:28:0x0077, B:30:0x007d, B:34:0x0089, B:47:0x00ad, B:49:0x00b2, B:54:0x00c6, B:55:0x00c9), top: B:79:0x0060 }] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b2 A[Catch: NumberFormatException -> 0x00c0, TryCatch #1 {NumberFormatException -> 0x00c0, blocks: (B:25:0x0060, B:28:0x0077, B:30:0x007d, B:34:0x0089, B:47:0x00ad, B:49:0x00b2, B:54:0x00c6, B:55:0x00c9), top: B:79:0x0060 }] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x00ee A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x00c6 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00c4 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x00ac A[SYNTHETIC] */
    @Override // fz.r
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Path e() {
        l0[] l0VarArr;
        String strTrim;
        float[] fArrCopyOfRange;
        Path path = new Path();
        String str = this.f56311d;
        if (str == null) {
            l0VarArr = null;
        } else {
            ArrayList arrayList = new ArrayList();
            int i5 = 0;
            int i11 = 1;
            while (i11 < str.length()) {
                while (i11 < str.length()) {
                    char cCharAt = str.charAt(i11);
                    if ((cCharAt - 'Z') * (cCharAt - 'A') > 0) {
                        if ((cCharAt - 'z') * (cCharAt - 'a') > 0) {
                            continue;
                        }
                        i11++;
                    }
                    if (cCharAt == 'e' || cCharAt == 'E') {
                        i11++;
                    } else {
                        strTrim = str.substring(i5, i11).trim();
                        if (strTrim.length() > 0) {
                            if (strTrim.charAt(0) == 'z' || strTrim.charAt(0) == 'Z') {
                                fArrCopyOfRange = new float[0];
                            } else {
                                try {
                                    float[] fArr = new float[strTrim.length()];
                                    int length = strTrim.length();
                                    int i12 = 0;
                                    int i13 = 1;
                                    while (i13 < length) {
                                        boolean z11 = false;
                                        boolean z12 = false;
                                        boolean z13 = false;
                                        boolean z14 = false;
                                        for (int i14 = i13; i14 < strTrim.length(); i14++) {
                                            char cCharAt2 = strTrim.charAt(i14);
                                            if (cCharAt2 == ' ') {
                                                z11 = false;
                                                z13 = true;
                                                if (z13) {
                                                }
                                            } else {
                                                if (cCharAt2 != 'E' && cCharAt2 != 'e') {
                                                    switch (cCharAt2) {
                                                        case ',':
                                                            break;
                                                        case '-':
                                                            if (i14 != i13 && !z11) {
                                                                z11 = false;
                                                                z13 = true;
                                                                z14 = true;
                                                                break;
                                                            }
                                                            z11 = false;
                                                            break;
                                                        case '.':
                                                            if (z12) {
                                                                z11 = false;
                                                                z13 = true;
                                                                z14 = true;
                                                                break;
                                                            } else {
                                                                z11 = false;
                                                                z12 = true;
                                                                break;
                                                            }
                                                        default:
                                                            z11 = false;
                                                            break;
                                                    }
                                                } else {
                                                    z11 = true;
                                                }
                                                if (z13) {
                                                }
                                            }
                                            if (i13 < i14) {
                                                fArr[i12] = Float.parseFloat(strTrim.substring(i13, i14));
                                                i12++;
                                            }
                                            i13 = !z14 ? i14 : i14 + 1;
                                        }
                                        if (i13 < i14) {
                                        }
                                        if (!z14) {
                                        }
                                    }
                                    fArrCopyOfRange = Arrays.copyOfRange(fArr, 0, i12);
                                } catch (NumberFormatException e3) {
                                    throw new RuntimeException(b.c0.l("error in parsing \"", strTrim, "\""), e3);
                                }
                            }
                            char cCharAt3 = strTrim.charAt(0);
                            l0 l0Var = new l0();
                            l0Var.f56296a = cCharAt3;
                            l0Var.f56297b = fArrCopyOfRange;
                            arrayList.add(l0Var);
                        }
                        i5 = i11;
                        i11++;
                    }
                }
                strTrim = str.substring(i5, i11).trim();
                if (strTrim.length() > 0) {
                }
                i5 = i11;
                i11++;
            }
            if (i11 - i5 == 1 && i5 < str.length()) {
                char cCharAt4 = str.charAt(i5);
                l0 l0Var2 = new l0();
                l0Var2.f56296a = cCharAt4;
                l0Var2.f56297b = new float[0];
                arrayList.add(l0Var2);
            }
            l0VarArr = (l0[]) arrayList.toArray(new l0[arrayList.size()]);
        }
        if (l0VarArr != null) {
            try {
                l0.b(l0VarArr, path);
            } catch (RuntimeException e11) {
                throw new RuntimeException(b.c0.k("Error in parsing ", str), e11);
            }
        } else {
            path = null;
        }
        Intrinsics.d(path);
        return path;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!n0.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        Intrinsics.e(obj, "null cannot be cast to non-null type com.teslacoilsw.launcher.icon.PathParserCustomShapePath");
        return Intrinsics.b(this.f56311d, ((n0) obj).f56311d);
    }

    public final int hashCode() {
        return this.f56311d.hashCode();
    }
}
