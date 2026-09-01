package defpackage;

import android.content.Intent;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o41 {
    public static final h1c b = new h1c(13);
    public static final HashMap c = new HashMap();
    public final HashMap a = new HashMap();

    public final void a(int i, int i2, Intent intent) {
        m41 m41Var;
        m41 m41Var2 = (m41) this.a.get(Integer.valueOf(i));
        if (m41Var2 != null) {
            m41Var2.a(i2, intent);
            return;
        }
        synchronized (b) {
            m41Var = (m41) c.get(Integer.valueOf(i));
        }
        if (m41Var != null) {
            m41Var.a(i2, intent);
        }
    }
}
