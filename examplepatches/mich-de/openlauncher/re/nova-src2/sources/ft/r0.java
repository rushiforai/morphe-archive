package ft;

import java.util.Collection;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.Pattern;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f56017c = Pattern.compile("^seti_[^_]+_secret_[^_]+$");

    /* renamed from: a, reason: collision with root package name */
    public final String f56018a;

    /* renamed from: b, reason: collision with root package name */
    public final String f56019b;

    public r0(String value) {
        Collection collectionE1;
        Intrinsics.g(value, "value");
        this.f56018a = value;
        List listI = new Regex("_secret").i(0, value);
        if (listI.isEmpty()) {
            collectionE1 = EmptyList.f71733a;
        } else {
            ListIterator listIterator = listI.listIterator(listI.size());
            while (listIterator.hasPrevious()) {
                if (((String) listIterator.previous()).length() != 0) {
                    collectionE1 = b70.g.E1(listI, listIterator.nextIndex() + 1);
                    break;
                }
            }
            collectionE1 = EmptyList.f71733a;
        }
        this.f56019b = ((String[]) collectionE1.toArray(new String[0]))[0];
        String value2 = this.f56018a;
        Intrinsics.g(value2, "value");
        if (!f56017c.matcher(value2).matches()) {
            throw new IllegalArgumentException(b.c0.k("Invalid Setup Intent client secret: ", this.f56018a).toString());
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof r0) && Intrinsics.b(this.f56018a, ((r0) obj).f56018a);
    }

    public final int hashCode() {
        return this.f56018a.hashCode();
    }

    public final String toString() {
        return b.c0.l("ClientSecret(value=", this.f56018a, ")");
    }
}
