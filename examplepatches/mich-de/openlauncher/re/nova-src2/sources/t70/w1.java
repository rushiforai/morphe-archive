package t70;

import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class w1 implements n1 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88877b = AtomicIntegerFieldUpdater.newUpdater(w1.class, "_isCompleting$volatile");

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88878c = AtomicReferenceFieldUpdater.newUpdater(w1.class, Object.class, "_rootCause$volatile");

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88879d = AtomicReferenceFieldUpdater.newUpdater(w1.class, Object.class, "_exceptionsHolder$volatile");
    private volatile /* synthetic */ Object _exceptionsHolder$volatile;
    private volatile /* synthetic */ int _isCompleting$volatile = 0;
    private volatile /* synthetic */ Object _rootCause$volatile;

    /* renamed from: a, reason: collision with root package name */
    public final b2 f88880a;

    public w1(b2 b2Var, Throwable th2) {
        this.f88880a = b2Var;
        this._rootCause$volatile = th2;
    }

    public final void a(Throwable th2) {
        Throwable thD = d();
        if (thD == null) {
            f88878c.set(this, th2);
            return;
        }
        if (th2 == thD) {
            return;
        }
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88879d;
        Object obj = atomicReferenceFieldUpdater.get(this);
        if (obj == null) {
            atomicReferenceFieldUpdater.set(this, th2);
            return;
        }
        if (!(obj instanceof Throwable)) {
            if (obj instanceof ArrayList) {
                ((ArrayList) obj).add(th2);
                return;
            } else {
                throw new IllegalStateException(("State is " + obj).toString());
            }
        }
        if (th2 == obj) {
            return;
        }
        ArrayList arrayList = new ArrayList(4);
        arrayList.add(obj);
        arrayList.add(th2);
        atomicReferenceFieldUpdater.set(this, arrayList);
    }

    @Override // t70.n1
    public final boolean b() {
        return d() == null;
    }

    @Override // t70.n1
    public final b2 c() {
        return this.f88880a;
    }

    public final Throwable d() {
        return (Throwable) f88878c.get(this);
    }

    public final boolean e() {
        return d() != null;
    }

    public final ArrayList f(Throwable th2) {
        ArrayList arrayList;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88879d;
        Object obj = atomicReferenceFieldUpdater.get(this);
        if (obj == null) {
            arrayList = new ArrayList(4);
        } else if (obj instanceof Throwable) {
            ArrayList arrayList2 = new ArrayList(4);
            arrayList2.add(obj);
            arrayList = arrayList2;
        } else {
            if (!(obj instanceof ArrayList)) {
                throw new IllegalStateException(("State is " + obj).toString());
            }
            arrayList = (ArrayList) obj;
        }
        Throwable thD = d();
        if (thD != null) {
            arrayList.add(0, thD);
        }
        if (th2 != null && !th2.equals(thD)) {
            arrayList.add(th2);
        }
        atomicReferenceFieldUpdater.set(this, m0.f88832h);
        return arrayList;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Finishing[cancelling=");
        sb2.append(e());
        sb2.append(", completing=");
        sb2.append(f88877b.get(this) == 1);
        sb2.append(", rootCause=");
        sb2.append(d());
        sb2.append(", exceptions=");
        sb2.append(f88879d.get(this));
        sb2.append(", list=");
        sb2.append(this.f88880a);
        sb2.append(AbstractJsonLexerKt.END_LIST);
        return sb2.toString();
    }
}
