package yy;

import android.view.View;
import com.android.launcher3.Workspace;
import o9.s2;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public boolean f97717a = true;

    public abstract void a(s2 s2Var, View view, int i5, float f11);

    public void b(s2 s2Var, View view, int i5, float f11) {
        if (f11 == 0.0f) {
            a(s2Var, view, i5, 0.0f);
            s2Var.e0(view, 1.0f);
        } else {
            if ((s2Var instanceof Workspace) && ((Workspace) s2Var).B0) {
                s2Var.e0(view, 0.0f);
            } else {
                s2Var.e0(view, 1.0f);
            }
            if (view.getTranslationX() != 0.0f) {
                view.setTranslationX(0.0f);
            }
            if (view.getRotationY() != 0.0f) {
                view.setRotationY(0.0f);
            }
            if (view.getRotation() != 0.0f) {
                view.setRotation(0.0f);
            }
            if (view.getScaleX() != 1.0f) {
                view.setScaleX(1.0f);
            }
            if (view.getScaleY() != 1.0f) {
                view.setScaleY(1.0f);
            }
        }
        s2Var.f0(1.0f, i5);
        s2Var.O.delete(i5);
    }
}
