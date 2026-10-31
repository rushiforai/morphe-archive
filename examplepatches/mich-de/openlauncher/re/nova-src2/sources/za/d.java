package za;

import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Rect;
import android.os.IBinder;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.inputmethod.InputMethodManager;
import com.android.launcher3.logging.StatsLogManager;
import h10.q0;
import mx.j0;
import o9.g3;

/* loaded from: classes.dex */
public interface d {
    static Context N(Context context) {
        if (context instanceof d) {
            return context;
        }
        if (context instanceof py.a) {
            return p(((py.a) context).f83127b);
        }
        if (context instanceof ContextWrapper) {
            return N(((ContextWrapper) context).getBaseContext());
        }
        return null;
    }

    static Context p(Context context) {
        Context contextN = N(context);
        if (contextN != null) {
            return contextN;
        }
        throw new IllegalArgumentException("Cannot find ActivityContext in parent tree");
    }

    tz.d C();

    default x9.t E() {
        return null;
    }

    default Rect H() {
        return P().c();
    }

    /* JADX WARN: Multi-variable type inference failed */
    default StatsLogManager O() {
        return StatsLogManager.b((Context) this);
    }

    j0 P();

    default View.OnClickListener Q() {
        return new q0(3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    default LayoutInflater getLayoutInflater() {
        if (!(this instanceof Context)) {
            return null;
        }
        Context context = (Context) this;
        return LayoutInflater.from(context).cloneInContext(context);
    }

    default void h() {
        j jVarU = u();
        if (jVarU == null) {
            return;
        }
        if (g3.f79852g && Looper.myLooper() == Looper.getMainLooper()) {
            WindowInsetsController windowInsetsController = jVarU.getWindowInsetsController();
            WindowInsets rootWindowInsets = jVarU.getRootWindowInsets();
            boolean z11 = rootWindowInsets != null && rootWindowInsets.isVisible(WindowInsets.Type.ime());
            if (windowInsetsController != null && z11) {
                windowInsetsController.hide(WindowInsets.Type.ime());
                return;
            }
        }
        InputMethodManager inputMethodManager = (InputMethodManager) jVarU.getContext().getSystemService(InputMethodManager.class);
        IBinder windowToken = jVarU.getWindowToken();
        if (inputMethodManager == null || windowToken == null) {
            return;
        }
        ya.j.f97147b.execute(new b80.a(21, inputMethodManager, windowToken));
    }

    default void i(int[] iArr, Rect rect, int i5, int i11) {
    }

    default vm.c j() {
        return new vm.c(29);
    }

    default void k(ga.f fVar) {
    }

    tz.k l();

    default boolean m() {
        return false;
    }

    default boolean n() {
        return true;
    }

    j u();

    default w9.a w(ga.e eVar) {
        return null;
    }

    default View.AccessibilityDelegate z() {
        return null;
    }
}
