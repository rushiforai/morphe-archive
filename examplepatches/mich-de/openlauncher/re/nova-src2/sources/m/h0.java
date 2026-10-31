package m;

import android.content.Context;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import h6.y0;

/* loaded from: classes2.dex */
public class h0 extends g.q implements n {

    /* renamed from: d, reason: collision with root package name */
    public f0 f75267d;

    /* renamed from: e, reason: collision with root package name */
    public final g0 f75268e;

    /* JADX WARN: Type inference failed for: r2v2, types: [m.g0] */
    public h0(Context context, int i5) {
        int i11;
        if (i5 == 0) {
            TypedValue typedValue = new TypedValue();
            context.getTheme().resolveAttribute(2130969097, typedValue, true);
            i11 = typedValue.resourceId;
        } else {
            i11 = i5;
        }
        super(context, i11);
        this.f75268e = new a5.o() { // from class: m.g0
            @Override // a5.o
            public final boolean superDispatchKeyEvent(KeyEvent keyEvent) {
                return this.f75264a.e(keyEvent);
            }
        };
        s sVarC = c();
        if (i5 == 0) {
            TypedValue typedValue2 = new TypedValue();
            context.getTheme().resolveAttribute(2130969097, typedValue2, true);
            i5 = typedValue2.resourceId;
        }
        ((f0) sVarC).T = i5;
        sVarC.p();
    }

    @Override // g.q, android.app.Dialog
    public final void addContentView(View view, ViewGroup.LayoutParams layoutParams) {
        c().b(view, layoutParams);
    }

    public final s c() {
        if (this.f75267d == null) {
            q qVar = s.f75338a;
            this.f75267d = new f0(getContext(), getWindow(), this, this);
        }
        return this.f75267d;
    }

    public final void d() {
        y0.f(getWindow().getDecorView(), this);
        u90.b.a0(getWindow().getDecorView(), this);
        fg.a.O(getWindow().getDecorView(), this);
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void dismiss() {
        super.dismiss();
        c().q();
    }

    @Override // android.app.Dialog, android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return g90.k.L(this.f75268e, getWindow().getDecorView(), this, keyEvent);
    }

    public final boolean e(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.app.Dialog
    public final View findViewById(int i5) {
        return c().f(i5);
    }

    @Override // android.app.Dialog
    public final void invalidateOptionsMenu() {
        c().m();
    }

    @Override // g.q, android.app.Dialog
    public void onCreate(Bundle bundle) {
        c().l();
        super.onCreate(bundle);
        c().p();
    }

    @Override // g.q, android.app.Dialog
    public final void onStop() {
        super.onStop();
        c().u();
    }

    @Override // m.n
    public final void onSupportActionModeFinished(androidx.appcompat.view.b bVar) {
    }

    @Override // m.n
    public final void onSupportActionModeStarted(androidx.appcompat.view.b bVar) {
    }

    @Override // m.n
    public final androidx.appcompat.view.b onWindowStartingSupportActionMode(androidx.appcompat.view.a aVar) {
        return null;
    }

    @Override // g.q, android.app.Dialog
    public void setContentView(int i5) {
        d();
        c().x(i5);
    }

    @Override // android.app.Dialog
    public void setTitle(CharSequence charSequence) {
        super.setTitle(charSequence);
        c().C(charSequence);
    }

    @Override // g.q, android.app.Dialog
    public void setContentView(View view) {
        d();
        c().y(view);
    }

    @Override // android.app.Dialog
    public final void setTitle(int i5) {
        super.setTitle(i5);
        c().C(getContext().getString(i5));
    }

    @Override // g.q, android.app.Dialog
    public void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        d();
        c().z(view, layoutParams);
    }
}
