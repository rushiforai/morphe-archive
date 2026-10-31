package m10;

import b90.j;
import cw.l2;
import java.io.Closeable;
import java.util.Arrays;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.i0;
import x80.j0;
import x80.k0;
import x80.m0;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f75799a = new b();

    /* renamed from: b, reason: collision with root package name */
    public static final e0 f75800b = new e0(new d0());

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, long j12, byte[] bArr, ContinuationImpl continuationImpl) {
        a aVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f75798v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f75798v = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object objN = aVar.f75796t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f75798v;
        if (i11 == 0) {
            ResultKt.b(objN);
            i0 i0VarD = j0.d(k0.Companion, bArr, g.f75817a, 0, 6);
            g0 g0Var = new g0();
            g0Var.k(String.format("https://api.novalauncher.com/stats/rawDataLog/%016x/%d", Arrays.copyOf(new Object[]{new Long(j11), new Long(j12)}, 2)));
            g0Var.e("User-Agent", "com.teslacoilsw.launcher/89400");
            g0Var.h(i0VarD);
            j jVarC = f75800b.c(g0Var.b());
            aVar.f75798v = 1;
            objN = l2.n(jVarC, aVar);
            if (objN == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objN);
        }
        Closeable closeable = (Closeable) objN;
        try {
            int i12 = ((m0) closeable).f95556d;
            Boolean boolValueOf = Boolean.valueOf(i12 == 200 || i12 == 204);
            CloseableKt.a(closeable, null);
            return boolValueOf;
        } finally {
        }
    }
}
