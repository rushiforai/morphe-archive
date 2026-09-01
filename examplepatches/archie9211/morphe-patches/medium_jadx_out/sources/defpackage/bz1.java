package defpackage;

import android.app.Dialog;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.window.OnBackInvokedDispatcher;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class bz1 extends Dialog implements iy6, jq8, kc8, hpb {
    public ky6 a;
    public final fpb b;
    public final w5d c;
    public final w5d d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bz1(Context context, int i) {
        super(context, i);
        context.getClass();
        this.b = new fpb(new gpb(this, new i5b(14, this)));
        final int i2 = 0;
        this.c = new w5d(new m45(this) { // from class: az1
            public final /* synthetic */ bz1 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i3 = i2;
                bz1 bz1Var = this.b;
                switch (i3) {
                    case 0:
                        df3 df3Var = new df3();
                        bz1Var.getNavigationEventDispatcher().b(df3Var);
                        return df3Var;
                    default:
                        return new iq8(new v0(12, bz1Var));
                }
            }
        });
        final int i3 = 1;
        this.d = new w5d(new m45(this) { // from class: az1
            public final /* synthetic */ bz1 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i32 = i3;
                bz1 bz1Var = this.b;
                switch (i32) {
                    case 0:
                        df3 df3Var = new df3();
                        bz1Var.getNavigationEventDispatcher().b(df3Var);
                        return df3Var;
                    default:
                        return new iq8(new v0(12, bz1Var));
                }
            }
        });
    }

    public static final void c(bz1 bz1Var) {
        super.onBackPressed();
    }

    public final ky6 a() {
        ky6 ky6Var = this.a;
        if (ky6Var != null) {
            return ky6Var;
        }
        ky6 ky6Var2 = new ky6(this, true);
        this.a = ky6Var2;
        return ky6Var2;
    }

    @Override // android.app.Dialog
    public void addContentView(View view, ViewGroup.LayoutParams layoutParams) {
        view.getClass();
        b();
        super.addContentView(view, layoutParams);
    }

    public final void b() {
        Window window = getWindow();
        window.getClass();
        View decorView = window.getDecorView();
        decorView.getClass();
        decorView.setTag(R.id.view_tree_lifecycle_owner, this);
        Window window2 = getWindow();
        window2.getClass();
        View decorView2 = window2.getDecorView();
        decorView2.getClass();
        decorView2.setTag(R.id.view_tree_on_back_pressed_dispatcher_owner, this);
        Window window3 = getWindow();
        window3.getClass();
        View decorView3 = window3.getDecorView();
        decorView3.getClass();
        decorView3.setTag(R.id.view_tree_saved_state_registry_owner, this);
        Window window4 = getWindow();
        window4.getClass();
        View decorView4 = window4.getDecorView();
        decorView4.getClass();
        decorView4.setTag(R.id.view_tree_navigation_event_dispatcher_owner, this);
    }

    @Override // defpackage.iy6
    public final wx6 getLifecycle() {
        return a();
    }

    @Override // defpackage.kc8
    public final jc8 getNavigationEventDispatcher() {
        return getOnBackPressedDispatcher().c().c;
    }

    @Override // defpackage.jq8
    public final iq8 getOnBackPressedDispatcher() {
        return (iq8) this.d.getValue();
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        return this.b.b;
    }

    @Override // android.app.Dialog
    public final void onBackPressed() {
        ((df3) this.c.getValue()).a();
    }

    @Override // android.app.Dialog
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (Build.VERSION.SDK_INT >= 33) {
            iq8 onBackPressedDispatcher = getOnBackPressedDispatcher();
            OnBackInvokedDispatcher onBackInvokedDispatcher = getOnBackInvokedDispatcher();
            onBackInvokedDispatcher.getClass();
            onBackPressedDispatcher.e(onBackInvokedDispatcher);
        }
        this.b.a(bundle);
        a().e(ux6.ON_CREATE);
    }

    @Override // android.app.Dialog
    public final Bundle onSaveInstanceState() {
        Bundle bundleOnSaveInstanceState = super.onSaveInstanceState();
        bundleOnSaveInstanceState.getClass();
        this.b.b(bundleOnSaveInstanceState);
        return bundleOnSaveInstanceState;
    }

    @Override // android.app.Dialog
    public void onStart() {
        super.onStart();
        a().e(ux6.ON_RESUME);
    }

    @Override // android.app.Dialog
    public void onStop() {
        a().e(ux6.ON_DESTROY);
        this.a = null;
        super.onStop();
    }

    @Override // android.app.Dialog
    public void setContentView(View view) {
        view.getClass();
        b();
        super.setContentView(view);
    }

    @Override // android.app.Dialog
    public void setContentView(int i) {
        b();
        super.setContentView(i);
    }

    @Override // android.app.Dialog
    public void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        view.getClass();
        b();
        super.setContentView(view, layoutParams);
    }
}
