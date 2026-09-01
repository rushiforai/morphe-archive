package defpackage;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.MenuItem;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class m15 extends xy1 {
    public boolean c;
    public boolean d;
    public final rz2 a = new rz2(16, new l15(this));
    public final ky6 b = new ky6(this, true);
    public boolean e = true;

    public m15() {
        getSavedStateRegistry().c("android:support:lifecycle", new ny1(2, this));
        final int i = 0;
        addOnConfigurationChangedListener(new t72(this) { // from class: k15
            public final /* synthetic */ m15 b;

            {
                this.b = this;
            }

            @Override // defpackage.t72
            public final void accept(Object obj) {
                int i2 = i;
                m15 m15Var = this.b;
                switch (i2) {
                    case 0:
                        m15Var.a.O();
                        break;
                    default:
                        m15Var.a.O();
                        break;
                }
            }
        });
        final int i2 = 1;
        addOnNewIntentListener(new t72(this) { // from class: k15
            public final /* synthetic */ m15 b;

            {
                this.b = this;
            }

            @Override // defpackage.t72
            public final void accept(Object obj) {
                int i22 = i2;
                m15 m15Var = this.b;
                switch (i22) {
                    case 0:
                        m15Var.a.O();
                        break;
                    default:
                        m15Var.a.O();
                        break;
                }
            }
        });
        addOnContextAvailableListener(new oy1(this, i2));
    }

    public static boolean n(f25 f25Var, vx6 vx6Var) {
        boolean zN = false;
        for (j15 j15Var : f25Var.c.M()) {
            if (j15Var != null) {
                l15 l15Var = j15Var.t;
                if ((l15Var == null ? null : l15Var.z) != null) {
                    zN |= n(j15Var.h(), vx6Var);
                }
                w25 w25Var = j15Var.P;
                if (w25Var != null) {
                    w25Var.b();
                    if (w25Var.e.d.isAtLeast(vx6.STARTED)) {
                        j15Var.P.e.g(vx6Var);
                        zN = true;
                    }
                }
                if (j15Var.O.d.isAtLeast(vx6.STARTED)) {
                    j15Var.O.g(vx6Var);
                    zN = true;
                }
            }
        }
        return zN;
    }

    @Override // android.app.Activity
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        super.dump(str, fileDescriptor, printWriter, strArr);
        if (shouldDumpInternalState(strArr)) {
            printWriter.print(str);
            printWriter.print("Local FragmentActivity ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this)));
            printWriter.println(" State:");
            String str2 = str + "  ";
            printWriter.print(str2);
            printWriter.print("mCreated=");
            printWriter.print(this.c);
            printWriter.print(" mResumed=");
            printWriter.print(this.d);
            printWriter.print(" mStopped=");
            printWriter.print(this.e);
            if (getApplication() != null) {
                new hx4(this, getViewModelStore()).T0(str2, printWriter);
            }
            ((l15) this.a.b).y.v(str, fileDescriptor, printWriter, strArr);
        }
    }

    public final g25 m() {
        return ((l15) this.a.b).y;
    }

    @Override // defpackage.xy1, android.app.Activity
    public void onActivityResult(int i, int i2, Intent intent) {
        this.a.O();
        super.onActivityResult(i, i2, intent);
    }

    @Override // defpackage.xy1, defpackage.wy1, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.b.e(ux6.ON_CREATE);
        g25 g25Var = ((l15) this.a.b).y;
        g25Var.G = false;
        g25Var.H = false;
        g25Var.N.g = false;
        g25Var.t(1);
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory
    public final View onCreateView(String str, Context context, AttributeSet attributeSet) {
        View viewOnCreateView = ((l15) this.a.b).y.f.onCreateView(null, str, context, attributeSet);
        return viewOnCreateView == null ? super.onCreateView(str, context, attributeSet) : viewOnCreateView;
    }

    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        ((l15) this.a.b).y.k();
        this.b.e(ux6.ON_DESTROY);
    }

    @Override // defpackage.xy1, android.app.Activity, android.view.Window.Callback
    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        if (i == 6) {
            return ((l15) this.a.b).y.i();
        }
        return false;
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
        this.d = false;
        ((l15) this.a.b).y.t(5);
        this.b.e(ux6.ON_PAUSE);
    }

    @Override // android.app.Activity
    public void onPostResume() {
        super.onPostResume();
        this.b.e(ux6.ON_RESUME);
        g25 g25Var = ((l15) this.a.b).y;
        g25Var.G = false;
        g25Var.H = false;
        g25Var.N.g = false;
        g25Var.t(7);
    }

    @Override // defpackage.xy1, android.app.Activity
    public final void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        this.a.O();
        super.onRequestPermissionsResult(i, strArr, iArr);
    }

    @Override // android.app.Activity
    public void onResume() {
        rz2 rz2Var = this.a;
        rz2Var.O();
        super.onResume();
        this.d = true;
        ((l15) rz2Var.b).y.y(true);
    }

    @Override // android.app.Activity
    public void onStart() {
        rz2 rz2Var = this.a;
        rz2Var.O();
        l15 l15Var = (l15) rz2Var.b;
        super.onStart();
        this.e = false;
        if (!this.c) {
            this.c = true;
            g25 g25Var = l15Var.y;
            g25Var.G = false;
            g25Var.H = false;
            g25Var.N.g = false;
            g25Var.t(4);
        }
        l15Var.y.y(true);
        this.b.e(ux6.ON_START);
        g25 g25Var2 = l15Var.y;
        g25Var2.G = false;
        g25Var2.H = false;
        g25Var2.N.g = false;
        g25Var2.t(5);
    }

    @Override // android.app.Activity
    public final void onStateNotSaved() {
        this.a.O();
    }

    @Override // android.app.Activity
    public void onStop() {
        super.onStop();
        this.e = true;
        while (n(m(), vx6.CREATED)) {
        }
        g25 g25Var = ((l15) this.a.b).y;
        g25Var.H = true;
        g25Var.N.g = true;
        g25Var.t(4);
        this.b.e(ux6.ON_STOP);
    }

    @Override // android.app.Activity, android.view.LayoutInflater.Factory2
    public final View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View viewOnCreateView = ((l15) this.a.b).y.f.onCreateView(view, str, context, attributeSet);
        return viewOnCreateView == null ? super.onCreateView(view, str, context, attributeSet) : viewOnCreateView;
    }
}
