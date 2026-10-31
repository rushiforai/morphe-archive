package m90;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class f0 {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f76122a = new e0(new byte[0], 0, 0, false);

    /* renamed from: b, reason: collision with root package name */
    public static final int f76123b;

    /* renamed from: c, reason: collision with root package name */
    public static final AtomicReference[] f76124c;

    static {
        int iHighestOneBit = Integer.highestOneBit((Runtime.getRuntime().availableProcessors() * 2) - 1);
        f76123b = iHighestOneBit;
        AtomicReference[] atomicReferenceArr = new AtomicReference[iHighestOneBit];
        for (int i5 = 0; i5 < iHighestOneBit; i5++) {
            atomicReferenceArr[i5] = new AtomicReference();
        }
        f76124c = atomicReferenceArr;
    }

    public static final void a(e0 segment) {
        Intrinsics.g(segment, "segment");
        if (segment.f76120f != null || segment.f76121g != null) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (segment.f76118d) {
            return;
        }
        AtomicReference atomicReference = f76124c[(int) (Thread.currentThread().getId() & (f76123b - 1))];
        e0 e0Var = f76122a;
        e0 e0Var2 = (e0) atomicReference.getAndSet(e0Var);
        if (e0Var2 == e0Var) {
            return;
        }
        int i5 = e0Var2 != null ? e0Var2.f76117c : 0;
        if (i5 >= 65536) {
            atomicReference.set(e0Var2);
            return;
        }
        segment.f76120f = e0Var2;
        segment.f76116b = 0;
        segment.f76117c = i5 + UserMetadata.MAX_INTERNAL_KEY_SIZE;
        atomicReference.set(segment);
    }

    public static final e0 b() {
        AtomicReference atomicReference = f76124c[(int) (Thread.currentThread().getId() & (f76123b - 1))];
        e0 e0Var = f76122a;
        e0 e0Var2 = (e0) atomicReference.getAndSet(e0Var);
        if (e0Var2 == e0Var) {
            return new e0();
        }
        if (e0Var2 == null) {
            atomicReference.set(null);
            return new e0();
        }
        atomicReference.set(e0Var2.f76120f);
        e0Var2.f76120f = null;
        e0Var2.f76117c = 0;
        return e0Var2;
    }
}
