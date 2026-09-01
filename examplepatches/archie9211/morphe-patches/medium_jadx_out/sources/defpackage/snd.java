package defpackage;

import androidx.appcompat.widget.Toolbar;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class snd implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Toolbar b;

    public /* synthetic */ snd(Toolbar toolbar, int i) {
        this.a = i;
        this.b = toolbar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        Toolbar toolbar = this.b;
        switch (i) {
            case 0:
                und undVar = toolbar.L;
                sx7 sx7Var = undVar == null ? null : undVar.b;
                if (sx7Var != null) {
                    sx7Var.collapseActionView();
                }
                break;
            default:
                toolbar.m();
                break;
        }
    }
}
