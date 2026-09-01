package defpackage;

import android.graphics.Rect;
import android.util.Log;
import android.view.WindowInsets;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g4f extends n4f {
    public static Field g = null;
    public static boolean h = false;
    public static Constructor i = null;
    public static boolean j = false;
    public WindowInsets e;
    public b36 f;

    public g4f() {
        this.e = j();
    }

    private static WindowInsets j() {
        if (!h) {
            try {
                g = WindowInsets.class.getDeclaredField("CONSUMED");
            } catch (ReflectiveOperationException e) {
                Log.i("WindowInsetsCompat", "Could not retrieve WindowInsets.CONSUMED field", e);
            }
            h = true;
        }
        Field field = g;
        if (field != null) {
            try {
                WindowInsets windowInsets = (WindowInsets) field.get(null);
                if (windowInsets != null) {
                    return new WindowInsets(windowInsets);
                }
            } catch (ReflectiveOperationException e2) {
                Log.i("WindowInsetsCompat", "Could not get value from WindowInsets.CONSUMED field", e2);
            }
        }
        if (!j) {
            try {
                i = WindowInsets.class.getConstructor(Rect.class);
            } catch (ReflectiveOperationException e3) {
                Log.i("WindowInsetsCompat", "Could not retrieve WindowInsets(Rect) constructor", e3);
            }
            j = true;
        }
        Constructor constructor = i;
        if (constructor != null) {
            try {
                return (WindowInsets) constructor.newInstance(new Rect());
            } catch (ReflectiveOperationException e4) {
                Log.i("WindowInsetsCompat", "Could not invoke WindowInsets(Rect) constructor", e4);
            }
        }
        return null;
    }

    @Override // defpackage.n4f
    public z4f b() {
        a();
        z4f z4fVarH = z4f.h(this.e, null);
        b36[] b36VarArr = this.b;
        w4f w4fVar = z4fVarH.a;
        w4fVar.w(b36VarArr);
        w4fVar.z(this.f);
        w4fVar.v(null);
        w4fVar.B(this.c);
        w4fVar.C(this.d);
        return z4fVarH;
    }

    @Override // defpackage.n4f
    public void f(b36 b36Var) {
        this.f = b36Var;
    }

    @Override // defpackage.n4f
    public void h(b36 b36Var) {
        WindowInsets windowInsets = this.e;
        if (windowInsets != null) {
            this.e = windowInsets.replaceSystemWindowInsets(b36Var.a, b36Var.b, b36Var.c, b36Var.d);
        }
    }

    public g4f(z4f z4fVar) {
        super(z4fVar);
        this.e = z4fVar.g();
    }
}
