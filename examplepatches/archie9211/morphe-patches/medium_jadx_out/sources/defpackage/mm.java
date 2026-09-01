package defpackage;

import android.net.http.QuicException;
import android.view.autofill.AutofillManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class mm {
    public static /* bridge */ /* synthetic */ AutofillManager e(Object obj) {
        return (AutofillManager) obj;
    }

    public static /* bridge */ /* synthetic */ Class f() {
        return AutofillManager.class;
    }

    public static /* synthetic */ void g(String str, Object obj, Object obj2, Object obj3) {
        throw new IllegalStateException((str + obj + obj2 + obj3).toString());
    }

    public static /* bridge */ /* synthetic */ boolean h(Object obj) {
        return obj instanceof QuicException;
    }
}
