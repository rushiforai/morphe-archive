package defpackage;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kjc implements ThreadFactory {
    public static final kjc b = new kjc(0);
    public final /* synthetic */ int a;

    public /* synthetic */ kjc(int i) {
        this.a = i;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        switch (this.a) {
            case 0:
                return new Thread(runnable, "kronos-android");
            case 1:
                return Executors.defaultThreadFactory().newThread(new t86(0, runnable));
            default:
                return new p90(1, runnable, "fonts-androidx");
        }
    }
}
