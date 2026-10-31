package io.branch.search.internal;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.lang.reflect.Type;
import java.util.Iterator;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class S4 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final Lazy f63334a = LazyKt.a(a.f63335a);

    public static final class a extends Lambda implements Function0<Gson> {

        /* renamed from: a, reason: collision with root package name */
        public static final a f63335a = new a();

        public a() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            GsonBuilder fieldNamingPolicy = new GsonBuilder().setFieldNamingPolicy(com.google.gson.i.f34782a);
            Intrinsics.f(fieldNamingPolicy, "GsonBuilder()\n        .s…eldNamingPolicy.IDENTITY)");
            C3152fd c3152fd = new C3152fd();
            Lazy lazy = S4.f63334a;
            fieldNamingPolicy.registerTypeAdapter(C3135ed.class, c3152fd);
            fieldNamingPolicy.registerTypeAdapter(C3383t8.class, new C3400u8());
            fieldNamingPolicy.registerTypeAdapter(Tb.class, new Ub());
            fieldNamingPolicy.registerTypeAdapter(Pb.class, new Qb());
            K6 k62 = new K6();
            fieldNamingPolicy.registerTypeAdapter(J6.class, k62);
            Iterator<T> it = k62.f62784a.iterator();
            while (it.hasNext()) {
                Pair pair = (Pair) it.next();
                fieldNamingPolicy.registerTypeAdapter((Type) pair.f71683a, pair.f71684b);
            }
            fieldNamingPolicy.registerTypeAdapter(InterfaceC3299o8.class, new C3316p8());
            fieldNamingPolicy.registerTypeAdapter(C3282n8.class, new C3333q8());
            fieldNamingPolicy.registerTypeAdapter(A3.class, new B3());
            fieldNamingPolicy.registerTypeAdapter(Nf.class, new Of());
            return fieldNamingPolicy.create();
        }
    }

    @Nullable
    public static final com.google.gson.p a(@NotNull com.google.gson.r rVar, @NotNull String field) {
        Intrinsics.g(rVar, "<this>");
        Intrinsics.g(field, "field");
        com.google.gson.p pVarV = rVar.v(field);
        if (pVarV instanceof com.google.gson.q) {
            return null;
        }
        return pVarV;
    }
}
