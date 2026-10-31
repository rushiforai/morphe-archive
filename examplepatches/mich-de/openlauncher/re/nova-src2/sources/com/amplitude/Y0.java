package com.amplitude;

import android.graphics.Bitmap;
import android.graphics.BlendMode;
import android.graphics.Canvas;
import android.graphics.DrawFilter;
import android.graphics.Matrix;
import android.graphics.Mesh;
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
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class Y0 extends Canvas {

    /* renamed from: b, reason: collision with root package name */
    public static final Paint f20434b;

    /* renamed from: a, reason: collision with root package name */
    public final Canvas f20435a;

    static {
        Paint paint = new Paint();
        f20434b = paint;
        paint.setColor(-16777216);
    }

    public Y0(Canvas canvas) {
        Intrinsics.g(canvas, "canvas");
        this.f20435a = canvas;
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutPath(Path path) {
        Intrinsics.g(path, "path");
        return this.f20435a.clipOutPath(path);
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(RectF rect) {
        Intrinsics.g(rect, "rect");
        return this.f20435a.clipOutRect(rect);
    }

    @Override // android.graphics.Canvas
    public final boolean clipPath(Path path, Region.Op op2) {
        Intrinsics.g(path, "path");
        Intrinsics.g(op2, "op");
        return this.f20435a.clipPath(path, op2);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(RectF rect, Region.Op op2) {
        Intrinsics.g(rect, "rect");
        Intrinsics.g(op2, "op");
        return this.f20435a.clipRect(rect, op2);
    }

    @Override // android.graphics.Canvas
    public final void concat(Matrix matrix) {
        this.f20435a.concat(matrix);
    }

    @Override // android.graphics.Canvas
    public final void disableZ() {
        this.f20435a.disableZ();
    }

    @Override // android.graphics.Canvas
    public final void drawARGB(int i5, int i11, int i12, int i13) {
        this.f20435a.drawARGB(i5, i11, i12, i13);
    }

    @Override // android.graphics.Canvas
    public final void drawArc(RectF oval, float f11, float f12, boolean z11, Paint paint) {
        Intrinsics.g(oval, "oval");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawArc(oval, f11, f12, z11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, float f11, float f12, Paint paint) {
        Intrinsics.g(bitmap, "bitmap");
        this.f20435a.drawBitmap(bitmap, f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmapMesh(Bitmap bitmap, int i5, int i11, float[] verts, int i12, int[] iArr, int i13, Paint paint) {
        Intrinsics.g(bitmap, "bitmap");
        Intrinsics.g(verts, "verts");
        this.f20435a.drawBitmapMesh(bitmap, i5, i11, verts, i12, iArr, i13, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawCircle(float f11, float f12, float f13, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawCircle(f11, f12, f13, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawColor(int i5) {
        this.f20435a.drawColor(i5);
    }

    @Override // android.graphics.Canvas
    public final void drawDoubleRoundRect(RectF outer, float f11, float f12, RectF inner, float f13, float f14, Paint paint) {
        Intrinsics.g(outer, "outer");
        Intrinsics.g(inner, "inner");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawDoubleRoundRect(outer, f11, f12, inner, f13, f14, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawGlyphs(int[] glyphIds, int i5, float[] positions, int i11, int i12, Font font, Paint paint) {
        Intrinsics.g(glyphIds, "glyphIds");
        Intrinsics.g(positions, "positions");
        Intrinsics.g(font, "font");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawGlyphs(glyphIds, i5, positions, i11, i12, font, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawLine(float f11, float f12, float f13, float f14, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawLine(f11, f12, f13, f14, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawLines(float[] pts, int i5, int i11, Paint paint) {
        Intrinsics.g(pts, "pts");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawLines(pts, i5, i11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawMesh(Mesh mesh, BlendMode blendMode, Paint paint) {
        Intrinsics.g(mesh, "mesh");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawMesh(mesh, blendMode, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawOval(RectF oval, Paint paint) {
        Intrinsics.g(oval, "oval");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawOval(oval, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPaint(Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPaint(paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPatch(NinePatch patch, Rect dst, Paint paint) {
        Intrinsics.g(patch, "patch");
        Intrinsics.g(dst, "dst");
        this.f20435a.drawPatch(patch, dst, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPath(Path path, Paint paint) {
        Intrinsics.g(path, "path");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPath(path, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPicture(Picture picture) {
        Intrinsics.g(picture, "picture");
        this.f20435a.drawPicture(picture);
    }

    @Override // android.graphics.Canvas
    public final void drawPoint(float f11, float f12, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPoint(f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPoints(float[] fArr, int i5, int i11, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPoints(fArr, i5, i11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPosText(char[] text, int i5, int i11, float[] pos, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(pos, "pos");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPosText(V3.a(text), i5, i11, pos, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawRGB(int i5, int i11, int i12) {
        this.f20435a.drawRGB(i5, i11, i12);
    }

    @Override // android.graphics.Canvas
    public final void drawRect(RectF rect, Paint paint) {
        Intrinsics.g(rect, "rect");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawRect(rect, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawRenderNode(RenderNode renderNode) {
        Intrinsics.g(renderNode, "renderNode");
        this.f20435a.drawRenderNode(renderNode);
    }

    @Override // android.graphics.Canvas
    public final void drawRoundRect(RectF rect, float f11, float f12, Paint paint) {
        Intrinsics.g(rect, "rect");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawRoundRect(rect, f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawText(char[] text, int i5, int i11, float f11, float f12, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawText(V3.a(text), i5, i11, f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawTextOnPath(char[] text, int i5, int i11, Path path, float f11, float f12, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(path, "path");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawTextOnPath(V3.a(text), i5, i11, path, f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawTextRun(char[] text, int i5, int i11, int i12, int i13, float f11, float f12, boolean z11, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawTextRun(V3.a(text), i5, i11, i12, i13, f11, f12, z11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawVertices(Canvas.VertexMode mode, int i5, float[] verts, int i11, float[] fArr, int i12, int[] iArr, int i13, short[] sArr, int i14, int i15, Paint paint) {
        Intrinsics.g(mode, "mode");
        Intrinsics.g(verts, "verts");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawVertices(mode, i5, verts, i11, fArr, i12, iArr, i13, sArr, i14, i15, paint);
    }

    @Override // android.graphics.Canvas
    public final void enableZ() {
        this.f20435a.enableZ();
    }

    @Override // android.graphics.Canvas
    public final boolean getClipBounds(Rect bounds) {
        Intrinsics.g(bounds, "bounds");
        return this.f20435a.getClipBounds(bounds);
    }

    @Override // android.graphics.Canvas
    public final int getDensity() {
        return this.f20435a.getDensity();
    }

    @Override // android.graphics.Canvas
    public final DrawFilter getDrawFilter() {
        return this.f20435a.getDrawFilter();
    }

    @Override // android.graphics.Canvas
    public final int getHeight() {
        return this.f20435a.getHeight();
    }

    @Override // android.graphics.Canvas
    public final void getMatrix(Matrix ctm) {
        Intrinsics.g(ctm, "ctm");
        this.f20435a.getMatrix(ctm);
    }

    @Override // android.graphics.Canvas
    public final int getMaximumBitmapHeight() {
        return this.f20435a.getMaximumBitmapHeight();
    }

    @Override // android.graphics.Canvas
    public final int getMaximumBitmapWidth() {
        return this.f20435a.getMaximumBitmapWidth();
    }

    @Override // android.graphics.Canvas
    public final int getSaveCount() {
        return this.f20435a.getSaveCount();
    }

    @Override // android.graphics.Canvas
    public final int getWidth() {
        return this.f20435a.getWidth();
    }

    @Override // android.graphics.Canvas
    public final boolean isHardwareAccelerated() {
        return false;
    }

    @Override // android.graphics.Canvas
    public final boolean isOpaque() {
        return this.f20435a.isOpaque();
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(RectF rect, Canvas.EdgeType type) {
        Intrinsics.g(rect, "rect");
        Intrinsics.g(type, "type");
        return this.f20435a.quickReject(rect, type);
    }

    @Override // android.graphics.Canvas
    public final void restore() {
        this.f20435a.restore();
    }

    @Override // android.graphics.Canvas
    public final void restoreToCount(int i5) {
        this.f20435a.restoreToCount(i5);
    }

    @Override // android.graphics.Canvas
    public final void rotate(float f11) {
        this.f20435a.rotate(f11);
    }

    @Override // android.graphics.Canvas
    public final int save() {
        return this.f20435a.save();
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(RectF rectF, Paint paint, int i5) {
        return this.f20435a.saveLayer(rectF, paint, i5);
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(RectF rectF, int i5, int i11) {
        return this.f20435a.saveLayerAlpha(rectF, i5, i11);
    }

    @Override // android.graphics.Canvas
    public final void scale(float f11, float f12) {
        this.f20435a.scale(f11, f12);
    }

    @Override // android.graphics.Canvas
    public final void setBitmap(Bitmap bitmap) {
        this.f20435a.setBitmap(bitmap);
    }

    @Override // android.graphics.Canvas
    public final void setDensity(int i5) {
        this.f20435a.setDensity(i5);
    }

    @Override // android.graphics.Canvas
    public final void setDrawFilter(DrawFilter drawFilter) {
        this.f20435a.setDrawFilter(drawFilter);
    }

    @Override // android.graphics.Canvas
    public final void setMatrix(Matrix matrix) {
        this.f20435a.setMatrix(matrix);
    }

    @Override // android.graphics.Canvas
    public final void skew(float f11, float f12) {
        this.f20435a.skew(f11, f12);
    }

    @Override // android.graphics.Canvas
    public final void translate(float f11, float f12) {
        this.f20435a.translate(f11, f12);
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(Rect rect) {
        Intrinsics.g(rect, "rect");
        return this.f20435a.clipOutRect(rect);
    }

    @Override // android.graphics.Canvas
    public final boolean clipPath(Path path) {
        Intrinsics.g(path, "path");
        return this.f20435a.clipPath(path);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(Rect rect, Region.Op op2) {
        Intrinsics.g(rect, "rect");
        Intrinsics.g(op2, "op");
        return this.f20435a.clipRect(rect, op2);
    }

    @Override // android.graphics.Canvas
    public final void drawArc(float f11, float f12, float f13, float f14, float f15, float f16, boolean z11, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawArc(f11, f12, f13, f14, f15, f16, z11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, Rect rect, RectF dst, Paint paint) {
        Intrinsics.g(bitmap, "bitmap");
        Intrinsics.g(dst, "dst");
        this.f20435a.drawBitmap(bitmap, rect, dst, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawColor(long j11) {
        this.f20435a.drawColor(j11);
    }

    @Override // android.graphics.Canvas
    public final void drawDoubleRoundRect(RectF outer, float[] outerRadii, RectF inner, float[] innerRadii, Paint paint) {
        Intrinsics.g(outer, "outer");
        Intrinsics.g(outerRadii, "outerRadii");
        Intrinsics.g(inner, "inner");
        Intrinsics.g(innerRadii, "innerRadii");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawDoubleRoundRect(outer, outerRadii, inner, innerRadii, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawLines(float[] pts, Paint paint) {
        Intrinsics.g(pts, "pts");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawLines(pts, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawOval(float f11, float f12, float f13, float f14, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawOval(f11, f12, f13, f14, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPatch(NinePatch patch, RectF dst, Paint paint) {
        Intrinsics.g(patch, "patch");
        Intrinsics.g(dst, "dst");
        this.f20435a.drawPatch(patch, dst, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPicture(Picture picture, RectF dst) {
        Intrinsics.g(picture, "picture");
        Intrinsics.g(dst, "dst");
        this.f20435a.drawPicture(picture, dst);
    }

    @Override // android.graphics.Canvas
    public final void drawPoints(float[] pts, Paint paint) {
        Intrinsics.g(pts, "pts");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPoints(pts, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawPosText(String text, float[] pos, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(pos, "pos");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawPosText(r70.j.D0(text.length(), "*"), pos, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawRect(Rect r11, Paint paint) {
        Intrinsics.g(r11, "r");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawRect(r11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawRoundRect(float f11, float f12, float f13, float f14, float f15, float f16, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawRoundRect(f11, f12, f13, f14, f15, f16, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawText(String text, float f11, float f12, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawText(r70.j.D0(text.length(), "*"), f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawTextOnPath(String text, Path path, float f11, float f12, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(path, "path");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawTextOnPath(r70.j.D0(text.length(), "*"), path, f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(RectF rect) {
        Intrinsics.g(rect, "rect");
        return this.f20435a.quickReject(rect);
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(RectF rectF, Paint paint) {
        return this.f20435a.saveLayer(rectF, paint);
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(RectF rectF, int i5) {
        return this.f20435a.saveLayerAlpha(rectF, i5);
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(float f11, float f12, float f13, float f14) {
        return this.f20435a.clipOutRect(f11, f12, f13, f14);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(RectF rect) {
        Intrinsics.g(rect, "rect");
        return this.f20435a.clipRect(rect);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, Rect rect, Rect dst, Paint paint) {
        Intrinsics.g(bitmap, "bitmap");
        Intrinsics.g(dst, "dst");
        this.f20435a.drawBitmap(bitmap, rect, dst, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawColor(int i5, PorterDuff.Mode mode) {
        Intrinsics.g(mode, "mode");
        this.f20435a.drawColor(i5, mode);
    }

    @Override // android.graphics.Canvas
    public final void drawPicture(Picture picture, Rect dst) {
        Intrinsics.g(picture, "picture");
        Intrinsics.g(dst, "dst");
        this.f20435a.drawPicture(picture, dst);
    }

    @Override // android.graphics.Canvas
    public final void drawRect(float f11, float f12, float f13, float f14, Paint paint) {
        Intrinsics.g(paint, "paint");
        this.f20435a.drawRect(f11, f12, f13, f14, paint);
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(Path path, Canvas.EdgeType type) {
        Intrinsics.g(path, "path");
        Intrinsics.g(type, "type");
        return this.f20435a.quickReject(path, type);
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(float f11, float f12, float f13, float f14, Paint paint, int i5) {
        return this.f20435a.saveLayer(f11, f12, f13, f14, paint, i5);
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(float f11, float f12, float f13, float f14, int i5, int i11) {
        return this.f20435a.saveLayerAlpha(f11, f12, f13, f14, i5, i11);
    }

    @Override // android.graphics.Canvas
    public final boolean clipOutRect(int i5, int i11, int i12, int i13) {
        return this.f20435a.clipOutRect(i5, i11, i12, i13);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(Rect rect) {
        Intrinsics.g(rect, "rect");
        return this.f20435a.clipRect(rect);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(int[] colors, int i5, int i11, float f11, float f12, int i12, int i13, boolean z11, Paint paint) {
        Intrinsics.g(colors, "colors");
        this.f20435a.drawBitmap(colors, i5, i11, f11, f12, i12, i13, z11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawColor(int i5, BlendMode mode) {
        Intrinsics.g(mode, "mode");
        this.f20435a.drawColor(i5, mode);
    }

    @Override // android.graphics.Canvas
    public final void drawTextRun(CharSequence text, int i5, int i11, int i12, int i13, float f11, float f12, boolean z11, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawTextRun(r70.j.D0(text.length(), "*"), i5, i11, i12, i13, f11, f12, z11, paint);
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(Path path) {
        Intrinsics.g(path, "path");
        return this.f20435a.quickReject(path);
    }

    @Override // android.graphics.Canvas
    public final int saveLayer(float f11, float f12, float f13, float f14, Paint paint) {
        return this.f20435a.saveLayer(f11, f12, f13, f14, paint);
    }

    @Override // android.graphics.Canvas
    public final int saveLayerAlpha(float f11, float f12, float f13, float f14, int i5) {
        return this.f20435a.saveLayerAlpha(f11, f12, f13, f14, i5);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(float f11, float f12, float f13, float f14, Region.Op op2) {
        Intrinsics.g(op2, "op");
        return this.f20435a.clipRect(f11, f12, f13, f14, op2);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(int[] colors, int i5, int i11, int i12, int i13, int i14, int i15, boolean z11, Paint paint) {
        Intrinsics.g(colors, "colors");
        this.f20435a.drawBitmap(colors, i5, i11, i12, i13, i14, i15, z11, paint);
    }

    @Override // android.graphics.Canvas
    public final void drawColor(long j11, BlendMode mode) {
        Intrinsics.g(mode, "mode");
        this.f20435a.drawColor(j11, mode);
    }

    @Override // android.graphics.Canvas
    public final void drawText(String text, int i5, int i11, float f11, float f12, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawText(r70.j.D0(text.length(), "*"), i5, i11, f11, f12, paint);
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(float f11, float f12, float f13, float f14, Canvas.EdgeType type) {
        Intrinsics.g(type, "type");
        return this.f20435a.quickReject(f11, f12, f13, f14, type);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(float f11, float f12, float f13, float f14) {
        return this.f20435a.clipRect(f11, f12, f13, f14);
    }

    @Override // android.graphics.Canvas
    public final void drawBitmap(Bitmap bitmap, Matrix matrix, Paint paint) {
        Intrinsics.g(bitmap, "bitmap");
        Intrinsics.g(matrix, "matrix");
        this.f20435a.drawBitmap(bitmap, matrix, paint);
    }

    @Override // android.graphics.Canvas
    public final boolean quickReject(float f11, float f12, float f13, float f14) {
        return this.f20435a.quickReject(f11, f12, f13, f14);
    }

    @Override // android.graphics.Canvas
    public final boolean clipRect(int i5, int i11, int i12, int i13) {
        return this.f20435a.clipRect(i5, i11, i12, i13);
    }

    @Override // android.graphics.Canvas
    public final void drawTextRun(MeasuredText text, int i5, int i11, int i12, int i13, float f11, float f12, boolean z11, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        Rect rect = new Rect();
        text.getBounds(i5, i11, rect);
        this.f20435a.drawRect(rect, f20434b);
    }

    @Override // android.graphics.Canvas
    public final void drawText(CharSequence text, int i5, int i11, float f11, float f12, Paint paint) {
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        this.f20435a.drawText((CharSequence) r70.j.D0(text.length(), "*"), i5, i11, f11, f12, paint);
    }
}
