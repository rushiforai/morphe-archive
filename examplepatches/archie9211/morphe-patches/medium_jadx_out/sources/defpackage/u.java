package defpackage;

import androidx.appcompat.widget.ActionBarContextView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u implements lve {
    public int a;
    public boolean b;
    public final Object c;

    public u(hec hecVar, int i, boolean z) {
        this.c = hecVar;
        this.a = i;
        this.b = z;
    }

    @Override // defpackage.lve
    public void a() {
        this.b = true;
    }

    @Override // defpackage.lve
    public void b() {
        super/*android.view.ViewGroup*/.setVisibility(0);
        this.b = false;
    }

    @Override // defpackage.lve
    public void c() {
        if (this.b) {
            return;
        }
        ActionBarContextView actionBarContextView = (ActionBarContextView) this.c;
        actionBarContextView.f = null;
        super/*android.view.ViewGroup*/.setVisibility(this.a);
    }

    public u(ActionBarContextView actionBarContextView) {
        this.c = actionBarContextView;
        this.b = false;
    }
}
