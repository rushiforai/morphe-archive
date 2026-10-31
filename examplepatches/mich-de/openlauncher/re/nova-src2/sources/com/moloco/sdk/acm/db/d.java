package com.moloco.sdk.acm.db;

import b.c0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public interface d {

    @SourceDebugExtension
    /* loaded from: classes3.dex */
    public static final class a {

        @DebugMetadata(c = "com.moloco.sdk.acm.db.MetricsDAO$DefaultImpls", f = "MetricsDAO.kt", l = {58, 62}, m = "deleteAndReturnDeletedEvents")
        /* renamed from: com.moloco.sdk.acm.db.d$a$a, reason: collision with other inner class name */
        public static final class C0142a extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public Object f36036a;

            /* renamed from: b, reason: collision with root package name */
            public Object f36037b;

            /* renamed from: c, reason: collision with root package name */
            public Object f36038c;

            /* renamed from: d, reason: collision with root package name */
            public /* synthetic */ Object f36039d;

            /* renamed from: e, reason: collision with root package name */
            public int f36040e;

            public C0142a(Continuation<? super C0142a> continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f36039d = obj;
                this.f36040e |= Integer.MIN_VALUE;
                return a.a(null, this);
            }
        }

        @DebugMetadata(c = "com.moloco.sdk.acm.db.MetricsDAO$DefaultImpls", f = "MetricsDAO.kt", l = {69, 70}, m = "resetDatabase")
        public static final class b extends ContinuationImpl {

            /* renamed from: a, reason: collision with root package name */
            public Object f36041a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f36042b;

            /* renamed from: c, reason: collision with root package name */
            public int f36043c;

            public b(Continuation<? super b> continuation) {
                super(continuation);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                this.f36042b = obj;
                this.f36043c |= Integer.MIN_VALUE;
                return a.b(null, this);
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:20:0x0055  */
        /* JADX WARN: Removed duplicated region for block: B:24:0x0066  */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:31:0x009d -> B:32:0x009f). Please report as a decompilation issue!!! */
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public static Object a(@NotNull d dVar, @NotNull Continuation<? super List<com.moloco.sdk.acm.db.b>> continuation) {
            C0142a c0142a;
            List listX;
            List<com.moloco.sdk.acm.db.b> listB;
            if (continuation instanceof C0142a) {
                c0142a = (C0142a) continuation;
                int i5 = c0142a.f36040e;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    c0142a.f36040e = i5 - Integer.MIN_VALUE;
                } else {
                    c0142a = new C0142a(continuation);
                }
            }
            Object obj = c0142a.f36039d;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = c0142a.f36040e;
            if (i11 == 0) {
                listX = c0.x(obj);
                listB = dVar.b();
                if (listB.isEmpty()) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                List list = (List) c0142a.f36036a;
                ResultKt.b(obj);
                return list;
            }
            List<com.moloco.sdk.acm.db.b> list2 = (List) c0142a.f36038c;
            listX = (List) c0142a.f36037b;
            d dVar2 = (d) c0142a.f36036a;
            ResultKt.b(obj);
            listX.addAll(list2);
            dVar = dVar2;
            listB = dVar.b();
            if (listB.isEmpty()) {
                c0142a.f36036a = listX;
                c0142a.f36037b = null;
                c0142a.f36038c = null;
                c0142a.f36040e = 2;
                if (dVar.d(c0142a) != coroutineSingletons) {
                    return listX;
                }
            } else {
                ArrayList arrayList = new ArrayList(b70.c.u0(listB, 10));
                Iterator<T> it = listB.iterator();
                while (it.hasNext()) {
                    arrayList.add(new Long(((com.moloco.sdk.acm.db.b) it.next()).i()));
                }
                c0142a.f36036a = dVar;
                c0142a.f36037b = listX;
                c0142a.f36038c = listB;
                c0142a.f36040e = 1;
                if (dVar.a(arrayList, c0142a) != coroutineSingletons) {
                    dVar2 = dVar;
                    list2 = listB;
                    listX.addAll(list2);
                    dVar = dVar2;
                    listB = dVar.b();
                    if (listB.isEmpty()) {
                    }
                }
            }
            return coroutineSingletons;
        }

        /* JADX WARN: Code restructure failed: missing block: B:20:0x0051, code lost:
        
            if (r5.d(r0) == r1) goto L21;
         */
        /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public static Object b(@NotNull d dVar, @NotNull Continuation<? super Unit> continuation) {
            b bVar;
            if (continuation instanceof b) {
                bVar = (b) continuation;
                int i5 = bVar.f36043c;
                if ((i5 & Integer.MIN_VALUE) != 0) {
                    bVar.f36043c = i5 - Integer.MIN_VALUE;
                } else {
                    bVar = new b(continuation);
                }
            }
            Object obj = bVar.f36042b;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i11 = bVar.f36043c;
            if (i11 == 0) {
                ResultKt.b(obj);
                bVar.f36041a = dVar;
                bVar.f36043c = 1;
                if (dVar.b(bVar) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            dVar = (d) bVar.f36041a;
            ResultKt.b(obj);
            bVar.f36041a = null;
            bVar.f36043c = 2;
        }
    }

    long a(@NotNull b bVar);

    @Nullable
    b a(long j11);

    @Nullable
    Object a(@NotNull List<Long> list, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object a(@NotNull Continuation<? super List<b>> continuation);

    @NotNull
    List<b> a();

    @NotNull
    List<Long> a(@NotNull List<b> list);

    @Nullable
    Object b(@NotNull Continuation<? super Unit> continuation);

    @NotNull
    List<b> b();

    @NotNull
    List<Long> b(@NotNull List<b> list);

    @Nullable
    Object c(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object d(@NotNull Continuation<? super Unit> continuation);
}
