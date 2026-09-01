package defpackage;

import android.os.Bundle;
import com.medium.android.donkey.launcher.LauncherActivity;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import com.medium.android.donkey.susi.SusiActivity;
import com.medium.android.donkey.write.publicationflow.PublicationFlowActivity;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class xm5 extends n1 implements b75 {
    public final /* synthetic */ int l;
    public volatile q6 m;
    public final Object n;
    public boolean o;

    public xm5(int i) {
        this.l = i;
        switch (i) {
            case 1:
                this.n = new Object();
                this.o = false;
                addOnContextAvailableListener(new h10((LauncherActivity) this, 3));
                break;
            case 2:
                this.n = new Object();
                this.o = false;
                addOnContextAvailableListener(new h10((PublicationFlowActivity) this, 6));
                break;
            case 3:
                this.n = new Object();
                this.o = false;
                addOnContextAvailableListener(new h10((SusiActivity) this, 7));
                break;
            default:
                this.n = new Object();
                this.o = false;
                addOnContextAvailableListener(new h10((ImageCarouselActivity) this, 2));
                break;
        }
    }

    private final q6 s() {
        if (this.m == null) {
            synchronized (this.n) {
                try {
                    if (this.m == null) {
                        this.m = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.m;
    }

    private final q6 t() {
        if (this.m == null) {
            synchronized (this.n) {
                try {
                    if (this.m == null) {
                        this.m = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.m;
    }

    private final q6 u() {
        if (this.m == null) {
            synchronized (this.n) {
                try {
                    if (this.m == null) {
                        this.m = new q6(this);
                    }
                } finally {
                }
            }
        }
        return this.m;
    }

    @Override // defpackage.a75
    public final Object c() {
        switch (this.l) {
        }
        return r().c();
    }

    @Override // defpackage.xy1, defpackage.pi5
    public final uue getDefaultViewModelProviderFactory() {
        switch (this.l) {
        }
        return f49.A(this, super.getDefaultViewModelProviderFactory());
    }

    @Override // defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public void onCreate(Bundle bundle) {
        switch (this.l) {
            case 0:
                super.onCreate(bundle);
                r().d();
                break;
            case 1:
                super.onCreate(bundle);
                r().d();
                break;
            case 2:
                super.onCreate(bundle);
                r().d();
                break;
            default:
                super.onCreate(bundle);
                r().d();
                break;
        }
    }

    @Override // defpackage.n1, defpackage.i10, defpackage.m15, android.app.Activity
    public final void onDestroy() {
        switch (this.l) {
            case 0:
                super.onDestroy();
                r().a();
                break;
            case 1:
                super.onDestroy();
                r().a();
                break;
            case 2:
                super.onDestroy();
                r().a();
                break;
            default:
                super.onDestroy();
                r().a();
                break;
        }
    }

    public final q6 r() {
        switch (this.l) {
            case 0:
                return s();
            case 1:
                return t();
            case 2:
                return u();
            default:
                if (this.m == null) {
                    synchronized (this.n) {
                        try {
                            if (this.m == null) {
                                this.m = new q6(this);
                            }
                        } finally {
                        }
                        break;
                    }
                }
                return this.m;
        }
    }
}
