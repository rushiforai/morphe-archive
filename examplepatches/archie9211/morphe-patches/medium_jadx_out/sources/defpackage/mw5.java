package defpackage;

import android.content.Context;
import android.view.LayoutInflater;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mw5 extends ny8 {
    public final LayoutInflater c;
    public final Context d;
    public final ArrayList e = new ArrayList();

    public mw5(LayoutInflater layoutInflater) {
        this.c = layoutInflater;
        this.d = layoutInflater.getContext();
    }

    @Override // defpackage.ny8
    public final int a() {
        return bu1.m1(this.e).size();
    }
}
