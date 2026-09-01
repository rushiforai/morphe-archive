package defpackage;

import android.os.Build;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class bwe {
    public static boolean a;
    public static Method b;
    public static final boolean c;

    static {
        c = Build.VERSION.SDK_INT >= 27;
    }
}
