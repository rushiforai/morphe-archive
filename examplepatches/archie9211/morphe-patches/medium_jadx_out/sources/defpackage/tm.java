package defpackage;

import android.content.ClipData;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tm implements ap1 {
    public final um a;

    public tm(um umVar) {
        this.a = umVar;
    }

    public final void a(zo1 zo1Var) {
        um umVar = this.a;
        if (zo1Var != null) {
            umVar.a().setPrimaryClip(zo1Var.a);
        } else if (Build.VERSION.SDK_INT >= 28) {
            uy.c(umVar.a());
        } else {
            umVar.a().setPrimaryClip(ClipData.newPlainText("", ""));
        }
    }
}
