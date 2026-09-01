package defpackage;

import android.content.Context;
import android.content.ContextWrapper;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class imd extends ContextWrapper {
    public static final Object a = null;

    public static void a(Context context) {
        if (context.getResources() instanceof jmd) {
            return;
        }
        context.getResources();
        int i = dre.a;
    }
}
