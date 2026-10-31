package rb0;

import b.c0;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;
import rx.exceptions.CompositeException;

/* loaded from: classes5.dex */
public enum a {
    ;


    /* renamed from: a, reason: collision with root package name */
    public static final Throwable f85774a = new Throwable("Terminated");

    public static boolean a(AtomicReference atomicReference, Throwable th2) {
        Throwable compositeException;
        while (true) {
            Throwable th3 = (Throwable) atomicReference.get();
            if (th3 == f85774a) {
                return false;
            }
            if (th3 == null) {
                compositeException = th2;
            } else if (th3 instanceof CompositeException) {
                ArrayList arrayList = new ArrayList(((CompositeException) th3).f86463a);
                arrayList.add(th2);
                compositeException = new CompositeException(arrayList);
            } else {
                compositeException = new CompositeException(th3, th2);
            }
            while (!atomicReference.compareAndSet(th3, compositeException)) {
                if (atomicReference.get() != th3) {
                    break;
                }
            }
            return true;
        }
    }

    public static Throwable b(AtomicReference atomicReference) {
        Throwable th2 = (Throwable) atomicReference.get();
        Throwable th3 = f85774a;
        return th2 != th3 ? (Throwable) atomicReference.getAndSet(th3) : th2;
    }

    public static a valueOf(String str) {
        c0.y(Enum.valueOf(a.class, str));
        throw null;
    }
}
