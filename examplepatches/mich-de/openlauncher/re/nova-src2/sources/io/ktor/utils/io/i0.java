package io.ktor.utils.io;

import b.u4;
import java.io.EOFException;
import java.nio.channels.FileChannel;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public abstract class i0 {
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00ea  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r12v4, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r12v9, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:38:0x00cc -> B:39:0x00d3). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(t tVar, FileChannel fileChannel, long j11, ContinuationImpl continuationImpl) throws Throwable {
        h0 h0Var;
        Ref.LongRef longRef;
        g0 g0Var;
        Throwable thB;
        t tVar2;
        Ref.LongRef longRef2;
        long j12;
        g0 g0Var2;
        if (continuationImpl instanceof h0) {
            h0Var = (h0) continuationImpl;
            int i5 = h0Var.f66595z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h0Var.f66595z = i5 - Integer.MIN_VALUE;
            } else {
                h0Var = new h0(continuationImpl);
            }
        }
        Object obj = h0Var.f66594y;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h0Var.f66595z;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (j11 < 0) {
                throw new IllegalArgumentException(u4.g(j11, "Limit shouldn't be negative: ").toString());
            }
            if (tVar.h()) {
                Throwable thB2 = tVar.b();
                if (thB2 == null) {
                    return new Long(0L);
                }
                throw thB2;
            }
            longRef = new Ref.LongRef();
            g0Var = new g0(j11, longRef, fileChannel);
            if (longRef.f71862a < j11) {
            }
            thB = tVar.b();
            if (thB != null) {
            }
        } else if (i11 == 1) {
            j12 = h0Var.f66593x;
            t tVar3 = h0Var.f66592w;
            Function1 function1 = h0Var.f66591v;
            longRef2 = h0Var.f66590u;
            tVar2 = h0Var.f66589t;
            ResultKt.b(obj);
            if (!((Boolean) obj).booleanValue()) {
                StringBuilder sb2 = new StringBuilder("Not enough bytes available: required 0 but ");
                Intrinsics.g(tVar3, "<this>");
                e80.a aVarF = tVar3.f();
                aVarF.getClass();
                throw new EOFException(b.c0.o(sb2, (int) aVarF.f52247c, " available"));
            }
            ps.l.o(tVar3.f(), function1);
            g0Var2 = function1;
            longRef = longRef2;
            g0Var = g0Var2;
            j11 = j12;
            tVar = tVar2;
            if (longRef.f71862a < j11) {
            }
            thB = tVar.b();
            if (thB != null) {
            }
        } else {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j12 = h0Var.f66593x;
            t tVar4 = h0Var.f66592w;
            Function1 function12 = h0Var.f66591v;
            longRef2 = h0Var.f66590u;
            tVar2 = h0Var.f66589t;
            ResultKt.b(obj);
            g0 g0Var3 = function12;
            g0Var2 = g0Var3;
            if (((Boolean) obj).booleanValue()) {
                ps.l.o(tVar4.f(), g0Var3);
                g0Var2 = g0Var3;
            }
            longRef = longRef2;
            g0Var = g0Var2;
            j11 = j12;
            tVar = tVar2;
            if (longRef.f71862a < j11 || tVar.h()) {
                thB = tVar.b();
                if (thB != null) {
                    return new Long(longRef.f71862a);
                }
                throw thB;
            }
            h0Var.f66589t = tVar;
            h0Var.f66590u = longRef;
            h0Var.f66591v = g0Var;
            h0Var.f66592w = tVar;
            h0Var.f66593x = j11;
            h0Var.f66595z = 2;
            Object objG = tVar.g(1, h0Var);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
            tVar2 = tVar;
            long j13 = j11;
            tVar4 = tVar2;
            g0Var3 = g0Var;
            longRef2 = longRef;
            obj = objG;
            j12 = j13;
            g0Var2 = g0Var3;
            if (((Boolean) obj).booleanValue()) {
            }
            longRef = longRef2;
            g0Var = g0Var2;
            j11 = j12;
            tVar = tVar2;
            if (longRef.f71862a < j11) {
            }
            thB = tVar.b();
            if (thB != null) {
            }
        }
    }
}
