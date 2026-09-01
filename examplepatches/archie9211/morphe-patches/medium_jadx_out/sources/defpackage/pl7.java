package defpackage;

import android.content.ComponentName;
import android.content.Context;
import android.os.Build;
import android.util.Log;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pl7 {
    public static final boolean b = Log.isLoggable("MediaBrowserCompat", 3);
    public final nl7 a;

    public pl7(Context context, ComponentName componentName, ing ingVar) {
        if (Build.VERSION.SDK_INT >= 26) {
            this.a = new ol7(context, componentName, ingVar);
        } else {
            this.a = new nl7(context, componentName, ingVar);
        }
    }
}
