package io.branch.search.internal;

import android.database.Cursor;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.E2;
import io.branch.search.internal.InterfaceC3481z4;
import io.branch.search.internal.Pa;
import io.branch.search.internal.multiprocess.BranchNotUserUnlockedException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Set;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$execute$2", f = "BncContentProvider.kt", l = {TTAdConstant.LANDING_PAGE_TYPE_CODE}, m = "invokeSuspend")
/* renamed from: io.branch.search.internal.w4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3430w4 extends SuspendLambda implements Function2<t70.j0, Continuation<? super y40.w>, Object> {

    /* renamed from: a, reason: collision with root package name */
    public A4 f66208a;

    /* renamed from: b, reason: collision with root package name */
    public int f66209b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ C3413v4 f66210c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ A4<Object, Object> f66211d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f66212e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ Object f66213f;

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.ContentProviderClientRequestExecutor$execute$2$1$1$1", f = "BncContentProvider.kt", l = {}, m = "invokeSuspend")
    /* renamed from: io.branch.search.internal.w4$a */
    public static final class a extends SuspendLambda implements Function2<Cursor, Continuation<? super y40.w>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public /* synthetic */ Object f66214a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ A4<Object, Object> f66215b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(A4<Object, Object> a42, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f66215b = a42;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            a aVar = new a(this.f66215b, continuation);
            aVar.f66214a = obj;
            return aVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            a aVar = new a(this.f66215b, (Continuation) obj2);
            aVar.f66214a = (Cursor) obj;
            return aVar.invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            Parcel parcelObtain;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ResultKt.b(obj);
            Cursor cursor = (Cursor) this.f66214a;
            A4<Object, Object> a42 = this.f66215b;
            Intrinsics.g(a42, "<this>");
            Intrinsics.g(cursor, "cursor");
            ArrayList arrayList = new ArrayList();
            if (cursor.getColumnIndex("error") != -1) {
                cursor.moveToFirst();
                y40.v vVar = y40.w.Companion;
                byte[] blob = cursor.getBlob(R4.a(cursor, "error"));
                Intrinsics.f(blob, "getBlob(checkColumnIndex(column))");
                parcelObtain = Parcel.obtain();
                Intrinsics.f(parcelObtain, "obtain()");
                try {
                    parcelObtain.unmarshall(blob, 0, blob.length);
                    parcelObtain.setDataPosition(0);
                    Parcelable parcelable = parcelObtain.readParcelable(E2.class.getClassLoader());
                    Intrinsics.d(parcelable);
                    parcelObtain.recycle();
                    return y40.v.b(vVar, arrayList, (E2) parcelable);
                } finally {
                }
            }
            RequestMetadata requestMetadata = null;
            while (cursor.moveToNext()) {
                if (requestMetadata == null && cursor.getColumnIndex("request_metadata") != -1) {
                    byte[] blob2 = cursor.getBlob(R4.a(cursor, "request_metadata"));
                    Intrinsics.f(blob2, "getBlob(checkColumnIndex(column))");
                    parcelObtain = Parcel.obtain();
                    Intrinsics.f(parcelObtain, "obtain()");
                    try {
                        parcelObtain.unmarshall(blob2, 0, blob2.length);
                        parcelObtain.setDataPosition(0);
                        Parcelable parcelable2 = parcelObtain.readParcelable(RequestMetadata.class.getClassLoader());
                        Intrinsics.d(parcelable2);
                        parcelObtain.recycle();
                        requestMetadata = (RequestMetadata) parcelable2;
                    } finally {
                    }
                }
                String column = a42.a();
                Intrinsics.g(column, "column");
                byte[] blob3 = cursor.getBlob(R4.a(cursor, column));
                Intrinsics.f(blob3, "getBlob(checkColumnIndex(column))");
                arrayList.add(a42.a(blob3));
            }
            y40.v vVar2 = y40.w.Companion;
            E2.c cVar = new E2.c();
            if (requestMetadata == null) {
                requestMetadata = new RequestMetadata("io.branch.search", b.c0.j("randomUUID().toString()"), null, 4, null);
            }
            vVar2.getClass();
            return y40.v.a(arrayList, cVar, requestMetadata);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Incorrect types in method signature: (Lio/branch/search/internal/v4;Lio/branch/search/internal/A4<Ljava/lang/Object;Ljava/lang/Object;>;Ljava/lang/Object;Ljava/lang/Object;Lkotlin/coroutines/Continuation<-Lio/branch/search/internal/w4;>;)V */
    public C3430w4(C3413v4 c3413v4, A4 a42, int i5, Object obj, Continuation continuation) {
        super(2, continuation);
        this.f66210c = c3413v4;
        this.f66211d = a42;
        this.f66212e = i5;
        this.f66213f = obj;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @NotNull
    public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
        return new C3430w4(this.f66210c, this.f66211d, this.f66212e, this.f66213f, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((C3430w4) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r1v1, types: [io.branch.search.internal.z4] */
    /* JADX WARN: Type inference failed for: r1v6 */
    /* JADX WARN: Type inference failed for: r1v8 */
    /* JADX WARN: Type inference failed for: r1v9 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    @Nullable
    public final Object invokeSuspend(@NotNull Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r12 = this.f66209b;
        try {
            if (r12 == 0) {
                ResultKt.b(obj);
                long andIncrement = this.f66210c.f66135g.getAndIncrement();
                if (!this.f66210c.f66136h.isUserUnlocked()) {
                    BranchNotUserUnlockedException branchNotUserUnlockedException = new BranchNotUserUnlockedException();
                    C3309p1.a(EnumC3131e9.ContentProviderRequests, branchNotUserUnlockedException);
                    y40.v vVar = y40.w.Companion;
                    EmptyList emptyList = EmptyList.f71733a;
                    Pa.Companion.getClass();
                    return y40.v.b(vVar, emptyList, new E2.d(Pa.a.a(branchNotUserUnlockedException)));
                }
                C3309p1 logger = C3309p1.f65465a;
                A4<Object, Object> a42 = this.f66211d;
                Set<String> set = C3326q1.f65496a;
                Intrinsics.g(a42, "<this>");
                A4<Object, Object> a43 = this.f66211d;
                C3413v4 c3413v4 = this.f66210c;
                int i5 = this.f66212e;
                Object obj2 = this.f66213f;
                EnumC3131e9 tag = EnumC3131e9.Latency;
                Intrinsics.g(tag, "tag");
                Intrinsics.g(logger, "logger");
                F4 f42 = c3413v4.f66132d;
                Pair<String, String>[] pairArrA = a43.a((A4<Object, Object>) obj2);
                Uri uriA = InterfaceC3481z4.a.a(a43, f42, (Pair[]) Arrays.copyOf(pairArrA, pairArrA.length));
                a aVar = new a(a43, null);
                this.f66208a = a43;
                this.f66209b = 1;
                obj = C3413v4.a(c3413v4, i5, andIncrement, uriA, aVar, this);
                r12 = a43;
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (r12 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                A4 a44 = this.f66208a;
                ResultKt.b(obj);
                r12 = a44;
            }
            return (y40.w) obj;
        } catch (Throwable th2) {
            C3309p1.a(EnumC3131e9.UnhandledCoroutineException, th2);
            String str = "Failed to execute query " + r12.getPath();
            C3296o5.a aVar2 = C3296o5.f65426a;
            C3296o5.a(new F6("ContentProviderDelegate", str, null, th2, null));
            y40.v vVar2 = y40.w.Companion;
            EmptyList emptyList2 = EmptyList.f71733a;
            Pa.Companion.getClass();
            return y40.v.b(vVar2, emptyList2, new E2.d(Pa.a.a(th2)));
        }
    }
}
