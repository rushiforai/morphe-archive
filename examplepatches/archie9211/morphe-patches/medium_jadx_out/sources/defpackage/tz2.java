package defpackage;

import android.content.Context;
import android.content.res.Resources;
import com.google.android.material.internal.It.KLTXZbnQvj;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class tz2 implements j56 {
    public final hx4 a;
    public final w5d b;

    public tz2(Context context, hx4 hx4Var) {
        this.a = hx4Var;
        this.b = new w5d(new nc0(context, 1));
    }

    @Override // defpackage.j56
    public final adb a(nva nvaVar) {
        iq1 iq1VarA = nvaVar.e.a();
        iq1VarA.v("X-Obvious-CID", "android");
        iq1VarA.v("X-Client-Date", String.valueOf(System.currentTimeMillis()));
        iq1VarA.v(KLTXZbnQvj.VlaiClXU, (String) this.b.getValue());
        Locale locale = t40.H(Resources.getSystem().getConfiguration()).a.get(0);
        String language = locale != null ? locale.getLanguage() : null;
        if (language != null) {
            iq1VarA.v("Accept-Language", language);
        }
        Boolean boolB1 = this.a.b1();
        if (g76.L(boolB1, Boolean.TRUE)) {
            iq1VarA.v("Cache-Control", "public, max-age=60");
        } else if (g76.L(boolB1, Boolean.FALSE)) {
            iq1VarA.v("Cache-Control", "public, only-if-cached, max-stale=2419200");
        }
        return nvaVar.b(new kbb(iq1VarA));
    }
}
