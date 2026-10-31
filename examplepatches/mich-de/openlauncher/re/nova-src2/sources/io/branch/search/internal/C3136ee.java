package io.branch.search.internal;

import android.content.ContentProviderClient;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.CancellationSignal;
import android.os.RemoteException;
import io.branch.search.internal.A4;
import io.branch.search.internal.C3251lb;
import java.io.Closeable;
import java.io.Serializable;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.CloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.SingleCallStrategy$execute$1", f = "QueryPlanner.kt", l = {48, 68, 71}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.ee, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3136ee extends SuspendLambda implements Function2<t70.j0, Continuation<? super Unit>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public Serializable f64408a;

    /* renamed from: b, reason: collision with root package name */
    public Closeable f64409b;

    /* renamed from: c, reason: collision with root package name */
    public int f64410c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f64411d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Uri f64412e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ C3220je f64413f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Function1<Object, Unit> f64414g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ Context f64415h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ Function2<Cursor, Continuation<Object>, Object> f64416i;

    /* renamed from: io.branch.search.internal.ee$a */
    public static final class a extends Lambda implements Function0<Pair<? extends Cursor, ? extends Boolean>> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Ref.ObjectRef<ContentProviderClient> f64417a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Context f64418b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Uri f64419c;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Ref.ObjectRef<ContentProviderClient> objectRef, Context context, Uri uri, t70.j0 j0Var) {
            super(0);
            this.f64417a = objectRef;
            this.f64418b = context;
            this.f64419c = uri;
        }

        /* JADX WARN: Finally extract failed */
        @Override // kotlin.jvm.functions.Function0
        public final Object invoke() {
            Pair pair;
            Cursor cursorQuery;
            String strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            try {
                this.f64417a.f71863a = this.f64418b.getContentResolver().acquireUnstableContentProviderClient(this.f64419c);
                C3309p1 c3309p1 = C3309p1.f65465a;
                EnumC3131e9 tag = EnumC3131e9.ContentProviderRequests;
                String str = "IPC query " + this.f64419c + " - start";
                Ref.ObjectRef<ContentProviderClient> objectRef = this.f64417a;
                Uri uri = this.f64419c;
                c3309p1.getClass();
                Intrinsics.g(tag, "tag");
                long jCurrentTimeMillis = System.currentTimeMillis();
                try {
                    ContentProviderClient contentProviderClient = (ContentProviderClient) objectRef.f71863a;
                    if (contentProviderClient == null || (cursorQuery = contentProviderClient.query(uri, null, null, null, null, new CancellationSignal())) == null) {
                        A4.c cVar = A4.Companion;
                        Exception exc = new Exception(uri + " returned null cursor");
                        cVar.getClass();
                        pair = new Pair(A4.c.a(exc), Boolean.TRUE);
                    } else {
                        pair = new Pair(cursorQuery, Boolean.FALSE);
                    }
                    String message = str + com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    Intrinsics.g(message, "message");
                    C3309p1.c(tag, message + " took " + (System.currentTimeMillis() - jCurrentTimeMillis) + "ms");
                    return pair;
                } catch (Throwable th2) {
                    String simpleName = null;
                    try {
                        simpleName = th2.getClass().getSimpleName();
                        throw th2;
                    } catch (Throwable th3) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(str);
                        if (simpleName != null) {
                            strConcat = " FAILING with ".concat(simpleName);
                        }
                        sb2.append(strConcat);
                        String message2 = sb2.toString();
                        Intrinsics.g(message2, "message");
                        C3309p1.c(tag, message2 + " took " + (System.currentTimeMillis() - jCurrentTimeMillis) + "ms");
                        throw th3;
                    }
                }
            } catch (RemoteException e3) {
                C3309p1.c(EnumC3131e9.ContentProviderRequests, "A RemoteException occurred on query for " + this.f64419c);
                A4.Companion.getClass();
                return new Pair(A4.c.a(e3), Boolean.TRUE);
            } catch (Throwable th4) {
                A4.Companion.getClass();
                return new Pair(A4.c.a(th4), Boolean.FALSE);
            }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public C3136ee(Uri uri, C3220je c3220je, Function1<Object, Unit> function1, Context context, Function2<? super Cursor, ? super Continuation<Object>, ? extends Object> function2, Continuation<? super C3136ee> continuation) {
        super(2, continuation);
        this.f64412e = uri;
        this.f64413f = c3220je;
        this.f64414g = function1;
        this.f64415h = context;
        this.f64416i = function2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        C3136ee c3136ee = new C3136ee(this.f64412e, this.f64413f, this.f64414g, this.f64415h, this.f64416i, continuation);
        c3136ee.f64411d = obj;
        return c3136ee;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3136ee) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x00cf, code lost:
    
        if (io.branch.search.internal.C3220je.a(r1, r4, r11, r10) != r0) goto L49;
     */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00c0  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(@NotNull Object obj) {
        String path;
        t70.j0 j0Var;
        Pair pair;
        Closeable closeable;
        Throwable th2;
        String str;
        Ref.ObjectRef objectRef;
        ContentProviderClient contentProviderClient;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f64410c;
        if (i5 == 0) {
            ResultKt.b(obj);
            t70.j0 j0Var2 = (t70.j0) this.f64411d;
            path = this.f64412e.getPath();
            if (path == null) {
                path = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            C3220je c3220je = this.f64413f;
            Function1<Object, Unit> function1 = this.f64414g;
            this.f64411d = j0Var2;
            this.f64408a = path;
            this.f64410c = 1;
            Object objA = C3220je.a(c3220je, path, (Function1) function1, (Continuation) this);
            if (objA != coroutineSingletons) {
                j0Var = j0Var2;
                obj = objA;
            }
            return coroutineSingletons;
        }
        if (i5 == 1) {
            path = (String) this.f64408a;
            j0Var = (t70.j0) this.f64411d;
            ResultKt.b(obj);
        } else {
            if (i5 != 2) {
                if (i5 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            closeable = this.f64409b;
            objectRef = (Ref.ObjectRef) this.f64408a;
            str = (String) this.f64411d;
            try {
                ResultKt.b(obj);
                CloseableKt.a(closeable, null);
                C3220je c3220je2 = this.f64413f;
                contentProviderClient = (ContentProviderClient) objectRef.f71863a;
                if (contentProviderClient != null) {
                    contentProviderClient.close();
                }
                this.f64411d = null;
                this.f64408a = null;
                this.f64409b = null;
                this.f64410c = 3;
            } catch (Throwable th3) {
                th2 = th3;
                try {
                    throw th2;
                } catch (Throwable th4) {
                    CloseableKt.a(closeable, th2);
                    throw th4;
                }
            }
        }
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
        if (zBooleanValue) {
            C3251lb.a aVar = C3251lb.Companion;
            a aVar2 = new a(objectRef2, this.f64415h, this.f64412e, j0Var);
            aVar.getClass();
            int i11 = 2;
            while (true) {
                pair = (Pair) aVar2.invoke();
                int i12 = i11 - 1;
                if (i11 <= 0 || !((Boolean) pair.f71684b).booleanValue()) {
                    break;
                }
                i11 = i12;
            }
            Closeable closeable2 = (Closeable) pair.f71683a;
            Function2<Cursor, Continuation<Object>, Object> function2 = this.f64416i;
            try {
                Cursor it = (Cursor) closeable2;
                Intrinsics.f(it, "it");
                this.f64411d = path;
                this.f64408a = objectRef2;
                this.f64409b = closeable2;
                this.f64410c = 2;
                Object objInvoke = function2.invoke(it, this);
                if (objInvoke != coroutineSingletons) {
                    str = path;
                    closeable = closeable2;
                    obj = objInvoke;
                    objectRef = objectRef2;
                    CloseableKt.a(closeable, null);
                    C3220je c3220je22 = this.f64413f;
                    contentProviderClient = (ContentProviderClient) objectRef.f71863a;
                    if (contentProviderClient != null) {
                    }
                    this.f64411d = null;
                    this.f64408a = null;
                    this.f64409b = null;
                    this.f64410c = 3;
                }
                return coroutineSingletons;
            } catch (Throwable th5) {
                closeable = closeable2;
                th2 = th5;
                throw th2;
            }
        }
        return Unit.f71706a;
    }
}
