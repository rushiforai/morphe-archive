package io.branch.search.internal;

import com.vungle.ads.internal.protos.Sdk;
import io.branch.engage.sesame_lite.internal.SearchMoreType;
import io.branch.search.internal.C3269mc;
import io.branch.search.internal.C7;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class V9 extends U9 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final F4 f63508e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3269mc f63509f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f63510g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final List<u40.a> f63511h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final List<u40.a> f63512i;

    public static final class a {
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.repository.OrganicsSearchRepository", f = "OrganicsSearchRepository.kt", l = {Sdk.SDKError.Reason.INVALID_ADUNIT_BID_PAYLOAD_VALUE}, m = "doSearchMore")
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public V9 f63513a;

        /* renamed from: b, reason: collision with root package name */
        public String f63514b;

        /* renamed from: c, reason: collision with root package name */
        public List f63515c;

        /* renamed from: d, reason: collision with root package name */
        public /* synthetic */ Object f63516d;

        /* renamed from: f, reason: collision with root package name */
        public int f63518f;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63516d = obj;
            this.f63518f |= Integer.MIN_VALUE;
            return V9.this.a(null, null, this);
        }
    }

    public static final class c extends Lambda implements Function0<String> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63519a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ List<String> f63520b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ List<u40.r> f63521c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(List list, String str, List list2) {
            super(0);
            this.f63519a = str;
            this.f63520b = list;
            this.f63521c = list2;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            return "SearchMore for " + this.f63519a + " of type " + b70.g.f1(this.f63520b, null, null, null, 0, Z9.f63829a, 31) + " produced " + this.f63521c.size() + " results";
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.repository.OrganicsSearchRepository", f = "OrganicsSearchRepository.kt", l = {ads_mobile_sdk.pd.R0}, m = "getSearchMore")
    public static final class d extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f63522a;

        /* renamed from: c, reason: collision with root package name */
        public int f63524c;

        public d(Continuation<? super d> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63522a = obj;
            this.f63524c |= Integer.MIN_VALUE;
            return V9.this.a(null, null, null, null, null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.repository.OrganicsSearchRepository", f = "OrganicsSearchRepository.kt", l = {61}, m = "getShortcuts")
    public static final class e extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public int f63525a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f63526b;

        /* renamed from: d, reason: collision with root package name */
        public int f63528d;

        public e(Continuation<? super e> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63526b = obj;
            this.f63528d |= Integer.MIN_VALUE;
            return V9.this.a((String) null, (String) null, (String) null, (String) null, 0L, 0, (String) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.requesthandler.search.repository.OrganicsSearchRepository", f = "OrganicsSearchRepository.kt", l = {183}, m = "searchMore")
    public static final class f extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public V9 f63529a;

        /* renamed from: b, reason: collision with root package name */
        public String f63530b;

        /* renamed from: c, reason: collision with root package name */
        public String f63531c;

        /* renamed from: d, reason: collision with root package name */
        public String f63532d;

        /* renamed from: e, reason: collision with root package name */
        public long f63533e;

        /* renamed from: f, reason: collision with root package name */
        public /* synthetic */ Object f63534f;

        /* renamed from: h, reason: collision with root package name */
        public int f63536h;

        public f(Continuation<? super f> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f63534f = obj;
            this.f63536h |= Integer.MIN_VALUE;
            return V9.this.a(null, null, null, 0L, null, null, this);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V9(@NotNull F4 contextDelegate, @NotNull C3269mc ssml, boolean z11, @NotNull List searchAppDataTypes, @NotNull List searchShortcutDataTypes, @NotNull I analyticalBufferRepository, @NotNull C3356rf userHandleRepository) {
        super("OrganicsSearchRepository", contextDelegate, analyticalBufferRepository, userHandleRepository, z11);
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(ssml, "ssml");
        Intrinsics.g(searchAppDataTypes, "searchAppDataTypes");
        Intrinsics.g(searchShortcutDataTypes, "searchShortcutDataTypes");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        this.f63508e = contextDelegate;
        this.f63509f = ssml;
        this.f63510g = z11;
        this.f63511h = searchAppDataTypes;
        this.f63512i = searchShortcutDataTypes;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, List list, boolean z11, int i5, long j11, int i11, Continuation continuation) {
        W9 w92;
        V9 v92;
        String str3;
        List list2;
        Object obj;
        if (continuation instanceof W9) {
            w92 = (W9) continuation;
            int i12 = w92.f63591f;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                w92.f63591f = i12 - Integer.MIN_VALUE;
            } else {
                w92 = new W9(this, continuation);
            }
        }
        Object obj2 = w92.f63589d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = w92.f63591f;
        if (i13 == 0) {
            ResultKt.b(obj2);
            EnumSet<u40.a> ssmlTypes = EnumSet.copyOf((Collection) list);
            C3269mc c3269mc = this.f63509f;
            C3269mc.Companion.getClass();
            long jA = C3269mc.a.a(str);
            Intrinsics.f(ssmlTypes, "ssmlTypes");
            long[] jArrA = a(j11, ssmlTypes);
            w92.f63586a = this;
            w92.f63587b = str2;
            w92.f63588c = list;
            w92.f63591f = 1;
            Object objSearch = ((u40.h) c3269mc.f65159f.getValue()).search(jA, str2, null, ssmlTypes, z11, i5, jArrA, i11);
            if (objSearch == coroutineSingletons) {
                return coroutineSingletons;
            }
            v92 = this;
            str3 = str2;
            list2 = list;
            obj = objSearch;
        } else {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list2 = w92.f63588c;
            str3 = w92.f63587b;
            v92 = w92.f63586a;
            ResultKt.b(obj2);
            obj = obj2;
        }
        C3309p1.a(EnumC3131e9.SesameLite, (Throwable) null, new Y9(str3, list2, (u40.r[]) obj));
        Object[] objArr = (Object[]) obj;
        ArrayList arrayList = new ArrayList(objArr.length);
        for (Object obj3 : objArr) {
            arrayList.add(C3068ae.a((u40.r) obj3, v92.f63510g, v92.f63453d, v92.f63508e));
        }
        return arrayList;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, List<String> list, Continuation<? super List<C3186hd>> continuation) {
        b bVar;
        V9 v92;
        SearchMoreType searchMoreType;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f63518f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f63518f = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object objSearchMore = bVar.f63516d;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = bVar.f63518f;
        if (i11 == 0) {
            ResultKt.b(objSearchMore);
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            for (String string : list) {
                Intrinsics.g(string, "<this>");
                int iW0 = r70.k.W0(2, string, "-web");
                if (iW0 >= 0) {
                    string = r70.k.e1(string, iW0, iW0 + 4, "-app").toString();
                }
                arrayList.add(string);
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (true) {
                int i12 = 0;
                if (!it.hasNext()) {
                    break;
                }
                kotlin.text.b bVarB = new Regex("-(.*?)-").b((String) it.next());
                String str2 = bVarB != null ? (String) b70.g.Z0(1, bVarB.a()) : null;
                SearchMoreType[] searchMoreTypeArrValues = SearchMoreType.values();
                int length = searchMoreTypeArrValues.length;
                while (true) {
                    if (i12 >= length) {
                        searchMoreType = null;
                        break;
                    }
                    searchMoreType = searchMoreTypeArrValues[i12];
                    if (Intrinsics.b(searchMoreType.getPackageName(), str2)) {
                        break;
                    }
                    i12++;
                }
                if (searchMoreType != null) {
                    arrayList2.add(searchMoreType);
                }
            }
            Object[] array = arrayList2.toArray(new SearchMoreType[0]);
            Intrinsics.e(array, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.toTypedArray>");
            C3269mc c3269mc = this.f63509f;
            bVar.f63513a = this;
            bVar.f63514b = str;
            bVar.f63515c = list;
            bVar.f63518f = 1;
            objSearchMore = ((u40.h) c3269mc.f65159f.getValue()).searchMore(str, (SearchMoreType[]) array, false);
            if (objSearchMore == obj) {
                return obj;
            }
            v92 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            list = bVar.f63515c;
            str = bVar.f63514b;
            v92 = bVar.f63513a;
            ResultKt.b(objSearchMore);
        }
        u40.r rVar = (u40.r) objSearchMore;
        List listP = rVar != null ? ul.b.P(rVar) : null;
        if (listP == null) {
            listP = EmptyList.f71733a;
        }
        C3309p1.a(EnumC3131e9.SesameLite, (Throwable) null, new c(list, str, listP));
        ArrayList arrayList3 = new ArrayList(b70.c.u0(listP, 10));
        Iterator it2 = listP.iterator();
        while (it2.hasNext()) {
            arrayList3.add(C3068ae.a((u40.r) it2.next(), v92.f63510g, v92.f63453d, v92.f63508e));
        }
        return arrayList3;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull String str2, @Nullable String str3, @NotNull List<String> list, @NotNull String str4, @NotNull Continuation<? super List<? extends Yd>> continuation) {
        d dVar;
        V9 v92;
        C3186hd c3186hdA;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f63524c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f63524c = i5 - Integer.MIN_VALUE;
                v92 = this;
            } else {
                v92 = this;
                dVar = v92.new d(continuation);
            }
        }
        d dVar2 = dVar;
        Object objA = dVar2.f63522a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar2.f63524c;
        if (i11 == 0) {
            ResultKt.b(objA);
            dVar2.f63524c = 1;
            objA = v92.a(str, str4, list, 100L, str2, str3, dVar2);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : (Iterable) objA) {
            if (obj instanceof C3186hd) {
                arrayList.add(obj);
            }
        }
        int i12 = 10;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            C3186hd c3186hd = (C3186hd) it.next();
            List<C3155g> list2 = c3186hd.n;
            ArrayList arrayList3 = new ArrayList(b70.c.u0(list2, i12));
            for (C3155g c3155g : list2) {
                ArrayList arrayList4 = arrayList3;
                arrayList4.add(C3186hd.a(c3186hd, c3155g.f64529a, c3155g.f64531c, null, c3155g.f64532d, c3155g.f64533e, null, c3155g.f64536h, c3155g.f64535g, null, null, null, null, null, c3155g.f64534f, null, null, -536873526, 4095));
                arrayList3 = arrayList4;
            }
            arrayList2.add(arrayList3);
            i12 = 10;
        }
        ArrayList arrayListV0 = b70.c.v0(arrayList2);
        ArrayList arrayList5 = new ArrayList(b70.c.u0(arrayListV0, 10));
        Iterator it2 = arrayListV0.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            C3186hd c3186hd2 = (C3186hd) it2.next();
            C7 c72 = c3186hd2.f64674l;
            C7.d dVar3 = c72 instanceof C7.d ? (C7.d) c72 : null;
            if (dVar3 != null && dVar3.f62301a != null) {
                c3186hdA = C3186hd.a(c3186hd2, null, null, null, null, null, null, null, null, null, EnumC3396u4.SearchMore, null, null, null, null, null, null, -32769, 4095);
            } else {
                c3186hdA = C3186hd.a(c3186hd2, null, null, null, null, null, null, null, null, null, EnumC3396u4.SearchMore, null, null, null, null, null, null, -32769, 4095);
            }
            arrayList5.add(c3186hdA);
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator it3 = arrayList5.iterator();
        while (it3.hasNext()) {
            Object next = it3.next();
            String str5 = ((C3186hd) next).f64672j;
            Object arrayList6 = linkedHashMap.get(str5);
            if (arrayList6 == null) {
                arrayList6 = new ArrayList();
                linkedHashMap.put(str5, arrayList6);
            }
            ((List) arrayList6).add(next);
        }
        ArrayList arrayList7 = new ArrayList(b70.c.u0(arrayList5, 10));
        Iterator it4 = arrayList5.iterator();
        int i13 = 0;
        while (it4.hasNext()) {
            Object next2 = it4.next();
            int i14 = i13 + 1;
            if (i13 >= 0) {
                arrayList7.add(new Pair(new Integer(i13), (C3186hd) next2));
                i13 = i14;
            } else {
                ul.b.e0();
                throw null;
            }
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        Iterator it5 = arrayList7.iterator();
        while (it5.hasNext()) {
            Object next3 = it5.next();
            Integer num = new Integer(((Number) ((Pair) next3).f71683a).intValue());
            Object arrayList8 = linkedHashMap2.get(num);
            if (arrayList8 == null) {
                arrayList8 = new ArrayList();
                linkedHashMap2.put(num, arrayList8);
            }
            ((List) arrayList8).add(next3);
        }
        LinkedHashMap linkedHashMap3 = new LinkedHashMap(b70.k.d0(linkedHashMap2.size()));
        for (Map.Entry entry : linkedHashMap2.entrySet()) {
            Object key = entry.getKey();
            Iterable iterable = (Iterable) entry.getValue();
            ArrayList arrayList9 = new ArrayList(b70.c.u0(iterable, 10));
            Iterator it6 = iterable.iterator();
            while (it6.hasNext()) {
                arrayList9.add(((C3186hd) ((Pair) it6.next()).f71684b).f64672j);
            }
            linkedHashMap3.put(key, arrayList9);
        }
        List listC1 = b70.g.C1(linkedHashMap3.keySet());
        ArrayList arrayList10 = new ArrayList();
        Iterator it7 = listC1.iterator();
        while (it7.hasNext()) {
            Iterable iterable2 = (List) linkedHashMap3.get(new Integer(((Number) it7.next()).intValue()));
            if (iterable2 == null) {
                iterable2 = EmptyList.f71733a;
            }
            b70.d.z0(iterable2, arrayList10);
        }
        ArrayList arrayList11 = new ArrayList(b70.c.u0(arrayList10, 10));
        Iterator it8 = arrayList10.iterator();
        while (it8.hasNext()) {
            Collection collection = (List) linkedHashMap.get((String) it8.next());
            if (collection == null) {
                collection = EmptyList.f71733a;
            }
            arrayList11.add(collection);
        }
        return b70.c.v0(arrayList11);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull String str2, @Nullable String str3, @NotNull String str4, long j11, int i5, @NotNull String str5, @NotNull Continuation<? super List<? extends Yd>> continuation) {
        e eVar;
        int i11;
        List listSubList;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i12 = eVar.f63528d;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                eVar.f63528d = i12 - Integer.MIN_VALUE;
            } else {
                eVar = new e(continuation);
            }
        }
        e eVar2 = eVar;
        Object objA = eVar2.f63526b;
        Object obj = CoroutineSingletons.f71806a;
        int i13 = eVar2.f63528d;
        if (i13 == 0) {
            ResultKt.b(objA);
            List list = this.f63512i;
            i11 = i5;
            eVar2.f63525a = i11;
            eVar2.f63528d = 1;
            objA = a(str, str4, list, j11, str5, str2, str3, eVar2);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            int i14 = eVar2.f63525a;
            ResultKt.b(objA);
            i11 = i14;
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : (Iterable) objA) {
            if (obj2 instanceof C3186hd) {
                arrayList.add(obj2);
            }
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            arrayList2.add(C3186hd.a((C3186hd) it.next(), null, null, null, null, null, null, null, null, null, EnumC3396u4.ShortcutSearch, null, null, null, null, null, null, -32769, 4095));
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (Intrinsics.b(((C3186hd) next).f64679s, "shortcut")) {
                arrayList3.add(next);
            }
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator it3 = arrayList3.iterator();
        while (it3.hasNext()) {
            Object next2 = it3.next();
            String str6 = ((C3186hd) next2).f64672j;
            Object arrayList4 = linkedHashMap.get(str6);
            if (arrayList4 == null) {
                arrayList4 = new ArrayList();
                linkedHashMap.put(str6, arrayList4);
            }
            ((List) arrayList4).add(next2);
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(b70.k.d0(linkedHashMap.size()));
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            Object key = entry.getKey();
            if (i11 == -1) {
                listSubList = (List) entry.getValue();
            } else {
                listSubList = ((List) entry.getValue()).subList(0, i11);
            }
            ArrayList arrayList5 = new ArrayList(b70.c.u0(listSubList, 10));
            Iterator it4 = listSubList.iterator();
            while (it4.hasNext()) {
                arrayList5.add(((C3186hd) it4.next()).f64665c);
            }
            linkedHashMap2.put(key, arrayList5);
        }
        ArrayList arrayList6 = new ArrayList();
        Iterator it5 = linkedHashMap2.entrySet().iterator();
        while (it5.hasNext()) {
            b70.d.z0((List) ((Map.Entry) it5.next()).getValue(), arrayList6);
        }
        ArrayList arrayList7 = new ArrayList();
        Iterator it6 = arrayList2.iterator();
        while (it6.hasNext()) {
            Object next3 = it6.next();
            C3186hd c3186hd = (C3186hd) next3;
            if (!Intrinsics.b(c3186hd.f64679s, "shortcut") || arrayList6.contains(c3186hd.f64681u)) {
                arrayList7.add(next3);
            }
        }
        return arrayList7;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, List list, long j11, String str3, String str4, String str5, Continuation continuation) {
        C3064aa c3064aa;
        String str6;
        String str7;
        V9 v92;
        String str8;
        int i5;
        String str9;
        Object objA;
        String str10;
        long j12 = j11;
        if (continuation instanceof C3064aa) {
            c3064aa = (C3064aa) continuation;
            int i11 = c3064aa.f63947h;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                c3064aa.f63947h = i11 - Integer.MIN_VALUE;
            } else {
                c3064aa = new C3064aa(this, continuation);
            }
        }
        C3064aa c3064aa2 = c3064aa;
        Object objA2 = c3064aa2.f63945f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = c3064aa2.f63947h;
        if (i12 == 0) {
            ResultKt.b(objA2);
            try {
                int i13 = Result.f71687b;
                i5 = (int) j12;
                c3064aa2.f63940a = this;
                str6 = str;
                try {
                    c3064aa2.f63941b = str6;
                    str7 = str4;
                } catch (Throwable th2) {
                    th = th2;
                    str7 = str4;
                    v92 = this;
                    str8 = str5;
                    int i14 = Result.f71687b;
                    objA = ResultKt.a(th);
                    str10 = str6;
                    return v92.a(str10, str7, j12, str8, objA);
                }
            } catch (Throwable th3) {
                th = th3;
                str6 = str;
            }
            try {
                c3064aa2.f63942c = str7;
                c3064aa2.f63943d = str5;
                c3064aa2.f63944e = j12;
                c3064aa2.f63947h = 1;
                objA2 = a(str3, str2, list, true, i5, -1L, -1, (Continuation) c3064aa2);
                if (objA2 == coroutineSingletons) {
                    return coroutineSingletons;
                }
                v92 = this;
                str8 = str5;
                str9 = str6;
                objA = (List) objA2;
                int i15 = Result.f71687b;
                str10 = str9;
            } catch (Throwable th4) {
                th = th4;
                v92 = this;
                str8 = str5;
                int i142 = Result.f71687b;
                objA = ResultKt.a(th);
                str10 = str6;
                return v92.a(str10, str7, j12, str8, objA);
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            long j13 = c3064aa2.f63944e;
            str8 = c3064aa2.f63943d;
            String str11 = c3064aa2.f63942c;
            str9 = c3064aa2.f63941b;
            V9 v93 = c3064aa2.f63940a;
            try {
                ResultKt.b(objA2);
                j12 = j13;
                str7 = str11;
                v92 = v93;
                try {
                    objA = (List) objA2;
                    int i152 = Result.f71687b;
                    str10 = str9;
                } catch (Throwable th5) {
                    th = th5;
                    str6 = str9;
                    int i1422 = Result.f71687b;
                    objA = ResultKt.a(th);
                    str10 = str6;
                    return v92.a(str10, str7, j12, str8, objA);
                }
            } catch (Throwable th6) {
                th = th6;
                j12 = j13;
                str7 = str11;
                str6 = str9;
                v92 = v93;
                int i14222 = Result.f71687b;
                objA = ResultKt.a(th);
                str10 = str6;
                return v92.a(str10, str7, j12, str8, objA);
            }
        }
        return v92.a(str10, str7, j12, str8, objA);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, List<String> list, long j11, String str3, String str4, Continuation<? super List<? extends Yd>> continuation) {
        f fVar;
        Throwable th2;
        V9 v92;
        Object objA;
        if (continuation instanceof f) {
            fVar = (f) continuation;
            int i5 = fVar.f63536h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f63536h = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(continuation);
            }
        }
        Object objA2 = fVar.f63534f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f63536h;
        if (i11 == 0) {
            ResultKt.b(objA2);
            try {
                int i12 = Result.f71687b;
                fVar.f63529a = this;
                fVar.f63530b = str;
                fVar.f63531c = str3;
                fVar.f63532d = str4;
                fVar.f63533e = j11;
                fVar.f63536h = 1;
                objA2 = a(str2, list, fVar);
                if (objA2 == coroutineSingletons) {
                    return coroutineSingletons;
                }
                v92 = this;
            } catch (Throwable th3) {
                th2 = th3;
                v92 = this;
                int i13 = Result.f71687b;
                objA = ResultKt.a(th2);
                return v92.a(str, str3, j11, str4, objA);
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = fVar.f63533e;
            str4 = fVar.f63532d;
            str3 = fVar.f63531c;
            str = fVar.f63530b;
            v92 = fVar.f63529a;
            try {
                ResultKt.b(objA2);
            } catch (Throwable th4) {
                th2 = th4;
                int i132 = Result.f71687b;
                objA = ResultKt.a(th2);
                return v92.a(str, str3, j11, str4, objA);
            }
        }
        objA = (List) objA2;
        int i14 = Result.f71687b;
        return v92.a(str, str3, j11, str4, objA);
    }
}
