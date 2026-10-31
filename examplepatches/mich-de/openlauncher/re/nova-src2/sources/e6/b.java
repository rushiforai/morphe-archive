package e6;

import java.util.LinkedHashMap;
import java.util.Set;
import kotlin.collections.EmptyIterator;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: c, reason: collision with root package name */
    public static final b f52207c = new b(EmptySet.f71734a);

    /* renamed from: a, reason: collision with root package name */
    public final Set f52208a;

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f52209b;

    public b(Set flags) {
        Intrinsics.g(flags, "flags");
        this.f52208a = flags;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        EmptySet.f71734a.getClass();
        EmptyIterator.f71732a.getClass();
        this.f52209b = linkedHashMap;
    }
}
