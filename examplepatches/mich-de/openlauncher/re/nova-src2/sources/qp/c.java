package qp;

import b90.j;
import cw.l2;
import java.io.Closeable;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlinx.serialization.json.Json;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.i0;
import x80.j0;
import x80.k0;
import x80.m0;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public static final c f84300a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final e0 f84301b = new e0(new d0());

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(np.d dVar, String str, ContinuationImpl continuationImpl) {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f84299v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f84299v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, continuationImpl);
            }
        }
        Object objN = bVar.f84297t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f84299v;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(objN);
            Json.Companion companion = Json.INSTANCE;
            companion.getSerializersModule();
            String strEncodeToString = companion.encodeToString(np.d.Companion.serializer(), dVar);
            j0 j0Var = k0.Companion;
            a0 a0Var = d.f84302a;
            j0Var.getClass();
            i0 i0VarA = j0.a(strEncodeToString, a0Var);
            g0 g0Var = new g0();
            g0Var.k(str);
            g0Var.e("User-Agent", dVar.f78487b + "/" + dVar.f78488c);
            g0Var.h(i0VarA);
            j jVarC = f84301b.c(g0Var.b());
            bVar.f84299v = 1;
            objN = l2.n(jVarC, bVar);
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
            if (i12 != 200 && i12 != 204) {
                z11 = false;
            }
            Boolean boolValueOf = Boolean.valueOf(z11);
            CloseableKt.a(closeable, null);
            return boolValueOf;
        } finally {
        }
    }
}
