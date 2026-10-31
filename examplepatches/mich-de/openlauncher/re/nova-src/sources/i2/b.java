package i2;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Region;
import androidx.compose.ui.graphics.Canvas;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b implements Canvas {

    /* renamed from: a, reason: collision with root package name */
    public android.graphics.Canvas f61095a = c.f61100a;

    /* renamed from: b, reason: collision with root package name */
    public Rect f61096b;

    /* renamed from: c, reason: collision with root package name */
    public Rect f61097c;

    public final void a(int i5, List list, l0 l0Var) {
        if (list.size() >= 2) {
            Paint paint = (Paint) ((aa.m0) l0Var).f619b;
            int i11 = 0;
            while (i11 < list.size() - 1) {
                long j11 = ((h2.b) list.get(i11)).f59016a;
                long j12 = ((h2.b) list.get(i11 + 1)).f59016a;
                this.f61095a.drawLine(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), Float.intBitsToFloat((int) (j12 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)), paint);
                i11 += i5;
            }
        }
    }

    public final void b(int i5, float[] fArr, l0 l0Var) {
        if (fArr.length < 4 || fArr.length % 2 != 0) {
            return;
        }
        Paint paint = (Paint) ((aa.m0) l0Var).f619b;
        int i11 = 0;
        while (i11 < fArr.length - 3) {
            this.f61095a.drawLine(fArr[i11], fArr[i11 + 1], fArr[i11 + 2], fArr[i11 + 3], paint);
            i11 += i5 * 2;
        }
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: clipPath-mtrdD-E */
    public final void mo12clipPathmtrdDE(n0 n0Var, int i5) {
        android.graphics.Canvas canvas = this.f61095a;
        if (!(n0Var instanceof h)) {
            throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
        }
        canvas.clipPath(((h) n0Var).f61117a, cl.l0.C(i5) ? Region.Op.DIFFERENCE : Region.Op.INTERSECT);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: clipRect-N_I0leg */
    public final void mo13clipRectN_I0leg(float f11, float f12, float f13, float f14, int i5) {
        this.f61095a.clipRect(f11, f12, f13, f14, cl.l0.C(i5) ? Region.Op.DIFFERENCE : Region.Op.INTERSECT);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: concat-58bKbWc */
    public final void mo15concat58bKbWc(float[] fArr) {
        if (r0.k(fArr)) {
            return;
        }
        Matrix matrix = new Matrix();
        r0.n(matrix, fArr);
        this.f61095a.concat(matrix);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void disableZ() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        cl.k0.p(this.f61095a, false);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void drawArc(float f11, float f12, float f13, float f14, float f15, float f16, boolean z11, l0 l0Var) {
        this.f61095a.drawArc(f11, f12, f13, f14, f15, f16, z11, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawCircle-9KIMszo */
    public final void mo16drawCircle9KIMszo(long j11, float f11, l0 l0Var) {
        this.f61095a.drawCircle(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), f11, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawImage-d-4ec7I */
    public final void mo17drawImaged4ec7I(c0 c0Var, long j11, l0 l0Var) {
        this.f61095a.drawBitmap(vh.a.j(c0Var), Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawImageRect-HPBpro0 */
    public final void mo18drawImageRectHPBpro0(c0 c0Var, long j11, long j12, long j13, long j14, l0 l0Var) {
        if (this.f61096b == null) {
            this.f61096b = new Rect();
            this.f61097c = new Rect();
        }
        android.graphics.Canvas canvas = this.f61095a;
        Bitmap bitmapJ = vh.a.j(c0Var);
        Rect rect = this.f61096b;
        Intrinsics.d(rect);
        int i5 = (int) (j11 >> 32);
        rect.left = i5;
        int i11 = (int) (j11 & 4294967295L);
        rect.top = i11;
        rect.right = i5 + ((int) (j12 >> 32));
        rect.bottom = i11 + ((int) (j12 & 4294967295L));
        Unit unit = Unit.f71706a;
        Rect rect2 = this.f61097c;
        Intrinsics.d(rect2);
        int i12 = (int) (j13 >> 32);
        rect2.left = i12;
        int i13 = (int) (j13 & 4294967295L);
        rect2.top = i13;
        rect2.right = i12 + ((int) (j14 >> 32));
        rect2.bottom = i13 + ((int) (j14 & 4294967295L));
        canvas.drawBitmap(bitmapJ, rect, rect2, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawLine-Wko1d7g */
    public final void mo19drawLineWko1d7g(long j11, long j12, l0 l0Var) {
        this.f61095a.drawLine(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), Float.intBitsToFloat((int) (j12 >> 32)), Float.intBitsToFloat((int) (j12 & 4294967295L)), (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void drawOval(float f11, float f12, float f13, float f14, l0 l0Var) {
        this.f61095a.drawOval(f11, f12, f13, f14, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void drawPath(n0 n0Var, l0 l0Var) {
        android.graphics.Canvas canvas = this.f61095a;
        if (!(n0Var instanceof h)) {
            throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
        }
        canvas.drawPath(((h) n0Var).f61117a, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawPoints-O7TthRY */
    public final void mo20drawPointsO7TthRY(int i5, List list, l0 l0Var) {
        if (lb0.b.v(i5, 1)) {
            a(2, list, l0Var);
            return;
        }
        if (lb0.b.v(i5, 2)) {
            a(1, list, l0Var);
            return;
        }
        if (lb0.b.v(i5, 0)) {
            int size = list.size();
            for (int i11 = 0; i11 < size; i11++) {
                long j11 = ((h2.b) list.get(i11)).f59016a;
                this.f61095a.drawPoint(Float.intBitsToFloat((int) (j11 >> 32)), Float.intBitsToFloat((int) (j11 & 4294967295L)), (Paint) ((aa.m0) l0Var).f619b);
            }
        }
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawRawPoints-O7TthRY */
    public final void mo21drawRawPointsO7TthRY(int i5, float[] fArr, l0 l0Var) {
        if (fArr.length % 2 != 0) {
            throw new IllegalArgumentException("points must have an even number of values");
        }
        if (lb0.b.v(i5, 1)) {
            b(2, fArr, l0Var);
            return;
        }
        if (lb0.b.v(i5, 2)) {
            b(1, fArr, l0Var);
            return;
        }
        if (lb0.b.v(i5, 0) && fArr.length % 2 == 0) {
            Paint paint = (Paint) ((aa.m0) l0Var).f619b;
            for (int i11 = 0; i11 < fArr.length - 1; i11 += 2) {
                this.f61095a.drawPoint(fArr[i11], fArr[i11 + 1], paint);
            }
        }
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void drawRect(float f11, float f12, float f13, float f14, l0 l0Var) {
        this.f61095a.drawRect(f11, f12, f13, f14, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void drawRoundRect(float f11, float f12, float f13, float f14, float f15, float f16, l0 l0Var) {
        this.f61095a.drawRoundRect(f11, f12, f13, f14, f15, f16, (Paint) ((aa.m0) l0Var).f619b);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    /* renamed from: drawVertices-TPEHhCM */
    public final void mo22drawVerticesTPEHhCM(z0 z0Var, int i5, l0 l0Var) {
        throw null;
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void enableZ() throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        cl.k0.p(this.f61095a, true);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void restore() {
        this.f61095a.restore();
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void rotate(float f11) {
        this.f61095a.rotate(f11);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void save() {
        this.f61095a.save();
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void saveLayer(h2.c cVar, l0 l0Var) {
        this.f61095a.saveLayer(cVar.f59018a, cVar.f59019b, cVar.f59020c, cVar.f59021d, (Paint) ((aa.m0) l0Var).f619b, 31);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void scale(float f11, float f12) {
        this.f61095a.scale(f11, f12);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void skew(float f11, float f12) {
        this.f61095a.skew(f11, f12);
    }

    @Override // androidx.compose.ui.graphics.Canvas
    public final void translate(float f11, float f12) {
        this.f61095a.translate(f11, f12);
    }
}
