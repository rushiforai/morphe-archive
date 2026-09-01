package defpackage;

import io.reactivex.exceptions.ProtocolViolationException;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yxc implements rxc {
    public static final yxc CANCELLED;
    public static final /* synthetic */ yxc[] a;

    static {
        yxc yxcVar = new yxc("CANCELLED", 0);
        CANCELLED = yxcVar;
        a = new yxc[]{yxcVar};
    }

    public static boolean cancel(AtomicReference<rxc> atomicReference) {
        rxc andSet;
        rxc rxcVar = atomicReference.get();
        yxc yxcVar = CANCELLED;
        if (rxcVar == yxcVar || (andSet = atomicReference.getAndSet(yxcVar)) == yxcVar) {
            return false;
        }
        if (andSet == null) {
            return true;
        }
        andSet.cancel();
        return true;
    }

    public static void deferredRequest(AtomicReference<rxc> atomicReference, AtomicLong atomicLong, long j) {
        rxc rxcVar = atomicReference.get();
        if (rxcVar != null) {
            rxcVar.request(j);
            return;
        }
        if (validate(j)) {
            qb8.y(atomicLong, j);
            rxc rxcVar2 = atomicReference.get();
            if (rxcVar2 != null) {
                long andSet = atomicLong.getAndSet(0L);
                if (andSet != 0) {
                    rxcVar2.request(andSet);
                }
            }
        }
    }

    public static boolean deferredSetOnce(AtomicReference<rxc> atomicReference, AtomicLong atomicLong, rxc rxcVar) {
        if (!setOnce(atomicReference, rxcVar)) {
            return false;
        }
        long andSet = atomicLong.getAndSet(0L);
        if (andSet == 0) {
            return true;
        }
        rxcVar.request(andSet);
        return true;
    }

    public static boolean replace(AtomicReference<rxc> atomicReference, rxc rxcVar) {
        while (true) {
            rxc rxcVar2 = atomicReference.get();
            if (rxcVar2 == CANCELLED) {
                if (rxcVar == null) {
                    return false;
                }
                rxcVar.cancel();
                return false;
            }
            while (!atomicReference.compareAndSet(rxcVar2, rxcVar)) {
                if (atomicReference.get() != rxcVar2) {
                    break;
                }
            }
            return true;
        }
    }

    public static void reportMoreProduced(long j) {
        ok7.H(new ProtocolViolationException(ho2.D(j, "More produced than requested: ")));
    }

    public static void reportSubscriptionSet() {
        ok7.H(new ProtocolViolationException("Subscription already set!"));
    }

    public static boolean set(AtomicReference<rxc> atomicReference, rxc rxcVar) {
        while (true) {
            rxc rxcVar2 = atomicReference.get();
            if (rxcVar2 == CANCELLED) {
                if (rxcVar == null) {
                    return false;
                }
                rxcVar.cancel();
                return false;
            }
            while (!atomicReference.compareAndSet(rxcVar2, rxcVar)) {
                if (atomicReference.get() != rxcVar2) {
                    break;
                }
            }
            if (rxcVar2 == null) {
                return true;
            }
            rxcVar2.cancel();
            return true;
        }
    }

    public static boolean setOnce(AtomicReference<rxc> atomicReference, rxc rxcVar) {
        il7.B("s is null", rxcVar);
        while (!atomicReference.compareAndSet(null, rxcVar)) {
            if (atomicReference.get() != null) {
                rxcVar.cancel();
                if (atomicReference.get() == CANCELLED) {
                    return false;
                }
                reportSubscriptionSet();
                return false;
            }
        }
        return true;
    }

    public static boolean validate(rxc rxcVar, rxc rxcVar2) {
        if (rxcVar2 == null) {
            ok7.H(new NullPointerException("next is null"));
            return false;
        }
        if (rxcVar == null) {
            return true;
        }
        rxcVar2.cancel();
        reportSubscriptionSet();
        return false;
    }

    public static yxc valueOf(String str) {
        return (yxc) Enum.valueOf(yxc.class, str);
    }

    public static yxc[] values() {
        return (yxc[]) a.clone();
    }

    public static boolean validate(long j) {
        if (j > 0) {
            return true;
        }
        ok7.H(new IllegalArgumentException(ho2.D(j, "n > 0 required but it was ")));
        return false;
    }

    @Override // defpackage.rxc
    public void cancel() {
    }

    public static boolean setOnce(AtomicReference<rxc> atomicReference, rxc rxcVar, long j) {
        if (!setOnce(atomicReference, rxcVar)) {
            return false;
        }
        rxcVar.request(j);
        return true;
    }

    @Override // defpackage.rxc
    public void request(long j) {
    }
}
