package io.branch.search.internal;

import android.content.ContentProviderClient;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.DeadObjectException;
import android.os.RemoteException;
import android.os.UserManager;
import com.amplitude.android.migration.DatabaseConstants;
import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.A4;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.C3430w4;
import io.branch.search.internal.C4;
import io.branch.search.internal.E2;
import io.branch.search.internal.InterfaceC3481z4;
import io.branch.search.internal.util.CorosKt;
import io.branch.search.ui.ClickInfo;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicLong;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3413v4 implements InterfaceC3227k4 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f66129a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3077b6 f66130b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final t70.c0 f66131c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final F4 f66132d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final C3388td f66133e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final C3251lb f66134f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final AtomicLong f66135g;

    /* renamed from: h, reason: collision with root package name */
    public final UserManager f66136h;

    /* renamed from: io.branch.search.internal.v4$a */
    public static final class a {
    }

    /* renamed from: io.branch.search.internal.v4$b */
    public static final class b extends Lambda implements Function0<Unit> {
        public b() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            c3413v4.a(InterfaceC3481z4.a.a(C4.a.f62204b, c3413v4.f66132d, new Pair[0]), new ContentValues());
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$c */
    public static final class c extends Lambda implements Function0<Unit> {
        public c() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            c3413v4.a(InterfaceC3481z4.a.a(C4.c.f62208b, c3413v4.f66132d, new Pair[0]), new ContentValues());
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor", f = "BncContentProvider.kt", l = {433}, m = "execute")
    /* renamed from: io.branch.search.internal.v4$d */
    public static final class d extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f66139a;

        /* renamed from: c, reason: collision with root package name */
        public int f66141c;

        public d(Continuation<? super d> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f66139a = obj;
            this.f66141c |= Integer.MIN_VALUE;
            return C3413v4.this.a((String) null, (y40.e) null, this);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$markIgnorePackage$2", f = "BncContentProvider.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v4$e */
    public static final class e extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.w>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f66143b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ long[] f66144c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(String str, long[] jArr, Continuation<? super e> continuation) {
            super(2, continuation);
            this.f66143b = str;
            this.f66144c = jArr;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3413v4.this.new e(this.f66143b, this.f66144c, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((e) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.e.f62220b, c3413v4.f66132d, new Pair[0]);
            E4<C4.e.a> e42 = C4.e.f62221c;
            C4.e.a aVar = new C4.e.a(this.f66143b, this.f66144c);
            e42.getClass();
            ContentValues contentValues = new ContentValues();
            contentValues.put(DatabaseConstants.KEY_FIELD, D1.a(aVar));
            return c3413v4.a(uriA, contentValues);
        }
    }

    /* renamed from: io.branch.search.internal.v4$f */
    public static final class f extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ ClickInfo f66146b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public f(ClickInfo clickInfo) {
            super(0);
            this.f66146b = clickInfo;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.f.f62224b, c3413v4.f66132d, new Pair[0]);
            E4<ClickInfo> e42 = C4.f.f62225c;
            ClickInfo clickInfo = this.f66146b;
            e42.getClass();
            c3413v4.a(uriA, E4.a(clickInfo));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$g */
    public static final class g extends Lambda implements Function0<Unit> {
        public g() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            c3413v4.a(InterfaceC3481z4.a.a(C4.g.f62226b, c3413v4.f66132d, new Pair[0]), new ContentValues());
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$h */
    public static final class h extends Lambda implements Function0<Unit> {
        public h() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            c3413v4.a(InterfaceC3481z4.a.a(C4.h.f62227b, c3413v4.f66132d, new Pair[0]), new ContentValues());
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$i */
    public static final class i extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C4.i.d f66150b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(C4.i.d dVar) {
            super(0);
            this.f66150b = dVar;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.i.f62228b, c3413v4.f66132d, new Pair[0]);
            E4<C4.i.d> e42 = C4.i.f62229c;
            C4.i.d dVar = this.f66150b;
            e42.getClass();
            c3413v4.a(uriA, E4.a(dVar));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$j */
    public static final class j extends Lambda implements Function0<Unit> {
        public j() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3413v4 c3413v4 = C3413v4.this;
            C3095c7 c3095c7 = new C3095c7(System.currentTimeMillis(), 1);
            c3413v4.getClass();
            c3413v4.a(new C3447x4(c3413v4, c3095c7));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$k */
    public static final class k extends Lambda implements Function0<Unit> {
        public k() {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            C3413v4 c3413v4 = C3413v4.this;
            C3095c7 c3095c7 = new C3095c7(System.currentTimeMillis(), 0);
            c3413v4.getClass();
            c3413v4.a(new C3447x4(c3413v4, c3095c7));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$l */
    public static final class l extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C4.d.a f66154b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public l(C4.d.a aVar) {
            super(0);
            this.f66154b = aVar;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.d.f62209b, c3413v4.f66132d, new Pair[0]);
            E4<C4.d.a> e42 = C4.d.f62210c;
            C4.d.a aVar = this.f66154b;
            e42.getClass();
            c3413v4.a(uriA, E4.a(aVar));
            return Unit.f71706a;
        }
    }

    /* renamed from: io.branch.search.internal.v4$m */
    public static final class m extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ C4.j.b f66156b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public m(C4.j.b bVar) {
            super(0);
            this.f66156b = bVar;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.j.f62251b, c3413v4.f66132d, new Pair[0]);
            E4<C4.j.b> e42 = C4.j.f62252c;
            C4.j.b bVar = this.f66156b;
            e42.getClass();
            c3413v4.a(uriA, E4.a(bVar));
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$removeAnalyticsForRequestId$2", f = "BncContentProvider.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v4$n */
    public static final class n extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.w>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f66158b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public n(String str, Continuation<? super n> continuation) {
            super(2, continuation);
            this.f66158b = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3413v4.this.new n(this.f66158b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3413v4.this.new n(this.f66158b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.b.f62205b, c3413v4.f66132d, new Pair[0]);
            E4<C4.b.a> e42 = C4.b.f62206c;
            C4.b.a aVar = new C4.b.a(this.f66158b);
            e42.getClass();
            ContentValues contentValues = new ContentValues();
            contentValues.put(DatabaseConstants.KEY_FIELD, D1.a(aVar));
            return c3413v4.a(uriA, contentValues);
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$submit$1", f = "BncContentProvider.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v4$o */
    public static final class o extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Function0<Unit> f66160b;

        /* renamed from: io.branch.search.internal.v4$o$a */
        public static final class a extends Lambda implements Function0<Unit> {

            /* renamed from: a, reason: collision with root package name */
            public final /* synthetic */ Function0<Unit> f66161a;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Function0<Unit> function0) {
                super(0);
                this.f66161a = function0;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                this.f66161a.invoke();
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public o(Function0<Unit> function0, Continuation<? super o> continuation) {
            super(1, continuation);
            this.f66160b = function0;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
            return C3413v4.this.new o(this.f66160b, continuation);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            return C3413v4.this.new o(this.f66160b, (Continuation) obj).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) throws Throwable {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            C3077b6 c3077b6 = C3413v4.this.f66130b;
            a aVar = new a(this.f66160b);
            c3077b6.getClass();
            t70.m0.u(EmptyCoroutineContext.f71803a, new Z5(c3077b6, aVar, null));
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$syncIgnoredPackages$2", f = "BncContentProvider.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v4$p */
    public static final class p extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.w>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ List<String> f66163b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ long[] f66164c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ boolean f66165d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public p(List<String> list, long[] jArr, boolean z11, Continuation<? super p> continuation) {
            super(2, continuation);
            this.f66163b = list;
            this.f66164c = jArr;
            this.f66165d = z11;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3413v4.this.new p(this.f66163b, this.f66164c, this.f66165d, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((p) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.k.f62280b, c3413v4.f66132d, new Pair[0]);
            E4<C4.k.a> e42 = C4.k.f62281c;
            C4.k.a aVar = new C4.k.a(this.f66163b, this.f66164c, this.f66165d);
            e42.getClass();
            ContentValues contentValues = new ContentValues();
            contentValues.put(DatabaseConstants.KEY_FIELD, D1.a(aVar));
            return c3413v4.a(uriA, contentValues);
        }
    }

    /* renamed from: io.branch.search.internal.v4$q */
    public static final class q extends Lambda implements Function0<Unit> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ AnalyticsEvent f66167b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public q(AnalyticsEvent analyticsEvent) {
            super(0);
            this.f66167b = analyticsEvent;
        }

        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() throws Throwable {
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.l.f62285b, c3413v4.f66132d, new Pair[0]);
            E4<AnalyticsEvent> e42 = C4.l.f62286c;
            AnalyticsEvent analyticsEvent = this.f66167b;
            e42.getClass();
            c3413v4.a(uriA, E4.a(analyticsEvent));
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$unmarkIgnorePackage$2", f = "BncContentProvider.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.v4$r */
    public static final class r extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.w>, Object> {

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ String f66169b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public r(String str, Continuation<? super r> continuation) {
            super(2, continuation);
            this.f66169b = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return C3413v4.this.new r(this.f66169b, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return C3413v4.this.new r(this.f66169b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            C3413v4 c3413v4 = C3413v4.this;
            Uri uriA = InterfaceC3481z4.a.a(C4.n.f62289b, c3413v4.f66132d, new Pair[0]);
            String value = this.f66169b;
            Intrinsics.g(value, "value");
            ContentValues contentValues = new ContentValues();
            contentValues.put(DatabaseConstants.KEY_FIELD, value);
            return c3413v4.a(uriA, contentValues);
        }
    }

    public C3413v4(@NotNull Context context, @NotNull C3077b6 guard, @NotNull t70.c0 ioDispatcher) {
        Intrinsics.g(context, "context");
        Intrinsics.g(guard, "guard");
        Intrinsics.g(ioDispatcher, "ioDispatcher");
        this.f66129a = context;
        this.f66130b = guard;
        this.f66131c = ioDispatcher;
        this.f66132d = new F4(context);
        this.f66133e = new C3388td("ContentProviderExecutor");
        this.f66134f = new C3251lb();
        this.f66135g = new AtomicLong(0L);
        this.f66136h = (UserManager) context.getSystemService(UserManager.class);
    }

    public static final Object a(C3413v4 c3413v4, int i5, long j11, Uri uri, C3430w4.a aVar, Continuation continuation) {
        C3309p1.c(EnumC3131e9.ContentProviderRequests, "Begin query for " + uri);
        C3251lb c3251lb = c3413v4.f66134f;
        Context context = c3413v4.f66129a;
        c3251lb.getClass();
        int iA = R1.a(i5);
        if (iA == 0) {
            return c3251lb.f65063a.a(context, j11, uri, aVar, continuation);
        }
        if (iA != 1) {
            throw new NoWhenBranchMatchedException();
        }
        C3220je c3220je = c3251lb.f65064b;
        c3220je.getClass();
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        t70.m0.t(CorosKt.getBNCScope(), null, null, new C3136ee(uri, c3220je, new C3187he(mVar), context, aVar, null), 3);
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object b(@NotNull String str, @NotNull Continuation<? super Unit> continuation) {
        a(new c());
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object c(@NotNull String str, @NotNull Continuation<? super Unit> continuation) {
        a(new b());
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object d(@NotNull String str, @NotNull Continuation<? super y40.w> continuation) {
        return t70.m0.y(this.f66131c, new r(str, null), continuation);
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object e(@NotNull String str, @NotNull Continuation<? super Unit> continuation) {
        a(new h());
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object b(@NotNull Continuation<? super Unit> continuation) {
        a(new k());
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object c(@NotNull Continuation<? super Unit> continuation) {
        a(new j());
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull y40.c cVar, @NotNull Continuation<? super y40.w> continuation) {
        A4.a aVar = A4.a.f61923a;
        a80.e eVar = t70.y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C3430w4(this, aVar, 1, cVar, null), continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(@NotNull String str, @NotNull y40.e eVar, @NotNull Continuation<? super y40.w> continuation) throws Throwable {
        d dVar;
        if (continuation instanceof d) {
            dVar = (d) continuation;
            int i5 = dVar.f66141c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f66141c = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(continuation);
            }
        }
        Object objY = dVar.f66139a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f66141c;
        if (i11 == 0) {
            ResultKt.b(objY);
            A4.b bVar = A4.b.f61926a;
            dVar.f66141c = 1;
            a80.e eVar2 = t70.y0.f88884a;
            objY = t70.m0.y(a80.d.f488c, new C3430w4(this, bVar, 1, eVar, null), dVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        Intrinsics.e(objY, "null cannot be cast to non-null type io.branch.search.BranchResponse<kotlin.collections.List<io.branch.search.ui.BranchContainer<io.branch.search.ui.BranchEntity.AutoSuggestion>>>");
        return (y40.w) objY;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull y40.b0 b0Var, @NotNull Continuation<? super y40.w> continuation) {
        A4.d dVar = A4.d.f61929a;
        a80.e eVar = t70.y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C3430w4(this, dVar, 1, b0Var, null), continuation);
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull y40.d0 d0Var, @NotNull Continuation<? super y40.w> continuation) {
        A4.e eVar = A4.e.f61932a;
        a80.e eVar2 = t70.y0.f88884a;
        return t70.m0.y(a80.d.f488c, new C3430w4(this, eVar, 2, d0Var, null), continuation);
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @Nullable long[] jArr, @NotNull Continuation<? super y40.w> continuation) {
        return t70.m0.y(this.f66131c, new e(str, jArr, null), continuation);
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull ClickInfo clickInfo, @NotNull Continuation<? super Unit> continuation) {
        a(new f(clickInfo));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull Continuation<? super Unit> continuation) {
        a(new g());
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull C4.i.d dVar, @NotNull Continuation<? super Unit> continuation) {
        a(new i(dVar));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull C4.d.a aVar, @NotNull Continuation<? super Unit> continuation) {
        if (aVar.f62212b) {
            C3309p1.d(EnumC3131e9.ContentProviderRequests, "Empty ImpressionInfo — dropping it");
            return Unit.f71706a;
        }
        a(new l(aVar));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull C4.j.b bVar, @NotNull Continuation<? super Unit> continuation) {
        if (bVar.f62264d) {
            C3309p1.b(EnumC3131e9.ContentProviderRequests, "Empty ClickInfo — dropping it");
            return Unit.f71706a;
        }
        a(new m(bVar));
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull Continuation<? super y40.w> continuation) {
        return t70.m0.y(this.f66131c, new n(str, null), continuation);
    }

    public final void a(Function0<Unit> function0) {
        if (this.f66133e.a(new o(function0, null))) {
            return;
        }
        String string = UUID.randomUUID().toString();
        C3296o5.a aVar = C3296o5.f65426a;
        C3296o5.a(new F6(string, "ContentProviderDelegate", "Failed to enqueue message", null));
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull List<String> list, @Nullable long[] jArr, boolean z11, @NotNull Continuation<? super y40.w> continuation) {
        return t70.m0.y(this.f66131c, new p(list, jArr, z11, null), continuation);
    }

    @Override // io.branch.search.internal.InterfaceC3227k4
    @Nullable
    public final Object a(@NotNull String str, @NotNull AnalyticsEvent analyticsEvent, @NotNull Continuation<? super Unit> continuation) {
        a(new q(analyticsEvent));
        return Unit.f71706a;
    }

    public final y40.w a(Uri uri, ContentValues contentValues) throws Throwable {
        String simpleName;
        y40.w wVarB;
        Integer numValueOf;
        EnumC3131e9 tag = EnumC3131e9.ContentProviderRequests;
        C3309p1.c(tag, "Begin update for " + uri);
        ContentProviderClient contentProviderClientAcquireUnstableContentProviderClient = this.f66129a.getContentResolver().acquireUnstableContentProviderClient(uri);
        String str = "IPC update " + uri + " ContentValues{ " + contentValues + " }";
        C3309p1.f65465a.getClass();
        Intrinsics.g(tag, "tag");
        long jCurrentTimeMillis = System.currentTimeMillis();
        String strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        try {
            try {
                if (contentProviderClientAcquireUnstableContentProviderClient != null) {
                    try {
                        numValueOf = Integer.valueOf(contentProviderClientAcquireUnstableContentProviderClient.update(uri, contentValues, null, null));
                    } catch (DeadObjectException e3) {
                        y40.v vVar = y40.w.Companion;
                        Boolean bool = Boolean.FALSE;
                        E2.Companion.getClass();
                        wVarB = y40.v.b(vVar, bool, E2.b.a(e3));
                        if (contentProviderClientAcquireUnstableContentProviderClient != null) {
                        }
                    }
                } else {
                    numValueOf = null;
                }
                if (numValueOf != null && numValueOf.intValue() == 1) {
                    wVarB = y40.v.b(y40.w.Companion, Boolean.TRUE, new E2.c());
                } else if (numValueOf != null && numValueOf.intValue() == -1) {
                    y40.v vVar2 = y40.w.Companion;
                    Boolean bool2 = Boolean.FALSE;
                    E2.b bVar = E2.Companion;
                    RemoteException remoteException = new RemoteException("A RemoteException occurred for " + uri);
                    bVar.getClass();
                    wVarB = y40.v.b(vVar2, bool2, E2.b.a(remoteException));
                } else if (numValueOf != null && numValueOf.intValue() == -2) {
                    y40.v vVar3 = y40.w.Companion;
                    Boolean bool3 = Boolean.FALSE;
                    E2.b bVar2 = E2.Companion;
                    DeadObjectException deadObjectException = new DeadObjectException("A Dead Object Exception occurred on update for " + uri);
                    bVar2.getClass();
                    wVarB = y40.v.b(vVar3, bool3, E2.b.a(deadObjectException));
                } else if (numValueOf == null) {
                    y40.v vVar4 = y40.w.Companion;
                    Boolean bool4 = Boolean.FALSE;
                    E2.b bVar3 = E2.Companion;
                    IllegalStateException illegalStateException = new IllegalStateException("Failed acquire content provider");
                    bVar3.getClass();
                    wVarB = y40.v.b(vVar4, bool4, E2.b.a(illegalStateException));
                } else {
                    y40.v vVar5 = y40.w.Companion;
                    Boolean bool5 = Boolean.FALSE;
                    E2.b bVar4 = E2.Companion;
                    Exception exc = new Exception("Unknown error occurred for " + uri + " with code " + numValueOf);
                    bVar4.getClass();
                    wVarB = y40.v.b(vVar5, bool5, E2.b.a(exc));
                }
                if (contentProviderClientAcquireUnstableContentProviderClient != null) {
                    contentProviderClientAcquireUnstableContentProviderClient.close();
                }
                String message = str + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                Intrinsics.g(message, "message");
                long jCurrentTimeMillis2 = System.currentTimeMillis();
                StringBuilder sbK = com.google.android.gms.internal.measurement.k2.k(message, " took ");
                sbK.append(jCurrentTimeMillis2 - jCurrentTimeMillis);
                sbK.append("ms");
                C3309p1.c(tag, sbK.toString());
                return wVarB;
            } catch (Throwable th2) {
                try {
                    simpleName = th2.getClass().getSimpleName();
                    try {
                        throw th2;
                    } catch (Throwable th3) {
                        th = th3;
                        StringBuilder sbQ = a2.c.q(str);
                        if (simpleName != null) {
                            strConcat = " FAILING with ".concat(simpleName);
                        }
                        sbQ.append(strConcat);
                        String message2 = sbQ.toString();
                        Intrinsics.g(message2, "message");
                        long jCurrentTimeMillis3 = System.currentTimeMillis();
                        StringBuilder sbK2 = com.google.android.gms.internal.measurement.k2.k(message2, " took ");
                        sbK2.append(jCurrentTimeMillis3 - jCurrentTimeMillis);
                        sbK2.append("ms");
                        C3309p1.c(tag, sbK2.toString());
                        throw th;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    simpleName = null;
                }
            }
        } catch (Throwable th5) {
            if (contentProviderClientAcquireUnstableContentProviderClient != null) {
                contentProviderClientAcquireUnstableContentProviderClient.close();
            }
            throw th5;
        }
    }
}
