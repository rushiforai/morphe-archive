package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ng2 implements g8a {
    public final /* synthetic */ int a;
    public final Object b;

    public /* synthetic */ ng2(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return new m50((Context) ((ng2) obj).b, new tz7(25, false), new uob(24));
            default:
                return obj;
        }
    }
}
