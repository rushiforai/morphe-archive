package io.branch.search.internal;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import io.branch.search.internal.InterfaceC3415v6;
import io.branch.search.ui.BranchContainer;
import io.branch.search.ui.BranchEntity;
import io.branch.search.ui.Image;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.md, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3270md {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f65174a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3203id f65175b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final P1 f65176c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final H f65177d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3139f0 f65178e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final InterfaceC3244l4 f65179f;

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.SearchUseCase", f = "SearchUseCase.kt", l = {67}, m = "invoke")
    /* renamed from: io.branch.search.internal.md$a */
    public static final class a extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3270md f65180a;

        /* renamed from: b, reason: collision with root package name */
        public String f65181b;

        /* renamed from: c, reason: collision with root package name */
        public Je f65182c;

        /* renamed from: d, reason: collision with root package name */
        public C3287nd f65183d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f65184e;

        /* renamed from: g, reason: collision with root package name */
        public int f65186g;

        public a(Continuation<? super a> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65184e = obj;
            this.f65186g |= Integer.MIN_VALUE;
            return C3270md.this.a((y40.b0) null, (RequestMetadata) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.SearchUseCase", f = "SearchUseCase.kt", l = {80, ads_mobile_sdk.pd.O0}, m = "searchInternal")
    /* renamed from: io.branch.search.internal.md$b */
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3270md f65187a;

        /* renamed from: b, reason: collision with root package name */
        public C3287nd f65188b;

        /* renamed from: c, reason: collision with root package name */
        public Map f65189c;

        /* renamed from: d, reason: collision with root package name */
        public ArrayList f65190d;

        /* renamed from: e, reason: collision with root package name */
        public /* synthetic */ Object f65191e;

        /* renamed from: g, reason: collision with root package name */
        public int f65193g;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65191e = obj;
            this.f65193g |= Integer.MIN_VALUE;
            return C3270md.this.a((C3287nd) null, false, (Continuation<? super Map<EnumC3396u4, ? extends List<C3186hd>>>) this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.SearchUseCase$searchInternal$3", f = "SearchUseCase.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.md$c */
    public static final class c extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C3287nd f65195b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ List<C3398u6> f65196c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(C3287nd c3287nd, List<C3398u6> list, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f65195b = c3287nd;
            this.f65196c = list;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3270md.this.new c(this.f65195b, this.f65196c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((c) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            H h5 = C3270md.this.f65177d;
            C3287nd c3287nd = this.f65195b;
            h5.a(c3287nd.f66312c, "virtual_request", C3483z6.a(c3287nd, this.f65196c), false);
            return Unit.f71706a;
        }
    }

    public C3270md(@NotNull F4 contextDelegate, @NotNull C3203id searchRepository, @NotNull P1 branchConfiguration, @NotNull I analyticalBufferRepository, @NotNull C3139f0 analyticsRepository, @NotNull C3261m4 clock) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(searchRepository, "searchRepository");
        Intrinsics.g(branchConfiguration, "branchConfiguration");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(analyticsRepository, "analyticsRepository");
        Intrinsics.g(clock, "clock");
        this.f65174a = contextDelegate;
        this.f65175b = searchRepository;
        this.f65176c = branchConfiguration;
        this.f65177d = analyticalBufferRepository;
        this.f65178e = analyticsRepository;
        this.f65179f = clock;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull y40.b0 b0Var, @NotNull RequestMetadata requestMetadata, @NotNull Continuation<? super List<? extends BranchContainer<BranchEntity>>> continuation) {
        a aVar;
        Je je2;
        String str;
        C3270md c3270md;
        Je je3;
        C3287nd c3287nd;
        EmptyList emptyList;
        Image.Url url;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f65186g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f65186g = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(continuation);
            }
        }
        Object objA = aVar.f65184e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f65186g;
        if (i11 == 0) {
            ResultKt.b(objA);
            je2 = new Je(EnumC3131e9.Latency, C3309p1.f65465a);
            String str2 = b0Var.f96653a;
            str = "UseCase local_search";
            if (str2 == null || str2.length() == 0) {
                emptyList = EmptyList.f71733a;
                je2.a(str);
                return emptyList;
            }
            String str3 = b0Var.f96653a;
            C3219jd c3219jd = new C3219jd(this.f65179f.getCurrentTimeMillis(), str3, C3217jb.a(str3, true));
            String callerId = requestMetadata.getCallerId();
            String sessionId = requestMetadata.getSessionId();
            String strJ = b.c0.j("randomUUID().toString()");
            C3287nd c3287nd2 = new C3287nd(callerId, sessionId, c3219jd, strJ);
            requestMetadata.setRequestId(strJ);
            boolean z11 = b0Var.f96654b;
            aVar.f65180a = this;
            aVar.f65181b = "UseCase local_search";
            aVar.f65182c = je2;
            aVar.f65183d = c3287nd2;
            aVar.f65186g = 1;
            objA = a(c3287nd2, z11, aVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3270md = this;
            je3 = je2;
            c3287nd = c3287nd2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c3287nd = aVar.f65183d;
            je3 = aVar.f65182c;
            str = aVar.f65181b;
            c3270md = aVar.f65180a;
            ResultKt.b(objA);
        }
        Map map = (Map) objA;
        ArrayList arrayList = new ArrayList(map.size());
        for (Map.Entry entry : map.entrySet()) {
            EnumC3396u4 enumC3396u4 = (EnumC3396u4) entry.getKey();
            List list = (List) entry.getValue();
            F4 f42 = c3270md.f65174a;
            String str4 = enumC3396u4.f66001a;
            String str5 = ((C3219jd) c3287nd.f66314e).f64899a;
            Context context = f42.f62438a;
            String string = Intrinsics.b(str4, "search_more") ? context.getString(2132019467, str5) : Intrinsics.b(str4, "related_apps") ? context.getString(2132019380) : null;
            String str6 = enumC3396u4.f66001a;
            String str7 = ((C3219jd) c3287nd.f66314e).f64899a;
            if (Intrinsics.b(str6, "search_more")) {
                Resources resources = f42.f62438a.getResources();
                Intrinsics.f(resources, "context.resources");
                String string2 = Uri.parse("android.resource://" + resources.getResourcePackageName(17301583) + '/' + resources.getResourceTypeName(17301583) + '/' + resources.getResourceEntryName(17301583)).toString();
                Intrinsics.f(string2, "parse(\n                C…\n            ).toString()");
                H2 resultType = H2.REMOTE_SEARCH;
                Intrinsics.g(resultType, "resultType");
                url = new Image.Url(string2, resultType, null);
            } else {
                url = null;
            }
            String str8 = enumC3396u4.f66001a;
            ArrayList arrayList2 = new ArrayList();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                BranchEntity branchEntityA = Zd.a((C3186hd) it.next(), c3287nd.f66312c, c3287nd, f42, c3270md.f65176c.f63047p);
                if (branchEntityA != null) {
                    arrayList2.add(branchEntityA);
                }
            }
            arrayList.add(new C3345r4(string, url, arrayList2, str8));
        }
        je2 = je3;
        emptyList = arrayList;
        je2.a(str);
        return emptyList;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0124 A[LOOP:0: B:37:0x011e->B:39:0x0124, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(C3287nd c3287nd, boolean z11, Continuation<? super Map<EnumC3396u4, ? extends List<C3186hd>>> continuation) {
        b bVar;
        C3270md c3270md;
        Map map;
        C3270md c3270md2;
        C3287nd c3287nd2;
        ArrayList<C3398u6> arrayList;
        C3398u6 c3398u6;
        C3287nd entityVirtualRequest = c3287nd;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f65193g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f65193g = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objA = bVar.f65191e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f65193g;
        if (i11 == 0) {
            ResultKt.b(objA);
            C3203id c3203id = this.f65175b;
            bVar.f65187a = this;
            bVar.f65188b = entityVirtualRequest;
            bVar.f65193g = 1;
            objA = c3203id.a(entityVirtualRequest, z11, bVar);
            if (objA != coroutineSingletons) {
                c3270md = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            arrayList = bVar.f65190d;
            map = bVar.f65189c;
            c3287nd2 = bVar.f65188b;
            c3270md2 = bVar.f65187a;
            ResultKt.b(objA);
            String str = c3287nd2.f66313d;
            C3219jd c3219jd = (C3219jd) c3287nd2.f66314e;
            C3137ef c3137ef = new C3137ef(str, c3219jd.f64901c, c3287nd2.f66310a, c3219jd.f64899a, c3219jd.f64900b, c3287nd2.f66312c, c3287nd2.f66311b);
            ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
            for (C3398u6 c3398u62 : arrayList) {
                AbstractC3466y6<?> abstractC3466y6 = c3398u62.f66012a;
                String str2 = abstractC3466y6.f66313d;
                C3364s6 c3364s6 = c3398u62.f66014c;
                arrayList2.add(new C3086bf(str2, c3364s6.f65743b, c3364s6.f65747f, c3364s6.f65742a, abstractC3466y6.f66314e.a()));
            }
            c3270md2.f65176c.getClass();
            c3270md2.f65178e.a(c3137ef, arrayList2);
            return map;
        }
        entityVirtualRequest = bVar.f65188b;
        c3270md = bVar.f65187a;
        ResultKt.b(objA);
        Map map2 = (Map) objA;
        ArrayList arrayListV0 = b70.c.v0(map2.values());
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayListV0, 10));
        Iterator it = arrayListV0.iterator();
        while (it.hasNext()) {
            C3186hd c3186hd = (C3186hd) it.next();
            Long l9 = c3186hd.f64666d;
            if (l9 != null) {
                c3398u6 = new C3398u6(c3186hd, entityVirtualRequest, (int) l9.longValue());
            } else {
                Intrinsics.g(entityVirtualRequest, "entityVirtualRequest");
                c3398u6 = new C3398u6(c3186hd, entityVirtualRequest, entityVirtualRequest.f66315f.getAndIncrement());
            }
            arrayList3.add(c3398u6);
        }
        Set setKeySet = map2.keySet();
        ArrayList arrayList4 = new ArrayList(b70.c.u0(setKeySet, 10));
        Iterator it2 = setKeySet.iterator();
        while (it2.hasNext()) {
            arrayList4.add(((EnumC3396u4) it2.next()).f66001a);
        }
        InterfaceC3415v6.b bVar2 = new InterfaceC3415v6.b(b70.g.N1(arrayList4));
        entityVirtualRequest.getClass();
        entityVirtualRequest.f66319j.add(bVar2);
        c cVar = c3270md.new c(entityVirtualRequest, arrayList3, null);
        bVar.f65187a = c3270md;
        bVar.f65188b = entityVirtualRequest;
        bVar.f65189c = map2;
        bVar.f65190d = arrayList3;
        bVar.f65193g = 2;
        if (t70.k0.d(cVar, bVar) != coroutineSingletons) {
            map = map2;
            c3270md2 = c3270md;
            c3287nd2 = entityVirtualRequest;
            arrayList = arrayList3;
            String str3 = c3287nd2.f66313d;
            C3219jd c3219jd2 = (C3219jd) c3287nd2.f66314e;
            C3137ef c3137ef2 = new C3137ef(str3, c3219jd2.f64901c, c3287nd2.f66310a, c3219jd2.f64899a, c3219jd2.f64900b, c3287nd2.f66312c, c3287nd2.f66311b);
            ArrayList arrayList22 = new ArrayList(b70.c.u0(arrayList, 10));
            while (r1.hasNext()) {
            }
            c3270md2.f65176c.getClass();
            c3270md2.f65178e.a(c3137ef2, arrayList22);
            return map;
        }
        return coroutineSingletons;
    }
}
