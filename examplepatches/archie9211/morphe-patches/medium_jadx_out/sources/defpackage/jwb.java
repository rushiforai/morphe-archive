package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class jwb extends k32 implements ai8 {
    public static final /* synthetic */ AtomicIntegerFieldUpdater e = AtomicIntegerFieldUpdater.newUpdater(jwb.class, "cleanedAndPointers$volatile");
    public static final /* synthetic */ long f = m80.a.objectFieldOffset(jwb.class.getDeclaredField("cleanedAndPointers$volatile"));
    private volatile /* synthetic */ int cleanedAndPointers$volatile;
    public final long d;

    public jwb(long j, jwb jwbVar, int i) {
        super(jwbVar);
        this.d = j;
        this.cleanedAndPointers$volatile = i << 16;
    }

    @Override // defpackage.k32
    public final boolean d() {
        return m80.a.getIntVolatile(this, f) == g() && c() != null;
    }

    public final boolean f() {
        return e.addAndGet(this, -65536) == g() && c() != null;
    }

    public abstract int g();

    public abstract void h(int i, ib2 ib2Var);

    public final void i() {
        if (e.incrementAndGet(this) == g()) {
            e();
        }
    }

    public final boolean j() {
        while (true) {
            Unsafe unsafe = m80.a;
            long j = f;
            int intVolatile = unsafe.getIntVolatile(this, j);
            if (intVolatile == this.g() && this.c() != null) {
                return false;
            }
            jwb jwbVar = this;
            if (unsafe.compareAndSwapInt(jwbVar, j, intVolatile, intVolatile + ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID)) {
                return true;
            }
            this = jwbVar;
        }
    }
}
