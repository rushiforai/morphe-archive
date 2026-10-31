package z1;

import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class j implements Iterable, KMappedMarker {

    /* renamed from: e, reason: collision with root package name */
    public static final j f97936e = new j(0, 0, 0, null);

    /* renamed from: a, reason: collision with root package name */
    public final long f97937a;

    /* renamed from: b, reason: collision with root package name */
    public final long f97938b;

    /* renamed from: c, reason: collision with root package name */
    public final long f97939c;

    /* renamed from: d, reason: collision with root package name */
    public final long[] f97940d;

    public j(long j11, long j12, long j13, long[] jArr) {
        this.f97937a = j11;
        this.f97938b = j12;
        this.f97939c = j13;
        this.f97940d = jArr;
    }

    public final j b(j jVar) {
        j jVarC;
        long j11;
        long[] jArr;
        j jVar2 = f97936e;
        if (jVar == jVar2) {
            return this;
        }
        if (this == jVar2) {
            return jVar2;
        }
        long j12 = jVar.f97939c;
        long j13 = jVar.f97939c;
        long[] jArr2 = jVar.f97940d;
        long j14 = jVar.f97938b;
        long j15 = jVar.f97937a;
        long j16 = this.f97939c;
        if (j12 == j16 && jArr2 == (jArr = this.f97940d)) {
            return new j(this.f97937a & (~j15), this.f97938b & (~j14), j16, jArr);
        }
        if (jArr2 != null) {
            jVarC = this;
            for (long j17 : jArr2) {
                jVarC = jVarC.c(j17);
            }
        } else {
            jVarC = this;
        }
        long j18 = 0;
        if (j14 != 0) {
            int i5 = 0;
            while (i5 < 64) {
                if (((1 << i5) & j14) != j18) {
                    j11 = j18;
                    jVarC = jVarC.c(i5 + j13);
                } else {
                    j11 = j18;
                }
                i5++;
                j18 = j11;
            }
        }
        long j19 = j18;
        if (j15 != j19) {
            for (int i11 = 0; i11 < 64; i11++) {
                if (((1 << i11) & j15) != j19) {
                    jVarC = jVarC.c(i11 + j13 + 64);
                }
            }
        }
        return jVarC;
    }

    public final j c(long j11) {
        long[] jArr;
        int iA;
        long[] jArr2;
        long j12 = j11 - this.f97939c;
        long j13 = 0;
        if (Intrinsics.i(j12, j13) >= 0 && Intrinsics.i(j12, 64) < 0) {
            long j14 = 1 << ((int) j12);
            long j15 = this.f97938b;
            if ((j15 & j14) != 0) {
                return new j(this.f97937a, j15 & (~j14), this.f97939c, this.f97940d);
            }
        } else if (Intrinsics.i(j12, 64) >= 0 && Intrinsics.i(j12, 128) < 0) {
            long j16 = 1 << (((int) j12) - 64);
            long j17 = this.f97937a;
            if ((j17 & j16) != 0) {
                return new j(j17 & (~j16), this.f97938b, this.f97939c, this.f97940d);
            }
        } else if (Intrinsics.i(j12, j13) < 0 && (jArr = this.f97940d) != null && (iA = w20.e.a(jArr, j11)) >= 0) {
            int length = jArr.length;
            int i5 = length - 1;
            if (i5 == 0) {
                jArr2 = null;
            } else {
                long[] jArr3 = new long[i5];
                if (iA > 0) {
                    u90.b.s(jArr, jArr3, 0, 0, iA);
                }
                if (iA < i5) {
                    u90.b.s(jArr, jArr3, iA, iA + 1, length);
                }
                jArr2 = jArr3;
            }
            return new j(this.f97937a, this.f97938b, this.f97939c, jArr2);
        }
        return this;
    }

    public final boolean d(long j11) {
        long[] jArr;
        long j12 = j11 - this.f97939c;
        long j13 = 0;
        return (Intrinsics.i(j12, j13) < 0 || Intrinsics.i(j12, (long) 64) >= 0) ? (Intrinsics.i(j12, (long) 64) < 0 || Intrinsics.i(j12, (long) 128) >= 0) ? Intrinsics.i(j12, j13) <= 0 && (jArr = this.f97940d) != null && w20.e.a(jArr, j11) >= 0 : ((1 << (((int) j12) - 64)) & this.f97937a) != 0 : ((1 << ((int) j12)) & this.f97938b) != 0;
    }

    public final j e(j jVar) {
        j jVarF;
        j jVarF2;
        long[] jArr;
        j jVar2 = f97936e;
        if (jVar == jVar2) {
            return this;
        }
        if (this == jVar2) {
            return jVar;
        }
        long j11 = jVar.f97939c;
        long j12 = jVar.f97939c;
        long[] jArr2 = jVar.f97940d;
        long j13 = jVar.f97938b;
        long j14 = jVar.f97937a;
        long j15 = this.f97939c;
        long j16 = this.f97938b;
        long j17 = this.f97937a;
        if (j11 == j15 && jArr2 == (jArr = this.f97940d)) {
            return new j(j17 | j14, j16 | j13, j15, jArr);
        }
        int i5 = 0;
        long[] jArr3 = this.f97940d;
        if (jArr3 != null) {
            if (jArr2 != null) {
                jVarF = this;
                for (long j18 : jArr2) {
                    jVarF = jVarF.f(j18);
                }
            } else {
                jVarF = this;
            }
            if (j13 != 0) {
                for (int i11 = 0; i11 < 64; i11++) {
                    if (((1 << i11) & j13) != 0) {
                        jVarF = jVarF.f(i11 + j12);
                    }
                }
            }
            if (j14 != 0) {
                while (i5 < 64) {
                    if (((1 << i5) & j14) != 0) {
                        jVarF = jVarF.f(i5 + j12 + 64);
                    }
                    i5++;
                }
            }
            return jVarF;
        }
        if (jArr3 != null) {
            jVarF2 = jVar;
            for (long j19 : jArr3) {
                jVarF2 = jVarF2.f(j19);
            }
        } else {
            jVarF2 = jVar;
        }
        long j21 = this.f97939c;
        if (j16 != 0) {
            for (int i12 = 0; i12 < 64; i12++) {
                if (((1 << i12) & j16) != 0) {
                    jVarF2 = jVarF2.f(i12 + j21);
                }
            }
        }
        if (j17 != 0) {
            while (i5 < 64) {
                if (((1 << i5) & j17) != 0) {
                    jVarF2 = jVarF2.f(i5 + j21 + 64);
                }
                i5++;
            }
        }
        return jVarF2;
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x010e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final j f(long j11) {
        long[] jArr;
        long j12;
        long[] jArr2;
        long[] jArr3;
        long[] jArr4;
        long j13 = this.f97939c;
        long j14 = j11 - j13;
        long j15 = 0;
        int i5 = Intrinsics.i(j14, j15);
        long j16 = this.f97938b;
        int i11 = 64;
        long j17 = 0;
        if (i5 < 0 || Intrinsics.i(j14, 64) >= 0) {
            long j18 = 64;
            int i12 = Intrinsics.i(j14, j18);
            long j19 = this.f97937a;
            if (i12 < 0 || Intrinsics.i(j14, 128) >= 0) {
                long j21 = 128;
                int i13 = Intrinsics.i(j14, j21);
                long[] jArr5 = this.f97940d;
                if (i13 < 0) {
                    if (jArr5 == null) {
                        return new j(this.f97937a, this.f97938b, this.f97939c, new long[]{j11});
                    }
                    int iA = w20.e.a(jArr5, j11);
                    if (iA < 0) {
                        int i14 = -(iA + 1);
                        int length = jArr5.length;
                        long[] jArr6 = new long[length + 1];
                        u90.b.s(jArr5, jArr6, 0, 0, i14);
                        u90.b.s(jArr5, jArr6, i14 + 1, i14, length);
                        jArr6[i14] = j11;
                        return new j(this.f97937a, this.f97938b, this.f97939c, jArr6);
                    }
                } else if (!d(j11)) {
                    long j22 = 1;
                    long j23 = ((j11 + j22) / j18) * j18;
                    if (Intrinsics.i(j23, j15) < 0) {
                        j23 = (Long.MAX_VALUE - j21) + j22;
                    }
                    long j24 = j13;
                    long j25 = j19;
                    zl.d dVar = null;
                    while (true) {
                        if (Intrinsics.i(j24, j23) >= 0) {
                            jArr = jArr5;
                            j12 = j24;
                            j17 = j16;
                            break;
                        }
                        if (j16 != 0) {
                            if (dVar == null) {
                                dVar = new zl.d(jArr5);
                            }
                            int i15 = 0;
                            while (i15 < i11) {
                                if ((j16 & (1 << i15)) != 0) {
                                    jArr4 = jArr5;
                                    ((z.e0) dVar.f98570a).a(i15 + j24);
                                } else {
                                    jArr4 = jArr5;
                                }
                                i15++;
                                jArr5 = jArr4;
                                i11 = 64;
                            }
                        }
                        long[] jArr7 = jArr5;
                        if (j25 == 0) {
                            j12 = j23;
                            jArr = jArr7;
                            break;
                        }
                        j24 += j18;
                        jArr5 = jArr7;
                        j16 = j25;
                        i11 = 64;
                        j25 = 0;
                    }
                    if (dVar == null) {
                        jArr2 = jArr;
                    } else {
                        z.e0 e0Var = (z.e0) dVar.f98570a;
                        int i16 = e0Var.f97814b;
                        if (i16 == 0) {
                            jArr3 = null;
                        } else {
                            long[] jArr8 = new long[i16];
                            long[] jArr9 = e0Var.f97813a;
                            for (int i17 = 0; i17 < i16; i17++) {
                                jArr8[i17] = jArr9[i17];
                            }
                            jArr3 = jArr8;
                        }
                        if (jArr3 != null) {
                            jArr2 = jArr3;
                        }
                    }
                    return new j(j25, j17, j12, jArr2).f(j11);
                }
            } else {
                long j26 = 1 << (((int) j14) - 64);
                if ((j19 & j26) == 0) {
                    return new j(j19 | j26, this.f97938b, this.f97939c, this.f97940d);
                }
            }
        } else {
            long j27 = 1 << ((int) j14);
            if ((j16 & j27) == 0) {
                return new j(this.f97937a, j16 | j27, this.f97939c, this.f97940d);
            }
        }
        return this;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.coroutines.jvm.internal.RestrictedSuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return u90.b.O(new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new i(this, null)).f71969a);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(super.toString());
        sb2.append(" [");
        ArrayList arrayList = new ArrayList(b70.c.u0(this, 10));
        Iterator it = iterator();
        while (it.hasNext()) {
            arrayList.add(String.valueOf(((Number) it.next()).longValue()));
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        int size = arrayList.size();
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            Object obj = arrayList.get(i11);
            i5++;
            if (i5 > 1) {
                sb3.append((CharSequence) ", ");
            }
            if (obj != null ? obj instanceof CharSequence : true) {
                sb3.append((CharSequence) obj);
            } else if (obj instanceof Character) {
                sb3.append(((Character) obj).charValue());
            } else {
                sb3.append((CharSequence) obj.toString());
            }
        }
        sb3.append((CharSequence) com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        sb2.append(sb3.toString());
        sb2.append(AbstractJsonLexerKt.END_LIST);
        return sb2.toString();
    }
}
