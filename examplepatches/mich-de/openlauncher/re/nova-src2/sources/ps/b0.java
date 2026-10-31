package ps;

import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.link.LinkAccountUpdate;
import com.stripe.android.link.LinkActivityResult;
import com.stripe.android.link.NoLinkAccountFoundException;
import com.stripe.android.link.model.LinkAccount;
import h6.f1;
import h6.o1;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ReflectionFactory;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.t1;
import ys.e1;
import ys.s0;

/* loaded from: classes4.dex */
public abstract class b0 {
    public static final void a(final b2.t modifier, final p6.l0 l0Var, final m appBarState, final Function3 function3, final Function1 showBottomSheetContent, final Function1 hideBottomSheetContent, final Function1 handleViewAction, final Function2 navigate, final Function1 dismissWithResult, final Function0 getLinkAccount, final Function0 onBackPressed, final Function1 moveToWeb, final Function0 goBack, final Function0 changeEmail, final es.z initialDestination, p1.o oVar, final int i5) {
        Intrinsics.g(modifier, "modifier");
        Intrinsics.g(appBarState, "appBarState");
        Intrinsics.g(showBottomSheetContent, "showBottomSheetContent");
        Intrinsics.g(hideBottomSheetContent, "hideBottomSheetContent");
        Intrinsics.g(handleViewAction, "handleViewAction");
        Intrinsics.g(navigate, "navigate");
        Intrinsics.g(dismissWithResult, "dismissWithResult");
        Intrinsics.g(getLinkAccount, "getLinkAccount");
        Intrinsics.g(onBackPressed, "onBackPressed");
        Intrinsics.g(moveToWeb, "moveToWeb");
        Intrinsics.g(goBack, "goBack");
        Intrinsics.g(changeEmail, "changeEmail");
        Intrinsics.g(initialDestination, "initialDestination");
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-1876002234);
        int i11 = i5 | (tVar.f(modifier) ? 4 : 2) | (tVar.h(l0Var) ? 32 : 16) | (tVar.h(appBarState) ? 256 : 128) | (tVar.h(function3) ? 2048 : 1024) | (tVar.h(hideBottomSheetContent) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar.h(handleViewAction) ? 1048576 : 524288) | (tVar.h(navigate) ? 8388608 : 4194304) | (tVar.h(dismissWithResult) ? 67108864 : 33554432) | (tVar.h(getLinkAccount) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456);
        int i12 = (tVar.h(onBackPressed) ? (char) 4 : (char) 2) | (tVar.h(moveToWeb) ? ' ' : (char) 16) | (tVar.h(goBack) ? (char) 256 : (char) 128) | (tVar.h(changeEmail) ? (char) 2048 : (char) 1024) | (tVar.h(initialDestination) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE);
        if ((i11 & 306783379) == 306783378 && (i12 & 9363) == 9362 && tVar.E()) {
            tVar.V();
        } else {
            Object objP = tVar.P();
            if (objP == p1.n.f81514a) {
                objP = p1.o0.i(EmptyCoroutineContext.f71803a, tVar);
                tVar.m0(objP);
            }
            tVar = tVar;
            os.g.a(null, x1.f.d(-1041134006, new i(modifier, function3, (t70.j0) objP, hideBottomSheetContent, l0Var, handleViewAction, appBarState, onBackPressed, getLinkAccount, goBack, navigate, dismissWithResult, showBottomSheetContent, moveToWeb, changeEmail, initialDestination), tVar), tVar, 48);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2(l0Var, appBarState, function3, showBottomSheetContent, hideBottomSheetContent, handleViewAction, navigate, dismissWithResult, getLinkAccount, onBackPressed, moveToWeb, goBack, changeEmail, initialDestination, i5) { // from class: ps.y

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ p6.l0 f82982b;

                /* renamed from: c, reason: collision with root package name */
                public final /* synthetic */ m f82983c;

                /* renamed from: d, reason: collision with root package name */
                public final /* synthetic */ Function3 f82984d;

                /* renamed from: e, reason: collision with root package name */
                public final /* synthetic */ Function1 f82985e;

                /* renamed from: f, reason: collision with root package name */
                public final /* synthetic */ Function1 f82986f;

                /* renamed from: g, reason: collision with root package name */
                public final /* synthetic */ Function1 f82987g;

                /* renamed from: h, reason: collision with root package name */
                public final /* synthetic */ Function2 f82988h;

                /* renamed from: i, reason: collision with root package name */
                public final /* synthetic */ Function1 f82989i;

                /* renamed from: j, reason: collision with root package name */
                public final /* synthetic */ Function0 f82990j;

                /* renamed from: k, reason: collision with root package name */
                public final /* synthetic */ Function0 f82991k;

                /* renamed from: l, reason: collision with root package name */
                public final /* synthetic */ Function1 f82992l;

                /* renamed from: m, reason: collision with root package name */
                public final /* synthetic */ Function0 f82993m;
                public final /* synthetic */ Function0 n;
                public final /* synthetic */ es.z o;

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iL = p1.a0.l(24577);
                    b0.a(this.f82981a, this.f82982b, this.f82983c, this.f82984d, this.f82985e, this.f82986f, this.f82987g, this.f82988h, this.f82989i, this.f82990j, this.f82991k, this.f82992l, this.f82993m, this.n, this.o, (p1.o) obj, iL);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void b(LinkAccount linkAccount, Function1 dismissWithResult, p1.o oVar, int i5) {
        ks.f fVar;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(741299778);
        if ((((tVar.h(linkAccount) ? 4 : 2) | i5 | (tVar.h(dismissWithResult) ? 32 : 16)) & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            tVar.b0(2047965416);
            com.stripe.android.link.l lVar = es.g0.d(tVar).f42867p;
            if (lVar == null || (fVar = lVar.f42986a) == null) {
                throw new IllegalStateException("no viewmodel in parent activity");
            }
            Intrinsics.g(dismissWithResult, "dismissWithResult");
            hq.t tVar2 = new hq.t(1);
            ts.g gVar = new ts.g(fVar, linkAccount, dismissWithResult, 0);
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            tVar2.b(reflectionFactory.getOrCreateKotlinClass(ts.i.class), gVar);
            dv.r rVarC = tVar2.c();
            o1 o1VarA = l6.a.a(tVar);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(reflectionFactory.getOrCreateKotlinClass(ts.i.class), o1VarA, null, rVarC, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar);
            tVar.p(false);
            ts.f.i((ts.i) f1VarF, tVar, 0);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new x(linkAccount, dismissWithResult, i5, 1);
        }
    }

    public static final void c(LinkAccount linkAccount, Function1 dismissWithResult, p1.o oVar, int i5) {
        ks.f fVar;
        p1.t tVar = (p1.t) oVar;
        tVar.d0(851008954);
        if ((((tVar.h(linkAccount) ? 4 : 2) | i5 | (tVar.h(dismissWithResult) ? 32 : 16)) & 19) == 18 && tVar.E()) {
            tVar.V();
        } else {
            tVar.b0(2047965416);
            com.stripe.android.link.l lVar = es.g0.d(tVar).f42867p;
            if (lVar == null || (fVar = lVar.f42986a) == null) {
                throw new IllegalStateException("no viewmodel in parent activity");
            }
            Intrinsics.g(dismissWithResult, "dismissWithResult");
            hq.t tVar2 = new hq.t(1);
            ts.g gVar = new ts.g(fVar, linkAccount, dismissWithResult, 1);
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            tVar2.b(reflectionFactory.getOrCreateKotlinClass(us.e.class), gVar);
            dv.r rVarC = tVar2.c();
            o1 o1VarA = l6.a.a(tVar);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(reflectionFactory.getOrCreateKotlinClass(us.e.class), o1VarA, null, rVarC, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar);
            tVar.p(false);
            c.h((us.e) f1VarF, tVar, 0);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new x(linkAccount, dismissWithResult, i5, 0);
        }
    }

    public static final void d(final p6.l0 l0Var, final Function0 function0, final Function0 function02, final Function1 function1, final Function1 function12, final Function1 function13, final Function1 function14, final Function1 function15, final Function0 function03, final es.z zVar, final Function0 function04, p1.o oVar, final int i5) {
        int i11;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1763365574);
        int i12 = i5 | (tVar2.h(l0Var) ? 4 : 2) | (tVar2.h(function0) ? 32 : 16) | (tVar2.h(function02) ? 256 : 128) | (tVar2.h(function1) ? 2048 : 1024) | (tVar2.h(function12) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar2.h(function13) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX) | (tVar2.h(function14) ? 1048576 : 524288) | (tVar2.h(function15) ? 8388608 : 4194304) | (tVar2.h(function03) ? 67108864 : 33554432) | (tVar2.h(zVar) ? SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING : 268435456);
        char c11 = tVar2.h(function04) ? (char) 4 : (char) 2;
        if ((i12 & 306783379) == 306783378 && (c11 & 3) == 2 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            String strA = zVar.a();
            tVar2.b0(729804140);
            boolean zH = ((i12 & 7168) == 2048) | ((29360128 & i12) == 8388608) | ((57344 & i12) == 16384) | ((i12 & 112) == 32) | tVar2.h(zVar) | ((234881024 & i12) == 67108864) | ((i12 & 896) == 256) | ((458752 & i12) == 131072) | tVar2.h(function14) | ((c11 & 14) == 4);
            Object objP = tVar2.P();
            if (zH || objP == p1.n.f81514a) {
                i11 = i12;
                e00.j jVar = new e00.j(function1, function15, function12, function0, zVar, function03, function02, function13, function14, function04);
                tVar2.m0(jVar);
                objP = jVar;
            } else {
                i11 = i12;
            }
            tVar2.p(false);
            tVar = tVar2;
            g0.a(l0Var, strA, null, (Function1) objP, tVar, i11 & 14);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new Function2(function0, function02, function1, function12, function13, function14, function15, function03, zVar, function04, i5) { // from class: ps.w

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ Function0 f82968b;

                /* renamed from: c, reason: collision with root package name */
                public final /* synthetic */ Function0 f82969c;

                /* renamed from: d, reason: collision with root package name */
                public final /* synthetic */ Function1 f82970d;

                /* renamed from: e, reason: collision with root package name */
                public final /* synthetic */ Function1 f82971e;

                /* renamed from: f, reason: collision with root package name */
                public final /* synthetic */ Function1 f82972f;

                /* renamed from: g, reason: collision with root package name */
                public final /* synthetic */ Function1 f82973g;

                /* renamed from: h, reason: collision with root package name */
                public final /* synthetic */ Function1 f82974h;

                /* renamed from: i, reason: collision with root package name */
                public final /* synthetic */ Function0 f82975i;

                /* renamed from: j, reason: collision with root package name */
                public final /* synthetic */ es.z f82976j;

                /* renamed from: k, reason: collision with root package name */
                public final /* synthetic */ Function0 f82977k;

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iL = p1.a0.l(1);
                    b0.d(this.f82967a, this.f82968b, this.f82969c, this.f82970d, this.f82971e, this.f82972f, this.f82973g, this.f82974h, this.f82975i, this.f82976j, this.f82977k, (p1.o) obj, iL);
                    return Unit.f71706a;
                }
            };
        }
    }

    public static final void e(Function1 navigateAndClearStack, Function1 moveToWeb, Function1 dismissWithResult, p1.o oVar, int i5) {
        ks.f fVar;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-392330784);
        if ((((tVar2.h(navigateAndClearStack) ? 4 : 2) | i5 | (tVar2.h(moveToWeb) ? 32 : 16) | (tVar2.h(dismissWithResult) ? 256 : 128)) & 147) == 146 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            tVar2.b0(2047965416);
            com.stripe.android.link.l lVar = es.g0.d(tVar2).f42867p;
            if (lVar == null || (fVar = lVar.f42986a) == null) {
                throw new IllegalStateException("no viewmodel in parent activity");
            }
            int i11 = vs.o.f92987r;
            Intrinsics.g(navigateAndClearStack, "navigateAndClearStack");
            Intrinsics.g(moveToWeb, "moveToWeb");
            Intrinsics.g(dismissWithResult, "dismissWithResult");
            hq.t tVar3 = new hq.t(1);
            b10.r rVar = new b10.r(fVar, navigateAndClearStack, moveToWeb, dismissWithResult, 25);
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            tVar3.b(reflectionFactory.getOrCreateKotlinClass(vs.o.class), rVar);
            dv.r rVarC = tVar3.c();
            o1 o1VarA = l6.a.a(tVar2);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            tVar = tVar2;
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(reflectionFactory.getOrCreateKotlinClass(vs.o.class), o1VarA, null, rVarC, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar);
            tVar.p(false);
            o0.m((vs.o) f1VarF, tVar, 0);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new n00.m(i5, 6, navigateAndClearStack, moveToWeb, dismissWithResult);
        }
    }

    public static final void f(String str, es.v vVar, Function1 dismissWithResult, p1.o oVar, int i5) {
        ks.f fVar;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1489488690);
        if ((((tVar2.f(str) ? 4 : 2) | i5 | (tVar2.f(vVar) ? 32 : 16) | (tVar2.h(dismissWithResult) ? 256 : 128)) & 147) == 146 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            tVar2.b0(2047965416);
            com.stripe.android.link.l lVar = es.g0.d(tVar2).f42867p;
            if (lVar == null || (fVar = lVar.f42986a) == null) {
                throw new IllegalStateException("no viewmodel in parent activity");
            }
            Intrinsics.g(dismissWithResult, "dismissWithResult");
            hq.t tVar3 = new hq.t(1);
            b10.r rVar = new b10.r(fVar, dismissWithResult, str, vVar, 26);
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            tVar3.b(reflectionFactory.getOrCreateKotlinClass(ws.e.class), rVar);
            dv.r rVarC = tVar3.c();
            o1 o1VarA = l6.a.a(tVar2);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            tVar = tVar2;
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(reflectionFactory.getOrCreateKotlinClass(ws.e.class), o1VarA, null, rVarC, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar);
            tVar.p(false);
            v.f((ws.e) f1VarF, tVar, 0);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new n00.m(i5, 5, str, vVar, dismissWithResult);
        }
    }

    public static final void g(LinkAccount linkAccount, Function0 onChangeEmailClicked, Function0 onDismissClicked, Function1 dismissWithResult, p1.o oVar, int i5) {
        ks.f fVar;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-1062783198);
        if ((((tVar2.h(linkAccount) ? 4 : 2) | i5 | (tVar2.h(onChangeEmailClicked) ? 32 : 16) | (tVar2.h(onDismissClicked) ? 256 : 128) | (tVar2.h(dismissWithResult) ? 2048 : 1024)) & 1171) == 1170 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            tVar2.b0(2047965416);
            com.stripe.android.link.l lVar = es.g0.d(tVar2).f42867p;
            if (lVar == null || (fVar = lVar.f42986a) == null) {
                throw new IllegalStateException("no viewmodel in parent activity");
            }
            Intrinsics.g(onChangeEmailClicked, "onChangeEmailClicked");
            Intrinsics.g(onDismissClicked, "onDismissClicked");
            Intrinsics.g(dismissWithResult, "dismissWithResult");
            hq.t tVar3 = new hq.t(1);
            t0.w wVar = new t0.w(fVar, linkAccount, false, onChangeEmailClicked, onDismissClicked, dismissWithResult);
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            tVar3.b(reflectionFactory.getOrCreateKotlinClass(xs.o.class), wVar);
            dv.r rVarC = tVar3.c();
            o1 o1VarA = l6.a.a(tVar2);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            tVar = tVar2;
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(reflectionFactory.getOrCreateKotlinClass(xs.o.class), o1VarA, null, rVarC, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar);
            tVar.p(false);
            l.c((xs.o) f1VarF, tVar, 0);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b20.g(linkAccount, onChangeEmailClicked, onDismissClicked, dismissWithResult, i5, 11);
        }
    }

    public static final void h(LinkAccount linkAccount, Function1 navigateAndClearStack, Function1 dismissWithResult, Function1 function1, Function1 function12, Function0 function0, p1.o oVar, int i5) {
        ks.f fVar;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(1673804274);
        int i11 = i5 | (tVar2.h(linkAccount) ? 4 : 2) | (tVar2.h(navigateAndClearStack) ? 32 : 16) | (tVar2.h(dismissWithResult) ? 256 : 128) | (tVar2.h(function1) ? 2048 : 1024) | (tVar2.h(function12) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE) | (tVar2.h(function0) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX);
        if ((74899 & i11) == 74898 && tVar2.E()) {
            tVar2.V();
            tVar = tVar2;
        } else {
            tVar2.b0(2047965416);
            com.stripe.android.link.l lVar = es.g0.d(tVar2).f42867p;
            if (lVar == null || (fVar = lVar.f42986a) == null) {
                throw new IllegalStateException("no viewmodel in parent activity");
            }
            Intrinsics.g(navigateAndClearStack, "navigateAndClearStack");
            Intrinsics.g(dismissWithResult, "dismissWithResult");
            hq.t tVar3 = new hq.t(1);
            b10.r rVar = new b10.r(fVar, linkAccount, navigateAndClearStack, dismissWithResult, 27);
            ReflectionFactory reflectionFactory = Reflection.f71864a;
            tVar3.b(reflectionFactory.getOrCreateKotlinClass(e1.class), rVar);
            dv.r rVarC = tVar3.c();
            o1 o1VarA = l6.a.a(tVar2);
            if (o1VarA == null) {
                throw new IllegalStateException("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
            }
            f1 f1VarF = com.google.android.gms.internal.consent_sdk.k0.F(reflectionFactory.getOrCreateKotlinClass(e1.class), o1VarA, null, rVarC, o1VarA instanceof h6.n ? ((h6.n) o1VarA).getDefaultViewModelCreationExtras() : k6.a.f71149b, tVar2);
            tVar = tVar2;
            tVar.p(false);
            s0.p((e1) f1VarF, function1, function12, function0, tVar, (i11 >> 6) & 8176);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new bu.v(linkAccount, navigateAndClearStack, dismissWithResult, function1, function12, function0, i5);
        }
    }

    public static final LinkActivityResult.Failed i() {
        return new LinkActivityResult.Failed(new NoLinkAccountFoundException(), LinkAccountUpdate.None.f42863a);
    }
}
