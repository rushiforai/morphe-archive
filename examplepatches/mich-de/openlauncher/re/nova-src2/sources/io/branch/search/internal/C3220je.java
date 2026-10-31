package io.branch.search.internal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.je, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3220je {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final c80.a f64902a = new c80.d();

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final HashMap<String, List<Function1<Object, Unit>>> f64903b = new HashMap<>();

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /* JADX WARN: Type inference failed for: r4v9, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(C3220je c3220je, String str, Function1 function1, Continuation continuation) {
        C3153fe c3153fe;
        c80.d dVar;
        Pair pair;
        c3220je.getClass();
        if (continuation instanceof C3153fe) {
            c3153fe = (C3153fe) continuation;
            int i5 = c3153fe.f64497g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3153fe.f64497g = i5 - Integer.MIN_VALUE;
            } else {
                c3153fe = new C3153fe(c3220je, continuation);
            }
        }
        Object obj = c3153fe.f64495e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3153fe.f64497g;
        if (i11 == 0) {
            ResultKt.b(obj);
            c80.a aVar = c3220je.f64902a;
            c3153fe.f64491a = c3220je;
            c3153fe.f64492b = str;
            c3153fe.f64493c = function1;
            c3153fe.f64494d = aVar;
            c3153fe.f64497g = 1;
            dVar = (c80.d) aVar;
            if (dVar.e(c3153fe) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r42 = c3153fe.f64494d;
            function1 = c3153fe.f64493c;
            str = c3153fe.f64492b;
            C3220je c3220je2 = c3153fe.f64491a;
            ResultKt.b(obj);
            dVar = r42;
            c3220je = c3220je2;
        }
        try {
            List<Function1<Object, Unit>> list = c3220je.f64903b.get(str);
            if (list == null) {
                ArrayList arrayList = new ArrayList();
                c3220je.f64903b.put(str, arrayList);
                pair = new Pair(Boolean.TRUE, arrayList);
            } else {
                pair = new Pair(Boolean.FALSE, list);
            }
            Boolean bool = (Boolean) pair.f71683a;
            bool.booleanValue();
            List list2 = (List) pair.f71684b;
            Intrinsics.e(function1, "null cannot be cast to non-null type kotlin.Function1<kotlin.Any, kotlin.Unit>");
            TypeIntrinsics.e(1, function1);
            list2.add(function1);
            dVar.g(null);
            return bool;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /* JADX WARN: Type inference failed for: r4v8, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(C3220je c3220je, String str, Object obj, Continuation continuation) {
        C3204ie c3204ie;
        c80.d dVar;
        c3220je.getClass();
        if (continuation instanceof C3204ie) {
            c3204ie = (C3204ie) continuation;
            int i5 = c3204ie.f64798g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3204ie.f64798g = i5 - Integer.MIN_VALUE;
            } else {
                c3204ie = new C3204ie(c3220je, continuation);
            }
        }
        Object obj2 = c3204ie.f64796e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3204ie.f64798g;
        if (i11 == 0) {
            ResultKt.b(obj2);
            c80.a aVar = c3220je.f64902a;
            c3204ie.f64792a = c3220je;
            c3204ie.f64793b = str;
            c3204ie.f64794c = obj;
            c3204ie.f64795d = aVar;
            c3204ie.f64798g = 1;
            dVar = (c80.d) aVar;
            if (dVar.e(c3204ie) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r42 = c3204ie.f64795d;
            obj = c3204ie.f64794c;
            str = c3204ie.f64793b;
            C3220je c3220je2 = c3204ie.f64792a;
            ResultKt.b(obj2);
            dVar = r42;
            c3220je = c3220je2;
        }
        try {
            List<Function1<Object, Unit>> list = c3220je.f64903b.get(str);
            c3220je.f64903b.remove(str);
            if (list != null) {
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    Function1 function1 = (Function1) it.next();
                    Intrinsics.e(function1, "null cannot be cast to non-null type kotlin.Function1<T of io.branch.search.internal.multiprocess.SingleCallStrategy.sendResponse$lambda-2, kotlin.Unit>");
                    TypeIntrinsics.e(1, function1);
                    arrayList.add(function1);
                }
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    ((Function1) it2.next()).invoke(obj);
                }
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
