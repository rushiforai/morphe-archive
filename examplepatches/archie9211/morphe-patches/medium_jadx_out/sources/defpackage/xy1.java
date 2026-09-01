package defpackage;

import android.app.Application;
import android.app.PictureInPictureUiState;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import android.os.Trace;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.window.OnBackInvokedDispatcher;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xy1 extends wy1 implements wue, pi5, hpb, jq8, kc8, v7 {
    private static final String ACTIVITY_RESULT_TAG = "android:support:activity-result";
    private static final py1 Companion = new py1();
    private vue _viewModelStore;
    private final r7 activityResultRegistry;
    private int contentLayoutId;
    private final vq6 defaultViewModelProviderFactory$delegate;
    private boolean dispatchingOnMultiWindowModeChanged;
    private boolean dispatchingOnPictureInPictureModeChanged;
    private final vq6 fullyDrawnReporter$delegate;
    private boolean hasPictureInPictureSystemFeature;
    private final AtomicInteger nextLocalRequestCode;
    private final vq6 onBackPressedDispatcher$delegate;
    private final vq6 onBackPressedInput$delegate;
    private final CopyOnWriteArrayList<t72> onConfigurationChangedListeners;
    private final CopyOnWriteArrayList<t72> onMultiWindowModeChangedListeners;
    private final CopyOnWriteArrayList<t72> onNewIntentListeners;
    private final CopyOnWriteArrayList<t72> onPictureInPictureModeChangedListeners;
    private final CopyOnWriteArrayList<t72> onPictureInPictureUiStateChangedListeners;
    private final CopyOnWriteArrayList<t72> onTrimMemoryListeners;
    private final CopyOnWriteArrayList<Runnable> onUserLeaveHintListeners;
    private final sy1 reportFullyDrawnExecutor;
    private final fpb savedStateRegistryController;
    private final b92 contextAwareHelper = new b92();
    private final px7 menuHostHelper = new px7(new jy1(this, 0));

    public xy1() {
        gpb gpbVar = new gpb(this, new i5b(14, this));
        this.savedStateRegistryController = new fpb(gpbVar);
        this.reportFullyDrawnExecutor = new ty1(this);
        this.fullyDrawnReporter$delegate = new w5d(new ky1(this, 1));
        this.nextLocalRequestCode = new AtomicInteger();
        this.activityResultRegistry = new vy1(this);
        this.onConfigurationChangedListeners = new CopyOnWriteArrayList<>();
        this.onTrimMemoryListeners = new CopyOnWriteArrayList<>();
        this.onNewIntentListeners = new CopyOnWriteArrayList<>();
        this.onMultiWindowModeChangedListeners = new CopyOnWriteArrayList<>();
        this.onPictureInPictureModeChangedListeners = new CopyOnWriteArrayList<>();
        this.onPictureInPictureUiStateChangedListeners = new CopyOnWriteArrayList<>();
        this.onUserLeaveHintListeners = new CopyOnWriteArrayList<>();
        this.onBackPressedInput$delegate = new w5d(new ky1(this, 2));
        if (getLifecycle() == null) {
            ygf.f("getLifecycle() returned null in ComponentActivity's constructor. Please make sure you are lazily constructing your Lifecycle in the first call to getLifecycle() rather than relying on field initialization.");
            throw null;
        }
        final int i = 0;
        getLifecycle().a(new cy6(this) { // from class: my1
            public final /* synthetic */ xy1 b;

            {
                this.b = this;
            }

            @Override // defpackage.cy6
            public final void f(iy6 iy6Var, ux6 ux6Var) {
                Window window;
                View viewPeekDecorView;
                int i2 = i;
                xy1 xy1Var = this.b;
                switch (i2) {
                    case 0:
                        if (ux6Var == ux6.ON_STOP && (window = xy1Var.getWindow()) != null && (viewPeekDecorView = window.peekDecorView()) != null) {
                            viewPeekDecorView.cancelPendingInputEvents();
                            break;
                        }
                        break;
                    default:
                        xy1.g(xy1Var, iy6Var, ux6Var);
                        break;
                }
            }
        });
        final int i2 = 1;
        getLifecycle().a(new cy6(this) { // from class: my1
            public final /* synthetic */ xy1 b;

            {
                this.b = this;
            }

            @Override // defpackage.cy6
            public final void f(iy6 iy6Var, ux6 ux6Var) {
                Window window;
                View viewPeekDecorView;
                int i22 = i2;
                xy1 xy1Var = this.b;
                switch (i22) {
                    case 0:
                        if (ux6Var == ux6.ON_STOP && (window = xy1Var.getWindow()) != null && (viewPeekDecorView = window.peekDecorView()) != null) {
                            viewPeekDecorView.cancelPendingInputEvents();
                            break;
                        }
                        break;
                    default:
                        xy1.g(xy1Var, iy6Var, ux6Var);
                        break;
                }
            }
        });
        getLifecycle().a(new ywa(i2, this));
        gpbVar.a();
        kyd.R(this);
        if (Build.VERSION.SDK_INT == 23) {
            getLifecycle().a(new vy5(this));
        }
        getSavedStateRegistry().c(ACTIVITY_RESULT_TAG, new ny1(0, this));
        addOnContextAvailableListener(new oy1(this, 0));
        this.defaultViewModelProviderFactory$delegate = new w5d(new ky1(this, 3));
        this.onBackPressedDispatcher$delegate = new w5d(new ky1(this, 4));
    }

    public static final void access$ensureViewModelStore(xy1 xy1Var) {
        if (xy1Var._viewModelStore == null) {
            ry1 ry1Var = (ry1) xy1Var.getLastNonConfigurationInstance();
            if (ry1Var != null) {
                xy1Var._viewModelStore = ry1Var.b;
            }
            if (xy1Var._viewModelStore == null) {
                xy1Var._viewModelStore = new vue();
            }
        }
    }

    public static final void g(xy1 xy1Var, iy6 iy6Var, ux6 ux6Var) {
        if (ux6Var == ux6.ON_DESTROY) {
            xy1Var.contextAwareHelper.b = null;
            if (!xy1Var.isChangingConfigurations()) {
                xy1Var.getViewModelStore().a();
            }
            ty1 ty1Var = (ty1) xy1Var.reportFullyDrawnExecutor;
            xy1 xy1Var2 = ty1Var.d;
            xy1Var2.getWindow().getDecorView().removeCallbacks(ty1Var);
            xy1Var2.getWindow().getDecorView().getViewTreeObserver().removeOnDrawListener(ty1Var);
        }
    }

    public static final Bundle h(xy1 xy1Var) {
        Bundle bundle = new Bundle();
        r7 r7Var = xy1Var.activityResultRegistry;
        r7Var.getClass();
        LinkedHashMap linkedHashMap = r7Var.b;
        bundle.putIntegerArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_RCS", new ArrayList<>(linkedHashMap.values()));
        bundle.putStringArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS", new ArrayList<>(linkedHashMap.keySet()));
        bundle.putStringArrayList("KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS", new ArrayList<>(r7Var.d));
        bundle.putBundle("KEY_COMPONENT_ACTIVITY_PENDING_RESULT", new Bundle(r7Var.g));
        return bundle;
    }

    public static final void i(xy1 xy1Var, Context context) {
        context.getClass();
        Bundle bundleA = xy1Var.getSavedStateRegistry().a(ACTIVITY_RESULT_TAG);
        if (bundleA != null) {
            r7 r7Var = xy1Var.activityResultRegistry;
            LinkedHashMap linkedHashMap = r7Var.b;
            LinkedHashMap linkedHashMap2 = r7Var.a;
            Bundle bundle = r7Var.g;
            ArrayList<Integer> integerArrayList = bundleA.getIntegerArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_RCS");
            ArrayList<String> stringArrayList = bundleA.getStringArrayList("KEY_COMPONENT_ACTIVITY_REGISTERED_KEYS");
            if (stringArrayList == null || integerArrayList == null) {
                return;
            }
            ArrayList<String> stringArrayList2 = bundleA.getStringArrayList("KEY_COMPONENT_ACTIVITY_LAUNCHED_KEYS");
            if (stringArrayList2 != null) {
                r7Var.d.addAll(stringArrayList2);
            }
            Bundle bundle2 = bundleA.getBundle("KEY_COMPONENT_ACTIVITY_PENDING_RESULT");
            if (bundle2 != null) {
                bundle.putAll(bundle2);
            }
            int size = stringArrayList.size();
            for (int i = 0; i < size; i++) {
                String str = stringArrayList.get(i);
                if (linkedHashMap.containsKey(str)) {
                    Integer num = (Integer) linkedHashMap.remove(str);
                    if (!bundle.containsKey(str)) {
                        pwd.y(linkedHashMap2).remove(num);
                    }
                }
                Integer num2 = integerArrayList.get(i);
                num2.getClass();
                int iIntValue = num2.intValue();
                String str2 = stringArrayList.get(i);
                str2.getClass();
                String str3 = str2;
                linkedHashMap2.put(Integer.valueOf(iIntValue), str3);
                r7Var.b.put(str3, Integer.valueOf(iIntValue));
            }
        }
    }

    public static final void j(iq8 iq8Var, xy1 xy1Var, iy6 iy6Var, ux6 ux6Var) {
        if (ux6Var == ux6.ON_CREATE) {
            OnBackInvokedDispatcher onBackInvokedDispatcher = xy1Var.getOnBackInvokedDispatcher();
            onBackInvokedDispatcher.getClass();
            iq8Var.e(onBackInvokedDispatcher);
        }
    }

    public static final l45 k(xy1 xy1Var) {
        return new l45(xy1Var.reportFullyDrawnExecutor, new ky1(xy1Var, 0));
    }

    public static final void l(xy1 xy1Var) {
        try {
            super.onBackPressed();
        } catch (IllegalStateException e) {
            if (!g76.L(e.getMessage(), "Can not perform this action after onSaveInstanceState")) {
                throw e;
            }
        } catch (NullPointerException e2) {
            if (!g76.L(e2.getMessage(), "Attempt to invoke virtual method 'android.os.Handler android.app.FragmentHostCallback.getHandler()' on a null object reference")) {
                throw e2;
            }
        }
    }

    @Override // android.app.Activity
    public void addContentView(View view, ViewGroup.LayoutParams layoutParams) {
        initializeViewTreeOwners();
        sy1 sy1Var = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        ((ty1) sy1Var).a(decorView);
        super.addContentView(view, layoutParams);
    }

    public void addMenuProvider(ly7 ly7Var, iy6 iy6Var) {
        ly7Var.getClass();
        iy6Var.getClass();
        px7 px7Var = this.menuHostHelper;
        px7Var.b.add(ly7Var);
        px7Var.a.run();
        wx6 lifecycle = iy6Var.getLifecycle();
        HashMap map = px7Var.c;
        ox7 ox7Var = (ox7) map.remove(ly7Var);
        if (ox7Var != null) {
            ox7Var.a.b(ox7Var.b);
            ox7Var.b = null;
        }
        map.put(ly7Var, new ox7(lifecycle, new ly1(px7Var, 2, ly7Var)));
    }

    public final void addOnConfigurationChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onConfigurationChangedListeners.add(t72Var);
    }

    public final void addOnContextAvailableListener(zq8 zq8Var) {
        zq8Var.getClass();
        b92 b92Var = this.contextAwareHelper;
        b92Var.getClass();
        xy1 xy1Var = b92Var.b;
        if (xy1Var != null) {
            zq8Var.a(xy1Var);
        }
        b92Var.a.add(zq8Var);
    }

    public final void addOnMultiWindowModeChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onMultiWindowModeChangedListeners.add(t72Var);
    }

    public final void addOnNewIntentListener(t72 t72Var) {
        t72Var.getClass();
        this.onNewIntentListeners.add(t72Var);
    }

    public final void addOnPictureInPictureModeChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onPictureInPictureModeChangedListeners.add(t72Var);
    }

    public final void addOnPictureInPictureUiStateChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onPictureInPictureUiStateChangedListeners.add(t72Var);
    }

    public final void addOnTrimMemoryListener(t72 t72Var) {
        t72Var.getClass();
        this.onTrimMemoryListeners.add(t72Var);
    }

    public final void addOnUserLeaveHintListener(Runnable runnable) {
        runnable.getClass();
        this.onUserLeaveHintListeners.add(runnable);
    }

    public final void enterPictureInPictureMode(h99 h99Var) {
        throw null;
    }

    @Override // defpackage.v7
    public final r7 getActivityResultRegistry() {
        return this.activityResultRegistry;
    }

    @Override // defpackage.pi5
    public qg2 getDefaultViewModelCreationExtras() {
        g68 g68Var = new g68(0);
        Application application = getApplication();
        LinkedHashMap linkedHashMap = g68Var.a;
        if (application != null) {
            linkedHashMap.put(tue.f, getApplication());
        }
        linkedHashMap.put(kyd.i, this);
        linkedHashMap.put(kyd.j, this);
        Intent intent = getIntent();
        Bundle extras = intent != null ? intent.getExtras() : null;
        if (extras != null) {
            linkedHashMap.put(kyd.k, extras);
        }
        return g68Var;
    }

    public uue getDefaultViewModelProviderFactory() {
        return (uue) this.defaultViewModelProviderFactory$delegate.getValue();
    }

    public l45 getFullyDrawnReporter() {
        return (l45) this.fullyDrawnReporter$delegate.getValue();
    }

    @z73
    public Object getLastCustomNonConfigurationInstance() {
        ry1 ry1Var = (ry1) getLastNonConfigurationInstance();
        if (ry1Var != null) {
            return ry1Var.a;
        }
        return null;
    }

    @Override // defpackage.wy1, defpackage.iy6
    public wx6 getLifecycle() {
        return super.getLifecycle();
    }

    @Override // defpackage.kc8
    public jc8 getNavigationEventDispatcher() {
        return getOnBackPressedDispatcher().c().c;
    }

    @Override // defpackage.jq8
    public final iq8 getOnBackPressedDispatcher() {
        return (iq8) this.onBackPressedDispatcher$delegate.getValue();
    }

    @Override // defpackage.hpb
    public final epb getSavedStateRegistry() {
        return this.savedStateRegistryController.b;
    }

    @Override // defpackage.wue
    public vue getViewModelStore() {
        if (getApplication() == null) {
            ygf.f("Your activity is not yet attached to the Application instance. You can't request ViewModel before onCreate call.");
            return null;
        }
        vue vueVar = this._viewModelStore;
        if (vueVar == null) {
            ry1 ry1Var = (ry1) getLastNonConfigurationInstance();
            if (ry1Var != null) {
                this._viewModelStore = ry1Var.b;
            }
            vueVar = this._viewModelStore;
            if (vueVar == null) {
                vueVar = new vue();
                this._viewModelStore = vueVar;
            }
        }
        vueVar.getClass();
        return vueVar;
    }

    public void initializeViewTreeOwners() {
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        decorView.setTag(R.id.view_tree_lifecycle_owner, this);
        View decorView2 = getWindow().getDecorView();
        decorView2.getClass();
        decorView2.setTag(R.id.view_tree_view_model_store_owner, this);
        View decorView3 = getWindow().getDecorView();
        decorView3.getClass();
        decorView3.setTag(R.id.view_tree_saved_state_registry_owner, this);
        View decorView4 = getWindow().getDecorView();
        decorView4.getClass();
        decorView4.setTag(R.id.view_tree_on_back_pressed_dispatcher_owner, this);
        View decorView5 = getWindow().getDecorView();
        decorView5.getClass();
        decorView5.setTag(R.id.report_drawn, this);
        View decorView6 = getWindow().getDecorView();
        decorView6.getClass();
        decorView6.setTag(R.id.view_tree_navigation_event_dispatcher_owner, this);
    }

    public void invalidateMenu() {
        invalidateOptionsMenu();
    }

    @Override // android.app.Activity
    @z73
    public void onActivityResult(int i, int i2, Intent intent) {
        if (this.activityResultRegistry.a(i, i2, intent)) {
            return;
        }
        super.onActivityResult(i, i2, intent);
    }

    @Override // android.app.Activity
    @z73
    public void onBackPressed() {
        ((df3) this.onBackPressedInput$delegate.getValue()).a();
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        configuration.getClass();
        super.onConfigurationChanged(configuration);
        Iterator<t72> it2 = this.onConfigurationChangedListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().accept(configuration);
        }
    }

    @Override // defpackage.wy1, android.app.Activity
    public void onCreate(Bundle bundle) {
        this.savedStateRegistryController.a(bundle);
        b92 b92Var = this.contextAwareHelper;
        b92Var.getClass();
        b92Var.b = this;
        Iterator it2 = b92Var.a.iterator();
        while (it2.hasNext()) {
            ((zq8) it2.next()).a(this);
        }
        super.onCreate(bundle);
        int i = f5b.b;
        d5b.b(this);
        int i2 = this.contentLayoutId;
        if (i2 != 0) {
            setContentView(i2);
        }
        this.hasPictureInPictureSystemFeature = getPackageManager().hasSystemFeature("android.software.picture_in_picture");
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onCreatePanelMenu(int i, Menu menu) {
        menu.getClass();
        if (i != 0) {
            return true;
        }
        super.onCreatePanelMenu(i, menu);
        px7 px7Var = this.menuHostHelper;
        getMenuInflater();
        Iterator it2 = px7Var.b.iterator();
        while (it2.hasNext()) {
            ((v15) ((ly7) it2.next())).a.j();
        }
        return true;
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onMenuItemSelected(int i, MenuItem menuItem) {
        menuItem.getClass();
        if (super.onMenuItemSelected(i, menuItem)) {
            return true;
        }
        if (i == 0) {
            return this.menuHostHelper.a();
        }
        return false;
    }

    @Override // android.app.Activity
    public void onMultiWindowModeChanged(boolean z, Configuration configuration) {
        configuration.getClass();
        this.dispatchingOnMultiWindowModeChanged = true;
        try {
            super.onMultiWindowModeChanged(z, configuration);
            this.dispatchingOnMultiWindowModeChanged = false;
            Iterator<t72> it2 = this.onMultiWindowModeChangedListeners.iterator();
            it2.getClass();
            while (it2.hasNext()) {
                it2.next().accept(new w58(z));
            }
        } catch (Throwable th) {
            this.dispatchingOnMultiWindowModeChanged = false;
            throw th;
        }
    }

    @Override // android.app.Activity
    public void onNewIntent(Intent intent) {
        intent.getClass();
        super.onNewIntent(intent);
        Iterator<t72> it2 = this.onNewIntentListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().accept(intent);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onPanelClosed(int i, Menu menu) {
        menu.getClass();
        Iterator it2 = this.menuHostHelper.b.iterator();
        while (it2.hasNext()) {
            ((v15) ((ly7) it2.next())).a.p();
        }
        super.onPanelClosed(i, menu);
    }

    @Override // android.app.Activity
    public void onPictureInPictureModeChanged(boolean z, Configuration configuration) {
        configuration.getClass();
        this.dispatchingOnPictureInPictureModeChanged = true;
        try {
            super.onPictureInPictureModeChanged(z, configuration);
            this.dispatchingOnPictureInPictureModeChanged = false;
            Iterator<t72> it2 = this.onPictureInPictureModeChangedListeners.iterator();
            it2.getClass();
            while (it2.hasNext()) {
                it2.next().accept(new g99(z));
            }
        } catch (Throwable th) {
            this.dispatchingOnPictureInPictureModeChanged = false;
            throw th;
        }
    }

    @Override // android.app.Activity
    public void onPictureInPictureUiStateChanged(PictureInPictureUiState pictureInPictureUiState) {
        pictureInPictureUiState.getClass();
        super.onPictureInPictureUiStateChanged(pictureInPictureUiState);
        wz7 wz7VarB = dv3.b(pictureInPictureUiState);
        Iterator<t72> it2 = this.onPictureInPictureUiStateChangedListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().accept(wz7VarB);
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean onPreparePanel(int i, View view, Menu menu) {
        menu.getClass();
        if (i != 0) {
            return true;
        }
        super.onPreparePanel(i, view, menu);
        Iterator it2 = this.menuHostHelper.b.iterator();
        while (it2.hasNext()) {
            ((v15) ((ly7) it2.next())).a.s();
        }
        return true;
    }

    @Override // android.app.Activity
    @z73
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        strArr.getClass();
        iArr.getClass();
        if (this.activityResultRegistry.a(i, -1, new Intent().putExtra("androidx.activity.result.contract.extra.PERMISSIONS", strArr).putExtra("androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS", iArr))) {
            return;
        }
        super.onRequestPermissionsResult(i, strArr, iArr);
    }

    @z73
    public Object onRetainCustomNonConfigurationInstance() {
        return null;
    }

    @Override // android.app.Activity
    public final Object onRetainNonConfigurationInstance() {
        ry1 ry1Var;
        Object objOnRetainCustomNonConfigurationInstance = onRetainCustomNonConfigurationInstance();
        vue vueVar = this._viewModelStore;
        if (vueVar == null && (ry1Var = (ry1) getLastNonConfigurationInstance()) != null) {
            vueVar = ry1Var.b;
        }
        if (vueVar == null && objOnRetainCustomNonConfigurationInstance == null) {
            return null;
        }
        ry1 ry1Var2 = new ry1();
        ry1Var2.a = objOnRetainCustomNonConfigurationInstance;
        ry1Var2.b = vueVar;
        return ry1Var2;
    }

    @Override // defpackage.wy1, android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        bundle.getClass();
        if (getLifecycle() instanceof ky6) {
            wx6 lifecycle = getLifecycle();
            lifecycle.getClass();
            ((ky6) lifecycle).g(vx6.CREATED);
        }
        super.onSaveInstanceState(bundle);
        this.savedStateRegistryController.b(bundle);
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks2
    public void onTrimMemory(int i) {
        super.onTrimMemory(i);
        Iterator<t72> it2 = this.onTrimMemoryListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().accept(Integer.valueOf(i));
        }
    }

    @Override // android.app.Activity
    public void onUserLeaveHint() {
        super.onUserLeaveHint();
        Iterator<Runnable> it2 = this.onUserLeaveHintListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().run();
        }
    }

    public Context peekAvailableContext() {
        return this.contextAwareHelper.b;
    }

    public final <I, O> k7 registerForActivityResult(f7 f7Var, r7 r7Var, d7 d7Var) {
        f7Var.getClass();
        r7Var.getClass();
        d7Var.getClass();
        return r7Var.d("activity_rq#" + this.nextLocalRequestCode.getAndIncrement(), this, f7Var, d7Var);
    }

    public void removeMenuProvider(ly7 ly7Var) {
        ly7Var.getClass();
        this.menuHostHelper.b(ly7Var);
    }

    public final void removeOnConfigurationChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onConfigurationChangedListeners.remove(t72Var);
    }

    public final void removeOnContextAvailableListener(zq8 zq8Var) {
        zq8Var.getClass();
        b92 b92Var = this.contextAwareHelper;
        b92Var.getClass();
        b92Var.a.remove(zq8Var);
    }

    public final void removeOnMultiWindowModeChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onMultiWindowModeChangedListeners.remove(t72Var);
    }

    public final void removeOnNewIntentListener(t72 t72Var) {
        t72Var.getClass();
        this.onNewIntentListeners.remove(t72Var);
    }

    public final void removeOnPictureInPictureModeChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onPictureInPictureModeChangedListeners.remove(t72Var);
    }

    public final void removeOnPictureInPictureUiStateChangedListener(t72 t72Var) {
        t72Var.getClass();
        this.onPictureInPictureUiStateChangedListeners.remove(t72Var);
    }

    public final void removeOnTrimMemoryListener(t72 t72Var) {
        t72Var.getClass();
        this.onTrimMemoryListeners.remove(t72Var);
    }

    public final void removeOnUserLeaveHintListener(Runnable runnable) {
        runnable.getClass();
        this.onUserLeaveHintListeners.remove(runnable);
    }

    @Override // android.app.Activity
    public void reportFullyDrawn() {
        try {
            if (gq7.E()) {
                Trace.beginSection(gq7.X("reportFullyDrawn() for ComponentActivity"));
            }
            super.reportFullyDrawn();
            l45 fullyDrawnReporter = getFullyDrawnReporter();
            synchronized (fullyDrawnReporter.b) {
                try {
                    fullyDrawnReporter.c = true;
                    Iterator it2 = fullyDrawnReporter.d.iterator();
                    while (it2.hasNext()) {
                        ((m45) it2.next()).invoke();
                    }
                    fullyDrawnReporter.d.clear();
                } catch (Throwable th) {
                    throw th;
                }
            }
        } finally {
            Trace.endSection();
        }
    }

    @Override // android.app.Activity
    public void setContentView(int i) {
        initializeViewTreeOwners();
        sy1 sy1Var = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        ((ty1) sy1Var).a(decorView);
        super.setContentView(i);
    }

    public final void setPictureInPictureParams(h99 h99Var) {
        throw null;
    }

    @Override // android.app.Activity
    @z73
    public void startActivityForResult(Intent intent, int i) {
        intent.getClass();
        super.startActivityForResult(intent, i);
    }

    @Override // android.app.Activity
    @z73
    public void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4) throws IntentSender.SendIntentException {
        intentSender.getClass();
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4);
    }

    @Override // android.app.Activity
    @z73
    public void startActivityForResult(Intent intent, int i, Bundle bundle) {
        intent.getClass();
        super.startActivityForResult(intent, i, bundle);
    }

    @Override // android.app.Activity
    @z73
    public void startIntentSenderForResult(IntentSender intentSender, int i, Intent intent, int i2, int i3, int i4, Bundle bundle) throws IntentSender.SendIntentException {
        intentSender.getClass();
        super.startIntentSenderForResult(intentSender, i, intent, i2, i3, i4, bundle);
    }

    @Override // android.app.Activity
    public void setContentView(View view) {
        initializeViewTreeOwners();
        sy1 sy1Var = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        ((ty1) sy1Var).a(decorView);
        super.setContentView(view);
    }

    @Override // android.app.Activity
    public void setContentView(View view, ViewGroup.LayoutParams layoutParams) {
        initializeViewTreeOwners();
        sy1 sy1Var = this.reportFullyDrawnExecutor;
        View decorView = getWindow().getDecorView();
        decorView.getClass();
        ((ty1) sy1Var).a(decorView);
        super.setContentView(view, layoutParams);
    }

    public final <I, O> k7 registerForActivityResult(f7 f7Var, d7 d7Var) {
        f7Var.getClass();
        d7Var.getClass();
        return registerForActivityResult(f7Var, this.activityResultRegistry, d7Var);
    }

    @Override // android.app.Activity
    @z73
    public void onMultiWindowModeChanged(boolean z) {
        if (this.dispatchingOnMultiWindowModeChanged) {
            return;
        }
        Iterator<t72> it2 = this.onMultiWindowModeChangedListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().accept(new w58(z));
        }
    }

    @Override // android.app.Activity
    @z73
    public void onPictureInPictureModeChanged(boolean z) {
        if (this.dispatchingOnPictureInPictureModeChanged) {
            return;
        }
        Iterator<t72> it2 = this.onPictureInPictureModeChangedListeners.iterator();
        it2.getClass();
        while (it2.hasNext()) {
            it2.next().accept(new g99(z));
        }
    }

    public void addMenuProvider(ly7 ly7Var) {
        ly7Var.getClass();
        px7 px7Var = this.menuHostHelper;
        px7Var.b.add(ly7Var);
        px7Var.a.run();
    }

    public void addMenuProvider(ly7 ly7Var, iy6 iy6Var, vx6 vx6Var) {
        ly7Var.getClass();
        iy6Var.getClass();
        vx6Var.getClass();
        px7 px7Var = this.menuHostHelper;
        px7Var.getClass();
        wx6 lifecycle = iy6Var.getLifecycle();
        HashMap map = px7Var.c;
        ox7 ox7Var = (ox7) map.remove(ly7Var);
        if (ox7Var != null) {
            ox7Var.a.b(ox7Var.b);
            ox7Var.b = null;
        }
        map.put(ly7Var, new ox7(lifecycle, new ay6(px7Var, vx6Var, ly7Var, 1)));
    }
}
