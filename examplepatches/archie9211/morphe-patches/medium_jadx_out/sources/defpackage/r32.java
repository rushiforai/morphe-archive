package defpackage;

import android.os.Build;
import java.util.concurrent.ExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r32 {
    public final ExecutorService a = k50.Y(false);
    public final r13 b = xg3.a;
    public final ExecutorService c = k50.Y(true);
    public final rz5 d = new rz5(24);
    public final k8f e;
    public final md5 f;
    public final int g;
    public final z46 h;

    public r32(pkf pkfVar) {
        k8f k8fVar = (k8f) pkfVar.a;
        this.e = k8fVar == null ? l33.a : k8fVar;
        this.f = new md5(12);
        this.g = Build.VERSION.SDK_INT == 23 ? 10 : 20;
        this.h = new z46();
    }
}
