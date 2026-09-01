package defpackage;

import android.widget.Magnifier;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class na9 extends ke5 {
    @Override // defpackage.ke5, defpackage.la9
    public final void a(float f, long j, long j2) {
        if (!Float.isNaN(f)) {
            ((Magnifier) this.a).setZoom(f);
        }
        long j3 = 9223372034707292159L & j2;
        Magnifier magnifier = (Magnifier) this.a;
        if (j3 != 9205357640488583168L) {
            magnifier.show(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)), Float.intBitsToFloat((int) (j2 >> 32)), Float.intBitsToFloat((int) (j2 & 4294967295L)));
        } else {
            magnifier.show(Float.intBitsToFloat((int) (j >> 32)), Float.intBitsToFloat((int) (j & 4294967295L)));
        }
    }
}
