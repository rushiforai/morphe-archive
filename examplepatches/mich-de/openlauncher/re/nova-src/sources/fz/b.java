package fz;

import android.animation.Animator;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.View;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b extends r {

    /* renamed from: d, reason: collision with root package name */
    public static final b f56180d = new b();

    /* renamed from: e, reason: collision with root package name */
    public static r f56181e;

    @Override // fz.r
    public final void a(Path path, float f11, float f12, float f13) {
        r rVar = f56181e;
        if (rVar != null) {
            rVar.a(path, f11, f12, f13);
        } else {
            Intrinsics.m("shape");
            throw null;
        }
    }

    @Override // fz.r
    public final String b() {
        r rVar = f56181e;
        if (rVar != null) {
            return rVar.b();
        }
        Intrinsics.m("shape");
        throw null;
    }

    @Override // fz.r
    public final Animator c(View view, Rect rect, Rect rect2, float f11, boolean z11, boolean z12) {
        r rVar = f56181e;
        if (rVar != null) {
            return rVar.c(view, rect, rect2, f11, z11, z12);
        }
        Intrinsics.m("shape");
        throw null;
    }

    @Override // fz.r
    public final void d(Canvas canvas, float f11, float f12, float f13, Paint paint) {
        r rVar = f56181e;
        if (rVar != null) {
            rVar.d(canvas, f11, f12, f13, paint);
        } else {
            Intrinsics.m("shape");
            throw null;
        }
    }

    @Override // fz.r
    public final Path e() {
        r rVar = f56181e;
        if (rVar != null) {
            return rVar.e();
        }
        Intrinsics.m("shape");
        throw null;
    }
}
