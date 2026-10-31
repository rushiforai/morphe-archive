package com.google.android.gms.internal.measurement;

import java.util.Iterator;

/* loaded from: classes3.dex */
public class th {

    /* renamed from: a, reason: collision with root package name */
    public final String f33092a;

    /* renamed from: b, reason: collision with root package name */
    public final Class f33093b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f33094c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f33095d;

    /* renamed from: e, reason: collision with root package name */
    public final long f33096e;

    public th(String str, Class cls, boolean z11, boolean z12) {
        char cCharAt = str.charAt(0);
        if ((cCharAt < 'a' || cCharAt > 'z') && (cCharAt < 'A' || cCharAt > 'Z')) {
            throw new IllegalArgumentException("identifier must start with an ASCII letter: ".concat(str));
        }
        for (int i5 = 1; i5 < str.length(); i5++) {
            char cCharAt2 = str.charAt(i5);
            if ((cCharAt2 < 'a' || cCharAt2 > 'z') && ((cCharAt2 < 'A' || cCharAt2 > 'Z') && ((cCharAt2 < '0' || cCharAt2 > '9') && cCharAt2 != '_'))) {
                throw new IllegalArgumentException("identifier must contain only ASCII letters, digits or underscore: ".concat(str));
            }
        }
        this.f33092a = str;
        this.f33093b = cls;
        this.f33094c = z11;
        this.f33095d = z12;
        int iIdentityHashCode = System.identityHashCode(this);
        long j11 = 0;
        for (int i11 = 0; i11 < 5; i11++) {
            j11 |= 1 << (iIdentityHashCode & 63);
            iIdentityHashCode >>>= 6;
        }
        this.f33096e = j11;
    }

    public void a(Iterator it, fi fiVar) {
        while (it.hasNext()) {
            b(it.next(), fiVar);
        }
    }

    public void b(Object obj, fi fiVar) {
        fiVar.a(obj, this.f33092a);
    }

    public final String toString() {
        String name = getClass().getName();
        String name2 = this.f33093b.getName();
        int length = name.length();
        int length2 = name2.length();
        String str = this.f33092a;
        StringBuilder sb2 = new StringBuilder(str.length() + length + 1 + 1 + length2 + 1);
        b.c0.D(sb2, name, "/", str, "[");
        return b.c0.q(sb2, name2, "]");
    }
}
