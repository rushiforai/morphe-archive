package com.stripe.android.stripe3ds2.views;

import a80.d;
import a80.e;
import ab.e0;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.FrameLayout;
import androidx.fragment.app.FragmentContainerView;
import androidx.fragment.app.h0;
import androidx.fragment.app.m0;
import androidx.fragment.app.r0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.stripe.android.stripe3ds2.init.ui.StripeButtonCustomization;
import com.stripe.android.stripe3ds2.init.ui.StripeToolbarCustomization;
import com.stripe.android.stripe3ds2.observability.Stripe3ds2ErrorReporterConfig;
import com.stripe.android.stripe3ds2.transaction.ChallengeAction;
import com.stripe.android.stripe3ds2.transaction.ChallengeResult;
import com.stripe.android.stripe3ds2.transactions.ChallengeResponseData;
import com.stripe.android.stripe3ds2.views.ChallengeActivity;
import com.stripe.android.stripe3ds2.views.ChallengeFragment;
import com.stripe.android.stripe3ds2.views.ChallengeViewArgs;
import h6.g1;
import h6.h1;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.ServiceLoader;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;
import qv.a;
import sv.c;
import t70.y0;
import wv.b;
import wv.i;
import wv.p;
import y90.f;
import zv.a0;
import zv.g;
import zv.k;
import zv.r;
import zv.t;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/stripe3ds2/views/ChallengeActivity;", "Lm/m;", "<init>", "()V", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ChallengeActivity extends m {
    public static final d A;
    public final a70.d o;

    /* renamed from: p, reason: collision with root package name */
    public final a70.d f45215p;

    /* renamed from: q, reason: collision with root package name */
    public final a70.d f45216q;

    /* renamed from: r, reason: collision with root package name */
    public final a70.d f45217r;

    /* renamed from: s, reason: collision with root package name */
    public final a70.d f45218s;

    /* renamed from: t, reason: collision with root package name */
    public final a70.d f45219t;

    /* renamed from: u, reason: collision with root package name */
    public final h1 f45220u;

    /* renamed from: v, reason: collision with root package name */
    public final a70.d f45221v;

    /* renamed from: w, reason: collision with root package name */
    public final a70.d f45222w;

    /* renamed from: x, reason: collision with root package name */
    public final a70.d f45223x;

    /* renamed from: y, reason: collision with root package name */
    public t f45224y;

    /* renamed from: z, reason: collision with root package name */
    public ChallengeResponseData f45225z;

    static {
        e eVar = y0.f88884a;
        A = d.f488c;
    }

    public ChallengeActivity() {
        final int i5 = 5;
        this.o = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i11 = i5;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i11) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i11 = 7;
        this.f45215p = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i11;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i12 = 8;
        this.f45216q = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i12;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i13 = 9;
        LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i13;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i14 = 10;
        this.f45217r = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i14;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i15 = 0;
        this.f45218s = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i15;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i16 = 1;
        this.f45219t = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i16;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i17 = 2;
        this.f45220u = new h1(Reflection.f71864a.getOrCreateKotlinClass(k.class), new g(this, 0), new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i17;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        }, new g(this, 1));
        final int i18 = 3;
        this.f45221v = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i18;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i19 = 4;
        this.f45222w = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i19;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        final int i21 = 6;
        this.f45223x = LazyKt.a(new Function0(this) { // from class: zv.d

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98697b;

            {
                this.f98697b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                androidx.fragment.app.h1 supportFragmentManager;
                int i112 = i21;
                m0 m0Var = null;
                ChallengeActivity challengeActivity = this.f98697b;
                switch (i112) {
                    case 0:
                        a80.d dVar = ChallengeActivity.A;
                        return new com.stripe.android.stripe3ds2.transaction.g(challengeActivity.a0().f45245b, (tv.d) challengeActivity.f45215p.getValue(), challengeActivity.a0().f45248e, ChallengeActivity.A);
                    case 1:
                        a80.d workContext = ChallengeActivity.A;
                        Intrinsics.g(workContext, "workContext");
                        String acsUrl = challengeActivity.a0().f45247d.f45078d;
                        tv.d errorReporter = (tv.d) challengeActivity.f45215p.getValue();
                        Intrinsics.g(acsUrl, "acsUrl");
                        Intrinsics.g(errorReporter, "errorReporter");
                        vk.j jVar = new vk.j(acsUrl, errorReporter, workContext);
                        a80.e eVar = y0.f88884a;
                        return new wv.n(jVar, errorReporter, a80.d.f488c);
                    case 2:
                        a80.d dVar2 = ChallengeActivity.A;
                        return new h((wv.b) challengeActivity.f45218s.getValue(), (wv.p) challengeActivity.o.getValue(), (tv.d) challengeActivity.f45215p.getValue());
                    case 3:
                        a80.d dVar3 = ChallengeActivity.A;
                        Bundle extras = challengeActivity.getIntent().getExtras();
                        if (extras == null) {
                            extras = Bundle.EMPTY;
                        }
                        Intrinsics.d(extras);
                        Object objI = vm.d.i(extras, "extra_args", ChallengeViewArgs.class);
                        if (objI != null) {
                            return (ChallengeViewArgs) objI;
                        }
                        throw new IllegalArgumentException("Required value was null.");
                    case 4:
                        a80.d dVar4 = ChallengeActivity.A;
                        return new a0(challengeActivity);
                    case 5:
                        a80.d dVar5 = ChallengeActivity.A;
                        return new wv.h(challengeActivity.a0().f45249f, (wv.i) challengeActivity.f45219t.getValue(), challengeActivity.a0().f45245b);
                    case 6:
                        a80.d dVar6 = ChallengeActivity.A;
                        return new u(challengeActivity, challengeActivity.a0().f45246c);
                    case 7:
                        a80.d dVar7 = ChallengeActivity.A;
                        Context applicationContext = challengeActivity.getApplicationContext();
                        Intrinsics.f(applicationContext, "getApplicationContext(...)");
                        return new tv.c(applicationContext, new Stripe3ds2ErrorReporterConfig(challengeActivity.a0().f45245b.f45156d), null, null, 252);
                    case 8:
                        a80.d dVar8 = ChallengeActivity.A;
                        FragmentContainerView fragmentContainerView = ((qv.a) challengeActivity.f45217r.getValue()).f84329b;
                        h0 h0VarF = androidx.fragment.app.h1.F(fragmentContainerView);
                        if (h0VarF == null) {
                            Object context = fragmentContainerView.getContext();
                            while (true) {
                                if (context instanceof ContextWrapper) {
                                    if (context instanceof m0) {
                                        m0Var = (m0) context;
                                    } else {
                                        context = ((ContextWrapper) context).getBaseContext();
                                    }
                                }
                            }
                            if (m0Var == null) {
                                throw new IllegalStateException("View " + fragmentContainerView + " is not within a subclass of FragmentActivity.");
                            }
                            supportFragmentManager = m0Var.getSupportFragmentManager();
                        } else {
                            if (!h0VarF.isAdded()) {
                                throw new IllegalStateException("The Fragment " + h0VarF + " that owns View " + fragmentContainerView + " has already been destroyed. Nested fragments should always use the child FragmentManager.");
                            }
                            supportFragmentManager = h0VarF.getChildFragmentManager();
                        }
                        return (ChallengeFragment) supportFragmentManager.D(fragmentContainerView.getId());
                    case 9:
                        return ((ChallengeFragment) challengeActivity.f45216q.getValue()).q();
                    default:
                        a80.d dVar9 = ChallengeActivity.A;
                        View viewInflate = challengeActivity.getLayoutInflater().inflate(2131624405, (ViewGroup) null, false);
                        FragmentContainerView fragmentContainerView2 = (FragmentContainerView) e0.x(2131428092, viewInflate);
                        if (fragmentContainerView2 != null) {
                            return new qv.a((FrameLayout) viewInflate, fragmentContainerView2);
                        }
                        throw new NullPointerException("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(2131428092)));
                }
            }
        });
        f fVar = f.f97027b;
        fVar = fVar == null ? new f(4) : fVar;
        if (f.f97027b == null) {
            f.f97027b = fVar;
        }
        ServiceLoader serviceLoader = (ServiceLoader) fVar.f97028a;
        if (serviceLoader.iterator().hasNext() && serviceLoader.iterator().next() != null) {
            throw new ClassCastException();
        }
    }

    public final void Z() {
        m0 m0Var = ((a0) this.f45222w.getValue()).f98685a;
        InputMethodManager inputMethodManager = (InputMethodManager) m0Var.getSystemService(InputMethodManager.class);
        if (inputMethodManager == null || !inputMethodManager.isAcceptingText()) {
            return;
        }
        View currentFocus = m0Var.getCurrentFocus();
        inputMethodManager.hideSoftInputFromWindow(currentFocus != null ? currentFocus.getWindowToken() : null, 0);
    }

    public final ChallengeViewArgs a0() {
        return (ChallengeViewArgs) this.f45221v.getValue();
    }

    public final k b0() {
        return (k) this.f45220u.getValue();
    }

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        ThreeDS2Button threeDS2Button;
        Bundle extras = getIntent().getExtras();
        if (extras == null || vm.d.i(extras, "extra_args", ChallengeViewArgs.class) == null) {
            super.onCreate(bundle);
            finish();
            return;
        }
        getSupportFragmentManager().A = new r(a0().f45246c, (p) this.o.getValue(), (i) this.f45219t.getValue(), (tv.d) this.f45215p.getValue(), (b) this.f45218s.getValue(), a0().f45244a.f45169e, a0().f45250g);
        super.onCreate(bundle);
        g.a0 onBackPressedDispatcher = getOnBackPressedDispatcher();
        zv.e eVar = new zv.e(this);
        onBackPressedDispatcher.getClass();
        onBackPressedDispatcher.b(eVar);
        getWindow().setFlags(UserMetadata.MAX_INTERNAL_KEY_SIZE, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        setContentView(((a) this.f45217r.getValue()).f84328a);
        final int i5 = 0;
        b0().f98717h.e(this, new zv.f(new Function1(this) { // from class: zv.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98695b;

            {
                this.f98695b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                xv.d dVar;
                int i11 = i5;
                String str = null;
                ChallengeActivity challengeActivity = this.f98695b;
                switch (i11) {
                    case 0:
                        ChallengeAction challengeAction = (ChallengeAction) obj;
                        a80.d dVar2 = ChallengeActivity.A;
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.Z();
                            u uVar = (u) challengeActivity.f45223x.getValue();
                            uVar.getClass();
                            t tVar = new t(uVar.f98748a, uVar.f98749b);
                            tVar.show();
                            challengeActivity.f45224y = tVar;
                            k kVarB0 = challengeActivity.b0();
                            Intrinsics.d(challengeAction);
                            kVarB0.e(challengeAction);
                        }
                        return Unit.f71706a;
                    case 1:
                        ChallengeResult challengeResult = (ChallengeResult) obj;
                        a80.d dVar3 = ChallengeActivity.A;
                        Intent intent = new Intent();
                        challengeResult.getClass();
                        challengeActivity.setResult(-1, intent.putExtras(w.b.a(new Pair("extra_result", challengeResult))));
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.finish();
                        }
                        return Unit.f71706a;
                    case 2:
                        ChallengeResponseData challengeResponseData = (ChallengeResponseData) obj;
                        a80.d dVar4 = ChallengeActivity.A;
                        t tVar2 = challengeActivity.f45224y;
                        if (tVar2 != null && tVar2.isShowing()) {
                            tVar2.dismiss();
                        }
                        challengeActivity.f45224y = null;
                        if (challengeResponseData != null) {
                            androidx.fragment.app.h1 supportFragmentManager = challengeActivity.getSupportFragmentManager();
                            Intrinsics.f(supportFragmentManager, "getSupportFragmentManager(...)");
                            androidx.fragment.app.a aVar = new androidx.fragment.app.a(supportFragmentManager);
                            aVar.f14662d = 2130772043;
                            aVar.f14663e = 2130772044;
                            aVar.f14664f = 2130772043;
                            aVar.f14665g = 2130772044;
                            int id2 = ((qv.a) challengeActivity.f45217r.getValue()).f84329b.getId();
                            Bundle bundleA = w.b.a(new Pair("arg_cres", challengeResponseData));
                            r0 r0Var = aVar.f14659a;
                            if (r0Var == null) {
                                throw new IllegalStateException("Creating a Fragment requires that this FragmentTransaction was built with FragmentManager.beginTransaction()");
                            }
                            ClassLoader classLoader = aVar.f14660b;
                            if (classLoader == null) {
                                throw new IllegalStateException("The FragmentManager must be attached to itshost to create a Fragment");
                            }
                            h0 h0VarInstantiate = r0Var.instantiate(classLoader, ChallengeFragment.class.getName());
                            h0VarInstantiate.setArguments(bundleA);
                            aVar.f(id2, h0VarInstantiate, null);
                            aVar.k();
                            challengeActivity.f45225z = challengeResponseData;
                        }
                        return Unit.f71706a;
                    default:
                        a80.d dVar5 = ChallengeActivity.A;
                        if (Intrinsics.b((Boolean) obj, Boolean.TRUE)) {
                            k kVarB02 = challengeActivity.b0();
                            ChallengeResponseData challengeResponseData2 = challengeActivity.f45225z;
                            if (challengeResponseData2 != null && (dVar = challengeResponseData2.f45169e) != null) {
                                str = dVar.f96436a;
                            }
                            if (str == null) {
                                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            kVarB02.f98718i.k(new ChallengeResult.Timeout(str, challengeActivity.a0().f45244a.f45169e, challengeActivity.a0().f45250g));
                        }
                        return Unit.f71706a;
                }
            }
        }, 0));
        final int i11 = 1;
        b0().f98719j.e(this, new zv.f(new Function1(this) { // from class: zv.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98695b;

            {
                this.f98695b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                xv.d dVar;
                int i112 = i11;
                String str = null;
                ChallengeActivity challengeActivity = this.f98695b;
                switch (i112) {
                    case 0:
                        ChallengeAction challengeAction = (ChallengeAction) obj;
                        a80.d dVar2 = ChallengeActivity.A;
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.Z();
                            u uVar = (u) challengeActivity.f45223x.getValue();
                            uVar.getClass();
                            t tVar = new t(uVar.f98748a, uVar.f98749b);
                            tVar.show();
                            challengeActivity.f45224y = tVar;
                            k kVarB0 = challengeActivity.b0();
                            Intrinsics.d(challengeAction);
                            kVarB0.e(challengeAction);
                        }
                        return Unit.f71706a;
                    case 1:
                        ChallengeResult challengeResult = (ChallengeResult) obj;
                        a80.d dVar3 = ChallengeActivity.A;
                        Intent intent = new Intent();
                        challengeResult.getClass();
                        challengeActivity.setResult(-1, intent.putExtras(w.b.a(new Pair("extra_result", challengeResult))));
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.finish();
                        }
                        return Unit.f71706a;
                    case 2:
                        ChallengeResponseData challengeResponseData = (ChallengeResponseData) obj;
                        a80.d dVar4 = ChallengeActivity.A;
                        t tVar2 = challengeActivity.f45224y;
                        if (tVar2 != null && tVar2.isShowing()) {
                            tVar2.dismiss();
                        }
                        challengeActivity.f45224y = null;
                        if (challengeResponseData != null) {
                            androidx.fragment.app.h1 supportFragmentManager = challengeActivity.getSupportFragmentManager();
                            Intrinsics.f(supportFragmentManager, "getSupportFragmentManager(...)");
                            androidx.fragment.app.a aVar = new androidx.fragment.app.a(supportFragmentManager);
                            aVar.f14662d = 2130772043;
                            aVar.f14663e = 2130772044;
                            aVar.f14664f = 2130772043;
                            aVar.f14665g = 2130772044;
                            int id2 = ((qv.a) challengeActivity.f45217r.getValue()).f84329b.getId();
                            Bundle bundleA = w.b.a(new Pair("arg_cres", challengeResponseData));
                            r0 r0Var = aVar.f14659a;
                            if (r0Var == null) {
                                throw new IllegalStateException("Creating a Fragment requires that this FragmentTransaction was built with FragmentManager.beginTransaction()");
                            }
                            ClassLoader classLoader = aVar.f14660b;
                            if (classLoader == null) {
                                throw new IllegalStateException("The FragmentManager must be attached to itshost to create a Fragment");
                            }
                            h0 h0VarInstantiate = r0Var.instantiate(classLoader, ChallengeFragment.class.getName());
                            h0VarInstantiate.setArguments(bundleA);
                            aVar.f(id2, h0VarInstantiate, null);
                            aVar.k();
                            challengeActivity.f45225z = challengeResponseData;
                        }
                        return Unit.f71706a;
                    default:
                        a80.d dVar5 = ChallengeActivity.A;
                        if (Intrinsics.b((Boolean) obj, Boolean.TRUE)) {
                            k kVarB02 = challengeActivity.b0();
                            ChallengeResponseData challengeResponseData2 = challengeActivity.f45225z;
                            if (challengeResponseData2 != null && (dVar = challengeResponseData2.f45169e) != null) {
                                str = dVar.f96436a;
                            }
                            if (str == null) {
                                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            kVarB02.f98718i.k(new ChallengeResult.Timeout(str, challengeActivity.a0().f45244a.f45169e, challengeActivity.a0().f45250g));
                        }
                        return Unit.f71706a;
                }
            }
        }, 0));
        StripeToolbarCustomization stripeToolbarCustomization = a0().f45246c.f45048a;
        StripeButtonCustomization stripeButtonCustomizationA = a0().f45246c.a(c.f87741d);
        m.b supportActionBar = getSupportActionBar();
        Continuation continuation = null;
        if (supportActionBar == null) {
            threeDS2Button = null;
        } else {
            threeDS2Button = new ThreeDS2Button(new androidx.appcompat.view.d(this, 2132083274), null, 6);
            threeDS2Button.d(ColorStateList.valueOf(0));
            threeDS2Button.i(stripeButtonCustomizationA);
            m.a aVar = new m.a(-2, -2);
            aVar.f75187a = 8388629;
            supportActionBar.o(threeDS2Button, aVar);
            supportActionBar.s();
            if (stripeToolbarCustomization != null) {
                String string = stripeToolbarCustomization.f45046f;
                String str = stripeToolbarCustomization.f45044d;
                String str2 = stripeToolbarCustomization.f45047g;
                if (str2 == null || r70.k.U0(str2)) {
                    threeDS2Button.setText(2132019616);
                } else {
                    threeDS2Button.setText(stripeToolbarCustomization.f45047g);
                }
                if (str != null) {
                    supportActionBar.m(new ColorDrawable(Color.parseColor(str)));
                    String str3 = stripeToolbarCustomization.f45045e;
                    if (str3 != null) {
                        int color = Color.parseColor(str3);
                        if (Build.VERSION.SDK_INT <= 34) {
                            getWindow().setStatusBarColor(color);
                        }
                    } else {
                        int iArgb = Color.argb(Color.alpha(Color.parseColor(str)), Math.min(Math.max((int) (Color.red(r6) * 0.8f), 0), 255), Math.min(Math.max((int) (Color.green(r6) * 0.8f), 0), 255), Math.min(Math.max((int) (Color.blue(r6) * 0.8f), 0), 255));
                        if (Build.VERSION.SDK_INT <= 34) {
                            getWindow().setStatusBarColor(iArgb);
                        }
                    }
                }
                if (string == null || r70.k.U0(string)) {
                    string = getString(2132019617);
                    Intrinsics.d(string);
                }
                supportActionBar.x(p3.i.n(this, string, stripeToolbarCustomization));
            } else {
                supportActionBar.w(2132019617);
                threeDS2Button.setText(2132019616);
            }
        }
        if (threeDS2Button != null) {
            threeDS2Button.setOnClickListener(new com.instabridge.ai.chat.ui.v2.e(28, threeDS2Button, this));
        }
        final int i12 = 2;
        b0().o.e(this, new zv.f(new Function1(this) { // from class: zv.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98695b;

            {
                this.f98695b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                xv.d dVar;
                int i112 = i12;
                String str4 = null;
                ChallengeActivity challengeActivity = this.f98695b;
                switch (i112) {
                    case 0:
                        ChallengeAction challengeAction = (ChallengeAction) obj;
                        a80.d dVar2 = ChallengeActivity.A;
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.Z();
                            u uVar = (u) challengeActivity.f45223x.getValue();
                            uVar.getClass();
                            t tVar = new t(uVar.f98748a, uVar.f98749b);
                            tVar.show();
                            challengeActivity.f45224y = tVar;
                            k kVarB0 = challengeActivity.b0();
                            Intrinsics.d(challengeAction);
                            kVarB0.e(challengeAction);
                        }
                        return Unit.f71706a;
                    case 1:
                        ChallengeResult challengeResult = (ChallengeResult) obj;
                        a80.d dVar3 = ChallengeActivity.A;
                        Intent intent = new Intent();
                        challengeResult.getClass();
                        challengeActivity.setResult(-1, intent.putExtras(w.b.a(new Pair("extra_result", challengeResult))));
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.finish();
                        }
                        return Unit.f71706a;
                    case 2:
                        ChallengeResponseData challengeResponseData = (ChallengeResponseData) obj;
                        a80.d dVar4 = ChallengeActivity.A;
                        t tVar2 = challengeActivity.f45224y;
                        if (tVar2 != null && tVar2.isShowing()) {
                            tVar2.dismiss();
                        }
                        challengeActivity.f45224y = null;
                        if (challengeResponseData != null) {
                            androidx.fragment.app.h1 supportFragmentManager = challengeActivity.getSupportFragmentManager();
                            Intrinsics.f(supportFragmentManager, "getSupportFragmentManager(...)");
                            androidx.fragment.app.a aVar2 = new androidx.fragment.app.a(supportFragmentManager);
                            aVar2.f14662d = 2130772043;
                            aVar2.f14663e = 2130772044;
                            aVar2.f14664f = 2130772043;
                            aVar2.f14665g = 2130772044;
                            int id2 = ((qv.a) challengeActivity.f45217r.getValue()).f84329b.getId();
                            Bundle bundleA = w.b.a(new Pair("arg_cres", challengeResponseData));
                            r0 r0Var = aVar2.f14659a;
                            if (r0Var == null) {
                                throw new IllegalStateException("Creating a Fragment requires that this FragmentTransaction was built with FragmentManager.beginTransaction()");
                            }
                            ClassLoader classLoader = aVar2.f14660b;
                            if (classLoader == null) {
                                throw new IllegalStateException("The FragmentManager must be attached to itshost to create a Fragment");
                            }
                            h0 h0VarInstantiate = r0Var.instantiate(classLoader, ChallengeFragment.class.getName());
                            h0VarInstantiate.setArguments(bundleA);
                            aVar2.f(id2, h0VarInstantiate, null);
                            aVar2.k();
                            challengeActivity.f45225z = challengeResponseData;
                        }
                        return Unit.f71706a;
                    default:
                        a80.d dVar5 = ChallengeActivity.A;
                        if (Intrinsics.b((Boolean) obj, Boolean.TRUE)) {
                            k kVarB02 = challengeActivity.b0();
                            ChallengeResponseData challengeResponseData2 = challengeActivity.f45225z;
                            if (challengeResponseData2 != null && (dVar = challengeResponseData2.f45169e) != null) {
                                str4 = dVar.f96436a;
                            }
                            if (str4 == null) {
                                str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            kVarB02.f98718i.k(new ChallengeResult.Timeout(str4, challengeActivity.a0().f45244a.f45169e, challengeActivity.a0().f45250g));
                        }
                        return Unit.f71706a;
                }
            }
        }, 0));
        if (bundle == null) {
            k kVarB0 = b0();
            ChallengeResponseData cres = a0().f45244a;
            Intrinsics.g(cres, "cres");
            kVarB0.n.j(cres);
        }
        final int i13 = 3;
        g1.g(new tx.h0(b0(), continuation, 19)).e(this, new zv.f(new Function1(this) { // from class: zv.c

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChallengeActivity f98695b;

            {
                this.f98695b = this;
            }

            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                xv.d dVar;
                int i112 = i13;
                String str4 = null;
                ChallengeActivity challengeActivity = this.f98695b;
                switch (i112) {
                    case 0:
                        ChallengeAction challengeAction = (ChallengeAction) obj;
                        a80.d dVar2 = ChallengeActivity.A;
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.Z();
                            u uVar = (u) challengeActivity.f45223x.getValue();
                            uVar.getClass();
                            t tVar = new t(uVar.f98748a, uVar.f98749b);
                            tVar.show();
                            challengeActivity.f45224y = tVar;
                            k kVarB02 = challengeActivity.b0();
                            Intrinsics.d(challengeAction);
                            kVarB02.e(challengeAction);
                        }
                        return Unit.f71706a;
                    case 1:
                        ChallengeResult challengeResult = (ChallengeResult) obj;
                        a80.d dVar3 = ChallengeActivity.A;
                        Intent intent = new Intent();
                        challengeResult.getClass();
                        challengeActivity.setResult(-1, intent.putExtras(w.b.a(new Pair("extra_result", challengeResult))));
                        if (!challengeActivity.isFinishing()) {
                            challengeActivity.finish();
                        }
                        return Unit.f71706a;
                    case 2:
                        ChallengeResponseData challengeResponseData = (ChallengeResponseData) obj;
                        a80.d dVar4 = ChallengeActivity.A;
                        t tVar2 = challengeActivity.f45224y;
                        if (tVar2 != null && tVar2.isShowing()) {
                            tVar2.dismiss();
                        }
                        challengeActivity.f45224y = null;
                        if (challengeResponseData != null) {
                            androidx.fragment.app.h1 supportFragmentManager = challengeActivity.getSupportFragmentManager();
                            Intrinsics.f(supportFragmentManager, "getSupportFragmentManager(...)");
                            androidx.fragment.app.a aVar2 = new androidx.fragment.app.a(supportFragmentManager);
                            aVar2.f14662d = 2130772043;
                            aVar2.f14663e = 2130772044;
                            aVar2.f14664f = 2130772043;
                            aVar2.f14665g = 2130772044;
                            int id2 = ((qv.a) challengeActivity.f45217r.getValue()).f84329b.getId();
                            Bundle bundleA = w.b.a(new Pair("arg_cres", challengeResponseData));
                            r0 r0Var = aVar2.f14659a;
                            if (r0Var == null) {
                                throw new IllegalStateException("Creating a Fragment requires that this FragmentTransaction was built with FragmentManager.beginTransaction()");
                            }
                            ClassLoader classLoader = aVar2.f14660b;
                            if (classLoader == null) {
                                throw new IllegalStateException("The FragmentManager must be attached to itshost to create a Fragment");
                            }
                            h0 h0VarInstantiate = r0Var.instantiate(classLoader, ChallengeFragment.class.getName());
                            h0VarInstantiate.setArguments(bundleA);
                            aVar2.f(id2, h0VarInstantiate, null);
                            aVar2.k();
                            challengeActivity.f45225z = challengeResponseData;
                        }
                        return Unit.f71706a;
                    default:
                        a80.d dVar5 = ChallengeActivity.A;
                        if (Intrinsics.b((Boolean) obj, Boolean.TRUE)) {
                            k kVarB022 = challengeActivity.b0();
                            ChallengeResponseData challengeResponseData2 = challengeActivity.f45225z;
                            if (challengeResponseData2 != null && (dVar = challengeResponseData2.f45169e) != null) {
                                str4 = dVar.f96436a;
                            }
                            if (str4 == null) {
                                str4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                            }
                            kVarB022.f98718i.k(new ChallengeResult.Timeout(str4, challengeActivity.a0().f45244a.f45169e, challengeActivity.a0().f45250g));
                        }
                        return Unit.f71706a;
                }
            }
        }, 0));
        this.f45225z = a0().f45244a;
    }

    @Override // m.m, androidx.fragment.app.m0, android.app.Activity
    public final void onDestroy() {
        super.onDestroy();
        t tVar = this.f45224y;
        if (tVar != null && tVar.isShowing()) {
            tVar.dismiss();
        }
        this.f45224y = null;
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public final void onLowMemory() {
        super.onLowMemory();
        ((yv.b) b0().f98712c).getClass();
        yv.b.f97657b.evictAll();
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onPause() {
        xv.d dVar;
        super.onPause();
        b0().f98723p = true;
        w6.b bVar = xv.d.f96428c;
        ChallengeResponseData challengeResponseData = this.f45225z;
        String str = (challengeResponseData == null || (dVar = challengeResponseData.f45169e) == null) ? null : dVar.f96436a;
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        bVar.getClass();
        b0().f98724q = w6.b.b(str) == xv.d.f96432g;
        Z();
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        super.onResume();
        if (!b0().f98724q) {
            if (b0().f98723p) {
                b0().f98714e.j(Unit.f71706a);
            }
        } else {
            List listF = getSupportFragmentManager().f14571c.f();
            Intrinsics.f(listF, "getFragments(...)");
            Object objW0 = b70.g.W0(listF);
            Intrinsics.e(objW0, "null cannot be cast to non-null type com.stripe.android.stripe3ds2.views.ChallengeFragment");
            b0().e(new ChallengeAction.Oob(Boolean.valueOf(((ChallengeFragment) objW0).o().f45257g.getCheckedRadioButtonId() == 2131427828)));
        }
    }

    @Override // g.o, android.app.Activity, android.content.ComponentCallbacks2
    public final void onTrimMemory(int i5) {
        super.onTrimMemory(i5);
        ((yv.b) b0().f98712c).getClass();
        yv.b.f97657b.evictAll();
    }
}
