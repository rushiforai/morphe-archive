package defpackage;

import android.animation.ValueAnimator;
import android.os.Build;
import android.view.Choreographer;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sw {
    public static final ThreadLocal i = new ThreadLocal();
    public final lig e;
    public qw h;
    public final aec a = new aec(0);
    public final ArrayList b = new ArrayList();
    public final zm7 c = new zm7(3, this);
    public final v0 d = new v0(6, this);
    public boolean f = false;
    public float g = 1.0f;

    public sw(lig ligVar) {
        this.e = ligVar;
    }

    public static sw b() {
        ThreadLocal threadLocal = i;
        if (threadLocal.get() == null) {
            threadLocal.set(new sw(new lig()));
        }
        return (sw) threadLocal.get();
    }

    /* JADX WARN: Type inference failed for: r5v3, types: [android.animation.ValueAnimator$DurationScaleChangeListener, pw] */
    public final void a(tlc tlcVar) {
        ArrayList arrayList = this.b;
        if (arrayList.size() == 0) {
            ((Choreographer) this.e.b).postFrameCallback(new rw(0, this.d));
            if (Build.VERSION.SDK_INT >= 33) {
                this.g = ValueAnimator.getDurationScale();
                final qw qwVar = this.h;
                if (qwVar == null) {
                    qwVar = new qw(this);
                    this.h = qwVar;
                }
                if (qwVar.a == null) {
                    ?? r5 = new ValueAnimator.DurationScaleChangeListener() { // from class: pw
                        @Override // android.animation.ValueAnimator.DurationScaleChangeListener
                        public final void onChanged(float f) {
                            qwVar.b.g = f;
                        }
                    };
                    qwVar.a = r5;
                    ValueAnimator.registerDurationScaleChangeListener(r5);
                }
            }
        }
        if (arrayList.contains(tlcVar)) {
            return;
        }
        arrayList.add(tlcVar);
    }
}
