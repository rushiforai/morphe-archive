package com.vungle.ads.internal.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectStreamClass;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x extends ObjectInputStream {

    /* renamed from: a, reason: collision with root package name */
    public final List f47717a;

    public x(InputStream inputStream, List list) {
        super(inputStream);
        this.f47717a = list;
    }

    @Override // java.io.ObjectInputStream
    public final Class resolveClass(ObjectStreamClass desc) throws ClassNotFoundException, IOException {
        Intrinsics.g(desc, "desc");
        Class<?> c11 = super.resolveClass(desc);
        if (this.f47717a == null || Number.class.isAssignableFrom(c11) || String.class.equals(c11) || Boolean.class.equals(c11) || c11.isArray() || this.f47717a.contains(c11)) {
            Intrinsics.f(c11, "c");
            return c11;
        }
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Deserialization is not allowed for ");
        sbA.append(desc.getName());
        throw new IOException(sbA.toString());
    }
}
