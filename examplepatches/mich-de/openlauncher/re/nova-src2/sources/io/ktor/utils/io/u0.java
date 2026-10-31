package io.ktor.utils.io;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public final class u0 {

    /* renamed from: b, reason: collision with root package name */
    public static final List f66658b = ul.b.Q(new u0(1), new u0(2), new u0(4));

    /* renamed from: a, reason: collision with root package name */
    public final int f66659a;

    public /* synthetic */ u0(int i5) {
        this.f66659a = i5;
    }

    public static final boolean a(int i5, int i11) {
        return (i11 | i5) == i5;
    }

    public static String b(int i5) {
        if (i5 == 1) {
            return "CR";
        }
        if (i5 == 2) {
            return "LF";
        }
        if (i5 == 4) {
            return "CRLF";
        }
        List list = f66658b;
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (a(i5, ((u0) obj).f66659a)) {
                arrayList.add(obj);
            }
        }
        return arrayList.toString();
    }

    public final boolean equals(Object obj) {
        if (obj instanceof u0) {
            return this.f66659a == ((u0) obj).f66659a;
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f66659a);
    }

    public final String toString() {
        return b(this.f66659a);
    }
}
