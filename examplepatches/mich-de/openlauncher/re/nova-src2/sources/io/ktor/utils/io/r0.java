package io.ktor.utils.io;

import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final q0 f66642a = new q0(null);

    public static final Object a(j0 j0Var, ContinuationImpl continuationImpl) throws Throwable {
        Object objC;
        Intrinsics.g(j0Var, "<this>");
        Throwable thB = j0Var.b();
        if (thB != null) {
            throw thB;
        }
        if (j0Var instanceof m) {
        }
        e80.j jVarE = j0Var.e();
        Intrinsics.g(jVarE, "<this>");
        return (((int) ((e80.a) jVarE).f52247c) < 1048576 || (objC = j0Var.c(continuationImpl)) != CoroutineSingletons.f71806a) ? Unit.f71706a : objC;
    }

    public static void b() {
        List list = u0.f66658b;
    }

    public static void c() {
        List list = u0.f66658b;
    }

    public static void d() {
        List list = u0.f66658b;
    }

    public static final String e(e80.k kVar) {
        Intrinsics.g(kVar, "<this>");
        return e80.m.c(kVar);
    }
}
