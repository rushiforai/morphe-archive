package defpackage;

import com.medium.android.donkey.audio.AudioService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class mm5 extends qy6 implements b75 {
    public volatile k0c b;
    public final Object c = new Object();
    public boolean d = false;

    @Override // defpackage.a75
    public final Object c() {
        if (this.b == null) {
            synchronized (this.c) {
                try {
                    if (this.b == null) {
                        this.b = new k0c(this);
                    }
                } finally {
                }
            }
        }
        return this.b.c();
    }

    @Override // defpackage.qy6, android.app.Service
    public void onCreate() {
        if (!this.d) {
            this.d = true;
            ko2 ko2Var = ((go2) ((rb0) c())).a;
            ko2Var.j();
            ((AudioService) this).e = (bud) ko2Var.F.get();
        }
        super.onCreate();
    }
}
