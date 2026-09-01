package defpackage;

import android.view.CollapsibleActionView;
import android.view.View;
import android.widget.FrameLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ux7 extends FrameLayout implements lq1 {
    public final CollapsibleActionView a;

    /* JADX WARN: Multi-variable type inference failed */
    public ux7(View view) {
        super(view.getContext());
        this.a = (CollapsibleActionView) view;
        addView(view);
    }
}
