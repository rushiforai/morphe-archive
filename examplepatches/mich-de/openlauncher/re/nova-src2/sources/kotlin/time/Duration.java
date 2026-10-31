package kotlin.time;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.WasExperimental;
import kotlin.jvm.JvmInline;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.math.MathKt;
import kotlin.ranges.LongRange;
import kotlin.ranges.a;

@SinceKotlin
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\b\u0087@\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0002\u0088\u0001\u0003\u0092\u0001\u00020\u0004¨\u0006\u0005"}, d2 = {"Lkotlin/time/Duration;", b.f42142b, k.O, "rawValue", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@JvmInline
@WasExperimental
@SourceDebugExtension
/* loaded from: classes.dex */
public final class Duration implements Comparable<Duration> {

    /* renamed from: b, reason: collision with root package name */
    public static final Companion f72038b = new Companion(0);

    /* renamed from: c, reason: collision with root package name */
    public static final long f72039c;

    /* renamed from: d, reason: collision with root package name */
    public static final long f72040d;

    /* renamed from: a, reason: collision with root package name */
    public final long f72041a;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/time/Duration$Companion;", b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(int i5) {
            this();
        }

        public static void a() {
            Companion companion = Duration.f72038b;
        }

        private Companion() {
        }
    }

    static {
        int i5 = DurationJvmKt.f72042a;
        f72039c = DurationKt.b(4611686018427387903L);
        f72040d = DurationKt.b(-4611686018427387903L);
    }

    public /* synthetic */ Duration(long j11) {
        this.f72041a = j11;
    }

    public static final long a(long j11, long j12) {
        long j13 = 1000000;
        long j14 = j12 / j13;
        long j15 = j11 + j14;
        if (-4611686018426L > j15 || j15 >= 4611686018427L) {
            return DurationKt.b(a.g0(j15, -4611686018427387903L, 4611686018427387903L));
        }
        return DurationKt.d((j15 * j13) + (j12 - (j14 * j13)));
    }

    public static final void b(StringBuilder sb2, int i5, int i11, int i12, String str, boolean z11) {
        sb2.append(i5);
        if (i11 != 0) {
            sb2.append('.');
            String strY0 = r70.k.Y0(i12, String.valueOf(i11));
            int i13 = -1;
            int length = strY0.length() - 1;
            if (length >= 0) {
                while (true) {
                    int i14 = length - 1;
                    if (strY0.charAt(length) != '0') {
                        i13 = length;
                        break;
                    } else if (i14 < 0) {
                        break;
                    } else {
                        length = i14;
                    }
                }
            }
            int i15 = i13 + 1;
            if (z11 || i15 >= 3) {
                sb2.append((CharSequence) strY0, 0, ((i13 + 3) / 3) * 3);
            } else {
                sb2.append((CharSequence) strY0, 0, i15);
            }
        }
        sb2.append(str);
    }

    public static int c(long j11, long j12) {
        long j13 = j11 ^ j12;
        if (j13 < 0 || (((int) j13) & 1) == 0) {
            return Intrinsics.i(j11, j12);
        }
        int i5 = (((int) j11) & 1) - (((int) j12) & 1);
        return j11 < 0 ? -i5 : i5;
    }

    public static final boolean d(long j11, long j12) {
        return j11 == j12;
    }

    public static final long g(long j11) {
        return q(j11, DurationUnit.f72049h);
    }

    public static final long h(long j11) {
        return ((((int) j11) & 1) != 1 || k(j11)) ? q(j11, DurationUnit.f72045d) : j11 >> 1;
    }

    public static final int i(long j11) {
        if (k(j11)) {
            return 0;
        }
        return (int) ((((int) j11) & 1) == 1 ? ((j11 >> 1) % 1000) * 1000000 : (j11 >> 1) % 1000000000);
    }

    public static final int j(long j11) {
        if (k(j11)) {
            return 0;
        }
        return (int) (q(j11, DurationUnit.f72046e) % 60);
    }

    public static final boolean k(long j11) {
        return j11 == f72039c || j11 == f72040d;
    }

    public static final long l(long j11, long j12) {
        return m(j11, t(j12));
    }

    public static final long m(long j11, long j12) {
        if (k(j11)) {
            if (!k(j12) || (j12 ^ j11) >= 0) {
                return j11;
            }
            throw new IllegalArgumentException("Summing infinite durations of different signs yields an undefined result.");
        }
        if (k(j12)) {
            return j12;
        }
        int i5 = ((int) j11) & 1;
        if (i5 != (((int) j12) & 1)) {
            return i5 == 1 ? a(j11 >> 1, j12 >> 1) : a(j12 >> 1, j11 >> 1);
        }
        long j13 = (j11 >> 1) + (j12 >> 1);
        return i5 == 0 ? (-4611686018426999999L > j13 || j13 >= 4611686018427000000L) ? DurationKt.b(j13 / 1000000) : DurationKt.d(j13) : DurationKt.c(j13);
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00a3, code lost:
    
        if ((java.lang.Integer.signum(r20) * java.lang.Long.signum(r6)) > 0) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00c3, code lost:
    
        if ((java.lang.Integer.signum(r20) * java.lang.Long.signum(r6)) > 0) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00c7, code lost:
    
        return kotlin.time.Duration.f72039c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00ca, code lost:
    
        return kotlin.time.Duration.f72040d;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final long n(int i5, long j11) {
        if (k(j11)) {
            if (i5 != 0) {
                return i5 > 0 ? j11 : t(j11);
            }
            throw new IllegalArgumentException("Multiplying infinite duration by zero yields an undefined result.");
        }
        if (i5 == 0) {
            return 0L;
        }
        long j12 = j11 >> 1;
        long j13 = i5;
        long j14 = j12 * j13;
        if ((((int) j11) & 1) == 0) {
            if (-2147483647L <= j12 && j12 < 2147483648L) {
                return DurationKt.d(j14);
            }
            if (j14 / j13 == j12) {
                return (-4611686018426999999L > j14 || j14 >= 4611686018427000000L) ? DurationKt.b(j14 / 1000000) : DurationKt.d(j14);
            }
            long j15 = 1000000;
            long j16 = j12 / j15;
            long j17 = j16 * j13;
            long j18 = (((j12 - (j16 * j15)) * j13) / j15) + j17;
            if (j17 / j13 == j16 && (j18 ^ j17) >= 0) {
                return DurationKt.b(a.h0(j18, new LongRange(-4611686018427387903L, 4611686018427387903L)));
            }
        } else if (j14 / j13 == j12) {
            return DurationKt.b(a.h0(j14, new LongRange(-4611686018427387903L, 4611686018427387903L)));
        }
    }

    public static final long o(long j11, double d5) {
        int iA = MathKt.a(d5);
        if (iA == d5) {
            return n(iA, j11);
        }
        DurationUnit durationUnit = (((int) j11) & 1) == 0 ? DurationUnit.f72043b : DurationUnit.f72045d;
        return DurationKt.f(p(j11, durationUnit) * d5, durationUnit);
    }

    public static final double p(long j11, DurationUnit unit) {
        Intrinsics.g(unit, "unit");
        if (j11 == f72039c) {
            return Double.POSITIVE_INFINITY;
        }
        if (j11 == f72040d) {
            return Double.NEGATIVE_INFINITY;
        }
        return DurationUnitKt.a(j11 >> 1, (((int) j11) & 1) == 0 ? DurationUnit.f72043b : DurationUnit.f72045d, unit);
    }

    public static final long q(long j11, DurationUnit unit) {
        Intrinsics.g(unit, "unit");
        if (j11 == f72039c) {
            return Long.MAX_VALUE;
        }
        if (j11 == f72040d) {
            return Long.MIN_VALUE;
        }
        return DurationUnitKt.b(j11 >> 1, (((int) j11) & 1) == 0 ? DurationUnit.f72043b : DurationUnit.f72045d, unit);
    }

    public static String r(long j11) {
        if (j11 == 0) {
            return "0s";
        }
        if (j11 == f72039c) {
            return "Infinity";
        }
        if (j11 == f72040d) {
            return "-Infinity";
        }
        int i5 = 0;
        boolean z11 = j11 < 0;
        StringBuilder sb2 = new StringBuilder();
        if (z11) {
            sb2.append('-');
        }
        if (j11 < 0) {
            j11 = t(j11);
        }
        long jQ = q(j11, DurationUnit.f72049h);
        int iQ = k(j11) ? 0 : (int) (q(j11, DurationUnit.f72048g) % 24);
        int iQ2 = k(j11) ? 0 : (int) (q(j11, DurationUnit.f72047f) % 60);
        int iJ = j(j11);
        int i11 = i(j11);
        boolean z12 = jQ != 0;
        boolean z13 = iQ != 0;
        boolean z14 = iQ2 != 0;
        boolean z15 = (iJ == 0 && i11 == 0) ? false : true;
        if (z12) {
            sb2.append(jQ);
            sb2.append('d');
            i5 = 1;
        }
        if (z13 || (z12 && (z14 || z15))) {
            int i12 = i5 + 1;
            if (i5 > 0) {
                sb2.append(' ');
            }
            sb2.append(iQ);
            sb2.append('h');
            i5 = i12;
        }
        if (z14 || (z15 && (z13 || z12))) {
            int i13 = i5 + 1;
            if (i5 > 0) {
                sb2.append(' ');
            }
            sb2.append(iQ2);
            sb2.append('m');
            i5 = i13;
        }
        if (z15) {
            int i14 = i5 + 1;
            if (i5 > 0) {
                sb2.append(' ');
            }
            if (iJ != 0 || z12 || z13 || z14) {
                b(sb2, iJ, i11, 9, "s", false);
            } else if (i11 >= 1000000) {
                b(sb2, i11 / 1000000, i11 % 1000000, 6, "ms", false);
            } else if (i11 >= 1000) {
                b(sb2, i11 / 1000, i11 % 1000, 3, "us", false);
            } else {
                sb2.append(i11);
                sb2.append("ns");
            }
            i5 = i14;
        }
        if (z11 && i5 > 1) {
            sb2.insert(1, '(').append(')');
        }
        return sb2.toString();
    }

    public static final long t(long j11) {
        long j12 = ((-(j11 >> 1)) << 1) + (((int) j11) & 1);
        int i5 = DurationJvmKt.f72042a;
        return j12;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Duration duration) {
        return c(this.f72041a, duration.f72041a);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof Duration) {
            return this.f72041a == ((Duration) obj).f72041a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f72041a);
    }

    public final String toString() {
        return r(this.f72041a);
    }
}
