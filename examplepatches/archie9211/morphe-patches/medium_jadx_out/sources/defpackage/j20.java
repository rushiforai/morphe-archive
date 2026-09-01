package defpackage;

import android.content.Context;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j20 {
    public static final PorterDuff.Mode b = PorterDuff.Mode.SRC_IN;
    public static j20 c;
    public scb a;

    public static synchronized j20 a() {
        try {
            if (c == null) {
                c();
            }
        } catch (Throwable th) {
            throw th;
        }
        return c;
    }

    public static synchronized void c() {
        if (c == null) {
            j20 j20Var = new j20();
            c = j20Var;
            j20Var.a = scb.d();
            c.a.m(new nig());
        }
    }

    public final synchronized Drawable b(Context context, int i) {
        return this.a.f(context, i);
    }
}
