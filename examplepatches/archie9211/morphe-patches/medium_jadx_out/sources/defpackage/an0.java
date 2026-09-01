package defpackage;

import android.util.AttributeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class an0 extends p52 {
    public int h;
    public bn0 i;

    @Override // defpackage.p52
    public final void g(AttributeSet attributeSet) {
        bn0 bn0Var = new bn0();
        this.i = bn0Var;
        this.d = bn0Var;
        j();
    }

    public boolean getAllowsGoneWidget() {
        return this.i.u0;
    }

    public int getMargin() {
        return this.i.v0;
    }

    public int getType() {
        return this.h;
    }

    /* JADX WARN: Removed duplicated region for block: B:5:0x000a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x000e  */
    @Override // defpackage.p52
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void h(defpackage.b72 r5, boolean r6) {
        /*
            r4 = this;
            int r4 = r4.h
            r0 = 0
            r1 = 6
            r2 = 1
            r3 = 5
            if (r6 == 0) goto L10
            if (r4 != r3) goto Lc
        La:
            r4 = r2
            goto L16
        Lc:
            if (r4 != r1) goto L16
        Le:
            r4 = r0
            goto L16
        L10:
            if (r4 != r3) goto L13
            goto Le
        L13:
            if (r4 != r1) goto L16
            goto La
        L16:
            boolean r6 = r5 instanceof defpackage.bn0
            if (r6 == 0) goto L1e
            bn0 r5 = (defpackage.bn0) r5
            r5.t0 = r4
        L1e:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.an0.h(b72, boolean):void");
    }

    public void setAllowsGoneWidget(boolean z) {
        this.i.u0 = z;
    }

    public void setDpMargin(int i) {
        this.i.v0 = (int) ((i * getResources().getDisplayMetrics().density) + 0.5f);
    }

    public void setMargin(int i) {
        this.i.v0 = i;
    }

    public void setType(int i) {
        this.h = i;
    }
}
