package n3;

import android.graphics.Bitmap;
import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.DrawFilter;
import android.graphics.Matrix;
import android.graphics.NinePatch;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Picture;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.RenderNode;
import android.graphics.fonts.Font;
import android.graphics.text.MeasuredText;
import androidx.compose.ui.node.LayoutNode;
import cl.k0;
import cl.l0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j extends Canvas {

    /* renamed from: a, reason: collision with root package name */
    public Canvas f77758a;

    @Override // android.graphics.Canvas
    public final boolean clipOutPath(Path path) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return a.a.E(canvas, path);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(RectF rectF) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return a.a.I(canvas, rectF);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipPath(Path path, Region.Op op2) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipPath(path, op2);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(RectF rectF, Region.Op op2) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(rectF, op2);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void concat(Matrix matrix) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.concat(matrix);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void disableZ() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.H(canvas);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawARGB(int i5, int i11, int i12, int i13) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawARGB(i5, i11, i12, i13);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawArc(RectF rectF, float f11, float f12, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawArc(rectF, f11, f12, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmap(bitmap, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawBitmapMesh(Bitmap bitmap, int i5, int i11, float[] fArr, int i12, int[] iArr, int i13, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmapMesh(bitmap, i5, i11, fArr, i12, iArr, i13, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawCircle(float f11, float f12, float f13, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawCircle(f11, f12, f13, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawColor(int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawColor(i5);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawDoubleRoundRect(RectF rectF, float f11, float f12, RectF rectF2, float f13, float f14, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.M(canvas, rectF, f11, f12, rectF2, f13, f14, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawGlyphs(int[] iArr, int i5, float[] fArr, int i11, int i12, Font font, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            l0.z(canvas, iArr, i5, fArr, i11, i12, font, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawLine(float f11, float f12, float f13, float f14, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawLine(f11, f12, f13, f14, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawLines(float[] fArr, int i5, int i11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawLines(fArr, i5, i11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawOval(RectF rectF, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawOval(rectF, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPaint(Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPaint(paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPatch(NinePatch ninePatch, Rect rect, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            l0.A(canvas, ninePatch, rect, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPath(Path path, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPath(path, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPicture(Picture picture) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPicture(picture);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPoint(float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPoint(f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPoints(float[] fArr, int i5, int i11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPoints(fArr, i5, i11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPosText(char[] cArr, int i5, int i11, float[] fArr, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPosText(cArr, i5, i11, fArr, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRGB(int i5, int i11, int i12) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawRGB(i5, i11, i12);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRect(RectF rectF, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawRect(rectF, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRenderNode(RenderNode renderNode) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.O(canvas, renderNode);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRoundRect(RectF rectF, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawRoundRect(rectF, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawText(char[] cArr, int i5, int i11, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawText(cArr, i5, i11, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawTextOnPath(char[] cArr, int i5, int i11, Path path, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawTextOnPath(cArr, i5, i11, path, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawTextRun(char[] cArr, int i5, int i11, int i12, int i13, float f11, float f12, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            zg.a.w(canvas, cArr, i5, i11, i12, i13, f11, f12, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawVertices(Canvas.VertexMode vertexMode, int i5, float[] fArr, int i11, float[] fArr2, int i12, int[] iArr, int i13, short[] sArr, int i14, int i15, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawVertices(vertexMode, i5, fArr, i11, fArr2, i12, iArr, i13, sArr, i14, i15, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void enableZ() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.Q(canvas);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean getClipBounds(Rect rect) {
        Canvas canvas = this.f77758a;
        if (canvas == null) {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
        boolean clipBounds = canvas.getClipBounds(rect);
        if (clipBounds) {
            rect.set(0, 0, rect.width(), LayoutNode.NotPlacedPlaceOrder);
        }
        return clipBounds;
    }

    @Override // android.graphics.Canvas
    public final int getDensity() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getDensity();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final DrawFilter getDrawFilter() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getDrawFilter();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int getHeight() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getHeight();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void getMatrix(Matrix matrix) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.getMatrix(matrix);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final int getMaximumBitmapHeight() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getMaximumBitmapHeight();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int getMaximumBitmapWidth() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getMaximumBitmapWidth();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int getSaveCount() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getSaveCount();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int getWidth() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.getWidth();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean isOpaque() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.isOpaque();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(RectF rectF, Canvas.EdgeType edgeType) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.quickReject(rectF, edgeType);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void restore() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.restore();
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void restoreToCount(int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.restoreToCount(i5);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void rotate(float f11) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.rotate(f11);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final int save() {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.save();
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(RectF rectF, Paint paint, int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayer(rectF, paint, i5);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(RectF rectF, int i5, int i11) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayerAlpha(rectF, i5, i11);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void scale(float f11, float f12) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.scale(f11, f12);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void setBitmap(Bitmap bitmap) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.setBitmap(bitmap);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void setDensity(int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.setDensity(i5);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void setDrawFilter(DrawFilter drawFilter) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.setDrawFilter(drawFilter);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void setMatrix(Matrix matrix) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.setMatrix(matrix);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void skew(float f11, float f12) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.skew(f11, f12);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void translate(float f11, float f12) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.translate(f11, f12);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(Rect rect) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return a.a.H(canvas, rect);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipPath(Path path) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipPath(path);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(Rect rect, Region.Op op2) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(rect, op2);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void drawArc(float f11, float f12, float f13, float f14, float f15, float f16, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawArc(f11, f12, f13, f14, f15, f16, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, Rect rect, RectF rectF, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmap(bitmap, rect, rectF, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawColor(long j11) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.K(canvas, j11);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawLines(float[] fArr, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawLines(fArr, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawOval(float f11, float f12, float f13, float f14, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawOval(f11, f12, f13, f14, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPatch(NinePatch ninePatch, RectF rectF, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            l0.B(canvas, ninePatch, rectF, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPicture(Picture picture, RectF rectF) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPicture(picture, rectF);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPoints(float[] fArr, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPoints(fArr, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPosText(String str, float[] fArr, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPosText(str, fArr, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRect(Rect rect, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawRect(rect, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRoundRect(float f11, float f12, float f13, float f14, float f15, float f16, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawRoundRect(f11, f12, f13, f14, f15, f16, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawText(String str, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawText(str, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawTextOnPath(String str, Path path, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawTextOnPath(str, path, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(RectF rectF) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return k0.M(canvas, rectF);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(RectF rectF, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayer(rectF, paint);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(RectF rectF, int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayerAlpha(rectF, i5);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(float f11, float f12, float f13, float f14) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return a.a.F(canvas, f11, f12, f13, f14);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(RectF rectF) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(rectF);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, Rect rect, Rect rect2, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmap(bitmap, rect, rect2, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawColor(int i5, PorterDuff.Mode mode) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawColor(i5, mode);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawPicture(Picture picture, Rect rect) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawPicture(picture, rect);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawRect(float f11, float f12, float f13, float f14, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawRect(f11, f12, f13, f14, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawText(String str, int i5, int i11, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawText(str, i5, i11, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(Path path, Canvas.EdgeType edgeType) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.quickReject(path, edgeType);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(float f11, float f12, float f13, float f14, Paint paint, int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayer(f11, f12, f13, f14, paint, i5);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(float f11, float f12, float f13, float f14, int i5, int i11) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayerAlpha(f11, f12, f13, f14, i5, i11);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(int i5, int i11, int i12, int i13) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return a.a.G(canvas, i5, i11, i12, i13);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(Rect rect) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(rect);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(int[] iArr, int i5, int i11, float f11, float f12, int i12, int i13, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmap(iArr, i5, i11, f11, f12, i12, i13, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawColor(int i5, BlendMode blendMode) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.J(canvas, i5, blendMode);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawDoubleRoundRect(RectF rectF, float[] fArr, RectF rectF2, float[] fArr2, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.N(canvas, rectF, fArr, rectF2, fArr2, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawText(CharSequence charSequence, int i5, int i11, float f11, float f12, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawText(charSequence, i5, i11, f11, f12, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawTextRun(CharSequence charSequence, int i5, int i11, int i12, int i13, float f11, float f12, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            zg.a.v(canvas, charSequence, i5, i11, i12, i13, f11, f12, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(Path path) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return k0.L(canvas, path);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(float f11, float f12, float f13, float f14, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayer(f11, f12, f13, f14, paint);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(float f11, float f12, float f13, float f14, int i5) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.saveLayerAlpha(f11, f12, f13, f14, i5);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(float f11, float f12, float f13, float f14, Region.Op op2) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(f11, f12, f13, f14, op2);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(int[] iArr, int i5, int i11, int i12, int i13, int i14, int i15, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmap(iArr, i5, i11, i12, i13, i14, i15, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final void drawColor(long j11, BlendMode blendMode) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.L(canvas, j11, blendMode);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(float f11, float f12, float f13, float f14, Canvas.EdgeType edgeType) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.quickReject(f11, f12, f13, f14, edgeType);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(float f11, float f12, float f13, float f14) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(f11, f12, f13, f14);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, Matrix matrix, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            canvas.drawBitmap(bitmap, matrix, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(float f11, float f12, float f13, float f14) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return k0.K(canvas, f11, f12, f13, f14);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(int i5, int i11, int i12, int i13) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            return canvas.clipRect(i5, i11, i12, i13);
        }
        Intrinsics.m("nativeCanvas");
        throw null;
    }

    @Override // android.graphics.Canvas
    public final void drawTextRun(MeasuredText measuredText, int i5, int i11, int i12, int i13, float f11, float f12, boolean z11, Paint paint) {
        Canvas canvas = this.f77758a;
        if (canvas != null) {
            android.support.v4.media.session.b.P(canvas, measuredText, i5, i11, i12, i13, f11, f12, z11, paint);
        } else {
            Intrinsics.m("nativeCanvas");
            throw null;
        }
    }
}
