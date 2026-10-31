package androidx.recyclerview.widget;

import android.animation.LayoutTransition;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.os.Trace;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Display;
import android.view.FocusFinder;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import android.widget.EdgeEffect;
import android.widget.OverScroller;
import androidx.compose.ui.node.LayoutNode;
import androidx.core.view.ScrollingView;
import androidx.customview.view.AbsSavedState;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public class RecyclerView extends ViewGroup implements ScrollingView, a5.v {
    static final int DEFAULT_ORIENTATION = 1;
    static final boolean DISPATCH_TEMP_DETACH = false;
    private static final float FLING_DESTRETCH_FACTOR = 4.0f;
    static final long FOREVER_NS = Long.MAX_VALUE;
    public static final int HORIZONTAL = 0;
    private static final float INFLEXION = 0.35f;
    private static final int INVALID_POINTER = -1;
    public static final int INVALID_TYPE = -1;
    private static final Class<?>[] LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE;
    static final int MAX_SCROLL_DURATION = 2000;
    public static final long NO_ID = -1;
    public static final int NO_POSITION = -1;
    private static final float SCROLL_FRICTION = 0.015f;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    static final String TAG = "RecyclerView";
    public static final int TOUCH_SLOP_DEFAULT = 0;
    public static final int TOUCH_SLOP_PAGING = 1;
    static final String TRACE_BIND_VIEW_TAG = "RV OnBindView";
    static final String TRACE_CREATE_VIEW_TAG = "RV CreateView";
    private static final String TRACE_HANDLE_ADAPTER_UPDATES_TAG = "RV PartialInvalidate";
    static final String TRACE_NESTED_PREFETCH_TAG = "RV Nested Prefetch";
    private static final String TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG = "RV FullInvalidate";
    private static final String TRACE_ON_LAYOUT_TAG = "RV OnLayout";
    static final String TRACE_PREFETCH_TAG = "RV Prefetch";
    static final String TRACE_SCROLL_TAG = "RV Scroll";
    public static final int UNDEFINED_DURATION = Integer.MIN_VALUE;
    static final boolean VERBOSE_TRACING = false;
    public static final int VERTICAL = 1;
    static boolean sDebugAssertionsEnabled = false;
    static final p2 sDefaultEdgeEffectFactory;
    static final Interpolator sQuinticInterpolator;
    static boolean sVerboseLoggingEnabled = false;
    u2 mAccessibilityDelegate;
    private final AccessibilityManager mAccessibilityManager;
    m1 mAdapter;
    b mAdapterHelper;
    boolean mAdapterUpdateDuringMeasure;
    private EdgeEffect mBottomGlow;
    private p1 mChildDrawingOrderCallback;
    i mChildHelper;
    boolean mClipToPadding;
    boolean mDataSetHasChangedAfterLayout;
    boolean mDispatchItemsChangedEvent;
    private int mDispatchScrollCounter;
    private int mEatenAccessibilityChangeFlags;
    private q1 mEdgeEffectFactory;
    boolean mEnableFastScroller;
    boolean mFirstLayoutComplete;
    f0 mGapWorker;
    boolean mHasFixedSize;
    private boolean mIgnoreMotionEventTillDown;
    private int mInitialTouchX;
    private int mInitialTouchY;
    private int mInterceptRequestLayoutDepth;
    private d2 mInterceptingOnItemTouchListener;
    boolean mIsAttached;
    u1 mItemAnimator;
    private s1 mItemAnimatorListener;
    private Runnable mItemAnimatorRunner;
    final ArrayList<v1> mItemDecorations;
    boolean mItemsAddedOrRemoved;
    boolean mItemsChanged;
    private int mLastAutoMeasureNonExactMeasuredHeight;
    private int mLastAutoMeasureNonExactMeasuredWidth;
    private boolean mLastAutoMeasureSkippedDueToExact;
    private int mLastTouchX;
    private int mLastTouchY;
    z1 mLayout;
    private int mLayoutOrScrollCounter;
    boolean mLayoutSuppressed;
    boolean mLayoutWasDefered;
    private EdgeEffect mLeftGlow;
    private final int mMaxFlingVelocity;
    private final int mMinFlingVelocity;
    private final int[] mMinMaxLayoutPositions;
    private final int[] mNestedOffsets;
    private final j2 mObserver;
    private List<b2> mOnChildAttachStateListeners;
    private c2 mOnFlingListener;
    private final ArrayList<d2> mOnItemTouchListeners;
    final List<s2> mPendingAccessibilityImportanceChange;
    SavedState mPendingSavedState;
    private final float mPhysicalCoef;
    boolean mPostedAnimatorRunner;
    d0 mPrefetchRegistry;
    private boolean mPreserveFocusAfterLayout;
    final h2 mRecycler;
    i2 mRecyclerListener;
    final List<i2> mRecyclerListeners;
    final int[] mReusableIntPair;
    private EdgeEffect mRightGlow;
    private float mScaledHorizontalScrollFactor;
    private float mScaledVerticalScrollFactor;
    private e2 mScrollListener;
    private List<e2> mScrollListeners;
    private final int[] mScrollOffset;
    private int mScrollPointerId;
    private int mScrollState;
    private a5.w mScrollingChildHelper;
    final o2 mState;
    final Rect mTempRect;
    private final Rect mTempRect2;
    final RectF mTempRectF;
    private EdgeEffect mTopGlow;
    private int mTouchSlop;
    final Runnable mUpdateChildViewsRunnable;
    private VelocityTracker mVelocityTracker;
    final r2 mViewFlinger;
    private final i3 mViewInfoProcessCallback;
    final j3 mViewInfoStore;
    private static final int[] NESTED_SCROLLING_ATTRS = {16843830};
    private static final float DECELERATION_RATE = (float) (Math.log(0.78d) / Math.log(0.9d));
    static final boolean FORCE_INVALIDATE_DISPLAY_LIST = false;
    static final boolean ALLOW_SIZE_IN_UNSPECIFIED_SPEC = true;
    static final boolean POST_UPDATES_ON_ANIMATION = true;
    static final boolean ALLOW_THREAD_GAP_WORK = true;
    private static final boolean FORCE_ABS_FOCUS_SEARCH_DIRECTION = false;
    private static final boolean IGNORE_DETACHED_FOCUSED_CHILD = false;

    static {
        Class cls = Integer.TYPE;
        LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE = new Class[]{Context.class, AttributeSet.class, cls, cls};
        sQuinticInterpolator = new j1(0);
        sDefaultEdgeEffectFactory = new p2();
    }

    public RecyclerView(Context context) {
        this(context, null);
    }

    private void addAnimatingView(s2 s2Var) {
        View view = s2Var.itemView;
        boolean z11 = view.getParent() == this;
        this.mRecycler.m(getChildViewHolder(view));
        if (s2Var.isTmpDetached()) {
            this.mChildHelper.b(view, -1, view.getLayoutParams(), true);
            return;
        }
        if (!z11) {
            this.mChildHelper.a(view, -1, true);
            return;
        }
        i iVar = this.mChildHelper;
        int iIndexOfChild = iVar.f14993a.f15030a.indexOfChild(view);
        if (iIndexOfChild >= 0) {
            iVar.f14994b.h(iIndexOfChild);
            iVar.i(view);
        } else {
            throw new IllegalArgumentException("view is not a child, cannot hide " + view);
        }
    }

    private void animateChange(s2 s2Var, s2 s2Var2, t1 t1Var, t1 t1Var2, boolean z11, boolean z12) {
        s2Var.setIsRecyclable(false);
        if (z11) {
            addAnimatingView(s2Var);
        }
        if (s2Var != s2Var2) {
            if (z12) {
                addAnimatingView(s2Var2);
            }
            s2Var.mShadowedHolder = s2Var2;
            addAnimatingView(s2Var);
            this.mRecycler.m(s2Var);
            s2Var2.setIsRecyclable(false);
            s2Var2.mShadowingHolder = s2Var;
        }
        if (this.mItemAnimator.animateChange(s2Var, s2Var2, t1Var, t1Var2)) {
            postAnimationRunner();
        }
    }

    private void cancelScroll() {
        resetScroll();
        setScrollState(0);
    }

    public static void clearNestedRecyclerViewIfNotNested(s2 s2Var) {
        WeakReference<RecyclerView> weakReference = s2Var.mNestedRecyclerView;
        if (weakReference != null) {
            RecyclerView recyclerView = weakReference.get();
            while (recyclerView != null) {
                if (recyclerView == s2Var.itemView) {
                    return;
                }
                Object parent = recyclerView.getParent();
                recyclerView = parent instanceof View ? (View) parent : null;
            }
            s2Var.mNestedRecyclerView = null;
        }
    }

    private int consumeFlingInStretch(int i5, EdgeEffect edgeEffect, EdgeEffect edgeEffect2, int i11) {
        if (i5 > 0 && edgeEffect != null && a.a.P(edgeEffect) != 0.0f) {
            int iRound = Math.round(a.a.Y(edgeEffect, ((-i5) * FLING_DESTRETCH_FACTOR) / i11, 0.5f) * ((-i11) / FLING_DESTRETCH_FACTOR));
            if (iRound != i5) {
                edgeEffect.finish();
            }
            return i5 - iRound;
        }
        if (i5 >= 0 || edgeEffect2 == null || a.a.P(edgeEffect2) == 0.0f) {
            return i5;
        }
        float f11 = i11;
        int iRound2 = Math.round(a.a.Y(edgeEffect2, (i5 * FLING_DESTRETCH_FACTOR) / f11, 0.5f) * (f11 / FLING_DESTRETCH_FACTOR));
        if (iRound2 != i5) {
            edgeEffect2.finish();
        }
        return i5 - iRound2;
    }

    private void createLayoutManager(Context context, String str, AttributeSet attributeSet, int i5, int i11) throws NoSuchMethodException, SecurityException {
        Object[] objArr;
        Constructor constructor;
        if (str != null) {
            String strTrim = str.trim();
            if (strTrim.isEmpty()) {
                return;
            }
            String fullClassName = getFullClassName(context, strTrim);
            try {
                Class<? extends U> clsAsSubclass = Class.forName(fullClassName, false, isInEditMode() ? getClass().getClassLoader() : context.getClassLoader()).asSubclass(z1.class);
                try {
                    constructor = clsAsSubclass.getConstructor(LAYOUT_MANAGER_CONSTRUCTOR_SIGNATURE);
                    objArr = new Object[]{context, attributeSet, Integer.valueOf(i5), Integer.valueOf(i11)};
                } catch (NoSuchMethodException e3) {
                    objArr = null;
                    try {
                        constructor = clsAsSubclass.getConstructor(null);
                    } catch (NoSuchMethodException e11) {
                        e11.initCause(e3);
                        throw new IllegalStateException(attributeSet.getPositionDescription() + ": Error creating LayoutManager " + fullClassName, e11);
                    }
                }
                constructor.setAccessible(true);
                setLayoutManager((z1) constructor.newInstance(objArr));
            } catch (ClassCastException e12) {
                throw new IllegalStateException(attributeSet.getPositionDescription() + ": Class is not a LayoutManager " + fullClassName, e12);
            } catch (ClassNotFoundException e13) {
                throw new IllegalStateException(attributeSet.getPositionDescription() + ": Unable to find LayoutManager " + fullClassName, e13);
            } catch (IllegalAccessException e14) {
                throw new IllegalStateException(attributeSet.getPositionDescription() + ": Cannot access non-public constructor " + fullClassName, e14);
            } catch (InstantiationException e15) {
                throw new IllegalStateException(attributeSet.getPositionDescription() + ": Could not instantiate the LayoutManager: " + fullClassName, e15);
            } catch (InvocationTargetException e16) {
                throw new IllegalStateException(attributeSet.getPositionDescription() + ": Could not instantiate the LayoutManager: " + fullClassName, e16);
            }
        }
    }

    private boolean didChildRangeChange(int i5, int i11) {
        findMinMaxChildLayoutPositions(this.mMinMaxLayoutPositions);
        int[] iArr = this.mMinMaxLayoutPositions;
        return (iArr[0] == i5 && iArr[1] == i11) ? false : true;
    }

    private void dispatchContentChangedIfNecessary() {
        int i5 = this.mEatenAccessibilityChangeFlags;
        this.mEatenAccessibilityChangeFlags = 0;
        if (i5 == 0 || !isAccessibilityEnabled()) {
            return;
        }
        AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain();
        accessibilityEventObtain.setEventType(2048);
        zg.a.X(i5, accessibilityEventObtain);
        sendAccessibilityEventUnchecked(accessibilityEventObtain);
    }

    private void dispatchLayoutStep1() {
        h3 h3Var;
        this.mState.a(1);
        fillRemainingScrollValues(this.mState);
        this.mState.f15077i = false;
        startInterceptRequestLayout();
        j3 j3Var = this.mViewInfoStore;
        j3Var.f15009a.clear();
        j3Var.f15010b.a();
        onEnterLayoutOrScroll();
        processAdapterUpdatesAndSetAnimationFlags();
        saveFocusInfo();
        o2 o2Var = this.mState;
        o2Var.f15076h = o2Var.f15078j && this.mItemsChanged;
        this.mItemsChanged = false;
        this.mItemsAddedOrRemoved = false;
        o2Var.f15075g = o2Var.f15079k;
        o2Var.f15073e = this.mAdapter.getItemCount();
        findMinMaxChildLayoutPositions(this.mMinMaxLayoutPositions);
        if (this.mState.f15078j) {
            int iE = this.mChildHelper.e();
            for (int i5 = 0; i5 < iE; i5++) {
                s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.d(i5));
                if (!childViewHolderInt.shouldIgnore() && (!childViewHolderInt.isInvalid() || this.mAdapter.hasStableIds())) {
                    t1 t1VarRecordPreLayoutInformation = this.mItemAnimator.recordPreLayoutInformation(this.mState, childViewHolderInt, u1.buildAdapterChangeFlagsForAnimations(childViewHolderInt), childViewHolderInt.getUnmodifiedPayloads());
                    z.c1 c1Var = this.mViewInfoStore.f15009a;
                    h3 h3VarA = (h3) c1Var.get(childViewHolderInt);
                    if (h3VarA == null) {
                        h3VarA = h3.a();
                        c1Var.put(childViewHolderInt, h3VarA);
                    }
                    h3VarA.f14991b = t1VarRecordPreLayoutInformation;
                    h3VarA.f14990a |= 4;
                    if (this.mState.f15076h && childViewHolderInt.isUpdated() && !childViewHolderInt.isRemoved() && !childViewHolderInt.shouldIgnore() && !childViewHolderInt.isInvalid()) {
                        this.mViewInfoStore.f15010b.e(getChangedHolderKey(childViewHolderInt), childViewHolderInt);
                    }
                }
            }
        }
        if (this.mState.f15079k) {
            saveOldPositions();
            o2 o2Var2 = this.mState;
            boolean z11 = o2Var2.f15074f;
            o2Var2.f15074f = false;
            this.mLayout.onLayoutChildren(this.mRecycler, o2Var2);
            this.mState.f15074f = z11;
            for (int i11 = 0; i11 < this.mChildHelper.e(); i11++) {
                s2 childViewHolderInt2 = getChildViewHolderInt(this.mChildHelper.d(i11));
                if (!childViewHolderInt2.shouldIgnore() && ((h3Var = (h3) this.mViewInfoStore.f15009a.get(childViewHolderInt2)) == null || (h3Var.f14990a & 4) == 0)) {
                    int iBuildAdapterChangeFlagsForAnimations = u1.buildAdapterChangeFlagsForAnimations(childViewHolderInt2);
                    boolean zHasAnyOfTheFlags = childViewHolderInt2.hasAnyOfTheFlags(UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    if (!zHasAnyOfTheFlags) {
                        iBuildAdapterChangeFlagsForAnimations |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                    }
                    t1 t1VarRecordPreLayoutInformation2 = this.mItemAnimator.recordPreLayoutInformation(this.mState, childViewHolderInt2, iBuildAdapterChangeFlagsForAnimations, childViewHolderInt2.getUnmodifiedPayloads());
                    if (zHasAnyOfTheFlags) {
                        recordAnimationInfoIfBouncedHiddenView(childViewHolderInt2, t1VarRecordPreLayoutInformation2);
                    } else {
                        z.c1 c1Var2 = this.mViewInfoStore.f15009a;
                        h3 h3VarA2 = (h3) c1Var2.get(childViewHolderInt2);
                        if (h3VarA2 == null) {
                            h3VarA2 = h3.a();
                            c1Var2.put(childViewHolderInt2, h3VarA2);
                        }
                        h3VarA2.f14990a |= 2;
                        h3VarA2.f14991b = t1VarRecordPreLayoutInformation2;
                    }
                }
            }
            clearOldPositions();
        } else {
            clearOldPositions();
        }
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
        this.mState.f15072d = 2;
    }

    private void dispatchLayoutStep2() {
        startInterceptRequestLayout();
        onEnterLayoutOrScroll();
        this.mState.a(6);
        this.mAdapterHelper.c();
        this.mState.f15073e = this.mAdapter.getItemCount();
        this.mState.f15071c = 0;
        if (this.mPendingSavedState != null && this.mAdapter.canRestoreState()) {
            Parcelable parcelable = this.mPendingSavedState.f14838c;
            if (parcelable != null) {
                this.mLayout.onRestoreInstanceState(parcelable);
            }
            this.mPendingSavedState = null;
        }
        o2 o2Var = this.mState;
        o2Var.f15075g = false;
        this.mLayout.onLayoutChildren(this.mRecycler, o2Var);
        o2 o2Var2 = this.mState;
        o2Var2.f15074f = false;
        o2Var2.f15078j = o2Var2.f15078j && this.mItemAnimator != null;
        o2Var2.f15072d = 4;
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
    }

    private void dispatchLayoutStep3() {
        RecyclerView recyclerView;
        this.mState.a(4);
        startInterceptRequestLayout();
        onEnterLayoutOrScroll();
        o2 o2Var = this.mState;
        o2Var.f15072d = 1;
        if (o2Var.f15078j) {
            for (int iE = this.mChildHelper.e() - 1; iE >= 0; iE--) {
                s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.d(iE));
                if (!childViewHolderInt.shouldIgnore()) {
                    long changedHolderKey = getChangedHolderKey(childViewHolderInt);
                    t1 t1VarRecordPostLayoutInformation = this.mItemAnimator.recordPostLayoutInformation(this.mState, childViewHolderInt);
                    s2 s2Var = (s2) this.mViewInfoStore.f15010b.c(changedHolderKey);
                    if (s2Var == null || s2Var.shouldIgnore()) {
                        this.mViewInfoStore.a(childViewHolderInt, t1VarRecordPostLayoutInformation);
                    } else {
                        h3 h3Var = (h3) this.mViewInfoStore.f15009a.get(s2Var);
                        boolean z11 = (h3Var == null || (h3Var.f14990a & 1) == 0) ? false : true;
                        h3 h3Var2 = (h3) this.mViewInfoStore.f15009a.get(childViewHolderInt);
                        boolean z12 = (h3Var2 == null || (h3Var2.f14990a & 1) == 0) ? false : true;
                        if (z11 && s2Var == childViewHolderInt) {
                            this.mViewInfoStore.a(childViewHolderInt, t1VarRecordPostLayoutInformation);
                        } else {
                            t1 t1VarB = this.mViewInfoStore.b(s2Var, 4);
                            this.mViewInfoStore.a(childViewHolderInt, t1VarRecordPostLayoutInformation);
                            t1 t1VarB2 = this.mViewInfoStore.b(childViewHolderInt, 8);
                            if (t1VarB == null) {
                                handleMissingPreInfoForChangeError(changedHolderKey, childViewHolderInt, s2Var);
                            } else {
                                animateChange(s2Var, childViewHolderInt, t1VarB, t1VarB2, z11, z12);
                            }
                        }
                    }
                }
            }
            recyclerView = this;
            j3 j3Var = recyclerView.mViewInfoStore;
            i3 i3Var = recyclerView.mViewInfoProcessCallback;
            z.c1 c1Var = j3Var.f15009a;
            for (int i5 = c1Var.f97753c - 1; i5 >= 0; i5--) {
                s2 s2Var2 = (s2) c1Var.f(i5);
                h3 h3Var3 = (h3) c1Var.h(i5);
                int i11 = h3Var3.f14990a;
                if ((i11 & 3) == 3) {
                    RecyclerView recyclerView2 = ((k1) i3Var).f15030a;
                    recyclerView2.mLayout.removeAndRecycleView(s2Var2.itemView, recyclerView2.mRecycler);
                } else if ((i11 & 1) != 0) {
                    t1 t1Var = h3Var3.f14991b;
                    if (t1Var == null) {
                        RecyclerView recyclerView3 = ((k1) i3Var).f15030a;
                        recyclerView3.mLayout.removeAndRecycleView(s2Var2.itemView, recyclerView3.mRecycler);
                    } else {
                        t1 t1Var2 = h3Var3.f14992c;
                        RecyclerView recyclerView4 = ((k1) i3Var).f15030a;
                        recyclerView4.mRecycler.m(s2Var2);
                        recyclerView4.animateDisappearance(s2Var2, t1Var, t1Var2);
                    }
                } else if ((i11 & 14) == 14) {
                    ((k1) i3Var).f15030a.animateAppearance(s2Var2, h3Var3.f14991b, h3Var3.f14992c);
                } else if ((i11 & 12) == 12) {
                    t1 t1Var3 = h3Var3.f14991b;
                    t1 t1Var4 = h3Var3.f14992c;
                    k1 k1Var = (k1) i3Var;
                    k1Var.getClass();
                    s2Var2.setIsRecyclable(false);
                    RecyclerView recyclerView5 = k1Var.f15030a;
                    if (recyclerView5.mDataSetHasChangedAfterLayout) {
                        if (recyclerView5.mItemAnimator.animateChange(s2Var2, s2Var2, t1Var3, t1Var4)) {
                            recyclerView5.postAnimationRunner();
                        }
                    } else if (recyclerView5.mItemAnimator.animatePersistence(s2Var2, t1Var3, t1Var4)) {
                        recyclerView5.postAnimationRunner();
                    }
                } else if ((i11 & 4) != 0) {
                    t1 t1Var5 = h3Var3.f14991b;
                    RecyclerView recyclerView6 = ((k1) i3Var).f15030a;
                    recyclerView6.mRecycler.m(s2Var2);
                    recyclerView6.animateDisappearance(s2Var2, t1Var5, null);
                } else if ((i11 & 8) != 0) {
                    ((k1) i3Var).f15030a.animateAppearance(s2Var2, h3Var3.f14991b, h3Var3.f14992c);
                }
                h3Var3.f14990a = 0;
                h3Var3.f14991b = null;
                h3Var3.f14992c = null;
                h3.f14989d.n(h3Var3);
            }
        } else {
            recyclerView = this;
        }
        recyclerView.mLayout.removeAndRecycleScrapInt(recyclerView.mRecycler);
        o2 o2Var2 = recyclerView.mState;
        o2Var2.f15070b = o2Var2.f15073e;
        recyclerView.mDataSetHasChangedAfterLayout = false;
        recyclerView.mDispatchItemsChangedEvent = false;
        o2Var2.f15078j = false;
        o2Var2.f15079k = false;
        recyclerView.mLayout.mRequestedSimpleAnimations = false;
        ArrayList arrayList = recyclerView.mRecycler.f14982b;
        if (arrayList != null) {
            arrayList.clear();
        }
        z1 z1Var = recyclerView.mLayout;
        if (z1Var.mPrefetchMaxObservedInInitialPrefetch) {
            z1Var.mPrefetchMaxCountObserved = 0;
            z1Var.mPrefetchMaxObservedInInitialPrefetch = false;
            recyclerView.mRecycler.n();
        }
        recyclerView.mLayout.onLayoutCompleted(recyclerView.mState);
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
        j3 j3Var2 = recyclerView.mViewInfoStore;
        j3Var2.f15009a.clear();
        j3Var2.f15010b.a();
        int[] iArr = recyclerView.mMinMaxLayoutPositions;
        if (didChildRangeChange(iArr[0], iArr[1])) {
            dispatchOnScrolled(0, 0);
        }
        recoverFocusFromState();
        resetFocusInfo();
    }

    private boolean dispatchToOnItemTouchListeners(MotionEvent motionEvent) {
        d2 d2Var = this.mInterceptingOnItemTouchListener;
        if (d2Var == null) {
            if (motionEvent.getAction() == 0) {
                return false;
            }
            return findInterceptingOnItemTouchListener(motionEvent);
        }
        d2Var.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action != 3 && action != 1) {
            return true;
        }
        this.mInterceptingOnItemTouchListener = null;
        return true;
    }

    private boolean findInterceptingOnItemTouchListener(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        int size = this.mOnItemTouchListeners.size();
        for (int i5 = 0; i5 < size; i5++) {
            d2 d2Var = this.mOnItemTouchListeners.get(i5);
            if (d2Var.c(motionEvent) && action != 3) {
                this.mInterceptingOnItemTouchListener = d2Var;
                return true;
            }
        }
        return false;
    }

    private void findMinMaxChildLayoutPositions(int[] iArr) {
        int iE = this.mChildHelper.e();
        if (iE == 0) {
            iArr[0] = -1;
            iArr[1] = -1;
            return;
        }
        int i5 = LayoutNode.NotPlacedPlaceOrder;
        int i11 = Integer.MIN_VALUE;
        for (int i12 = 0; i12 < iE; i12++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.d(i12));
            if (!childViewHolderInt.shouldIgnore()) {
                int layoutPosition = childViewHolderInt.getLayoutPosition();
                if (layoutPosition < i5) {
                    i5 = layoutPosition;
                }
                if (layoutPosition > i11) {
                    i11 = layoutPosition;
                }
            }
        }
        iArr[0] = i5;
        iArr[1] = i11;
    }

    public static RecyclerView findNestedRecyclerView(View view) {
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        if (view instanceof RecyclerView) {
            return (RecyclerView) view;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            RecyclerView recyclerViewFindNestedRecyclerView = findNestedRecyclerView(viewGroup.getChildAt(i5));
            if (recyclerViewFindNestedRecyclerView != null) {
                return recyclerViewFindNestedRecyclerView;
            }
        }
        return null;
    }

    private View findNextViewToFocus() {
        s2 s2VarFindViewHolderForAdapterPosition;
        o2 o2Var = this.mState;
        int i5 = o2Var.f15080l;
        if (i5 == -1) {
            i5 = 0;
        }
        int iB = o2Var.b();
        for (int i11 = i5; i11 < iB; i11++) {
            s2 s2VarFindViewHolderForAdapterPosition2 = findViewHolderForAdapterPosition(i11);
            if (s2VarFindViewHolderForAdapterPosition2 == null) {
                break;
            }
            if (s2VarFindViewHolderForAdapterPosition2.itemView.hasFocusable()) {
                return s2VarFindViewHolderForAdapterPosition2.itemView;
            }
        }
        int iMin = Math.min(iB, i5);
        do {
            iMin--;
            if (iMin < 0 || (s2VarFindViewHolderForAdapterPosition = findViewHolderForAdapterPosition(iMin)) == null) {
                return null;
            }
        } while (!s2VarFindViewHolderForAdapterPosition.itemView.hasFocusable());
        return s2VarFindViewHolderForAdapterPosition.itemView;
    }

    public static s2 getChildViewHolderInt(View view) {
        if (view == null) {
            return null;
        }
        return ((a2) view.getLayoutParams()).f14880a;
    }

    public static void getDecoratedBoundsWithMarginsInt(View view, Rect rect) {
        a2 a2Var = (a2) view.getLayoutParams();
        Rect rect2 = a2Var.f14881b;
        rect.set((view.getLeft() - rect2.left) - ((ViewGroup.MarginLayoutParams) a2Var).leftMargin, (view.getTop() - rect2.top) - ((ViewGroup.MarginLayoutParams) a2Var).topMargin, view.getRight() + rect2.right + ((ViewGroup.MarginLayoutParams) a2Var).rightMargin, view.getBottom() + rect2.bottom + ((ViewGroup.MarginLayoutParams) a2Var).bottomMargin);
    }

    private int getDeepestFocusedViewWithId(View view) {
        int id2 = view.getId();
        while (!view.isFocused() && (view instanceof ViewGroup) && view.hasFocus()) {
            view = ((ViewGroup) view).getFocusedChild();
            if (view.getId() != -1) {
                id2 = view.getId();
            }
        }
        return id2;
    }

    private String getFullClassName(Context context, String str) {
        if (str.charAt(0) == '.') {
            return context.getPackageName() + str;
        }
        if (str.contains(".")) {
            return str;
        }
        return RecyclerView.class.getPackage().getName() + '.' + str;
    }

    private a5.w getScrollingChildHelper() {
        if (this.mScrollingChildHelper == null) {
            this.mScrollingChildHelper = new a5.w(this);
        }
        return this.mScrollingChildHelper;
    }

    private float getSplineFlingDistance(int i5) {
        double dLog = Math.log((Math.abs(i5) * INFLEXION) / (this.mPhysicalCoef * SCROLL_FRICTION));
        float f11 = DECELERATION_RATE;
        return (float) (Math.exp((f11 / (f11 - 1.0d)) * dLog) * this.mPhysicalCoef * SCROLL_FRICTION);
    }

    private void handleMissingPreInfoForChangeError(long j11, s2 s2Var, s2 s2Var2) {
        int iE = this.mChildHelper.e();
        for (int i5 = 0; i5 < iE; i5++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.d(i5));
            if (childViewHolderInt != s2Var && getChangedHolderKey(childViewHolderInt) == j11) {
                m1 m1Var = this.mAdapter;
                if (m1Var == null || !m1Var.hasStableIds()) {
                    StringBuilder sb2 = new StringBuilder("Two different ViewHolders have the same change ID. This might happen due to inconsistent Adapter update events or if the LayoutManager lays out the same View multiple times.\n ViewHolder 1:");
                    sb2.append(childViewHolderInt);
                    sb2.append(" \n View Holder 2:");
                    sb2.append(s2Var);
                    throw new IllegalStateException(a2.c.j(this, sb2));
                }
                StringBuilder sb3 = new StringBuilder("Two different ViewHolders have the same stable ID. Stable IDs in your adapter MUST BE unique and SHOULD NOT change.\n ViewHolder 1:");
                sb3.append(childViewHolderInt);
                sb3.append(" \n View Holder 2:");
                sb3.append(s2Var);
                throw new IllegalStateException(a2.c.j(this, sb3));
            }
        }
        Log.e(TAG, "Problem while matching changed view holders with the newones. The pre-layout information for the change holder " + s2Var2 + " cannot be found but it is necessary for " + s2Var + exceptionLabel());
    }

    private boolean hasUpdatedView() {
        int iE = this.mChildHelper.e();
        for (int i5 = 0; i5 < iE; i5++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.d(i5));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore() && childViewHolderInt.isUpdated()) {
                return true;
            }
        }
        return false;
    }

    @SuppressLint({"InlinedApi"})
    private void initAutofill() {
        WeakHashMap weakHashMap = a5.a1.f250a;
        if (a5.u0.a(this) == 0) {
            a5.u0.b(this, 8);
        }
    }

    private void initChildrenHelper() {
        this.mChildHelper = new i(new k1(this));
    }

    private boolean isPreferredNextFocus(View view, View view2, int i5) {
        int i11;
        if (view2 == null || view2 == this || view2 == view || findContainingItemView(view2) == null) {
            return false;
        }
        if (view == null || findContainingItemView(view) == null) {
            return true;
        }
        this.mTempRect.set(0, 0, view.getWidth(), view.getHeight());
        this.mTempRect2.set(0, 0, view2.getWidth(), view2.getHeight());
        offsetDescendantRectToMyCoords(view, this.mTempRect);
        offsetDescendantRectToMyCoords(view2, this.mTempRect2);
        char c11 = 65535;
        int i12 = this.mLayout.getLayoutDirection() == 1 ? -1 : 1;
        Rect rect = this.mTempRect;
        int i13 = rect.left;
        Rect rect2 = this.mTempRect2;
        int i14 = rect2.left;
        if ((i13 < i14 || rect.right <= i14) && rect.right < rect2.right) {
            i11 = 1;
        } else {
            int i15 = rect.right;
            int i16 = rect2.right;
            i11 = ((i15 > i16 || i13 >= i16) && i13 > i14) ? -1 : 0;
        }
        int i17 = rect.top;
        int i18 = rect2.top;
        if ((i17 < i18 || rect.bottom <= i18) && rect.bottom < rect2.bottom) {
            c11 = 1;
        } else {
            int i19 = rect.bottom;
            int i21 = rect2.bottom;
            if ((i19 <= i21 && i17 < i21) || i17 <= i18) {
                c11 = 0;
            }
        }
        if (i5 == 1) {
            return c11 < 0 || (c11 == 0 && i11 * i12 < 0);
        }
        if (i5 == 2) {
            return c11 > 0 || (c11 == 0 && i11 * i12 > 0);
        }
        if (i5 == 17) {
            return i11 < 0;
        }
        if (i5 == 33) {
            return c11 < 0;
        }
        if (i5 == 66) {
            return i11 > 0;
        }
        if (i5 == 130) {
            return c11 > 0;
        }
        StringBuilder sb2 = new StringBuilder("Invalid direction: ");
        sb2.append(i5);
        throw new IllegalArgumentException(a2.c.j(this, sb2));
    }

    private void nestedScrollByInternal(int i5, int i11, MotionEvent motionEvent, int i12) {
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            Log.e(TAG, "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            return;
        }
        if (this.mLayoutSuppressed) {
            return;
        }
        int[] iArr = this.mReusableIntPair;
        iArr[0] = 0;
        iArr[1] = 0;
        boolean zCanScrollHorizontally = z1Var.canScrollHorizontally();
        boolean zCanScrollVertically = this.mLayout.canScrollVertically();
        int i13 = zCanScrollVertically ? (zCanScrollHorizontally ? 1 : 0) | 2 : zCanScrollHorizontally ? 1 : 0;
        float height = motionEvent == null ? getHeight() / 2.0f : motionEvent.getY();
        float width = motionEvent == null ? getWidth() / 2.0f : motionEvent.getX();
        int iReleaseHorizontalGlow = i5 - releaseHorizontalGlow(i5, height);
        int iReleaseVerticalGlow = i11 - releaseVerticalGlow(i11, width);
        startNestedScroll(i13, i12);
        if (dispatchNestedPreScroll(zCanScrollHorizontally ? iReleaseHorizontalGlow : 0, zCanScrollVertically ? iReleaseVerticalGlow : 0, this.mReusableIntPair, this.mScrollOffset, i12)) {
            int[] iArr2 = this.mReusableIntPair;
            iReleaseHorizontalGlow -= iArr2[0];
            iReleaseVerticalGlow -= iArr2[1];
        }
        scrollByInternal(zCanScrollHorizontally ? iReleaseHorizontalGlow : 0, zCanScrollVertically ? iReleaseVerticalGlow : 0, motionEvent, i12);
        f0 f0Var = this.mGapWorker;
        if (f0Var != null && (iReleaseHorizontalGlow != 0 || iReleaseVerticalGlow != 0)) {
            f0Var.a(this, iReleaseHorizontalGlow, iReleaseVerticalGlow);
        }
        stopNestedScroll(i12);
    }

    private void onPointerUp(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.mScrollPointerId) {
            int i5 = actionIndex == 0 ? 1 : 0;
            this.mScrollPointerId = motionEvent.getPointerId(i5);
            int x11 = (int) (motionEvent.getX(i5) + 0.5f);
            this.mLastTouchX = x11;
            this.mInitialTouchX = x11;
            int y11 = (int) (motionEvent.getY(i5) + 0.5f);
            this.mLastTouchY = y11;
            this.mInitialTouchY = y11;
        }
    }

    private boolean predictiveItemAnimationsEnabled() {
        return this.mItemAnimator != null && this.mLayout.supportsPredictiveItemAnimations();
    }

    private void processAdapterUpdatesAndSetAnimationFlags() {
        boolean z11;
        boolean z12 = false;
        if (this.mDataSetHasChangedAfterLayout) {
            b bVar = this.mAdapterHelper;
            bVar.k(bVar.f14885b);
            bVar.k(bVar.f14886c);
            bVar.f14889f = 0;
            if (this.mDispatchItemsChangedEvent) {
                this.mLayout.onItemsChanged(this);
            }
        }
        if (predictiveItemAnimationsEnabled()) {
            this.mAdapterHelper.j();
        } else {
            this.mAdapterHelper.c();
        }
        boolean z13 = this.mItemsAddedOrRemoved || this.mItemsChanged;
        this.mState.f15078j = this.mFirstLayoutComplete && this.mItemAnimator != null && ((z11 = this.mDataSetHasChangedAfterLayout) || z13 || this.mLayout.mRequestedSimpleAnimations) && (!z11 || this.mAdapter.hasStableIds());
        o2 o2Var = this.mState;
        if (o2Var.f15078j && z13 && !this.mDataSetHasChangedAfterLayout && predictiveItemAnimationsEnabled()) {
            z12 = true;
        }
        o2Var.f15079k = z12;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0056  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void pullGlows(float f11, float f12, float f13, float f14) {
        boolean z11;
        boolean z12 = true;
        if (f12 < 0.0f) {
            ensureLeftGlow();
            a.a.Y(this.mLeftGlow, (-f12) / getWidth(), 1.0f - (f13 / getHeight()));
        } else {
            if (f12 <= 0.0f) {
                z11 = false;
                if (f14 >= 0.0f) {
                    ensureTopGlow();
                    a.a.Y(this.mTopGlow, (-f14) / getHeight(), f11 / getWidth());
                } else if (f14 > 0.0f) {
                    ensureBottomGlow();
                    a.a.Y(this.mBottomGlow, f14 / getHeight(), 1.0f - (f11 / getWidth()));
                } else {
                    z12 = z11;
                }
                if (z12 && f12 == 0.0f && f14 == 0.0f) {
                    return;
                }
                WeakHashMap weakHashMap = a5.a1.f250a;
                postInvalidateOnAnimation();
            }
            ensureRightGlow();
            a.a.Y(this.mRightGlow, f12 / getWidth(), f13 / getHeight());
        }
        z11 = true;
        if (f14 >= 0.0f) {
        }
        if (z12) {
        }
        WeakHashMap weakHashMap2 = a5.a1.f250a;
        postInvalidateOnAnimation();
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x008e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void recoverFocusFromState() {
        View viewFindViewById;
        if (!this.mPreserveFocusAfterLayout || this.mAdapter == null || !hasFocus() || getDescendantFocusability() == 393216) {
            return;
        }
        if (getDescendantFocusability() == 131072 && isFocused()) {
            return;
        }
        if (!isFocused()) {
            View focusedChild = getFocusedChild();
            if (!IGNORE_DETACHED_FOCUSED_CHILD || (focusedChild.getParent() != null && focusedChild.hasFocus())) {
                if (!this.mChildHelper.f14995c.contains(focusedChild)) {
                    return;
                }
            } else if (this.mChildHelper.e() == 0) {
                requestFocus();
                return;
            }
        }
        View viewFindNextViewToFocus = null;
        s2 s2VarFindViewHolderForItemId = (this.mState.f15081m == -1 || !this.mAdapter.hasStableIds()) ? null : findViewHolderForItemId(this.mState.f15081m);
        if (s2VarFindViewHolderForItemId != null) {
            if (!this.mChildHelper.f14995c.contains(s2VarFindViewHolderForItemId.itemView) && s2VarFindViewHolderForItemId.itemView.hasFocusable()) {
                viewFindNextViewToFocus = s2VarFindViewHolderForItemId.itemView;
            } else if (this.mChildHelper.e() > 0) {
                viewFindNextViewToFocus = findNextViewToFocus();
            }
        }
        if (viewFindNextViewToFocus != null) {
            int i5 = this.mState.n;
            if (i5 != -1 && (viewFindViewById = viewFindNextViewToFocus.findViewById(i5)) != null && viewFindViewById.isFocusable()) {
                viewFindNextViewToFocus = viewFindViewById;
            }
            viewFindNextViewToFocus.requestFocus();
        }
    }

    private void releaseGlows() {
        boolean zIsFinished;
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect != null) {
            edgeEffect.onRelease();
            zIsFinished = this.mLeftGlow.isFinished();
        } else {
            zIsFinished = false;
        }
        EdgeEffect edgeEffect2 = this.mTopGlow;
        if (edgeEffect2 != null) {
            edgeEffect2.onRelease();
            zIsFinished |= this.mTopGlow.isFinished();
        }
        EdgeEffect edgeEffect3 = this.mRightGlow;
        if (edgeEffect3 != null) {
            edgeEffect3.onRelease();
            zIsFinished |= this.mRightGlow.isFinished();
        }
        EdgeEffect edgeEffect4 = this.mBottomGlow;
        if (edgeEffect4 != null) {
            edgeEffect4.onRelease();
            zIsFinished |= this.mBottomGlow.isFinished();
        }
        if (zIsFinished) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            postInvalidateOnAnimation();
        }
    }

    private int releaseHorizontalGlow(int i5, float f11) {
        float height = f11 / getHeight();
        float width = i5 / getWidth();
        EdgeEffect edgeEffect = this.mLeftGlow;
        float f12 = 0.0f;
        if (edgeEffect == null || a.a.P(edgeEffect) == 0.0f) {
            EdgeEffect edgeEffect2 = this.mRightGlow;
            if (edgeEffect2 != null && a.a.P(edgeEffect2) != 0.0f) {
                if (canScrollHorizontally(1)) {
                    this.mRightGlow.onRelease();
                } else {
                    float fY = a.a.Y(this.mRightGlow, width, height);
                    if (a.a.P(this.mRightGlow) == 0.0f) {
                        this.mRightGlow.onRelease();
                    }
                    f12 = fY;
                }
                invalidate();
            }
        } else {
            if (canScrollHorizontally(-1)) {
                this.mLeftGlow.onRelease();
            } else {
                float f13 = -a.a.Y(this.mLeftGlow, -width, 1.0f - height);
                if (a.a.P(this.mLeftGlow) == 0.0f) {
                    this.mLeftGlow.onRelease();
                }
                f12 = f13;
            }
            invalidate();
        }
        return Math.round(f12 * getWidth());
    }

    private int releaseVerticalGlow(int i5, float f11) {
        float width = f11 / getWidth();
        float height = i5 / getHeight();
        EdgeEffect edgeEffect = this.mTopGlow;
        float f12 = 0.0f;
        if (edgeEffect == null || a.a.P(edgeEffect) == 0.0f) {
            EdgeEffect edgeEffect2 = this.mBottomGlow;
            if (edgeEffect2 != null && a.a.P(edgeEffect2) != 0.0f) {
                if (canScrollVertically(1)) {
                    this.mBottomGlow.onRelease();
                } else {
                    float fY = a.a.Y(this.mBottomGlow, height, 1.0f - width);
                    if (a.a.P(this.mBottomGlow) == 0.0f) {
                        this.mBottomGlow.onRelease();
                    }
                    f12 = fY;
                }
                invalidate();
            }
        } else {
            if (canScrollVertically(-1)) {
                this.mTopGlow.onRelease();
            } else {
                float f13 = -a.a.Y(this.mTopGlow, -height, width);
                if (a.a.P(this.mTopGlow) == 0.0f) {
                    this.mTopGlow.onRelease();
                }
                f12 = f13;
            }
            invalidate();
        }
        return Math.round(f12 * getHeight());
    }

    private void requestChildOnScreen(View view, View view2) {
        View view3 = view2 != null ? view2 : view;
        this.mTempRect.set(0, 0, view3.getWidth(), view3.getHeight());
        ViewGroup.LayoutParams layoutParams = view3.getLayoutParams();
        if (layoutParams instanceof a2) {
            a2 a2Var = (a2) layoutParams;
            if (!a2Var.f14882c) {
                Rect rect = a2Var.f14881b;
                Rect rect2 = this.mTempRect;
                rect2.left -= rect.left;
                rect2.right += rect.right;
                rect2.top -= rect.top;
                rect2.bottom += rect.bottom;
            }
        }
        if (view2 != null) {
            offsetDescendantRectToMyCoords(view2, this.mTempRect);
            offsetRectIntoDescendantCoords(view, this.mTempRect);
        }
        this.mLayout.requestChildRectangleOnScreen(this, view, this.mTempRect, !this.mFirstLayoutComplete, view2 == null);
    }

    private void resetFocusInfo() {
        o2 o2Var = this.mState;
        o2Var.f15081m = -1L;
        o2Var.f15080l = -1;
        o2Var.n = -1;
    }

    private void resetScroll() {
        VelocityTracker velocityTracker = this.mVelocityTracker;
        if (velocityTracker != null) {
            velocityTracker.clear();
        }
        stopNestedScroll(0);
        releaseGlows();
    }

    private void saveFocusInfo() {
        View focusedChild = (this.mPreserveFocusAfterLayout && hasFocus() && this.mAdapter != null) ? getFocusedChild() : null;
        s2 s2VarFindContainingViewHolder = focusedChild != null ? findContainingViewHolder(focusedChild) : null;
        if (s2VarFindContainingViewHolder == null) {
            resetFocusInfo();
            return;
        }
        this.mState.f15081m = this.mAdapter.hasStableIds() ? s2VarFindContainingViewHolder.getItemId() : -1L;
        this.mState.f15080l = this.mDataSetHasChangedAfterLayout ? -1 : s2VarFindContainingViewHolder.isRemoved() ? s2VarFindContainingViewHolder.mOldPosition : s2VarFindContainingViewHolder.getAbsoluteAdapterPosition();
        this.mState.n = getDeepestFocusedViewWithId(s2VarFindContainingViewHolder.itemView);
    }

    private void setAdapterInternal(m1 m1Var, boolean z11, boolean z12) {
        m1 m1Var2 = this.mAdapter;
        if (m1Var2 != null) {
            m1Var2.unregisterAdapterDataObserver(this.mObserver);
            this.mAdapter.onDetachedFromRecyclerView(this);
        }
        if (!z11 || z12) {
            removeAndRecycleViews();
        }
        b bVar = this.mAdapterHelper;
        bVar.k(bVar.f14885b);
        bVar.k(bVar.f14886c);
        bVar.f14889f = 0;
        m1 m1Var3 = this.mAdapter;
        this.mAdapter = m1Var;
        if (m1Var != null) {
            m1Var.registerAdapterDataObserver(this.mObserver);
            m1Var.onAttachedToRecyclerView(this);
        }
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.onAdapterChanged(m1Var3, this.mAdapter);
        }
        h2 h2Var = this.mRecycler;
        m1 m1Var4 = this.mAdapter;
        h2Var.f14981a.clear();
        h2Var.g();
        h2Var.f(m1Var3, true);
        g2 g2VarC = h2Var.c();
        if (m1Var3 != null) {
            g2VarC.f14971b--;
        }
        if (!z11 && g2VarC.f14971b == 0) {
            g2VarC.a();
        }
        if (m1Var4 != null) {
            g2VarC.f14971b++;
        } else {
            g2VarC.getClass();
        }
        h2Var.e();
        this.mState.f15074f = true;
    }

    public static void setDebugAssertionsEnabled(boolean z11) {
        sDebugAssertionsEnabled = z11;
    }

    public static void setVerboseLoggingEnabled(boolean z11) {
        sVerboseLoggingEnabled = z11;
    }

    private boolean shouldAbsorb(EdgeEffect edgeEffect, int i5, int i11) {
        if (i5 > 0) {
            return true;
        }
        return getSplineFlingDistance(-i5) < a.a.P(edgeEffect) * ((float) i11);
    }

    private boolean stopGlowAnimations(MotionEvent motionEvent) {
        boolean z11;
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect == null || a.a.P(edgeEffect) == 0.0f || canScrollHorizontally(-1)) {
            z11 = false;
        } else {
            a.a.Y(this.mLeftGlow, 0.0f, 1.0f - (motionEvent.getY() / getHeight()));
            z11 = true;
        }
        EdgeEffect edgeEffect2 = this.mRightGlow;
        if (edgeEffect2 != null && a.a.P(edgeEffect2) != 0.0f && !canScrollHorizontally(1)) {
            a.a.Y(this.mRightGlow, 0.0f, motionEvent.getY() / getHeight());
            z11 = true;
        }
        EdgeEffect edgeEffect3 = this.mTopGlow;
        if (edgeEffect3 != null && a.a.P(edgeEffect3) != 0.0f && !canScrollVertically(-1)) {
            a.a.Y(this.mTopGlow, 0.0f, motionEvent.getX() / getWidth());
            z11 = true;
        }
        EdgeEffect edgeEffect4 = this.mBottomGlow;
        if (edgeEffect4 == null || a.a.P(edgeEffect4) == 0.0f || canScrollVertically(1)) {
            return z11;
        }
        a.a.Y(this.mBottomGlow, 0.0f, 1.0f - (motionEvent.getX() / getWidth()));
        return true;
    }

    private void stopScrollersInternal() {
        r2 r2Var = this.mViewFlinger;
        r2Var.f15115g.removeCallbacks(r2Var);
        r2Var.f15111c.abortAnimation();
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.stopSmoothScroller();
        }
    }

    public void absorbGlows(int i5, int i11) {
        if (i5 < 0) {
            ensureLeftGlow();
            if (this.mLeftGlow.isFinished()) {
                this.mLeftGlow.onAbsorb(-i5);
            }
        } else if (i5 > 0) {
            ensureRightGlow();
            if (this.mRightGlow.isFinished()) {
                this.mRightGlow.onAbsorb(i5);
            }
        }
        if (i11 < 0) {
            ensureTopGlow();
            if (this.mTopGlow.isFinished()) {
                this.mTopGlow.onAbsorb(-i11);
            }
        } else if (i11 > 0) {
            ensureBottomGlow();
            if (this.mBottomGlow.isFinished()) {
                this.mBottomGlow.onAbsorb(i11);
            }
        }
        if (i5 == 0 && i11 == 0) {
            return;
        }
        WeakHashMap weakHashMap = a5.a1.f250a;
        postInvalidateOnAnimation();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> arrayList, int i5, int i11) {
        z1 z1Var = this.mLayout;
        if (z1Var == null || !z1Var.onAddFocusables(this, arrayList, i5, i11)) {
            super.addFocusables(arrayList, i5, i11);
        }
    }

    public void addItemDecoration(v1 v1Var, int i5) {
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.assertNotInLayoutOrScroll("Cannot add item decoration during a scroll  or layout");
        }
        if (this.mItemDecorations.isEmpty()) {
            setWillNotDraw(false);
        }
        if (i5 < 0) {
            this.mItemDecorations.add(v1Var);
        } else {
            this.mItemDecorations.add(i5, v1Var);
        }
        markItemDecorInsetsDirty();
        requestLayout();
    }

    public void addOnChildAttachStateChangeListener(b2 b2Var) {
        if (this.mOnChildAttachStateListeners == null) {
            this.mOnChildAttachStateListeners = new ArrayList();
        }
        this.mOnChildAttachStateListeners.add(b2Var);
    }

    public void addOnItemTouchListener(d2 d2Var) {
        this.mOnItemTouchListeners.add(d2Var);
    }

    public void addOnScrollListener(e2 e2Var) {
        if (this.mScrollListeners == null) {
            this.mScrollListeners = new ArrayList();
        }
        this.mScrollListeners.add(e2Var);
    }

    public void addRecyclerListener(i2 i2Var) {
        if (!(i2Var != null)) {
            throw new IllegalArgumentException("'listener' arg cannot be null.");
        }
        this.mRecyclerListeners.add(i2Var);
    }

    public void animateAppearance(s2 s2Var, t1 t1Var, t1 t1Var2) {
        s2Var.setIsRecyclable(false);
        if (this.mItemAnimator.animateAppearance(s2Var, t1Var, t1Var2)) {
            postAnimationRunner();
        }
    }

    public void animateDisappearance(s2 s2Var, t1 t1Var, t1 t1Var2) {
        addAnimatingView(s2Var);
        s2Var.setIsRecyclable(false);
        if (this.mItemAnimator.animateDisappearance(s2Var, t1Var, t1Var2)) {
            postAnimationRunner();
        }
    }

    public void assertInLayoutOrScroll(String str) {
        if (isComputingLayout()) {
            return;
        }
        if (str != null) {
            throw new IllegalStateException(a2.c.j(this, a2.c.q(str)));
        }
        throw new IllegalStateException(a2.c.j(this, new StringBuilder("Cannot call this method unless RecyclerView is computing a layout or scrolling")));
    }

    public void assertNotInLayoutOrScroll(String str) {
        if (isComputingLayout()) {
            if (str != null) {
                throw new IllegalStateException(str);
            }
            throw new IllegalStateException(a2.c.j(this, new StringBuilder("Cannot call this method while RecyclerView is computing a layout or scrolling")));
        }
        if (this.mDispatchScrollCounter > 0) {
            Log.w(TAG, "Cannot call this method in a scroll callback. Scroll callbacks mightbe run during a measure & layout pass where you cannot change theRecyclerView data. Any method call that might change the structureof the RecyclerView or the adapter contents should be postponed tothe next frame.", new IllegalStateException(a2.c.j(this, new StringBuilder(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b))));
        }
    }

    public boolean canReuseUpdatedViewHolder(s2 s2Var) {
        u1 u1Var = this.mItemAnimator;
        return u1Var == null || u1Var.canReuseUpdatedViewHolder(s2Var, s2Var.getUnmodifiedPayloads());
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof a2) && this.mLayout.checkLayoutParams((a2) layoutParams);
    }

    public void clearOldPositions() {
        int iH = this.mChildHelper.h();
        for (int i5 = 0; i5 < iH; i5++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i5));
            if (!childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.clearOldPosition();
            }
        }
        h2 h2Var = this.mRecycler;
        ArrayList arrayList = h2Var.f14981a;
        ArrayList arrayList2 = h2Var.f14983c;
        int size = arrayList2.size();
        for (int i11 = 0; i11 < size; i11++) {
            ((s2) arrayList2.get(i11)).clearOldPosition();
        }
        int size2 = arrayList.size();
        for (int i12 = 0; i12 < size2; i12++) {
            ((s2) arrayList.get(i12)).clearOldPosition();
        }
        ArrayList arrayList3 = h2Var.f14982b;
        if (arrayList3 != null) {
            int size3 = arrayList3.size();
            for (int i13 = 0; i13 < size3; i13++) {
                ((s2) h2Var.f14982b.get(i13)).clearOldPosition();
            }
        }
    }

    public void clearOnChildAttachStateChangeListeners() {
        List<b2> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            list.clear();
        }
    }

    public void clearOnScrollListeners() {
        List<e2> list = this.mScrollListeners;
        if (list != null) {
            list.clear();
        }
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public int computeHorizontalScrollExtent() {
        z1 z1Var = this.mLayout;
        if (z1Var != null && z1Var.canScrollHorizontally()) {
            return this.mLayout.computeHorizontalScrollExtent(this.mState);
        }
        return 0;
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public int computeHorizontalScrollOffset() {
        z1 z1Var = this.mLayout;
        if (z1Var != null && z1Var.canScrollHorizontally()) {
            return this.mLayout.computeHorizontalScrollOffset(this.mState);
        }
        return 0;
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public int computeHorizontalScrollRange() {
        z1 z1Var = this.mLayout;
        if (z1Var != null && z1Var.canScrollHorizontally()) {
            return this.mLayout.computeHorizontalScrollRange(this.mState);
        }
        return 0;
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public int computeVerticalScrollExtent() {
        z1 z1Var = this.mLayout;
        if (z1Var != null && z1Var.canScrollVertically()) {
            return this.mLayout.computeVerticalScrollExtent(this.mState);
        }
        return 0;
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public int computeVerticalScrollOffset() {
        z1 z1Var = this.mLayout;
        if (z1Var != null && z1Var.canScrollVertically()) {
            return this.mLayout.computeVerticalScrollOffset(this.mState);
        }
        return 0;
    }

    @Override // android.view.View, androidx.core.view.ScrollingView
    public int computeVerticalScrollRange() {
        z1 z1Var = this.mLayout;
        if (z1Var != null && z1Var.canScrollVertically()) {
            return this.mLayout.computeVerticalScrollRange(this.mState);
        }
        return 0;
    }

    public void considerReleasingGlowsOnScroll(int i5, int i11) {
        boolean zIsFinished;
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect == null || edgeEffect.isFinished() || i5 <= 0) {
            zIsFinished = false;
        } else {
            this.mLeftGlow.onRelease();
            zIsFinished = this.mLeftGlow.isFinished();
        }
        EdgeEffect edgeEffect2 = this.mRightGlow;
        if (edgeEffect2 != null && !edgeEffect2.isFinished() && i5 < 0) {
            this.mRightGlow.onRelease();
            zIsFinished |= this.mRightGlow.isFinished();
        }
        EdgeEffect edgeEffect3 = this.mTopGlow;
        if (edgeEffect3 != null && !edgeEffect3.isFinished() && i11 > 0) {
            this.mTopGlow.onRelease();
            zIsFinished |= this.mTopGlow.isFinished();
        }
        EdgeEffect edgeEffect4 = this.mBottomGlow;
        if (edgeEffect4 != null && !edgeEffect4.isFinished() && i11 < 0) {
            this.mBottomGlow.onRelease();
            zIsFinished |= this.mBottomGlow.isFinished();
        }
        if (zIsFinished) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            postInvalidateOnAnimation();
        }
    }

    public int consumeFlingInHorizontalStretch(int i5) {
        return consumeFlingInStretch(i5, this.mLeftGlow, this.mRightGlow, getWidth());
    }

    public int consumeFlingInVerticalStretch(int i5) {
        return consumeFlingInStretch(i5, this.mTopGlow, this.mBottomGlow, getHeight());
    }

    public void consumePendingUpdateOperations() {
        if (!this.mFirstLayoutComplete || this.mDataSetHasChangedAfterLayout) {
            int i5 = w4.i.f93753a;
            Trace.beginSection(TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG);
            dispatchLayout();
            Trace.endSection();
            return;
        }
        if (this.mAdapterHelper.g()) {
            b bVar = this.mAdapterHelper;
            int i11 = bVar.f14889f;
            if ((i11 & 4) == 0 || (i11 & 11) != 0) {
                if (bVar.g()) {
                    int i12 = w4.i.f93753a;
                    Trace.beginSection(TRACE_ON_DATA_SET_CHANGE_LAYOUT_TAG);
                    dispatchLayout();
                    Trace.endSection();
                    return;
                }
                return;
            }
            int i13 = w4.i.f93753a;
            Trace.beginSection(TRACE_HANDLE_ADAPTER_UPDATES_TAG);
            startInterceptRequestLayout();
            onEnterLayoutOrScroll();
            this.mAdapterHelper.j();
            if (!this.mLayoutWasDefered) {
                if (hasUpdatedView()) {
                    dispatchLayout();
                } else {
                    this.mAdapterHelper.b();
                }
            }
            stopInterceptRequestLayout(true);
            onExitLayoutOrScroll();
            Trace.endSection();
        }
    }

    public int d() {
        return getPaddingBottom();
    }

    public void defaultOnMeasure(int i5, int i11) {
        int paddingRight = getPaddingRight() + getPaddingLeft();
        WeakHashMap weakHashMap = a5.a1.f250a;
        setMeasuredDimension(z1.chooseSize(i5, paddingRight, getMinimumWidth()), z1.chooseSize(i11, getPaddingBottom() + getPaddingTop(), getMinimumHeight()));
    }

    public void dispatchChildAttached(View view) {
        s2 childViewHolderInt = getChildViewHolderInt(view);
        onChildAttachedToWindow(view);
        m1 m1Var = this.mAdapter;
        if (m1Var != null && childViewHolderInt != null) {
            m1Var.onViewAttachedToWindow(childViewHolderInt);
        }
        List<b2> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mOnChildAttachStateListeners.get(size).onChildViewAttachedToWindow(view);
            }
        }
    }

    public void dispatchChildDetached(View view) {
        s2 childViewHolderInt = getChildViewHolderInt(view);
        onChildDetachedFromWindow(view);
        m1 m1Var = this.mAdapter;
        if (m1Var != null && childViewHolderInt != null) {
            m1Var.onViewDetachedFromWindow(childViewHolderInt);
        }
        List<b2> list = this.mOnChildAttachStateListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mOnChildAttachStateListeners.get(size).onChildViewDetachedFromWindow(view);
            }
        }
    }

    public void dispatchLayout() {
        if (this.mAdapter == null) {
            Log.w(TAG, "No adapter attached; skipping layout");
            return;
        }
        if (this.mLayout == null) {
            Log.e(TAG, "No layout manager attached; skipping layout");
            return;
        }
        this.mState.f15077i = false;
        boolean z11 = this.mLastAutoMeasureSkippedDueToExact && !(this.mLastAutoMeasureNonExactMeasuredWidth == getWidth() && this.mLastAutoMeasureNonExactMeasuredHeight == getHeight());
        this.mLastAutoMeasureNonExactMeasuredWidth = 0;
        this.mLastAutoMeasureNonExactMeasuredHeight = 0;
        this.mLastAutoMeasureSkippedDueToExact = false;
        if (this.mState.f15072d == 1) {
            dispatchLayoutStep1();
            this.mLayout.setExactMeasureSpecsFrom(this);
            dispatchLayoutStep2();
        } else {
            b bVar = this.mAdapterHelper;
            if ((bVar.f14886c.isEmpty() || bVar.f14885b.isEmpty()) && !z11 && this.mLayout.getWidth() == getWidth() && this.mLayout.getHeight() == getHeight()) {
                this.mLayout.setExactMeasureSpecsFrom(this);
            } else {
                this.mLayout.setExactMeasureSpecsFrom(this);
                dispatchLayoutStep2();
            }
        }
        dispatchLayoutStep3();
    }

    @Override // android.view.View
    public boolean dispatchNestedFling(float f11, float f12, boolean z11) {
        return getScrollingChildHelper().a(f11, f12, z11);
    }

    @Override // android.view.View
    public boolean dispatchNestedPreFling(float f11, float f12) {
        return getScrollingChildHelper().b(f11, f12);
    }

    @Override // android.view.View
    public boolean dispatchNestedPreScroll(int i5, int i11, int[] iArr, int[] iArr2) {
        return getScrollingChildHelper().c(i5, i11, iArr, iArr2, 0);
    }

    @Override // android.view.View
    public boolean dispatchNestedScroll(int i5, int i11, int i12, int i13, int[] iArr) {
        return getScrollingChildHelper().d(i5, i11, i12, i13, iArr, 0, null);
    }

    public void dispatchOnScrollStateChanged(int i5) {
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.onScrollStateChanged(i5);
        }
        onScrollStateChanged(i5);
        e2 e2Var = this.mScrollListener;
        if (e2Var != null) {
            e2Var.onScrollStateChanged(this, i5);
        }
        List<e2> list = this.mScrollListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mScrollListeners.get(size).onScrollStateChanged(this, i5);
            }
        }
    }

    public void dispatchOnScrolled(int i5, int i11) {
        this.mDispatchScrollCounter++;
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        onScrollChanged(scrollX, scrollY, scrollX - i5, scrollY - i11);
        onScrolled(i5, i11);
        e2 e2Var = this.mScrollListener;
        if (e2Var != null) {
            e2Var.onScrolled(this, i5, i11);
        }
        List<e2> list = this.mScrollListeners;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                this.mScrollListeners.get(size).onScrolled(this, i5, i11);
            }
        }
        this.mDispatchScrollCounter--;
    }

    public void dispatchPendingImportantForAccessibilityChanges() {
        int i5;
        for (int size = this.mPendingAccessibilityImportanceChange.size() - 1; size >= 0; size--) {
            s2 s2Var = this.mPendingAccessibilityImportanceChange.get(size);
            if (s2Var.itemView.getParent() == this && !s2Var.shouldIgnore() && (i5 = s2Var.mPendingAccessibilityState) != -1) {
                View view = s2Var.itemView;
                WeakHashMap weakHashMap = a5.a1.f250a;
                view.setImportantForAccessibility(i5);
                s2Var.mPendingAccessibilityState = -1;
            }
        }
        this.mPendingAccessibilityImportanceChange.clear();
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        onPopulateAccessibilityEvent(accessibilityEvent);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchRestoreInstanceState(SparseArray<Parcelable> sparseArray) {
        dispatchThawSelfOnly(sparseArray);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchSaveInstanceState(SparseArray<Parcelable> sparseArray) {
        dispatchFreezeSelfOnly(sparseArray);
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        boolean z11;
        super.draw(canvas);
        int size = this.mItemDecorations.size();
        boolean z12 = false;
        for (int i5 = 0; i5 < size; i5++) {
            this.mItemDecorations.get(i5).onDrawOver(canvas, this, this.mState);
        }
        EdgeEffect edgeEffect = this.mLeftGlow;
        if (edgeEffect == null || edgeEffect.isFinished()) {
            z11 = false;
        } else {
            int iSave = canvas.save();
            int paddingBottom = this.mClipToPadding ? getPaddingBottom() : 0;
            canvas.rotate(270.0f);
            canvas.translate((-getHeight()) + paddingBottom, 0.0f);
            EdgeEffect edgeEffect2 = this.mLeftGlow;
            z11 = edgeEffect2 != null && edgeEffect2.draw(canvas);
            canvas.restoreToCount(iSave);
        }
        EdgeEffect edgeEffect3 = this.mTopGlow;
        if (edgeEffect3 != null && !edgeEffect3.isFinished()) {
            int iSave2 = canvas.save();
            if (this.mClipToPadding) {
                canvas.translate(getPaddingLeft(), getPaddingTop());
            }
            EdgeEffect edgeEffect4 = this.mTopGlow;
            z11 |= edgeEffect4 != null && edgeEffect4.draw(canvas);
            canvas.restoreToCount(iSave2);
        }
        EdgeEffect edgeEffect5 = this.mRightGlow;
        if (edgeEffect5 != null && !edgeEffect5.isFinished()) {
            int iSave3 = canvas.save();
            int width = getWidth();
            int paddingTop = this.mClipToPadding ? getPaddingTop() : 0;
            canvas.rotate(90.0f);
            canvas.translate(paddingTop, -width);
            EdgeEffect edgeEffect6 = this.mRightGlow;
            z11 |= edgeEffect6 != null && edgeEffect6.draw(canvas);
            canvas.restoreToCount(iSave3);
        }
        EdgeEffect edgeEffect7 = this.mBottomGlow;
        if (edgeEffect7 != null && !edgeEffect7.isFinished()) {
            int iSave4 = canvas.save();
            canvas.rotate(180.0f);
            if (this.mClipToPadding) {
                canvas.translate(getPaddingRight() + (-getWidth()), getPaddingBottom() + (-getHeight()));
            } else {
                canvas.translate(-getWidth(), -getHeight());
            }
            EdgeEffect edgeEffect8 = this.mBottomGlow;
            if (edgeEffect8 != null && edgeEffect8.draw(canvas)) {
                z12 = true;
            }
            z11 |= z12;
            canvas.restoreToCount(iSave4);
        }
        if ((z11 || this.mItemAnimator == null || this.mItemDecorations.size() <= 0 || !this.mItemAnimator.isRunning()) ? z11 : true) {
            WeakHashMap weakHashMap = a5.a1.f250a;
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.ViewGroup
    public boolean drawChild(Canvas canvas, View view, long j11) {
        return super.drawChild(canvas, view, j11);
    }

    public int e() {
        return getPaddingTop();
    }

    public void ensureBottomGlow() {
        if (this.mBottomGlow != null) {
            return;
        }
        EdgeEffect edgeEffectA = this.mEdgeEffectFactory.a(this, 3);
        this.mBottomGlow = edgeEffectA;
        if (this.mClipToPadding) {
            edgeEffectA.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
        } else {
            edgeEffectA.setSize(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    public void ensureLeftGlow() {
        if (this.mLeftGlow != null) {
            return;
        }
        EdgeEffect edgeEffectA = this.mEdgeEffectFactory.a(this, 0);
        this.mLeftGlow = edgeEffectA;
        if (this.mClipToPadding) {
            edgeEffectA.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
        } else {
            edgeEffectA.setSize(getMeasuredHeight(), getMeasuredWidth());
        }
    }

    public void ensureRightGlow() {
        if (this.mRightGlow != null) {
            return;
        }
        EdgeEffect edgeEffectA = this.mEdgeEffectFactory.a(this, 2);
        this.mRightGlow = edgeEffectA;
        if (this.mClipToPadding) {
            edgeEffectA.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
        } else {
            edgeEffectA.setSize(getMeasuredHeight(), getMeasuredWidth());
        }
    }

    public void ensureTopGlow() {
        if (this.mTopGlow != null) {
            return;
        }
        EdgeEffect edgeEffectA = this.mEdgeEffectFactory.a(this, 1);
        this.mTopGlow = edgeEffectA;
        if (this.mClipToPadding) {
            edgeEffectA.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
        } else {
            edgeEffectA.setSize(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    public String exceptionLabel() {
        return " " + super.toString() + ", adapter:" + this.mAdapter + ", layout:" + this.mLayout + ", context:" + getContext();
    }

    public final void fillRemainingScrollValues(o2 o2Var) {
        if (getScrollState() != 2) {
            o2Var.getClass();
            return;
        }
        OverScroller overScroller = this.mViewFlinger.f15111c;
        overScroller.getFinalX();
        overScroller.getCurrX();
        o2Var.getClass();
        overScroller.getFinalY();
        overScroller.getCurrY();
    }

    public View findChildViewUnder(float f11, float f12) {
        for (int iE = this.mChildHelper.e() - 1; iE >= 0; iE--) {
            View viewD = this.mChildHelper.d(iE);
            float translationX = viewD.getTranslationX();
            float translationY = viewD.getTranslationY();
            if (f11 >= viewD.getLeft() + translationX && f11 <= viewD.getRight() + translationX && f12 >= viewD.getTop() + translationY && f12 <= viewD.getBottom() + translationY) {
                return viewD;
            }
        }
        return null;
    }

    public View findContainingItemView(View view) {
        ViewParent parent = view.getParent();
        while (parent != null && parent != this && (parent instanceof View)) {
            view = parent;
            parent = view.getParent();
        }
        if (parent == this) {
            return view;
        }
        return null;
    }

    public s2 findContainingViewHolder(View view) {
        View viewFindContainingItemView = findContainingItemView(view);
        if (viewFindContainingItemView == null) {
            return null;
        }
        return getChildViewHolder(viewFindContainingItemView);
    }

    public s2 findViewHolderForAdapterPosition(int i5) {
        s2 s2Var = null;
        if (this.mDataSetHasChangedAfterLayout) {
            return null;
        }
        int iH = this.mChildHelper.h();
        for (int i11 = 0; i11 < iH; i11++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i11));
            if (childViewHolderInt != null && !childViewHolderInt.isRemoved() && getAdapterPositionInRecyclerView(childViewHolderInt) == i5) {
                i iVar = this.mChildHelper;
                if (!iVar.f14995c.contains(childViewHolderInt.itemView)) {
                    return childViewHolderInt;
                }
                s2Var = childViewHolderInt;
            }
        }
        return s2Var;
    }

    public s2 findViewHolderForItemId(long j11) {
        m1 m1Var = this.mAdapter;
        s2 s2Var = null;
        if (m1Var != null && m1Var.hasStableIds()) {
            int iH = this.mChildHelper.h();
            for (int i5 = 0; i5 < iH; i5++) {
                s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i5));
                if (childViewHolderInt != null && !childViewHolderInt.isRemoved() && childViewHolderInt.getItemId() == j11) {
                    i iVar = this.mChildHelper;
                    if (!iVar.f14995c.contains(childViewHolderInt.itemView)) {
                        return childViewHolderInt;
                    }
                    s2Var = childViewHolderInt;
                }
            }
        }
        return s2Var;
    }

    public s2 findViewHolderForLayoutPosition(int i5) {
        return findViewHolderForPosition(i5, false);
    }

    @Deprecated
    public s2 findViewHolderForPosition(int i5) {
        return findViewHolderForPosition(i5, false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r0v6 */
    public boolean fling(int i5, int i11) {
        int iMax;
        int i12;
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            Log.e(TAG, "Cannot fling without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            return false;
        }
        if (this.mLayoutSuppressed) {
            return false;
        }
        int iCanScrollHorizontally = z1Var.canScrollHorizontally();
        boolean zCanScrollVertically = this.mLayout.canScrollVertically();
        if (iCanScrollHorizontally == 0 || Math.abs(i5) < this.mMinFlingVelocity) {
            i5 = 0;
        }
        if (!zCanScrollVertically || Math.abs(i11) < this.mMinFlingVelocity) {
            i11 = 0;
        }
        if (i5 == 0 && i11 == 0) {
            return false;
        }
        if (i5 == 0) {
            iMax = 0;
        } else {
            EdgeEffect edgeEffect = this.mLeftGlow;
            if (edgeEffect == null || a.a.P(edgeEffect) == 0.0f) {
                EdgeEffect edgeEffect2 = this.mRightGlow;
                if (edgeEffect2 != null && a.a.P(edgeEffect2) != 0.0f) {
                    if (shouldAbsorb(this.mRightGlow, i5, getWidth())) {
                        this.mRightGlow.onAbsorb(i5);
                        i5 = 0;
                    }
                    iMax = i5;
                    i5 = 0;
                }
                iMax = 0;
            } else {
                int i13 = -i5;
                if (shouldAbsorb(this.mLeftGlow, i13, getWidth())) {
                    this.mLeftGlow.onAbsorb(i13);
                    i5 = 0;
                }
                iMax = i5;
                i5 = 0;
            }
        }
        if (i11 == 0) {
            i12 = i11;
            i11 = 0;
        } else {
            EdgeEffect edgeEffect3 = this.mTopGlow;
            if (edgeEffect3 == null || a.a.P(edgeEffect3) == 0.0f) {
                EdgeEffect edgeEffect4 = this.mBottomGlow;
                if (edgeEffect4 != null && a.a.P(edgeEffect4) != 0.0f) {
                    if (shouldAbsorb(this.mBottomGlow, i11, getHeight())) {
                        this.mBottomGlow.onAbsorb(i11);
                        i11 = 0;
                    }
                    i12 = 0;
                }
                i12 = i11;
                i11 = 0;
            } else {
                int i14 = -i11;
                if (shouldAbsorb(this.mTopGlow, i14, getHeight())) {
                    this.mTopGlow.onAbsorb(i14);
                    i11 = 0;
                }
                i12 = 0;
            }
        }
        if (iMax != 0 || i11 != 0) {
            int i15 = this.mMaxFlingVelocity;
            iMax = Math.max(-i15, Math.min(iMax, i15));
            int i16 = this.mMaxFlingVelocity;
            i11 = Math.max(-i16, Math.min(i11, i16));
            this.mViewFlinger.a(iMax, i11);
        }
        if (i5 == 0 && i12 == 0) {
            return (iMax == 0 && i11 == 0) ? false : true;
        }
        float f11 = i5;
        float f12 = i12;
        if (!dispatchNestedPreFling(f11, f12)) {
            boolean z11 = iCanScrollHorizontally != 0 || zCanScrollVertically;
            dispatchNestedFling(f11, f12, z11);
            c2 c2Var = this.mOnFlingListener;
            if (c2Var != null && c2Var.onFling(i5, i12)) {
                return true;
            }
            if (z11) {
                if (zCanScrollVertically) {
                    iCanScrollHorizontally = (iCanScrollHorizontally == true ? 1 : 0) | 2;
                }
                startNestedScroll(iCanScrollHorizontally, 1);
                int i17 = this.mMaxFlingVelocity;
                int iMax2 = Math.max(-i17, Math.min(i5, i17));
                int i18 = this.mMaxFlingVelocity;
                this.mViewFlinger.a(iMax2, Math.max(-i18, Math.min(i12, i18)));
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:80:0x00dc A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x00dd  */
    @Override // android.view.ViewGroup, android.view.ViewParent
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public View focusSearch(View view, int i5) {
        View viewOnFocusSearchFailed;
        boolean z11;
        View viewOnInterceptFocusSearch = this.mLayout.onInterceptFocusSearch(view, i5);
        if (viewOnInterceptFocusSearch != null) {
            return viewOnInterceptFocusSearch;
        }
        boolean z12 = (this.mAdapter == null || this.mLayout == null || isComputingLayout() || this.mLayoutSuppressed) ? false : true;
        FocusFinder focusFinder = FocusFinder.getInstance();
        if (!z12 || (i5 != 2 && i5 != 1)) {
            View viewFindNextFocus = focusFinder.findNextFocus(this, view, i5);
            if (viewFindNextFocus == null && z12) {
                consumePendingUpdateOperations();
                if (findContainingItemView(view) != null) {
                    startInterceptRequestLayout();
                    viewOnFocusSearchFailed = this.mLayout.onFocusSearchFailed(view, i5, this.mRecycler, this.mState);
                    stopInterceptRequestLayout(false);
                }
                return null;
            }
            viewOnFocusSearchFailed = viewFindNextFocus;
            if (viewOnFocusSearchFailed != null || viewOnFocusSearchFailed.hasFocusable()) {
                return !isPreferredNextFocus(view, viewOnFocusSearchFailed, i5) ? viewOnFocusSearchFailed : super.focusSearch(view, i5);
            }
            if (getFocusedChild() == null) {
                return super.focusSearch(view, i5);
            }
            requestChildOnScreen(viewOnFocusSearchFailed, null);
            return view;
        }
        if (this.mLayout.canScrollVertically()) {
            int i11 = i5 == 2 ? Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE : 33;
            z11 = focusFinder.findNextFocus(this, view, i11) == null;
            if (FORCE_ABS_FOCUS_SEARCH_DIRECTION) {
                i5 = i11;
            }
        } else {
            z11 = false;
        }
        if (!z11 && this.mLayout.canScrollHorizontally()) {
            int i12 = (this.mLayout.getLayoutDirection() == 1) ^ (i5 == 2) ? 66 : 17;
            boolean z13 = focusFinder.findNextFocus(this, view, i12) == null;
            if (FORCE_ABS_FOCUS_SEARCH_DIRECTION) {
                i5 = i12;
            }
            z11 = z13;
        }
        if (z11) {
            consumePendingUpdateOperations();
            if (findContainingItemView(view) != null) {
                startInterceptRequestLayout();
                this.mLayout.onFocusSearchFailed(view, i5, this.mRecycler, this.mState);
                stopInterceptRequestLayout(false);
            }
            return null;
        }
        viewOnFocusSearchFailed = focusFinder.findNextFocus(this, view, i5);
        if (viewOnFocusSearchFailed != null) {
        }
        if (!isPreferredNextFocus(view, viewOnFocusSearchFailed, i5)) {
        }
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateDefaultLayoutParams() {
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            return z1Var.generateDefaultLayoutParams();
        }
        throw new IllegalStateException(a2.c.j(this, new StringBuilder("RecyclerView has no LayoutManager")));
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            return z1Var.generateLayoutParams(getContext(), attributeSet);
        }
        throw new IllegalStateException(a2.c.j(this, new StringBuilder("RecyclerView has no LayoutManager")));
    }

    @Override // android.view.ViewGroup, android.view.View
    public CharSequence getAccessibilityClassName() {
        return "androidx.recyclerview.widget.RecyclerView";
    }

    public m1 getAdapter() {
        return this.mAdapter;
    }

    public int getAdapterPositionInRecyclerView(s2 s2Var) {
        if (s2Var.hasAnyOfTheFlags(524) || !s2Var.isBound()) {
            return -1;
        }
        b bVar = this.mAdapterHelper;
        int i5 = s2Var.mPosition;
        ArrayList arrayList = bVar.f14885b;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            a aVar = (a) arrayList.get(i11);
            int i12 = aVar.f14873a;
            if (i12 != 1) {
                if (i12 == 2) {
                    int i13 = aVar.f14874b;
                    if (i13 <= i5) {
                        int i14 = aVar.f14876d;
                        if (i13 + i14 > i5) {
                            return -1;
                        }
                        i5 -= i14;
                    } else {
                        continue;
                    }
                } else if (i12 == 8) {
                    int i15 = aVar.f14874b;
                    if (i15 == i5) {
                        i5 = aVar.f14876d;
                    } else {
                        if (i15 < i5) {
                            i5--;
                        }
                        if (aVar.f14876d <= i5) {
                            i5++;
                        }
                    }
                }
            } else if (aVar.f14874b <= i5) {
                i5 += aVar.f14876d;
            }
        }
        return i5;
    }

    @Override // android.view.View
    public int getBaseline() {
        z1 z1Var = this.mLayout;
        return z1Var != null ? z1Var.getBaseline() : super.getBaseline();
    }

    public long getChangedHolderKey(s2 s2Var) {
        return this.mAdapter.hasStableIds() ? s2Var.getItemId() : s2Var.mPosition;
    }

    public int getChildAdapterPosition(View view) {
        s2 childViewHolderInt = getChildViewHolderInt(view);
        if (childViewHolderInt != null) {
            return childViewHolderInt.getAbsoluteAdapterPosition();
        }
        return -1;
    }

    @Override // android.view.ViewGroup
    public int getChildDrawingOrder(int i5, int i11) {
        return super.getChildDrawingOrder(i5, i11);
    }

    public long getChildItemId(View view) {
        s2 childViewHolderInt;
        m1 m1Var = this.mAdapter;
        if (m1Var == null || !m1Var.hasStableIds() || (childViewHolderInt = getChildViewHolderInt(view)) == null) {
            return -1L;
        }
        return childViewHolderInt.getItemId();
    }

    public int getChildLayoutPosition(View view) {
        s2 childViewHolderInt = getChildViewHolderInt(view);
        if (childViewHolderInt != null) {
            return childViewHolderInt.getLayoutPosition();
        }
        return -1;
    }

    @Deprecated
    public int getChildPosition(View view) {
        return getChildAdapterPosition(view);
    }

    public s2 getChildViewHolder(View view) {
        ViewParent parent = view.getParent();
        if (parent == null || parent == this) {
            return getChildViewHolderInt(view);
        }
        throw new IllegalArgumentException("View " + view + " is not a direct child of " + this);
    }

    @Override // android.view.ViewGroup
    public boolean getClipToPadding() {
        return this.mClipToPadding;
    }

    public u2 getCompatAccessibilityDelegate() {
        return this.mAccessibilityDelegate;
    }

    public void getDecoratedBoundsWithMargins(View view, Rect rect) {
        getDecoratedBoundsWithMarginsInt(view, rect);
    }

    public q1 getEdgeEffectFactory() {
        return this.mEdgeEffectFactory;
    }

    public u1 getItemAnimator() {
        return this.mItemAnimator;
    }

    public Rect getItemDecorInsetsForChild(View view) {
        a2 a2Var = (a2) view.getLayoutParams();
        boolean z11 = a2Var.f14882c;
        Rect rect = a2Var.f14881b;
        if (!z11 || (this.mState.f15075g && (a2Var.f14880a.isUpdated() || a2Var.f14880a.isInvalid()))) {
            return rect;
        }
        rect.set(0, 0, 0, 0);
        int size = this.mItemDecorations.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.mTempRect.set(0, 0, 0, 0);
            this.mItemDecorations.get(i5).getItemOffsets(this.mTempRect, view, this, this.mState);
            int i11 = rect.left;
            Rect rect2 = this.mTempRect;
            rect.left = i11 + rect2.left;
            rect.top += rect2.top;
            rect.right += rect2.right;
            rect.bottom += rect2.bottom;
        }
        a2Var.f14882c = false;
        return rect;
    }

    public v1 getItemDecorationAt(int i5) {
        int itemDecorationCount = getItemDecorationCount();
        if (i5 >= 0 && i5 < itemDecorationCount) {
            return this.mItemDecorations.get(i5);
        }
        throw new IndexOutOfBoundsException(i5 + " is an invalid index for size " + itemDecorationCount);
    }

    public int getItemDecorationCount() {
        return this.mItemDecorations.size();
    }

    public z1 getLayoutManager() {
        return this.mLayout;
    }

    public int getMaxFlingVelocity() {
        return this.mMaxFlingVelocity;
    }

    public int getMinFlingVelocity() {
        return this.mMinFlingVelocity;
    }

    public long getNanoTime() {
        if (ALLOW_THREAD_GAP_WORK) {
            return System.nanoTime();
        }
        return 0L;
    }

    public c2 getOnFlingListener() {
        return this.mOnFlingListener;
    }

    public boolean getPreserveFocusAfterLayout() {
        return this.mPreserveFocusAfterLayout;
    }

    public g2 getRecycledViewPool() {
        return this.mRecycler.c();
    }

    public int getScrollState() {
        return this.mScrollState;
    }

    public boolean hasFixedSize() {
        return this.mHasFixedSize;
    }

    @Override // android.view.View
    public boolean hasNestedScrollingParent() {
        return getScrollingChildHelper().f(0);
    }

    public boolean hasPendingAdapterUpdates() {
        return !this.mFirstLayoutComplete || this.mDataSetHasChangedAfterLayout || this.mAdapterHelper.g();
    }

    public void initAdapterManager() {
        this.mAdapterHelper = new b(new k1(this));
    }

    public void initFastScroller(StateListDrawable stateListDrawable, Drawable drawable, StateListDrawable stateListDrawable2, Drawable drawable2) {
        if (stateListDrawable == null || drawable == null || stateListDrawable2 == null || drawable2 == null) {
            throw new IllegalArgumentException(a2.c.j(this, new StringBuilder("Trying to set fast scroller without both required drawables.")));
        }
        Resources resources = getContext().getResources();
        new b0(this, stateListDrawable, drawable, stateListDrawable2, drawable2, resources.getDimensionPixelSize(2131165497), resources.getDimensionPixelSize(2131165500), resources.getDimensionPixelOffset(2131165499));
    }

    public void invalidateGlows() {
        this.mBottomGlow = null;
        this.mTopGlow = null;
        this.mRightGlow = null;
        this.mLeftGlow = null;
    }

    public void invalidateItemDecorations() {
        if (this.mItemDecorations.size() == 0) {
            return;
        }
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.assertNotInLayoutOrScroll("Cannot invalidate item decorations during a scroll or layout");
        }
        markItemDecorInsetsDirty();
        requestLayout();
    }

    public boolean isAccessibilityEnabled() {
        AccessibilityManager accessibilityManager = this.mAccessibilityManager;
        return accessibilityManager != null && accessibilityManager.isEnabled();
    }

    public boolean isAnimating() {
        u1 u1Var = this.mItemAnimator;
        return u1Var != null && u1Var.isRunning();
    }

    @Override // android.view.View
    public boolean isAttachedToWindow() {
        return this.mIsAttached;
    }

    public boolean isComputingLayout() {
        return this.mLayoutOrScrollCounter > 0;
    }

    @Deprecated
    public boolean isLayoutFrozen() {
        return isLayoutSuppressed();
    }

    @Override // android.view.ViewGroup
    public final boolean isLayoutSuppressed() {
        return this.mLayoutSuppressed;
    }

    @Override // android.view.View
    public boolean isNestedScrollingEnabled() {
        return getScrollingChildHelper().f379d;
    }

    public void jumpToPositionForSmoothScroller(int i5) {
        if (this.mLayout == null) {
            return;
        }
        setScrollState(2);
        this.mLayout.scrollToPosition(i5);
        awakenScrollBars();
    }

    public void markItemDecorInsetsDirty() {
        int iH = this.mChildHelper.h();
        for (int i5 = 0; i5 < iH; i5++) {
            ((a2) this.mChildHelper.g(i5).getLayoutParams()).f14882c = true;
        }
        ArrayList arrayList = this.mRecycler.f14983c;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            a2 a2Var = (a2) ((s2) arrayList.get(i11)).itemView.getLayoutParams();
            if (a2Var != null) {
                a2Var.f14882c = true;
            }
        }
    }

    public void markKnownViewsInvalid() {
        int iH = this.mChildHelper.h();
        for (int i5 = 0; i5 < iH; i5++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i5));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.addFlags(6);
            }
        }
        markItemDecorInsetsDirty();
        h2 h2Var = this.mRecycler;
        ArrayList arrayList = h2Var.f14983c;
        int size = arrayList.size();
        for (int i11 = 0; i11 < size; i11++) {
            s2 s2Var = (s2) arrayList.get(i11);
            if (s2Var != null) {
                s2Var.addFlags(6);
                s2Var.addChangePayload(null);
            }
        }
        m1 m1Var = h2Var.f14988h.mAdapter;
        if (m1Var == null || !m1Var.hasStableIds()) {
            h2Var.g();
        }
    }

    public void nestedScrollBy(int i5, int i11) {
        nestedScrollByInternal(i5, i11, null, 1);
    }

    public void offsetChildrenHorizontal(int i5) {
        int iE = this.mChildHelper.e();
        for (int i11 = 0; i11 < iE; i11++) {
            this.mChildHelper.d(i11).offsetLeftAndRight(i5);
        }
    }

    public void offsetChildrenVertical(int i5) {
        int iE = this.mChildHelper.e();
        for (int i11 = 0; i11 < iE; i11++) {
            this.mChildHelper.d(i11).offsetTopAndBottom(i5);
        }
    }

    public void offsetPositionRecordsForInsert(int i5, int i11) {
        int iH = this.mChildHelper.h();
        for (int i12 = 0; i12 < iH; i12++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i12));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore() && childViewHolderInt.mPosition >= i5) {
                if (sVerboseLoggingEnabled) {
                    childViewHolderInt.toString();
                }
                childViewHolderInt.offsetPosition(i11, false);
                this.mState.f15074f = true;
            }
        }
        ArrayList arrayList = this.mRecycler.f14983c;
        int size = arrayList.size();
        for (int i13 = 0; i13 < size; i13++) {
            s2 s2Var = (s2) arrayList.get(i13);
            if (s2Var != null && s2Var.mPosition >= i5) {
                if (sVerboseLoggingEnabled) {
                    s2Var.toString();
                }
                s2Var.offsetPosition(i11, false);
            }
        }
        requestLayout();
    }

    public void offsetPositionRecordsForMove(int i5, int i11) {
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        int i17;
        int i18;
        int iH = this.mChildHelper.h();
        int i19 = -1;
        if (i5 < i11) {
            i13 = i5;
            i12 = i11;
            i14 = -1;
        } else {
            i12 = i5;
            i13 = i11;
            i14 = 1;
        }
        for (int i21 = 0; i21 < iH; i21++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i21));
            if (childViewHolderInt != null && (i18 = childViewHolderInt.mPosition) >= i13 && i18 <= i12) {
                if (sVerboseLoggingEnabled) {
                    childViewHolderInt.toString();
                }
                if (childViewHolderInt.mPosition == i5) {
                    childViewHolderInt.offsetPosition(i11 - i5, false);
                } else {
                    childViewHolderInt.offsetPosition(i14, false);
                }
                this.mState.f15074f = true;
            }
        }
        ArrayList arrayList = this.mRecycler.f14983c;
        if (i5 < i11) {
            i16 = i5;
            i15 = i11;
        } else {
            i15 = i5;
            i19 = 1;
            i16 = i11;
        }
        int size = arrayList.size();
        for (int i22 = 0; i22 < size; i22++) {
            s2 s2Var = (s2) arrayList.get(i22);
            if (s2Var != null && (i17 = s2Var.mPosition) >= i16 && i17 <= i15) {
                if (i17 == i5) {
                    s2Var.offsetPosition(i11 - i5, false);
                } else {
                    s2Var.offsetPosition(i19, false);
                }
                if (sVerboseLoggingEnabled) {
                    s2Var.toString();
                }
            }
        }
        requestLayout();
    }

    public void offsetPositionRecordsForRemove(int i5, int i11, boolean z11) {
        int i12 = i5 + i11;
        int iH = this.mChildHelper.h();
        for (int i13 = 0; i13 < iH; i13++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i13));
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore()) {
                int i14 = childViewHolderInt.mPosition;
                if (i14 >= i12) {
                    if (sVerboseLoggingEnabled) {
                        childViewHolderInt.toString();
                    }
                    childViewHolderInt.offsetPosition(-i11, z11);
                    this.mState.f15074f = true;
                } else if (i14 >= i5) {
                    if (sVerboseLoggingEnabled) {
                        childViewHolderInt.toString();
                    }
                    childViewHolderInt.flagRemovedAndOffsetPosition(i5 - 1, -i11, z11);
                    this.mState.f15074f = true;
                }
            }
        }
        h2 h2Var = this.mRecycler;
        ArrayList arrayList = h2Var.f14983c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            s2 s2Var = (s2) arrayList.get(size);
            if (s2Var != null) {
                int i15 = s2Var.mPosition;
                if (i15 >= i12) {
                    if (sVerboseLoggingEnabled) {
                        s2Var.toString();
                    }
                    s2Var.offsetPosition(-i11, z11);
                } else if (i15 >= i5) {
                    s2Var.addFlags(8);
                    h2Var.h(size);
                }
            }
        }
        requestLayout();
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0063  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onAttachedToWindow() {
        float refreshRate;
        super.onAttachedToWindow();
        this.mLayoutOrScrollCounter = 0;
        this.mIsAttached = true;
        this.mFirstLayoutComplete = this.mFirstLayoutComplete && !isLayoutRequested();
        this.mRecycler.e();
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.dispatchAttachedToWindow(this);
        }
        this.mPostedAnimatorRunner = false;
        if (ALLOW_THREAD_GAP_WORK) {
            ThreadLocal threadLocal = f0.f14950e;
            f0 f0Var = (f0) threadLocal.get();
            this.mGapWorker = f0Var;
            if (f0Var == null) {
                f0 f0Var2 = new f0();
                f0Var2.f14952a = new ArrayList();
                f0Var2.f14955d = new ArrayList();
                this.mGapWorker = f0Var2;
                WeakHashMap weakHashMap = a5.a1.f250a;
                Display display = getDisplay();
                if (isInEditMode() || display == null) {
                    refreshRate = 60.0f;
                    f0 f0Var3 = this.mGapWorker;
                    f0Var3.f14954c = (long) (1.0E9f / refreshRate);
                    threadLocal.set(f0Var3);
                } else {
                    refreshRate = display.getRefreshRate();
                    if (refreshRate < 30.0f) {
                    }
                    f0 f0Var32 = this.mGapWorker;
                    f0Var32.f14954c = (long) (1.0E9f / refreshRate);
                    threadLocal.set(f0Var32);
                }
            }
            ArrayList arrayList = this.mGapWorker.f14952a;
            if (sDebugAssertionsEnabled && arrayList.contains(this)) {
                throw new IllegalStateException("RecyclerView already present in worker list!");
            }
            arrayList.add(this);
        }
    }

    public void onChildAttachedToWindow(View view) {
    }

    public void onChildDetachedFromWindow(View view) {
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        f0 f0Var;
        super.onDetachedFromWindow();
        u1 u1Var = this.mItemAnimator;
        if (u1Var != null) {
            u1Var.endAnimations();
        }
        stopScroll();
        int i5 = 0;
        this.mIsAttached = false;
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.dispatchDetachedFromWindow(this, this.mRecycler);
        }
        this.mPendingAccessibilityImportanceChange.clear();
        removeCallbacks(this.mItemAnimatorRunner);
        this.mViewInfoStore.getClass();
        while (h3.f14989d.a() != null) {
        }
        h2 h2Var = this.mRecycler;
        ArrayList arrayList = h2Var.f14983c;
        for (int i11 = 0; i11 < arrayList.size(); i11++) {
            fg.a.e(((s2) arrayList.get(i11)).itemView);
        }
        h2Var.f(h2Var.f14988h.mAdapter, false);
        while (i5 < getChildCount()) {
            int i12 = i5 + 1;
            View childAt = getChildAt(i5);
            if (childAt == null) {
                throw new IndexOutOfBoundsException();
            }
            ArrayList arrayList2 = fg.a.x(childAt).f82085a;
            for (int iK = ul.b.K(arrayList2); -1 < iK; iK--) {
                ((c3.h3) arrayList2.get(iK)).f19318a.disposeComposition();
            }
            i5 = i12;
        }
        if (!ALLOW_THREAD_GAP_WORK || (f0Var = this.mGapWorker) == null) {
            return;
        }
        boolean zRemove = f0Var.f14952a.remove(this);
        if (sDebugAssertionsEnabled && !zRemove) {
            throw new IllegalStateException("RecyclerView removal failed!");
        }
        this.mGapWorker = null;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int size = this.mItemDecorations.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.mItemDecorations.get(i5).onDraw(canvas, this, this.mState);
        }
    }

    public void onEnterLayoutOrScroll() {
        this.mLayoutOrScrollCounter++;
    }

    public void onExitLayoutOrScroll() {
        onExitLayoutOrScroll(true);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x006c  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onGenericMotionEvent(MotionEvent motionEvent) {
        float f11;
        float axisValue;
        if (this.mLayout != null && !this.mLayoutSuppressed && motionEvent.getAction() == 8) {
            if ((motionEvent.getSource() & 2) != 0) {
                f11 = this.mLayout.canScrollVertically() ? -motionEvent.getAxisValue(9) : 0.0f;
                axisValue = this.mLayout.canScrollHorizontally() ? motionEvent.getAxisValue(10) : 0.0f;
                if (f11 != 0.0f || axisValue != 0.0f) {
                    nestedScrollByInternal((int) (axisValue * this.mScaledHorizontalScrollFactor), (int) (f11 * this.mScaledVerticalScrollFactor), motionEvent, 1);
                }
            } else if ((motionEvent.getSource() & 4194304) != 0) {
                float axisValue2 = motionEvent.getAxisValue(26);
                if (this.mLayout.canScrollVertically()) {
                    f11 = -axisValue2;
                    if (f11 != 0.0f) {
                        nestedScrollByInternal((int) (axisValue * this.mScaledHorizontalScrollFactor), (int) (f11 * this.mScaledVerticalScrollFactor), motionEvent, 1);
                    }
                } else {
                    if (this.mLayout.canScrollHorizontally()) {
                        axisValue = axisValue2;
                        f11 = 0.0f;
                    } else {
                        f11 = 0.0f;
                        axisValue = 0.0f;
                    }
                    if (f11 != 0.0f) {
                    }
                }
            }
        }
        return false;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z11;
        if (this.mLayoutSuppressed) {
            return false;
        }
        this.mInterceptingOnItemTouchListener = null;
        if (findInterceptingOnItemTouchListener(motionEvent)) {
            cancelScroll();
            return true;
        }
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            return false;
        }
        boolean zCanScrollHorizontally = z1Var.canScrollHorizontally();
        boolean zCanScrollVertically = this.mLayout.canScrollVertically();
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        if (actionMasked == 0) {
            if (this.mIgnoreMotionEventTillDown) {
                this.mIgnoreMotionEventTillDown = false;
            }
            this.mScrollPointerId = motionEvent.getPointerId(0);
            int x11 = (int) (motionEvent.getX() + 0.5f);
            this.mLastTouchX = x11;
            this.mInitialTouchX = x11;
            int y11 = (int) (motionEvent.getY() + 0.5f);
            this.mLastTouchY = y11;
            this.mInitialTouchY = y11;
            if (stopGlowAnimations(motionEvent) || this.mScrollState == 2) {
                getParent().requestDisallowInterceptTouchEvent(true);
                setScrollState(1);
                stopNestedScroll(1);
            }
            int[] iArr = this.mNestedOffsets;
            iArr[1] = 0;
            iArr[0] = 0;
            int i5 = zCanScrollHorizontally;
            if (zCanScrollVertically) {
                i5 = (zCanScrollHorizontally ? 1 : 0) | 2;
            }
            startNestedScroll(i5, 0);
        } else if (actionMasked == 1) {
            this.mVelocityTracker.clear();
            stopNestedScroll(0);
        } else if (actionMasked == 2) {
            int iFindPointerIndex = motionEvent.findPointerIndex(this.mScrollPointerId);
            if (iFindPointerIndex < 0) {
                Log.e(TAG, "Error processing scroll; pointer index for id " + this.mScrollPointerId + " not found. Did any MotionEvents get skipped?");
                return false;
            }
            int x12 = (int) (motionEvent.getX(iFindPointerIndex) + 0.5f);
            int y12 = (int) (motionEvent.getY(iFindPointerIndex) + 0.5f);
            if (this.mScrollState != 1) {
                int i11 = x12 - this.mInitialTouchX;
                int i12 = y12 - this.mInitialTouchY;
                if (zCanScrollHorizontally == 0 || Math.abs(i11) <= this.mTouchSlop) {
                    z11 = false;
                } else {
                    this.mLastTouchX = x12;
                    z11 = true;
                }
                if (zCanScrollVertically && Math.abs(i12) > this.mTouchSlop) {
                    this.mLastTouchY = y12;
                    z11 = true;
                }
                if (z11) {
                    setScrollState(1);
                }
            }
        } else if (actionMasked == 3) {
            cancelScroll();
        } else if (actionMasked == 5) {
            this.mScrollPointerId = motionEvent.getPointerId(actionIndex);
            int x13 = (int) (motionEvent.getX(actionIndex) + 0.5f);
            this.mLastTouchX = x13;
            this.mInitialTouchX = x13;
            int y13 = (int) (motionEvent.getY(actionIndex) + 0.5f);
            this.mLastTouchY = y13;
            this.mInitialTouchY = y13;
        } else if (actionMasked == 6) {
            onPointerUp(motionEvent);
        }
        return this.mScrollState == 1;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14 = w4.i.f93753a;
        Trace.beginSection(TRACE_ON_LAYOUT_TAG);
        dispatchLayout();
        Trace.endSection();
        this.mFirstLayoutComplete = true;
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            defaultOnMeasure(i5, i11);
            return;
        }
        boolean z11 = false;
        if (z1Var.isAutoMeasureEnabled()) {
            int mode = View.MeasureSpec.getMode(i5);
            int mode2 = View.MeasureSpec.getMode(i11);
            this.mLayout.onMeasure(this.mRecycler, this.mState, i5, i11);
            if (mode == 1073741824 && mode2 == 1073741824) {
                z11 = true;
            }
            this.mLastAutoMeasureSkippedDueToExact = z11;
            if (z11 || this.mAdapter == null) {
                return;
            }
            if (this.mState.f15072d == 1) {
                dispatchLayoutStep1();
            }
            this.mLayout.setMeasureSpecs(i5, i11);
            this.mState.f15077i = true;
            dispatchLayoutStep2();
            this.mLayout.setMeasuredDimensionFromChildren(i5, i11);
            if (this.mLayout.shouldMeasureTwice()) {
                this.mLayout.setMeasureSpecs(View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 1073741824));
                this.mState.f15077i = true;
                dispatchLayoutStep2();
                this.mLayout.setMeasuredDimensionFromChildren(i5, i11);
            }
            this.mLastAutoMeasureNonExactMeasuredWidth = getMeasuredWidth();
            this.mLastAutoMeasureNonExactMeasuredHeight = getMeasuredHeight();
            return;
        }
        if (this.mHasFixedSize) {
            this.mLayout.onMeasure(this.mRecycler, this.mState, i5, i11);
            return;
        }
        if (this.mAdapterUpdateDuringMeasure) {
            startInterceptRequestLayout();
            onEnterLayoutOrScroll();
            processAdapterUpdatesAndSetAnimationFlags();
            onExitLayoutOrScroll();
            o2 o2Var = this.mState;
            if (o2Var.f15079k) {
                o2Var.f15075g = true;
            } else {
                this.mAdapterHelper.c();
                this.mState.f15075g = false;
            }
            this.mAdapterUpdateDuringMeasure = false;
            stopInterceptRequestLayout(false);
        } else if (this.mState.f15079k) {
            setMeasuredDimension(getMeasuredWidth(), getMeasuredHeight());
            return;
        }
        m1 m1Var = this.mAdapter;
        if (m1Var != null) {
            this.mState.f15073e = m1Var.getItemCount();
        } else {
            this.mState.f15073e = 0;
        }
        startInterceptRequestLayout();
        this.mLayout.onMeasure(this.mRecycler, this.mState, i5, i11);
        stopInterceptRequestLayout(false);
        this.mState.f15075g = false;
    }

    @Override // android.view.ViewGroup
    public boolean onRequestFocusInDescendants(int i5, Rect rect) {
        if (isComputingLayout()) {
            return false;
        }
        return super.onRequestFocusInDescendants(i5, rect);
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        this.mPendingSavedState = savedState;
        super.onRestoreInstanceState(savedState.b());
        requestLayout();
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        SavedState savedState2 = this.mPendingSavedState;
        if (savedState2 != null) {
            savedState.d(savedState2);
            return savedState;
        }
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            savedState.f14838c = z1Var.onSaveInstanceState();
            return savedState;
        }
        savedState.f14838c = null;
        return savedState;
    }

    public void onScrollStateChanged(int i5) {
    }

    public void onScrolled(int i5, int i11) {
    }

    @Override // android.view.View
    public void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        if (i5 == i12 && i11 == i13) {
            return;
        }
        invalidateGlows();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00dc A[PHI: r1
      0x00dc: PHI (r1v46 int) = (r1v26 int), (r1v50 int) binds: [B:41:0x00c5, B:45:0x00d8] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00f5  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z11;
        if (this.mLayoutSuppressed || this.mIgnoreMotionEventTillDown) {
            return false;
        }
        if (dispatchToOnItemTouchListeners(motionEvent)) {
            cancelScroll();
            return true;
        }
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            return false;
        }
        boolean zCanScrollHorizontally = z1Var.canScrollHorizontally();
        boolean zCanScrollVertically = this.mLayout.canScrollVertically();
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = motionEvent.getActionIndex();
        if (actionMasked == 0) {
            int[] iArr = this.mNestedOffsets;
            iArr[1] = 0;
            iArr[0] = 0;
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        int[] iArr2 = this.mNestedOffsets;
        motionEventObtain.offsetLocation(iArr2[0], iArr2[1]);
        if (actionMasked == 0) {
            this.mScrollPointerId = motionEvent.getPointerId(0);
            int x11 = (int) (motionEvent.getX() + 0.5f);
            this.mLastTouchX = x11;
            this.mInitialTouchX = x11;
            int y11 = (int) (motionEvent.getY() + 0.5f);
            this.mLastTouchY = y11;
            this.mInitialTouchY = y11;
            int i5 = zCanScrollHorizontally;
            if (zCanScrollVertically) {
                i5 = (zCanScrollHorizontally ? 1 : 0) | 2;
            }
            startNestedScroll(i5, 0);
        } else {
            if (actionMasked == 1) {
                this.mVelocityTracker.addMovement(motionEventObtain);
                this.mVelocityTracker.computeCurrentVelocity(1000, this.mMaxFlingVelocity);
                float f11 = zCanScrollHorizontally != 0 ? -this.mVelocityTracker.getXVelocity(this.mScrollPointerId) : 0.0f;
                float f12 = zCanScrollVertically ? -this.mVelocityTracker.getYVelocity(this.mScrollPointerId) : 0.0f;
                if ((f11 == 0.0f && f12 == 0.0f) || !fling((int) f11, (int) f12)) {
                    setScrollState(0);
                }
                resetScroll();
                motionEventObtain.recycle();
                return true;
            }
            if (actionMasked == 2) {
                int iFindPointerIndex = motionEvent.findPointerIndex(this.mScrollPointerId);
                if (iFindPointerIndex < 0) {
                    Log.e(TAG, "Error processing scroll; pointer index for id " + this.mScrollPointerId + " not found. Did any MotionEvents get skipped?");
                    return false;
                }
                int x12 = (int) (motionEvent.getX(iFindPointerIndex) + 0.5f);
                int y12 = (int) (motionEvent.getY(iFindPointerIndex) + 0.5f);
                int iMax = this.mLastTouchX - x12;
                int iMax2 = this.mLastTouchY - y12;
                if (this.mScrollState != 1) {
                    if (zCanScrollHorizontally == 0) {
                        z11 = false;
                        if (zCanScrollVertically) {
                            iMax2 = iMax2 > 0 ? Math.max(0, iMax2 - this.mTouchSlop) : Math.min(0, iMax2 + this.mTouchSlop);
                            if (iMax2 != 0) {
                                z11 = true;
                            }
                        }
                        if (z11) {
                            setScrollState(1);
                        }
                    } else {
                        iMax = iMax > 0 ? Math.max(0, iMax - this.mTouchSlop) : Math.min(0, iMax + this.mTouchSlop);
                        if (iMax != 0) {
                            z11 = true;
                        }
                        if (zCanScrollVertically) {
                        }
                        if (z11) {
                        }
                    }
                    motionEventObtain.recycle();
                    return true;
                }
                if (this.mScrollState == 1) {
                    int[] iArr3 = this.mReusableIntPair;
                    iArr3[0] = 0;
                    iArr3[1] = 0;
                    int iReleaseHorizontalGlow = iMax - releaseHorizontalGlow(iMax, motionEvent.getY());
                    int iReleaseVerticalGlow = iMax2 - releaseVerticalGlow(iMax2, motionEvent.getX());
                    if (dispatchNestedPreScroll(zCanScrollHorizontally != 0 ? iReleaseHorizontalGlow : 0, zCanScrollVertically ? iReleaseVerticalGlow : 0, this.mReusableIntPair, this.mScrollOffset, 0)) {
                        int[] iArr4 = this.mReusableIntPair;
                        iReleaseHorizontalGlow -= iArr4[0];
                        iReleaseVerticalGlow -= iArr4[1];
                        int[] iArr5 = this.mNestedOffsets;
                        int i11 = iArr5[0];
                        int[] iArr6 = this.mScrollOffset;
                        iArr5[0] = i11 + iArr6[0];
                        iArr5[1] = iArr5[1] + iArr6[1];
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    int[] iArr7 = this.mScrollOffset;
                    this.mLastTouchX = x12 - iArr7[0];
                    this.mLastTouchY = y12 - iArr7[1];
                    if (scrollByInternal(zCanScrollHorizontally != 0 ? iReleaseHorizontalGlow : 0, zCanScrollVertically ? iReleaseVerticalGlow : 0, motionEvent, 0)) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                    }
                    f0 f0Var = this.mGapWorker;
                    if (f0Var != null && (iReleaseHorizontalGlow != 0 || iReleaseVerticalGlow != 0)) {
                        f0Var.a(this, iReleaseHorizontalGlow, iReleaseVerticalGlow);
                    }
                }
            } else if (actionMasked == 3) {
                cancelScroll();
            } else if (actionMasked == 5) {
                this.mScrollPointerId = motionEvent.getPointerId(actionIndex);
                int x13 = (int) (motionEvent.getX(actionIndex) + 0.5f);
                this.mLastTouchX = x13;
                this.mInitialTouchX = x13;
                int y13 = (int) (motionEvent.getY(actionIndex) + 0.5f);
                this.mLastTouchY = y13;
                this.mInitialTouchY = y13;
            } else if (actionMasked == 6) {
                onPointerUp(motionEvent);
            }
        }
        this.mVelocityTracker.addMovement(motionEventObtain);
        motionEventObtain.recycle();
        return true;
    }

    public void postAnimationRunner() {
        if (this.mPostedAnimatorRunner || !this.mIsAttached) {
            return;
        }
        Runnable runnable = this.mItemAnimatorRunner;
        WeakHashMap weakHashMap = a5.a1.f250a;
        postOnAnimation(runnable);
        this.mPostedAnimatorRunner = true;
    }

    public void processDataSetCompletelyChanged(boolean z11) {
        this.mDispatchItemsChangedEvent = z11 | this.mDispatchItemsChangedEvent;
        this.mDataSetHasChangedAfterLayout = true;
        markKnownViewsInvalid();
    }

    public void recordAnimationInfoIfBouncedHiddenView(s2 s2Var, t1 t1Var) {
        s2Var.setFlags(0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
        if (this.mState.f15076h && s2Var.isUpdated() && !s2Var.isRemoved() && !s2Var.shouldIgnore()) {
            this.mViewInfoStore.f15010b.e(getChangedHolderKey(s2Var), s2Var);
        }
        z.c1 c1Var = this.mViewInfoStore.f15009a;
        h3 h3VarA = (h3) c1Var.get(s2Var);
        if (h3VarA == null) {
            h3VarA = h3.a();
            c1Var.put(s2Var, h3VarA);
        }
        h3VarA.f14991b = t1Var;
        h3VarA.f14990a |= 4;
    }

    public void removeAndRecycleViews() {
        u1 u1Var = this.mItemAnimator;
        if (u1Var != null) {
            u1Var.endAnimations();
        }
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.removeAndRecycleAllViews(this.mRecycler);
            this.mLayout.removeAndRecycleScrapInt(this.mRecycler);
        }
        h2 h2Var = this.mRecycler;
        h2Var.f14981a.clear();
        h2Var.g();
    }

    public boolean removeAnimatingView(View view) {
        startInterceptRequestLayout();
        i iVar = this.mChildHelper;
        h hVar = iVar.f14994b;
        k1 k1Var = iVar.f14993a;
        int i5 = iVar.f14996d;
        boolean z11 = false;
        z11 = false;
        if (i5 == 1) {
            if (iVar.f14997e != view) {
                throw new IllegalStateException("Cannot call removeViewIfHidden within removeView(At) for a different view");
            }
        } else {
            if (i5 == 2) {
                throw new IllegalStateException("Cannot call removeViewIfHidden within removeViewIfHidden");
            }
            try {
                iVar.f14996d = 2;
                int iIndexOfChild = k1Var.f15030a.indexOfChild(view);
                if (iIndexOfChild == -1) {
                    iVar.l(view);
                } else if (hVar.d(iIndexOfChild)) {
                    hVar.f(iIndexOfChild);
                    iVar.l(view);
                    k1Var.b(iIndexOfChild);
                }
                iVar.f14996d = 0;
                z11 = true;
            } finally {
                iVar.f14996d = 0;
            }
        }
        if (z11) {
            s2 childViewHolderInt = getChildViewHolderInt(view);
            this.mRecycler.m(childViewHolderInt);
            this.mRecycler.j(childViewHolderInt);
            if (sVerboseLoggingEnabled) {
                Objects.toString(view);
                toString();
            }
        }
        stopInterceptRequestLayout(!z11);
        return z11;
    }

    @Override // android.view.ViewGroup
    public void removeDetachedView(View view, boolean z11) {
        s2 childViewHolderInt = getChildViewHolderInt(view);
        if (childViewHolderInt != null) {
            if (childViewHolderInt.isTmpDetached()) {
                childViewHolderInt.clearTmpDetachFlag();
            } else if (!childViewHolderInt.shouldIgnore()) {
                StringBuilder sb2 = new StringBuilder("Called removeDetachedView with a view which is not flagged as tmp detached.");
                sb2.append(childViewHolderInt);
                throw new IllegalArgumentException(a2.c.j(this, sb2));
            }
        } else if (sDebugAssertionsEnabled) {
            StringBuilder sb3 = new StringBuilder("No ViewHolder found for child: ");
            sb3.append(view);
            throw new IllegalArgumentException(a2.c.j(this, sb3));
        }
        view.clearAnimation();
        dispatchChildDetached(view);
        super.removeDetachedView(view, z11);
    }

    public void removeItemDecoration(v1 v1Var) {
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            z1Var.assertNotInLayoutOrScroll("Cannot remove item decoration during a scroll  or layout");
        }
        this.mItemDecorations.remove(v1Var);
        if (this.mItemDecorations.isEmpty()) {
            setWillNotDraw(getOverScrollMode() == 2);
        }
        markItemDecorInsetsDirty();
        requestLayout();
    }

    public void removeItemDecorationAt(int i5) {
        int itemDecorationCount = getItemDecorationCount();
        if (i5 >= 0 && i5 < itemDecorationCount) {
            removeItemDecoration(getItemDecorationAt(i5));
            return;
        }
        throw new IndexOutOfBoundsException(i5 + " is an invalid index for size " + itemDecorationCount);
    }

    public void removeOnChildAttachStateChangeListener(b2 b2Var) {
        List<b2> list = this.mOnChildAttachStateListeners;
        if (list == null) {
            return;
        }
        list.remove(b2Var);
    }

    public void removeOnItemTouchListener(d2 d2Var) {
        this.mOnItemTouchListeners.remove(d2Var);
        if (this.mInterceptingOnItemTouchListener == d2Var) {
            this.mInterceptingOnItemTouchListener = null;
        }
    }

    public void removeOnScrollListener(e2 e2Var) {
        List<e2> list = this.mScrollListeners;
        if (list != null) {
            list.remove(e2Var);
        }
    }

    public void removeRecyclerListener(i2 i2Var) {
        this.mRecyclerListeners.remove(i2Var);
    }

    public void repositionShadowingViews() {
        s2 s2Var;
        int iE = this.mChildHelper.e();
        for (int i5 = 0; i5 < iE; i5++) {
            View viewD = this.mChildHelper.d(i5);
            s2 childViewHolder = getChildViewHolder(viewD);
            if (childViewHolder != null && (s2Var = childViewHolder.mShadowingHolder) != null) {
                View view = s2Var.itemView;
                int left = viewD.getLeft();
                int top = viewD.getTop();
                if (left != view.getLeft() || top != view.getTop()) {
                    view.layout(left, top, view.getWidth() + left, view.getHeight() + top);
                }
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestChildFocus(View view, View view2) {
        if (!this.mLayout.onRequestChildFocus(this, this.mState, view, view2) && view2 != null) {
            requestChildOnScreen(view, view2);
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z11) {
        return this.mLayout.requestChildRectangleOnScreen(this, view, rect, z11);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean z11) {
        int size = this.mOnItemTouchListeners.size();
        for (int i5 = 0; i5 < size; i5++) {
            this.mOnItemTouchListeners.get(i5).a(z11);
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        if (this.mInterceptRequestLayoutDepth != 0 || this.mLayoutSuppressed) {
            this.mLayoutWasDefered = true;
        } else {
            super.requestLayout();
        }
    }

    public void saveOldPositions() {
        int iH = this.mChildHelper.h();
        for (int i5 = 0; i5 < iH; i5++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i5));
            if (sDebugAssertionsEnabled && childViewHolderInt.mPosition == -1 && !childViewHolderInt.isRemoved()) {
                throw new IllegalStateException(a2.c.j(this, new StringBuilder("view holder cannot have position -1 unless it is removed")));
            }
            if (!childViewHolderInt.shouldIgnore()) {
                childViewHolderInt.saveOldPosition();
            }
        }
    }

    @Override // android.view.View
    public void scrollBy(int i5, int i11) {
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            Log.e(TAG, "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            return;
        }
        if (this.mLayoutSuppressed) {
            return;
        }
        boolean zCanScrollHorizontally = z1Var.canScrollHorizontally();
        boolean zCanScrollVertically = this.mLayout.canScrollVertically();
        if (zCanScrollHorizontally || zCanScrollVertically) {
            if (!zCanScrollHorizontally) {
                i5 = 0;
            }
            if (!zCanScrollVertically) {
                i11 = 0;
            }
            scrollByInternal(i5, i11, null, 0);
        }
    }

    public boolean scrollByInternal(int i5, int i11, MotionEvent motionEvent, int i12) {
        int i13;
        int i14;
        int i15;
        int i16;
        consumePendingUpdateOperations();
        if (this.mAdapter != null) {
            int[] iArr = this.mReusableIntPair;
            iArr[0] = 0;
            iArr[1] = 0;
            scrollStep(i5, i11, iArr);
            int[] iArr2 = this.mReusableIntPair;
            int i17 = iArr2[0];
            int i18 = iArr2[1];
            i15 = i5 - i17;
            i16 = i11 - i18;
            i14 = i18;
            i13 = i17;
        } else {
            i13 = 0;
            i14 = 0;
            i15 = 0;
            i16 = 0;
        }
        if (!this.mItemDecorations.isEmpty()) {
            invalidate();
        }
        int[] iArr3 = this.mReusableIntPair;
        iArr3[0] = 0;
        iArr3[1] = 0;
        dispatchNestedScroll(i13, i14, i15, i16, this.mScrollOffset, i12, iArr3);
        int[] iArr4 = this.mReusableIntPair;
        int i19 = iArr4[0];
        int i21 = i15 - i19;
        int i22 = iArr4[1];
        int i23 = i16 - i22;
        boolean z11 = (i19 == 0 && i22 == 0) ? false : true;
        int i24 = this.mLastTouchX;
        int[] iArr5 = this.mScrollOffset;
        int i25 = iArr5[0];
        this.mLastTouchX = i24 - i25;
        int i26 = this.mLastTouchY;
        int i27 = iArr5[1];
        this.mLastTouchY = i26 - i27;
        int[] iArr6 = this.mNestedOffsets;
        iArr6[0] = iArr6[0] + i25;
        iArr6[1] = iArr6[1] + i27;
        if (getOverScrollMode() != 2) {
            if (motionEvent != null && !ic.b.M(motionEvent, 8194)) {
                pullGlows(motionEvent.getX(), i21, motionEvent.getY(), i23);
            }
            considerReleasingGlowsOnScroll(i5, i11);
        }
        if (i13 != 0 || i14 != 0) {
            dispatchOnScrolled(i13, i14);
        }
        if (!awakenScrollBars()) {
            invalidate();
        }
        return (!z11 && i13 == 0 && i14 == 0) ? false : true;
    }

    public void scrollStep(int i5, int i11, int[] iArr) {
        startInterceptRequestLayout();
        onEnterLayoutOrScroll();
        int i12 = w4.i.f93753a;
        Trace.beginSection(TRACE_SCROLL_TAG);
        fillRemainingScrollValues(this.mState);
        int iScrollHorizontallyBy = i5 != 0 ? this.mLayout.scrollHorizontallyBy(i5, this.mRecycler, this.mState) : 0;
        int iScrollVerticallyBy = i11 != 0 ? this.mLayout.scrollVerticallyBy(i11, this.mRecycler, this.mState) : 0;
        Trace.endSection();
        repositionShadowingViews();
        onExitLayoutOrScroll();
        stopInterceptRequestLayout(false);
        if (iArr != null) {
            iArr[0] = iScrollHorizontallyBy;
            iArr[1] = iScrollVerticallyBy;
        }
    }

    @Override // android.view.View
    public void scrollTo(int i5, int i11) {
        Log.w(TAG, "RecyclerView does not support scrolling to an absolute position. Use scrollToPosition instead");
    }

    public void scrollToPosition(int i5) {
        if (this.mLayoutSuppressed) {
            return;
        }
        stopScroll();
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            Log.e(TAG, "Cannot scroll to position a LayoutManager set. Call setLayoutManager with a non-null argument.");
        } else {
            z1Var.scrollToPosition(i5);
            awakenScrollBars();
        }
    }

    @Override // android.view.View, android.view.accessibility.AccessibilityEventSource
    public void sendAccessibilityEventUnchecked(AccessibilityEvent accessibilityEvent) {
        if (shouldDeferAccessibilityEvent(accessibilityEvent)) {
            return;
        }
        super.sendAccessibilityEventUnchecked(accessibilityEvent);
    }

    public void setAccessibilityDelegateCompat(u2 u2Var) {
        this.mAccessibilityDelegate = u2Var;
        a5.a1.k(this, u2Var);
    }

    public void setAdapter(m1 m1Var) {
        setLayoutFrozen(false);
        setAdapterInternal(m1Var, false, true);
        processDataSetCompletelyChanged(false);
        requestLayout();
    }

    public void setChildDrawingOrderCallback(p1 p1Var) {
        if (p1Var == this.mChildDrawingOrderCallback) {
            return;
        }
        this.mChildDrawingOrderCallback = p1Var;
        setChildrenDrawingOrderEnabled(p1Var != null);
    }

    public boolean setChildImportantForAccessibilityInternal(s2 s2Var, int i5) {
        if (isComputingLayout()) {
            s2Var.mPendingAccessibilityState = i5;
            this.mPendingAccessibilityImportanceChange.add(s2Var);
            return false;
        }
        View view = s2Var.itemView;
        WeakHashMap weakHashMap = a5.a1.f250a;
        view.setImportantForAccessibility(i5);
        return true;
    }

    @Override // android.view.ViewGroup
    public void setClipToPadding(boolean z11) {
        if (z11 != this.mClipToPadding) {
            invalidateGlows();
        }
        this.mClipToPadding = z11;
        super.setClipToPadding(z11);
        if (this.mFirstLayoutComplete) {
            requestLayout();
        }
    }

    public void setEdgeEffectFactory(q1 q1Var) {
        q1Var.getClass();
        this.mEdgeEffectFactory = q1Var;
        invalidateGlows();
    }

    public void setHasFixedSize(boolean z11) {
        this.mHasFixedSize = z11;
    }

    public void setItemAnimator(u1 u1Var) {
        u1 u1Var2 = this.mItemAnimator;
        if (u1Var2 != null) {
            u1Var2.endAnimations();
            this.mItemAnimator.setListener(null);
        }
        this.mItemAnimator = u1Var;
        if (u1Var != null) {
            u1Var.setListener(this.mItemAnimatorListener);
        }
    }

    public void setItemViewCacheSize(int i5) {
        h2 h2Var = this.mRecycler;
        h2Var.f14985e = i5;
        h2Var.n();
    }

    @Deprecated
    public void setLayoutFrozen(boolean z11) {
        suppressLayout(z11);
    }

    public void setLayoutManager(z1 z1Var) {
        if (z1Var == this.mLayout) {
            return;
        }
        stopScroll();
        if (this.mLayout != null) {
            u1 u1Var = this.mItemAnimator;
            if (u1Var != null) {
                u1Var.endAnimations();
            }
            this.mLayout.removeAndRecycleAllViews(this.mRecycler);
            this.mLayout.removeAndRecycleScrapInt(this.mRecycler);
            h2 h2Var = this.mRecycler;
            h2Var.f14981a.clear();
            h2Var.g();
            if (this.mIsAttached) {
                this.mLayout.dispatchDetachedFromWindow(this, this.mRecycler);
            }
            this.mLayout.setRecyclerView(null);
            this.mLayout = null;
        } else {
            h2 h2Var2 = this.mRecycler;
            h2Var2.f14981a.clear();
            h2Var2.g();
        }
        i iVar = this.mChildHelper;
        RecyclerView recyclerView = iVar.f14993a.f15030a;
        iVar.f14994b.g();
        ArrayList arrayList = iVar.f14995c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            s2 childViewHolderInt = getChildViewHolderInt((View) arrayList.get(size));
            if (childViewHolderInt != null) {
                childViewHolderInt.onLeftHiddenState(recyclerView);
            }
            arrayList.remove(size);
        }
        int childCount = recyclerView.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = recyclerView.getChildAt(i5);
            recyclerView.dispatchChildDetached(childAt);
            childAt.clearAnimation();
        }
        recyclerView.removeAllViews();
        this.mLayout = z1Var;
        if (z1Var != null) {
            if (z1Var.mRecyclerView != null) {
                StringBuilder sb2 = new StringBuilder("LayoutManager ");
                sb2.append(z1Var);
                sb2.append(" is already attached to a RecyclerView:");
                throw new IllegalArgumentException(a2.c.j(z1Var.mRecyclerView, sb2));
            }
            z1Var.setRecyclerView(this);
            if (this.mIsAttached) {
                this.mLayout.dispatchAttachedToWindow(this);
            }
        }
        this.mRecycler.n();
        requestLayout();
    }

    @Override // android.view.ViewGroup
    @Deprecated
    public void setLayoutTransition(LayoutTransition layoutTransition) {
        if (layoutTransition != null) {
            throw new IllegalArgumentException("Providing a LayoutTransition into RecyclerView is not supported. Please use setItemAnimator() instead for animating changes to the items in this RecyclerView");
        }
        super.setLayoutTransition(null);
    }

    @Override // android.view.View
    public void setNestedScrollingEnabled(boolean z11) {
        a5.w scrollingChildHelper = getScrollingChildHelper();
        if (scrollingChildHelper.f379d) {
            ViewGroup viewGroup = scrollingChildHelper.f378c;
            WeakHashMap weakHashMap = a5.a1.f250a;
            a5.s0.n(viewGroup);
        }
        scrollingChildHelper.f379d = z11;
    }

    public void setOnFlingListener(c2 c2Var) {
        this.mOnFlingListener = c2Var;
    }

    @Deprecated
    public void setOnScrollListener(e2 e2Var) {
        this.mScrollListener = e2Var;
    }

    public void setPreserveFocusAfterLayout(boolean z11) {
        this.mPreserveFocusAfterLayout = z11;
    }

    public void setRecycledViewPool(g2 g2Var) {
        h2 h2Var = this.mRecycler;
        RecyclerView recyclerView = h2Var.f14988h;
        h2Var.f(recyclerView.mAdapter, false);
        if (h2Var.f14987g != null) {
            r2.f14971b--;
        }
        h2Var.f14987g = g2Var;
        if (g2Var != null && recyclerView.getAdapter() != null) {
            h2Var.f14987g.f14971b++;
        }
        h2Var.e();
    }

    @Deprecated
    public void setRecyclerListener(i2 i2Var) {
    }

    public void setScrollState(int i5) {
        if (i5 == this.mScrollState) {
            return;
        }
        if (sVerboseLoggingEnabled) {
            new Exception();
        }
        this.mScrollState = i5;
        if (i5 != 2) {
            stopScrollersInternal();
        }
        dispatchOnScrollStateChanged(i5);
    }

    public void setScrollingTouchSlop(int i5) {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        if (i5 != 0) {
            if (i5 == 1) {
                this.mTouchSlop = viewConfiguration.getScaledPagingTouchSlop();
                return;
            }
            Log.w(TAG, "setScrollingTouchSlop(): bad argument constant " + i5 + "; using default value");
        }
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
    }

    public void setViewCacheExtension(q2 q2Var) {
        this.mRecycler.getClass();
    }

    public boolean shouldDeferAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        if (!isComputingLayout()) {
            return false;
        }
        int iA = accessibilityEvent != null ? zg.a.A(accessibilityEvent) : 0;
        this.mEatenAccessibilityChangeFlags |= iA != 0 ? iA : 0;
        return true;
    }

    public void smoothScrollBy(int i5, int i11) {
        smoothScrollBy(i5, i11, null);
    }

    public void smoothScrollToPosition(int i5) {
        if (this.mLayoutSuppressed) {
            return;
        }
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            Log.e(TAG, "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
        } else {
            z1Var.smoothScrollToPosition(this, this.mState, i5);
        }
    }

    public void startInterceptRequestLayout() {
        int i5 = this.mInterceptRequestLayoutDepth + 1;
        this.mInterceptRequestLayoutDepth = i5;
        if (i5 != 1 || this.mLayoutSuppressed) {
            return;
        }
        this.mLayoutWasDefered = false;
    }

    @Override // android.view.View
    public boolean startNestedScroll(int i5) {
        return getScrollingChildHelper().g(i5, 0);
    }

    public void stopInterceptRequestLayout(boolean z11) {
        if (this.mInterceptRequestLayoutDepth < 1) {
            if (sDebugAssertionsEnabled) {
                throw new IllegalStateException(a2.c.j(this, new StringBuilder("stopInterceptRequestLayout was called more times than startInterceptRequestLayout.")));
            }
            this.mInterceptRequestLayoutDepth = 1;
        }
        if (!z11 && !this.mLayoutSuppressed) {
            this.mLayoutWasDefered = false;
        }
        if (this.mInterceptRequestLayoutDepth == 1) {
            if (z11 && this.mLayoutWasDefered && !this.mLayoutSuppressed && this.mLayout != null && this.mAdapter != null) {
                dispatchLayout();
            }
            if (!this.mLayoutSuppressed) {
                this.mLayoutWasDefered = false;
            }
        }
        this.mInterceptRequestLayoutDepth--;
    }

    @Override // android.view.View
    public void stopNestedScroll() {
        getScrollingChildHelper().h(0);
    }

    public void stopScroll() {
        setScrollState(0);
        stopScrollersInternal();
    }

    @Override // android.view.ViewGroup
    public final void suppressLayout(boolean z11) {
        if (z11 != this.mLayoutSuppressed) {
            assertNotInLayoutOrScroll("Do not suppressLayout in layout or scroll");
            if (z11) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                onTouchEvent(MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0));
                this.mLayoutSuppressed = true;
                this.mIgnoreMotionEventTillDown = true;
                stopScroll();
                return;
            }
            this.mLayoutSuppressed = false;
            if (this.mLayoutWasDefered && this.mLayout != null && this.mAdapter != null) {
                requestLayout();
            }
            this.mLayoutWasDefered = false;
        }
    }

    public void swapAdapter(m1 m1Var, boolean z11) {
        setLayoutFrozen(false);
        setAdapterInternal(m1Var, true, z11);
        processDataSetCompletelyChanged(true);
        requestLayout();
    }

    public void viewRangeUpdate(int i5, int i11, Object obj) {
        int i12;
        int i13;
        int iH = this.mChildHelper.h();
        int i14 = i11 + i5;
        for (int i15 = 0; i15 < iH; i15++) {
            View viewG = this.mChildHelper.g(i15);
            s2 childViewHolderInt = getChildViewHolderInt(viewG);
            if (childViewHolderInt != null && !childViewHolderInt.shouldIgnore() && (i13 = childViewHolderInt.mPosition) >= i5 && i13 < i14) {
                childViewHolderInt.addFlags(2);
                childViewHolderInt.addChangePayload(obj);
                ((a2) viewG.getLayoutParams()).f14882c = true;
            }
        }
        h2 h2Var = this.mRecycler;
        ArrayList arrayList = h2Var.f14983c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            s2 s2Var = (s2) arrayList.get(size);
            if (s2Var != null && (i12 = s2Var.mPosition) >= i5 && i12 < i14) {
                s2Var.addFlags(2);
                h2Var.h(size);
            }
        }
    }

    public RecyclerView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 2130969874);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public s2 findViewHolderForPosition(int i5, boolean z11) {
        int iH = this.mChildHelper.h();
        s2 s2Var = null;
        for (int i11 = 0; i11 < iH; i11++) {
            s2 childViewHolderInt = getChildViewHolderInt(this.mChildHelper.g(i11));
            if (childViewHolderInt != null && !childViewHolderInt.isRemoved()) {
                if (z11) {
                    if (childViewHolderInt.mPosition != i5) {
                        continue;
                    } else {
                        i iVar = this.mChildHelper;
                        if (!iVar.f14995c.contains(childViewHolderInt.itemView)) {
                            return childViewHolderInt;
                        }
                        s2Var = childViewHolderInt;
                    }
                } else if (childViewHolderInt.getLayoutPosition() != i5) {
                    continue;
                }
            }
        }
        return s2Var;
    }

    public void onExitLayoutOrScroll(boolean z11) {
        int i5 = this.mLayoutOrScrollCounter - 1;
        this.mLayoutOrScrollCounter = i5;
        if (i5 < 1) {
            if (sDebugAssertionsEnabled && i5 < 0) {
                throw new IllegalStateException(a2.c.j(this, new StringBuilder("layout or scroll counter cannot go below zero.Some calls are not matching")));
            }
            this.mLayoutOrScrollCounter = 0;
            if (z11) {
                dispatchContentChangedIfNecessary();
                dispatchPendingImportantForAccessibilityChanges();
            }
        }
    }

    public void smoothScrollBy(int i5, int i11, Interpolator interpolator) {
        smoothScrollBy(i5, i11, interpolator, Integer.MIN_VALUE);
    }

    /* loaded from: classes2.dex */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new k2();

        /* renamed from: c, reason: collision with root package name */
        public Parcelable f14838c;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f14838c = parcel.readParcelable(classLoader == null ? z1.class.getClassLoader() : classLoader);
        }

        public final void d(SavedState savedState) {
            this.f14838c = savedState.f14838c;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeParcelable(this.f14838c, 0);
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }
    }

    public RecyclerView(Context context, AttributeSet attributeSet, int i5) throws NoSuchMethodException, SecurityException {
        super(context, attributeSet, i5);
        this.mObserver = new j2(this);
        this.mRecycler = new h2(this);
        this.mViewInfoStore = new j3();
        this.mUpdateChildViewsRunnable = new i1(this, 0);
        this.mTempRect = new Rect();
        this.mTempRect2 = new Rect();
        this.mTempRectF = new RectF();
        this.mRecyclerListeners = new ArrayList();
        this.mItemDecorations = new ArrayList<>();
        this.mOnItemTouchListeners = new ArrayList<>();
        this.mInterceptRequestLayoutDepth = 0;
        this.mDataSetHasChangedAfterLayout = false;
        this.mDispatchItemsChangedEvent = false;
        this.mLayoutOrScrollCounter = 0;
        this.mDispatchScrollCounter = 0;
        this.mEdgeEffectFactory = sDefaultEdgeEffectFactory;
        this.mItemAnimator = new p();
        this.mScrollState = 0;
        this.mScrollPointerId = -1;
        this.mScaledHorizontalScrollFactor = Float.MIN_VALUE;
        this.mScaledVerticalScrollFactor = Float.MIN_VALUE;
        int i11 = 1;
        this.mPreserveFocusAfterLayout = true;
        this.mViewFlinger = new r2(this);
        this.mPrefetchRegistry = ALLOW_THREAD_GAP_WORK ? new d0() : null;
        o2 o2Var = new o2();
        o2Var.f15069a = -1;
        o2Var.f15070b = 0;
        o2Var.f15071c = 0;
        o2Var.f15072d = 1;
        o2Var.f15073e = 0;
        o2Var.f15074f = false;
        o2Var.f15075g = false;
        o2Var.f15076h = false;
        o2Var.f15077i = false;
        o2Var.f15078j = false;
        o2Var.f15079k = false;
        this.mState = o2Var;
        this.mItemsAddedOrRemoved = false;
        this.mItemsChanged = false;
        this.mItemAnimatorListener = new k1(this);
        this.mPostedAnimatorRunner = false;
        this.mMinMaxLayoutPositions = new int[2];
        this.mScrollOffset = new int[2];
        this.mNestedOffsets = new int[2];
        this.mReusableIntPair = new int[2];
        this.mPendingAccessibilityImportanceChange = new ArrayList();
        this.mItemAnimatorRunner = new i1(this, i11);
        this.mLastAutoMeasureNonExactMeasuredWidth = 0;
        this.mLastAutoMeasureNonExactMeasuredHeight = 0;
        this.mViewInfoProcessCallback = new k1(this);
        setScrollContainer(true);
        setFocusableInTouchMode(true);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.mTouchSlop = viewConfiguration.getScaledTouchSlop();
        this.mScaledHorizontalScrollFactor = viewConfiguration.getScaledHorizontalScrollFactor();
        this.mScaledVerticalScrollFactor = viewConfiguration.getScaledVerticalScrollFactor();
        this.mMinFlingVelocity = viewConfiguration.getScaledMinimumFlingVelocity();
        this.mMaxFlingVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        this.mPhysicalCoef = context.getResources().getDisplayMetrics().density * 160.0f * 386.0878f * 0.84f;
        setWillNotDraw(getOverScrollMode() == 2);
        this.mItemAnimator.setListener(this.mItemAnimatorListener);
        initAdapterManager();
        initChildrenHelper();
        initAutofill();
        WeakHashMap weakHashMap = a5.a1.f250a;
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
        this.mAccessibilityManager = (AccessibilityManager) getContext().getSystemService("accessibility");
        setAccessibilityDelegateCompat(new u2(this));
        int[] iArr = x6.a.f95108a;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, i5, 0);
        a5.a1.j(this, context, iArr, attributeSet, typedArrayObtainStyledAttributes, i5);
        String string = typedArrayObtainStyledAttributes.getString(8);
        if (typedArrayObtainStyledAttributes.getInt(2, -1) == -1) {
            setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        }
        this.mClipToPadding = typedArrayObtainStyledAttributes.getBoolean(1, true);
        boolean z11 = typedArrayObtainStyledAttributes.getBoolean(3, false);
        this.mEnableFastScroller = z11;
        if (z11) {
            initFastScroller((StateListDrawable) typedArrayObtainStyledAttributes.getDrawable(6), typedArrayObtainStyledAttributes.getDrawable(7), (StateListDrawable) typedArrayObtainStyledAttributes.getDrawable(4), typedArrayObtainStyledAttributes.getDrawable(5));
        }
        typedArrayObtainStyledAttributes.recycle();
        createLayoutManager(context, string, attributeSet, i5, 0);
        int[] iArr2 = NESTED_SCROLLING_ATTRS;
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, iArr2, i5, 0);
        a5.a1.j(this, context, iArr2, attributeSet, typedArrayObtainStyledAttributes2, i5);
        boolean z12 = typedArrayObtainStyledAttributes2.getBoolean(0, true);
        typedArrayObtainStyledAttributes2.recycle();
        setNestedScrollingEnabled(z12);
        setTag(2131428239, Boolean.TRUE);
    }

    public boolean dispatchNestedPreScroll(int i5, int i11, int[] iArr, int[] iArr2, int i12) {
        return getScrollingChildHelper().c(i5, i11, iArr, iArr2, i12);
    }

    public boolean dispatchNestedScroll(int i5, int i11, int i12, int i13, int[] iArr, int i14) {
        return getScrollingChildHelper().d(i5, i11, i12, i13, iArr, i14, null);
    }

    public boolean hasNestedScrollingParent(int i5) {
        return getScrollingChildHelper().f(i5);
    }

    public void smoothScrollBy(int i5, int i11, Interpolator interpolator, int i12) {
        smoothScrollBy(i5, i11, interpolator, i12, false);
    }

    public boolean startNestedScroll(int i5, int i11) {
        return getScrollingChildHelper().g(i5, i11);
    }

    public void stopNestedScroll(int i5) {
        getScrollingChildHelper().h(i5);
    }

    public void smoothScrollBy(int i5, int i11, Interpolator interpolator, int i12, boolean z11) {
        z1 z1Var = this.mLayout;
        if (z1Var == null) {
            Log.e(TAG, "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            return;
        }
        if (this.mLayoutSuppressed) {
            return;
        }
        if (!z1Var.canScrollHorizontally()) {
            i5 = 0;
        }
        if (!this.mLayout.canScrollVertically()) {
            i11 = 0;
        }
        if (i5 == 0 && i11 == 0) {
            return;
        }
        if (i12 != Integer.MIN_VALUE && i12 <= 0) {
            scrollBy(i5, i11);
            return;
        }
        if (z11) {
            int i13 = i5 != 0 ? 1 : 0;
            if (i11 != 0) {
                i13 |= 2;
            }
            startNestedScroll(i13, 1);
        }
        this.mViewFlinger.c(i5, i11, interpolator, i12);
    }

    public final void dispatchNestedScroll(int i5, int i11, int i12, int i13, int[] iArr, int i14, int[] iArr2) {
        getScrollingChildHelper().d(i5, i11, i12, i13, iArr, i14, iArr2);
    }

    public void addItemDecoration(v1 v1Var) {
        addItemDecoration(v1Var, -1);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        z1 z1Var = this.mLayout;
        if (z1Var != null) {
            return z1Var.generateLayoutParams(layoutParams);
        }
        throw new IllegalStateException(a2.c.j(this, new StringBuilder("RecyclerView has no LayoutManager")));
    }
}
