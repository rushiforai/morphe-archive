package defpackage;

import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q19 implements xv5 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ q19(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.xv5
    public final void a(Uri uri) {
        int i = this.a;
        Object obj = this.b;
        uri.getClass();
        switch (i) {
            case 0:
                ((r19) obj).c.f.a(uri);
                break;
            default:
                ((n39) obj).f.a(uri);
                break;
        }
    }

    @Override // defpackage.xv5
    public final void b() {
        int i = this.a;
    }

    private final void c() {
    }

    private final void d() {
    }
}
