package defpackage;

import android.content.ClipboardManager;
import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class um implements bp1 {
    public final Context a;
    public ClipboardManager b;

    public um(Context context) {
        this.a = context;
    }

    public final ClipboardManager a() {
        ClipboardManager clipboardManager = this.b;
        if (clipboardManager != null) {
            return clipboardManager;
        }
        Object systemService = this.a.getSystemService("clipboard");
        systemService.getClass();
        ClipboardManager clipboardManager2 = (ClipboardManager) systemService;
        this.b = clipboardManager2;
        return clipboardManager2;
    }
}
