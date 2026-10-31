package a5;

import android.graphics.Rect;
import android.util.Log;
import android.view.WindowInsets;
import androidx.core.graphics.Insets;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;

/* loaded from: classes2.dex */
public final class u1 extends y1 {

    /* renamed from: e, reason: collision with root package name */
    public static Field f370e = null;

    /* renamed from: f, reason: collision with root package name */
    public static boolean f371f = false;

    /* renamed from: g, reason: collision with root package name */
    public static Constructor f372g = null;

    /* renamed from: h, reason: collision with root package name */
    public static boolean f373h = false;

    /* renamed from: c, reason: collision with root package name */
    public WindowInsets f374c;

    /* renamed from: d, reason: collision with root package name */
    public Insets f375d;

    public u1() {
        this.f374c = i();
    }

    private static WindowInsets i() {
        if (!f371f) {
            try {
                f370e = WindowInsets.class.getDeclaredField("CONSUMED");
            } catch (ReflectiveOperationException e3) {
                Log.i("WindowInsetsCompat", "Could not retrieve WindowInsets.CONSUMED field", e3);
            }
            f371f = true;
        }
        Field field = f370e;
        if (field != null) {
            try {
                WindowInsets windowInsets = (WindowInsets) field.get(null);
                if (windowInsets != null) {
                    return new WindowInsets(windowInsets);
                }
            } catch (ReflectiveOperationException e11) {
                Log.i("WindowInsetsCompat", "Could not get value from WindowInsets.CONSUMED field", e11);
            }
        }
        if (!f373h) {
            try {
                f372g = WindowInsets.class.getConstructor(Rect.class);
            } catch (ReflectiveOperationException e12) {
                Log.i("WindowInsetsCompat", "Could not retrieve WindowInsets(Rect) constructor", e12);
            }
            f373h = true;
        }
        Constructor constructor = f372g;
        if (constructor != null) {
            try {
                return (WindowInsets) constructor.newInstance(new Rect());
            } catch (ReflectiveOperationException e13) {
                Log.i("WindowInsetsCompat", "Could not invoke WindowInsets(Rect) constructor", e13);
            }
        }
        return null;
    }

    @Override // a5.y1
    public h2 b() {
        a();
        h2 h2VarG = h2.g(null, this.f374c);
        Insets[] insetsArr = this.f383b;
        f2 f2Var = h2VarG.f296a;
        f2Var.r(insetsArr);
        f2Var.u(this.f375d);
        return h2VarG;
    }

    @Override // a5.y1
    public void e(Insets insets) {
        this.f375d = insets;
    }

    @Override // a5.y1
    public void g(Insets insets) {
        WindowInsets windowInsets = this.f374c;
        if (windowInsets != null) {
            this.f374c = windowInsets.replaceSystemWindowInsets(insets.left, insets.top, insets.right, insets.bottom);
        }
    }

    public u1(h2 h2Var) {
        super(h2Var);
        this.f374c = h2Var.f();
    }
}
