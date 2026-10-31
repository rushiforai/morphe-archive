package g;

import android.annotation.SuppressLint;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import androidx.fragment.app.z0;
import androidx.lifecycle.ReportFragment;
import c3.d2;
import h6.i1;
import h6.j1;
import h6.n1;
import h6.o1;
import h6.y0;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import n4.o0;
import n4.p0;
import n4.r0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public abstract class o extends n4.i implements o1, h6.n, a7.h, b0, j.j, j.b, o4.e, o4.f, o0, p0, a5.p {

    @NotNull
    private static final String ACTIVITY_RESULT_TAG = "android:support:activity-result";

    @NotNull
    private static final i Companion = new i();

    @Nullable
    private n1 _viewModelStore;

    @NotNull
    private final j.i activityResultRegistry;
    private int contentLayoutId;

    @NotNull
    private final i.a contextAwareHelper;

    @NotNull
    private final Lazy defaultViewModelProviderFactory$delegate;
    private boolean dispatchingOnMultiWindowModeChanged;
    private boolean dispatchingOnPictureInPictureModeChanged;

    @NotNull
    private final Lazy fullyDrawnReporter$delegate;

    @NotNull
    private final a5.t menuHostHelper;

    @NotNull
    private final AtomicInteger nextLocalRequestCode;

    @NotNull
    private final Lazy onBackPressedDispatcher$delegate;

    @NotNull
    private final CopyOnWriteArrayList<z4.a> onConfigurationChangedListeners;

    @NotNull
    private final CopyOnWriteArrayList<z4.a> onMultiWindowModeChangedListeners;

    @NotNull
    private final CopyOnWriteArrayList<z4.a> onNewIntentListeners;

    @NotNull
    private final CopyOnWriteArrayList<z4.a> onPictureInPictureModeChangedListeners;

    @NotNull
    private final CopyOnWriteArrayList<z4.a> onTrimMemoryListeners;

    @NotNull
    private final CopyOnWriteArrayList<Runnable> onUserLeaveHintListeners;

    @NotNull
    private final k reportFullyDrawnExecutor;

    @NotNull
    private final a7.g savedStateRegistryController;

    public o() {
        this.contextAwareHelper = new i.a();
        int i5 = 0;
        this.menuHostHelper = new a5.t(new d(this, i5));
        c7.a aVar = new c7.a(this, new a7.f(this, i5));
        this.savedStateRegistryController = new a7.g(aVar);
        this.reportFullyDrawnExecutor = new l(this);
        this.fullyDrawnReporter$delegate = LazyKt.a(new n(this, 1));
        this.nextLocalRequestCode = new AtomicInteger();
        this.activityResultRegistry = new m(this);
        this.onConfigurationChangedListeners = new CopyOnWriteArrayList<>();
        this.onTrimMemoryListeners = new CopyOnWriteArrayList<>();
        this.onNewIntentListeners = new CopyOnWriteArrayList<>();
        this.onMultiWindowModeChangedListeners = new CopyOnWriteArrayList<>();
        this.onPictureInPictureModeChangedListeners = new CopyOnWriteArrayList<>();
        this.onUserLeaveHintListeners = new CopyOnWriteArrayList<>();
        if (getLifecycle() == null) {
            throw new IllegalStateException("getLifecycle() returned null in ComponentActivity's constructor. Please make sure you are lazily constructing your Lifecycle in the first call to getLifecycle() rather than relying on field initialization.");
        }
        final int i11 = 0;
        getLifecycle().a(new h6.y(this) { // from class: g.e

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ o f56412b;

            {
                this.f56412b = this;
            }

            @Override // h6.y
            public final void d(h6.a0 a0Var, h6.s sVar) {
                Window window;
                View viewPeekDecorView;
                switch (i11) {
                    case 0:
                        if (sVar == h6.s.ON_STOP && (window = this.f56412b.getWindow()) != null && (viewPeekDecorView = window.peekDecorView()) != null) {
                            viewPeekDecorView.cancelPendingInputEvents();
                            break;
                        }
                        break;
                    default:
                        o.U(this.f56412b, a0Var, sVar);
                        break;
                }
            }
        });
        final int i12 = 1;
        getLifecycle().a(new h6.y(this) { // from class: g.e

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ o f56412b;

            {
                this.f56412b = this;
            }

            @Override // h6.y
            public final void d(h6.a0 a0Var, h6.s sVar) {
                Window window;
                View viewPeekDecorView;
                switch (i12) {
                    case 0:
                        if (sVar == h6.s.ON_STOP && (window = this.f56412b.getWindow()) != null && (viewPeekDecorView = window.peekDecorView()) != null) {
                            viewPeekDecorView.cancelPendingInputEvents();
                            break;
                        }
                        break;
                    default:
                        o.U(this.f56412b, a0Var, sVar);
                        break;
                }
            }
        });
        getLifecycle().a(new a7.b(this, i12));
        aVar.d();
        y0.b(this);
        getSavedStateRegistry().b(ACTIVITY_RESULT_TAG, new d2(this, 1));
        addOnContextAvailableListener(new i.b() { // from class: g.f
            @Override // i.b
            public final void a(o oVar) {
                o.T(this.f56413a, oVar);
            }
        });
        this.defaultViewModelProviderFactory$delegate = LazyKt.a(new n(this, 0));
        this.onBackPressedDispatcher$delegate = LazyKt.a(new n(this, 2));
    }

    public static void T(o oVar, Context it) {
        Intrinsics.g(it, "it");
        Bundle bundleA = oVar.getSavedStateRegistry().a(ACTIVITY_RESULT_TAG);
        if (bundleA != null) {
            j.i iVar = oVar.activityResultRegistry;
            LinkedHashMap linkedHashMap = iVar.f68432b;
            LinkedHashMap linkedHashMap2 = iVar.f68431a;
            Bundle bundle = iVar.f68437g;
            ArrayList<Integer> integerArrayList = bundleA.getIntegerArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_RCS");
            ArrayList<String> stringArrayList = bundleA.getStringArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS");
            if (stringArrayList == null || integerArrayList == null) {
                return;
            }
            ArrayList<String> stringArrayList2 = bundleA.getStringArrayList("KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS");
            if (stringArrayList2 != null) {
                iVar.f68434d.addAll(stringArrayList2);
            }
            Bundle bundle2 = bundleA.getBundle("KEY_COMPONENT_ACTIVITY_PENDING_RESULT");
            if (bundle2 != null) {
                bundle.putAll(bundle2);
            }
            int size = stringArrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                String str = stringArrayList.get(i5);
                if (linkedHashMap.containsKey(str)) {
                    Integer num = (Integer) linkedHashMap.remove(str);
                    if (!bundle.containsKey(str)) {
                        TypeIntrinsics.c(linkedHashMap2).remove(num);
                    }
                }
                Integer num2 = integerArrayList.get(i5);
                Intrinsics.f(num2, "rcs[i]");
                int iIntValue = num2.intValue();
                String str2 = stringArrayList.get(i5);
                Intrinsics.f(str2, "keys[i]");
                String str3 = str2;
                linkedHashMap2.put(Integer.valueOf(iIntValue), str3);
                iVar.f68432b.put(str3, Integer.valueOf(iIntValue));
            }
        }
    }

    public static void U(o oVar, h6.a0 a0Var, h6.s sVar) {
        if (sVar == h6.s.ON_DESTROY) {
            oVar.contextAwareHelper.f61082b = null;
            if (!oVar.isChangingConfigurations()) {
                oVar.getViewModelStore().a();
            }
            l lVar = (l) oVar.reportFullyDrawnExecutor;
            o oVar2 = lVar.f56422d;
            oVar2.getWindow().getDecorView().removeCallbacks(lVar);
            oVar2.getWindow().getDecorView().getViewTreeObserver().removeOnDrawListener(lVar);
        }
    }

    public static Bundle V(o oVar) {
        Bundle bundle = new Bundle();
        j.i iVar = oVar.activityResultRegistry;
        iVar.getClass();
        LinkedHashMap linkedHashMap = iVar.f68432b;
        bundle.putIntegerArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_RCS", new ArrayList<>(linkedHashMap.values()));
        bundle.putStringArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS", new ArrayList<>(linkedHashMap.keySet()));
        bundle.putStringArrayList("KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS", new ArrayList<>(iVar.f68434d));
        bundle.putBundle("KEY_COMPONENT_ACTIVITY_PENDING_RESULT", new Bundle(iVar.f68437g));
        return bundle;
    }

    public static final void access$ensureViewModelStore(o oVar) {
        if (oVar._viewModelStore == null) {
            j jVar = (j) oVar.getLastNonConfigurationInstance();
            if (jVar != null) {
                oVar._viewModelStore = jVar.f56418b;
            }
            if (oVar._viewModelStore == null) {
                oVar._viewModelStore = new n1();
            }
        }
    }

    public static /* synthetic */ void getOnBackPressedDispatcher$annotations() {
    }

    @Override // android.app.Activity
    public void addContentView(@Nullable View view, @Nullable ViewGroup.LayoutParams layoutParams) {
        initializeViewTreeOwners();
        k kVar = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        Intrinsics.f(decorView, "window.decorView");
        ((l) kVar).a(decorView);
        super.addContentView(view, layoutParams);
    }

    @Override // a5.p
    public void addMenuProvider(@NotNull a5.u provider) {
        Intrinsics.g(provider, "provider");
        a5.t tVar = this.menuHostHelper;
        tVar.f367b.add(provider);
        tVar.f366a.run();
    }

    @Override // o4.e
    public final void addOnConfigurationChangedListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onConfigurationChangedListeners.add(listener);
    }

    public final void addOnContextAvailableListener(@NotNull i.b listener) {
        Intrinsics.g(listener, "listener");
        i.a aVar = this.contextAwareHelper;
        aVar.getClass();
        o oVar = aVar.f61082b;
        if (oVar != null) {
            listener.a(oVar);
        }
        aVar.f61081a.add(listener);
    }

    @Override // n4.o0
    public final void addOnMultiWindowModeChangedListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onMultiWindowModeChangedListeners.add(listener);
    }

    public final void addOnNewIntentListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onNewIntentListeners.add(listener);
    }

    @Override // n4.p0
    public final void addOnPictureInPictureModeChangedListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onPictureInPictureModeChangedListeners.add(listener);
    }

    @Override // o4.f
    public final void addOnTrimMemoryListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onTrimMemoryListeners.add(listener);
    }

    public final void addOnUserLeaveHintListener(@NotNull Runnable listener) {
        Intrinsics.g(listener, "listener");
        this.onUserLeaveHintListeners.add(listener);
    }

    @Override // j.j
    @NotNull
    public final j.i getActivityResultRegistry() {
        return this.activityResultRegistry;
    }

    @Override // h6.n
    @NotNull
    public k6.c getDefaultViewModelCreationExtras() {
        k6.d dVar = new k6.d(0);
        Application application = getApplication();
        LinkedHashMap linkedHashMap = dVar.f71150a;
        if (application != null) {
            Application application2 = getApplication();
            Intrinsics.f(application2, "application");
            linkedHashMap.put(i1.f59383d, application2);
        }
        linkedHashMap.put(y0.f59469a, this);
        linkedHashMap.put(y0.f59470b, this);
        Intent intent = getIntent();
        Bundle extras = intent != null ? intent.getExtras() : null;
        if (extras != null) {
            linkedHashMap.put(y0.f59471c, extras);
        }
        return dVar;
    }

    @Override // h6.n
    @NotNull
    public j1 getDefaultViewModelProviderFactory() {
        return (j1) this.defaultViewModelProviderFactory$delegate.getValue();
    }

    @NotNull
    public r getFullyDrawnReporter() {
        return (r) this.fullyDrawnReporter$delegate.getValue();
    }

    @Deprecated
    @Nullable
    public Object getLastCustomNonConfigurationInstance() {
        j jVar = (j) getLastNonConfigurationInstance();
        if (jVar != null) {
            return jVar.f56417a;
        }
        return null;
    }

    @Override // n4.i, h6.a0
    @NotNull
    public h6.u getLifecycle() {
        return super.getLifecycle();
    }

    @Override // g.b0
    @NotNull
    public final a0 getOnBackPressedDispatcher() {
        return (a0) this.onBackPressedDispatcher$delegate.getValue();
    }

    @Override // a7.h
    @NotNull
    public final a7.e getSavedStateRegistry() {
        return this.savedStateRegistryController.f442b;
    }

    @Override // h6.o1
    @NotNull
    public n1 getViewModelStore() {
        if (getApplication() == null) {
            throw new IllegalStateException("Your activity is not yet attached to the Application instance. You can't request ViewModel before onCreate call.");
        }
        if (this._viewModelStore == null) {
            j jVar = (j) getLastNonConfigurationInstance();
            if (jVar != null) {
                this._viewModelStore = jVar.f56418b;
            }
            if (this._viewModelStore == null) {
                this._viewModelStore = new n1();
            }
        }
        n1 n1Var = this._viewModelStore;
        Intrinsics.d(n1Var);
        return n1Var;
    }

    public void initializeViewTreeOwners() {
        View decorView = getWindow().getDecorView();
        Intrinsics.f(decorView, "window.decorView");
        y0.f(decorView, this);
        View decorView2 = getWindow().getDecorView();
        Intrinsics.f(decorView2, "window.decorView");
        y0.g(decorView2, this);
        View decorView3 = getWindow().getDecorView();
        Intrinsics.f(decorView3, "window.decorView");
        u90.b.a0(decorView3, this);
        View decorView4 = getWindow().getDecorView();
        Intrinsics.f(decorView4, "window.decorView");
        fg.a.O(decorView4, this);
        View decorView5 = getWindow().getDecorView();
        Intrinsics.f(decorView5, "window.decorView");
        decorView5.setTag(2131428695, this);
    }

    public void invalidateMenu() {
        invalidateOptionsMenu();
    }

    @Override // android.app.Activity
    @Deprecated
    public void onActivityResult(int i5, int i11, @Nullable Intent intent) {
        if (this.activityResultRegistry.a(i5, i11, intent)) {
            return;
        }
        super.onActivityResult(i5, i11, intent);
    }

    @Override // android.app.Activity
    @Deprecated
    public void onBackPressed() {
        getOnBackPressedDispatcher().d();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(@NotNull Configuration newConfig) {
        Intrinsics.g(newConfig, "newConfig");
        super.onConfigurationChanged(newConfig);
        Iterator<z4.a> it = this.onConfigurationChangedListeners.iterator();
        while (it.hasNext()) {
            it.next().accept(newConfig);
        }
    }

    @Override // n4.i, android.app.Activity
    public void onCreate(Bundle bundle) {
        this.savedStateRegistryController.a(bundle);
        i.a aVar = this.contextAwareHelper;
        aVar.getClass();
        aVar.f61082b = this;
        Iterator it = aVar.f61081a.iterator();
        while (it.hasNext()) {
            ((i.b) it.next()).a(this);
        }
        super.onCreate(bundle);
        int i5 = ReportFragment.f14730a;
        androidx.lifecycle.a.b(this);
        int i11 = this.contentLayoutId;
        if (i11 != 0) {
            setContentView(i11);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onCreatePanelMenu(int i5, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        if (i5 != 0) {
            return true;
        }
        super.onCreatePanelMenu(i5, menu);
        a5.t tVar = this.menuHostHelper;
        MenuInflater menuInflater = getMenuInflater();
        Iterator it = tVar.f367b.iterator();
        while (it.hasNext()) {
            ((z0) ((a5.u) it.next())).f14725a.k(menu, menuInflater);
        }
        return true;
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onMenuItemSelected(int i5, @NotNull MenuItem item) {
        Intrinsics.g(item, "item");
        if (super.onMenuItemSelected(i5, item)) {
            return true;
        }
        if (i5 == 0) {
            return this.menuHostHelper.a(item);
        }
        return false;
    }

    @Override // android.app.Activity
    @Deprecated
    public void onMultiWindowModeChanged(boolean z11) {
        if (this.dispatchingOnMultiWindowModeChanged) {
            return;
        }
        Iterator<z4.a> it = this.onMultiWindowModeChangedListeners.iterator();
        while (it.hasNext()) {
            it.next().accept(new n4.k(z11));
        }
    }

    @Override // android.app.Activity
    public void onNewIntent(@NotNull Intent intent) {
        Intrinsics.g(intent, "intent");
        super.onNewIntent(intent);
        Iterator<z4.a> it = this.onNewIntentListeners.iterator();
        while (it.hasNext()) {
            it.next().accept(intent);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onPanelClosed(int i5, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        Iterator it = this.menuHostHelper.f367b.iterator();
        while (it.hasNext()) {
            ((z0) ((a5.u) it.next())).f14725a.q(menu);
        }
        super.onPanelClosed(i5, menu);
    }

    @Override // android.app.Activity
    @Deprecated
    public void onPictureInPictureModeChanged(boolean z11) {
        if (this.dispatchingOnPictureInPictureModeChanged) {
            return;
        }
        Iterator<z4.a> it = this.onPictureInPictureModeChangedListeners.iterator();
        while (it.hasNext()) {
            it.next().accept(new r0(z11));
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onPreparePanel(int i5, @Nullable View view, @NotNull Menu menu) {
        Intrinsics.g(menu, "menu");
        if (i5 != 0) {
            return true;
        }
        super.onPreparePanel(i5, view, menu);
        Iterator it = this.menuHostHelper.f367b.iterator();
        while (it.hasNext()) {
            ((z0) ((a5.u) it.next())).f14725a.t(menu);
        }
        return true;
    }

    @Override // android.app.Activity
    @Deprecated
    public void onRequestPermissionsResult(int i5, @NotNull String[] permissions, @NotNull int[] grantResults) {
        Intrinsics.g(permissions, "permissions");
        Intrinsics.g(grantResults, "grantResults");
        if (this.activityResultRegistry.a(i5, -1, new Intent().putExtra("androidx.activity.result.contract.extra.PERMISSIONS", permissions).putExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS", grantResults))) {
            return;
        }
        super.onRequestPermissionsResult(i5, permissions, grantResults);
    }

    @Deprecated
    @Nullable
    public Object onRetainCustomNonConfigurationInstance() {
        return null;
    }

    @Override // android.app.Activity
    @Nullable
    public final Object onRetainNonConfigurationInstance() {
        j jVar;
        Object objOnRetainCustomNonConfigurationInstance = onRetainCustomNonConfigurationInstance();
        n1 n1Var = this._viewModelStore;
        if (n1Var == null && (jVar = (j) getLastNonConfigurationInstance()) != null) {
            n1Var = jVar.f56418b;
        }
        if (n1Var == null && objOnRetainCustomNonConfigurationInstance == null) {
            return null;
        }
        j jVar2 = new j();
        jVar2.f56417a = objOnRetainCustomNonConfigurationInstance;
        jVar2.f56418b = n1Var;
        return jVar2;
    }

    @Override // n4.i, android.app.Activity
    public void onSaveInstanceState(@NotNull Bundle outState) {
        Intrinsics.g(outState, "outState");
        if (getLifecycle() instanceof h6.c0) {
            h6.u lifecycle = getLifecycle();
            Intrinsics.e(lifecycle, "null cannot be cast to non-null type androidx.lifecycle.LifecycleRegistry");
            ((h6.c0) lifecycle).h(h6.t.f59442c);
        }
        super.onSaveInstanceState(outState);
        this.savedStateRegistryController.f441a.f(outState);
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks2
    public void onTrimMemory(int i5) {
        super.onTrimMemory(i5);
        Iterator<z4.a> it = this.onTrimMemoryListeners.iterator();
        while (it.hasNext()) {
            it.next().accept(Integer.valueOf(i5));
        }
    }

    @Override // android.app.Activity
    public void onUserLeaveHint() {
        super.onUserLeaveHint();
        Iterator<Runnable> it = this.onUserLeaveHintListeners.iterator();
        while (it.hasNext()) {
            it.next().run();
        }
    }

    @Nullable
    public Context peekAvailableContext() {
        return this.contextAwareHelper.f61082b;
    }

    @NotNull
    public final <I, O> j.c registerForActivityResult(@NotNull k.b contract, @NotNull j.i registry, @NotNull j.a callback) {
        Intrinsics.g(contract, "contract");
        Intrinsics.g(registry, "registry");
        Intrinsics.g(callback, "callback");
        return registry.c("activity_rq#" + this.nextLocalRequestCode.getAndIncrement(), this, contract, callback);
    }

    @Override // a5.p
    public void removeMenuProvider(@NotNull a5.u provider) {
        Intrinsics.g(provider, "provider");
        this.menuHostHelper.b(provider);
    }

    @Override // o4.e
    public final void removeOnConfigurationChangedListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onConfigurationChangedListeners.remove(listener);
    }

    public final void removeOnContextAvailableListener(@NotNull i.b listener) {
        Intrinsics.g(listener, "listener");
        i.a aVar = this.contextAwareHelper;
        aVar.getClass();
        aVar.f61081a.remove(listener);
    }

    @Override // n4.o0
    public final void removeOnMultiWindowModeChangedListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onMultiWindowModeChangedListeners.remove(listener);
    }

    public final void removeOnNewIntentListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onNewIntentListeners.remove(listener);
    }

    @Override // n4.p0
    public final void removeOnPictureInPictureModeChangedListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onPictureInPictureModeChangedListeners.remove(listener);
    }

    @Override // o4.f
    public final void removeOnTrimMemoryListener(@NotNull z4.a listener) {
        Intrinsics.g(listener, "listener");
        this.onTrimMemoryListeners.remove(listener);
    }

    public final void removeOnUserLeaveHintListener(@NotNull Runnable listener) {
        Intrinsics.g(listener, "listener");
        this.onUserLeaveHintListeners.remove(listener);
    }

    @Override // android.app.Activity
    public void reportFullyDrawn() {
        try {
            if (t2.c.C()) {
                t2.c.o("reportFullyDrawn() for ComponentActivity");
            }
            super.reportFullyDrawn();
            getFullyDrawnReporter().a();
            t2.c.s();
        } catch (Throwable th2) {
            t2.c.s();
            throw th2;
        }
    }

    @Override // android.app.Activity
    public void setContentView(int i5) {
        initializeViewTreeOwners();
        k kVar = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        Intrinsics.f(decorView, "window.decorView");
        ((l) kVar).a(decorView);
        super.setContentView(i5);
    }

    @Override // android.app.Activity
    @Deprecated
    public void startActivityForResult(@NotNull Intent intent, int i5) {
        Intrinsics.g(intent, "intent");
        super.startActivityForResult(intent, i5);
    }

    @Override // android.app.Activity
    @Deprecated
    public void startIntentSenderForResult(@NotNull IntentSender intent, int i5, @Nullable Intent intent2, int i11, int i12, int i13) throws IntentSender.SendIntentException {
        Intrinsics.g(intent, "intent");
        super.startIntentSenderForResult(intent, i5, intent2, i11, i12, i13);
    }

    @Override // android.app.Activity
    @Deprecated
    public void startActivityForResult(@NotNull Intent intent, int i5, @Nullable Bundle bundle) {
        Intrinsics.g(intent, "intent");
        super.startActivityForResult(intent, i5, bundle);
    }

    @Override // android.app.Activity
    @Deprecated
    public void startIntentSenderForResult(@NotNull IntentSender intent, int i5, @Nullable Intent intent2, int i11, int i12, int i13, @Nullable Bundle bundle) throws IntentSender.SendIntentException {
        Intrinsics.g(intent, "intent");
        super.startIntentSenderForResult(intent, i5, intent2, i11, i12, i13, bundle);
    }

    @Override // j.b
    @NotNull
    public final <I, O> j.c registerForActivityResult(@NotNull k.b contract, @NotNull j.a callback) {
        Intrinsics.g(contract, "contract");
        Intrinsics.g(callback, "callback");
        return registerForActivityResult(contract, this.activityResultRegistry, callback);
    }

    @Override // android.app.Activity
    public void onMultiWindowModeChanged(boolean z11, @NotNull Configuration newConfig) {
        Intrinsics.g(newConfig, "newConfig");
        this.dispatchingOnMultiWindowModeChanged = true;
        try {
            super.onMultiWindowModeChanged(z11, newConfig);
            this.dispatchingOnMultiWindowModeChanged = false;
            Iterator<z4.a> it = this.onMultiWindowModeChangedListeners.iterator();
            while (it.hasNext()) {
                it.next().accept(new n4.k(z11, newConfig));
            }
        } catch (Throwable th2) {
            this.dispatchingOnMultiWindowModeChanged = false;
            throw th2;
        }
    }

    @Override // android.app.Activity
    public void onPictureInPictureModeChanged(boolean z11, @NotNull Configuration newConfig) {
        Intrinsics.g(newConfig, "newConfig");
        this.dispatchingOnPictureInPictureModeChanged = true;
        try {
            super.onPictureInPictureModeChanged(z11, newConfig);
            this.dispatchingOnPictureInPictureModeChanged = false;
            Iterator<z4.a> it = this.onPictureInPictureModeChangedListeners.iterator();
            while (it.hasNext()) {
                it.next().accept(new r0(z11, newConfig));
            }
        } catch (Throwable th2) {
            this.dispatchingOnPictureInPictureModeChanged = false;
            throw th2;
        }
    }

    @Override // android.app.Activity
    public void setContentView(@Nullable View view) {
        initializeViewTreeOwners();
        k kVar = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        Intrinsics.f(decorView, "window.decorView");
        ((l) kVar).a(decorView);
        super.setContentView(view);
    }

    public void addMenuProvider(@NotNull a5.u provider, @NotNull h6.a0 owner) {
        Intrinsics.g(provider, "provider");
        Intrinsics.g(owner, "owner");
        a5.t tVar = this.menuHostHelper;
        tVar.f367b.add(provider);
        tVar.f366a.run();
        h6.u lifecycle = owner.getLifecycle();
        HashMap map = tVar.f368c;
        a5.s sVar = (a5.s) map.remove(provider);
        if (sVar != null) {
            sVar.a();
        }
        map.put(provider, new a5.s(lifecycle, new a5.r(0, tVar, provider)));
    }

    @Override // android.app.Activity
    public void setContentView(@Nullable View view, @Nullable ViewGroup.LayoutParams layoutParams) {
        initializeViewTreeOwners();
        k kVar = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        Intrinsics.f(decorView, "window.decorView");
        ((l) kVar).a(decorView);
        super.setContentView(view, layoutParams);
    }

    @SuppressLint({"LambdaLast"})
    public void addMenuProvider(@NotNull a5.u provider, @NotNull h6.a0 owner, @NotNull h6.t state) {
        Intrinsics.g(provider, "provider");
        Intrinsics.g(owner, "owner");
        Intrinsics.g(state, "state");
        a5.t tVar = this.menuHostHelper;
        tVar.getClass();
        h6.u lifecycle = owner.getLifecycle();
        HashMap map = tVar.f368c;
        a5.s sVar = (a5.s) map.remove(provider);
        if (sVar != null) {
            sVar.a();
        }
        map.put(provider, new a5.s(lifecycle, new a5.q(0, tVar, state, provider)));
    }

    public o(int i5) {
        this();
        this.contentLayoutId = i5;
    }
}
