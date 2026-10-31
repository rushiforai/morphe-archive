package ha0;

import ab.e0;
import java.io.IOException;
import java.io.StringWriter;

/* loaded from: classes.dex */
public abstract class a extends e0 implements Comparable {
    @Override // java.lang.Comparable
    /* renamed from: Z, reason: merged with bridge method [inline-methods] */
    public final int compareTo(a aVar) {
        int iCompareTo = a0().compareTo(aVar.a0());
        if (iCompareTo != 0) {
            return iCompareTo;
        }
        int iCompareTo2 = b0().compareTo(aVar.b0());
        return iCompareTo2 != 0 ? iCompareTo2 : c0().compareTo(aVar.c0());
    }

    public abstract String a0();

    public abstract String b0();

    public abstract String c0();

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return a0().equals(aVar.a0()) && b0().equals(aVar.b0()) && c0().equals(aVar.c0());
    }

    public final int hashCode() {
        return c0().hashCode() + ((b0().hashCode() + (a0().hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringWriter stringWriter = new StringWriter();
        try {
            new oa0.a(stringWriter).c(this);
            return stringWriter.toString();
        } catch (IOException unused) {
            throw new AssertionError("Unexpected IOException");
        }
    }
}
