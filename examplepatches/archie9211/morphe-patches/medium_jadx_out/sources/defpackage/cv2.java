package defpackage;

import android.content.Context;
import java.lang.Thread;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cv2 implements Thread.UncaughtExceptionHandler {
    public final yu2 a;
    public final WeakReference b;
    public Thread.UncaughtExceptionHandler c;

    public cv2(yu2 yu2Var, Context context) {
        context.getClass();
        this.a = yu2Var;
        this.b = new WeakReference(context);
    }

    /* JADX WARN: Removed duplicated region for block: B:51:0x01ca A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x01da  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01f3  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0202  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01cc A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:85:? A[RETURN, SYNTHETIC] */
    @Override // java.lang.Thread.UncaughtExceptionHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void uncaughtException(java.lang.Thread r22, java.lang.Throwable r23) {
        /*
            Method dump skipped, instruction units count: 518
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cv2.uncaughtException(java.lang.Thread, java.lang.Throwable):void");
    }
}
