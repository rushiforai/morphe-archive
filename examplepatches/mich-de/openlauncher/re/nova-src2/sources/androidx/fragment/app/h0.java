package androidx.fragment.app;

import android.animation.Animator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.SparseArray;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import androidx.activity.result.IntentSenderRequest;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Objects;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class h0 implements ComponentCallbacks, View.OnCreateContextMenuListener, h6.a0, h6.o1, h6.n, a7.h, j.b {
    static final int ACTIVITY_CREATED = 4;
    static final int ATTACHED = 0;
    static final int AWAITING_ENTER_EFFECTS = 6;
    static final int AWAITING_EXIT_EFFECTS = 3;
    static final int CREATED = 1;
    static final int INITIALIZING = -1;
    static final int RESUMED = 7;
    static final int STARTED = 5;
    static final Object USE_DEFAULT_TRANSITION = new Object();
    static final int VIEW_CREATED = 2;
    boolean mAdded;
    e0 mAnimationInfo;
    Bundle mArguments;
    int mBackStackNesting;
    boolean mBeingSaved;
    private boolean mCalled;
    h1 mChildFragmentManager;
    ViewGroup mContainer;
    int mContainerId;
    private int mContentLayoutId;
    h6.j1 mDefaultFactory;
    boolean mDeferStart;
    boolean mDetached;
    int mFragmentId;
    h1 mFragmentManager;
    boolean mFromLayout;
    boolean mHasMenu;
    boolean mHidden;
    boolean mHiddenChanged;
    s0 mHost;
    boolean mInDynamicContainer;
    boolean mInLayout;
    boolean mIsCreated;
    private Boolean mIsPrimaryNavigationFragment;
    LayoutInflater mLayoutInflater;
    h6.c0 mLifecycleRegistry;
    h6.t mMaxState;
    boolean mMenuVisible;
    private final AtomicInteger mNextLocalRequestCode;
    private final ArrayList<f0> mOnPreAttachedListeners;
    h0 mParentFragment;
    boolean mPerformedCreateView;
    Runnable mPostponedDurationRunnable;
    Handler mPostponedHandler;
    public String mPreviousWho;
    boolean mRemoving;
    boolean mRestored;
    boolean mRetainInstance;
    boolean mRetainInstanceChangedWhileDetached;
    Bundle mSavedFragmentState;
    private final f0 mSavedStateAttachListener;
    a7.g mSavedStateRegistryController;
    Boolean mSavedUserVisibleHint;
    Bundle mSavedViewRegistryState;
    SparseArray<Parcelable> mSavedViewState;
    int mState;
    String mTag;
    h0 mTarget;
    int mTargetRequestCode;
    String mTargetWho;
    boolean mTransitioning;
    boolean mUserVisibleHint;
    View mView;
    y1 mViewLifecycleOwner;
    h6.m0 mViewLifecycleOwnerLiveData;
    String mWho;

    public h0() {
        this.mState = -1;
        this.mWho = UUID.randomUUID().toString();
        this.mTargetWho = null;
        this.mIsPrimaryNavigationFragment = null;
        this.mChildFragmentManager = new i1();
        this.mMenuVisible = true;
        this.mUserVisibleHint = true;
        this.mPostponedDurationRunnable = new y(this, 0);
        this.mMaxState = h6.t.f59444e;
        this.mViewLifecycleOwnerLiveData = new h6.m0();
        this.mNextLocalRequestCode = new AtomicInteger();
        this.mOnPreAttachedListeners = new ArrayList<>();
        this.mSavedStateAttachListener = new z(this);
        l();
    }

    @Deprecated
    public static h0 instantiate(Context context, String str) {
        return instantiate(context, str, null);
    }

    public void callStartTransitionListener(boolean z11) {
        ViewGroup viewGroup;
        h1 h1Var;
        e0 e0Var = this.mAnimationInfo;
        if (e0Var != null) {
            e0Var.f14548s = false;
        }
        if (this.mView == null || (viewGroup = this.mContainer) == null || (h1Var = this.mFragmentManager) == null) {
            return;
        }
        f2 f2VarK = f2.k(viewGroup, h1Var);
        f2VarK.n();
        if (z11) {
            this.mHost.f14683c.post(new r(f2VarK, 1));
        } else {
            f2VarK.f();
        }
        Handler handler = this.mPostponedHandler;
        if (handler != null) {
            handler.removeCallbacks(this.mPostponedDurationRunnable);
            this.mPostponedHandler = null;
        }
    }

    public p0 createFragmentContainer() {
        return new a0(this);
    }

    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.print(str);
        printWriter.print("mFragmentId=#");
        printWriter.print(Integer.toHexString(this.mFragmentId));
        printWriter.print(" mContainerId=#");
        printWriter.print(Integer.toHexString(this.mContainerId));
        printWriter.print(" mTag=");
        printWriter.println(this.mTag);
        printWriter.print(str);
        printWriter.print("mState=");
        printWriter.print(this.mState);
        printWriter.print(" mWho=");
        printWriter.print(this.mWho);
        printWriter.print(" mBackStackNesting=");
        printWriter.println(this.mBackStackNesting);
        printWriter.print(str);
        printWriter.print("mAdded=");
        printWriter.print(this.mAdded);
        printWriter.print(" mRemoving=");
        printWriter.print(this.mRemoving);
        printWriter.print(" mFromLayout=");
        printWriter.print(this.mFromLayout);
        printWriter.print(" mInLayout=");
        printWriter.println(this.mInLayout);
        printWriter.print(str);
        printWriter.print("mHidden=");
        printWriter.print(this.mHidden);
        printWriter.print(" mDetached=");
        printWriter.print(this.mDetached);
        printWriter.print(" mMenuVisible=");
        printWriter.print(this.mMenuVisible);
        printWriter.print(" mHasMenu=");
        printWriter.println(this.mHasMenu);
        printWriter.print(str);
        printWriter.print("mRetainInstance=");
        printWriter.print(this.mRetainInstance);
        printWriter.print(" mUserVisibleHint=");
        printWriter.println(this.mUserVisibleHint);
        if (this.mFragmentManager != null) {
            printWriter.print(str);
            printWriter.print("mFragmentManager=");
            printWriter.println(this.mFragmentManager);
        }
        if (this.mHost != null) {
            printWriter.print(str);
            printWriter.print("mHost=");
            printWriter.println(this.mHost);
        }
        if (this.mParentFragment != null) {
            printWriter.print(str);
            printWriter.print("mParentFragment=");
            printWriter.println(this.mParentFragment);
        }
        if (this.mArguments != null) {
            printWriter.print(str);
            printWriter.print("mArguments=");
            printWriter.println(this.mArguments);
        }
        if (this.mSavedFragmentState != null) {
            printWriter.print(str);
            printWriter.print("mSavedFragmentState=");
            printWriter.println(this.mSavedFragmentState);
        }
        if (this.mSavedViewState != null) {
            printWriter.print(str);
            printWriter.print("mSavedViewState=");
            printWriter.println(this.mSavedViewState);
        }
        if (this.mSavedViewRegistryState != null) {
            printWriter.print(str);
            printWriter.print("mSavedViewRegistryState=");
            printWriter.println(this.mSavedViewRegistryState);
        }
        h0 h0VarK = k(false);
        if (h0VarK != null) {
            printWriter.print(str);
            printWriter.print("mTarget=");
            printWriter.print(h0VarK);
            printWriter.print(" mTargetRequestCode=");
            printWriter.println(this.mTargetRequestCode);
        }
        printWriter.print(str);
        printWriter.print("mPopDirection=");
        printWriter.println(getPopDirection());
        if (getEnterAnim() != 0) {
            printWriter.print(str);
            printWriter.print("getEnterAnim=");
            printWriter.println(getEnterAnim());
        }
        if (getExitAnim() != 0) {
            printWriter.print(str);
            printWriter.print("getExitAnim=");
            printWriter.println(getExitAnim());
        }
        if (getPopEnterAnim() != 0) {
            printWriter.print(str);
            printWriter.print("getPopEnterAnim=");
            printWriter.println(getPopEnterAnim());
        }
        if (getPopExitAnim() != 0) {
            printWriter.print(str);
            printWriter.print("getPopExitAnim=");
            printWriter.println(getPopExitAnim());
        }
        if (this.mContainer != null) {
            printWriter.print(str);
            printWriter.print("mContainer=");
            printWriter.println(this.mContainer);
        }
        if (this.mView != null) {
            printWriter.print(str);
            printWriter.print("mView=");
            printWriter.println(this.mView);
        }
        if (getAnimatingAway() != null) {
            printWriter.print(str);
            printWriter.print("mAnimatingAway=");
            printWriter.println(getAnimatingAway());
        }
        if (getContext() != null) {
            n6.a.a(this).b(str, printWriter);
        }
        printWriter.print(str);
        printWriter.println("Child " + this.mChildFragmentManager + ":");
        this.mChildFragmentManager.w(b.c0.E(str, "  "), fileDescriptor, printWriter, strArr);
    }

    public final boolean equals(Object obj) {
        return super.equals(obj);
    }

    public Activity f() {
        return getActivity();
    }

    public h0 findFragmentByWho(String str) {
        return str.equals(this.mWho) ? this : this.mChildFragmentManager.f14571c.c(str);
    }

    public String generateActivityResultKey() {
        return "fragment_" + this.mWho + "_rq#" + this.mNextLocalRequestCode.getAndIncrement();
    }

    public final m0 getActivity() {
        s0 s0Var = this.mHost;
        if (s0Var == null) {
            return null;
        }
        return s0Var.f14681a;
    }

    public boolean getAllowEnterTransitionOverlap() {
        Boolean bool;
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null || (bool = e0Var.f14545p) == null) {
            return true;
        }
        return bool.booleanValue();
    }

    public boolean getAllowReturnTransitionOverlap() {
        Boolean bool;
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null || (bool = e0Var.o) == null) {
            return true;
        }
        return bool.booleanValue();
    }

    public View getAnimatingAway() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        e0Var.getClass();
        return null;
    }

    public final Bundle getArguments() {
        return this.mArguments;
    }

    public final h1 getChildFragmentManager() {
        if (this.mHost != null) {
            return this.mChildFragmentManager;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " has not been attached yet."));
    }

    public Context getContext() {
        s0 s0Var = this.mHost;
        if (s0Var == null) {
            return null;
        }
        return s0Var.f14682b;
    }

    @Override // h6.n
    public k6.c getDefaultViewModelCreationExtras() {
        Application application;
        Context applicationContext = requireContext().getApplicationContext();
        while (true) {
            if (!(applicationContext instanceof ContextWrapper)) {
                application = null;
                break;
            }
            if (applicationContext instanceof Application) {
                application = (Application) applicationContext;
                break;
            }
            applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
        }
        if (application == null && h1.K(3)) {
            Objects.toString(requireContext().getApplicationContext());
        }
        k6.d dVar = new k6.d(0);
        LinkedHashMap linkedHashMap = dVar.f71150a;
        if (application != null) {
            linkedHashMap.put(h6.i1.f59383d, application);
        }
        linkedHashMap.put(h6.y0.f59469a, this);
        linkedHashMap.put(h6.y0.f59470b, this);
        if (getArguments() != null) {
            linkedHashMap.put(h6.y0.f59471c, getArguments());
        }
        return dVar;
    }

    @Override // h6.n
    public h6.j1 getDefaultViewModelProviderFactory() {
        Application application;
        if (this.mFragmentManager == null) {
            throw new IllegalStateException("Can't access ViewModels from detached fragment");
        }
        if (this.mDefaultFactory == null) {
            Context applicationContext = requireContext().getApplicationContext();
            while (true) {
                if (!(applicationContext instanceof ContextWrapper)) {
                    application = null;
                    break;
                }
                if (applicationContext instanceof Application) {
                    application = (Application) applicationContext;
                    break;
                }
                applicationContext = ((ContextWrapper) applicationContext).getBaseContext();
            }
            if (application == null && h1.K(3)) {
                Objects.toString(requireContext().getApplicationContext());
            }
            this.mDefaultFactory = new h6.b1(application, this, getArguments());
        }
        return this.mDefaultFactory;
    }

    public int getEnterAnim() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return 0;
        }
        return e0Var.f14533b;
    }

    public Object getEnterTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        return e0Var.f14540i;
    }

    public n4.t0 getEnterTransitionCallback() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        e0Var.getClass();
        return null;
    }

    public int getExitAnim() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return 0;
        }
        return e0Var.f14534c;
    }

    public Object getExitTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        return e0Var.f14542k;
    }

    public n4.t0 getExitTransitionCallback() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        e0Var.getClass();
        return null;
    }

    public View getFocusedView() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        return e0Var.f14547r;
    }

    @Deprecated
    public final h1 getFragmentManager() {
        return this.mFragmentManager;
    }

    public final Object getHost() {
        s0 s0Var = this.mHost;
        if (s0Var == null) {
            return null;
        }
        return ((l0) s0Var).f14610e;
    }

    public final int getId() {
        return this.mFragmentId;
    }

    public final LayoutInflater getLayoutInflater() {
        LayoutInflater layoutInflater = this.mLayoutInflater;
        return layoutInflater == null ? performGetLayoutInflater(null) : layoutInflater;
    }

    @Override // h6.a0
    public h6.u getLifecycle() {
        return this.mLifecycleRegistry;
    }

    @Deprecated
    public n6.a getLoaderManager() {
        return n6.a.a(this);
    }

    public int getNextTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return 0;
        }
        return e0Var.f14537f;
    }

    public final h0 getParentFragment() {
        return this.mParentFragment;
    }

    public final h1 getParentFragmentManager() {
        h1 h1Var = this.mFragmentManager;
        if (h1Var != null) {
            return h1Var;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " not associated with a fragment manager."));
    }

    public boolean getPopDirection() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return false;
        }
        return e0Var.f14532a;
    }

    public int getPopEnterAnim() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return 0;
        }
        return e0Var.f14535d;
    }

    public int getPopExitAnim() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return 0;
        }
        return e0Var.f14536e;
    }

    public float getPostOnViewCreatedAlpha() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return 1.0f;
        }
        return e0Var.f14546q;
    }

    public Object getReenterTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        Object obj = e0Var.f14543l;
        return obj == USE_DEFAULT_TRANSITION ? getExitTransition() : obj;
    }

    public final Resources getResources() {
        return requireContext().getResources();
    }

    @Deprecated
    public final boolean getRetainInstance() {
        e6.c.f(this);
        return this.mRetainInstance;
    }

    public Object getReturnTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        Object obj = e0Var.f14541j;
        return obj == USE_DEFAULT_TRANSITION ? getEnterTransition() : obj;
    }

    @Override // a7.h
    public final a7.e getSavedStateRegistry() {
        return this.mSavedStateRegistryController.f442b;
    }

    public Object getSharedElementEnterTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        return e0Var.f14544m;
    }

    public Object getSharedElementReturnTransition() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return null;
        }
        Object obj = e0Var.n;
        return obj == USE_DEFAULT_TRANSITION ? getSharedElementEnterTransition() : obj;
    }

    public ArrayList<String> getSharedElementSourceNames() {
        ArrayList<String> arrayList;
        e0 e0Var = this.mAnimationInfo;
        return (e0Var == null || (arrayList = e0Var.f14538g) == null) ? new ArrayList<>() : arrayList;
    }

    public ArrayList<String> getSharedElementTargetNames() {
        ArrayList<String> arrayList;
        e0 e0Var = this.mAnimationInfo;
        return (e0Var == null || (arrayList = e0Var.f14539h) == null) ? new ArrayList<>() : arrayList;
    }

    public final String getString(int i5) {
        return getResources().getString(i5);
    }

    public final String getTag() {
        return this.mTag;
    }

    @Deprecated
    public final h0 getTargetFragment() {
        return k(true);
    }

    @Deprecated
    public final int getTargetRequestCode() {
        e6.c.g(this);
        return this.mTargetRequestCode;
    }

    public final CharSequence getText(int i5) {
        return getResources().getText(i5);
    }

    @Deprecated
    public boolean getUserVisibleHint() {
        return this.mUserVisibleHint;
    }

    public View getView() {
        return this.mView;
    }

    public h6.a0 getViewLifecycleOwner() {
        y1 y1Var = this.mViewLifecycleOwner;
        if (y1Var != null) {
            return y1Var;
        }
        throw new IllegalStateException(a80.m.g("Can't access the Fragment View's LifecycleOwner for ", this, " when getView() is null i.e., before onCreateView() or after onDestroyView()"));
    }

    public h6.j0 getViewLifecycleOwnerLiveData() {
        return this.mViewLifecycleOwnerLiveData;
    }

    @Override // h6.o1
    public h6.n1 getViewModelStore() {
        if (this.mFragmentManager == null) {
            throw new IllegalStateException("Can't access ViewModels from detached fragment");
        }
        int iJ = j();
        h6.t tVar = h6.t.f59440a;
        if (iJ == 1) {
            throw new IllegalStateException("Calling getViewModelStore() before a Fragment reaches onCreate() when using setMaxLifecycle(INITIALIZED) is not supported");
        }
        HashMap map = this.mFragmentManager.P.f14605c;
        h6.n1 n1Var = (h6.n1) map.get(this.mWho);
        if (n1Var != null) {
            return n1Var;
        }
        h6.n1 n1Var2 = new h6.n1();
        map.put(this.mWho, n1Var2);
        return n1Var2;
    }

    @SuppressLint({"KotlinPropertyAccess"})
    public final boolean hasOptionsMenu() {
        return this.mHasMenu;
    }

    public final int hashCode() {
        return super.hashCode();
    }

    public final e0 i() {
        if (this.mAnimationInfo == null) {
            this.mAnimationInfo = new e0();
        }
        return this.mAnimationInfo;
    }

    public void initState() {
        l();
        this.mPreviousWho = this.mWho;
        this.mWho = UUID.randomUUID().toString();
        this.mAdded = false;
        this.mRemoving = false;
        this.mFromLayout = false;
        this.mInLayout = false;
        this.mRestored = false;
        this.mBackStackNesting = 0;
        this.mFragmentManager = null;
        this.mChildFragmentManager = new i1();
        this.mHost = null;
        this.mFragmentId = 0;
        this.mContainerId = 0;
        this.mTag = null;
        this.mHidden = false;
        this.mDetached = false;
    }

    public final boolean isAdded() {
        return this.mHost != null && this.mAdded;
    }

    public final boolean isDetached() {
        return this.mDetached;
    }

    public final boolean isHidden() {
        if (this.mHidden) {
            return true;
        }
        h1 h1Var = this.mFragmentManager;
        if (h1Var != null) {
            h0 h0Var = this.mParentFragment;
            h1Var.getClass();
            if (h0Var == null ? false : h0Var.isHidden()) {
                return true;
            }
        }
        return false;
    }

    public final boolean isInBackStack() {
        return this.mBackStackNesting > 0;
    }

    public final boolean isInLayout() {
        return this.mInLayout;
    }

    public final boolean isMenuVisible() {
        if (!this.mMenuVisible) {
            return false;
        }
        if (this.mFragmentManager != null) {
            h0 h0Var = this.mParentFragment;
            if (!(h0Var == null ? true : h0Var.isMenuVisible())) {
                return false;
            }
        }
        return true;
    }

    public boolean isPostponed() {
        e0 e0Var = this.mAnimationInfo;
        if (e0Var == null) {
            return false;
        }
        return e0Var.f14548s;
    }

    public final boolean isRemoving() {
        return this.mRemoving;
    }

    public final boolean isResumed() {
        return this.mState >= 7;
    }

    public final boolean isStateSaved() {
        h1 h1Var = this.mFragmentManager;
        if (h1Var == null) {
            return false;
        }
        return h1Var.O();
    }

    public final boolean isVisible() {
        View view;
        return (!isAdded() || isHidden() || (view = this.mView) == null || view.getWindowToken() == null || this.mView.getVisibility() != 0) ? false : true;
    }

    public final int j() {
        h6.t tVar = this.mMaxState;
        return (tVar == h6.t.f59441b || this.mParentFragment == null) ? tVar.ordinal() : Math.min(tVar.ordinal(), this.mParentFragment.j());
    }

    public final h0 k(boolean z11) {
        String str;
        if (z11) {
            e6.c.h(this);
        }
        h0 h0Var = this.mTarget;
        if (h0Var != null) {
            return h0Var;
        }
        h1 h1Var = this.mFragmentManager;
        if (h1Var == null || (str = this.mTargetWho) == null) {
            return null;
        }
        return h1Var.f14571c.b(str);
    }

    public final void l() {
        this.mLifecycleRegistry = new h6.c0(this);
        this.mSavedStateRegistryController = new a7.g(new c7.a(this, new a7.f(this, 0)));
        this.mDefaultFactory = null;
        if (this.mOnPreAttachedListeners.contains(this.mSavedStateAttachListener)) {
            return;
        }
        f0 f0Var = this.mSavedStateAttachListener;
        if (this.mState >= 0) {
            f0Var.a();
        } else {
            this.mOnPreAttachedListeners.add(f0Var);
        }
    }

    public final x m(k.b bVar, u.a aVar, j.a aVar2) {
        if (this.mState > 1) {
            throw new IllegalStateException(a80.m.g("Fragment ", this, " is attempting to registerForActivityResult after being created. Fragments must call registerForActivityResult() before they are created (i.e. initialization, onAttach(), or onCreate())."));
        }
        AtomicReference atomicReference = new AtomicReference();
        d0 d0Var = new d0(this, aVar, atomicReference, bVar, aVar2);
        if (this.mState >= 0) {
            d0Var.a();
        } else {
            this.mOnPreAttachedListeners.add(d0Var);
        }
        return new x(atomicReference);
    }

    public void noteStateNotSaved() {
        this.mChildFragmentManager.Q();
    }

    @Deprecated
    public void onActivityCreated(Bundle bundle) {
        this.mCalled = true;
    }

    @Deprecated
    public void onActivityResult(int i5, int i11, Intent intent) {
        if (h1.K(2)) {
            toString();
            Objects.toString(intent);
        }
    }

    public void onAttach(Context context) {
        this.mCalled = true;
        s0 s0Var = this.mHost;
        m0 m0Var = s0Var == null ? null : s0Var.f14681a;
        if (m0Var != null) {
            this.mCalled = false;
            onAttach((Activity) m0Var);
        }
    }

    @Deprecated
    public void onAttachFragment(h0 h0Var) {
    }

    @Override // android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration configuration) {
        this.mCalled = true;
    }

    public boolean onContextItemSelected(MenuItem menuItem) {
        return false;
    }

    public void onCreate(Bundle bundle) {
        this.mCalled = true;
        restoreChildFragmentState();
        h1 h1Var = this.mChildFragmentManager;
        if (h1Var.f14588v >= 1) {
            return;
        }
        h1Var.I = false;
        h1Var.J = false;
        h1Var.P.f14608f = false;
        h1Var.u(1);
    }

    public Animation onCreateAnimation(int i5, boolean z11, int i11) {
        return null;
    }

    public Animator onCreateAnimator(int i5, boolean z11, int i11) {
        return null;
    }

    @Override // android.view.View.OnCreateContextMenuListener
    public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
        requireActivity().onCreateContextMenu(contextMenu, view, contextMenuInfo);
    }

    @Deprecated
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        int i5 = this.mContentLayoutId;
        if (i5 != 0) {
            return layoutInflater.inflate(i5, viewGroup, false);
        }
        return null;
    }

    public void onDestroy() {
        this.mCalled = true;
    }

    @Deprecated
    public void onDestroyOptionsMenu() {
    }

    public void onDestroyView() {
        this.mCalled = true;
    }

    public void onDetach() {
        this.mCalled = true;
    }

    public LayoutInflater onGetLayoutInflater(Bundle bundle) {
        return getLayoutInflater(bundle);
    }

    public void onHiddenChanged(boolean z11) {
    }

    public void onInflate(Context context, AttributeSet attributeSet, Bundle bundle) {
        this.mCalled = true;
        s0 s0Var = this.mHost;
        m0 m0Var = s0Var == null ? null : s0Var.f14681a;
        if (m0Var != null) {
            this.mCalled = false;
            onInflate((Activity) m0Var, attributeSet, bundle);
        }
    }

    @Override // android.content.ComponentCallbacks
    public void onLowMemory() {
        this.mCalled = true;
    }

    public void onMultiWindowModeChanged(boolean z11) {
    }

    @Deprecated
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        return false;
    }

    @Deprecated
    public void onOptionsMenuClosed(Menu menu) {
    }

    public void onPause() {
        this.mCalled = true;
    }

    public void onPictureInPictureModeChanged(boolean z11) {
    }

    @Deprecated
    public void onPrepareOptionsMenu(Menu menu) {
    }

    public void onPrimaryNavigationFragmentChanged(boolean z11) {
    }

    @Deprecated
    public void onRequestPermissionsResult(int i5, String[] strArr, int[] iArr) {
    }

    public void onResume() {
        this.mCalled = true;
    }

    public void onSaveInstanceState(Bundle bundle) {
    }

    public void onStart() {
        this.mCalled = true;
    }

    public void onStop() {
        this.mCalled = true;
    }

    public void onViewCreated(View view, Bundle bundle) {
    }

    public void onViewStateRestored(Bundle bundle) {
        this.mCalled = true;
    }

    public void performActivityCreated(Bundle bundle) {
        this.mChildFragmentManager.Q();
        this.mState = 3;
        this.mCalled = false;
        onActivityCreated(bundle);
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onActivityCreated()"));
        }
        if (h1.K(3)) {
            toString();
        }
        if (this.mView != null) {
            Bundle bundle2 = this.mSavedFragmentState;
            restoreViewState(bundle2 != null ? bundle2.getBundle("savedInstanceState") : null);
        }
        this.mSavedFragmentState = null;
        h1 h1Var = this.mChildFragmentManager;
        h1Var.I = false;
        h1Var.J = false;
        h1Var.P.f14608f = false;
        h1Var.u(4);
    }

    public void performAttach() {
        Iterator<f0> it = this.mOnPreAttachedListeners.iterator();
        while (it.hasNext()) {
            it.next().a();
        }
        this.mOnPreAttachedListeners.clear();
        this.mChildFragmentManager.b(this.mHost, createFragmentContainer(), this);
        this.mState = 0;
        this.mCalled = false;
        onAttach((Context) this.mHost.f14682b);
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onAttach()"));
        }
        Iterator it2 = this.mFragmentManager.f14582p.iterator();
        while (it2.hasNext()) {
            ((l1) it2.next()).a(this);
        }
        h1 h1Var = this.mChildFragmentManager;
        h1Var.I = false;
        h1Var.J = false;
        h1Var.P.f14608f = false;
        h1Var.u(0);
    }

    public void performConfigurationChanged(Configuration configuration) {
        onConfigurationChanged(configuration);
    }

    public boolean performContextItemSelected(MenuItem menuItem) {
        if (this.mHidden) {
            return false;
        }
        if (onContextItemSelected(menuItem)) {
            return true;
        }
        return this.mChildFragmentManager.j(menuItem);
    }

    public void performCreate(Bundle bundle) {
        this.mChildFragmentManager.Q();
        this.mState = 1;
        this.mCalled = false;
        this.mLifecycleRegistry.a(new b0(this));
        onCreate(bundle);
        this.mIsCreated = true;
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onCreate()"));
        }
        this.mLifecycleRegistry.f(h6.s.ON_CREATE);
    }

    public boolean performCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        boolean z11 = false;
        if (this.mHidden) {
            return false;
        }
        if (this.mHasMenu && this.mMenuVisible) {
            onCreateOptionsMenu(menu, menuInflater);
            z11 = true;
        }
        return this.mChildFragmentManager.k(menu, menuInflater) | z11;
    }

    public void performCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.mChildFragmentManager.Q();
        this.mPerformedCreateView = true;
        this.mViewLifecycleOwner = new y1(this, getViewModelStore(), new w(this, 0));
        View viewOnCreateView = onCreateView(layoutInflater, viewGroup, bundle);
        this.mView = viewOnCreateView;
        if (viewOnCreateView == null) {
            if (this.mViewLifecycleOwner.c()) {
                throw new IllegalStateException("Called getViewLifecycleOwner() but onCreateView() returned null");
            }
            this.mViewLifecycleOwner = null;
            return;
        }
        this.mViewLifecycleOwner.b();
        if (h1.K(3)) {
            Objects.toString(this.mView);
            toString();
        }
        h6.y0.f(this.mView, this.mViewLifecycleOwner);
        h6.y0.g(this.mView, this.mViewLifecycleOwner);
        u90.b.a0(this.mView, this.mViewLifecycleOwner);
        this.mViewLifecycleOwnerLiveData.j(this.mViewLifecycleOwner);
    }

    public void performDestroy() {
        this.mChildFragmentManager.l();
        this.mLifecycleRegistry.f(h6.s.ON_DESTROY);
        this.mState = 0;
        this.mCalled = false;
        this.mIsCreated = false;
        onDestroy();
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onDestroy()"));
        }
    }

    public void performDestroyView() {
        this.mChildFragmentManager.u(1);
        if (this.mView != null && ((h6.c0) this.mViewLifecycleOwner.getLifecycle()).f59342d.compareTo(h6.t.f59442c) >= 0) {
            this.mViewLifecycleOwner.a(h6.s.ON_DESTROY);
        }
        this.mState = 1;
        this.mCalled = false;
        onDestroyView();
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onDestroyView()"));
        }
        n6.a.a(this).c();
        this.mPerformedCreateView = false;
    }

    public void performDetach() {
        this.mState = -1;
        this.mCalled = false;
        onDetach();
        this.mLayoutInflater = null;
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onDetach()"));
        }
        h1 h1Var = this.mChildFragmentManager;
        if (h1Var.K) {
            return;
        }
        h1Var.l();
        this.mChildFragmentManager = new i1();
    }

    public LayoutInflater performGetLayoutInflater(Bundle bundle) {
        LayoutInflater layoutInflaterOnGetLayoutInflater = onGetLayoutInflater(bundle);
        this.mLayoutInflater = layoutInflaterOnGetLayoutInflater;
        return layoutInflaterOnGetLayoutInflater;
    }

    public void performLowMemory() {
        onLowMemory();
    }

    public void performMultiWindowModeChanged(boolean z11) {
        onMultiWindowModeChanged(z11);
    }

    public boolean performOptionsItemSelected(MenuItem menuItem) {
        if (this.mHidden) {
            return false;
        }
        if (this.mHasMenu && this.mMenuVisible && onOptionsItemSelected(menuItem)) {
            return true;
        }
        return this.mChildFragmentManager.p(menuItem);
    }

    public void performOptionsMenuClosed(Menu menu) {
        if (this.mHidden) {
            return;
        }
        if (this.mHasMenu && this.mMenuVisible) {
            onOptionsMenuClosed(menu);
        }
        this.mChildFragmentManager.q(menu);
    }

    public void performPause() {
        this.mChildFragmentManager.u(5);
        if (this.mView != null) {
            this.mViewLifecycleOwner.a(h6.s.ON_PAUSE);
        }
        this.mLifecycleRegistry.f(h6.s.ON_PAUSE);
        this.mState = 6;
        this.mCalled = false;
        onPause();
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onPause()"));
        }
    }

    public void performPictureInPictureModeChanged(boolean z11) {
        onPictureInPictureModeChanged(z11);
    }

    public boolean performPrepareOptionsMenu(Menu menu) {
        boolean z11 = false;
        if (this.mHidden) {
            return false;
        }
        if (this.mHasMenu && this.mMenuVisible) {
            onPrepareOptionsMenu(menu);
            z11 = true;
        }
        return this.mChildFragmentManager.t(menu) | z11;
    }

    public void performPrimaryNavigationFragmentChanged() {
        this.mFragmentManager.getClass();
        boolean zN = h1.N(this);
        Boolean bool = this.mIsPrimaryNavigationFragment;
        if (bool == null || bool.booleanValue() != zN) {
            this.mIsPrimaryNavigationFragment = Boolean.valueOf(zN);
            onPrimaryNavigationFragmentChanged(zN);
            h1 h1Var = this.mChildFragmentManager;
            h1Var.f0();
            h1Var.r(h1Var.f14592z);
        }
    }

    public void performResume() {
        this.mChildFragmentManager.Q();
        this.mChildFragmentManager.A(true);
        this.mState = 7;
        this.mCalled = false;
        onResume();
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onResume()"));
        }
        h6.c0 c0Var = this.mLifecycleRegistry;
        h6.s sVar = h6.s.ON_RESUME;
        c0Var.f(sVar);
        if (this.mView != null) {
            this.mViewLifecycleOwner.a(sVar);
        }
        h1 h1Var = this.mChildFragmentManager;
        h1Var.I = false;
        h1Var.J = false;
        h1Var.P.f14608f = false;
        h1Var.u(7);
    }

    public void performSaveInstanceState(Bundle bundle) {
        onSaveInstanceState(bundle);
    }

    public void performStart() {
        this.mChildFragmentManager.Q();
        this.mChildFragmentManager.A(true);
        this.mState = 5;
        this.mCalled = false;
        onStart();
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onStart()"));
        }
        h6.c0 c0Var = this.mLifecycleRegistry;
        h6.s sVar = h6.s.ON_START;
        c0Var.f(sVar);
        if (this.mView != null) {
            this.mViewLifecycleOwner.a(sVar);
        }
        h1 h1Var = this.mChildFragmentManager;
        h1Var.I = false;
        h1Var.J = false;
        h1Var.P.f14608f = false;
        h1Var.u(5);
    }

    public void performStop() {
        h1 h1Var = this.mChildFragmentManager;
        h1Var.J = true;
        h1Var.P.f14608f = true;
        h1Var.u(4);
        if (this.mView != null) {
            this.mViewLifecycleOwner.a(h6.s.ON_STOP);
        }
        this.mLifecycleRegistry.f(h6.s.ON_STOP);
        this.mState = 4;
        this.mCalled = false;
        onStop();
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onStop()"));
        }
    }

    public void performViewCreated() {
        Bundle bundle = this.mSavedFragmentState;
        onViewCreated(this.mView, bundle != null ? bundle.getBundle("savedInstanceState") : null);
        this.mChildFragmentManager.u(2);
    }

    public void postponeEnterTransition() {
        i().f14548s = true;
    }

    @Override // j.b
    public final <I, O> j.c registerForActivityResult(k.b bVar, j.a aVar) {
        return m(bVar, new c0(this, 0), aVar);
    }

    public void registerForContextMenu(View view) {
        view.setOnCreateContextMenuListener(this);
    }

    @Deprecated
    public final void requestPermissions(String[] permissions, int i5) throws Exception {
        if (this.mHost == null) {
            throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to Activity"));
        }
        h1 parentFragmentManager = getParentFragmentManager();
        if (parentFragmentManager.F == null) {
            parentFragmentManager.f14589w.getClass();
            Intrinsics.g(permissions, "permissions");
        } else {
            parentFragmentManager.G.addLast(new FragmentManager$LaunchedFragmentInfo(this.mWho, i5));
            parentFragmentManager.F.a(permissions, null);
        }
    }

    public final m0 requireActivity() {
        m0 activity = getActivity();
        if (activity != null) {
            return activity;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to an activity."));
    }

    public final Bundle requireArguments() {
        Bundle arguments = getArguments();
        if (arguments != null) {
            return arguments;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " does not have any arguments."));
    }

    public final Context requireContext() {
        Context context = getContext();
        if (context != null) {
            return context;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to a context."));
    }

    @Deprecated
    public final h1 requireFragmentManager() {
        return getParentFragmentManager();
    }

    public final Object requireHost() {
        Object host = getHost();
        if (host != null) {
            return host;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to a host."));
    }

    public final h0 requireParentFragment() {
        h0 parentFragment = getParentFragment();
        if (parentFragment != null) {
            return parentFragment;
        }
        if (getContext() == null) {
            throw new IllegalStateException(a80.m.g("Fragment ", this, " is not attached to any Fragment or host"));
        }
        throw new IllegalStateException("Fragment " + this + " is not a child Fragment, it is directly attached to " + getContext());
    }

    public final View requireView() {
        View view = getView();
        if (view != null) {
            return view;
        }
        throw new IllegalStateException(a80.m.g("Fragment ", this, " did not return a View from onCreateView() or this was called before onCreateView()."));
    }

    public void restoreChildFragmentState() {
        Bundle bundle;
        Bundle bundle2 = this.mSavedFragmentState;
        if (bundle2 == null || (bundle = bundle2.getBundle("childFragmentManager")) == null) {
            return;
        }
        this.mChildFragmentManager.W(bundle);
        h1 h1Var = this.mChildFragmentManager;
        h1Var.I = false;
        h1Var.J = false;
        h1Var.P.f14608f = false;
        h1Var.u(1);
    }

    public final void restoreViewState(Bundle bundle) {
        SparseArray<Parcelable> sparseArray = this.mSavedViewState;
        if (sparseArray != null) {
            this.mView.restoreHierarchyState(sparseArray);
            this.mSavedViewState = null;
        }
        this.mCalled = false;
        onViewStateRestored(bundle);
        if (!this.mCalled) {
            throw new g2(a80.m.g("Fragment ", this, " did not call through to super.onViewStateRestored()"));
        }
        if (this.mView != null) {
            this.mViewLifecycleOwner.a(h6.s.ON_CREATE);
        }
    }

    public void setAllowEnterTransitionOverlap(boolean z11) {
        i().f14545p = Boolean.valueOf(z11);
    }

    public void setAllowReturnTransitionOverlap(boolean z11) {
        i().o = Boolean.valueOf(z11);
    }

    public void setAnimations(int i5, int i11, int i12, int i13) {
        if (this.mAnimationInfo == null && i5 == 0 && i11 == 0 && i12 == 0 && i13 == 0) {
            return;
        }
        i().f14533b = i5;
        i().f14534c = i11;
        i().f14535d = i12;
        i().f14536e = i13;
    }

    public void setArguments(Bundle bundle) {
        if (this.mFragmentManager != null && isStateSaved()) {
            throw new IllegalStateException("Fragment already added and state has been saved");
        }
        this.mArguments = bundle;
    }

    public void setEnterSharedElementCallback(n4.t0 t0Var) {
        i().getClass();
    }

    public void setEnterTransition(Object obj) {
        i().f14540i = obj;
    }

    public void setExitSharedElementCallback(n4.t0 t0Var) {
        i().getClass();
    }

    public void setExitTransition(Object obj) {
        i().f14542k = obj;
    }

    public void setFocusedView(View view) {
        i().f14547r = view;
    }

    @Deprecated
    public void setHasOptionsMenu(boolean z11) {
        if (this.mHasMenu != z11) {
            this.mHasMenu = z11;
            if (!isAdded() || isHidden()) {
                return;
            }
            ((l0) this.mHost).f14610e.invalidateMenu();
        }
    }

    public void setInitialSavedState(Fragment$SavedState fragment$SavedState) {
        Bundle bundle;
        if (this.mFragmentManager != null) {
            throw new IllegalStateException("Fragment already added");
        }
        if (fragment$SavedState == null || (bundle = fragment$SavedState.f14451a) == null) {
            bundle = null;
        }
        this.mSavedFragmentState = bundle;
    }

    public void setMenuVisibility(boolean z11) {
        if (this.mMenuVisible != z11) {
            this.mMenuVisible = z11;
            if (this.mHasMenu && isAdded() && !isHidden()) {
                ((l0) this.mHost).f14610e.invalidateMenu();
            }
        }
    }

    public void setNextTransition(int i5) {
        if (this.mAnimationInfo == null && i5 == 0) {
            return;
        }
        i();
        this.mAnimationInfo.f14537f = i5;
    }

    public void setPopDirection(boolean z11) {
        if (this.mAnimationInfo == null) {
            return;
        }
        i().f14532a = z11;
    }

    public void setPostOnViewCreatedAlpha(float f11) {
        i().f14546q = f11;
    }

    public void setReenterTransition(Object obj) {
        i().f14543l = obj;
    }

    @Deprecated
    public void setRetainInstance(boolean z11) {
        e6.c.i(this);
        this.mRetainInstance = z11;
        h1 h1Var = this.mFragmentManager;
        if (h1Var == null) {
            this.mRetainInstanceChangedWhileDetached = true;
        } else if (z11) {
            h1Var.P.e(this);
        } else {
            h1Var.P.g(this);
        }
    }

    public void setReturnTransition(Object obj) {
        i().f14541j = obj;
    }

    public void setSharedElementEnterTransition(Object obj) {
        i().f14544m = obj;
    }

    public void setSharedElementNames(ArrayList<String> arrayList, ArrayList<String> arrayList2) {
        i();
        e0 e0Var = this.mAnimationInfo;
        e0Var.f14538g = arrayList;
        e0Var.f14539h = arrayList2;
    }

    public void setSharedElementReturnTransition(Object obj) {
        i().n = obj;
    }

    @Deprecated
    public void setTargetFragment(h0 h0Var, int i5) {
        if (h0Var != null) {
            e6.c.j(this, h0Var, i5);
        }
        h1 h1Var = this.mFragmentManager;
        h1 h1Var2 = h0Var != null ? h0Var.mFragmentManager : null;
        if (h1Var != null && h1Var2 != null && h1Var != h1Var2) {
            throw new IllegalArgumentException(a80.m.g("Fragment ", h0Var, " must share the same FragmentManager to be set as a target fragment"));
        }
        for (h0 h0VarK = h0Var; h0VarK != null; h0VarK = h0VarK.k(false)) {
            if (h0VarK.equals(this)) {
                throw new IllegalArgumentException("Setting " + h0Var + " as the target of " + this + " would create a target cycle");
            }
        }
        if (h0Var == null) {
            this.mTargetWho = null;
            this.mTarget = null;
        } else if (this.mFragmentManager == null || h0Var.mFragmentManager == null) {
            this.mTargetWho = null;
            this.mTarget = h0Var;
        } else {
            this.mTargetWho = h0Var.mWho;
            this.mTarget = null;
        }
        this.mTargetRequestCode = i5;
    }

    @Deprecated
    public void setUserVisibleHint(boolean z11) {
        e6.c.k(this, z11);
        boolean z12 = false;
        if (!this.mUserVisibleHint && z11 && this.mState < 5 && this.mFragmentManager != null && isAdded() && this.mIsCreated) {
            h1 h1Var = this.mFragmentManager;
            n1 n1VarG = h1Var.g(this);
            h0 h0VarI = n1VarG.i();
            if (h0VarI.mDeferStart) {
                if (h1Var.f14570b) {
                    h1Var.L = true;
                } else {
                    h0VarI.mDeferStart = false;
                    n1VarG.j();
                }
            }
        }
        this.mUserVisibleHint = z11;
        if (this.mState < 5 && !z11) {
            z12 = true;
        }
        this.mDeferStart = z12;
        if (this.mSavedFragmentState != null) {
            this.mSavedUserVisibleHint = Boolean.valueOf(z11);
        }
    }

    public boolean shouldShowRequestPermissionRationale(String str) {
        s0 s0Var = this.mHost;
        if (s0Var != null) {
            return n4.b.j(((l0) s0Var).f14610e, str);
        }
        return false;
    }

    public void startActivity(Intent intent) {
        startActivity(intent, null);
    }

    @Deprecated
    public void startActivityForResult(Intent intent, int i5) {
        startActivityForResult(intent, i5, null);
    }

    @Deprecated
    public void startIntentSenderForResult(IntentSender intent, int i5, Intent intent2, int i11, int i12, int i13, Bundle bundle) throws IntentSender.SendIntentException {
        if (this.mHost == null) {
            throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to Activity"));
        }
        if (h1.K(2)) {
            toString();
            Objects.toString(intent);
            Objects.toString(intent2);
            Objects.toString(bundle);
        }
        h1 parentFragmentManager = getParentFragmentManager();
        if (parentFragmentManager.E == null) {
            s0 s0Var = parentFragmentManager.f14589w;
            s0Var.getClass();
            Intrinsics.g(intent, "intent");
            if (i5 != -1) {
                throw new IllegalStateException("Starting intent sender with a requestCode requires a FragmentActivity host");
            }
            m0 m0Var = s0Var.f14681a;
            if (m0Var == null) {
                throw new IllegalStateException("Starting intent sender with a requestCode requires a FragmentActivity host");
            }
            n4.b.l(m0Var, intent, i5, intent2, i11, i12, i13, bundle);
            return;
        }
        if (bundle != null) {
            if (intent2 == null) {
                intent2 = new Intent();
                intent2.putExtra("androidx.fragment.extra.ACTIVITY_OPTIONS_BUNDLE", true);
            }
            if (h1.K(2)) {
                bundle.toString();
                intent2.toString();
                Objects.toString(this);
            }
            intent2.putExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE", bundle);
        }
        fk.l lVar = new fk.l(intent);
        lVar.w(intent2);
        lVar.x(i12, i11);
        IntentSenderRequest intentSenderRequestB = lVar.b();
        parentFragmentManager.G.addLast(new FragmentManager$LaunchedFragmentInfo(this.mWho, i5));
        if (h1.K(2)) {
            toString();
        }
        parentFragmentManager.E.a(intentSenderRequestB, null);
    }

    public void startPostponedEnterTransition() {
        if (this.mAnimationInfo == null || !i().f14548s) {
            return;
        }
        if (this.mHost == null) {
            i().f14548s = false;
        } else if (Looper.myLooper() != this.mHost.f14683c.getLooper()) {
            this.mHost.f14683c.postAtFrontOfQueue(new y(this, 1));
        } else {
            callStartTransitionListener(true);
        }
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder(128);
        sb2.append(getClass().getSimpleName());
        sb2.append("{");
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append("} (");
        sb2.append(this.mWho);
        if (this.mFragmentId != 0) {
            sb2.append(" id=0x");
            sb2.append(Integer.toHexString(this.mFragmentId));
        }
        if (this.mTag != null) {
            sb2.append(" tag=");
            sb2.append(this.mTag);
        }
        sb2.append(")");
        return sb2.toString();
    }

    public void unregisterForContextMenu(View view) {
        view.setOnCreateContextMenuListener(null);
    }

    @Deprecated
    public static h0 instantiate(Context context, String str, Bundle bundle) throws IllegalAccessException, InstantiationException, IllegalArgumentException, InvocationTargetException {
        try {
            h0 h0VarNewInstance = r0.loadFragmentClass(context.getClassLoader(), str).getConstructor(null).newInstance(null);
            if (bundle == null) {
                return h0VarNewInstance;
            }
            bundle.setClassLoader(h0VarNewInstance.getClass().getClassLoader());
            h0VarNewInstance.setArguments(bundle);
            return h0VarNewInstance;
        } catch (IllegalAccessException e3) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": make sure class name exists, is public, and has an empty constructor that is public"), e3);
        } catch (InstantiationException e11) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": make sure class name exists, is public, and has an empty constructor that is public"), e11);
        } catch (NoSuchMethodException e12) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": could not find Fragment constructor"), e12);
        } catch (InvocationTargetException e13) {
            throw new Fragment$InstantiationException(b.c0.l("Unable to instantiate fragment ", str, ": calling Fragment constructor caused an exception"), e13);
        }
    }

    public final String getString(int i5, Object... objArr) {
        return getResources().getString(i5, objArr);
    }

    public final void postponeEnterTransition(long j11, TimeUnit timeUnit) {
        i().f14548s = true;
        Handler handler = this.mPostponedHandler;
        if (handler != null) {
            handler.removeCallbacks(this.mPostponedDurationRunnable);
        }
        h1 h1Var = this.mFragmentManager;
        if (h1Var != null) {
            this.mPostponedHandler = h1Var.f14589w.f14683c;
        } else {
            this.mPostponedHandler = new Handler(Looper.getMainLooper());
        }
        this.mPostponedHandler.removeCallbacks(this.mPostponedDurationRunnable);
        this.mPostponedHandler.postDelayed(this.mPostponedDurationRunnable, timeUnit.toMillis(j11));
    }

    public final <I, O> j.c registerForActivityResult(k.b bVar, j.i iVar, j.a aVar) {
        return m(bVar, new c0(iVar, 1), aVar);
    }

    public void startActivity(Intent intent, Bundle bundle) {
        s0 s0Var = this.mHost;
        if (s0Var == null) {
            throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to Activity"));
        }
        Intrinsics.g(intent, "intent");
        s0Var.f14682b.startActivity(intent, bundle);
    }

    @Deprecated
    public void startActivityForResult(Intent intent, int i5, Bundle bundle) {
        if (this.mHost == null) {
            throw new IllegalStateException(a80.m.g("Fragment ", this, " not attached to Activity"));
        }
        h1 parentFragmentManager = getParentFragmentManager();
        if (parentFragmentManager.D != null) {
            parentFragmentManager.G.addLast(new FragmentManager$LaunchedFragmentInfo(this.mWho, i5));
            if (bundle != null) {
                intent.putExtra("androidx.activity.result.contract.extra.ACTIVITY_OPTIONS_BUNDLE", bundle);
            }
            parentFragmentManager.D.a(intent, null);
            return;
        }
        s0 s0Var = parentFragmentManager.f14589w;
        s0Var.getClass();
        Intrinsics.g(intent, "intent");
        if (i5 != -1) {
            throw new IllegalStateException("Starting activity with a requestCode requires a FragmentActivity host");
        }
        s0Var.f14682b.startActivity(intent, bundle);
    }

    @Deprecated
    public LayoutInflater getLayoutInflater(Bundle bundle) {
        s0 s0Var = this.mHost;
        if (s0Var != null) {
            m0 m0Var = ((l0) s0Var).f14610e;
            LayoutInflater layoutInflaterCloneInContext = m0Var.getLayoutInflater().cloneInContext(m0Var);
            i30.j.S(layoutInflaterCloneInContext, this.mChildFragmentManager.f14574f);
            return layoutInflaterCloneInContext;
        }
        throw new IllegalStateException("onGetLayoutInflater() cannot be executed until the Fragment is attached to the FragmentManager.");
    }

    @Deprecated
    public void onAttach(Activity activity) {
        this.mCalled = true;
    }

    @Deprecated
    public void onInflate(Activity activity, AttributeSet attributeSet, Bundle bundle) {
        this.mCalled = true;
    }

    public h0(int i5) {
        this();
        this.mContentLayoutId = i5;
    }
}
