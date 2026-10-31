package m90;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class z implements Comparable {

    /* renamed from: b, reason: collision with root package name */
    public static final String f76176b;

    /* renamed from: a, reason: collision with root package name */
    public final j f76177a;

    static {
        String separator = File.separator;
        Intrinsics.f(separator, "separator");
        f76176b = separator;
    }

    public z(j bytes) {
        Intrinsics.g(bytes, "bytes");
        this.f76177a = bytes;
    }

    public final ArrayList a() {
        ArrayList arrayList = new ArrayList();
        int iA = n90.c.a(this);
        j jVar = this.f76177a;
        if (iA == -1) {
            iA = 0;
        } else if (iA < jVar.c() && jVar.j(iA) == 92) {
            iA++;
        }
        int iC = jVar.c();
        int i5 = iA;
        while (iA < iC) {
            if (jVar.j(iA) == 47 || jVar.j(iA) == 92) {
                arrayList.add(jVar.o(i5, iA));
                i5 = iA + 1;
            }
            iA++;
        }
        if (i5 < jVar.c()) {
            arrayList.add(jVar.o(i5, jVar.c()));
        }
        return arrayList;
    }

    public final String b() {
        j jVar = n90.c.f78034a;
        j jVarP = this.f76177a;
        int iL = j.l(jVarP, jVar);
        if (iL == -1) {
            iL = j.l(jVarP, n90.c.f78035b);
        }
        if (iL != -1) {
            jVarP = j.p(jVarP, iL + 1, 0, 2);
        } else if (i() != null && jVarP.c() == 2) {
            jVarP = j.f76130d;
        }
        return jVarP.r();
    }

    public final z c() {
        j jVar = n90.c.f78037d;
        j jVar2 = this.f76177a;
        if (Intrinsics.b(jVar2, jVar)) {
            return null;
        }
        j jVar3 = n90.c.f78034a;
        if (Intrinsics.b(jVar2, jVar3)) {
            return null;
        }
        j prefix = n90.c.f78035b;
        if (Intrinsics.b(jVar2, prefix)) {
            return null;
        }
        j suffix = n90.c.f78038e;
        jVar2.getClass();
        Intrinsics.g(suffix, "suffix");
        int iC = jVar2.c();
        byte[] bArr = suffix.f76131a;
        if (jVar2.n(iC - bArr.length, suffix, bArr.length) && (jVar2.c() == 2 || jVar2.n(jVar2.c() - 3, jVar3, 1) || jVar2.n(jVar2.c() - 3, prefix, 1))) {
            return null;
        }
        int iL = j.l(jVar2, jVar3);
        if (iL == -1) {
            iL = j.l(jVar2, prefix);
        }
        if (iL == 2 && i() != null) {
            if (jVar2.c() == 3) {
                return null;
            }
            return new z(j.p(jVar2, 0, 3, 1));
        }
        if (iL == 1) {
            Intrinsics.g(prefix, "prefix");
            if (jVar2.n(0, prefix, prefix.c())) {
                return null;
            }
        }
        if (iL != -1 || i() == null) {
            return iL == -1 ? new z(jVar) : iL == 0 ? new z(j.p(jVar2, 0, 1, 1)) : new z(j.p(jVar2, 0, iL, 1));
        }
        if (jVar2.c() == 2) {
            return null;
        }
        return new z(j.p(jVar2, 0, 2, 1));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        z other = (z) obj;
        Intrinsics.g(other, "other");
        return this.f76177a.compareTo(other.f76177a);
    }

    public final z d(z other) {
        Intrinsics.g(other, "other");
        j jVar = other.f76177a;
        int iA = n90.c.a(this);
        j jVar2 = this.f76177a;
        z zVar = iA == -1 ? null : new z(jVar2.o(0, iA));
        int iA2 = n90.c.a(other);
        if (!Intrinsics.b(zVar, iA2 != -1 ? new z(jVar.o(0, iA2)) : null)) {
            throw new IllegalArgumentException(("Paths of different roots cannot be relative to each other: " + this + " and " + other).toString());
        }
        ArrayList arrayListA = a();
        ArrayList arrayListA2 = other.a();
        int iMin = Math.min(arrayListA.size(), arrayListA2.size());
        int i5 = 0;
        while (i5 < iMin && Intrinsics.b(arrayListA.get(i5), arrayListA2.get(i5))) {
            i5++;
        }
        if (i5 == iMin && jVar2.c() == jVar.c()) {
            return br.a.u(".", false);
        }
        if (arrayListA2.subList(i5, arrayListA2.size()).indexOf(n90.c.f78038e) != -1) {
            throw new IllegalArgumentException(("Impossible relative path to resolve: " + this + " and " + other).toString());
        }
        g gVar = new g();
        j jVarC = n90.c.c(other);
        if (jVarC == null && (jVarC = n90.c.c(this)) == null) {
            jVarC = n90.c.f(f76176b);
        }
        int size = arrayListA2.size();
        for (int i11 = i5; i11 < size; i11++) {
            gVar.f0(n90.c.f78038e);
            gVar.f0(jVarC);
        }
        int size2 = arrayListA.size();
        while (i5 < size2) {
            gVar.f0((j) arrayListA.get(i5));
            gVar.f0(jVarC);
            i5++;
        }
        return n90.c.d(gVar, false);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof z) && Intrinsics.b(((z) obj).f76177a, this.f76177a);
    }

    public final z g(String child) {
        Intrinsics.g(child, "child");
        g gVar = new g();
        gVar.m0(child);
        return n90.c.b(this, n90.c.d(gVar, false), false);
    }

    public final Path h() {
        Path path = Paths.get(this.f76177a.r(), new String[0]);
        Intrinsics.f(path, "get(...)");
        return path;
    }

    public final int hashCode() {
        return this.f76177a.hashCode();
    }

    public final Character i() {
        j jVar = n90.c.f78034a;
        j jVar2 = this.f76177a;
        if (j.h(jVar2, jVar) != -1 || jVar2.c() < 2 || jVar2.j(1) != 58) {
            return null;
        }
        char cJ = (char) jVar2.j(0);
        if (('a' > cJ || cJ >= '{') && ('A' > cJ || cJ >= '[')) {
            return null;
        }
        return Character.valueOf(cJ);
    }

    public final File toFile() {
        return new File(this.f76177a.r());
    }

    public final String toString() {
        return this.f76177a.r();
    }
}
