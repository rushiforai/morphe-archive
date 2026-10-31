package mh;

import java.util.Comparator;
import java.util.Objects;

/* loaded from: classes3.dex */
public abstract class h0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Comparator f76341a;

    static {
        Comparator comparator;
        try {
            Object[] enumConstants = Class.forName(h0.class.getName().concat("$UnsafeComparator")).getEnumConstants();
            Objects.requireNonNull(enumConstants);
            comparator = (Comparator) enumConstants[0];
        } catch (Throwable unused) {
            comparator = g0.f76338a;
        }
        f76341a = comparator;
    }
}
