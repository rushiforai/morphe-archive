package defpackage;

import android.os.Bundle;
import com.medium.android.donkey.push.TrampolineActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class qn5 extends lv5 implements b75 {
    public volatile q6 n;
    public final Object o = new Object();
    public boolean p = false;

    public qn5() {
        addOnContextAvailableListener(new h10((TrampolineActivity) this, 8));
    }

    @Override // defpackage.a75
    public final Object c() {
        return r().c();
    }

    @Override // defpackage.xy1, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        return f49.A(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.lv5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        r().d();
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        r().a();
    }

    public final q6 r() {
        if (this.n == null) {
            synchronized (this.o) {
                try {
                    if (this.n == null) {
                        this.n = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.n;
    }
}
