package yy;

import android.content.Context;
import android.graphics.Camera;
import android.graphics.Matrix;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import mx.g0;

/* loaded from: classes.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final c f97718a = new c(1);

    /* renamed from: b, reason: collision with root package name */
    public static final c f97719b = new c(2);

    /* renamed from: c, reason: collision with root package name */
    public static final c f97720c = new c(3);

    /* renamed from: d, reason: collision with root package name */
    public static final b f97721d = new b(1);

    /* renamed from: e, reason: collision with root package name */
    public static final b f97722e = new b(2);

    /* renamed from: f, reason: collision with root package name */
    public static final c f97723f;

    /* renamed from: g, reason: collision with root package name */
    public static final c f97724g;

    /* renamed from: h, reason: collision with root package name */
    public static final c f97725h;

    /* renamed from: i, reason: collision with root package name */
    public static final c f97726i;

    /* renamed from: j, reason: collision with root package name */
    public static final a f97727j;

    /* renamed from: k, reason: collision with root package name */
    public static final b f97728k;

    /* renamed from: l, reason: collision with root package name */
    public static final c f97729l;

    /* renamed from: m, reason: collision with root package name */
    public static final a f97730m;
    public static final Matrix n;
    public static final Camera o;

    /* renamed from: p, reason: collision with root package name */
    public static final float[] f97731p;

    static {
        c cVar = new c(4);
        cVar.f97717a = false;
        f97723f = cVar;
        c cVar2 = new c(5);
        cVar2.f97717a = false;
        f97724g = cVar2;
        c cVar3 = new c(6);
        cVar3.f97717a = false;
        f97725h = cVar3;
        c cVar4 = new c(7);
        cVar4.f97717a = false;
        f97726i = cVar4;
        f97727j = new a(0);
        f97728k = new b(0);
        f97729l = new c(0);
        f97730m = new a(1);
        new AccelerateInterpolator(0.9f);
        new DecelerateInterpolator(4.0f);
        n = new Matrix();
        o = new Camera();
        f97731p = new float[2];
    }

    public static float a(float f11, int i5, int i11) {
        Matrix matrix = n;
        matrix.reset();
        Camera camera = o;
        camera.save();
        camera.rotateY(Math.abs(f11));
        camera.getMatrix(matrix);
        camera.restore();
        matrix.preTranslate((-i5) * 0.5f, (-i11) * 0.5f);
        float f12 = i5;
        float f13 = i11;
        matrix.postTranslate(f12 * 0.5f, 0.5f * f13);
        float[] fArr = f97731p;
        fArr[0] = f12;
        fArr[1] = f13;
        matrix.mapPoints(fArr);
        return (f12 - fArr[0]) * (f11 > 0.0f ? 1.0f : -1.0f);
    }

    public static final void b(int i5, View view) {
        Context context = g0.f77088a;
        float f11 = g0.f77092e;
        if (g0.n()) {
            view.setCameraDistance(f11 * 2.0f * i5);
        } else {
            view.setCameraDistance(f11 * f11 * i5);
        }
    }
}
