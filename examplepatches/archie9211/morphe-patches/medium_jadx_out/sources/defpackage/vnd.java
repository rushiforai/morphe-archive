package defpackage;

import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vnd extends ViewGroup.MarginLayoutParams {
    public int a;
    public int b;

    public vnd(vnd vndVar) {
        super((ViewGroup.MarginLayoutParams) vndVar);
        this.a = 0;
        this.a = vndVar.a;
    }

    public vnd(ViewGroup.LayoutParams layoutParams) {
        super(layoutParams);
        this.a = 0;
    }
}
