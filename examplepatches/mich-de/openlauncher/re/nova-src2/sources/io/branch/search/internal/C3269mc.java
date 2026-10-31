package io.branch.search.internal;

import android.content.Context;
import android.content.pm.LauncherActivityInfo;
import android.content.pm.ShortcutInfo;
import android.os.UserHandle;
import io.branch.engage.sesame_lite.internal.DataImporters;
import io.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidApp;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidAppActivity;
import io.branch.engage.sesame_lite.internal.ingest.IngestibleAndroidAppShortcut;
import io.branch.search.internal.C3250la;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.mc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3269mc implements C3250la.b {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    public final boolean f65154a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final t70.j0 f65155b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final UserHandleDataSource f65156c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Lazy f65157d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final AtomicBoolean f65158e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Lazy f65159f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Lazy f65160g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final t70.r f65161h;

    /* renamed from: io.branch.search.internal.mc$a */
    public static final class a {
        public static long a(@NotNull String type) {
            Intrinsics.g(type, "type");
            int iHashCode = type.hashCode();
            if (iHashCode != -1167226760) {
                return iHashCode != -481501565 ? (iHashCode == 1970400168 && type.equals("RELAXED_MULTI_PREFIX")) ? 2001L : 2000L : type.equals("LEFT_ANCHOR_SUBSTR") ? 1000L : 2000L;
            }
            type.equals("MULTI_PREFIX");
            return 2000L;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.SSML", f = "SesameLiteActionDelegateImpl.kt", l = {448}, m = "onInitialSyncCompleted")
    /* renamed from: io.branch.search.internal.mc$b */
    public static final class b extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3269mc f65162a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65163b;

        /* renamed from: d, reason: collision with root package name */
        public int f65165d;

        public b(Continuation<? super b> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65163b = obj;
            this.f65165d |= Integer.MIN_VALUE;
            return C3269mc.this.a(this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.SSML", f = "SesameLiteActionDelegateImpl.kt", l = {339}, m = "onProfileAdded")
    /* renamed from: io.branch.search.internal.mc$c */
    public static final class c extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3269mc f65166a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65167b;

        /* renamed from: d, reason: collision with root package name */
        public int f65169d;

        public c(Continuation<? super c> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65167b = obj;
            this.f65169d |= Integer.MIN_VALUE;
            return C3269mc.this.a((UserHandle) null, (List<C3443x0>) null, (List<C3460y0>) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.SSML", f = "SesameLiteActionDelegateImpl.kt", l = {239}, m = "refreshAppUsage")
    /* renamed from: io.branch.search.internal.mc$d */
    public static final class d extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public C3269mc f65170a;

        /* renamed from: b, reason: collision with root package name */
        public /* synthetic */ Object f65171b;

        /* renamed from: d, reason: collision with root package name */
        public int f65173d;

        public d(Continuation<? super d> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f65171b = obj;
            this.f65173d |= Integer.MIN_VALUE;
            return C3269mc.this.b(this);
        }
    }

    public C3269mc(@NotNull Context context, boolean z11, @NotNull t70.j0 coroutineScope, @NotNull C3356rf userHandleDataSource) {
        Intrinsics.g(context, "context");
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(userHandleDataSource, "userHandleDataSource");
        this.f65154a = z11;
        this.f65155b = coroutineScope;
        this.f65156c = userHandleDataSource;
        this.f65157d = LazyKt.a(new C3303oc(this));
        new AtomicBoolean(false);
        this.f65158e = new AtomicBoolean(false);
        this.f65159f = LazyKt.a(new C3353rc(context, this));
        this.f65160g = LazyKt.a(new C3370sc(this));
        this.f65161h = t70.m0.b();
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
            return Unit.f71706a;
        }
        DataImporters dataImporters = (DataImporters) this.f65160g.getValue();
        Long userHandleId = this.f65156c.getUserHandleId(userHandle);
        long jLongValue = userHandleId != null ? userHandleId.longValue() : 0L;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (C3443x0 c3443x0 : list) {
            arrayList.add(new Pair(c3443x0.f66251a, c3443x0.f66252b.toString()));
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) it.next();
            LauncherActivityInfo launcherActivityInfo = (LauncherActivityInfo) pair.f71683a;
            String str2 = (String) pair.f71684b;
            String className = launcherActivityInfo.getComponentName().getClassName();
            Intrinsics.f(className, "info.componentName.className");
            arrayList2.add(new IngestibleAndroidAppActivity(className, str2, null, 4, null));
        }
        ArrayList arrayListA = a(list2);
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayListA, 10));
        Iterator it2 = arrayListA.iterator();
        while (it2.hasNext()) {
            arrayList3.add(IngestibleAndroidAppShortcut.INSTANCE.of((ShortcutInfo) it2.next()));
        }
        dataImporters.ingestAndroidApp(new IngestibleAndroidApp(str, jLongValue, arrayList2, arrayList3));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object b(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
            return Unit.f71706a;
        }
        DataImporters dataImporters = (DataImporters) this.f65160g.getValue();
        Long userHandleId = this.f65156c.getUserHandleId(userHandle);
        long jLongValue = userHandleId != null ? userHandleId.longValue() : 0L;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (C3443x0 c3443x0 : list) {
            arrayList.add(new Pair(c3443x0.f66251a, c3443x0.f66252b.toString()));
        }
        ArrayList arrayList2 = new ArrayList(b70.c.u0(arrayList, 10));
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Pair pair = (Pair) it.next();
            LauncherActivityInfo launcherActivityInfo = (LauncherActivityInfo) pair.f71683a;
            String str2 = (String) pair.f71684b;
            String className = launcherActivityInfo.getComponentName().getClassName();
            Intrinsics.f(className, "info.componentName.className");
            arrayList2.add(new IngestibleAndroidAppActivity(className, str2, null, 4, null));
        }
        ArrayList arrayListA = a(list2);
        ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayListA, 10));
        Iterator it2 = arrayListA.iterator();
        while (it2.hasNext()) {
            arrayList3.add(IngestibleAndroidAppShortcut.INSTANCE.of((ShortcutInfo) it2.next()));
        }
        dataImporters.ingestAndroidApp(new IngestibleAndroidApp(str, jLongValue, arrayList2, arrayList3));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
            return Unit.f71706a;
        }
        DataImporters dataImporters = (DataImporters) this.f65160g.getValue();
        Long userHandleId = this.f65156c.getUserHandleId(userHandle);
        long jLongValue = userHandleId != null ? userHandleId.longValue() : 0L;
        EmptyList emptyList = EmptyList.f71733a;
        dataImporters.ingestAndroidApp(new IngestibleAndroidApp(str, jLongValue, emptyList, emptyList));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        d dVar;
        C3269mc c3269mc;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f65173d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f65173d = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(continuation);
            }
        }
        Object obj = dVar.f65171b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f65173d;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!this.f65158e.getAndSet(true)) {
                try {
                    u40.h hVar = (u40.h) this.f65159f.getValue();
                    dVar.f65170a = this;
                    dVar.f65173d = 1;
                    if (hVar.refreshUsageStats(System.currentTimeMillis(), dVar) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    c3269mc = this;
                    c3269mc.f65158e.set(false);
                } catch (Throwable th2) {
                    th = th2;
                    c3269mc = this;
                    c3269mc.f65158e.set(false);
                    throw th;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c3269mc = dVar.f65170a;
            try {
                ResultKt.b(obj);
                c3269mc.f65158e.set(false);
            } catch (Throwable th3) {
                th = th3;
                c3269mc.f65158e.set(false);
                throw th;
            }
        }
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(long j11, @NotNull Continuation<? super Unit> continuation) {
        if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
            return Unit.f71706a;
        }
        Object objIngestAndPurgeOrphans = ((DataImporters) this.f65160g.getValue()).ingestAndPurgeOrphans(j11, EmptyList.f71733a, continuation);
        return objIngestAndPurgeOrphans == CoroutineSingletons.f71806a ? objIngestAndPurgeOrphans : Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object b(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3460y0> list, @NotNull Continuation<? super Unit> continuation) {
        if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
            return Unit.f71706a;
        }
        DataImporters dataImporters = (DataImporters) this.f65160g.getValue();
        Long userHandleId = this.f65156c.getUserHandleId(userHandle);
        long jLongValue = userHandleId != null ? userHandleId.longValue() : 0L;
        ArrayList arrayListA = a(list);
        ArrayList arrayList = new ArrayList(b70.c.u0(arrayListA, 10));
        Iterator it = arrayListA.iterator();
        while (it.hasNext()) {
            arrayList.add(IngestibleAndroidAppShortcut.INSTANCE.of((ShortcutInfo) it.next()));
        }
        dataImporters.ingestAndroidApp(new IngestibleAndroidApp(str, jLongValue, null, arrayList));
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        c cVar;
        C3269mc c3269mc;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f65169d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f65169d = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(continuation);
            }
        }
        Object obj = cVar.f65167b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f65169d;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
                return Unit.f71706a;
            }
            Long userHandleId = this.f65156c.getUserHandleId(userHandle);
            long jLongValue = userHandleId != null ? userHandleId.longValue() : 0L;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            for (Object obj2 : list) {
                String str = ((C3443x0) obj2).f66253c;
                Object arrayList = linkedHashMap.get(str);
                if (arrayList == null) {
                    arrayList = new ArrayList();
                    linkedHashMap.put(str, arrayList);
                }
                ((List) arrayList).add(obj2);
            }
            ArrayList arrayList2 = new ArrayList(linkedHashMap.size());
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                String str2 = (String) entry.getKey();
                List<C3443x0> list3 = (List) entry.getValue();
                ArrayList arrayList3 = new ArrayList(b70.c.u0(list3, 10));
                for (C3443x0 c3443x0 : list3) {
                    String className = c3443x0.f66251a.getComponentName().getClassName();
                    Intrinsics.f(className, "home.info.componentName.className");
                    arrayList3.add(new IngestibleAndroidAppActivity(className, c3443x0.f66252b.toString(), null, 4, null));
                }
                ArrayList arrayList4 = new ArrayList();
                for (Object obj3 : list2) {
                    if (Intrinsics.b(((C3460y0) obj3).f66302a.getPackage(), str2)) {
                        arrayList4.add(obj3);
                    }
                }
                ArrayList arrayListA = a(arrayList4);
                ArrayList arrayList5 = new ArrayList(b70.c.u0(arrayListA, 10));
                Iterator it = arrayListA.iterator();
                while (it.hasNext()) {
                    arrayList5.add(IngestibleAndroidAppShortcut.INSTANCE.of((ShortcutInfo) it.next()));
                }
                arrayList2.add(new IngestibleAndroidApp(str2, jLongValue, arrayList3, arrayList5));
            }
            DataImporters dataImporters = (DataImporters) this.f65160g.getValue();
            cVar.f65166a = this;
            cVar.f65169d = 1;
            if (dataImporters.ingestAndPurgeOrphans(jLongValue, arrayList2, cVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3269mc = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c3269mc = cVar.f65166a;
            ResultKt.b(obj);
        }
        ((DataImporters) c3269mc.f65160g.getValue()).pullStaticNavigations();
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        b bVar;
        C3269mc c3269mc;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i5 = bVar.f65165d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f65165d = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuation);
            }
        }
        Object obj = bVar.f65163b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f65165d;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c3269mc = bVar.f65162a;
            try {
                ResultKt.b(obj);
                ((t70.s) c3269mc.f65161h).X(Boolean.TRUE);
                return Unit.f71706a;
            } catch (Throwable th2) {
                th = th2;
                ((t70.s) c3269mc.f65161h).X(Boolean.TRUE);
                throw th;
            }
        }
        ResultKt.b(obj);
        if (!((Boolean) this.f65157d.getValue()).booleanValue()) {
            return Unit.f71706a;
        }
        try {
            DataImporters dataImporters = (DataImporters) this.f65160g.getValue();
            bVar.f65162a = this;
            bVar.f65165d = 1;
            if (dataImporters.refreshData(bVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            c3269mc = this;
            ((t70.s) c3269mc.f65161h).X(Boolean.TRUE);
            return Unit.f71706a;
        } catch (Throwable th3) {
            th = th3;
            c3269mc = this;
            ((t70.s) c3269mc.f65161h).X(Boolean.TRUE);
            throw th;
        }
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    public static ArrayList a(List list) {
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((C3460y0) it.next()).f66302a);
        }
        return arrayList;
    }
}
