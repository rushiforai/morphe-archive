package androidx.recyclerview.widget;

import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import b.u4;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.WeakHashMap;

/* loaded from: classes.dex */
public final class h2 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14981a;

    /* renamed from: b, reason: collision with root package name */
    public ArrayList f14982b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f14983c;

    /* renamed from: d, reason: collision with root package name */
    public final List f14984d;

    /* renamed from: e, reason: collision with root package name */
    public int f14985e;

    /* renamed from: f, reason: collision with root package name */
    public int f14986f;

    /* renamed from: g, reason: collision with root package name */
    public g2 f14987g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ RecyclerView f14988h;

    public h2(RecyclerView recyclerView) {
        this.f14988h = recyclerView;
        ArrayList arrayList = new ArrayList();
        this.f14981a = arrayList;
        this.f14982b = null;
        this.f14983c = new ArrayList();
        this.f14984d = Collections.unmodifiableList(arrayList);
        this.f14985e = 2;
        this.f14986f = 2;
    }

    public static void d(ViewGroup viewGroup, boolean z11) {
        for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = viewGroup.getChildAt(childCount);
            if (childAt instanceof ViewGroup) {
                d((ViewGroup) childAt, true);
            }
        }
        if (z11) {
            if (viewGroup.getVisibility() == 4) {
                viewGroup.setVisibility(0);
                viewGroup.setVisibility(4);
            } else {
                int visibility = viewGroup.getVisibility();
                viewGroup.setVisibility(4);
                viewGroup.setVisibility(visibility);
            }
        }
    }

    public final void a(s2 s2Var, boolean z11) {
        RecyclerView.clearNestedRecyclerViewIfNotNested(s2Var);
        View view = s2Var.itemView;
        RecyclerView recyclerView = this.f14988h;
        u2 u2Var = recyclerView.mAccessibilityDelegate;
        if (u2Var != null) {
            a5.b bVarJ = u2Var.j();
            a5.a1.k(view, bVarJ instanceof t2 ? (a5.b) ((t2) bVarJ).f15128e.remove(view) : null);
        }
        if (z11) {
            if (recyclerView.mRecyclerListeners.size() > 0) {
                recyclerView.mRecyclerListeners.get(0).getClass();
                throw new ClassCastException();
            }
            m1 m1Var = recyclerView.mAdapter;
            if (m1Var != null) {
                m1Var.onViewRecycled(s2Var);
            }
            if (recyclerView.mState != null) {
                recyclerView.mViewInfoStore.d(s2Var);
            }
            if (RecyclerView.sVerboseLoggingEnabled) {
                Objects.toString(s2Var);
            }
        }
        s2Var.mBindingAdapter = null;
        s2Var.mOwnerRecyclerView = null;
        c().c(s2Var);
    }

    public final int b(int i5) {
        RecyclerView recyclerView = this.f14988h;
        if (i5 >= 0 && i5 < recyclerView.mState.b()) {
            return !recyclerView.mState.f15075g ? i5 : recyclerView.mAdapterHelper.f(i5, 0);
        }
        StringBuilder sbJ = u4.j(i5, "invalid position ", ". State item count is ");
        sbJ.append(recyclerView.mState.b());
        sbJ.append(recyclerView.exceptionLabel());
        throw new IndexOutOfBoundsException(sbJ.toString());
    }

    public final g2 c() {
        if (this.f14987g == null) {
            this.f14987g = new g2();
            e();
        }
        return this.f14987g;
    }

    public final void e() {
        if (this.f14987g != null) {
            RecyclerView recyclerView = this.f14988h;
            if (recyclerView.mAdapter == null || !recyclerView.isAttachedToWindow()) {
                return;
            }
            g2 g2Var = this.f14987g;
            g2Var.f14972c.add(recyclerView.mAdapter);
        }
    }

    public final void f(m1 m1Var, boolean z11) {
        g2 g2Var = this.f14987g;
        if (g2Var != null) {
            SparseArray sparseArray = g2Var.f14970a;
            Set set = g2Var.f14972c;
            set.remove(m1Var);
            if (set.size() != 0 || z11) {
                return;
            }
            for (int i5 = 0; i5 < sparseArray.size(); i5++) {
                ArrayList arrayList = ((f2) sparseArray.get(sparseArray.keyAt(i5))).f14959a;
                for (int i11 = 0; i11 < arrayList.size(); i11++) {
                    fg.a.e(((s2) arrayList.get(i11)).itemView);
                }
            }
        }
    }

    public final void g() {
        ArrayList arrayList = this.f14983c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            h(size);
        }
        arrayList.clear();
        if (RecyclerView.ALLOW_THREAD_GAP_WORK) {
            d0 d0Var = this.f14988h.mPrefetchRegistry;
            int[] iArr = d0Var.f14922c;
            if (iArr != null) {
                Arrays.fill(iArr, -1);
            }
            d0Var.f14923d = 0;
        }
    }

    public final void h(int i5) {
        int i11 = RecyclerView.HORIZONTAL;
        ArrayList arrayList = this.f14983c;
        s2 s2Var = (s2) arrayList.get(i5);
        if (RecyclerView.sVerboseLoggingEnabled) {
            Objects.toString(s2Var);
        }
        a(s2Var, true);
        arrayList.remove(i5);
    }

    public final void i(View view) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        boolean zIsTmpDetached = childViewHolderInt.isTmpDetached();
        RecyclerView recyclerView = this.f14988h;
        if (zIsTmpDetached) {
            recyclerView.removeDetachedView(view, false);
        }
        if (childViewHolderInt.isScrap()) {
            childViewHolderInt.unScrap();
        } else if (childViewHolderInt.wasReturnedFromScrap()) {
            childViewHolderInt.clearReturnedFromScrapFlag();
        }
        j(childViewHolderInt);
        if (recyclerView.mItemAnimator == null || childViewHolderInt.isRecyclable()) {
            return;
        }
        recyclerView.mItemAnimator.endAnimation(childViewHolderInt);
    }

    /* JADX WARN: Code restructure failed: missing block: B:60:0x00c0, code lost:
    
        r4 = r4 - 1;
     */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00a5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void j(s2 s2Var) {
        boolean z11;
        int i5;
        boolean zIsScrap = s2Var.isScrap();
        boolean z12 = true;
        RecyclerView recyclerView = this.f14988h;
        if (zIsScrap || s2Var.itemView.getParent() != null) {
            StringBuilder sb2 = new StringBuilder("Scrapped or attached views may not be recycled. isScrap:");
            sb2.append(s2Var.isScrap());
            sb2.append(" isAttached:");
            sb2.append(s2Var.itemView.getParent() != null);
            sb2.append(recyclerView.exceptionLabel());
            throw new IllegalArgumentException(sb2.toString());
        }
        if (s2Var.isTmpDetached()) {
            StringBuilder sb3 = new StringBuilder("Tmp detached view should be removed from RecyclerView before it can be recycled: ");
            sb3.append(s2Var);
            throw new IllegalArgumentException(a2.c.j(recyclerView, sb3));
        }
        if (s2Var.shouldIgnore()) {
            throw new IllegalArgumentException(a2.c.j(recyclerView, new StringBuilder("Trying to recycle an ignored view holder. You should first call stopIgnoringView(view) before calling recycle.")));
        }
        boolean zDoesTransientStatePreventRecycling = s2Var.doesTransientStatePreventRecycling();
        m1 m1Var = recyclerView.mAdapter;
        boolean z13 = m1Var != null && zDoesTransientStatePreventRecycling && m1Var.onFailedToRecycleView(s2Var);
        boolean z14 = RecyclerView.sDebugAssertionsEnabled;
        ArrayList arrayList = this.f14983c;
        if (z14 && arrayList.contains(s2Var)) {
            StringBuilder sb4 = new StringBuilder("cached view received recycle internal? ");
            sb4.append(s2Var);
            throw new IllegalArgumentException(a2.c.j(recyclerView, sb4));
        }
        if (z13 || s2Var.isRecyclable()) {
            if (this.f14986f <= 0 || s2Var.hasAnyOfTheFlags(526)) {
                z11 = false;
            } else {
                int size = arrayList.size();
                if (size >= this.f14986f && size > 0) {
                    h(0);
                    size--;
                }
                if (RecyclerView.ALLOW_THREAD_GAP_WORK && size > 0) {
                    d0 d0Var = recyclerView.mPrefetchRegistry;
                    int i11 = s2Var.mPosition;
                    if (d0Var.f14922c != null) {
                        int i12 = d0Var.f14923d * 2;
                        for (int i13 = 0; i13 < i12; i13 += 2) {
                            if (d0Var.f14922c[i13] == i11) {
                                break;
                            }
                        }
                        i5 = size - 1;
                        loop1: while (i5 >= 0) {
                            int i14 = ((s2) arrayList.get(i5)).mPosition;
                            d0 d0Var2 = recyclerView.mPrefetchRegistry;
                            if (d0Var2.f14922c == null) {
                                break;
                            }
                            int i15 = d0Var2.f14923d * 2;
                            for (int i16 = 0; i16 < i15; i16 += 2) {
                                if (d0Var2.f14922c[i16] == i14) {
                                    break;
                                }
                            }
                            break loop1;
                        }
                        size = i5 + 1;
                    } else {
                        i5 = size - 1;
                        loop1: while (i5 >= 0) {
                        }
                        size = i5 + 1;
                    }
                }
                arrayList.add(size, s2Var);
                z11 = true;
            }
            if (z11) {
                z12 = false;
            } else {
                a(s2Var, true);
            }
            z = z11;
        } else {
            if (RecyclerView.sVerboseLoggingEnabled) {
                recyclerView.exceptionLabel();
            }
            z12 = false;
        }
        recyclerView.mViewInfoStore.d(s2Var);
        if (z || z12 || !zDoesTransientStatePreventRecycling) {
            return;
        }
        fg.a.e(s2Var.itemView);
        s2Var.mBindingAdapter = null;
        s2Var.mOwnerRecyclerView = null;
    }

    public final void k(View view) {
        s2 childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
        boolean zHasAnyOfTheFlags = childViewHolderInt.hasAnyOfTheFlags(12);
        RecyclerView recyclerView = this.f14988h;
        if (!zHasAnyOfTheFlags && childViewHolderInt.isUpdated() && !recyclerView.canReuseUpdatedViewHolder(childViewHolderInt)) {
            if (this.f14982b == null) {
                this.f14982b = new ArrayList();
            }
            childViewHolderInt.setScrapContainer(this, true);
            this.f14982b.add(childViewHolderInt);
            return;
        }
        if (childViewHolderInt.isInvalid() && !childViewHolderInt.isRemoved() && !recyclerView.mAdapter.hasStableIds()) {
            throw new IllegalArgumentException(a2.c.j(recyclerView, new StringBuilder("Called scrap view with an invalid view. Invalid views cannot be reused from scrap, they should rebound from recycler pool.")));
        }
        childViewHolderInt.setScrapContainer(this, false);
        this.f14981a.add(childViewHolderInt);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:133:0x0236  */
    /* JADX WARN: Removed duplicated region for block: B:182:0x0332  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x0335  */
    /* JADX WARN: Removed duplicated region for block: B:214:0x03c5  */
    /* JADX WARN: Removed duplicated region for block: B:222:0x03e6  */
    /* JADX WARN: Removed duplicated region for block: B:228:0x040a  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x0422  */
    /* JADX WARN: Removed duplicated region for block: B:245:0x0457  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x046e  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x0480  */
    /* JADX WARN: Removed duplicated region for block: B:255:0x0488  */
    /* JADX WARN: Removed duplicated region for block: B:259:0x04a3  */
    /* JADX WARN: Removed duplicated region for block: B:262:0x04b2  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x04f6  */
    /* JADX WARN: Removed duplicated region for block: B:285:0x04fe  */
    /* JADX WARN: Removed duplicated region for block: B:289:0x0509  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x0515  */
    /* JADX WARN: Removed duplicated region for block: B:296:0x052e A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:298:0x0531  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0086  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0090  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final s2 l(int i5, long j11) {
        s2 childViewHolderInt;
        boolean z11;
        boolean z12;
        long j12;
        long j13;
        long j14;
        boolean z13;
        long j15;
        boolean z14;
        Object[] objArr;
        ViewGroup.LayoutParams layoutParams;
        a2 a2Var;
        RecyclerView recyclerViewFindNestedRecyclerView;
        s2 s2Var;
        View view;
        s2 s2Var2;
        boolean z15;
        int size;
        int iF;
        RecyclerView recyclerView = this.f14988h;
        if (i5 < 0 || i5 >= recyclerView.mState.b()) {
            StringBuilder sbT = b.c0.t(i5, "Invalid item position ", "(", i5, "). Item count:");
            sbT.append(recyclerView.mState.b());
            sbT.append(recyclerView.exceptionLabel());
            throw new IndexOutOfBoundsException(sbT.toString());
        }
        boolean z16 = true;
        if (recyclerView.mState.f15075g) {
            ArrayList arrayList = this.f14982b;
            if (arrayList == null || (size = arrayList.size()) == 0) {
                childViewHolderInt = null;
                z11 = childViewHolderInt == null;
            } else {
                int i11 = 0;
                while (true) {
                    if (i11 < size) {
                        childViewHolderInt = (s2) this.f14982b.get(i11);
                        if (!childViewHolderInt.wasReturnedFromScrap() && childViewHolderInt.getLayoutPosition() == i5) {
                            childViewHolderInt.addFlags(32);
                            break;
                        }
                        i11++;
                    } else if (recyclerView.mAdapter.hasStableIds() && (iF = recyclerView.mAdapterHelper.f(i5, 0)) > 0 && iF < recyclerView.mAdapter.getItemCount()) {
                        long itemId = recyclerView.mAdapter.getItemId(iF);
                        for (int i12 = 0; i12 < size; i12++) {
                            s2 s2Var3 = (s2) this.f14982b.get(i12);
                            if (!s2Var3.wasReturnedFromScrap() && s2Var3.getItemId() == itemId) {
                                s2Var3.addFlags(32);
                                childViewHolderInt = s2Var3;
                                break;
                            }
                        }
                    }
                }
                childViewHolderInt = null;
                if (childViewHolderInt == null) {
                }
            }
            ArrayList arrayList2 = this.f14981a;
            ArrayList arrayList3 = this.f14983c;
            if (childViewHolderInt == null) {
                int size2 = arrayList2.size();
                for (int i13 = 0; i13 < size2; i13++) {
                    s2Var2 = (s2) arrayList2.get(i13);
                    if (!s2Var2.wasReturnedFromScrap() && s2Var2.getLayoutPosition() == i5 && !s2Var2.isInvalid() && (recyclerView.mState.f15075g || !s2Var2.isRemoved())) {
                        s2Var2.addFlags(32);
                        break;
                    }
                }
                ArrayList arrayList4 = recyclerView.mChildHelper.f14995c;
                int size3 = arrayList4.size();
                int i14 = 0;
                while (true) {
                    if (i14 >= size3) {
                        view = null;
                        break;
                    }
                    view = (View) arrayList4.get(i14);
                    s2 childViewHolderInt2 = RecyclerView.getChildViewHolderInt(view);
                    if (childViewHolderInt2.getLayoutPosition() == i5 && !childViewHolderInt2.isInvalid() && !childViewHolderInt2.isRemoved()) {
                        break;
                    }
                    i14++;
                }
                if (view != null) {
                    childViewHolderInt = RecyclerView.getChildViewHolderInt(view);
                    i iVar = recyclerView.mChildHelper;
                    h hVar = iVar.f14994b;
                    int iIndexOfChild = iVar.f14993a.f15030a.indexOfChild(view);
                    if (iIndexOfChild < 0) {
                        throw new IllegalArgumentException("view is not a child, cannot hide " + view);
                    }
                    if (!hVar.d(iIndexOfChild)) {
                        throw new RuntimeException("trying to unhide a view that was not hidden" + view);
                    }
                    hVar.a(iIndexOfChild);
                    iVar.l(view);
                    int iJ = recyclerView.mChildHelper.j(view);
                    if (iJ == -1) {
                        StringBuilder sb2 = new StringBuilder("layout index should not be -1 after unhiding a view:");
                        sb2.append(childViewHolderInt);
                        throw new IllegalStateException(a2.c.j(recyclerView, sb2));
                    }
                    recyclerView.mChildHelper.c(iJ);
                    k(view);
                    childViewHolderInt.addFlags(8224);
                } else {
                    int size4 = arrayList3.size();
                    for (int i15 = 0; i15 < size4; i15++) {
                        s2Var2 = (s2) arrayList3.get(i15);
                        if (!s2Var2.isInvalid() && s2Var2.getLayoutPosition() == i5 && !s2Var2.isAttachedToTransitionOverlay()) {
                            arrayList3.remove(i15);
                            if (RecyclerView.sVerboseLoggingEnabled) {
                                s2Var2.toString();
                            }
                            childViewHolderInt = s2Var2;
                        }
                    }
                    childViewHolderInt = null;
                }
                if (childViewHolderInt != null) {
                    if (!childViewHolderInt.isRemoved()) {
                        int i16 = childViewHolderInt.mPosition;
                        if (i16 < 0 || i16 >= recyclerView.mAdapter.getItemCount()) {
                            StringBuilder sb3 = new StringBuilder("Inconsistency detected. Invalid view holder adapter position");
                            sb3.append(childViewHolderInt);
                            throw new IndexOutOfBoundsException(a2.c.j(recyclerView, sb3));
                        }
                        z15 = (recyclerView.mState.f15075g || recyclerView.mAdapter.getItemViewType(childViewHolderInt.mPosition) == childViewHolderInt.getItemViewType()) && (!recyclerView.mAdapter.hasStableIds() || childViewHolderInt.getItemId() == recyclerView.mAdapter.getItemId(childViewHolderInt.mPosition));
                    } else {
                        if (RecyclerView.sDebugAssertionsEnabled && !recyclerView.mState.f15075g) {
                            throw new IllegalStateException(a2.c.j(recyclerView, new StringBuilder("should not receive a removed view unless it is pre layout")));
                        }
                        z15 = recyclerView.mState.f15075g;
                    }
                    if (z15) {
                        z11 = true;
                    } else {
                        childViewHolderInt.addFlags(4);
                        if (childViewHolderInt.isScrap()) {
                            recyclerView.removeDetachedView(childViewHolderInt.itemView, false);
                            childViewHolderInt.unScrap();
                        } else if (childViewHolderInt.wasReturnedFromScrap()) {
                            childViewHolderInt.clearReturnedFromScrapFlag();
                        }
                        j(childViewHolderInt);
                        childViewHolderInt = null;
                    }
                }
            }
            if (childViewHolderInt != null) {
                j12 = 3;
                int iF2 = recyclerView.mAdapterHelper.f(i5, 0);
                if (iF2 < 0 || iF2 >= recyclerView.mAdapter.getItemCount()) {
                    StringBuilder sbT2 = b.c0.t(i5, "Inconsistency detected. Invalid item position ", "(offset:", iF2, ").state:");
                    sbT2.append(recyclerView.mState.b());
                    sbT2.append(recyclerView.exceptionLabel());
                    throw new IndexOutOfBoundsException(sbT2.toString());
                }
                int itemViewType = recyclerView.mAdapter.getItemViewType(iF2);
                j13 = 4;
                if (recyclerView.mAdapter.hasStableIds()) {
                    long itemId2 = recyclerView.mAdapter.getItemId(iF2);
                    int size5 = arrayList2.size() - 1;
                    while (true) {
                        if (size5 >= 0) {
                            j14 = 0;
                            s2 s2Var4 = (s2) arrayList2.get(size5);
                            if (s2Var4.getItemId() != itemId2 || s2Var4.wasReturnedFromScrap()) {
                                z12 = z16;
                            } else {
                                z12 = z16;
                                if (itemViewType == s2Var4.getItemViewType()) {
                                    s2Var4.addFlags(32);
                                    if (s2Var4.isRemoved() && !recyclerView.mState.f15075g) {
                                        s2Var4.setFlags(2, 14);
                                    }
                                    childViewHolderInt = s2Var4;
                                } else {
                                    arrayList2.remove(size5);
                                    recyclerView.removeDetachedView(s2Var4.itemView, false);
                                    s2 childViewHolderInt3 = RecyclerView.getChildViewHolderInt(s2Var4.itemView);
                                    childViewHolderInt3.mScrapContainer = null;
                                    childViewHolderInt3.mInChangeScrap = false;
                                    childViewHolderInt3.clearReturnedFromScrapFlag();
                                    j(childViewHolderInt3);
                                }
                            }
                            size5--;
                            z16 = z12;
                        } else {
                            z12 = z16;
                            j14 = 0;
                            int size6 = arrayList3.size() - 1;
                            while (true) {
                                if (size6 < 0) {
                                    break;
                                }
                                s2 s2Var5 = (s2) arrayList3.get(size6);
                                if (s2Var5.getItemId() != itemId2 || s2Var5.isAttachedToTransitionOverlay()) {
                                    size6--;
                                } else if (itemViewType == s2Var5.getItemViewType()) {
                                    arrayList3.remove(size6);
                                    childViewHolderInt = s2Var5;
                                } else {
                                    h(size6);
                                }
                            }
                            childViewHolderInt = null;
                        }
                    }
                    if (childViewHolderInt != null) {
                        childViewHolderInt.mPosition = iF2;
                        z11 = z12;
                    }
                } else {
                    z12 = true;
                    j14 = 0;
                }
                if (childViewHolderInt == null) {
                    int i17 = RecyclerView.HORIZONTAL;
                    f2 f2Var = (f2) c().f14970a.get(itemViewType);
                    if (f2Var != null) {
                        ArrayList arrayList5 = f2Var.f14959a;
                        if (arrayList5.isEmpty()) {
                            s2Var = null;
                            if (s2Var != null) {
                            }
                            childViewHolderInt = s2Var;
                        } else {
                            for (int size7 = arrayList5.size() - 1; size7 >= 0; size7--) {
                                if (!((s2) arrayList5.get(size7)).isAttachedToTransitionOverlay()) {
                                    s2Var = (s2) arrayList5.remove(size7);
                                    break;
                                }
                            }
                            s2Var = null;
                            if (s2Var != null) {
                                s2Var.resetInternal();
                                if (RecyclerView.FORCE_INVALIDATE_DISPLAY_LIST) {
                                    View view2 = s2Var.itemView;
                                    if (view2 instanceof ViewGroup) {
                                        d((ViewGroup) view2, false);
                                    }
                                }
                            }
                            childViewHolderInt = s2Var;
                        }
                    }
                }
                if (childViewHolderInt == null) {
                    long nanoTime = recyclerView.getNanoTime();
                    if (j11 != Long.MAX_VALUE) {
                        long j16 = this.f14987g.b(itemViewType).f14961c;
                        if (!((j16 == j14 || j16 + nanoTime < j11) ? z12 : false)) {
                            return null;
                        }
                    }
                    s2 s2VarCreateViewHolder = recyclerView.mAdapter.createViewHolder(recyclerView, itemViewType);
                    if (RecyclerView.ALLOW_THREAD_GAP_WORK && (recyclerViewFindNestedRecyclerView = RecyclerView.findNestedRecyclerView(s2VarCreateViewHolder.itemView)) != null) {
                        s2VarCreateViewHolder.mNestedRecyclerView = new WeakReference<>(recyclerViewFindNestedRecyclerView);
                    }
                    long nanoTime2 = recyclerView.getNanoTime() - nanoTime;
                    f2 f2VarB = this.f14987g.b(itemViewType);
                    long j17 = f2VarB.f14961c;
                    if (j17 != j14) {
                        nanoTime2 = (nanoTime2 / 4) + ((j17 / 4) * 3);
                    }
                    f2VarB.f14961c = nanoTime2;
                    childViewHolderInt = s2VarCreateViewHolder;
                }
            } else {
                z12 = true;
                j12 = 3;
                j13 = 4;
                j14 = 0;
            }
            if (z11 && !recyclerView.mState.f15075g && childViewHolderInt.hasAnyOfTheFlags(UserMetadata.MAX_INTERNAL_KEY_SIZE)) {
                childViewHolderInt.setFlags(0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
                if (recyclerView.mState.f15078j) {
                    recyclerView.recordAnimationInfoIfBouncedHiddenView(childViewHolderInt, recyclerView.mItemAnimator.recordPreLayoutInformation(recyclerView.mState, childViewHolderInt, u1.buildAdapterChangeFlagsForAnimations(childViewHolderInt) | u1.FLAG_APPEARED_IN_PRE_LAYOUT, childViewHolderInt.getUnmodifiedPayloads()));
                }
            }
            if (recyclerView.mState.f15075g || !childViewHolderInt.isBound()) {
                if (childViewHolderInt.isBound() || childViewHolderInt.needsUpdate() || childViewHolderInt.isInvalid()) {
                    if (!RecyclerView.sDebugAssertionsEnabled && childViewHolderInt.isRemoved()) {
                        StringBuilder sb4 = new StringBuilder("Removed holder should be bound and it should come here only in pre-layout. Holder: ");
                        sb4.append(childViewHolderInt);
                        throw new IllegalStateException(a2.c.j(recyclerView, sb4));
                    }
                    int iF3 = recyclerView.mAdapterHelper.f(i5, 0);
                    childViewHolderInt.mBindingAdapter = null;
                    childViewHolderInt.mOwnerRecyclerView = recyclerView;
                    int itemViewType2 = childViewHolderInt.getItemViewType();
                    long nanoTime3 = recyclerView.getNanoTime();
                    if (j11 != Long.MAX_VALUE) {
                        long j18 = this.f14987g.b(itemViewType2).f14962d;
                        if (j18 == j14 || j18 + nanoTime3 < j11) {
                        }
                    }
                    if (childViewHolderInt.isTmpDetached()) {
                        z13 = false;
                    } else {
                        recyclerView.attachViewToParent(childViewHolderInt.itemView, recyclerView.getChildCount(), childViewHolderInt.itemView.getLayoutParams());
                        z13 = z12;
                    }
                    recyclerView.mAdapter.bindViewHolder(childViewHolderInt, iF3);
                    if (z13) {
                        recyclerView.detachViewFromParent(childViewHolderInt.itemView);
                    }
                    long nanoTime4 = recyclerView.getNanoTime() - nanoTime3;
                    f2 f2VarB2 = this.f14987g.b(childViewHolderInt.getItemViewType());
                    j15 = f2VarB2.f14962d;
                    if (j15 != j14) {
                        nanoTime4 = (nanoTime4 / j13) + ((j15 / j13) * j12);
                    }
                    f2VarB2.f14962d = nanoTime4;
                    if (recyclerView.isAccessibilityEnabled()) {
                        z14 = z12;
                    } else {
                        View view3 = childViewHolderInt.itemView;
                        WeakHashMap weakHashMap = a5.a1.f250a;
                        if (view3.getImportantForAccessibility() == 0) {
                            z14 = z12;
                            view3.setImportantForAccessibility(z14 ? 1 : 0);
                        } else {
                            z14 = z12;
                        }
                        u2 u2Var = recyclerView.mAccessibilityDelegate;
                        if (u2Var != null) {
                            a5.b bVarJ = u2Var.j();
                            if (bVarJ instanceof t2) {
                                t2 t2Var = (t2) bVarJ;
                                View.AccessibilityDelegate accessibilityDelegateB = a5.a1.b(view3);
                                a5.b bVar = accessibilityDelegateB != null ? accessibilityDelegateB instanceof a5.a ? ((a5.a) accessibilityDelegateB).f249a : new a5.b(accessibilityDelegateB) : null;
                                if (bVar != null && bVar != t2Var) {
                                    t2Var.f15128e.put(view3, bVar);
                                }
                            }
                            a5.a1.k(view3, bVarJ);
                        }
                    }
                    if (recyclerView.mState.f15075g) {
                        childViewHolderInt.mPreLayoutPosition = i5;
                    }
                    objArr = z14 ? 1 : 0;
                }
                layoutParams = childViewHolderInt.itemView.getLayoutParams();
                if (layoutParams == null) {
                    a2Var = (a2) recyclerView.generateDefaultLayoutParams();
                    childViewHolderInt.itemView.setLayoutParams(a2Var);
                } else if (recyclerView.checkLayoutParams(layoutParams)) {
                    a2Var = (a2) layoutParams;
                } else {
                    a2Var = (a2) recyclerView.generateLayoutParams(layoutParams);
                    childViewHolderInt.itemView.setLayoutParams(a2Var);
                }
                a2Var.f14880a = childViewHolderInt;
                if (!z11 || objArr == false) {
                    z14 = false;
                }
                a2Var.f14883d = z14;
                return childViewHolderInt;
            }
            childViewHolderInt.mPreLayoutPosition = i5;
            objArr = false;
            z14 = z12;
            layoutParams = childViewHolderInt.itemView.getLayoutParams();
            if (layoutParams == null) {
            }
            a2Var.f14880a = childViewHolderInt;
            if (!z11) {
                z14 = false;
            }
            a2Var.f14883d = z14;
            return childViewHolderInt;
        }
        childViewHolderInt = null;
        ArrayList arrayList22 = this.f14981a;
        ArrayList arrayList32 = this.f14983c;
        if (childViewHolderInt == null) {
        }
        if (childViewHolderInt != null) {
        }
        if (z11) {
            childViewHolderInt.setFlags(0, UserMetadata.MAX_INTERNAL_KEY_SIZE);
            if (recyclerView.mState.f15078j) {
            }
        }
        if (recyclerView.mState.f15075g) {
            if (childViewHolderInt.isBound()) {
                if (!RecyclerView.sDebugAssertionsEnabled) {
                }
                int iF32 = recyclerView.mAdapterHelper.f(i5, 0);
                childViewHolderInt.mBindingAdapter = null;
                childViewHolderInt.mOwnerRecyclerView = recyclerView;
                int itemViewType22 = childViewHolderInt.getItemViewType();
                long nanoTime32 = recyclerView.getNanoTime();
                if (j11 != Long.MAX_VALUE) {
                }
                if (childViewHolderInt.isTmpDetached()) {
                }
                recyclerView.mAdapter.bindViewHolder(childViewHolderInt, iF32);
                if (z13) {
                }
                long nanoTime42 = recyclerView.getNanoTime() - nanoTime32;
                f2 f2VarB22 = this.f14987g.b(childViewHolderInt.getItemViewType());
                j15 = f2VarB22.f14962d;
                if (j15 != j14) {
                }
                f2VarB22.f14962d = nanoTime42;
                if (recyclerView.isAccessibilityEnabled()) {
                }
                if (recyclerView.mState.f15075g) {
                }
                objArr = z14 ? 1 : 0;
            }
        }
        layoutParams = childViewHolderInt.itemView.getLayoutParams();
        if (layoutParams == null) {
        }
        a2Var.f14880a = childViewHolderInt;
        if (!z11) {
        }
        a2Var.f14883d = z14;
        return childViewHolderInt;
    }

    public final void m(s2 s2Var) {
        if (s2Var.mInChangeScrap) {
            this.f14982b.remove(s2Var);
        } else {
            this.f14981a.remove(s2Var);
        }
        s2Var.mScrapContainer = null;
        s2Var.mInChangeScrap = false;
        s2Var.clearReturnedFromScrapFlag();
    }

    public final void n() {
        z1 z1Var = this.f14988h.mLayout;
        this.f14986f = this.f14985e + (z1Var != null ? z1Var.mPrefetchMaxCountObserved : 0);
        ArrayList arrayList = this.f14983c;
        for (int size = arrayList.size() - 1; size >= 0 && arrayList.size() > this.f14986f; size--) {
            h(size);
        }
    }
}
