package x9;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.util.Log;
import com.android.launcher3.folder.FolderIcon;
import e10.i0;
import e10.y2;
import java.util.concurrent.Callable;
import o9.g3;
import o9.n1;
import y9.y;

/* loaded from: classes2.dex */
public final class s extends com.teslacoilsw.launcher.icon.a {

    /* renamed from: w, reason: collision with root package name */
    public static final Rect f95701w = new Rect();

    /* renamed from: t, reason: collision with root package name */
    public final Drawable f95702t;

    /* renamed from: u, reason: collision with root package name */
    public final Path f95703u;

    /* renamed from: v, reason: collision with root package name */
    public final j7.c f95704v;

    public s(Drawable drawable, Drawable drawable2, Drawable drawable3, Path path) {
        super(drawable, drawable2, ((i0) y2.f51877a.i0().l()).g());
        this.f95702t = drawable3;
        this.f95703u = path;
        this.f95704v = new j7.c(drawable.getConstantState(), drawable2.getConstantState(), drawable3.getConstantState(), path);
    }

    public static s q(final n1 n1Var, final int i5, final Point point) {
        try {
            return (s) ya.j.f97147b.submit(new Callable() { // from class: x9.q
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    final FolderIcon folderIconH0 = n1Var.H0(i5);
                    if (folderIconH0 == null) {
                        return null;
                    }
                    Rect rect = s.f95701w;
                    folderIconH0.O.i();
                    y yVar = folderIconH0.K;
                    int i11 = yVar.o;
                    int i12 = yVar.n;
                    int i13 = yVar.f96986m;
                    rect.set(i12, i11, i12 + i13, i13 + i11);
                    g3.t(1.125f, rect);
                    final y yVar2 = folderIconH0.K;
                    int iWidth = rect.width();
                    Point point2 = point;
                    int i14 = point2.x;
                    int i15 = (i14 - iWidth) / 2;
                    final float f11 = (-rect.left) + i15;
                    final float f12 = (-rect.top) + i15;
                    final int i16 = 2;
                    z9.g gVar = new z9.g(aa.f.a(i14, point2.y, new aa.f() { // from class: x9.r
                        @Override // aa.f
                        public final void b(Canvas canvas) {
                            switch (i16) {
                                case 0:
                                    y yVar3 = (y) folderIconH0;
                                    canvas.save();
                                    canvas.translate(f11, f12);
                                    yVar3.getClass();
                                    yVar3.b(canvas);
                                    yVar3.c(canvas);
                                    canvas.restore();
                                    break;
                                case 1:
                                    y yVar4 = (y) folderIconH0;
                                    canvas.save();
                                    canvas.translate(f11, f12);
                                    yVar4.getClass();
                                    yVar4.c(canvas);
                                    canvas.restore();
                                    break;
                                default:
                                    FolderIcon folderIcon = (FolderIcon) folderIconH0;
                                    canvas.save();
                                    canvas.translate(f11, f12);
                                    folderIcon.O.e(canvas, true);
                                    canvas.restore();
                                    break;
                            }
                        }
                    }));
                    if (!folderIconH0.f21131d0.b()) {
                        final int i17 = 0;
                        z9.g gVar2 = new z9.g(aa.f.a(point2.x, point2.y, new aa.f() { // from class: x9.r
                            @Override // aa.f
                            public final void b(Canvas canvas) {
                                switch (i17) {
                                    case 0:
                                        y yVar3 = (y) yVar2;
                                        canvas.save();
                                        canvas.translate(f11, f12);
                                        yVar3.getClass();
                                        yVar3.b(canvas);
                                        yVar3.c(canvas);
                                        canvas.restore();
                                        break;
                                    case 1:
                                        y yVar4 = (y) yVar2;
                                        canvas.save();
                                        canvas.translate(f11, f12);
                                        yVar4.getClass();
                                        yVar4.c(canvas);
                                        canvas.restore();
                                        break;
                                    default:
                                        FolderIcon folderIcon = (FolderIcon) yVar2;
                                        canvas.save();
                                        canvas.translate(f11, f12);
                                        folderIcon.O.e(canvas, true);
                                        canvas.restore();
                                        break;
                                }
                            }
                        }));
                        Path path = new Path();
                        path.addRect(0.0f, 0.0f, yVar2.h() * 100, yVar2.h() * 100, Path.Direction.CW);
                        return new s(gVar2, gVar, new ColorDrawable(0), path);
                    }
                    final int i18 = 1;
                    z9.g gVar3 = new z9.g(aa.f.a(point2.x, point2.y, new aa.f() { // from class: x9.r
                        @Override // aa.f
                        public final void b(Canvas canvas) {
                            switch (i18) {
                                case 0:
                                    y yVar3 = (y) yVar2;
                                    canvas.save();
                                    canvas.translate(f11, f12);
                                    yVar3.getClass();
                                    yVar3.b(canvas);
                                    yVar3.c(canvas);
                                    canvas.restore();
                                    break;
                                case 1:
                                    y yVar4 = (y) yVar2;
                                    canvas.save();
                                    canvas.translate(f11, f12);
                                    yVar4.getClass();
                                    yVar4.c(canvas);
                                    canvas.restore();
                                    break;
                                default:
                                    FolderIcon folderIcon = (FolderIcon) yVar2;
                                    canvas.save();
                                    canvas.translate(f11, f12);
                                    folderIcon.O.e(canvas, true);
                                    canvas.restore();
                                    break;
                            }
                        }
                    }));
                    Path path2 = new Path();
                    Matrix matrix = new Matrix();
                    matrix.setTranslate(f11, f12);
                    yVar2.e().transform(matrix, path2);
                    return new s(new ColorDrawable(yVar2.d()), gVar, gVar3, path2);
                }
            }).get();
        } catch (Exception e3) {
            Log.e("FolderAdaptiveIcon", "Unable to create folder icon", e3);
            return null;
        }
    }

    @Override // com.teslacoilsw.launcher.icon.a, android.graphics.drawable.Drawable
    public final Drawable.ConstantState getConstantState() {
        return this.f95704v;
    }

    @Override // com.teslacoilsw.launcher.icon.a
    public final Path j() {
        return this.f95703u;
    }

    public final Drawable r() {
        return this.f95702t;
    }
}
