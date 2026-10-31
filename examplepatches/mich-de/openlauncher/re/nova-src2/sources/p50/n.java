package p50;

import b.c0;
import com.google.android.gms.internal.measurement.ke;
import io.ktor.utils.io.f0;
import io.ktor.utils.io.j0;
import io.ktor.utils.io.q;
import io.ktor.utils.io.t;
import io.ktor.utils.io.t0;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.LongRange;
import kotlin.text.Charsets;
import ps.v;

/* loaded from: classes4.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final f80.a f82128a;

    /* renamed from: b, reason: collision with root package name */
    public static final f80.a f82129b;

    static {
        byte[] bArrZ = v.z("\r\n", Charsets.f72000b);
        f82128a = new f80.a(bArrZ, 0, bArrZ.length);
        f82129b = new f80.a(new byte[]{45, 45});
    }

    /* JADX WARN: Code restructure failed: missing block: B:69:0x0194, code lost:
    
        if (r0 != r7) goto L71;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:75:0x01ab  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Type inference failed for: r2v10, types: [io.ktor.utils.io.m, io.ktor.utils.io.t0] */
    /* JADX WARN: Type inference failed for: r3v10, types: [io.ktor.utils.io.j0] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(f80.a aVar, t0 t0Var, io.ktor.utils.io.m mVar, d dVar, long j11, ContinuationImpl continuationImpl) throws Throwable {
        k kVar;
        Object obj;
        long j12;
        Long l9;
        t0 t0Var2;
        f80.a aVar2;
        Object objB;
        j0 j0Var;
        long j13;
        j0 j0Var2;
        long jLongValue;
        Object obj2;
        io.ktor.utils.io.m mVar2;
        long jLongValue2;
        long j14;
        io.ktor.utils.io.m mVar3;
        Object obj3;
        io.ktor.utils.io.m mVar4 = mVar;
        if (continuationImpl instanceof k) {
            kVar = (k) continuationImpl;
            int i5 = kVar.f82121y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kVar.f82121y = i5 - Integer.MIN_VALUE;
            } else {
                kVar = new k(continuationImpl);
            }
        }
        k kVar2 = kVar;
        Object objD = kVar2.f82120x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kVar2.f82121y;
        if (i11 == 0) {
            ResultKt.b(objD);
            q50.b bVarA = dVar.a("Content-Length");
            if (bVarA != null) {
                int i12 = q50.f.f83688a;
                int length = bVarA.length();
                if (length > 19) {
                    throw new NumberFormatException("Invalid number " + ((Object) bVarA) + ": too large for Long type");
                }
                if (length == 19) {
                    int length2 = bVarA.length();
                    j13 = 0;
                    for (int i13 = 0; i13 < length2; i13++) {
                        long jCharAt = bVarA.charAt(i13) - 48;
                        if (jCharAt < 0 || jCharAt > 9) {
                            q50.f.b(bVarA, i13);
                            throw null;
                        }
                        j13 = (j13 << 3) + (j13 << 1) + jCharAt;
                        if (j13 < 0) {
                            throw new NumberFormatException("Invalid number " + ((Object) bVarA) + ": too large for Long type");
                        }
                    }
                    obj = null;
                    j12 = 0;
                } else {
                    obj = null;
                    j12 = 0;
                    j13 = 0;
                    for (int i14 = 0; i14 < length; i14++) {
                        long jCharAt2 = bVarA.charAt(i14) - 48;
                        if (jCharAt2 < 0 || jCharAt2 > 9) {
                            q50.f.b(bVarA, i14);
                            throw null;
                        }
                        j13 = (j13 << 3) + (j13 << 1) + jCharAt2;
                    }
                }
                l9 = new Long(j13);
            } else {
                obj = null;
                j12 = 0;
                l9 = null;
            }
            if (l9 == null) {
                kVar2.f82116t = mVar4;
                kVar2.f82121y = 1;
                objD = new q(t0Var, aVar, mVar4, j11).d(true, kVar2);
                if (objD != coroutineSingletons) {
                    j0Var = mVar4;
                    j0Var2 = j0Var;
                    jLongValue = ((Number) objD).longValue();
                    obj2 = obj;
                    kVar2.f82116t = obj2;
                    kVar2.f82119w = jLongValue;
                    kVar2.f82121y = 4;
                    if (j0Var2.c(kVar2) != coroutineSingletons) {
                    }
                }
            } else {
                t0Var2 = t0Var;
                long j15 = j12;
                LongRange longRange = new LongRange(j15, j11);
                long jLongValue3 = l9.longValue();
                if (j15 > jLongValue3 || jLongValue3 > longRange.f71916b) {
                    throw new IOException(a2.c.i(j11, "; limit is defined using 'formFieldLimit' argument", c0.u(l9.longValue(), "Multipart content length exceeds limit ", " > ")));
                }
                long jLongValue4 = l9.longValue();
                aVar2 = aVar;
                kVar2.f82116t = aVar2;
                kVar2.f82117u = t0Var2;
                kVar2.f82118v = mVar4;
                kVar2.f82121y = 2;
                objB = f0.b(t0Var2, mVar4, jLongValue4, kVar2);
                mVar2 = mVar4;
                if (objB != coroutineSingletons) {
                    jLongValue2 = ((Number) objB).longValue();
                    kVar2.f82116t = mVar2;
                    ?? r22 = obj;
                    kVar2.f82117u = r22;
                    kVar2.f82118v = r22;
                    kVar2.f82119w = jLongValue2;
                    kVar2.f82121y = 3;
                    objD = d(t0Var2, aVar2, kVar2);
                    obj3 = r22;
                    mVar3 = mVar2;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            j0Var = (j0) kVar2.f82116t;
            ResultKt.b(objD);
            obj = null;
            j0Var2 = j0Var;
            jLongValue = ((Number) objD).longValue();
            obj2 = obj;
            kVar2.f82116t = obj2;
            kVar2.f82119w = jLongValue;
            kVar2.f82121y = 4;
            if (j0Var2.c(kVar2) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 2) {
            if (i11 != 3) {
                if (i11 != 4) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j14 = kVar2.f82119w;
                ResultKt.b(objD);
                return new Long(j14);
            }
            long j16 = kVar2.f82119w;
            ?? r32 = (j0) kVar2.f82116t;
            ResultKt.b(objD);
            jLongValue2 = j16;
            obj3 = null;
            mVar3 = r32;
            jLongValue = ((Number) objD).longValue() + jLongValue2;
            obj2 = obj3;
            j0Var2 = mVar3;
            kVar2.f82116t = obj2;
            kVar2.f82119w = jLongValue;
            kVar2.f82121y = 4;
            if (j0Var2.c(kVar2) != coroutineSingletons) {
                j14 = jLongValue;
                return new Long(j14);
            }
            return coroutineSingletons;
        }
        io.ktor.utils.io.m mVar5 = kVar2.f82118v;
        t0 t0Var3 = kVar2.f82117u;
        f80.a aVar3 = (f80.a) kVar2.f82116t;
        ResultKt.b(objD);
        objB = objD;
        aVar2 = aVar3;
        mVar2 = mVar5;
        t0Var2 = t0Var3;
        obj = null;
        jLongValue2 = ((Number) objB).longValue();
        kVar2.f82116t = mVar2;
        ?? r222 = obj;
        kVar2.f82117u = r222;
        kVar2.f82118v = r222;
        kVar2.f82119w = jLongValue2;
        kVar2.f82121y = 3;
        objD = d(t0Var2, aVar2, kVar2);
        obj3 = r222;
        mVar3 = mVar2;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(t0 t0Var, ContinuationImpl continuationImpl) throws Throwable {
        l lVar;
        Throwable th2;
        q50.c cVar;
        ArrayList arrayList;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f82124v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f82124v = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(continuationImpl);
            }
        }
        Object obj = lVar.f82123u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f82124v;
        if (i11 == 0) {
            ResultKt.b(obj);
            q50.c cVar2 = new q50.c();
            try {
                lVar.f82122t = cVar2;
                lVar.f82124v = 1;
                Set set = g.f82107a;
                ke keVar = new ke(6, (byte) 0);
                keVar.f32738b = 0;
                keVar.f32739c = 0;
                Object objC = g.c(t0Var, cVar2, keVar, lVar);
                if (objC == coroutineSingletons) {
                    return coroutineSingletons;
                }
                obj = objC;
                cVar = cVar2;
            } catch (Throwable th3) {
                th2 = th3;
                cVar = cVar2;
                b60.e eVar = cVar.f83680a;
                arrayList = cVar.f83681b;
                if (arrayList == null) {
                    cVar.f83682c = null;
                    int size = arrayList.size();
                    for (int i12 = 0; i12 < size; i12++) {
                        eVar.W(arrayList.get(i12));
                    }
                } else {
                    char[] cArr = cVar.f83682c;
                    if (cArr != null) {
                        eVar.W(cArr);
                    }
                    cVar.f83682c = null;
                }
                cVar.f83684e = true;
                cVar.f83681b = null;
                cVar.f83683d = null;
                cVar.f83686g = 0;
                cVar.f83685f = 0;
                throw th2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cVar = lVar.f82122t;
            try {
                ResultKt.b(obj);
            } catch (Throwable th4) {
                th2 = th4;
                b60.e eVar2 = cVar.f83680a;
                arrayList = cVar.f83681b;
                if (arrayList == null) {
                }
                cVar.f83684e = true;
                cVar.f83681b = null;
                cVar.f83683d = null;
                cVar.f83686g = 0;
                cVar.f83685f = 0;
                throw th2;
            }
        }
        d dVar = (d) obj;
        if (dVar != null) {
            return dVar;
        }
        throw new EOFException("Failed to parse multipart headers: unexpected end of stream");
    }

    public static final void c(Ref.IntRef intRef, byte[] bArr, byte b11) throws IOException {
        int i5 = intRef.f71861a;
        if (i5 >= bArr.length) {
            throw new IOException("Failed to parse multipart: boundary shouldn't be longer than 70 characters");
        }
        intRef.f71861a = i5 + 1;
        bArr[i5] = b11;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(t tVar, f80.a aVar, ContinuationImpl continuationImpl) {
        m mVar;
        if (continuationImpl instanceof m) {
            mVar = (m) continuationImpl;
            int i5 = mVar.f82127v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mVar.f82127v = i5 - Integer.MIN_VALUE;
            } else {
                mVar = new m(continuationImpl);
            }
        }
        Object objK = mVar.f82126u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mVar.f82127v;
        if (i11 == 0) {
            ResultKt.b(objK);
            mVar.f82125t = aVar;
            mVar.f82127v = 1;
            objK = f0.k(tVar, aVar, mVar);
            if (objK == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            aVar = mVar.f82125t;
            ResultKt.b(objK);
        }
        return new Long(((Boolean) objK).booleanValue() ? aVar.f54354a.length : 0L);
    }
}
