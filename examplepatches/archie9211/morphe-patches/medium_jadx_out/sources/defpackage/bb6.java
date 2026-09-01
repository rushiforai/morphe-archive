package defpackage;

import java.util.ArrayList;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bb6 implements m06 {
    public static final /* synthetic */ long b;
    public static final /* synthetic */ long c;
    public static final /* synthetic */ long d;
    private volatile /* synthetic */ Object _exceptionsHolder$volatile;
    private volatile /* synthetic */ int _isCompleting$volatile = 0;
    private volatile /* synthetic */ Object _rootCause$volatile;
    public final gh8 a;

    static {
        Unsafe unsafe = m80.a;
        c = unsafe.objectFieldOffset(bb6.class.getDeclaredField("_isCompleting$volatile"));
        d = unsafe.objectFieldOffset(bb6.class.getDeclaredField("_rootCause$volatile"));
        b = unsafe.objectFieldOffset(bb6.class.getDeclaredField("_exceptionsHolder$volatile"));
    }

    public bb6(gh8 gh8Var, Throwable th) {
        this.a = gh8Var;
        this._rootCause$volatile = th;
    }

    public final void a(Throwable th) {
        Throwable thB = b();
        if (thB == null) {
            m80.a.putObjectVolatile(this, d, th);
            return;
        }
        if (th == thB) {
            return;
        }
        Unsafe unsafe = m80.a;
        long j = b;
        Object objectVolatile = unsafe.getObjectVolatile(this, j);
        if (objectVolatile == null) {
            unsafe.putObjectVolatile(this, j, th);
            return;
        }
        if (!(objectVolatile instanceof Throwable)) {
            if (objectVolatile instanceof ArrayList) {
                ((ArrayList) objectVolatile).add(th);
                return;
            } else {
                ik4.m("State is ", objectVolatile);
                return;
            }
        }
        if (th == objectVolatile) {
            return;
        }
        ArrayList arrayList = new ArrayList(4);
        arrayList.add(objectVolatile);
        arrayList.add(th);
        unsafe.putObjectVolatile(this, j, arrayList);
    }

    public final Throwable b() {
        return (Throwable) m80.a.getObjectVolatile(this, d);
    }

    public final boolean c() {
        return b() != null;
    }

    public final boolean d() {
        return m80.a.getIntVolatile(this, c) == 1;
    }

    public final ArrayList e(Throwable th) {
        ArrayList arrayList;
        Unsafe unsafe = m80.a;
        long j = b;
        Object objectVolatile = unsafe.getObjectVolatile(this, j);
        if (objectVolatile == null) {
            arrayList = new ArrayList(4);
        } else if (objectVolatile instanceof Throwable) {
            ArrayList arrayList2 = new ArrayList(4);
            arrayList2.add(objectVolatile);
            arrayList = arrayList2;
        } else {
            if (!(objectVolatile instanceof ArrayList)) {
                ik4.m("State is ", objectVolatile);
                return null;
            }
            arrayList = (ArrayList) objectVolatile;
        }
        Throwable thB = b();
        if (thB != null) {
            arrayList.add(0, thB);
        }
        if (th != null && !th.equals(thB)) {
            arrayList.add(th);
        }
        unsafe.putObjectVolatile(this, j, o7f.m);
        return arrayList;
    }

    @Override // defpackage.m06
    public final boolean f() {
        return b() == null;
    }

    @Override // defpackage.m06
    public final gh8 g() {
        return this.a;
    }

    public final String toString() {
        return "Finishing[cancelling=" + c() + ", completing=" + d() + ", rootCause=" + b() + ", exceptions=" + m80.a.getObjectVolatile(this, b) + ", list=" + this.a + ']';
    }
}
