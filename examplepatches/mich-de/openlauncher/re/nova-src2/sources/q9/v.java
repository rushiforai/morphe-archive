package q9;

import android.view.View;
import android.view.animation.Interpolator;
import com.android.launcher3.allapps.FloatingHeaderView;
import mx.j0;

/* loaded from: classes.dex */
public interface v {

    /* renamed from: ip, reason: collision with root package name */
    public static final v[] f83896ip = new v[0];

    /* renamed from: a */
    boolean getF46270i();

    void c(int i5, boolean z11);

    Class d();

    boolean e();

    void f(FloatingHeaderView floatingHeaderView, v[] vVarArr, boolean z11);

    void g(j0 j0Var);

    int getExpectedHeight();

    View getFocusedChild();

    default void h(boolean z11, s9.o oVar, Interpolator interpolator, Interpolator interpolator2) {
    }
}
