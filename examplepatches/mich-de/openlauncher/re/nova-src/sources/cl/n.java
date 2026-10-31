package cl;

import sun.misc.Unsafe;

/* loaded from: classes.dex */
public abstract /* synthetic */ class n {
    public static /* synthetic */ boolean a(Unsafe unsafe, s sVar, long j11, g gVar, g gVar2) {
        while (!unsafe.compareAndSwapObject(sVar, j11, gVar, gVar2)) {
            if (unsafe.getObject(sVar, j11) != gVar) {
                return false;
            }
        }
        return true;
    }
}
