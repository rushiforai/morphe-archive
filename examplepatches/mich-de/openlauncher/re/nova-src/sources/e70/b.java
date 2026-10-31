package e70;

import java.util.Comparator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public static final b f52242a = new b();

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        Comparable a11 = (Comparable) obj;
        Comparable b11 = (Comparable) obj2;
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        return b11.compareTo(a11);
    }

    @Override // java.util.Comparator
    public final Comparator reversed() {
        return a.f52241a;
    }
}
