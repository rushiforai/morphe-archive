package y9;

import a5.h1;
import android.animation.FloatArrayEvaluator;
import android.animation.ObjectAnimator;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class t {

    /* renamed from: e, reason: collision with root package name */
    public static final jz.b f96956e = new jz.b(8, float[].class, "params");

    /* renamed from: f, reason: collision with root package name */
    public static final z f96957f = new z(0.0f, 0.0f, 0.0f);

    /* renamed from: g, reason: collision with root package name */
    public static final float[] f96958g = new float[3];

    /* renamed from: a, reason: collision with root package name */
    public final ObjectAnimator f96959a;

    /* renamed from: b, reason: collision with root package name */
    public final a0 f96960b;

    /* renamed from: c, reason: collision with root package name */
    public final z f96961c;

    /* renamed from: d, reason: collision with root package name */
    public final float[] f96962d;

    public t(a0 a0Var, z zVar, int i5, int i11, int i12, int i13, int i14, Runnable runnable) {
        this.f96960b = a0Var;
        this.f96961c = zVar;
        zVar.f96996a = i12;
        z zVar2 = f96957f;
        a0Var.c(i12, i13, zVar2);
        float[] fArr = {zVar2.f96999d, zVar2.f96997b, zVar2.f96998c};
        this.f96962d = fArr;
        a0Var.c(i5, i11, zVar2);
        ObjectAnimator objectAnimatorOfObject = ObjectAnimator.ofObject(this, f96956e, new FloatArrayEvaluator(), new float[]{zVar2.f96999d, zVar2.f96997b, zVar2.f96998c}, fArr);
        this.f96959a = objectAnimatorOfObject;
        objectAnimatorOfObject.addListener(new h1(8, runnable, zVar));
        objectAnimatorOfObject.setDuration(i14);
    }

    public final void a() {
        this.f96959a.cancel();
    }

    public final boolean b(t tVar) {
        return Arrays.equals(this.f96962d, tVar.f96962d);
    }

    public final void c() {
        this.f96959a.start();
    }
}
