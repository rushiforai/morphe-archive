package cl;

import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract /* synthetic */ class m {
    public static /* synthetic */ boolean a(Unsafe unsafe, s sVar, long j11, r rVar, r rVar2) {
        while (!unsafe.compareAndSwapObject(sVar, j11, rVar, rVar2)) {
            if (unsafe.getObject(sVar, j11) != rVar) {
                return false;
            }
        }
        return true;
    }
}
