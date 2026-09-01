package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.squareup.wire.internal.MathMethodsKt;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class in3 implements Comparable {
    public static final long b;
    public static final long c;
    public static final /* synthetic */ int d = 0;
    public final long a;

    static {
        int i = kn3.a;
        b = hlg.x(4611686018427387903L);
        c = hlg.x(-4611686018427387903L);
    }

    public static final long a(long j, long j2) {
        long j3 = j2 / 1000000;
        long j4 = j + j3;
        if (-4611686018426L > j4 || j4 >= 4611686018427L) {
            return hlg.x(iq7.w(j4, -4611686018427387903L, 4611686018427387903L));
        }
        return hlg.z((j4 * 1000000) + (j2 - (j3 * 1000000)));
    }

    public static final void b(StringBuilder sb, int i, int i2, int i3, String str, boolean z) {
        sb.append(i);
        if (i2 != 0) {
            sb.append('.');
            String strH0 = muc.h0(i3, String.valueOf(i2));
            int i4 = -1;
            int length = strH0.length() - 1;
            if (length >= 0) {
                while (true) {
                    int i5 = length - 1;
                    if (strH0.charAt(length) != '0') {
                        i4 = length;
                        break;
                    } else if (i5 < 0) {
                        break;
                    } else {
                        length = i5;
                    }
                }
            }
            int i6 = i4 + 1;
            if (z || i6 >= 3) {
                sb.append((CharSequence) strH0, 0, ((i4 + 3) / 3) * 3);
            } else {
                sb.append((CharSequence) strH0, 0, i6);
            }
        }
        sb.append(str);
    }

    public static int c(long j, long j2) {
        long j3 = j ^ j2;
        if (j3 < 0 || (((int) j3) & 1) == 0) {
            return g76.R(j, j2);
        }
        int i = (((int) j) & 1) - (((int) j2) & 1);
        return j < 0 ? -i : i;
    }

    public static final long d(long j) {
        return ((((int) j) & 1) != 1 || g(j)) ? j(j, mn3.MILLISECONDS) : j >> 1;
    }

    public static final long e(long j) {
        long j2 = j >> 1;
        if ((((int) j) & 1) == 0) {
            return j2;
        }
        if (j2 > 9223372036854L) {
            return Long.MAX_VALUE;
        }
        if (j2 < -9223372036854L) {
            return Long.MIN_VALUE;
        }
        return j2 * 1000000;
    }

    public static final int f(long j) {
        if (g(j)) {
            return 0;
        }
        return (int) ((((int) j) & 1) == 1 ? ((j >> 1) % 1000) * 1000000 : (j >> 1) % MathMethodsKt.NANOS_PER_SECOND);
    }

    public static final boolean g(long j) {
        return j == b || j == c;
    }

    public static final long h(long j, long j2) {
        if (g(j)) {
            if (!g(j2) || (j2 ^ j) >= 0) {
                return j;
            }
            ay0.e("Summing infinite durations of different signs yields an undefined result.");
            return 0L;
        }
        if (g(j2)) {
            return j2;
        }
        int i = ((int) j) & 1;
        if (i != (((int) j2) & 1)) {
            return i == 1 ? a(j >> 1, j2 >> 1) : a(j2 >> 1, j >> 1);
        }
        long j3 = (j >> 1) + (j2 >> 1);
        return i == 0 ? (-4611686018426999999L > j3 || j3 >= 4611686018427000000L) ? hlg.x(j3 / 1000000) : hlg.z(j3) : hlg.y(j3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00a1, code lost:
    
        if ((java.lang.Integer.signum(r20) * java.lang.Long.signum(r6)) > 0) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c1, code lost:
    
        if ((java.lang.Integer.signum(r20) * java.lang.Long.signum(r6)) > 0) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00c5, code lost:
    
        return defpackage.in3.b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00c8, code lost:
    
        return defpackage.in3.c;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final long i(int r20, long r21) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.in3.i(int, long):long");
    }

    public static final long j(long j, mn3 mn3Var) {
        mn3Var.getClass();
        if (j == b) {
            return Long.MAX_VALUE;
        }
        if (j == c) {
            return Long.MIN_VALUE;
        }
        long j2 = j >> 1;
        mn3 mn3Var2 = (((int) j) & 1) == 0 ? mn3.NANOSECONDS : mn3.MILLISECONDS;
        mn3Var2.getClass();
        return mn3Var.getTimeUnit$kotlin_stdlib().convert(j2, mn3Var2.getTimeUnit$kotlin_stdlib());
    }

    public static String k(long j) {
        if (j == 0) {
            return "0s";
        }
        if (j == b) {
            return "Infinity";
        }
        if (j == c) {
            return "-Infinity";
        }
        int i = 0;
        boolean z = j < 0;
        StringBuilder sb = new StringBuilder();
        if (z) {
            sb.append('-');
        }
        if (j < 0) {
            j = l(j);
        }
        long j2 = j(j, mn3.DAYS);
        int iJ = g(j) ? 0 : (int) (j(j, mn3.HOURS) % 24);
        int iJ2 = g(j) ? 0 : (int) (j(j, mn3.MINUTES) % 60);
        int iJ3 = g(j) ? 0 : (int) (j(j, mn3.SECONDS) % 60);
        int iF = f(j);
        boolean z2 = j2 != 0;
        boolean z3 = iJ != 0;
        boolean z4 = iJ2 != 0;
        boolean z5 = (iJ3 == 0 && iF == 0) ? false : true;
        if (z2) {
            sb.append(j2);
            sb.append('d');
            i = 1;
        }
        if (z3 || (z2 && (z4 || z5))) {
            int i2 = i + 1;
            if (i > 0) {
                sb.append(' ');
            }
            sb.append(iJ);
            sb.append('h');
            i = i2;
        }
        if (z4 || (z5 && (z3 || z2))) {
            int i3 = i + 1;
            if (i > 0) {
                sb.append(' ');
            }
            sb.append(iJ2);
            sb.append('m');
            i = i3;
        }
        if (z5) {
            int i4 = i + 1;
            if (i > 0) {
                sb.append(' ');
            }
            if (iJ3 != 0 || z2 || z3 || z4) {
                b(sb, iJ3, iF, 9, "s", false);
            } else if (iF >= 1000000) {
                b(sb, iF / 1000000, iF % 1000000, 6, "ms", false);
            } else if (iF >= 1000) {
                b(sb, iF / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE, iF % PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE, 3, "us", false);
            } else {
                sb.append(iF);
                sb.append("ns");
            }
            i = i4;
        }
        if (z && i > 1) {
            sb.insert(1, '(').append(')');
        }
        return sb.toString();
    }

    public static final long l(long j) {
        long j2 = ((-(j >> 1)) << 1) + ((long) (((int) j) & 1));
        int i = kn3.a;
        return j2;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return c(this.a, ((in3) obj).a);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof in3) {
            return this.a == ((in3) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        return k(this.a);
    }
}
