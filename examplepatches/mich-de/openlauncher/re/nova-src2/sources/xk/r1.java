package xk;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class r1 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public static final r1 f96005a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ r1[] f96006b;

    static {
        r1 r1Var = new r1("INSTANCE", 0);
        f96005a = r1Var;
        f96006b = new r1[]{r1Var};
    }

    public static r1 valueOf(String str) {
        return (r1) Enum.valueOf(r1.class, str);
    }

    public static r1[] values() {
        return (r1[]) f96006b.clone();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return false;
    }

    @Override // java.util.Iterator
    public final Object next() {
        throw new NoSuchElementException();
    }

    @Override // java.util.Iterator
    public final void remove() {
        w20.e.f(false);
    }
}
