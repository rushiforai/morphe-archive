package defpackage;

import android.graphics.Color;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fo3 {
    public static final int a = Color.argb(230, 255, 255, 255);
    public static final int b = Color.argb(128, 27, 27, 27);
    public static mo3 c;

    public static void a(n1 n1Var, m6d m6dVar, int i) {
        int i2 = 4;
        int i3 = 0;
        m6d m6dVar2 = new m6d(0, 0, new d3d(i2));
        m6d m6dVar3 = (i & 2) != 0 ? new m6d(a, b, new d3d(i2)) : m6dVar;
        View decorView = n1Var.getWindow().getDecorView();
        decorView.getClass();
        mo3 lo3Var = c;
        if (lo3Var == null) {
            int i4 = Build.VERSION.SDK_INT;
            lo3Var = i4 >= 35 ? new lo3() : i4 >= 30 ? new ko3() : i4 >= 29 ? new jo3() : i4 >= 28 ? new io3() : i4 >= 26 ? new ho3() : new go3();
            c = lo3Var;
        }
        mo3 mo3Var = lo3Var;
        ep0 ep0Var = new ep0(mo3Var, m6dVar2, m6dVar3, n1Var, decorView, 2);
        ViewGroup viewGroup = (ViewGroup) decorView;
        while (true) {
            if (i3 >= viewGroup.getChildCount()) {
                eo3 eo3Var = new eo3(ep0Var, viewGroup.getContext());
                eo3Var.setTag(mo3Var);
                eo3Var.setVisibility(8);
                eo3Var.setWillNotDraw(true);
                viewGroup.addView(eo3Var);
                break;
            }
            int i5 = i3 + 1;
            View childAt = viewGroup.getChildAt(i3);
            if (childAt == null) {
                throw new IndexOutOfBoundsException();
            }
            if (childAt.getTag() instanceof mo3) {
                break;
            } else {
                i3 = i5;
            }
        }
        ep0Var.run();
        Window window = n1Var.getWindow();
        window.getClass();
        mo3Var.a(window);
    }
}
