package defpackage;

import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.medium.reader.R;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xb3 extends bz1 {
    public m45 e;
    public pb3 f;
    public final View g;
    public final mb3 h;
    public boolean i;

    public xb3(m45 m45Var, pb3 pb3Var, View view, ip6 ip6Var, m73 m73Var, UUID uuid) {
        super(new ContextThemeWrapper(view.getContext(), R.style.DialogWindowTheme), 0);
        this.e = m45Var;
        this.f = pb3Var;
        this.g = view;
        Window window = getWindow();
        if (window == null) {
            ygf.f("Dialog has no window");
            throw null;
        }
        pb3 pb3Var2 = this.f;
        Window window2 = getWindow();
        if (window2 != null) {
            WindowManager.LayoutParams attributes = window2.getAttributes();
            pb3Var2.getClass();
            attributes.type = 2;
            window2.setAttributes(attributes);
        }
        int i = 1;
        window.requestFeature(1);
        window.setBackgroundDrawableResource(android.R.color.transparent);
        this.f.getClass();
        gr7.B(window, true);
        window.setGravity(17);
        this.f.getClass();
        mb3 mb3Var = new mb3(getContext(), window);
        this.f.getClass();
        setTitle("");
        mb3Var.setTag(R.id.compose_view_saveable_id_tag, "Dialog:" + uuid);
        mb3Var.setClipChildren(false);
        mb3Var.setElevation(m73Var.Z(8.0f));
        mb3Var.setOutlineProvider(new vb3(0));
        this.h = mb3Var;
        View decorView = window.getDecorView();
        ViewGroup viewGroup = decorView instanceof ViewGroup ? (ViewGroup) decorView : null;
        if (viewGroup != null) {
            d(viewGroup);
        }
        setContentView(mb3Var);
        mb3Var.setTag(R.id.view_tree_lifecycle_owner, fp7.k(view));
        mb3Var.setTag(R.id.view_tree_view_model_store_owner, hp7.z(view));
        mb3Var.setTag(R.id.view_tree_saved_state_registry_owner, gp7.k(view));
        e(this.e, this.f, ip6Var);
        yo7.n(getOnBackPressedDispatcher(), this, new uo(this, i));
    }

    public static final void d(ViewGroup viewGroup) {
        viewGroup.setClipChildren(false);
        if (viewGroup instanceof mb3) {
            return;
        }
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            ViewGroup viewGroup2 = childAt instanceof ViewGroup ? (ViewGroup) childAt : null;
            if (viewGroup2 != null) {
                d(viewGroup2);
            }
        }
    }

    public final void e(m45 m45Var, pb3 pb3Var, ip6 ip6Var) {
        int i;
        this.e = m45Var;
        this.f = pb3Var;
        ovb ovbVar = pb3Var.c;
        boolean zB = tr.b(this.g);
        int i2 = pvb.a[ovbVar.ordinal()];
        if (i2 == 1) {
            zB = false;
        } else if (i2 == 2) {
            zB = true;
        } else if (i2 != 3) {
            ygf.a();
            return;
        }
        Window window = getWindow();
        window.getClass();
        window.setFlags(zB ? 8192 : -8193, 8192);
        int i3 = wb3.a[ip6Var.ordinal()];
        if (i3 == 1) {
            i = 0;
        } else {
            if (i3 != 2) {
                ygf.a();
                return;
            }
            i = 1;
        }
        mb3 mb3Var = this.h;
        mb3Var.setLayoutDirection(i);
        Window window2 = mb3Var.j;
        boolean z = (mb3Var.n && true == mb3Var.l && true == mb3Var.m) ? false : true;
        mb3Var.l = true;
        mb3Var.m = true;
        if (z && (-2 != window2.getAttributes().width || !mb3Var.n)) {
            window2.setLayout(-2, -2);
            mb3Var.n = true;
        }
        setCanceledOnTouchOutside(pb3Var.b);
        Window window3 = getWindow();
        if (window3 != null) {
            window3.setSoftInputMode(0);
        }
    }

    @Override // android.app.Dialog, android.view.KeyEvent.Callback
    public final boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (!this.f.a || !keyEvent.isTracking() || keyEvent.isCanceled() || i != 111) {
            return super.onKeyUp(i, keyEvent);
        }
        this.e.invoke();
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0086  */
    @Override // android.app.Dialog
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onTouchEvent(android.view.MotionEvent r10) {
        /*
            r9 = this;
            boolean r0 = super.onTouchEvent(r10)
            pb3 r1 = r9.f
            boolean r1 = r1.b
            r2 = 3
            r3 = 0
            r4 = 1
            if (r1 == 0) goto L86
            mb3 r1 = r9.h
            r1.getClass()
            float r5 = r10.getX()
            float r5 = java.lang.Math.abs(r5)
            r6 = 2139095039(0x7f7fffff, float:3.4028235E38)
            int r5 = (r5 > r6 ? 1 : (r5 == r6 ? 0 : -1))
            if (r5 > 0) goto L69
            float r5 = r10.getY()
            float r5 = java.lang.Math.abs(r5)
            int r5 = (r5 > r6 ? 1 : (r5 == r6 ? 0 : -1))
            if (r5 > 0) goto L69
            android.view.View r5 = r1.getChildAt(r3)
            if (r5 != 0) goto L34
            goto L69
        L34:
            int r6 = r1.getLeft()
            int r7 = r5.getLeft()
            int r7 = r7 + r6
            int r6 = r5.getWidth()
            int r6 = r6 + r7
            int r1 = r1.getTop()
            int r8 = r5.getTop()
            int r8 = r8 + r1
            int r1 = r5.getHeight()
            int r1 = r1 + r8
            float r5 = r10.getX()
            int r5 = defpackage.nk7.w0(r5)
            if (r7 > r5) goto L69
            if (r5 > r6) goto L69
            float r5 = r10.getY()
            int r5 = defpackage.nk7.w0(r5)
            if (r8 > r5) goto L69
            if (r5 > r1) goto L69
            goto L86
        L69:
            int r10 = r10.getActionMasked()
            if (r10 == 0) goto L83
            if (r10 == r4) goto L77
            if (r10 == r2) goto L74
            goto L90
        L74:
            r9.i = r3
            return r0
        L77:
            boolean r10 = r9.i
            if (r10 == 0) goto L90
            m45 r10 = r9.e
            r10.invoke()
            r9.i = r3
            return r4
        L83:
            r9.i = r4
            return r4
        L86:
            int r10 = r10.getActionMasked()
            if (r10 == 0) goto L91
            if (r10 == r4) goto L91
            if (r10 == r2) goto L91
        L90:
            return r0
        L91:
            r9.i = r3
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xb3.onTouchEvent(android.view.MotionEvent):boolean");
    }

    @Override // android.app.Dialog, android.content.DialogInterface
    public final void cancel() {
    }
}
