package defpackage;

import io.reactivex.exceptions.ProtocolViolationException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zh3 implements sh3 {
    public static final zh3 DISPOSED;
    public static final /* synthetic */ zh3[] a;

    static {
        zh3 zh3Var = new zh3("DISPOSED", 0);
        DISPOSED = zh3Var;
        a = new zh3[]{zh3Var};
    }

    public static boolean dispose(AtomicReference<sh3> atomicReference) {
        sh3 andSet;
        sh3 sh3Var = atomicReference.get();
        zh3 zh3Var = DISPOSED;
        if (sh3Var == zh3Var || (andSet = atomicReference.getAndSet(zh3Var)) == zh3Var) {
            return false;
        }
        if (andSet == null) {
            return true;
        }
        andSet.dispose();
        return true;
    }

    public static boolean isDisposed(sh3 sh3Var) {
        return sh3Var == DISPOSED;
    }

    public static boolean replace(AtomicReference<sh3> atomicReference, sh3 sh3Var) {
        while (true) {
            sh3 sh3Var2 = atomicReference.get();
            if (sh3Var2 == DISPOSED) {
                if (sh3Var == null) {
                    return false;
                }
                sh3Var.dispose();
                return false;
            }
            while (!atomicReference.compareAndSet(sh3Var2, sh3Var)) {
                if (atomicReference.get() != sh3Var2) {
                    break;
                }
            }
            return true;
        }
    }

    public static void reportDisposableSet() {
        ok7.H(new ProtocolViolationException("Disposable already set!"));
    }

    public static boolean set(AtomicReference<sh3> atomicReference, sh3 sh3Var) {
        while (true) {
            sh3 sh3Var2 = atomicReference.get();
            if (sh3Var2 == DISPOSED) {
                if (sh3Var == null) {
                    return false;
                }
                sh3Var.dispose();
                return false;
            }
            while (!atomicReference.compareAndSet(sh3Var2, sh3Var)) {
                if (atomicReference.get() != sh3Var2) {
                    break;
                }
            }
            if (sh3Var2 == null) {
                return true;
            }
            sh3Var2.dispose();
            return true;
        }
    }

    public static boolean setOnce(AtomicReference<sh3> atomicReference, sh3 sh3Var) {
        il7.B("d is null", sh3Var);
        while (!atomicReference.compareAndSet(null, sh3Var)) {
            if (atomicReference.get() != null) {
                sh3Var.dispose();
                if (atomicReference.get() == DISPOSED) {
                    return false;
                }
                reportDisposableSet();
                return false;
            }
        }
        return true;
    }

    public static boolean trySet(AtomicReference<sh3> atomicReference, sh3 sh3Var) {
        while (!atomicReference.compareAndSet(null, sh3Var)) {
            if (atomicReference.get() != null) {
                if (atomicReference.get() != DISPOSED) {
                    return false;
                }
                sh3Var.dispose();
                return false;
            }
        }
        return true;
    }

    public static boolean validate(sh3 sh3Var, sh3 sh3Var2) {
        if (sh3Var2 == null) {
            ok7.H(new NullPointerException("next is null"));
            return false;
        }
        if (sh3Var == null) {
            return true;
        }
        sh3Var2.dispose();
        reportDisposableSet();
        return false;
    }

    public static zh3 valueOf(String str) {
        return (zh3) Enum.valueOf(zh3.class, str);
    }

    public static zh3[] values() {
        return (zh3[]) a.clone();
    }

    public boolean isDisposed() {
        return true;
    }

    @Override // defpackage.sh3
    public void dispose() {
    }
}
