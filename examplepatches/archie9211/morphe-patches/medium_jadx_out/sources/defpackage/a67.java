package defpackage;

import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class a67 {
    public static final sn3 a = new sn3(0, new ov6(8));

    public static jq8 a(x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        jq8 jq8Var = (jq8) p65Var.j(a);
        Object obj = null;
        if (jq8Var == null) {
            p65Var.Y(1208426157);
            View view = (View) p65Var.j(eo.f);
            view.getClass();
            while (true) {
                if (view == null) {
                    jq8Var = null;
                    break;
                }
                Object tag = view.getTag(R.id.view_tree_on_back_pressed_dispatcher_owner);
                jq8 jq8Var2 = tag instanceof jq8 ? (jq8) tag : null;
                if (jq8Var2 != null) {
                    jq8Var = jq8Var2;
                    break;
                }
                Object objU = ep7.u(view);
                view = objU instanceof View ? (View) objU : null;
            }
        } else {
            p65Var.Y(1208423708);
        }
        p65Var.p(false);
        if (jq8Var != null) {
            p65Var.Y(1208423789);
            p65Var.p(false);
            return jq8Var;
        }
        p65Var.Y(1208428160);
        Context baseContext = (Context) p65Var.j(eo.b);
        while (true) {
            if (!(baseContext instanceof ContextWrapper)) {
                break;
            }
            if (baseContext instanceof jq8) {
                obj = baseContext;
                break;
            }
            baseContext = ((ContextWrapper) baseContext).getBaseContext();
        }
        jq8 jq8Var3 = (jq8) obj;
        p65Var.p(false);
        return jq8Var3;
    }
}
