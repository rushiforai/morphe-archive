package e70;

import java.util.Comparator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public static final a f52241a = new a();

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        Comparable a11 = (Comparable) obj;
        Comparable b11 = (Comparable) obj2;
        Intrinsics.g(a11, "a");
        Intrinsics.g(b11, "b");
        return a11.compareTo(b11);
    }

    @Override // java.util.Comparator
    public final Comparator reversed() {
        return b.f52242a;
    }
}
