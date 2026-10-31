package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3415v6;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class ig {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f64807a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final F2 f64808b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final fg f64809c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final P1 f64810d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final H f64811e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3139f0 f64812f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final InterfaceC3244l4 f64813g;

    public static final class a {
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.zerostate.ZeroStateUseCase", f = "ZeroStateUseCase.kt", l = {68}, m = "invoke")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public ig f64814a;

        /* renamed from: b, reason: collision with root package name */
        public String f64815b;

        /* renamed from: c, reason: collision with root package name */
        public Je f64816c;

        /* renamed from: d, reason: collision with root package name */
        public jg f64817d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f64818e;

        /* renamed from: g, reason: collision with root package name */
        public int f64820g;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f64818e = obj;
            this.f64820g |= Integer.MIN_VALUE;
            return ig.this.a((y40.d0) null, (RequestMetadata) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.zerostate.ZeroStateUseCase", f = "ZeroStateUseCase.kt", l = {88, 105}, m = "zerostateInternal")
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public ig f64821a;

        /* renamed from: b, reason: collision with root package name */
        public jg f64822b;

        /* renamed from: c, reason: collision with root package name */
        public Map f64823c;

        /* renamed from: d, reason: collision with root package name */
        public ArrayList f64824d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f64825e;

        /* renamed from: g, reason: collision with root package name */
        public int f64827g;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f64825e = obj;
            this.f64827g |= Integer.MIN_VALUE;
            return ig.this.a((jg) null, false, (Continuation<? super Map<EnumC3396u4, ? extends List<eg>>>) this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.zerostate.ZeroStateUseCase$zerostateInternal$3", f = "ZeroStateUseCase.kt", l = {}, m = "invokeSuspend")
    public static final class d extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ jg f64829b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ List<C3398u6> f64830c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(jg jgVar, List<C3398u6> list, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f64829b = jgVar;
            this.f64830c = list;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return ig.this.new d(this.f64829b, this.f64830c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((d) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            H h5 = ig.this.f64811e;
            jg jgVar = this.f64829b;
            h5.a(jgVar.f66312c, "virtual_request", C3483z6.a(jgVar, this.f64830c), false);
            return Unit.f71706a;
        }
    }

    public ig(@NotNull F4 contextDelegate, @NotNull G2 remoteConfigManager, @NotNull fg zeroStateRepository, @NotNull P1 branchConfiguration, @NotNull I analyticalBufferRepository, @NotNull C3139f0 analyticsRepository, @NotNull C3261m4 clock) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        Intrinsics.g(zeroStateRepository, "zeroStateRepository");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(analyticsRepository, "analyticsRepository");
        Intrinsics.g(clock, "clock");
        this.f64807a = contextDelegate;
        this.f64808b = remoteConfigManager;
        this.f64809c = zeroStateRepository;
        this.f64810d = branchConfiguration;
        this.f64811e = analyticalBufferRepository;
        this.f64812f = analyticsRepository;
        this.f64813g = clock;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r9v0, types: [y40.i] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull y40.d0 d0Var, @NotNull RequestMetadata requestMetadata, @NotNull Continuation<? super List<? extends BranchContainer<BranchEntity>>> continuation) {
        b bVar;
        String str;
        jg jgVar;
        ig igVar;
        Je je2;
        Object next;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f64820g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f64820g = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f64818e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f64820g;
        if (i11 == 0) {
            ResultKt.b(obj);
            Je je3 = new Je(EnumC3131e9.Latency, C3309p1.f65465a);
            y40.g gVar = d0Var.f96660b;
            if (gVar == null) {
                y40.g.Companion.getClass();
                gVar = y40.g.f96668e;
            }
            y40.k kVar = d0Var.f96661c;
            y40.k kVar2 = y40.k.f96673d;
            if (kVar == null) {
                y40.k.Companion.getClass();
                kVar = kVar2;
            }
            ?? r92 = d0Var.f96662d;
            if (r92 != 0) {
                kVar2 = r92;
            } else {
                y40.k.Companion.getClass();
            }
            gg ggVar = new gg(this.f64813g.getCurrentTimeMillis(), d0Var.f96659a, gVar.f96669c, gVar.f96670d, kVar.f96674c, kVar.f61556b, kVar2.n(), kVar2.g(), d0Var.f96663e);
            String callerId = requestMetadata.getCallerId();
            String sessionId = requestMetadata.getSessionId();
            String strJ = b.c0.j("randomUUID().toString()");
            jg jgVar2 = new jg(callerId, sessionId, ggVar, strJ);
            requestMetadata.setRequestId(strJ);
            boolean z11 = d0Var.f96664f;
            bVar.f64814a = this;
            str = "Workflow zero_state";
            bVar.f64815b = "Workflow zero_state";
            bVar.f64816c = je3;
            bVar.f64817d = jgVar2;
            bVar.f64820g = 1;
            Object objA = a(jgVar2, z11, bVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            obj = objA;
            jgVar = jgVar2;
            igVar = this;
            je2 = je3;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jgVar = bVar.f64817d;
            je2 = bVar.f64816c;
            str = bVar.f64815b;
            igVar = bVar.f64814a;
            ResultKt.b(obj);
        }
        Map map = (Map) obj;
        C3309p1.a("Zero state got " + map);
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry entry : map.entrySet()) {
            EnumC3396u4 enumC3396u4 = (EnumC3396u4) entry.getKey();
            List list = (List) entry.getValue();
            F4 f42 = igVar.f64807a;
            String str2 = enumC3396u4.f66001a;
            ArrayList arrayList2 = new ArrayList();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                BranchEntity branchEntityA = Zd.a((eg) it.next(), jgVar.f66312c, jgVar, f42, igVar.f64810d.f63047p);
                if (branchEntityA != null) {
                    arrayList2.add(branchEntityA);
                }
            }
            arrayList.add(new C3345r4(null, null, arrayList2, str2));
        }
        List<String> list2 = igVar.f64808b.a().f65351b0;
        ArrayList arrayList3 = new ArrayList();
        for (String str3 : list2) {
            Iterator it2 = arrayList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (Intrinsics.b(((BranchContainer) next).getContainerType(), str3)) {
                    break;
                }
            }
            BranchContainer branchContainer = (BranchContainer) next;
            if (branchContainer != null) {
                arrayList3.add(branchContainer);
            }
        }
        je2.a(str);
        return arrayList3;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x011c A[LOOP:0: B:39:0x0116->B:41:0x011c, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(jg jgVar, boolean z11, Continuation<? super Map<EnumC3396u4, ? extends List<eg>>> continuation) {
        c cVar;
        ig igVar;
        Map map;
        ig igVar2;
        jg jgVar2;
        ArrayList<C3398u6> arrayList;
        C3398u6 c3398u6;
        jg entityVirtualRequest = jgVar;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f64827g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f64827g = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        Object objA = cVar.f64825e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f64827g;
        if (i11 == 0) {
            ResultKt.b(objA);
            fg fgVar = this.f64809c;
            cVar.f64821a = this;
            cVar.f64822b = entityVirtualRequest;
            cVar.f64827g = 1;
            objA = fgVar.a(entityVirtualRequest, z11, cVar);
            if (objA != coroutineSingletons) {
                igVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            arrayList = cVar.f64824d;
            map = cVar.f64823c;
            jgVar2 = cVar.f64822b;
            igVar2 = cVar.f64821a;
            ResultKt.b(objA);
            C3137ef c3137ef = new C3137ef(jgVar2.f66313d, ((gg) jgVar2.f66314e).f64608a, jgVar2.f66310a, null, null, jgVar2.f66312c, jgVar2.f66311b);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            for (C3398u6 c3398u62 : arrayList) {
                AbstractC3466y6<?> abstractC3466y6 = c3398u62.f66012a;
                String str = abstractC3466y6.f66313d;
                C3364s6 c3364s6 = c3398u62.f66014c;
                arrayList2.add(new C3086bf(str, c3364s6.f65743b, c3364s6.f65747f, c3364s6.f65742a, abstractC3466y6.f66314e.a()));
            }
            igVar2.f64810d.getClass();
            igVar2.f64812f.a(c3137ef, arrayList2);
            return map;
        }
        entityVirtualRequest = cVar.f64822b;
        igVar = cVar.f64821a;
        ResultKt.b(objA);
        Map map2 = (Map) objA;
        ArrayList arrayListV0 = b70.c.v0(map2.values());
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayListV0, 10));
        Iterator it = arrayListV0.iterator();
        while (it.hasNext()) {
            eg egVar = (eg) it.next();
            Long l9 = egVar.f64429c;
            if (l9 != null) {
                c3398u6 = new C3398u6(egVar, entityVirtualRequest, (int) l9.longValue());
            } else {
                Intrinsics.g(entityVirtualRequest, "entityVirtualRequest");
                c3398u6 = new C3398u6(egVar, entityVirtualRequest, entityVirtualRequest.f66315f.getAndIncrement());
            }
            arrayList3.add(c3398u6);
        }
        Set setKeySet = map2.keySet();
        ArrayList arrayList4 = new ArrayList();
        Iterator it2 = setKeySet.iterator();
        while (it2.hasNext()) {
            String str2 = ((EnumC3396u4) it2.next()).f66001a;
            if (str2 != null) {
                arrayList4.add(str2);
            }
        }
        InterfaceC3415v6.b bVar = new InterfaceC3415v6.b(b70.g.N1(arrayList4));
        entityVirtualRequest.getClass();
        entityVirtualRequest.f66319j.add(bVar);
        d dVar = igVar.new d(entityVirtualRequest, arrayList3, null);
        cVar.f64821a = igVar;
        cVar.f64822b = entityVirtualRequest;
        cVar.f64823c = map2;
        cVar.f64824d = arrayList3;
        cVar.f64827g = 2;
        if (t70.k0.d(dVar, cVar) != coroutineSingletons) {
            map = map2;
            igVar2 = igVar;
            jgVar2 = entityVirtualRequest;
            arrayList = arrayList3;
            C3137ef c3137ef2 = new C3137ef(jgVar2.f66313d, ((gg) jgVar2.f66314e).f64608a, jgVar2.f66310a, null, null, jgVar2.f66312c, jgVar2.f66311b);
            ArrayList arrayList22 = new ArrayList(b70.c.u0(arrayList, 10));
            while (r1.hasNext()) {
            }
            igVar2.f64810d.getClass();
            igVar2.f64812f.a(c3137ef2, arrayList22);
            return map;
        }
        return coroutineSingletons;
    }
}
