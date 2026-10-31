package io.branch.search.internal.multiprocess;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.net.Uri;
import android.os.Binder;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import androidx.recyclerview.widget.n0;
import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.search.AnalyticsEvent;
import io.branch.search.internal.A1;
import io.branch.search.internal.A4;
import io.branch.search.internal.A5;
import io.branch.search.internal.AbstractC3464y4;
import io.branch.search.internal.B5;
import io.branch.search.internal.C3061a7;
import io.branch.search.internal.C3062a8;
import io.branch.search.internal.C3074b3;
import io.branch.search.internal.C3095c7;
import io.branch.search.internal.C3309p1;
import io.branch.search.internal.C3366s8;
import io.branch.search.internal.C3388td;
import io.branch.search.internal.C3478z1;
import io.branch.search.internal.C4;
import io.branch.search.internal.EnumC3131e9;
import io.branch.search.internal.F4;
import io.branch.search.internal.H2;
import io.branch.search.internal.InterfaceC3481z4;
import io.branch.search.internal.J1;
import io.branch.search.internal.P1;
import io.branch.search.internal.Q6;
import io.branch.search.internal.Y1;
import io.branch.search.internal.Z6;
import io.branch.search.internal.util.CorosKt;
import io.branch.search.ui.ClickInfo;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import p6.p0;
import t70.j0;
import t70.m0;
import t70.p2;
import t70.r;
import t70.s;
import y40.b0;
import y40.d0;
import y40.e;
import y40.g;
import y40.i;
import y40.k;
import y40.w;
import y40.z;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0016\u0018\u00002\u00020\u00012\u00020\u0002B\u0007¢\u0006\u0004\b\u0003\u0010\u0004R#\u0010\f\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00070\u00060\u00058\u0006¢\u0006\f\n\u0004\b\b\u0010\t\u001a\u0004\b\n\u0010\u000b¨\u0006\r"}, d2 = {"Lio/branch/search/internal/multiprocess/BncContentProvider;", "Landroid/content/ContentProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lt70/r;", "Lkotlin/Lazy;", "Lio/branch/search/internal/client/ads/AdsClient;", "i", "Lt70/r;", "getAdsClient", "()Lt70/r;", "adsClient", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public class BncContentProvider extends ContentProvider {

    /* renamed from: a, reason: collision with root package name */
    public F4 f65216a;

    /* renamed from: c, reason: collision with root package name */
    public J1.b f65218c;

    /* renamed from: d, reason: collision with root package name */
    public J1.c f65219d;

    /* renamed from: e, reason: collision with root package name */
    public J1.a f65220e;

    /* renamed from: g, reason: collision with root package name */
    public P1 f65222g;

    /* renamed from: h, reason: collision with root package name */
    public C3366s8 f65223h;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3388td f65217b = new C3388td("BncContentProvider");

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final r f65221f = m0.b();

    /* renamed from: i, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final r adsClient = m0.b();

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final A5 f65225j = new A5();

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$onCreate$1", f = "BncContentProvider.kt", l = {103}, m = "invokeSuspend")
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65226a;

        public a(Continuation<? super a> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return BncContentProvider.this.new a(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return BncContentProvider.this.new a((Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65226a;
            if (i5 == 0) {
                ResultKt.b(obj);
                this.f65226a = 1;
                obj = B5.a(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            ((Y1) obj).a(BncContentProvider.this);
            ((s) BncContentProvider.this.f65221f).X(Boolean.TRUE);
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$openFile$1", f = "BncContentProvider.kt", l = {Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super ParcelFileDescriptor>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f65228a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ BncContentProvider f65229b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Uri f65230c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ String f65231d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(Uri uri, BncContentProvider bncContentProvider, String str, Continuation continuation) {
            super(2, continuation);
            this.f65229b = bncContentProvider;
            this.f65230c = uri;
            this.f65231d = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return new b(this.f65230c, this.f65229b, this.f65231d, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((b) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65228a;
            if (i5 == 0) {
                ResultKt.b(obj);
                BncContentProvider bncContentProvider = this.f65229b;
                this.f65228a = 1;
                if (BncContentProvider.a(bncContentProvider, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            int callingUid = Binder.getCallingUid();
            Context context = this.f65229b.getContext();
            Intrinsics.d(context);
            String[] packagesForUid = context.getPackageManager().getPackagesForUid(callingUid);
            if (packagesForUid == null) {
                packagesForUid = new String[0];
            }
            BncContentProvider bncContentProvider2 = this.f65229b;
            for (String str : packagesForUid) {
                P1 p12 = bncContentProvider2.f65222g;
                if (p12 == null) {
                    Intrinsics.m("branchConfiguration");
                    throw null;
                }
                if (p12.f63054w.contains(str)) {
                    J1.a aVar = this.f65229b.f65220e;
                    if (aVar == null) {
                        Intrinsics.m("openFileUriMatcher");
                        throw null;
                    }
                    Uri uri = this.f65230c;
                    Intrinsics.g(uri, "uri");
                    int iMatch = aVar.f62696a.match(uri);
                    AbstractC3464y4 abstractC3464y4 = (AbstractC3464y4) (iMatch != -1 ? (InterfaceC3481z4) aVar.f62697b.get(Integer.valueOf(iMatch)) : null);
                    if (!Intrinsics.b(abstractC3464y4, AbstractC3464y4.a.f66306b)) {
                        if (abstractC3464y4 != null) {
                            throw new NoWhenBranchMatchedException();
                        }
                        throw new IllegalStateException("Unknown content URI: " + this.f65230c);
                    }
                    BncContentProvider bncContentProvider3 = this.f65229b;
                    Uri uri2 = this.f65230c;
                    String str2 = this.f65231d;
                    F4 f42 = bncContentProvider3.f65216a;
                    if (f42 == null) {
                        Intrinsics.m("contextDelegate");
                        throw null;
                    }
                    C3366s8 c3366s8 = bncContentProvider3.f65223h;
                    if (c3366s8 != null) {
                        return BncContentProvider.a(bncContentProvider3, uri2, str2, f42, c3366s8);
                    }
                    Intrinsics.m("networkInterface");
                    throw null;
                }
            }
            throw new SecurityException(c0.i(callingUid, "Unable to load images for uid=", ", did you added package name to the whitelist with BranchNavigatorCoreConfig.setImageLoadingWhiteList(List<String> list) method?"));
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$query$1", f = "BncContentProvider.kt", l = {Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Cursor>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public A4 f65232a;

        /* renamed from: b, reason: collision with root package name */
        public int f65233b;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Uri f65235d;

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$query$1$1", f = "BncContentProvider.kt", l = {148}, m = "invokeSuspend")
        public static final class a extends SuspendLambda implements Function1<Continuation<? super w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65236a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65237b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65238c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ Uri f65239d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(Uri uri, BncContentProvider bncContentProvider, String str, Continuation continuation) {
                super(1, continuation);
                this.f65237b = bncContentProvider;
                this.f65238c = str;
                this.f65239d = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new a(this.f65239d, this.f65237b, this.f65238c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((a) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65236a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                A5 a52 = this.f65237b.f65225j;
                String str = this.f65238c;
                z zVar = b0.Companion;
                Uri uri = this.f65239d;
                zVar.getClass();
                Intrinsics.g(uri, "uri");
                String strA = p0.a(uri, "q");
                Intrinsics.d(strA);
                String strA2 = p0.a(uri, "disable_organic");
                b0 b0Var = new b0(strA, strA2 != null ? Boolean.parseBoolean(strA2) : false, null);
                this.f65236a = 1;
                Object objA = a52.a(str, b0Var, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$query$1$2", f = "BncContentProvider.kt", l = {151}, m = "invokeSuspend")
        public static final class b extends SuspendLambda implements Function1<Continuation<? super w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65240a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65241b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65242c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ Uri f65243d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public b(Uri uri, BncContentProvider bncContentProvider, String str, Continuation continuation) {
                super(1, continuation);
                this.f65241b = bncContentProvider;
                this.f65242c = str;
                this.f65243d = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new b(this.f65243d, this.f65241b, this.f65242c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((b) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) throws NumberFormatException {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65240a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                A5 a52 = this.f65241b.f65225j;
                String str = this.f65242c;
                y40.c0 c0Var = d0.Companion;
                Uri uri = this.f65243d;
                c0Var.getClass();
                Intrinsics.g(uri, "uri");
                String strA = p0.a(uri, "u");
                Long lValueOf = strA != null ? Long.valueOf(Long.parseLong(strA)) : null;
                String strA2 = p0.a(uri, "SA_ROWS");
                Intrinsics.d(strA2);
                int i11 = Integer.parseInt(strA2);
                String strA3 = p0.a(uri, "SA_SIZE");
                Intrinsics.d(strA3);
                g gVar = new g(i11, Integer.parseInt(strA3));
                String strA4 = p0.a(uri, "SL_ROWS");
                Intrinsics.d(strA4);
                k kVar = new k(Integer.parseInt(strA4));
                String strA5 = p0.a(uri, "SI_ROWS");
                Intrinsics.d(strA5);
                int i12 = Integer.parseInt(strA5);
                String strA6 = p0.a(uri, "SI_SIZE");
                Intrinsics.d(strA6);
                i iVar = new i(i12, Integer.parseInt(strA6));
                boolean z11 = Boolean.parseBoolean(p0.a(uri, "cache"));
                String strA7 = p0.a(uri, "disable_organic");
                d0 d0Var = new d0(lValueOf, gVar, kVar, iVar, z11, strA7 != null ? Boolean.parseBoolean(strA7) : false, null);
                this.f65240a = 1;
                Object objA = a52.a(str, d0Var, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$query$1$3", f = "BncContentProvider.kt", l = {154}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.multiprocess.BncContentProvider$c$c, reason: collision with other inner class name */
        public static final class C0343c extends SuspendLambda implements Function1<Continuation<? super w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65244a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65245b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65246c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ Uri f65247d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0343c(Uri uri, BncContentProvider bncContentProvider, String str, Continuation continuation) {
                super(1, continuation);
                this.f65245b = bncContentProvider;
                this.f65246c = str;
                this.f65247d = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new C0343c(this.f65247d, this.f65245b, this.f65246c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((C0343c) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65244a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                A5 a52 = this.f65245b.f65225j;
                String str = this.f65246c;
                y40.d dVar = e.Companion;
                Uri uri = this.f65247d;
                dVar.getClass();
                Intrinsics.g(uri, "uri");
                String strA = p0.a(uri, "q");
                Intrinsics.d(strA);
                e eVar = new e(strA, null);
                this.f65244a = 1;
                Object objA = a52.a(str, eVar, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$query$1$4", f = "BncContentProvider.kt", l = {157}, m = "invokeSuspend")
        public static final class d extends SuspendLambda implements Function1<Continuation<? super w>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65248a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65249b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65250c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ Uri f65251d;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public d(Uri uri, BncContentProvider bncContentProvider, String str, Continuation continuation) {
                super(1, continuation);
                this.f65249b = bncContentProvider;
                this.f65250c = str;
                this.f65251d = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new d(this.f65251d, this.f65249b, this.f65250c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((d) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65248a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                A5 a52 = this.f65249b.f65225j;
                String str = this.f65250c;
                y40.b bVar = y40.c.Companion;
                Uri uri = this.f65251d;
                bVar.getClass();
                Intrinsics.g(uri, "uri");
                String strA = p0.a(uri, "q");
                Intrinsics.d(strA);
                String strA2 = p0.a(uri, "disable_organic");
                y40.c cVar = new y40.c(strA, strA2 != null ? Boolean.parseBoolean(strA2) : false, null);
                this.f65248a = 1;
                Object objA = a52.a(str, cVar, this);
                return objA == coroutineSingletons ? coroutineSingletons : objA;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(Uri uri, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f65235d = uri;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return BncContentProvider.this.new c(this.f65235d, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return BncContentProvider.this.new c(this.f65235d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            A4 a42;
            MatrixCursor matrixCursorA;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f65233b;
            if (i5 == 0) {
                ResultKt.b(obj);
                J1.b bVar = BncContentProvider.this.f65218c;
                if (bVar == null) {
                    Intrinsics.m("queryUriMatcher");
                    throw null;
                }
                Uri uri = this.f65235d;
                Intrinsics.g(uri, "uri");
                int iMatch = bVar.f62696a.match(uri);
                A4 a43 = (A4) (iMatch != -1 ? (InterfaceC3481z4) bVar.f62697b.get(Integer.valueOf(iMatch)) : null);
                if (a43 == null) {
                    throw new IllegalStateException("Unknown content URI: " + this.f65235d);
                }
                BncContentProvider bncContentProvider = BncContentProvider.this;
                this.f65232a = a43;
                this.f65233b = 1;
                if (BncContentProvider.a(bncContentProvider, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                a42 = a43;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                a42 = this.f65232a;
                ResultKt.b(obj);
            }
            String callingPackage = BncContentProvider.this.getCallingPackage();
            if (callingPackage == null) {
                callingPackage = "io.branch.search";
            }
            if (Intrinsics.b(a42, A4.d.f61929a)) {
                matrixCursorA = a42.a((Function1) new a(this.f65235d, BncContentProvider.this, callingPackage, null));
            } else if (Intrinsics.b(a42, A4.e.f61932a)) {
                matrixCursorA = a42.a((Function1) new b(this.f65235d, BncContentProvider.this, callingPackage, null));
            } else if (Intrinsics.b(a42, A4.b.f61926a)) {
                matrixCursorA = a42.a((Function1) new C0343c(this.f65235d, BncContentProvider.this, callingPackage, null));
            } else {
                if (!Intrinsics.b(a42, A4.a.f61923a)) {
                    throw new NoWhenBranchMatchedException();
                }
                matrixCursorA = a42.a((Function1) new d(this.f65235d, BncContentProvider.this, callingPackage, null));
            }
            Context context = BncContentProvider.this.getContext();
            if (context != null) {
                Z6.a aVar = Z6.f63818a;
                aVar.getClass();
                if (aVar.f63822d.get() && (!aVar.f63822d.get() || System.currentTimeMillis() >= aVar.f63823e + aVar.f63819a)) {
                    Long lA = C3061a7.a();
                    if (lA != null && lA.longValue() < aVar.f63821c) {
                        return matrixCursorA;
                    }
                    try {
                        FileOutputStream fileOutputStream = new FileOutputStream(new File(context.getFilesDir(), "testFile.dat"));
                        try {
                            int i11 = aVar.f63820b;
                            byte[] bArr = new byte[i11];
                            for (int i12 = 0; i12 < i11; i12++) {
                                bArr[i12] = 0;
                            }
                            fileOutputStream.write(bArr);
                            Unit unit = Unit.f71706a;
                            fileOutputStream.close();
                            aVar.f63822d.set(false);
                        } finally {
                        }
                    } finally {
                        try {
                        } finally {
                        }
                    }
                    aVar.f63823e = System.currentTimeMillis();
                    if (!aVar.f63822d.get()) {
                        Iterator it = aVar.f63824f.iterator();
                        while (it.hasNext()) {
                            Q6 q62 = (Q6) ((WeakReference) it.next()).get();
                            if (q62 != null) {
                                q62.b();
                            }
                        }
                        System.exit(0);
                        throw new RuntimeException("System.exit returned normally, while it was supposed to halt JVM.");
                    }
                }
            }
            return matrixCursorA;
        }
    }

    @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1", f = "BncContentProvider.kt", l = {168, Sdk.SDKError.Reason.AD_NOT_LOADED_VALUE, Sdk.SDKError.Reason.AD_RESPONSE_TIMED_OUT_VALUE, Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE, 232, 238, 244, n0.DEFAULT_SWIPE_ANIMATION_DURATION}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class d extends SuspendLambda implements Function2<j0, Continuation<? super Integer>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public C4 f65252a;

        /* renamed from: b, reason: collision with root package name */
        public int f65253b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f65254c;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ Uri f65256e;

        /* renamed from: f, reason: collision with root package name */
        public final /* synthetic */ ContentValues f65257f;

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$1", f = "BncContentProvider.kt", l = {175}, m = "invokeSuspend")
        public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65258a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f65259b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ ContentValues f65260c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65261d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ String f65262e;

            /* renamed from: f, reason: collision with root package name */
            public final /* synthetic */ Uri f65263f;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public a(ContentValues contentValues, BncContentProvider bncContentProvider, String str, Uri uri, Continuation<? super a> continuation) {
                super(2, continuation);
                this.f65260c = contentValues;
                this.f65261d = bncContentProvider;
                this.f65262e = str;
                this.f65263f = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                a aVar = new a(this.f65260c, this.f65261d, this.f65262e, this.f65263f, continuation);
                aVar.f65259b = obj;
                return aVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((a) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            /* JADX WARN: Removed duplicated region for block: B:16:0x0043  */
            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invokeSuspend(@NotNull Object obj) {
                Unit unit;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65258a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    j0 j0Var = (j0) this.f65259b;
                    C4.j.b bVar = (C4.j.b) C4.j.f62252c.a(this.f65260c);
                    if (bVar == null) {
                        unit = null;
                        if (unit == null) {
                            Uri uri = this.f65263f;
                            ContentValues contentValues = this.f65260c;
                            C3309p1.b(EnumC3131e9.ContentProviderRequests, uri + " didn't receive any ContentValues: " + contentValues);
                        }
                        return Unit.f71706a;
                    }
                    BncContentProvider bncContentProvider = this.f65261d;
                    String str = this.f65262e;
                    A5 a52 = bncContentProvider.f65225j;
                    this.f65259b = j0Var;
                    this.f65258a = 1;
                    if (a52.a(str, bVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                unit = Unit.f71706a;
                if (unit == null) {
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$2", f = "BncContentProvider.kt", l = {182}, m = "invokeSuspend")
        public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65264a;

            /* renamed from: b, reason: collision with root package name */
            public /* synthetic */ Object f65265b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ ContentValues f65266c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65267d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ String f65268e;

            /* renamed from: f, reason: collision with root package name */
            public final /* synthetic */ Uri f65269f;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public b(ContentValues contentValues, BncContentProvider bncContentProvider, String str, Uri uri, Continuation<? super b> continuation) {
                super(2, continuation);
                this.f65266c = contentValues;
                this.f65267d = bncContentProvider;
                this.f65268e = str;
                this.f65269f = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                b bVar = new b(this.f65266c, this.f65267d, this.f65268e, this.f65269f, continuation);
                bVar.f65265b = obj;
                return bVar;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(Object obj, Object obj2) {
                return ((b) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            }

            /* JADX WARN: Removed duplicated region for block: B:16:0x0043  */
            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invokeSuspend(@NotNull Object obj) {
                Unit unit;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65264a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    j0 j0Var = (j0) this.f65265b;
                    C4.d.a aVar = (C4.d.a) C4.d.f62210c.a(this.f65266c);
                    if (aVar == null) {
                        unit = null;
                        if (unit == null) {
                            Uri uri = this.f65269f;
                            ContentValues contentValues = this.f65266c;
                            C3309p1.b(EnumC3131e9.ContentProviderRequests, uri + " didn't receive any ContentValues: " + contentValues);
                        }
                        return Unit.f71706a;
                    }
                    BncContentProvider bncContentProvider = this.f65267d;
                    String str = this.f65268e;
                    A5 a52 = bncContentProvider.f65225j;
                    this.f65265b = j0Var;
                    this.f65264a = 1;
                    if (a52.a(str, aVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                unit = Unit.f71706a;
                if (unit == null) {
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$3", f = "BncContentProvider.kt", l = {190}, m = "invokeSuspend")
        public static final class c extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65270a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65271b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65272c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public c(BncContentProvider bncContentProvider, String str, Continuation<? super c> continuation) {
                super(1, continuation);
                this.f65271b = bncContentProvider;
                this.f65272c = str;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new c(this.f65271b, this.f65272c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new c(this.f65271b, this.f65272c, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65270a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    A5 a52 = this.f65271b.f65225j;
                    String str = this.f65272c;
                    this.f65270a = 1;
                    if (a52.e(str, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$4", f = "BncContentProvider.kt", l = {194}, m = "invokeSuspend")
        /* renamed from: io.branch.search.internal.multiprocess.BncContentProvider$d$d, reason: collision with other inner class name */
        public static final class C0344d extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65273a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ContentValues f65274b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ j0 f65275c;

            /* renamed from: d, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65276d;

            /* renamed from: e, reason: collision with root package name */
            public final /* synthetic */ String f65277e;

            /* renamed from: f, reason: collision with root package name */
            public final /* synthetic */ Uri f65278f;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public C0344d(ContentValues contentValues, j0 j0Var, BncContentProvider bncContentProvider, String str, Uri uri, Continuation<? super C0344d> continuation) {
                super(1, continuation);
                this.f65274b = contentValues;
                this.f65275c = j0Var;
                this.f65276d = bncContentProvider;
                this.f65277e = str;
                this.f65278f = uri;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new C0344d(this.f65274b, this.f65275c, this.f65276d, this.f65277e, this.f65278f, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return ((C0344d) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
            }

            /* JADX WARN: Removed duplicated region for block: B:16:0x0039  */
            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invokeSuspend(@NotNull Object obj) {
                Unit unit;
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65273a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    C4.i.d dVar = (C4.i.d) C4.i.f62229c.a(this.f65274b);
                    if (dVar == null) {
                        unit = null;
                        if (unit == null) {
                            Uri uri = this.f65278f;
                            ContentValues contentValues = this.f65274b;
                            C3309p1.b(EnumC3131e9.ContentProviderRequests, uri + " didn't receive any ContentValues: " + contentValues);
                        }
                        return Unit.f71706a;
                    }
                    BncContentProvider bncContentProvider = this.f65276d;
                    String str = this.f65277e;
                    A5 a52 = bncContentProvider.f65225j;
                    this.f65273a = 1;
                    if (a52.a(str, dVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                unit = Unit.f71706a;
                if (unit == null) {
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$5", f = "BncContentProvider.kt", l = {201}, m = "invokeSuspend")
        public static final class e extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65279a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65280b;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public e(BncContentProvider bncContentProvider, Continuation<? super e> continuation) {
                super(1, continuation);
                this.f65280b = bncContentProvider;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new e(this.f65280b, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new e(this.f65280b, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65279a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    A5 a52 = this.f65280b.f65225j;
                    this.f65279a = 1;
                    if (a52.a(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$6", f = "BncContentProvider.kt", l = {Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE}, m = "invokeSuspend")
        public static final class f extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65281a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65282b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65283c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public f(BncContentProvider bncContentProvider, String str, Continuation<? super f> continuation) {
                super(1, continuation);
                this.f65282b = bncContentProvider;
                this.f65283c = str;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new f(this.f65282b, this.f65283c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new f(this.f65282b, this.f65283c, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65281a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    A5 a52 = this.f65282b.f65225j;
                    String str = this.f65283c;
                    this.f65281a = 1;
                    if (a52.c(str, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        @DebugMetadata(c = "io.branch.search.internal.multiprocess.BncContentProvider$update$1$7", f = "BncContentProvider.kt", l = {Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE}, m = "invokeSuspend")
        public static final class g extends SuspendLambda implements Function1<Continuation<? super Unit>, Object> {

            /* renamed from: a, reason: collision with root package name */
            public int f65284a;

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ BncContentProvider f65285b;

            /* renamed from: c, reason: collision with root package name */
            public final /* synthetic */ String f65286c;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public g(BncContentProvider bncContentProvider, String str, Continuation<? super g> continuation) {
                super(1, continuation);
                this.f65285b = bncContentProvider;
                this.f65286c = str;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@NotNull Continuation<?> continuation) {
                return new g(this.f65285b, this.f65286c, continuation);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return new g(this.f65285b, this.f65286c, (Continuation) obj).invokeSuspend(Unit.f71706a);
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f65284a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    A5 a52 = this.f65285b.f65225j;
                    String str = this.f65286c;
                    this.f65284a = 1;
                    if (a52.b(str, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(Uri uri, ContentValues contentValues, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f65256e = uri;
            this.f65257f = contentValues;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            d dVar = BncContentProvider.this.new d(this.f65256e, this.f65257f, continuation);
            dVar.f65254c = obj;
            return dVar;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(Object obj, Object obj2) {
            return ((d) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }

        /* JADX WARN: Code restructure failed: missing block: B:107:0x02db, code lost:
        
            if (r2 == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:118:0x0333, code lost:
        
            if (r2 == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:129:0x0388, code lost:
        
            if (r7.a(r2, r16) == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:55:0x0175, code lost:
        
            if (r7.a(r13, r2, r16) == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:68:0x01c8, code lost:
        
            if (r2.c(r16) == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:71:0x01d9, code lost:
        
            if (r2.b(r16) == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:82:0x0229, code lost:
        
            if (r2 == r1) goto L130;
         */
        /* JADX WARN: Code restructure failed: missing block: B:96:0x0280, code lost:
        
            if (r2 == r1) goto L130;
         */
        /* JADX WARN: Removed duplicated region for block: B:133:0x038f  */
        /* JADX WARN: Removed duplicated region for block: B:28:0x00a0  */
        /* JADX WARN: Removed duplicated region for block: B:31:0x00ac  */
        /* JADX WARN: Removed duplicated region for block: B:32:0x00c1  */
        /* JADX WARN: Removed duplicated region for block: B:59:0x017d  */
        /* JADX WARN: Removed duplicated region for block: B:75:0x01e1  */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) {
            j0 j0Var;
            C4 c42;
            String callingPackage;
            Object objA;
            Object objA2;
            Object objD;
            Object objA3;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            Unit unit = null;
            switch (this.f65253b) {
                case 0:
                    ResultKt.b(obj);
                    j0Var = (j0) this.f65254c;
                    J1.c cVar = BncContentProvider.this.f65219d;
                    if (cVar == null) {
                        Intrinsics.m("updateUriMatcher");
                        throw null;
                    }
                    Uri uri = this.f65256e;
                    Intrinsics.g(uri, "uri");
                    int iMatch = cVar.f62696a.match(uri);
                    c42 = (C4) (iMatch != -1 ? (InterfaceC3481z4) cVar.f62697b.get(Integer.valueOf(iMatch)) : null);
                    if (c42 == null) {
                        throw new IllegalStateException("Unknown content URI: " + this.f65256e);
                    }
                    BncContentProvider bncContentProvider = BncContentProvider.this;
                    this.f65254c = j0Var;
                    this.f65252a = c42;
                    this.f65253b = 1;
                    if (BncContentProvider.a(bncContentProvider, this) != coroutineSingletons) {
                        j0 j0Var2 = j0Var;
                        callingPackage = BncContentProvider.this.getCallingPackage();
                        if (callingPackage == null) {
                            callingPackage = "io.branch.search";
                        }
                        String str = callingPackage;
                        if (!Intrinsics.b(c42, C4.j.f62251b)) {
                            m0.t(CorosKt.getBNCScope(), null, null, new a(this.f65257f, BncContentProvider.this, str, this.f65256e, null), 3);
                        } else if (Intrinsics.b(c42, C4.d.f62209b)) {
                            m0.t(CorosKt.getBNCScope(), null, null, new b(this.f65257f, BncContentProvider.this, str, this.f65256e, null), 3);
                        } else if (Intrinsics.b(c42, C4.h.f62227b)) {
                            BncContentProvider bncContentProvider2 = BncContentProvider.this;
                            bncContentProvider2.f65217b.a(new c(bncContentProvider2, str, null));
                        } else if (Intrinsics.b(c42, C4.i.f62228b)) {
                            BncContentProvider bncContentProvider3 = BncContentProvider.this;
                            bncContentProvider3.f65217b.a(new C0344d(this.f65257f, j0Var2, bncContentProvider3, str, this.f65256e, null));
                        } else if (Intrinsics.b(c42, C4.g.f62226b)) {
                            BncContentProvider bncContentProvider4 = BncContentProvider.this;
                            bncContentProvider4.f65217b.a(new e(bncContentProvider4, null));
                        } else if (Intrinsics.b(c42, C4.a.f62204b)) {
                            BncContentProvider bncContentProvider5 = BncContentProvider.this;
                            bncContentProvider5.f65217b.a(new f(bncContentProvider5, str, null));
                        } else if (Intrinsics.b(c42, C4.c.f62208b)) {
                            BncContentProvider bncContentProvider6 = BncContentProvider.this;
                            bncContentProvider6.f65217b.a(new g(bncContentProvider6, str, null));
                        } else if (Intrinsics.b(c42, C4.l.f62285b)) {
                            AnalyticsEvent analyticsEvent = (AnalyticsEvent) C4.l.f62286c.a(this.f65257f);
                            if (analyticsEvent != null) {
                                A5 a52 = BncContentProvider.this.f65225j;
                                this.f65254c = j0Var2;
                                this.f65252a = null;
                                this.f65253b = 2;
                                break;
                            }
                            if (unit == null) {
                                Uri uri2 = this.f65256e;
                                ContentValues contentValues = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri2 + " didn't receive any ContentValues: " + contentValues);
                                return new Integer(0);
                            }
                        } else if (Intrinsics.b(c42, C4.m.f62287b)) {
                            C3095c7 c3095c7 = (C3095c7) C4.m.f62288c.a(this.f65257f);
                            if (c3095c7 != null) {
                                BncContentProvider bncContentProvider7 = BncContentProvider.this;
                                if (c3095c7.d() != P1.a.OPTED_IN) {
                                    A5 a53 = bncContentProvider7.f65225j;
                                    this.f65254c = j0Var2;
                                    this.f65252a = null;
                                    this.f65253b = 4;
                                    break;
                                } else {
                                    A5 a54 = bncContentProvider7.f65225j;
                                    this.f65254c = j0Var2;
                                    this.f65252a = null;
                                    this.f65253b = 3;
                                    break;
                                }
                            }
                            if (unit == null) {
                                Uri uri3 = this.f65256e;
                                ContentValues contentValues2 = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri3 + " didn't receive any ContentValues: " + contentValues2);
                                return new Integer(0);
                            }
                        } else if (Intrinsics.b(c42, C4.e.f62220b)) {
                            C4.e.a aVar = (C4.e.a) C4.e.f62221c.a(this.f65257f);
                            if (aVar == null) {
                                Uri uri4 = this.f65256e;
                                ContentValues contentValues3 = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri4 + " didn't receive any ContentValues: " + contentValues3);
                                return new Integer(0);
                            }
                            A5 a55 = BncContentProvider.this.f65225j;
                            String str2 = aVar.f62222a;
                            long[] jArr = aVar.f62223b;
                            this.f65254c = null;
                            this.f65252a = null;
                            this.f65253b = 5;
                            objA3 = a55.a(str2, jArr, this);
                            break;
                        } else if (Intrinsics.b(c42, C4.n.f62289b)) {
                            ContentValues contentValues4 = this.f65257f;
                            String asString = contentValues4 != null ? contentValues4.getAsString(DatabaseConstants.KEY_FIELD) : null;
                            if (asString == null) {
                                Uri uri5 = this.f65256e;
                                ContentValues contentValues5 = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri5 + " didn't receive any ContentValues: " + contentValues5);
                                return new Integer(0);
                            }
                            A5 a56 = BncContentProvider.this.f65225j;
                            this.f65254c = null;
                            this.f65252a = null;
                            this.f65253b = 6;
                            objD = a56.d(asString, this);
                            break;
                        } else if (Intrinsics.b(c42, C4.k.f62280b)) {
                            C4.k.a aVar2 = (C4.k.a) C4.k.f62281c.a(this.f65257f);
                            if (aVar2 == null) {
                                Uri uri6 = this.f65256e;
                                ContentValues contentValues6 = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri6 + " didn't receive any ContentValues: " + contentValues6);
                                return new Integer(0);
                            }
                            A5 a57 = BncContentProvider.this.f65225j;
                            List<String> list = aVar2.f62282a;
                            long[] jArr2 = aVar2.f62283b;
                            boolean z11 = aVar2.f62284c;
                            this.f65254c = null;
                            this.f65252a = null;
                            this.f65253b = 7;
                            objA2 = a57.a(list, jArr2, z11, this);
                            break;
                        } else if (Intrinsics.b(c42, C4.b.f62205b)) {
                            C4.b.a aVar3 = (C4.b.a) C4.b.f62206c.a(this.f65257f);
                            if (aVar3 == null) {
                                Uri uri7 = this.f65256e;
                                ContentValues contentValues7 = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri7 + " didn't receive any ContentValues: " + contentValues7);
                                return new Integer(0);
                            }
                            A5 a58 = BncContentProvider.this.f65225j;
                            String str3 = aVar3.f62207a;
                            this.f65254c = null;
                            this.f65252a = null;
                            this.f65253b = 8;
                            objA = a58.a(str3, this);
                            break;
                        } else if (Intrinsics.b(c42, C4.f.f62224b)) {
                            ClickInfo clickInfo = (ClickInfo) C4.f.f62225c.a(this.f65257f);
                            if (clickInfo != null) {
                                A5 a59 = BncContentProvider.this.f65225j;
                                this.f65254c = j0Var2;
                                this.f65252a = null;
                                this.f65253b = 9;
                                break;
                            }
                            if (unit == null) {
                                Uri uri8 = this.f65256e;
                                ContentValues contentValues8 = this.f65257f;
                                C3309p1.b(EnumC3131e9.ContentProviderRequests, uri8 + " didn't receive any ContentValues: " + contentValues8);
                                return new Integer(0);
                            }
                        }
                        return new Integer(1);
                    }
                    return coroutineSingletons;
                case 1:
                    c42 = this.f65252a;
                    j0Var = (j0) this.f65254c;
                    ResultKt.b(obj);
                    j0 j0Var22 = j0Var;
                    callingPackage = BncContentProvider.this.getCallingPackage();
                    if (callingPackage == null) {
                    }
                    String str4 = callingPackage;
                    if (!Intrinsics.b(c42, C4.j.f62251b)) {
                    }
                    return new Integer(1);
                case 2:
                    ResultKt.b(obj);
                    unit = Unit.f71706a;
                    if (unit == null) {
                    }
                    return new Integer(1);
                case 3:
                case 4:
                    ResultKt.b(obj);
                    unit = Unit.f71706a;
                    if (unit == null) {
                    }
                    return new Integer(1);
                case 5:
                    ResultKt.b(obj);
                    objA3 = obj;
                    return new Integer(!((w) objA3).d() ? 1 : 0);
                case 6:
                    ResultKt.b(obj);
                    objD = obj;
                    return new Integer(!((w) objD).d() ? 1 : 0);
                case 7:
                    ResultKt.b(obj);
                    objA2 = obj;
                    return new Integer(!((w) objA2).d() ? 1 : 0);
                case 8:
                    ResultKt.b(obj);
                    objA = obj;
                    return new Integer(!((w) objA).d() ? 1 : 0);
                case 9:
                    ResultKt.b(obj);
                    unit = Unit.f71706a;
                    if (unit == null) {
                    }
                    return new Integer(1);
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    public static final ParcelFileDescriptor a(BncContentProvider bncContentProvider, Uri uri, String str, F4 f42, C3366s8 c3366s8) throws UnsupportedEncodingException, FileNotFoundException {
        bncContentProvider.getClass();
        if (!"r".equals(str)) {
            throw new IllegalArgumentException("Can only open in read mode");
        }
        String queryParameter = uri.getQueryParameter(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        if (queryParameter == null) {
            throw new IllegalArgumentException("Must contain a url parameter");
        }
        String strDecode = URLDecoder.decode(queryParameter, StandardCharsets.UTF_8.name());
        if (strDecode == null) {
            throw new IllegalArgumentException("Invalid url parameter");
        }
        String queryParameter2 = uri.getQueryParameter(TTConst.TRACK_TYPE);
        if (queryParameter2 == null) {
            throw new IllegalArgumentException("Invalid BranchResultType");
        }
        ParcelFileDescriptor parcelFileDescriptorOpenPipeHelper = bncContentProvider.openPipeHelper(uri, "image/png", null, null, new A1(f42, c3366s8, new C3074b3(strDecode, H2.valueOf(queryParameter2))));
        Intrinsics.f(parcelFileDescriptorOpenPipeHelper, "context: ContextDelegate…)\n            }\n        }");
        return parcelFileDescriptorOpenPipeHelper;
    }

    @Override // android.content.ContentProvider
    public final int delete(@NotNull Uri uri, @Nullable String str, @Nullable String[] strArr) {
        Intrinsics.g(uri, "uri");
        return 0;
    }

    @NotNull
    public final r getAdsClient() {
        return this.adsClient;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final String getType(@NotNull Uri uri) {
        Intrinsics.g(uri, "uri");
        return null;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final Uri insert(@NotNull Uri uri, @Nullable ContentValues contentValues) {
        Intrinsics.g(uri, "uri");
        return null;
    }

    @Override // android.content.ContentProvider
    public final boolean onCreate() {
        Context context = getContext();
        Intrinsics.d(context);
        F4 f42 = new F4(context);
        this.f65216a = f42;
        this.f65218c = new J1.b(f42.a());
        F4 f43 = this.f65216a;
        if (f43 == null) {
            Intrinsics.m("contextDelegate");
            throw null;
        }
        this.f65219d = new J1.c(f43.a());
        F4 f44 = this.f65216a;
        if (f44 == null) {
            Intrinsics.m("contextDelegate");
            throw null;
        }
        this.f65220e = new J1.a(f44.a());
        m0.t(CorosKt.getBNCScope(), a80.d.f488c, null, new a(null), 2);
        return true;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final ParcelFileDescriptor openFile(@NotNull Uri uri, @NotNull String mode) {
        Intrinsics.g(uri, "uri");
        Intrinsics.g(mode, "mode");
        return (ParcelFileDescriptor) m0.u(EmptyCoroutineContext.f71803a, new b(uri, this, mode, null));
    }

    @Override // android.content.ContentProvider
    @Nullable
    public final Cursor query(@NotNull Uri uri, @Nullable String[] strArr, @Nullable String str, @Nullable String[] strArr2, @Nullable String str2) {
        Intrinsics.g(uri, "uri");
        return query(uri, strArr, str, strArr2, str2, null);
    }

    @Override // android.content.ContentProvider
    public final int update(@NotNull Uri uri, @Nullable ContentValues contentValues, @Nullable String str, @Nullable String[] strArr) {
        Intrinsics.g(uri, "uri");
        return ((Number) m0.u(EmptyCoroutineContext.f71803a, new d(uri, contentValues, null))).intValue();
    }

    @Override // android.content.ContentProvider
    @NotNull
    public final Cursor query(@NotNull Uri uri, @Nullable String[] strArr, @Nullable String str, @Nullable String[] strArr2, @Nullable String str2, @Nullable CancellationSignal cancellationSignal) {
        Intrinsics.g(uri, "uri");
        return (Cursor) m0.u(EmptyCoroutineContext.f71803a, new c(uri, null));
    }

    public static Object a(BncContentProvider bncContentProvider, Continuation continuation) {
        F4 f42 = bncContentProvider.f65216a;
        if (f42 != null) {
            return p2.b(((Boolean) f42.f62441d.getValue()).booleanValue() ? 30000 * 2 : 30000L, new C3478z1(bncContentProvider, null), continuation);
        }
        Intrinsics.m("contextDelegate");
        throw null;
    }

    public final void a(@NotNull C3062a8 client) {
        Intrinsics.g(client, "client");
        A5 a52 = this.f65225j;
        a52.getClass();
        ((s) a52.f61935a).X(client);
    }
}
