package defpackage;

import android.animation.ObjectAnimator;
import android.graphics.drawable.AnimationDrawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yv extends d46 {
    public final ObjectAnimator t;
    public final boolean u;

    public yv(AnimationDrawable animationDrawable, boolean z, boolean z2) {
        int numberOfFrames = animationDrawable.getNumberOfFrames();
        int i = z ? numberOfFrames - 1 : 0;
        int i2 = z ? 0 : numberOfFrames - 1;
        zv zvVar = new zv();
        int numberOfFrames2 = animationDrawable.getNumberOfFrames();
        zvVar.b = numberOfFrames2;
        int[] iArr = zvVar.a;
        if (iArr == null || iArr.length < numberOfFrames2) {
            iArr = new int[numberOfFrames2];
            zvVar.a = iArr;
        }
        int i3 = 0;
        for (int i4 = 0; i4 < numberOfFrames2; i4++) {
            int duration = animationDrawable.getDuration(z ? (numberOfFrames2 - i4) - 1 : i4);
            iArr[i4] = duration;
            i3 += duration;
        }
        zvVar.c = i3;
        ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(animationDrawable, "currentIndex", i, i2);
        objectAnimatorOfInt.setAutoCancel(true);
        objectAnimatorOfInt.setDuration(zvVar.c);
        objectAnimatorOfInt.setInterpolator(zvVar);
        this.u = z2;
        this.t = objectAnimatorOfInt;
    }

    @Override // defpackage.d46
    public final void b0() {
        this.t.reverse();
    }

    @Override // defpackage.d46
    public final void e0() {
        this.t.start();
    }

    @Override // defpackage.d46
    public final void f0() {
        this.t.cancel();
    }

    @Override // defpackage.d46
    public final boolean x() {
        return this.u;
    }
}
