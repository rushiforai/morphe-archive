package ft;

import java.util.Collection;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.Pattern;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;

/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: c, reason: collision with root package name */
    public static final Pattern f55967c = Pattern.compile("^pi_[^_]+_(scoped_)?secret_[^_]+$");

    /* renamed from: a, reason: collision with root package name */
    public final String f55968a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55969b;

    public m0(String value) {
        Collection collectionE1;
        Intrinsics.g(value, "value");
        this.f55968a = value;
        List listI = new Regex("_(scoped_)?secret").i(0, value);
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
        this.f55969b = ((String[]) collectionE1.toArray(new String[0]))[0];
        String value2 = this.f55968a;
        Intrinsics.g(value2, "value");
        if (!f55967c.matcher(value2).matches()) {
            throw new IllegalArgumentException(b.c0.k("Invalid Payment Intent client secret: ", this.f55968a).toString());
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m0) && Intrinsics.b(this.f55968a, ((m0) obj).f55968a);
    }

    public final int hashCode() {
        return this.f55968a.hashCode();
    }

    public final String toString() {
        return b.c0.l("ClientSecret(value=", this.f55968a, ")");
    }
}
