package e80;

import cl.l0;
import com.google.android.gms.internal.measurement.k2;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class i {

    /* renamed from: a, reason: collision with root package name */
    public static final h f52267a = new h(new byte[0], 0, 0, null);

    /* renamed from: b, reason: collision with root package name */
    public static final int f52268b;

    /* renamed from: c, reason: collision with root package name */
    public static final int f52269c;

    /* renamed from: d, reason: collision with root package name */
    public static final int f52270d;

    /* renamed from: e, reason: collision with root package name */
    public static final int f52271e;

    /* renamed from: f, reason: collision with root package name */
    public static final AtomicReferenceArray f52272f;

    /* renamed from: g, reason: collision with root package name */
    public static final AtomicReferenceArray f52273g;

    static {
        int iIntValue;
        int i5 = 0;
        int iHighestOneBit = Integer.highestOneBit((Runtime.getRuntime().availableProcessors() * 2) - 1);
        f52268b = iHighestOneBit;
        int i11 = iHighestOneBit / 2;
        int i12 = i11 >= 1 ? i11 : 1;
        f52269c = i12;
        String property = System.getProperty("kotlinx.io.pool.size.bytes", Intrinsics.b(System.getProperty("java.vm.name"), "Dalvik") ? "0" : "4194304");
        Intrinsics.f(property, "getProperty(...)");
        Integer numU0 = r70.i.u0(property);
        if (numU0 != null && (iIntValue = numU0.intValue()) >= 0) {
            i5 = iIntValue;
        }
        f52270d = i5;
        int i13 = i5 / i12;
        if (i13 < 8192) {
            i13 = 8192;
        }
        f52271e = i13;
        f52272f = new AtomicReferenceArray(iHighestOneBit);
        f52273g = new AtomicReferenceArray(i12);
    }

    public static final void a(h segment) {
        Intrinsics.g(segment, "segment");
        if (segment.f52265f != null || segment.f52266g != null) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        l0 l0Var = segment.f52263d;
        if (l0Var != null && l0Var.M()) {
            return;
        }
        int id2 = (int) ((f52268b - 1) & Thread.currentThread().getId());
        segment.f52261b = 0;
        segment.f52264e = true;
        while (true) {
            AtomicReferenceArray atomicReferenceArray = f52272f;
            h hVar = (h) atomicReferenceArray.get(id2);
            h hVar2 = f52267a;
            if (hVar != hVar2) {
                int i5 = hVar != null ? hVar.f52262c : 0;
                if (i5 < 65536) {
                    segment.f52265f = hVar;
                    segment.f52262c = i5 + UserMetadata.MAX_INTERNAL_KEY_SIZE;
                    while (!atomicReferenceArray.compareAndSet(id2, hVar, segment)) {
                        if (atomicReferenceArray.get(id2) != hVar) {
                            break;
                        }
                    }
                    return;
                }
                if (f52270d <= 0) {
                    return;
                }
                segment.f52261b = 0;
                segment.f52264e = true;
                int i11 = f52269c;
                int id3 = (int) (Thread.currentThread().getId() & (i11 - 1));
                int i12 = 0;
                while (true) {
                    AtomicReferenceArray atomicReferenceArray2 = f52273g;
                    h hVar3 = (h) atomicReferenceArray2.get(id3);
                    if (hVar3 != hVar2) {
                        int i13 = (hVar3 != null ? hVar3.f52262c : 0) + UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        if (i13 <= f52271e) {
                            segment.f52265f = hVar3;
                            segment.f52262c = i13;
                            if (k2.y(atomicReferenceArray2, id3, hVar3, segment)) {
                                return;
                            }
                        } else {
                            if (i12 >= i11) {
                                return;
                            }
                            i12++;
                            id3 = (id3 + 1) & (i11 - 1);
                        }
                    }
                }
            }
        }
    }

    public static final h b() {
        AtomicReferenceArray atomicReferenceArray;
        h hVar;
        h hVar2;
        int id2 = (int) ((f52268b - 1) & Thread.currentThread().getId());
        do {
            atomicReferenceArray = f52272f;
            hVar = f52267a;
            hVar2 = (h) atomicReferenceArray.getAndSet(id2, hVar);
        } while (Intrinsics.b(hVar2, hVar));
        if (hVar2 != null) {
            atomicReferenceArray.set(id2, hVar2.f52265f);
            hVar2.f52265f = null;
            hVar2.f52262c = 0;
            return hVar2;
        }
        atomicReferenceArray.set(id2, null);
        if (f52270d <= 0) {
            return new h();
        }
        int i5 = f52269c;
        int id3 = (int) (Thread.currentThread().getId() & (i5 - 1));
        int i11 = 0;
        while (true) {
            AtomicReferenceArray atomicReferenceArray2 = f52273g;
            h hVar3 = (h) atomicReferenceArray2.getAndSet(id3, hVar);
            if (!Intrinsics.b(hVar3, hVar)) {
                if (hVar3 != null) {
                    atomicReferenceArray2.set(id3, hVar3.f52265f);
                    hVar3.f52265f = null;
                    hVar3.f52262c = 0;
                    return hVar3;
                }
                atomicReferenceArray2.set(id3, null);
                if (i11 >= i5) {
                    return new h();
                }
                id3 = (id3 + 1) & (i5 - 1);
                i11++;
            }
        }
    }
}
