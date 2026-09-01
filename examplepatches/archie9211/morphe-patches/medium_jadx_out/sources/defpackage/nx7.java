package defpackage;

import android.content.DialogInterface;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nx7 implements DialogInterface.OnKeyListener, DialogInterface.OnClickListener, DialogInterface.OnDismissListener, jy7 {
    public lx7 a;
    public bd b;
    public y17 c;

    @Override // defpackage.jy7
    public final void b(lx7 lx7Var, boolean z) {
        bd bdVar;
        if ((z || lx7Var == this.a) && (bdVar = this.b) != null) {
            bdVar.dismiss();
        }
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        lx7 lx7Var = this.a;
        y17 y17Var = this.c;
        x17 x17Var = y17Var.f;
        if (x17Var == null) {
            x17Var = new x17(y17Var);
            y17Var.f = x17Var;
        }
        lx7Var.q(x17Var.getItem(i), null, 0);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        this.c.b(this.a, true);
    }

    @Override // android.content.DialogInterface.OnKeyListener
    public final boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
        Window window;
        View decorView;
        KeyEvent.DispatcherState keyDispatcherState;
        View decorView2;
        KeyEvent.DispatcherState keyDispatcherState2;
        lx7 lx7Var = this.a;
        if (i == 82 || i == 4) {
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                Window window2 = this.b.getWindow();
                if (window2 != null && (decorView2 = window2.getDecorView()) != null && (keyDispatcherState2 = decorView2.getKeyDispatcherState()) != null) {
                    keyDispatcherState2.startTracking(keyEvent, this);
                    return true;
                }
            } else if (keyEvent.getAction() == 1 && !keyEvent.isCanceled() && (window = this.b.getWindow()) != null && (decorView = window.getDecorView()) != null && (keyDispatcherState = decorView.getKeyDispatcherState()) != null && keyDispatcherState.isTracking(keyEvent)) {
                lx7Var.c(true);
                dialogInterface.dismiss();
                return true;
            }
        }
        return lx7Var.performShortcut(i, keyEvent, 0);
    }

    @Override // defpackage.jy7
    public final boolean q(lx7 lx7Var) {
        return false;
    }
}
