package defpackage;

import android.os.Build;
import android.view.ContextThemeWrapper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.medium.reader.R;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j18 extends bz1 {
    public m45 e;
    public u18 f;
    public long g;
    public final View h;
    public final f18 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j18(m45 m45Var, u18 u18Var, long j, View view, ip6 ip6Var, m73 m73Var, UUID uuid, ou ouVar, sb2 sb2Var) {
        super(new ContextThemeWrapper(view.getContext(), R.style.EdgeToEdgeFloatingDialogWindowTheme), 0);
        boolean z = false;
        this.e = m45Var;
        this.f = u18Var;
        this.g = j;
        this.h = view;
        Window window = getWindow();
        if (window == null) {
            ygf.f("Dialog has no window");
            throw null;
        }
        window.requestFeature(1);
        window.setBackgroundDrawableResource(android.R.color.transparent);
        gr7.B(window, false);
        f18 f18Var = new f18(getContext());
        f18Var.setTag(R.id.compose_view_saveable_id_tag, "Dialog:" + uuid);
        f18Var.setClipChildren(false);
        f18Var.setElevation(m73Var.Z(8.0f));
        f18Var.setOutlineProvider(new vb3(1));
        this.i = f18Var;
        setContentView(f18Var);
        f18Var.setTag(R.id.view_tree_lifecycle_owner, fp7.k(view));
        f18Var.setTag(R.id.view_tree_view_model_store_owner, hp7.z(view));
        f18Var.setTag(R.id.view_tree_saved_state_registry_owner, gp7.k(view));
        d(this.e, this.f, this.g, ip6Var);
        window.getDecorView();
        int i = Build.VERSION.SDK_INT;
        rr7 e5fVar = i >= 35 ? new e5f(window) : i >= 30 ? new c5f(window) : i >= 26 ? new b5f(window) : new a5f(window);
        this.f.getClass();
        long j2 = this.g;
        long j3 = uu1.g;
        e5fVar.C(!ezd.a(j2, j3) && ((double) op8.f0(j2)) <= 0.5d);
        this.f.getClass();
        if (!ezd.a(this.g, j3) && op8.f0(r3) <= 0.5d) {
            z = true;
        }
        e5fVar.B(z);
        iq8 onBackPressedDispatcher = getOnBackPressedDispatcher();
        this.f.getClass();
        onBackPressedDispatcher.a(this, new h18(sb2Var, ouVar, new em4(25, this)));
    }

    public final void d(m45 m45Var, u18 u18Var, long j, ip6 ip6Var) {
        this.e = m45Var;
        this.f = u18Var;
        this.g = j;
        ovb ovbVar = u18Var.a;
        ViewGroup.LayoutParams layoutParams = this.h.getRootView().getLayoutParams();
        WindowManager.LayoutParams layoutParams2 = layoutParams instanceof WindowManager.LayoutParams ? (WindowManager.LayoutParams) layoutParams : null;
        int i = 1;
        boolean z = (layoutParams2 == null || (layoutParams2.flags & 8192) == 0) ? false : true;
        int i2 = oo0.a[ovbVar.ordinal()];
        if (i2 == 1) {
            z = false;
        } else if (i2 == 2) {
            z = true;
        } else if (i2 != 3) {
            ygf.a();
            return;
        }
        Window window = getWindow();
        window.getClass();
        window.setFlags(z ? 8192 : -8193, 8192);
        int i3 = i18.a[ip6Var.ordinal()];
        if (i3 == 1) {
            i = 0;
        } else if (i3 != 2) {
            ygf.a();
            return;
        }
        this.i.setLayoutDirection(i);
        Window window2 = getWindow();
        if (window2 != null) {
            window2.setLayout(-1, -1);
        }
        Window window3 = getWindow();
        if (window3 != null) {
            window3.setSoftInputMode(Build.VERSION.SDK_INT >= 30 ? 48 : 16);
        }
    }

    @Override // android.app.Dialog
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean zOnTouchEvent = super.onTouchEvent(motionEvent);
        if (zOnTouchEvent) {
            this.e.invoke();
        }
        return zOnTouchEvent;
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void cancel() {
    }
}
