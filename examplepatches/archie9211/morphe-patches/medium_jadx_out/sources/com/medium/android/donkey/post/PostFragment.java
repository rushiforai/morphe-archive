package com.medium.android.donkey.post;

import android.animation.ValueAnimator;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.medium.android.common.ui.ReadPostAppBarBehavior;
import com.medium.android.common.ui.ReadPostBottomAppBarBehavior;
import com.medium.android.common.ui.ReadPostLayoutManager;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.models.ReadingContext;
import com.medium.android.data.post.TargetPost;
import com.medium.android.donkey.main.MainActivity;
import com.medium.reader.R;
import defpackage.a3;
import defpackage.b15;
import defpackage.bd9;
import defpackage.bhc;
import defpackage.c1e;
import defpackage.ch9;
import defpackage.cn;
import defpackage.cn5;
import defpackage.da2;
import defpackage.dh9;
import defpackage.en8;
import defpackage.eo6;
import defpackage.eya;
import defpackage.g49;
import defpackage.g7;
import defpackage.g76;
import defpackage.ga2;
import defpackage.gy6;
import defpackage.i03;
import defpackage.ig9;
import defpackage.ih9;
import defpackage.iq1;
import defpackage.iq7;
import defpackage.jg9;
import defpackage.jz1;
import defpackage.k49;
import defpackage.ka1;
import defpackage.kg9;
import defpackage.kxa;
import defpackage.m40;
import defpackage.my6;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.n92;
import defpackage.nhc;
import defpackage.o7f;
import defpackage.pj3;
import defpackage.pwd;
import defpackage.py2;
import defpackage.qo7;
import defpackage.qu9;
import defpackage.rg9;
import defpackage.ru9;
import defpackage.su9;
import defpackage.sw9;
import defpackage.sxa;
import defpackage.tb2;
import defpackage.tu9;
import defpackage.ug9;
import defpackage.vn7;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.w94;
import defpackage.wg9;
import defpackage.wsb;
import defpackage.wxa;
import defpackage.xxa;
import defpackage.yg9;
import defpackage.ygf;
import defpackage.yo7;
import defpackage.yw6;
import defpackage.yxc;
import defpackage.z72;
import defpackage.zg9;
import defpackage.zi5;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0005B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\b²\u0006\u000e\u0010\u0007\u001a\u0004\u0018\u00010\u00068\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/donkey/post/PostFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "Lwsb;", "<init>", "()V", "BundleInfo", "Lrr9;", "bottomSheetState", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostFragment extends cn5 implements wsb {
    public final en8 A0;
    public eo6 B0;
    public final iq1 C0;
    public final vq6 D0;
    public jz1 E0;
    public gy6 F0;
    public boolean G0;
    public final g49 H0;
    public ValueAnimator I0;
    public final b15 J0;
    public final ih9 K0;
    public final yg9 L0;
    public Integer M0;
    public my6 u0;
    public py2 v0;
    public i03 w0;
    public final k49 x0;
    public boolean y0;
    public final ug9 z0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0081\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u001a\u0010\u0007\u001a\u00020\u00068\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0007\u0010 \u001a\u0004\b!\u0010\u0012¨\u0006\""}, d2 = {"Lcom/medium/android/donkey/post/PostFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/data/post/TargetPost;", "post", "Lcom/medium/android/core/models/ReadingContext;", "readingContext", "", "referrerSource", "<init>", "(Lcom/medium/android/data/post/TargetPost;Lcom/medium/android/core/models/ReadingContext;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/data/post/TargetPost;", "getPost", "()Lcom/medium/android/data/post/TargetPost;", "Lcom/medium/android/core/models/ReadingContext;", "getReadingContext", "()Lcom/medium/android/core/models/ReadingContext;", "Ljava/lang/String;", "getReferrerSource", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final TargetPost post;
        private final ReadingContext readingContext;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((TargetPost) parcel.readParcelable(BundleInfo.class.getClassLoader()), (ReadingContext) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(TargetPost targetPost, ReadingContext readingContext, String str) {
            super(str);
            targetPost.getClass();
            readingContext.getClass();
            str.getClass();
            this.post = targetPost;
            this.readingContext = readingContext;
            this.referrerSource = str;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.post, bundleInfo.post) && g76.L(this.readingContext, bundleInfo.readingContext) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final TargetPost getPost() {
            return this.post;
        }

        public final ReadingContext getReadingContext() {
            return this.readingContext;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + ((this.readingContext.hashCode() + (this.post.hashCode() * 31)) * 31);
        }

        public String toString() {
            TargetPost targetPost = this.post;
            ReadingContext readingContext = this.readingContext;
            String str = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(post=");
            sb.append(targetPost);
            sb.append(", readingContext=");
            sb.append(readingContext);
            sb.append(", referrerSource=");
            return ka1.v(sb, str, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.post, flags);
            dest.writeParcelable(this.readingContext, flags);
            dest.writeString(this.referrerSource);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostFragment() {
        super(2);
        int i = 2;
        this.x0 = qo7.u(Boolean.FALSE);
        this.z0 = new ug9(this);
        this.A0 = new en8();
        a3 a3Var = new a3(this, new kg9(this, i), false, 22);
        bd9 bd9Var = new bd9(1, this);
        yw6 yw6Var = yw6.NONE;
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(i, bd9Var));
        int i2 = 3;
        this.C0 = m40.I(this, n1b.a.b(sw9.class), new pj3(vq6VarD0, 5), new bd9(a3Var, vq6VarD0, i2), new cn(this, 17, vq6VarD0));
        this.D0 = vx0.d0(yw6Var, new rg9(this, i2));
        this.H0 = new g49(0.0f);
        this.J0 = (b15) P(new g7(i2), new wg9(this));
        this.K0 = new ih9(this);
        this.L0 = new yg9(this);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void A(Bundle bundle) {
        super.A(bundle);
        yo7.n(Q().getOnBackPressedDispatcher(), this, new kg9(this, 3));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        View viewInflate = layoutInflater.inflate(R.layout.fragment_post, viewGroup, false);
        int i = R.id.bottom_action_bar;
        ComposeView composeView = (ComposeView) vn7.x(viewInflate, R.id.bottom_action_bar);
        if (composeView != null) {
            i = R.id.compose_limited_dialog;
            ComposeView composeView2 = (ComposeView) vn7.x(viewInflate, R.id.compose_limited_dialog);
            if (composeView2 != null) {
                i = R.id.compose_view_loader;
                ComposeView composeView3 = (ComposeView) vn7.x(viewInflate, R.id.compose_view_loader);
                if (composeView3 != null) {
                    i = R.id.recycler_view;
                    RecyclerView recyclerView = (RecyclerView) vn7.x(viewInflate, R.id.recycler_view);
                    if (recyclerView != null) {
                        i = R.id.snackbar_wrapper;
                        ComposeView composeView4 = (ComposeView) vn7.x(viewInflate, R.id.snackbar_wrapper);
                        if (composeView4 != null) {
                            i = R.id.toolbar;
                            ComposeView composeView5 = (ComposeView) vn7.x(viewInflate, R.id.toolbar);
                            if (composeView5 != null) {
                                CoordinatorLayout coordinatorLayout = (CoordinatorLayout) viewInflate;
                                this.E0 = new jz1(coordinatorLayout, composeView, composeView2, composeView3, recyclerView, composeView4, composeView5, 3);
                                return coordinatorLayout;
                            }
                        }
                    }
                }
            }
        }
        z72.c("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i)));
        return null;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void D() {
        ValueAnimator valueAnimator = this.I0;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        this.I0 = null;
        jz1 jz1Var = this.E0;
        if (jz1Var != null) {
            ((RecyclerView) jz1Var.f).setAdapter(null);
        }
        this.E0 = null;
        this.F0 = null;
        super.D();
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void H() {
        eo6 eo6Var = this.B0;
        if (eo6Var == null) {
            g76.g0("observeScrollDisposable");
            throw null;
        }
        yxc.cancel(eo6Var);
        ((MainActivity) Q()).x(true);
        super.H();
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00d0  */
    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void I() {
        /*
            Method dump skipped, instruction units count: 214
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.post.PostFragment.I():void");
    }

    @Override // defpackage.j15
    public final void M(View view) {
        zi5 zi5Var = zi5.h;
        view.getClass();
        final jz1 jz1Var = this.E0;
        if (jz1Var == null) {
            return;
        }
        RecyclerView recyclerView = (RecyclerView) jz1Var.f;
        ComposeView composeView = (ComposeView) jz1Var.h;
        ViewGroup.LayoutParams layoutParams = composeView.getLayoutParams();
        layoutParams.getClass();
        da2 da2Var = ((ga2) layoutParams).a;
        da2Var.getClass();
        ((ReadPostAppBarBehavior) da2Var).a = this;
        int i = 0;
        composeView.addOnLayoutChangeListener(new jg9(i, this));
        composeView.setViewCompositionStrategy(zi5Var);
        jz1 jz1Var2 = this.E0;
        int i2 = 1;
        if (jz1Var2 != null) {
            ComposeView composeView2 = (ComposeView) jz1Var2.c;
            ViewGroup.LayoutParams layoutParams2 = composeView2.getLayoutParams();
            layoutParams2.getClass();
            da2 da2Var2 = ((ga2) layoutParams2).a;
            da2Var2.getClass();
            ReadPostBottomAppBarBehavior readPostBottomAppBarBehavior = (ReadPostBottomAppBarBehavior) da2Var2;
            readPostBottomAppBarBehavior.a = this;
            readPostBottomAppBarBehavior.c = new kg9(this, i);
            composeView2.addOnLayoutChangeListener(new jg9(i2, this));
            composeView2.setViewCompositionStrategy(zi5Var);
        }
        final gy6 gy6Var = new gy6(q());
        this.F0 = gy6Var;
        S();
        recyclerView.setLayoutManager(new ReadPostLayoutManager() { // from class: com.medium.android.donkey.post.PostFragment$onViewCreated$1
            {
                this.w = false;
            }

            @Override // androidx.recyclerview.widget.LinearLayoutManager, defpackage.sxa
            public final void f0(eya eyaVar) {
                super.f0(eyaVar);
                gy6Var.i.b((RecyclerView) jz1Var.f);
            }
        });
        xxa xxaVar = new xxa();
        wxa wxaVarA = xxaVar.a(R.layout.view_post_paragraph_pre);
        wxaVarA.b = 30;
        ArrayList arrayList = wxaVarA.a;
        while (arrayList.size() > 30) {
            arrayList.remove(arrayList.size() - 1);
        }
        recyclerView.setRecycledViewPool(xxaVar);
        recyclerView.h(this.A0);
        recyclerView.setAdapter(gy6Var);
        recyclerView.h(new dh9(this));
        recyclerView.h(new w94(i2, this));
        ComposeView composeView3 = (ComposeView) jz1Var.e;
        composeView3.setViewCompositionStrategy(zi5Var);
        composeView3.setContent(pwd.c);
        ComposeView composeView4 = (ComposeView) jz1Var.g;
        composeView4.setViewCompositionStrategy(zi5Var);
        composeView4.setContent(new mz1(new ig9(this, i), true, -922004359));
        n92 n92Var = null;
        vx0.c0(o7f.x(q()), null, null, new ch9(this, n92Var, 3), 3);
        vx0.c0(o7f.x(q()), null, null, new ch9(this, n92Var, 5), 3);
        vx0.c0(o7f.x(q()), null, null, new ch9(this, n92Var, 7), 3);
        vx0.c0(o7f.x(q()), null, null, new ch9(this, n92Var, i2), 3);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment
    public final AbstractMediumFragment.BundleInfo Y() {
        return j1();
    }

    public final float i1(int i) {
        boolean z;
        tu9 tu9Var = (tu9) k1().M0.a.getValue();
        if (tu9Var instanceof qu9) {
            z = ((qu9) tu9Var).b.g;
        } else if (tu9Var instanceof ru9) {
            z = ((ru9) tu9Var).a.g;
        } else {
            if (!(tu9Var instanceof su9)) {
                ygf.a();
                return 0.0f;
            }
            z = ((su9) tu9Var).g.g;
        }
        return z ? n().getDimensionPixelSize(R.dimen.post_page_bottom_action_bar_height) : i;
    }

    public final BundleInfo j1() {
        return (BundleInfo) this.D0.getValue();
    }

    public final sw9 k1() {
        return (sw9) this.C0.getValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x009c, code lost:
    
        if (r12 == r0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x00d9, code lost:
    
        if (r12 == r0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0125, code lost:
    
        if (r12 == r0) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x015b, code lost:
    
        if (r12 == r0) goto L148;
     */
    /* JADX WARN: Removed duplicated region for block: B:149:0x0343 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object l1(defpackage.m40 r10, defpackage.nhc r11, defpackage.p92 r12) throws android.app.PendingIntent.CanceledException {
        /*
            Method dump skipped, instruction units count: 878
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.post.PostFragment.l1(m40, nhc, p92):java.lang.Object");
    }

    public final boolean n1() {
        Integer num;
        jz1 jz1Var = this.E0;
        sxa layoutManager = jz1Var != null ? ((RecyclerView) jz1Var.f).getLayoutManager() : null;
        LinearLayoutManager linearLayoutManager = layoutManager instanceof LinearLayoutManager ? (LinearLayoutManager) layoutManager : null;
        if (linearLayoutManager == null || (num = this.M0) == null) {
            return false;
        }
        return linearLayoutManager.N0() >= num.intValue();
    }

    public final Object o1(nhc nhcVar, zg9 zg9Var) {
        String strO = o(R.string.action_unavailable_list_while_offline_reading);
        strO.getClass();
        Object objC = nhc.c(nhcVar, strO, null, bhc.Long, zg9Var, 6);
        return objC == tb2.COROUTINE_SUSPENDED ? objC : c1e.a;
    }

    public final void p1() {
        jz1 jz1Var = this.E0;
        if (jz1Var != null) {
            RecyclerView recyclerView = (RecyclerView) jz1Var.f;
            kxa adapter = recyclerView.getAdapter();
            int I = iq7.I(recyclerView);
            recyclerView.setAdapter(null);
            recyclerView.setAdapter(adapter);
            recyclerView.e0(I);
        }
    }

    public final void q1() {
        jz1 jz1Var = this.E0;
        if (jz1Var == null) {
            return;
        }
        RecyclerView recyclerView = (RecyclerView) jz1Var.f;
        ComposeView composeView = (ComposeView) jz1Var.c;
        if (composeView.getHeight() <= 0) {
            ViewGroup.LayoutParams layoutParams = composeView.getLayoutParams();
            layoutParams.getClass();
            int i = ((ViewGroup.MarginLayoutParams) ((ga2) layoutParams)).bottomMargin;
            if (i > 0) {
                recyclerView.setPadding(recyclerView.getPaddingLeft(), recyclerView.getPaddingTop(), recyclerView.getPaddingRight(), i);
                return;
            }
            return;
        }
        ViewGroup.LayoutParams layoutParams2 = composeView.getLayoutParams();
        layoutParams2.getClass();
        da2 da2Var = ((ga2) layoutParams2).a;
        da2Var.getClass();
        int height = (int) ((composeView.getHeight() - ((ReadPostBottomAppBarBehavior) da2Var).b) + ((ViewGroup.MarginLayoutParams) r1).bottomMargin);
        if (height < 0) {
            height = 0;
        }
        recyclerView.setPadding(recyclerView.getPaddingLeft(), recyclerView.getPaddingTop(), recyclerView.getPaddingRight(), height);
    }

    public final void r1() {
        int height;
        jz1 jz1Var = this.E0;
        if (jz1Var != null && (height = ((ComposeView) jz1Var.h).getHeight()) > 0) {
            RecyclerView recyclerView = (RecyclerView) jz1Var.f;
            recyclerView.setPadding(recyclerView.getPaddingLeft(), height, recyclerView.getPaddingRight(), recyclerView.getPaddingBottom());
            ViewGroup.LayoutParams layoutParams = ((ComposeView) jz1Var.e).getLayoutParams();
            layoutParams.getClass();
            ((ViewGroup.MarginLayoutParams) ((ga2) layoutParams)).topMargin = height;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:254:0x0530, code lost:
    
        if (r2 == r8) goto L472;
     */
    /* JADX WARN: Code restructure failed: missing block: B:272:0x05a6, code lost:
    
        if (r2 == r8) goto L472;
     */
    /* JADX WARN: Code restructure failed: missing block: B:290:0x0624, code lost:
    
        if (r2 == r8) goto L472;
     */
    /* JADX WARN: Code restructure failed: missing block: B:308:0x0693, code lost:
    
        if (r2 == r8) goto L472;
     */
    /* JADX WARN: Code restructure failed: missing block: B:333:0x073d, code lost:
    
        if (r2 == r8) goto L472;
     */
    /* JADX WARN: Removed duplicated region for block: B:328:0x0713  */
    /* JADX WARN: Removed duplicated region for block: B:472:0x0a5f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object m1(defpackage.ou9 r21, defpackage.nhc r22, defpackage.p92 r23) throws android.app.PendingIntent.CanceledException {
        /*
            Method dump skipped, instruction units count: 2808
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.donkey.post.PostFragment.m1(ou9, nhc, p92):java.lang.Object");
    }
}
