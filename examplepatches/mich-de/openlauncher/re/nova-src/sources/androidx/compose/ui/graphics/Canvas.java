package androidx.compose.ui.graphics;

import com.google.android.gms.internal.consent_sdk.k0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h2.c;
import i2.c0;
import i2.f;
import i2.l0;
import i2.n0;
import i2.z0;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0088\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0013\n\u0002\u0010\u000b\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\b\u0004\n\u0002\u0010\u0014\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\bf\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H&¢\u0006\u0004\b\u0003\u0010\u0004J\u000f\u0010\u0005\u001a\u00020\u0002H&¢\u0006\u0004\b\u0005\u0010\u0004J\u001f\u0010\n\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b\n\u0010\u000bJ\u001f\u0010\u000f\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\fH&¢\u0006\u0004\b\u000f\u0010\u0010J!\u0010\u0013\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\f2\b\b\u0002\u0010\u0012\u001a\u00020\fH&¢\u0006\u0004\b\u0013\u0010\u0010J\u0017\u0010\u0015\u001a\u00020\u00022\u0006\u0010\u0014\u001a\u00020\fH&¢\u0006\u0004\b\u0015\u0010\u0016J\u001f\u0010\u0017\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\f2\u0006\u0010\u0012\u001a\u00020\fH&¢\u0006\u0004\b\u0017\u0010\u0010J\u001f\u0010\u001a\u001a\u00020\u00022\u0006\u0010\u0018\u001a\u00020\f2\u0006\u0010\u0019\u001a\u00020\fH\u0016¢\u0006\u0004\b\u001a\u0010\u0010J\u0017\u0010\u001f\u001a\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u001bH&¢\u0006\u0004\b\u001d\u0010\u001eJ!\u0010%\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u00062\b\b\u0002\u0010\"\u001a\u00020!H\u0016¢\u0006\u0004\b#\u0010$J9\u0010%\u001a\u00020\u00022\u0006\u0010&\u001a\u00020\f2\u0006\u0010'\u001a\u00020\f2\u0006\u0010(\u001a\u00020\f2\u0006\u0010)\u001a\u00020\f2\b\b\u0002\u0010\"\u001a\u00020!H&¢\u0006\u0004\b*\u0010+J!\u00100\u001a\u00020\u00022\u0006\u0010-\u001a\u00020,2\b\b\u0002\u0010\"\u001a\u00020!H&¢\u0006\u0004\b.\u0010/J'\u00106\u001a\u00020\u00022\u0006\u00102\u001a\u0002012\u0006\u00103\u001a\u0002012\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b4\u00105J\u001f\u00107\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\b7\u0010\u000bJ7\u00107\u001a\u00020\u00022\u0006\u0010&\u001a\u00020\f2\u0006\u0010'\u001a\u00020\f2\u0006\u0010(\u001a\u00020\f2\u0006\u0010)\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b7\u00108JG\u0010;\u001a\u00020\u00022\u0006\u0010&\u001a\u00020\f2\u0006\u0010'\u001a\u00020\f2\u0006\u0010(\u001a\u00020\f2\u0006\u0010)\u001a\u00020\f2\u0006\u00109\u001a\u00020\f2\u0006\u0010:\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b;\u0010<J\u001f\u0010=\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\b=\u0010\u000bJ7\u0010=\u001a\u00020\u00022\u0006\u0010&\u001a\u00020\f2\u0006\u0010'\u001a\u00020\f2\u0006\u0010(\u001a\u00020\f2\u0006\u0010)\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b=\u00108J'\u0010B\u001a\u00020\u00022\u0006\u0010>\u001a\u0002012\u0006\u0010?\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b@\u0010AJ7\u0010G\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u00062\u0006\u0010C\u001a\u00020\f2\u0006\u0010D\u001a\u00020\f2\u0006\u0010F\u001a\u00020E2\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\bG\u0010HJO\u0010G\u001a\u00020\u00022\u0006\u0010&\u001a\u00020\f2\u0006\u0010'\u001a\u00020\f2\u0006\u0010(\u001a\u00020\f2\u0006\u0010)\u001a\u00020\f2\u0006\u0010C\u001a\u00020\f2\u0006\u0010D\u001a\u00020\f2\u0006\u0010F\u001a\u00020E2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\bG\u0010IJ7\u0010L\u001a\u00020\u00022\u0006\u0010 \u001a\u00020\u00062\u0006\u0010J\u001a\u00020\f2\u0006\u0010K\u001a\u00020\f2\u0006\u0010F\u001a\u00020E2\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\bL\u0010HJ\u001f\u0010M\u001a\u00020\u00022\u0006\u0010-\u001a\u00020,2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\bM\u0010NJ'\u0010T\u001a\u00020\u00022\u0006\u0010P\u001a\u00020O2\u0006\u0010Q\u001a\u0002012\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\bR\u0010SJG\u0010]\u001a\u00020\u00022\u0006\u0010P\u001a\u00020O2\b\b\u0002\u0010V\u001a\u00020U2\b\b\u0002\u0010X\u001a\u00020W2\b\b\u0002\u0010Y\u001a\u00020U2\b\b\u0002\u0010Z\u001a\u00020W2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\b[\u0010\\J-\u0010d\u001a\u00020\u00022\u0006\u0010_\u001a\u00020^2\f\u0010a\u001a\b\u0012\u0004\u0012\u0002010`2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\bb\u0010cJ'\u0010h\u001a\u00020\u00022\u0006\u0010_\u001a\u00020^2\u0006\u0010a\u001a\u00020e2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\bf\u0010gJ'\u0010o\u001a\u00020\u00022\u0006\u0010j\u001a\u00020i2\u0006\u0010l\u001a\u00020k2\u0006\u0010\t\u001a\u00020\bH&¢\u0006\u0004\bm\u0010nJ\u000f\u0010p\u001a\u00020\u0002H&¢\u0006\u0004\bp\u0010\u0004J\u000f\u0010q\u001a\u00020\u0002H&¢\u0006\u0004\bq\u0010\u0004ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006rÀ\u0006\u0003"}, d2 = {"Landroidx/compose/ui/graphics/Canvas;", b.f42142b, b.f42142b, ActionCategory.SAVE, "()V", "restore", "Lh2/c;", "bounds", "Li2/l0;", "paint", "saveLayer", "(Lh2/c;Li2/l0;)V", b.f42142b, "dx", "dy", "translate", "(FF)V", "sx", "sy", "scale", "degrees", "rotate", "(F)V", "skew", "sxRad", "syRad", "skewRad", "Li2/h0;", "matrix", "concat-58bKbWc", "([F)V", "concat", "rect", "Lcl/l0;", "clipOp", "clipRect-mtrdD-E", "(Lh2/c;I)V", "clipRect", "left", "top", "right", "bottom", "clipRect-N_I0leg", "(FFFFI)V", "Li2/n0;", "path", "clipPath-mtrdD-E", "(Li2/n0;I)V", "clipPath", "Lh2/b;", "p1", "p2", "drawLine-Wko1d7g", "(JJLi2/l0;)V", "drawLine", "drawRect", "(FFFFLi2/l0;)V", "radiusX", "radiusY", "drawRoundRect", "(FFFFFFLi2/l0;)V", "drawOval", "center", "radius", "drawCircle-9KIMszo", "(JFLi2/l0;)V", "drawCircle", "startAngle", "sweepAngle", b.f42142b, "useCenter", "drawArc", "(Lh2/c;FFZLi2/l0;)V", "(FFFFFFZLi2/l0;)V", "startAngleRad", "sweepAngleRad", "drawArcRad", "drawPath", "(Li2/n0;Li2/l0;)V", "Li2/c0;", "image", "topLeftOffset", "drawImage-d-4ec7I", "(Li2/c0;JLi2/l0;)V", "drawImage", "Ly3/k;", "srcOffset", "Ly3/m;", "srcSize", "dstOffset", "dstSize", "drawImageRect-HPBpro0", "(Li2/c0;JJJJLi2/l0;)V", "drawImageRect", "Llb0/b;", "pointMode", b.f42142b, "points", "drawPoints-O7TthRY", "(ILjava/util/List;Li2/l0;)V", "drawPoints", b.f42142b, "drawRawPoints-O7TthRY", "(I[FLi2/l0;)V", "drawRawPoints", "Li2/z0;", "vertices", "Li2/m;", "blendMode", "drawVertices-TPEHhCM", "(Li2/z0;ILi2/l0;)V", "drawVertices", "enableZ", "disableZ", "ui-graphics_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public interface Canvas {
    /* renamed from: clipPath-mtrdD-E$default, reason: not valid java name */
    static /* synthetic */ void m8clipPathmtrdDE$default(Canvas canvas, n0 n0Var, int i5, int i11, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: clipPath-mtrdD-E");
        }
        if ((i11 & 2) != 0) {
            i5 = 1;
        }
        canvas.mo12clipPathmtrdDE(n0Var, i5);
    }

    /* renamed from: clipRect-N_I0leg$default, reason: not valid java name */
    static /* synthetic */ void m9clipRectN_I0leg$default(Canvas canvas, float f11, float f12, float f13, float f14, int i5, int i11, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: clipRect-N_I0leg");
        }
        if ((i11 & 16) != 0) {
            i5 = 1;
        }
        canvas.mo13clipRectN_I0leg(f11, f12, f13, f14, i5);
    }

    /* renamed from: clipRect-mtrdD-E$default, reason: not valid java name */
    static /* synthetic */ void m10clipRectmtrdDE$default(Canvas canvas, c cVar, int i5, int i11, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: clipRect-mtrdD-E");
        }
        if ((i11 & 2) != 0) {
            i5 = 1;
        }
        canvas.m14clipRectmtrdDE(cVar, i5);
    }

    /* renamed from: drawImageRect-HPBpro0$default, reason: not valid java name */
    static void m11drawImageRectHPBpro0$default(Canvas canvas, c0 c0Var, long j11, long j12, long j13, long j14, l0 l0Var, int i5, Object obj) {
        long jC;
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: drawImageRect-HPBpro0");
        }
        long j15 = (i5 & 2) != 0 ? 0L : j11;
        if ((i5 & 4) != 0) {
            f fVar = (f) c0Var;
            jC = (fVar.c() << 32) | (fVar.b() & 4294967295L);
        } else {
            jC = j12;
        }
        canvas.mo18drawImageRectHPBpro0(c0Var, j15, jC, (i5 & 8) != 0 ? 0L : j13, (i5 & 16) != 0 ? jC : j14, l0Var);
    }

    static /* synthetic */ void scale$default(Canvas canvas, float f11, float f12, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: scale");
        }
        if ((i5 & 2) != 0) {
            f12 = f11;
        }
        canvas.scale(f11, f12);
    }

    /* renamed from: clipPath-mtrdD-E, reason: not valid java name */
    void mo12clipPathmtrdDE(@NotNull n0 path, int clipOp);

    /* renamed from: clipRect-N_I0leg, reason: not valid java name */
    void mo13clipRectN_I0leg(float left, float top, float right, float bottom, int clipOp);

    /* renamed from: clipRect-mtrdD-E, reason: not valid java name */
    default void m14clipRectmtrdDE(@NotNull c rect, int clipOp) {
        mo13clipRectN_I0leg(rect.f59018a, rect.f59019b, rect.f59020c, rect.f59021d, clipOp);
    }

    /* renamed from: concat-58bKbWc, reason: not valid java name */
    void mo15concat58bKbWc(@NotNull float[] matrix);

    void disableZ();

    void drawArc(float left, float top, float right, float bottom, float startAngle, float sweepAngle, boolean useCenter, @NotNull l0 paint);

    default void drawArc(@NotNull c rect, float startAngle, float sweepAngle, boolean useCenter, @NotNull l0 paint) {
        drawArc(rect.f59018a, rect.f59019b, rect.f59020c, rect.f59021d, startAngle, sweepAngle, useCenter, paint);
    }

    default void drawArcRad(@NotNull c rect, float startAngleRad, float sweepAngleRad, boolean useCenter, @NotNull l0 paint) {
        drawArc(rect, k0.j(startAngleRad), k0.j(sweepAngleRad), useCenter, paint);
    }

    /* renamed from: drawCircle-9KIMszo, reason: not valid java name */
    void mo16drawCircle9KIMszo(long center, float radius, @NotNull l0 paint);

    /* renamed from: drawImage-d-4ec7I, reason: not valid java name */
    void mo17drawImaged4ec7I(@NotNull c0 image, long topLeftOffset, @NotNull l0 paint);

    /* renamed from: drawImageRect-HPBpro0, reason: not valid java name */
    void mo18drawImageRectHPBpro0(@NotNull c0 image, long srcOffset, long srcSize, long dstOffset, long dstSize, @NotNull l0 paint);

    /* renamed from: drawLine-Wko1d7g, reason: not valid java name */
    void mo19drawLineWko1d7g(long p12, long p22, @NotNull l0 paint);

    void drawOval(float left, float top, float right, float bottom, @NotNull l0 paint);

    default void drawOval(@NotNull c rect, @NotNull l0 paint) {
        drawOval(rect.f59018a, rect.f59019b, rect.f59020c, rect.f59021d, paint);
    }

    void drawPath(@NotNull n0 path, @NotNull l0 paint);

    /* renamed from: drawPoints-O7TthRY, reason: not valid java name */
    void mo20drawPointsO7TthRY(int pointMode, @NotNull List<h2.b> points, @NotNull l0 paint);

    /* renamed from: drawRawPoints-O7TthRY, reason: not valid java name */
    void mo21drawRawPointsO7TthRY(int pointMode, @NotNull float[] points, @NotNull l0 paint);

    void drawRect(float left, float top, float right, float bottom, @NotNull l0 paint);

    default void drawRect(@NotNull c rect, @NotNull l0 paint) {
        drawRect(rect.f59018a, rect.f59019b, rect.f59020c, rect.f59021d, paint);
    }

    void drawRoundRect(float left, float top, float right, float bottom, float radiusX, float radiusY, @NotNull l0 paint);

    /* renamed from: drawVertices-TPEHhCM, reason: not valid java name */
    void mo22drawVerticesTPEHhCM(@NotNull z0 vertices, int blendMode, @NotNull l0 paint);

    void enableZ();

    void restore();

    void rotate(float degrees);

    void save();

    void saveLayer(@NotNull c bounds, @NotNull l0 paint);

    void scale(float sx2, float sy2);

    void skew(float sx2, float sy2);

    default void skewRad(float sxRad, float syRad) {
        skew(k0.j(sxRad), k0.j(syRad));
    }

    void translate(float dx2, float dy2);
}
