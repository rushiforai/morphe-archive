package io.branch.search.internal;

import io.branch.search.internal.C3222k;
import io.branch.search.internal.EnumC3234kb;
import io.branch.search.internal.Jb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.collections.MapsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;

/* renamed from: io.branch.search.internal.q, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public abstract class AbstractC3324q {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3454xb f65493a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final H f65494b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final t70.c0 f65495c;

    /* renamed from: io.branch.search.internal.q$a */
    public static final class a {
    }

    public AbstractC3324q(@NotNull C3454xb state, @NotNull I analyticalBufferRepository, @NotNull t70.j1 dispatcher) {
        Intrinsics.g(state, "state");
        Intrinsics.g(analyticalBufferRepository, "analyticalBufferRepository");
        Intrinsics.g(dispatcher, "dispatcher");
        this.f65493a = state;
        this.f65494b = analyticalBufferRepository;
        this.f65495c = dispatcher;
    }

    @Nullable
    public abstract Object a(@NotNull Bf bf2, @NotNull Continuation<? super List<C3205j>> continuation);

    @Nullable
    public abstract Object a(@NotNull Fe fe2, @NotNull Continuation<? super List<C3205j>> continuation);

    @Nullable
    public abstract Object a(@NotNull C3084bd c3084bd, @NotNull Continuation<? super List<C3205j>> continuation);

    @Nullable
    public abstract Object a(@NotNull dg dgVar, @NotNull Continuation<? super List<C3205j>> continuation);

    @Nullable
    public abstract Object a(@NotNull C3169gd c3169gd, @NotNull Continuation<? super List<C3205j>> continuation);

    /* JADX WARN: Removed duplicated region for block: B:100:0x0202  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x021e A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0220  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0187  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x018c  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x018e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0192 A[Catch: all -> 0x01d8, TryCatch #1 {all -> 0x01d8, blocks: (B:77:0x0183, B:85:0x0192, B:87:0x0199), top: B:115:0x0183 }] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01c0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x01c1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, String str3, Map map, Boolean bool, List list, String str4, Map map2, C3222k.a aVar, Continuation continuation) throws JSONException {
        C3391u c3391u;
        Jd jd2;
        long jCurrentTimeMillis;
        AbstractC3324q abstractC3324q;
        String str5;
        String str6;
        long j11;
        Boolean bool2;
        String str7;
        Jb jbA;
        Object objA;
        if (continuation instanceof C3391u) {
            c3391u = (C3391u) continuation;
            int i5 = c3391u.f65940i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3391u.f65940i = i5 - Integer.MIN_VALUE;
            } else {
                c3391u = new C3391u(this, continuation);
            }
        }
        C3391u c3391u2 = c3391u;
        Object objY = c3391u2.f65938g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3391u2.f65940i;
        if (i11 == 0) {
            ResultKt.b(objY);
            b70.h hVar = b70.h.f17594a;
            r rVar = new r(map == null ? hVar : map);
            String str8 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            if (list == null) {
                jd2 = null;
                jCurrentTimeMillis = System.currentTimeMillis();
                try {
                    int i12 = Result.f71687b;
                    if (str3 == null) {
                        str8 = str3;
                    }
                    Map map3 = map != null ? hVar : map;
                    boolean zBooleanValue = bool == null ? bool.booleanValue() : false;
                    c3391u2.f65932a = this;
                    c3391u2.f65933b = str;
                    c3391u2.f65934c = null;
                    c3391u2.f65935d = str4;
                    c3391u2.f65936e = null;
                    c3391u2.f65937f = jCurrentTimeMillis;
                    c3391u2.f65940i = 1;
                    objY = t70.m0.y(this.f65495c, new C3374t(this, map3, str, "disco", str2, str8, aVar, jd2, zBooleanValue, null), c3391u2);
                    if (objY != coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    abstractC3324q = this;
                    str5 = str;
                    str6 = str4;
                    j11 = jCurrentTimeMillis;
                    bool2 = null;
                    str7 = null;
                    objA = (List) objY;
                    int i13 = Result.f71687b;
                } catch (Throwable th2) {
                    th = th2;
                    abstractC3324q = this;
                    str5 = str;
                    str6 = str4;
                    j11 = jCurrentTimeMillis;
                    bool2 = null;
                    str7 = null;
                    int i14 = Result.f71687b;
                    objA = ResultKt.a(th);
                    String str9 = str6;
                    long j12 = j11;
                    String str10 = str7;
                    String str11 = str5;
                    Pair<Boolean, String> pairA = C3476z.a(objA);
                    boolean zBooleanValue2 = ((Boolean) pairA.f71683a).booleanValue();
                    String str12 = (String) pairA.f71684b;
                    if (!Intrinsics.b(bool2, Boolean.TRUE)) {
                    }
                    if (objA instanceof Result.Failure) {
                    }
                }
            } else {
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    Map map4 = (Map) it.next();
                    Object objG0 = MapsKt.g0("query", map4);
                    Intrinsics.e(objG0, "null cannot be cast to non-null type kotlin.String");
                    String str13 = (String) objG0;
                    Object objG = x7.f.G("phase", map4);
                    Intrinsics.e(objG, "null cannot be cast to non-null type kotlin.String");
                    String str14 = (String) objG;
                    Object objG2 = x7.f.G("order", map4);
                    Intrinsics.e(objG2, "null cannot be cast to non-null type kotlin.Long");
                    long jLongValue = ((Long) objG2).longValue();
                    Object obj = map4.get("repeatedBinds");
                    String str15 = obj instanceof String ? (String) obj : null;
                    if (str15 == null) {
                        jbA = null;
                    } else {
                        List list2 = map2 != null ? (List) map2.get(str15) : null;
                        if (list2 != null) {
                            Jb.Companion.getClass();
                            jbA = Jb.a.a(rVar, list2);
                        }
                    }
                    Object obj2 = map4.get("binds");
                    String str16 = obj2 instanceof String ? (String) obj2 : null;
                    String str17 = str16 == null ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : str16;
                    EnumC3234kb.Companion.getClass();
                    arrayList.add(new Kd(EnumC3234kb.a.a(str14), (int) jLongValue, str13, str17, jbA != null, jbA));
                }
                if (!arrayList.isEmpty()) {
                    ArrayList arrayList2 = new ArrayList();
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        Object next = it2.next();
                        int iOrdinal = ((Kd) next).f62798a.ordinal();
                        if (iOrdinal == 0) {
                            arrayList2.add(next);
                        } else if (iOrdinal != 1) {
                            throw new NoWhenBranchMatchedException();
                        }
                    }
                    List listD1 = b70.g.D1(new C3442x(), arrayList2);
                    ArrayList arrayList3 = new ArrayList();
                    Iterator it3 = arrayList.iterator();
                    while (it3.hasNext()) {
                        Object next2 = it3.next();
                        int iOrdinal2 = ((Kd) next2).f62798a.ordinal();
                        if (iOrdinal2 != 0) {
                            if (iOrdinal2 != 1) {
                                throw new NoWhenBranchMatchedException();
                            }
                            arrayList3.add(next2);
                        }
                    }
                    jd2 = new Jd(listD1, b70.g.D1(new C3459y(), arrayList3));
                }
                jCurrentTimeMillis = System.currentTimeMillis();
                int i122 = Result.f71687b;
                if (str3 == null) {
                }
                if (map != null) {
                }
                if (bool == null) {
                }
                c3391u2.f65932a = this;
                c3391u2.f65933b = str;
                c3391u2.f65934c = null;
                c3391u2.f65935d = str4;
                c3391u2.f65936e = null;
                c3391u2.f65937f = jCurrentTimeMillis;
                c3391u2.f65940i = 1;
                objY = t70.m0.y(this.f65495c, new C3374t(this, map3, str, "disco", str2, str8, aVar, jd2, zBooleanValue, null), c3391u2);
                if (objY != coroutineSingletons) {
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = c3391u2.f65937f;
            bool2 = c3391u2.f65936e;
            str6 = c3391u2.f65935d;
            str7 = c3391u2.f65934c;
            str5 = c3391u2.f65933b;
            AbstractC3324q abstractC3324q2 = c3391u2.f65932a;
            try {
                ResultKt.b(objY);
                abstractC3324q = abstractC3324q2;
                try {
                    objA = (List) objY;
                    int i132 = Result.f71687b;
                } catch (Throwable th3) {
                    th = th3;
                    int i142 = Result.f71687b;
                    objA = ResultKt.a(th);
                    String str92 = str6;
                    long j122 = j11;
                    String str102 = str7;
                    String str112 = str5;
                    Pair<Boolean, String> pairA2 = C3476z.a(objA);
                    boolean zBooleanValue22 = ((Boolean) pairA2.f71683a).booleanValue();
                    String str122 = (String) pairA2.f71684b;
                    if (!Intrinsics.b(bool2, Boolean.TRUE)) {
                    }
                    if (objA instanceof Result.Failure) {
                    }
                }
            } catch (Throwable th4) {
                th = th4;
                abstractC3324q = abstractC3324q2;
                int i1422 = Result.f71687b;
                objA = ResultKt.a(th);
                String str922 = str6;
                long j1222 = j11;
                String str1022 = str7;
                String str1122 = str5;
                Pair<Boolean, String> pairA22 = C3476z.a(objA);
                boolean zBooleanValue222 = ((Boolean) pairA22.f71683a).booleanValue();
                String str1222 = (String) pairA22.f71684b;
                if (!Intrinsics.b(bool2, Boolean.TRUE)) {
                }
                if (objA instanceof Result.Failure) {
                }
            }
        }
        String str9222 = str6;
        long j12222 = j11;
        String str10222 = str7;
        String str11222 = str5;
        Pair<Boolean, String> pairA222 = C3476z.a(objA);
        boolean zBooleanValue2222 = ((Boolean) pairA222.f71683a).booleanValue();
        String str12222 = (String) pairA222.f71684b;
        if (!Intrinsics.b(bool2, Boolean.TRUE)) {
            P.a(abstractC3324q.f65494b, str11222, j12222, System.currentTimeMillis(), zBooleanValue2222, "SQL", str10222 == null ? "unspecified" : str10222, str9222 == null ? "unspecified" : str9222, str12222);
        }
        if (objA instanceof Result.Failure) {
            return objA;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(@NotNull String str, @NotNull String str2, @Nullable String str3, @Nullable Map map, @Nullable Boolean bool, @Nullable List list, @Nullable String str4, @Nullable Map map2, @NotNull C3222k.a aVar, @NotNull Continuation continuation) throws JSONException {
        C3425w c3425w;
        if (continuation instanceof C3425w) {
            c3425w = (C3425w) continuation;
            int i5 = c3425w.f66197c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3425w.f66197c = i5 - Integer.MIN_VALUE;
            } else {
                c3425w = new C3425w(this, continuation);
            }
        }
        C3425w c3425w2 = c3425w;
        Object objA = c3425w2.f66195a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = c3425w2.f66197c;
        if (i11 == 0) {
            ResultKt.b(objA);
            c3425w2.f66197c = 1;
            objA = a(str, str2, str3, map, bool, list, str4, map2, aVar, c3425w2);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        List list2 = (List) objA;
        return list2 == null ? EmptyList.f71733a : list2;
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x00e9  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00fb A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull EnumC3285nb enumC3285nb, @Nullable LinkedHashMap linkedHashMap, @Nullable Boolean bool, @NotNull List list, @Nullable Boolean bool2, @Nullable Long l9, @Nullable String str2, @Nullable String str3, @NotNull Continuation continuation) throws JSONException {
        C3408v c3408v;
        String str4;
        String str5;
        AbstractC3324q abstractC3324q;
        String str6;
        EnumC3285nb enumC3285nb2;
        long j11;
        String str7;
        Object objA;
        String str8;
        if (continuation instanceof C3408v) {
            c3408v = (C3408v) continuation;
            int i5 = c3408v.f66072i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c3408v.f66072i = i5 - Integer.MIN_VALUE;
            } else {
                c3408v = new C3408v(this, continuation);
            }
        }
        C3408v c3408v2 = c3408v;
        Object objY = c3408v2.f66070g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c3408v2.f66072i;
        if (i11 == 0) {
            ResultKt.b(objY);
            long jCurrentTimeMillis = System.currentTimeMillis();
            try {
                int i12 = Result.f71687b;
                Map map = linkedHashMap == null ? b70.h.f17594a : linkedHashMap;
                List list2 = Intrinsics.b(bool, Boolean.TRUE) ? list : null;
                boolean zBooleanValue = bool2 != null ? bool2.booleanValue() : false;
                try {
                    c3408v2.f66064a = this;
                    c3408v2.f66065b = str;
                    c3408v2.f66066c = enumC3285nb;
                    str4 = str2;
                    try {
                        c3408v2.f66067d = str4;
                        str5 = str3;
                        try {
                            c3408v2.f66068e = str5;
                            c3408v2.f66069f = jCurrentTimeMillis;
                            c3408v2.f66072i = 1;
                            objY = t70.m0.y(this.f65495c, new C3357s(map, this, list2, l9, str, enumC3285nb, zBooleanValue, null), c3408v2);
                            if (objY == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                            abstractC3324q = this;
                            str6 = str;
                            enumC3285nb2 = enumC3285nb;
                            j11 = jCurrentTimeMillis;
                            str7 = str4;
                            objA = (List) objY;
                            int i13 = Result.f71687b;
                        } catch (Throwable th2) {
                            th = th2;
                            abstractC3324q = this;
                            str6 = str;
                            enumC3285nb2 = enumC3285nb;
                            j11 = jCurrentTimeMillis;
                            str7 = str4;
                            int i14 = Result.f71687b;
                            objA = ResultKt.a(th);
                            str8 = str7;
                            long j12 = j11;
                            EnumC3285nb enumC3285nb3 = enumC3285nb2;
                            String str9 = str6;
                            Pair<Boolean, String> pairA = C3476z.a(objA);
                            boolean zBooleanValue2 = ((Boolean) pairA.f71683a).booleanValue();
                            String str10 = (String) pairA.f71684b;
                            H h5 = abstractC3324q.f65494b;
                            long jCurrentTimeMillis2 = System.currentTimeMillis();
                            if (str8 == null) {
                            }
                            String str11 = str8;
                            if (str5 == null) {
                            }
                            P.a(h5, str9, j12, jCurrentTimeMillis2, zBooleanValue2, "SQL", str11, str5, str10);
                            if (objA instanceof Result.Failure) {
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        str5 = str3;
                        abstractC3324q = this;
                        str6 = str;
                        enumC3285nb2 = enumC3285nb;
                        j11 = jCurrentTimeMillis;
                        str7 = str4;
                        int i142 = Result.f71687b;
                        objA = ResultKt.a(th);
                        str8 = str7;
                        long j122 = j11;
                        EnumC3285nb enumC3285nb32 = enumC3285nb2;
                        String str92 = str6;
                        Pair<Boolean, String> pairA2 = C3476z.a(objA);
                        boolean zBooleanValue22 = ((Boolean) pairA2.f71683a).booleanValue();
                        String str102 = (String) pairA2.f71684b;
                        H h52 = abstractC3324q.f65494b;
                        long jCurrentTimeMillis22 = System.currentTimeMillis();
                        if (str8 == null) {
                        }
                        String str112 = str8;
                        if (str5 == null) {
                        }
                        P.a(h52, str92, j122, jCurrentTimeMillis22, zBooleanValue22, "SQL", str112, str5, str102);
                        if (objA instanceof Result.Failure) {
                        }
                    }
                } catch (Throwable th4) {
                    th = th4;
                    str4 = str2;
                }
            } catch (Throwable th5) {
                th = th5;
                str4 = str2;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = c3408v2.f66069f;
            String str12 = c3408v2.f66068e;
            str7 = c3408v2.f66067d;
            enumC3285nb2 = c3408v2.f66066c;
            str6 = c3408v2.f66065b;
            AbstractC3324q abstractC3324q2 = c3408v2.f66064a;
            try {
                ResultKt.b(objY);
                str5 = str12;
                abstractC3324q = abstractC3324q2;
                try {
                    objA = (List) objY;
                    int i132 = Result.f71687b;
                } catch (Throwable th6) {
                    th = th6;
                    int i1422 = Result.f71687b;
                    objA = ResultKt.a(th);
                    str8 = str7;
                    long j1222 = j11;
                    EnumC3285nb enumC3285nb322 = enumC3285nb2;
                    String str922 = str6;
                    Pair<Boolean, String> pairA22 = C3476z.a(objA);
                    boolean zBooleanValue222 = ((Boolean) pairA22.f71683a).booleanValue();
                    String str1022 = (String) pairA22.f71684b;
                    H h522 = abstractC3324q.f65494b;
                    long jCurrentTimeMillis222 = System.currentTimeMillis();
                    if (str8 == null) {
                    }
                    String str1122 = str8;
                    if (str5 == null) {
                    }
                    P.a(h522, str922, j1222, jCurrentTimeMillis222, zBooleanValue222, "SQL", str1122, str5, str1022);
                    if (objA instanceof Result.Failure) {
                    }
                }
            } catch (Throwable th7) {
                th = th7;
                str5 = str12;
                abstractC3324q = abstractC3324q2;
                int i14222 = Result.f71687b;
                objA = ResultKt.a(th);
                str8 = str7;
                long j12222 = j11;
                EnumC3285nb enumC3285nb3222 = enumC3285nb2;
                String str9222 = str6;
                Pair<Boolean, String> pairA222 = C3476z.a(objA);
                boolean zBooleanValue2222 = ((Boolean) pairA222.f71683a).booleanValue();
                String str10222 = (String) pairA222.f71684b;
                H h5222 = abstractC3324q.f65494b;
                long jCurrentTimeMillis2222 = System.currentTimeMillis();
                if (str8 == null) {
                }
                String str11222 = str8;
                if (str5 == null) {
                }
                P.a(h5222, str9222, j12222, jCurrentTimeMillis2222, zBooleanValue2222, "SQL", str11222, str5, str10222);
                if (objA instanceof Result.Failure) {
                }
            }
        }
        str8 = str7;
        long j122222 = j11;
        EnumC3285nb enumC3285nb32222 = enumC3285nb2;
        String str92222 = str6;
        Pair<Boolean, String> pairA2222 = C3476z.a(objA);
        boolean zBooleanValue22222 = ((Boolean) pairA2222.f71683a).booleanValue();
        String str102222 = (String) pairA2222.f71684b;
        H h52222 = abstractC3324q.f65494b;
        long jCurrentTimeMillis22222 = System.currentTimeMillis();
        if (str8 == null) {
            str8 = "unspecified";
        }
        String str112222 = str8;
        if (str5 == null) {
            str5 = enumC3285nb32222.f65390a;
        }
        P.a(h52222, str92222, j122222, jCurrentTimeMillis22222, zBooleanValue22222, "SQL", str112222, str5, str102222);
        if (objA instanceof Result.Failure) {
            return null;
        }
        return objA;
    }
}
