package defpackage;

import android.database.ContentObserver;
import android.net.Uri;
import android.os.Handler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s5f extends ContentObserver {
    public final /* synthetic */ uz0 a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s5f(uz0 uz0Var, Handler handler) {
        super(handler);
        this.a = uz0Var;
    }

    @Override // android.database.ContentObserver
    public final void onChange(boolean z, Uri uri) {
        this.a.e(c1e.a);
    }
}
