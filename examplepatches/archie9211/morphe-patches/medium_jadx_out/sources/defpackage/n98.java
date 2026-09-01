package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n98 implements Comparable {
    public final String a;
    public final boolean b;

    public n98(String str, boolean z) {
        if (str == null) {
            a(0);
            throw null;
        }
        this.a = str;
        this.b = z;
    }

    public static /* synthetic */ void a(int i) {
        String str = (i == 1 || i == 2 || i == 3 || i == 4) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 1 || i == 2 || i == 3 || i == 4) ? 2 : 3];
        if (i == 1 || i == 2 || i == 3 || i == 4) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/name/Name";
        } else {
            objArr[0] = "name";
        }
        if (i == 1) {
            objArr[1] = "asString";
        } else if (i == 2) {
            objArr[1] = "getIdentifier";
        } else if (i == 3 || i == 4) {
            objArr[1] = "asStringStripSpecialMarkers";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/name/Name";
        }
        switch (i) {
            case 1:
            case 2:
            case 3:
            case 4:
                break;
            case 5:
                objArr[2] = "identifier";
                break;
            case 6:
                objArr[2] = "isValidIdentifier";
                break;
            case 7:
                objArr[2] = "identifierIfValid";
                break;
            case 8:
                objArr[2] = "special";
                break;
            case 9:
                objArr[2] = "guessByFirstCharacter";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        if (i != 1 && i != 2 && i != 3 && i != 4) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public static n98 d(String str) {
        if (str != null) {
            return str.startsWith("<") ? g(str) : e(str);
        }
        a(9);
        throw null;
    }

    public static n98 e(String str) {
        if (str != null) {
            return new n98(str, false);
        }
        a(5);
        throw null;
    }

    public static boolean f(String str) {
        if (!str.isEmpty() && !str.startsWith("<")) {
            for (int i = 0; i < str.length(); i++) {
                char cCharAt = str.charAt(i);
                if (cCharAt != '.' && cCharAt != '/' && cCharAt != '\\') {
                }
            }
            return true;
        }
        return false;
    }

    public static n98 g(String str) {
        if (str == null) {
            a(8);
            throw null;
        }
        if (str.startsWith("<")) {
            return new n98(str, true);
        }
        ay0.e("special name must start with '<': ".concat(str));
        return null;
    }

    public final String b() {
        String str = this.a;
        if (str != null) {
            return str;
        }
        a(1);
        throw null;
    }

    public final String c() {
        if (this.b) {
            ik4.o("not identifier: ", this);
            return null;
        }
        String strB = b();
        if (strB != null) {
            return strB;
        }
        a(2);
        throw null;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.a.compareTo(((n98) obj).a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n98)) {
            return false;
        }
        n98 n98Var = (n98) obj;
        return this.b == n98Var.b && this.a.equals(n98Var.a);
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1 : 0);
    }

    public final String toString() {
        return this.a;
    }
}
