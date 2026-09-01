package defpackage;

import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.FrameLayout;
import androidx.appcompat.widget.ActionBarContextView;
import com.medium.reader.R;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v10 implements yp8, jy7 {
    public final /* synthetic */ f20 a;

    public /* synthetic */ v10(f20 f20Var) {
        this.a = f20Var;
    }

    @Override // defpackage.yp8
    public z4f W(View view, z4f z4fVar) {
        boolean z;
        boolean z2;
        int iD = z4fVar.d();
        f20 f20Var = this.a;
        Context context = f20Var.k;
        int iD2 = z4fVar.d();
        ActionBarContextView actionBarContextView = f20Var.u;
        if (actionBarContextView == null || !(actionBarContextView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) {
            z = false;
        } else {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) f20Var.u.getLayoutParams();
            if (f20Var.u.isShown()) {
                if (f20Var.r0 == null) {
                    f20Var.r0 = new Rect();
                    f20Var.s0 = new Rect();
                }
                Rect rect = f20Var.r0;
                Rect rect2 = f20Var.s0;
                rect.set(z4fVar.b(), z4fVar.d(), z4fVar.c(), z4fVar.a());
                ViewGroup viewGroup = f20Var.A;
                if (Build.VERSION.SDK_INT >= 29) {
                    boolean z3 = bwe.a;
                    zve.a(viewGroup, rect, rect2);
                } else {
                    if (!bwe.a) {
                        bwe.a = true;
                        try {
                            Method declaredMethod = View.class.getDeclaredMethod("computeFitSystemWindows", Rect.class, Rect.class);
                            bwe.b = declaredMethod;
                            if (!declaredMethod.isAccessible()) {
                                bwe.b.setAccessible(true);
                            }
                        } catch (NoSuchMethodException unused) {
                            Log.d("ViewUtils", "Could not find method computeFitSystemWindows. Oh well.");
                        }
                    }
                    Method method = bwe.b;
                    if (method != null) {
                        try {
                            method.invoke(viewGroup, rect, rect2);
                        } catch (Exception e) {
                            Log.d("ViewUtils", "Could not invoke computeFitSystemWindows", e);
                        }
                    }
                }
                int i = rect.top;
                int i2 = rect.left;
                int i3 = rect.right;
                ViewGroup viewGroup2 = f20Var.A;
                WeakHashMap weakHashMap = ute.a;
                z4f z4fVarA = nte.a(viewGroup2);
                int iB = z4fVarA == null ? 0 : z4fVarA.b();
                int iC = z4fVarA == null ? 0 : z4fVarA.c();
                if (marginLayoutParams.topMargin == i && marginLayoutParams.leftMargin == i2 && marginLayoutParams.rightMargin == i3) {
                    z2 = false;
                } else {
                    marginLayoutParams.topMargin = i;
                    marginLayoutParams.leftMargin = i2;
                    marginLayoutParams.rightMargin = i3;
                    z2 = true;
                }
                if (i <= 0 || f20Var.C != null) {
                    View view2 = f20Var.C;
                    if (view2 != null) {
                        ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) view2.getLayoutParams();
                        int i4 = marginLayoutParams2.height;
                        int i5 = marginLayoutParams.topMargin;
                        if (i4 != i5 || marginLayoutParams2.leftMargin != iB || marginLayoutParams2.rightMargin != iC) {
                            marginLayoutParams2.height = i5;
                            marginLayoutParams2.leftMargin = iB;
                            marginLayoutParams2.rightMargin = iC;
                            f20Var.C.setLayoutParams(marginLayoutParams2);
                        }
                    }
                } else {
                    View view3 = new View(context);
                    f20Var.C = view3;
                    view3.setVisibility(8);
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, marginLayoutParams.topMargin, 51);
                    layoutParams.leftMargin = iB;
                    layoutParams.rightMargin = iC;
                    f20Var.A.addView(f20Var.C, -1, layoutParams);
                }
                View view4 = f20Var.C;
                z = view4 != null;
                if (z && view4.getVisibility() != 0) {
                    View view5 = f20Var.C;
                    view5.setBackgroundColor((view5.getWindowSystemUiVisibility() & 8192) != 0 ? context.getColor(R.color.abc_decor_view_status_guard_light) : context.getColor(R.color.abc_decor_view_status_guard));
                }
                if (!f20Var.H && z) {
                    iD2 = 0;
                }
                z = z;
                z = z2;
            } else if (marginLayoutParams.topMargin != 0) {
                marginLayoutParams.topMargin = 0;
                z = false;
            } else {
                z = false;
                z = false;
            }
            if (z) {
                f20Var.u.setLayoutParams(marginLayoutParams);
            }
        }
        View view6 = f20Var.C;
        if (view6 != null) {
            view6.setVisibility(z ? 0 : 8);
        }
        return ute.j(view, iD != iD2 ? z4fVar.f(z4fVar.b(), iD2, z4fVar.c(), z4fVar.a()) : z4fVar);
    }

    @Override // defpackage.jy7
    public void b(lx7 lx7Var, boolean z) {
        this.a.q(lx7Var);
    }

    @Override // defpackage.jy7
    public boolean q(lx7 lx7Var) {
        Window.Callback callback = this.a.l.getCallback();
        if (callback == null) {
            return true;
        }
        callback.onMenuOpened(108, lx7Var);
        return true;
    }
}
