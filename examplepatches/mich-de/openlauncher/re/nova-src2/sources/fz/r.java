package fz;

import android.animation.Animator;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;
import e10.y2;

/* loaded from: classes.dex */
public abstract class r {

    /* renamed from: a, reason: collision with root package name */
    public static r f56351a = null;

    /* renamed from: b, reason: collision with root package name */
    public static float f56352b = 0.92f;

    /* renamed from: c, reason: collision with root package name */
    public static Path f56353c;

    public static void f() {
        d dVar = (d) y2.f51877a.i().l();
        f56351a = dVar.f56204a;
        f56353c = new Path(dVar.e());
        f56352b = dVar.d();
    }

    public abstract void a(Path path, float f11, float f12, float f13);

    public abstract String b();

    public abstract Animator c(View view, Rect rect, Rect rect2, float f11, boolean z11, boolean z12);

    public abstract void d(Canvas canvas, float f11, float f12, float f13, Paint paint);

    public abstract Path e();
}
