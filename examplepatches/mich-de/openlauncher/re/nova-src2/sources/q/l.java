package q;

import android.content.DialogInterface;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;

/* loaded from: classes2.dex */
public final class l implements DialogInterface.OnKeyListener, DialogInterface.OnClickListener, DialogInterface.OnDismissListener, v {

    /* renamed from: a, reason: collision with root package name */
    public c0 f83254a;

    /* renamed from: b, reason: collision with root package name */
    public m.k f83255b;

    /* renamed from: c, reason: collision with root package name */
    public g f83256c;

    @Override // q.v
    public final void b(k kVar, boolean z11) {
        m.k kVar2;
        if ((z11 || kVar == this.f83254a) && (kVar2 = this.f83255b) != null) {
            kVar2.dismiss();
        }
    }

    @Override // q.v
    public final boolean m(k kVar) {
        return false;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i5) {
        c0 c0Var = this.f83254a;
        g gVar = this.f83256c;
        if (gVar.f83224f == null) {
            gVar.f83224f = new f(gVar);
        }
        c0Var.q(gVar.f83224f.getItem(i5), null, 0);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public final void onDismiss(DialogInterface dialogInterface) {
        this.f83256c.b(this.f83254a, true);
    }

    @Override // android.content.DialogInterface.OnKeyListener
    public final boolean onKey(DialogInterface dialogInterface, int i5, KeyEvent keyEvent) {
        Window window;
        View decorView;
        KeyEvent.DispatcherState keyDispatcherState;
        View decorView2;
        KeyEvent.DispatcherState keyDispatcherState2;
        c0 c0Var = this.f83254a;
        if (i5 == 82 || i5 == 4) {
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                Window window2 = this.f83255b.getWindow();
                if (window2 != null && (decorView2 = window2.getDecorView()) != null && (keyDispatcherState2 = decorView2.getKeyDispatcherState()) != null) {
                    keyDispatcherState2.startTracking(keyEvent, this);
                    return true;
                }
            } else if (keyEvent.getAction() == 1 && !keyEvent.isCanceled() && (window = this.f83255b.getWindow()) != null && (decorView = window.getDecorView()) != null && (keyDispatcherState = decorView.getKeyDispatcherState()) != null && keyDispatcherState.isTracking(keyEvent)) {
                c0Var.c(true);
                dialogInterface.dismiss();
                return true;
            }
        }
        return c0Var.performShortcut(i5, keyEvent, 0);
    }
}
