package cl;

import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract /* synthetic */ class o {
    public static /* synthetic */ boolean a(Unsafe unsafe, s sVar, long j11, Object obj, Object obj2) {
        while (!unsafe.compareAndSwapObject(sVar, j11, obj, obj2)) {
            if (unsafe.getObject(sVar, j11) != obj) {
                return false;
            }
        }
        return true;
    }
}
