package defpackage;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class fb3 extends j15 implements DialogInterface.OnCancelListener, DialogInterface.OnDismissListener {
    public boolean A0;
    public Handler m0;
    public boolean v0;
    public Dialog x0;
    public boolean y0;
    public boolean z0;
    public final jn n0 = new jn(3, this);
    public final bb3 o0 = new bb3(this);
    public final cb3 p0 = new cb3(this);
    public int q0 = 0;
    public int r0 = 0;
    public boolean s0 = true;
    public boolean t0 = true;
    public int u0 = -1;
    public final db3 w0 = new db3(this);
    public boolean B0 = false;

    @Override // defpackage.j15
    public void A(Bundle bundle) {
        super.A(bundle);
        this.m0 = new Handler();
        this.t0 = this.x == 0;
        if (bundle != null) {
            this.q0 = bundle.getInt("android:style", 0);
            this.r0 = bundle.getInt("android:theme", 0);
            this.s0 = bundle.getBoolean("android:cancelable", true);
            this.t0 = bundle.getBoolean("android:showsDialog", this.t0);
            this.u0 = bundle.getInt("android:backStackId", -1);
        }
    }

    @Override // defpackage.j15
    public void D() {
        this.E = true;
        Dialog dialog = this.x0;
        if (dialog != null) {
            this.y0 = true;
            dialog.setOnDismissListener(null);
            this.x0.dismiss();
            if (!this.z0) {
                onDismiss(this.x0);
            }
            this.x0 = null;
            this.B0 = false;
        }
    }

    @Override // defpackage.j15
    public final void E() {
        this.E = true;
        if (!this.A0 && !this.z0) {
            this.z0 = true;
        }
        this.Q.i(this.w0);
    }

    @Override // defpackage.j15
    public LayoutInflater F(Bundle bundle) {
        LayoutInflater layoutInflaterF = super.F(bundle);
        boolean z = this.t0;
        if (z && !this.v0) {
            if (z && !this.B0) {
                try {
                    this.v0 = true;
                    Dialog dialogA0 = a0(bundle);
                    this.x0 = dialogA0;
                    if (this.t0) {
                        b0(dialogA0, this.q0);
                        Context contextI = i();
                        if (contextI instanceof Activity) {
                            this.x0.setOwnerActivity((Activity) contextI);
                        }
                        this.x0.setCancelable(this.s0);
                        this.x0.setOnCancelListener(this.o0);
                        this.x0.setOnDismissListener(this.p0);
                        this.B0 = true;
                    } else {
                        this.x0 = null;
                    }
                    this.v0 = false;
                } catch (Throwable th) {
                    this.v0 = false;
                    throw th;
                }
            }
            if (f25.I(2)) {
                Log.d("FragmentManager", "get layout inflater for DialogFragment " + this + " from dialog context");
            }
            Dialog dialog = this.x0;
            if (dialog != null) {
                return layoutInflaterF.cloneInContext(dialog.getContext());
            }
        } else if (f25.I(2)) {
            String str = "getting layout inflater for DialogFragment " + this;
            if (!this.t0) {
                Log.d("FragmentManager", "mShowsDialog = false: ".concat(str));
                return layoutInflaterF;
            }
            Log.d("FragmentManager", "mCreatingDialog = true: ".concat(str));
        }
        return layoutInflaterF;
    }

    @Override // defpackage.j15
    public void J(Bundle bundle) {
        Dialog dialog = this.x0;
        if (dialog != null) {
            Bundle bundleOnSaveInstanceState = dialog.onSaveInstanceState();
            bundleOnSaveInstanceState.putBoolean("android:dialogShowing", false);
            bundle.putBundle("android:savedDialogState", bundleOnSaveInstanceState);
        }
        int i = this.q0;
        if (i != 0) {
            bundle.putInt("android:style", i);
        }
        int i2 = this.r0;
        if (i2 != 0) {
            bundle.putInt("android:theme", i2);
        }
        boolean z = this.s0;
        if (!z) {
            bundle.putBoolean("android:cancelable", z);
        }
        boolean z2 = this.t0;
        if (!z2) {
            bundle.putBoolean("android:showsDialog", z2);
        }
        int i3 = this.u0;
        if (i3 != -1) {
            bundle.putInt("android:backStackId", i3);
        }
    }

    @Override // defpackage.j15
    public final void K() {
        this.E = true;
        Dialog dialog = this.x0;
        if (dialog != null) {
            this.y0 = false;
            dialog.show();
            View decorView = this.x0.getWindow().getDecorView();
            decorView.getClass();
            decorView.setTag(R.id.view_tree_lifecycle_owner, this);
            decorView.setTag(R.id.view_tree_view_model_store_owner, this);
            decorView.setTag(R.id.view_tree_saved_state_registry_owner, this);
        }
    }

    @Override // defpackage.j15
    public final void L() {
        this.E = true;
        Dialog dialog = this.x0;
        if (dialog != null) {
            dialog.hide();
        }
    }

    @Override // defpackage.j15
    public final void N(Bundle bundle) {
        Bundle bundle2;
        this.E = true;
        if (this.x0 == null || bundle == null || (bundle2 = bundle.getBundle("android:savedDialogState")) == null) {
            return;
        }
        this.x0.onRestoreInstanceState(bundle2);
    }

    @Override // defpackage.j15
    public final void O(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle bundle2;
        super.O(layoutInflater, viewGroup, bundle);
        if (this.G != null || this.x0 == null || bundle == null || (bundle2 = bundle.getBundle("android:savedDialogState")) == null) {
            return;
        }
        this.x0.onRestoreInstanceState(bundle2);
    }

    public void Y() {
        Z(false, false);
    }

    public final void Z(boolean z, boolean z2) {
        if (this.z0) {
            return;
        }
        this.z0 = true;
        this.A0 = false;
        Dialog dialog = this.x0;
        if (dialog != null) {
            dialog.setOnDismissListener(null);
            this.x0.dismiss();
            if (!z2) {
                if (Looper.myLooper() == this.m0.getLooper()) {
                    onDismiss(this.x0);
                } else {
                    this.m0.post(this.n0);
                }
            }
        }
        this.y0 = true;
        if (this.u0 >= 0) {
            f25 f25VarM = m();
            int i = this.u0;
            if (i < 0) {
                ay0.e(b09.w(i, "Bad id: "));
                return;
            } else {
                f25VarM.w(new d25(f25VarM, null, i, 1), z);
                this.u0 = -1;
                return;
            }
        }
        km0 km0Var = new km0(m());
        km0Var.p = true;
        f25 f25Var = this.s;
        if (f25Var != null && f25Var != km0Var.q) {
            throw new IllegalStateException("Cannot remove Fragment attached to a different FragmentManager. Fragment " + toString() + " is already attached to a FragmentManager.");
        }
        km0Var.b(new v25(3, this));
        if (z) {
            km0Var.d(true);
        } else {
            km0Var.d(false);
        }
    }

    public Dialog a0(Bundle bundle) {
        if (f25.I(3)) {
            Log.d("FragmentManager", "onCreateDialog called for DialogFragment " + this);
        }
        return new bz1(S(), this.r0);
    }

    public void b0(Dialog dialog, int i) {
        if (i != 1 && i != 2) {
            if (i != 3) {
                return;
            }
            Window window = dialog.getWindow();
            if (window != null) {
                window.addFlags(24);
            }
        }
        dialog.requestWindowFeature(1);
    }

    public void c0(f25 f25Var, String str) {
        this.z0 = false;
        this.A0 = true;
        f25Var.getClass();
        km0 km0Var = new km0(f25Var);
        km0Var.p = true;
        km0Var.e(0, this, str, 1);
        km0Var.d(false);
    }

    @Override // defpackage.j15
    public final gx1 d() {
        return new eb3(this, new d15(this));
    }

    public void onDismiss(DialogInterface dialogInterface) {
        if (this.y0) {
            return;
        }
        if (f25.I(3)) {
            Log.d("FragmentManager", "onDismiss called for DialogFragment " + this);
        }
        Z(true, true);
    }

    @Override // defpackage.j15
    public final void w() {
        this.E = true;
    }

    @Override // defpackage.j15
    public void z(Context context) {
        super.z(context);
        this.Q.e(this.w0);
        if (this.A0) {
            return;
        }
        this.z0 = false;
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
    }
}
