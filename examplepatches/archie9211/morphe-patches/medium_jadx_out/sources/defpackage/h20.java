package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class h20 extends bz1 implements l10 {
    public f20 e;
    public final g20 f;

    /* JADX WARN: Type inference failed for: r2v2, types: [g20] */
    public h20(Context context, int i) {
        int i2;
        if (i == 0) {
            TypedValue typedValue = new TypedValue();
            context.getTheme().resolveAttribute(R.attr.dialogTheme, typedValue, true);
            i2 = typedValue.resourceId;
        } else {
            i2 = i;
        }
        super(context, i2);
        this.f = new ik6() { // from class: g20
            @Override // defpackage.ik6
            public final boolean superDispatchKeyEvent(KeyEvent keyEvent) {
                return this.a.e(keyEvent);
            }
        };
        t10 t10VarD = d();
        if (i == 0) {
            TypedValue typedValue2 = new TypedValue();
            context.getTheme().resolveAttribute(R.attr.dialogTheme, typedValue2, true);
            i = typedValue2.resourceId;
        }
        ((f20) t10VarD).X = i;
        t10VarD.c();
    }

    @Override // defpackage.bz1, android.app.Dialog
    public final void addContentView(View view, ViewGroup.LayoutParams layoutParams) {
        b();
        f20 f20Var = (f20) d();
        f20Var.v();
        ((ViewGroup) f20Var.A.findViewById(android.R.id.content)).addView(view, layoutParams);
        f20Var.m.a(f20Var.l.getCallback());
    }

    public final t10 d() {
        f20 f20Var = this.e;
        if (f20Var != null) {
            return f20Var;
        }
        s10 s10Var = t10.a;
        f20 f20Var2 = new f20(getContext(), getWindow(), this, this);
        this.e = f20Var2;
        return f20Var2;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void dismiss() {
        super.dismiss();
        d().e();
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return g76.U(this.f, getWindow().getDecorView(), this, keyEvent);
    }

    public final boolean e(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.app.Dialog
    public final View findViewById(int i) {
        f20 f20Var = (f20) d();
        f20Var.v();
        return f20Var.l.findViewById(i);
    }

    @Override // android.app.Dialog
    public final void invalidateOptionsMenu() {
        f20 f20Var = (f20) d();
        if (f20Var.n != null) {
            f20Var.A();
            f20Var.n.getClass();
            f20Var.B(0);
        }
    }

    @Override // defpackage.bz1, android.app.Dialog
    public void onCreate(Bundle bundle) {
        d().a();
        super.onCreate(bundle);
        d().c();
    }

    @Override // defpackage.bz1, android.app.Dialog
    public final void onStop() {
        super.onStop();
        f20 f20Var = (f20) d();
        f20Var.A();
        v3f v3fVar = f20Var.n;
        if (v3fVar != null) {
            v3fVar.t = false;
            kve kveVar = v3fVar.s;
            if (kveVar != null) {
                kveVar.a();
            }
        }
    }

    @Override // defpackage.bz1, android.app.Dialog
    public void setContentView(int i) {
        b();
        d().h(i);
    }

    @Override // android.app.Dialog
    public final void setTitle(int i) {
        super.setTitle(i);
        d().l(getContext().getString(i));
    }

    @Override // defpackage.bz1, android.app.Dialog
    public void setContentView(View view) {
        b();
        d().i(view);
    }

    @Override // defpackage.bz1, android.app.Dialog
    public void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        b();
        d().j(view, layoutParams);
    }

    @Override // android.app.Dialog
    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        d().l(charSequence);
    }
}
