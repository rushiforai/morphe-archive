package defpackage;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class lwb {
    public static final iwb a = new iwb(new byte[0], 0, 0, false, false);
    public static final int b;
    public static final AtomicReference[] c;

    static {
        int iHighestOneBit = Integer.highestOneBit((Runtime.getRuntime().availableProcessors() * 2) - 1);
        b = iHighestOneBit;
        AtomicReference[] atomicReferenceArr = new AtomicReference[iHighestOneBit];
        for (int i = 0; i < iHighestOneBit; i++) {
            atomicReferenceArr[i] = new AtomicReference();
        }
        c = atomicReferenceArr;
    }

    public static final void a(iwb iwbVar) {
        iwbVar.getClass();
        if (iwbVar.f != null || iwbVar.g != null) {
            ay0.e("Failed requirement.");
            return;
        }
        if (iwbVar.d) {
            return;
        }
        AtomicReference atomicReference = c[(int) (Thread.currentThread().getId() & (((long) b) - 1))];
        iwb iwbVar2 = a;
        iwb iwbVar3 = (iwb) atomicReference.getAndSet(iwbVar2);
        if (iwbVar3 == iwbVar2) {
            return;
        }
        int i = iwbVar3 != null ? iwbVar3.c : 0;
        if (i >= 65536) {
            atomicReference.set(iwbVar3);
            return;
        }
        iwbVar.f = iwbVar3;
        iwbVar.b = 0;
        iwbVar.c = i + 8192;
        atomicReference.set(iwbVar);
    }

    public static final iwb b() {
        AtomicReference atomicReference = c[(int) (Thread.currentThread().getId() & (((long) b) - 1))];
        iwb iwbVar = a;
        iwb iwbVar2 = (iwb) atomicReference.getAndSet(iwbVar);
        if (iwbVar2 == iwbVar) {
            return new iwb();
        }
        if (iwbVar2 == null) {
            atomicReference.set(null);
            return new iwb();
        }
        atomicReference.set(iwbVar2.f);
        iwbVar2.f = null;
        iwbVar2.c = 0;
        return iwbVar2;
    }
}
