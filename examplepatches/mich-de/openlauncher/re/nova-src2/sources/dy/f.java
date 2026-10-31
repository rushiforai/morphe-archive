package dy;

import java.util.ArrayDeque;

/* loaded from: classes4.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final ArrayDeque f49846a = new ArrayDeque();

    public static byte[] a() {
        byte[] bArr;
        ArrayDeque arrayDeque = f49846a;
        synchronized (arrayDeque) {
            bArr = (byte[]) arrayDeque.pollFirst();
        }
        return bArr == null ? new byte[28672] : bArr;
    }

    public static void b(byte[] bArr) {
        if (bArr == null || bArr.length != 28672) {
            return;
        }
        ArrayDeque arrayDeque = f49846a;
        synchronized (arrayDeque) {
            try {
                if (arrayDeque.size() < 10) {
                    arrayDeque.add(bArr);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
